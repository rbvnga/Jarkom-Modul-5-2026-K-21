# ISI MAGE-BALTHASAR.SH #
#!/bin/sh

PORTS="5000 5001"

# Soal 13: yang boleh ke TCP 5000 dan 5001 (Casper + semua Pilot)
CASPER=10.74.4.58
PILOTS="10.74.4.66 10.74.4.67 10.74.4.68 10.74.3.130"   # Unit-01, Unit-02, Unit-00, Sachiel
ALLOWED="$CASPER $PILOTS"

# DNS 
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Pasang paket kalau belum ada
if ! command -v iptables >/dev/null 2>&1 || ! dpkg -s netcat-traditional >/dev/null 2>&1; then
  apt-get update && apt-get install -y iptables netcat-traditional
fi
# Pastikan perintah "nc" adalah netcat-traditional
update-alternatives --set nc /bin/nc.traditional >/dev/null 2>&1

# Hentikan listener lama supaya tidak bentrok saat skrip dijalankan ulang
stop_listener() {
  for d in /proc/[0-9]*; do
    pid=${d#/proc/}
    [ "$pid" = "$$" ] && continue
    if tr '\0' ' ' 2>/dev/null < $d/cmdline | grep -q "nc -l -p $1"; then
      kill $pid 2>/dev/null
    fi
  done
}

# Nyalakan listener di latar belakang (loop supaya hidup lagi setelah tiap koneksi)
for p in $PORTS; do
  stop_listener $p
  nohup sh -c "while true; do nc -l -p $p >> /root/nc_$p.log; done" >/dev/null 2>&1 &
done

echo "Listener aktif di port: $PORTS"


# Soal 13: brankas Balthasar
# membuat chain baru bernama BRANKAS
iptables -N BRANKAS 2>/dev/null

# menghapus semua rule lama pada chain tersebut.
iptables -F BRANKAS

# Hanya Casper dan semua Pilot yang boleh menyambung ke TCP 5000 dan 5001.
for s in $ALLOWED; do
  iptables -A BRANKAS -s $s -j ACCEPT
done

#menolak koneksi TCP dengan mengirim RST
iptables -A BRANKAS -p tcp -j REJECT --reject-with tcp-reset

# mengecek rule sudah ada atau belum, jika belum maka menambahkannya
iptables -C INPUT -p tcp -m multiport --dports 5000,5001 -j BRANKAS 2>/dev/null || \
iptables -I INPUT 1 -p tcp -m multiport --dports 5000,5001 -j BRANKAS

echo "Brankas aktif: hanya $ALLOWED boleh ke TCP 5000 dan 5001"


# PENGECEKAN #
# UNIT-01 (succeded), LILITH (ditolak), MELCHIOR (ditolak)
nc -vz 10.74.4.59 5000
nc -vz 10.74.4.59 5001

# BALTHASAR
ping -c 4 8.8.8.8
