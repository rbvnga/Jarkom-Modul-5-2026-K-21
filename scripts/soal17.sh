#!/bin/sh

NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }

listener9000() {
  pkill -f 'nc -l -p 9000( |$)' 2>/dev/null
  nohup sh -c 'while true; do nc -l -p 9000 >> /root/recv-9000.log 2>&1; done' >/dev/null 2>&1 &
  sleep 1; (netstat -tln 2>/dev/null || ss -tln) | grep 9000
  echo "Pesan masuk: cat /root/recv-9000.log"
}

case "$NODE" in
  *fuyutsuki*)
    sysctl -w net.ipv4.ip_forward=1
    iptables -t nat -C PREROUTING -i eth3 -s 10.74.4.58 -d 10.74.4.82 -p tcp -j DNAT --to-destination 10.74.3.194 2>/dev/null || \
      iptables -t nat -A PREROUTING -i eth3 -s 10.74.4.58 -d 10.74.4.82 -p tcp -j DNAT --to-destination 10.74.3.194
    iptables -t nat -S
    echo "Bukti: conntrack -L -p tcp | grep 9000  (atau cat /proc/net/nf_conntrack | grep 9000)"
    echo "       iptables -t nat -L PREROUTING -v -n"
    ;;
  *pen-pen*|*penpen*|*zeruel*) listener9000 ;;
  *casper*)
    # kirim pesan; HOLD=1 menahan koneksi 30 detik supaya entri conntrack terlihat
    if [ "$HOLD" = 1 ]; then (echo "halo zeruel"; sleep 30) | nc -w40 10.74.4.82 9000
    else echo "halo zeruel" | nc -q1 -w3 10.74.4.82 9000; fi
    echo "Cek: cat /root/recv-9000.log di Pen-Pen (ada) dan Zeruel (kosong)"
    ;;
  *) echo "Jalankan di Fuyutsuki, Pen-Pen, Zeruel, atau Casper (atau NODE=...)."; exit 1;;
esac
