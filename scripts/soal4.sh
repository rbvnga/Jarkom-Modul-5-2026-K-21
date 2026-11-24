# GENDOU
auto eth0
iface eth0 inet dhcp
  up sysctl -w net.ipv4.ip_forward=1
  up iptables -t nat -C POSTROUTING -o eth0 -s 10.74.0.0/16 -j MASQUERADE || iptables -t nat -A POSTROUTING -o eth0 -s 10.74.0.0/16 -j MASQUERADE
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

auto eth1
iface eth1 inet static
  address 10.74.4.109
  netmask 255.255.255.252
  up ip route add 10.74.0.0/23 via 10.74.4.110
  up ip route add 10.74.3.0/25 via 10.74.4.110
  up ip route add 10.74.4.0/27 via 10.74.4.110
  up ip route add 10.74.4.32/28 via 10.74.4.110
  up ip route add 10.74.4.136/29 via 10.74.4.110
  up ip route add 10.74.4.144/30 via 10.74.4.110

auto eth2
iface eth2 inet static
  address 10.74.4.113
  netmask 255.255.255.252
  up ip route add 10.74.2.0/24 via 10.74.4.114
  up ip route add 10.74.3.224/27 via 10.74.4.114
  up ip route add 10.74.4.148/30 via 10.74.4.114

auto eth3
iface eth3 inet static
  address 10.74.4.117
  netmask 255.255.255.252
  up ip route add 10.74.3.128/26 via 10.74.4.118
  up ip route add 10.74.4.48/29 via 10.74.4.118
  up ip route add 10.74.4.96/30 via 10.74.4.118
  up ip route add 10.74.4.152/29 via 10.74.4.118

auto eth4
iface eth4 inet static
  address 10.74.4.121
  netmask 255.255.255.252
  up ip route add 10.74.4.100/30 via 10.74.4.122

auto eth5
iface eth5 inet static
  address 10.74.4.125
  netmask 255.255.255.252
  up ip route add 10.74.4.64/29 via 10.74.4.126

auto eth6
iface eth6 inet static
  address 10.74.4.129
  netmask 255.255.255.252
  up ip route add 10.74.4.80/28 via 10.74.4.130
  up ip route add 10.74.4.160/30 via 10.74.4.130

auto eth7
iface eth7 inet static
  address 10.74.4.133
  netmask 255.255.255.252
  up ip route add 10.74.3.192/27 via 10.74.4.134
  up ip route add 10.74.4.56/29 via 10.74.4.134
  up ip route add 10.74.4.72/29 via 10.74.4.134
  up ip route add 10.74.4.164/30 via 10.74.4.134
  up ip route add 10.74.4.168/30 via 10.74.4.134

auto eth8
iface eth8 inet static
  address 10.74.4.105
  netmask 255.255.255.252

# YUI
auto eth0
iface eth0 inet static
  address 10.74.4.110
  netmask 255.255.255.252
  gateway 10.74.4.109
  post-up sysctl -w net.ipv4.ip_forward=1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

auto eth1
iface eth1 inet static
  address 10.74.4.137
  netmask 255.255.255.252
  up ip route add 10.74.4.0/27 via 10.74.4.138

auto eth2
iface eth2 inet static
  address 10.74.4.141
  netmask 255.255.255.252
  up ip route add 10.74.0.0/23 via 10.74.4.142

auto eth3
iface eth3 inet static
  address 10.74.4.145
  netmask 255.255.255.252
  up ip route add 10.74.4.32/28 via 10.74.4.146

auto eth4
iface eth4 inet static
  address 10.74.3.1
  netmask 255.255.255.128

# HIKARI
auto eth0
iface eth0 inet static
  address 10.74.4.114
  netmask 255.255.255.252
  gateway 10.74.4.113
  post-up sysctl -w net.ipv4.ip_forward=1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

auto eth1
iface eth1 inet static
  address 10.74.4.149
  netmask 255.255.255.252
  up ip route add 10.74.3.224/27 via 10.74.4.150

