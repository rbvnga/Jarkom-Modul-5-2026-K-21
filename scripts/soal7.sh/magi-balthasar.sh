#!/bin/sh
PORTS="5000 5001"

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