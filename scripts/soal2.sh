# GENDOU
auto eth0
iface eth0 inet dhcp
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.109
  netmask 255.255.255.252

auto eth2
iface eth2 inet static
  address 10.74.4.113
  netmask 255.255.255.252

auto eth3
iface eth3 inet static
  address 10.74.4.117
  netmask 255.255.255.252

auto eth4
iface eth4 inet static
  address 10.74.4.121
  netmask 255.255.255.252

auto eth5
iface eth5 inet static
  address 10.74.4.125
  netmask 255.255.255.252

auto eth6
iface eth6 inet static
  address 10.74.4.129
  netmask 255.255.255.252

auto eth7
iface eth7 inet static
  address 10.74.4.133
  netmask 255.255.255.252

auto eth8
iface eth8 inet static
  address 10.74.4.105
  netmask 255.255.255.252

# YUI 
auto eth0
iface eth0 inet static
  address 10.74.4.110
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.137
  netmask 255.255.255.252

auto eth2
iface eth2 inet static
  address 10.74.4.141
  netmask 255.255.255.252

auto eth3
iface eth3 inet static
  address 10.74.4.145
  netmask 255.255.255.252

auto eth4
iface eth4 inet static
  address 10.74.3.1
  netmask 255.255.255.128

# HIKARI
auto eth0
iface eth0 inet static
  address 10.74.4.114
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.149
  netmask 255.255.255.252

auto eth2
iface eth2 inet static
  address 10.74.2.1
  netmask 255.255.255.0

# ASUKA
auto eth0
iface eth0 inet static
  address 10.74.4.118
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.153
  netmask 255.255.255.252

auto eth2
iface eth2 inet static
  address 10.74.4.157
  netmask 255.255.255.252

auto eth3
iface eth3 inet static
  address 10.74.4.97
  netmask 255.255.255.252

#KAJI
auto eth0
iface eth0 inet static
  address 10.74.4.122
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.101
  netmask 255.255.255.252

# MISATO
auto eth0
iface eth0 inet static
  address 10.74.4.126
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.65
  netmask 255.255.255.248

#SHIGERU
auto eth0
iface eth0 inet static
  address 10.74.4.130
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.161
  netmask 255.255.255.252

auto eth2
iface eth2 inet static
  address 10.74.4.81
  netmask 255.255.255.248

#FUYUTSUKI
auto eth0
iface eth0 inet static
  address 10.74.4.134
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.165
  netmask 255.255.255.252

auto eth2
iface eth2 inet static
  address 10.74.4.169
  netmask 255.255.255.252

auto eth3
iface eth3 inet static
  address 10.74.4.57
  netmask 255.255.255.248

# SHINJI
auto eth0
iface eth0 inet static
  address 10.74.4.138
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.1
  netmask 255.255.255.224

# REI
auto eth0
iface eth0 inet static
  address 10.74.4.142
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.0.1
  netmask 255.255.254.0

# MARI
auto eth0
iface eth0 inet static
  address 10.74.4.146
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.33
  netmask 255.255.255.240

#KAWORU
auto eth0
iface eth0 inet static
  address 10.74.4.150
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.3.225
  netmask 255.255.255.224

# KENSUKE
auto eth0
iface eth0 inet static
  address 10.74.4.154
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.3.129
  netmask 255.255.255.192

# RITSUKO
auto eth0
iface eth0 inet static
  address 10.74.4.158
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.49
  netmask 255.255.255.248

# MAKOTO
auto eth0
iface eth0 inet static
  address 10.74.4.162
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.89
  netmask 255.255.255.248

# TOJI
auto eth0
iface eth0 inet static
  address 10.74.4.166
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.4.73
  netmask 255.255.255.248

# MAYA 
auto eth0
iface eth0 inet static
  address 10.74.4.170
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1

auto eth1
iface eth1 inet static
  address 10.74.3.193
  netmask 255.255.255.224

# Cek IP forwarding aktif di setiap router
sysctl net.ipv4.ip_forward

# Cek IP interface tiap router
ip -br addr

# Pengecekan koneksi antar router #
# Cek koneksi dari Gendou 
ping -c 2 10.74.4.110   # Yui
ping -c 2 10.74.4.114   # Hikari
ping -c 2 10.74.4.118   # Asuka
ping -c 2 10.74.4.122   # Kaji
ping -c 2 10.74.4.126   # Misato
ping -c 2 10.74.4.130   # Shigeru
ping -c 2 10.74.4.134   # Fuyutsuki

# cek koneksi dari Yui
ping -c 2 10.74.4.109   # Gendou
ping -c 2 10.74.4.138   # Shinji
ping -c 2 10.74.4.142   # Rei
ping -c 2 10.74.4.146   # Mari

# cek koneksi dari Hikari
ping -c 2 10.74.4.113   # Gendou
ping -c 2 10.74.4.150   # Kaworu

# cek koneksi dari Asuka
ping -c 2 10.74.4.117   # Gendou
ping -c 2 10.74.4.154   # Kensuke
ping -c 2 10.74.4.158   # Ritsuko

# cek koneksi dari Kaji
ping -c 2 10.74.4.121   # Gendou

# cek koneksi dari Misato
ping -c 2 10.74.4.125   # Gendou

# cek koneksi dari Shigeru
ping -c 2 10.74.4.129   # Gendou
ping -c 2 10.74.4.162   # Makoto

# cek koneksi dari Fuyutsuki
ping -c 2 10.74.4.133   # Gendou
ping -c 2 10.74.4.166   # Toji
ping -c 2 10.74.4.170   # Maya

# cek koneksi dari Shinji
ping -c 2 10.74.4.137   # Yui

# cek koneksi dari Rei
ping -c 2 10.74.4.141   # Yui

# cek koneksi dari Mari
ping -c 2 10.74.4.145   # Yui

# cek koneksi dari Kaworu
ping -c 2 10.74.4.149   # Hikari

# cek koneksi dari Kensuke
ping -c 2 10.74.4.153   # Asuka

# cek koneksi dari Ritsuko
ping -c 2 10.74.4.157   # Asuka

# cek koneksi dari Makoto
ping -c 2 10.74.4.161   # Shigeru

# cek koneksi dari Toji
ping -c 2 10.74.4.165   # Fuyutsuki

# cek koneksi dari Maya
ping -c 2 10.74.4.169   # Fuyutsuki