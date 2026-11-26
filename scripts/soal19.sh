#!/bin/sh
# =============================================================================
# SOAL 19 - Hukuman untuk sang pengkhianat (Armisael 10.74.4.83)
# Isolasi TIDAK dikerjakan di dalam Armisael. Jalankan file yang sama di:
#   Shigeru : blok semua lalu lintas yang MELEWATI router + ke/dari gateway
#   Zeruel  : blok tetangga satu switch (lalu lintasnya tidak lewat Shigeru)
#   Armisael, Zeruel, Lilith : nyalakan listener TCP 9000 untuk uji nc
# Zeruel tidak terhukum: aturannya hanya untuk alamat Armisael.
# Seele = 8.8.8.8 (ping dan TCP 53).
# Urutan: pasang paket (apt) di Armisael SEBELUM isolasi aktif.
# =============================================================================
NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
ARM=10.74.4.83

listener9000() {
  pkill -f 'nc -l -p 9000( |$)' 2>/dev/null
  nohup sh -c 'while true; do nc -l -p 9000 >> /root/recv-9000.log 2>&1; done' >/dev/null 2>&1 &
  sleep 1; (netstat -tln 2>/dev/null || ss -tln) | grep 9000
}
ins() { iptables -C "$@" 2>/dev/null || iptables -I "$@"; }   # sisip di paling atas, idempotent

case "$NODE" in
  *shigeru*)
    ins FORWARD -s $ARM -j DROP      # Armisael -> mana pun (Seele, Lilith, ...)
    ins FORWARD -d $ARM -j DROP      # mana pun -> Armisael
    ins INPUT   -s $ARM -j DROP      # Armisael -> gateway (Shigeru sendiri)
    ins OUTPUT  -d $ARM -j DROP      # gateway -> Armisael
    iptables -S
    ;;
  *zeruel*)
    ins INPUT  -s $ARM -j DROP
    ins OUTPUT -d $ARM -j DROP
    iptables -S
    listener9000
    ;;
  *armisael*|*lilith*)
    listener9000
    echo "(Armisael tidak diisolasi dari dalam; isolasi di Shigeru dan Zeruel)"
    ;;
  *) echo "Jalankan di Shigeru, Zeruel, Armisael, atau Lilith (atau NODE=...)."; exit 1;;
esac
echo "Uji Armisael: ping dan 'nc -w3 -z' ke 8.8.8.8:53, 10.74.4.82:9000, 10.74.4.74:9000 GAGAL"
echo "Uji Zeruel  : ping dan 'nc -w3 -z' ke 8.8.8.8:53 dan 10.74.4.74:9000 BERHASIL"