auto eth2
iface eth2 inet static
  address 10.74.2.1
  netmask 255.255.255.0


# ASUKA
auto eth0
iface eth0 inet static
  address 10.74.4.118
  netmask 255.255.255.252
  gateway 10.74.4.117
  post-up sysctl -w net.ipv4.ip_forward=1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf
auto eth1
iface eth1 inet static
  address 10.74.4.153
  netmask 255.255.255.252
  up ip route add 10.74.3.128/26 via 10.74.4.154

auto eth2
iface eth2 inet static
  address 10.74.4.157
  netmask 255.255.255.252
  up ip route add 10.74.4.48/29 via 10.74.4.158

auto eth3
iface eth3 inet static
  address 10.74.4.97
  netmask 255.255.255.252
# KAJI
auto eth0
iface eth0 inet static
  address 10.74.4.122
  netmask 255.255.255.252
  gateway 10.74.4.121
  post-up sysctl -w net.ipv4.ip_forward=1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

auto eth1
iface eth1 inet static
  address 10.74.4.101
  netmask 255.255.255.252

#MISATO
auto eth0
iface eth0 inet static
  address 10.74.4.126
  netmask 255.255.255.252
  gateway 10.74.4.125
  post-up sysctl -w net.ipv4.ip_forward=1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

auto eth1
iface eth1 inet static
  address 10.74.4.65
  netmask 255.255.255.248
# SHIGERU
auto eth0
iface eth0 inet static
  address 10.74.4.130
  netmask 255.255.255.252
  gateway 10.74.4.129
  post-up sysctl -w net.ipv4.ip_forward=1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

auto eth1
iface eth1 inet static
  address 10.74.4.161
  netmask 255.255.255.252
  up ip route add 10.74.4.88/29 via 10.74.4.162

auto eth2
iface eth2 inet static
  address 10.74.4.81
  netmask 255.255.255.248

# FUYUTSUKI
auto eth0
iface eth0 inet static
  address 10.74.4.134
  netmask 255.255.255.252
  gateway 10.74.4.133
  post-up sysctl -w net.ipv4.ip_forward=1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

auto eth1
iface eth1 inet static
  address 10.74.4.165
  netmask 255.255.255.252
  up ip route add 10.74.4.72/29 via 10.74.4.166

auto eth2
iface eth2 inet static
  address 10.74.4.169
  netmask 255.255.255.252
  up ip route add 10.74.3.192/27 via 10.74.4.170

auto eth3
iface eth3 inet static
  address 10.74.4.57
  netmask 255.255.255.248   

# SHINJI
auto eth0
iface eth0 inet static
  address 10.74.4.138
  netmask 255.255.255.252
  gateway 10.74.4.137
  post-up sysctl -w net.ipv4.ip_forward=1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

auto eth1
iface eth1 inet static
  address 10.74.4.1
  netmask 255.255.255.224

# Node uji dengan IP sementara
# Armisael (Monolith, gateway 10.74.4.81)
ip addr add 10.74.4.86/29 dev eth0 # menambahkan alamat IP
ip link set eth0 up #   mengaktifkan interface eth0
ip route add default via 10.74.4.81 # menambahkan default gateway
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Lilith (Dogma, gateway 10.74.4.73)
ip addr add 10.74.4.78/29 dev eth0
ip link set eth0 up
ip route add default via 10.74.4.73
echo "nameserver 8.8.8.8" > /etc/resolv.conf

# di Gendou, catat angka pkts
iptables -t nat -L POSTROUTING -n -v
# di Armisael
ping -c 5 10.74.4.78          # ke Lilith
# di Gendou lagi: angka pkts tidak berubah
iptables -t nat -L POSTROUTING -n -v
# di Armisael
ping -c 3 8.8.8.8
# di Gendou lagi: angka pkts naik
iptables -t nat -L POSTROUTING -n -v