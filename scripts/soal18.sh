#!/bin/sh

NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
case "$NODE" in *shigeru*) ;; *) echo "Script ini hanya untuk Shigeru (atau NODE=shigeru)."; exit 1;; esac
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables belum terpasang"; exit 1; }
OUTSIDE=eth0
TERMNET=10.74.4.56/29

iptables -P FORWARD ACCEPT
iptables -F FORWARD
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $OUTSIDE -s $TERMNET -p icmp --icmp-type echo-request -j ACCEPT
iptables -A FORWARD -i $OUTSIDE -j DROP
iptables -S FORWARD
echo "Uji: ping 10.74.4.82 dari Casper BERHASIL, dari Lilith GAGAL"
