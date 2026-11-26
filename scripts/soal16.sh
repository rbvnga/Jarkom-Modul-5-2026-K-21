#!/bin/sh

NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
case "$NODE" in *tokyo3*) ;; *) echo "Script ini hanya untuk Tokyo3-Core (atau NODE=tokyo3core)."; exit 1;; esac
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables belum terpasang"; exit 1; }
DUMMYPLUG=10.74.4.51

iptables -C INPUT -s $DUMMYPLUG -p tcp --syn -m multiport --dports 22,23,3306 -j LOG --log-prefix "SCAN-NERV: " --log-level 4 2>/dev/null || \
  iptables -I INPUT 1 -s $DUMMYPLUG -p tcp --syn -m multiport --dports 22,23,3306 -j LOG --log-prefix "SCAN-NERV: " --log-level 4
iptables -C INPUT -s $DUMMYPLUG -p tcp --syn -m multiport --dports 22,23,3306 -j REJECT --reject-with tcp-reset 2>/dev/null || \
  iptables -I INPUT 2 -s $DUMMYPLUG -p tcp --syn -m multiport --dports 22,23,3306 -j REJECT --reject-with tcp-reset
iptables -L INPUT -v -n --line-numbers
echo "Uji dari Dummy-Plug: nc -w3 -z 10.74.4.106 22/23/3306 (ditolak seketika); port 80/8080 berhasil"
