#!/bin/sh

NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
case "$NODE" in *casper*) ;; *) echo "Script ini hanya untuk Magi-Casper (atau NODE=casper)."; exit 1;; esac
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables belum terpasang (jalankan casper-pkg.sh)"; exit 1; }

iptables -C INPUT -p icmp --icmp-type echo-request -j DROP 2>/dev/null || \
  iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -S INPUT
echo "Uji: ping ke 10.74.4.58 dari Balthasar/Lilith GAGAL; ping dari Casper ke 10.74.4.59 dan 10.74.4.74 BERHASIL"
echo "     TCP 5000: echo hi | nc -q1 -w3 10.74.4.58 5000"
