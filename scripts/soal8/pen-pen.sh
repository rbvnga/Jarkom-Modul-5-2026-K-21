#!/bin/sh

# DNS 
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Pasang paket kalau belum ada (iptables dipakai di soal 14)
if ! command -v iptables >/dev/null 2>&1 || ! dpkg -s netcat-traditional >/dev/null 2>&1; then
  apt-get update && apt-get install -y iptables netcat-traditional
fi
# Pastikan perintah "nc" adalah netcat-traditional
update-alternatives --set nc /bin/nc.traditional >/dev/null 2>&1

# Hentikan listener lama untuk port tertentu (spasi di akhir pola mencegah
# port 80 ikut mematikan port 8080)
stop_listener() {
  for d in /proc/[0-9]*; do
    pid=${d#/proc/}
    [ "$pid" = "$$" ] && continue
    if tr '\0' ' ' 2>/dev/null < $d/cmdline | grep -q -e "-l -p $1 "; then
      kill $pid 2>/dev/null
    fi
  done
}


# Soal 8: layanan
# Port 80. Pesan dibuat tiap koneksi supaya hostname selalu terbaru.
# -q 1: tutup koneksi 1 detik setelah pesan terkirim.
stop_listener 80
nohup sh -c 'while true; do echo "Welcome to $(hostname)" | nc -q 1 -l -p 80 || sleep 1; done' >/dev/null 2>&1 &

echo "Pen-Pen melayani TCP 80"