#ISI GENDOU.SH#
#!/bin/sh
INTERNAL=10.74.0.0/16
WAN=eth0

# Soal 2: forwarding, DHCP ke NAT1, IP interface
sysctl -w net.ipv4.ip_forward=1

ip link set $WAN up
if ! ip -4 addr show dev $WAN | grep -q 'inet '; then
  if command -v dhclient >/dev/null 2>&1; then dhclient $WAN; else udhcpc -i $WAN; fi
fi

ip addr replace 10.74.4.109/30 dev eth1; ip link set eth1 up
ip addr replace 10.74.4.113/30 dev eth2; ip link set eth2 up
ip addr replace 10.74.4.117/30 dev eth3; ip link set eth3 up
ip addr replace 10.74.4.121/30 dev eth4; ip link set eth4 up
ip addr replace 10.74.4.125/30 dev eth5; ip link set eth5 up
ip addr replace 10.74.4.129/30 dev eth6; ip link set eth6 up
ip addr replace 10.74.4.133/30 dev eth7; ip link set eth7 up
ip addr replace 10.74.4.105/30 dev eth8; ip link set eth8 up

# Soal 3: routing statis (default route ke NAT1 datang dari DHCP, tidak ditulis)
# via Yui
for n in 10.74.0.0/23 10.74.3.0/25 10.74.4.0/27 10.74.4.32/28 10.74.4.136/29 10.74.4.144/30; do
  ip route replace $n via 10.74.4.110
done
# via Hikari
for n in 10.74.2.0/24 10.74.3.224/27 10.74.4.148/30; do
  ip route replace $n via 10.74.4.114
done
# via Asuka
for n in 10.74.3.128/26 10.74.4.48/29 10.74.4.96/30 10.74.4.152/29; do
  ip route replace $n via 10.74.4.118
done
# via Kaji
ip route replace 10.74.4.100/30 via 10.74.4.122
# via Misato
ip route replace 10.74.4.64/29 via 10.74.4.126
# via Shigeru
for n in 10.74.4.80/28 10.74.4.160/30; do
  ip route replace $n via 10.74.4.130
done
# via Fuyutsuki
for n in 10.74.3.192/27 10.74.4.56/29 10.74.4.72/29 10.74.4.164/30 10.74.4.168/30; do
  ip route replace $n via 10.74.4.134
done

# Soal 4: DNS, iptables, NAT (MASQUERADE)
# DNS: 8.8.8.8 (Seele). Tidak memakai IP NAT1 karena bisa berganti.
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Pasang iptables kalau belum ada (Gendou sudah punya internet lewat DHCP)
command -v iptables >/dev/null 2>&1 || { apt-get update && apt-get install -y iptables; }

# Hanya traffic dari prefix internal yang KELUAR lewat NAT1 (-o eth0) yang
# diterjemahkan. MASQUERADE otomatis memakai IP eth0 saat ini, jadi tidak
# perlu diubah kalau IP NAT1 berganti. Traffic antar-LAN tidak keluar lewat
# eth0, jadi alamat aslinya tetap.
iptables -t nat -F POSTROUTING
iptables -t nat -A POSTROUTING -s $INTERNAL -o $WAN -j MASQUERADE


# Soal 5: firewall Gendou (boleh keluar, tidak boleh dimasuki dari NAT1)
# eth0 = sisi NAT1. Interface lain (eth1 sampai eth8) = sisi internal.
# Policy sementara ACCEPT supaya tidak terputus saat rule dibangun ulang
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -F INPUT
iptables -F FORWARD

# --- INPUT (traffic menuju Gendou sendiri) ---
# Loopback tetap jalan
iptables -A INPUT -i lo -j ACCEPT
# (a) balasan koneksi yang sudah ada
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# DHCP dari NAT1 tetap jalan (server port 67 ke client port 68)
iptables -A INPUT -i $WAN -p udp --sport 67 --dport 68 -j ACCEPT
# (d) traffic dari jaringan internal ke Gendou sendiri (bukan dari sisi NAT1)
iptables -A INPUT ! -i $WAN -s $INTERNAL -j ACCEPT

# --- FORWARD (traffic yang lewat Gendou) ---
# (a) balasan koneksi yang sudah ada
iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
# (b) internal ke internet
iptables -A FORWARD ! -i $WAN -o $WAN -s $INTERNAL -j ACCEPT
# (c) antar-LAN
iptables -A FORWARD ! -i $WAN ! -o $WAN -s $INTERNAL -d $INTERNAL -j ACCEPT

# Kunci: koneksi baru dari sisi NAT1 jatuh ke policy DROP
iptables -P INPUT DROP
iptables -P FORWARD DROP

# PEMBUKTIAN #
# Gendou
iptables -S
iptables -t nat -S

# Armisael (harus punya IP sementara dan default route dari soal 3)
ping -c 3 8.8.8.8

# di Armisael dan Lilith
ping -c 3 8.8.8.8
ping -c 3 deb.debian.org
# di Armisael
ping -c 3 10.74.4.78        # ke Lilith (antar-LAN, rule c)
# di Gendou
iptables -t nat -L POSTROUTING -n -v

## Bukti koneksi baru dari NAT1 ditolak (opsional)

## Dari komputer yang menjalankan GNS3, ping IP eth0 Gendou (lihat dengan ip -br a di Gendou). Ping itu harus gagal (timeout). Lalu di Gendou:

## iptables -L INPUT -n -v