# QUARTERS
auto eth0
iface eth0 inet static
  address 10.74.0.2
  netmask 255.255.254.0
  gateway 10.74.0.1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# COMM-NET
auto eth0
iface eth0 inet static
  address 10.74.2.2
  netmask 255.255.255.0
  gateway 10.74.2.1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# DOCK-CREW
auto eth0
iface eth0 inet static
  address 10.74.4.34
  netmask 255.255.255.240
  gateway 10.74.4.33
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# HANGER-CREW
auto eth0
iface eth0 inet static
  address 10.74.3.2
  netmask 255.255.255.128
  gateway 10.74.3.1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# SACHIEL
auto eth0
iface eth0 inet static
  address 10.74.3.130
  netmask 255.255.255.192
  gateway 10.74.3.129
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# PEN-PEN
auto eth0
iface eth0 inet static
  address 10.74.3.194
  netmask 255.255.255.224
  gateway 10.74.3.193
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# MEDIC-BAY
auto eth0
iface eth0 inet static
  address 10.74.3.195
  netmask 255.255.255.224
  gateway 10.74.3.193
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# RELAY-NODE
auto eth0
iface eth0 inet static
  address 10.74.3.226
  netmask 255.255.255.224
  gateway 10.74.3.225
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# GARDEN STAFF
auto eth0
iface eth0 inet static
  address 10.74.4.2
  netmask 255.255.255.224
  gateway 10.74.4.1
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# ENTRY-PLUG
auto eth0
iface eth0 inet static
  address 10.74.4.50
  netmask 255.255.255.248
  gateway 10.74.4.49
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# DUMMY-PLUG
auto eth0
iface eth0 inet static
  address 10.74.4.51
  netmask 255.255.255.248
  gateway 10.74.4.49
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# MAGI-CASPER
auto eth0
iface eth0 inet static
  address 10.74.4.58
  netmask 255.255.255.248
  gateway 10.74.4.57
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# MAGI-BALTHASAR
auto eth0
iface eth0 inet static
  address 10.74.4.59
  netmask 255.255.255.248
  gateway 10.74.4.57
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# MAGI-MELCHIOR
auto eth0
iface eth0 inet static
  address 10.74.4.60
  netmask 255.255.255.248
  gateway 10.74.4.57
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# UNIT-01
auto eth0
iface eth0 inet static
  address 10.74.4.66
  netmask 255.255.255.248
  gateway 10.74.4.65
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# UNIT-02
auto eth0
iface eth0 inet static
  address 10.74.4.67
  netmask 255.255.255.248
  gateway 10.74.4.65
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# UNIT-00
auto eth0
iface eth0 inet static
  address 10.74.4.68
  netmask 255.255.255.248
  gateway 10.74.4.65
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# LILITH
auto eth0
iface eth0 inet static
  address 10.74.4.74
  netmask 255.255.255.248
  gateway 10.74.4.73
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# ADAM
auto eth0
iface eth0 inet static
  address 10.74.4.75
  netmask 255.255.255.248
  gateway 10.74.4.73
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# ZERUEL
auto eth0
iface eth0 inet static
  address 10.74.4.82
  netmask 255.255.255.248
  gateway 10.74.4.81
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# ARMISAEL 
auto eth0
iface eth0 inet static
  address 10.74.4.83
  netmask 255.255.255.248
  gateway 10.74.4.81
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# RADAR-ARRAY
auto eth0
iface eth0 inet static
  address 10.74.4.90
  netmask 255.255.255.248
  gateway 10.74.4.89
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# ARCHIVE-VAULT
auto eth0
iface eth0 inet static
  address 10.74.4.98
  netmask 255.255.255.252
  gateway 10.74.4.97
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# SPY
auto eth0
iface eth0 inet static
  address 10.74.4.102
  netmask 255.255.255.252
  gateway 10.74.4.101
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# TOKYO3-CORE
auto eth0
iface eth0 inet static
  address 10.74.4.106
  netmask 255.255.255.252
  gateway 10.74.4.105
  up echo "nameserver 8.8.8.8" > /etc/resolv.conf

# PEMBUKTIAN # 
# Unit-01 
ip -br a
ping -c 3 10.74.4.65     # gateway Unit-01 (Misato)
