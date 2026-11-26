#!/bin/sh

NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
case "$NODE" in *casper*) ;; *) echo "Script ini hanya untuk Magi-Casper (atau NODE=casper)."; exit 1;; esac
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables belum terpasang"; exit 1; }

echo "===== SEBELUM ====="; iptables -S
iptables -F; iptables -X
iptables -P OUTPUT ACCEPT; iptables -P FORWARD ACCEPT
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -p tcp --dport 5000 -j ACCEPT
iptables -P INPUT DROP        # terakhir, setelah semua ACCEPT terpasang
echo "===== SESUDAH ====="; iptables -S
echo "Uji: ping -c2 8.8.8.8 ; apt-get update ; dari Unit-00: echo hi | nc -q1 -w3 10.74.4.58 5000"
