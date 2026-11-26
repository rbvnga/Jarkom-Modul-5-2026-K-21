#!/bin/sh

NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
case "$NODE" in *tokyo3*) ;; *) echo "Script ini hanya untuk Tokyo3-Core (atau NODE=tokyo3core)."; exit 1;; esac
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables belum terpasang"; exit 1; }

iptables -C INPUT -p icmp --icmp-type echo-request -m limit --limit 5/second --limit-burst 5 -j ACCEPT 2>/dev/null || \
  iptables -A INPUT -p icmp --icmp-type echo-request -m limit --limit 5/second --limit-burst 5 -j ACCEPT
iptables -C INPUT -p icmp --icmp-type echo-request -j DROP 2>/dev/null || \
  iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -L INPUT -v -n --line-numbers
echo "Uji dari Lilith: ping -i 0.1 -c50 10.74.4.106 (sebagian hilang); ping biasa jeda 3 detik (semua berhasil)"
