# Jarkom-Modul-5-2026-K-21
# Soal 1: Subnetting VLSM
[Hasil Subnetting VLSM K21](https://docs.google.com/spreadsheets/d/1-ahuSv7Fk623vsa5SYlGUh162Nc1hW0h/edit?usp=sharing&ouid=102900172779478181126&rtpof=true&sd=true)
## Pohon VLSM

# Soal 2: Konfigurasi Router Geofront (K-21, prefix 10.74.0.0/21)
 
## Langkah umum di setiap router
 
1. Pasang IP di tiap interface (`ip addr add ...`) lalu aktifkan (`ip link set ... up`).
2. Aktifkan forwarding: `sysctl -w net.ipv4.ip_forward=1`
3. Bukti: `ip -br addr` (atau `ip -br a`), lalu ping ke router tetangga di tiap link.
 
## Gendou
 
```
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
```
 
## Yui
 
```
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
```
 
## Hikari
 
```
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
```
 
## Asuka
 
```
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
```
 
## Kaji
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.122
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.4.101
  netmask 255.255.255.252
```
 
## Misato
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.126
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.4.65
  netmask 255.255.255.248
```
 
## Shigeru
 
```
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
```
 
## Fuyutsuki
 
```
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
```
 
## Shinji
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.138
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.4.1
  netmask 255.255.255.224
```
 
## Rei
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.142
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.0.1
  netmask 255.255.254.0
```
 
## Mari
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.146
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.4.33
  netmask 255.255.255.240
```
 
## Kaworu
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.150
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.3.225
  netmask 255.255.255.224
```
 
## Kensuke
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.154
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.3.129
  netmask 255.255.255.192
```
 
## Ritsuko
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.158
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.4.49
  netmask 255.255.255.248
```
 
## Makoto
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.162
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.4.89
  netmask 255.255.255.248
```
 
## Toji
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.166
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.4.73
  netmask 255.255.255.248
```
 
## Maya
 
```
auto eth0
iface eth0 inet static
  address 10.74.4.170
  netmask 255.255.255.252
  post-up sysctl -w net.ipv4.ip_forward=1
 
auto eth1
iface eth1 inet static
  address 10.74.3.193
  netmask 255.255.255.224
```
 
## Cek per Route
```bash
# Cek IP forwarding aktif di setiap router
sysctl net.ipv4.ip_forward

# Cek IP interface tiap router
ip -br addr
```
- gendou <br>
<img src="assets/soal2/gendou.png"> 

- yui <br>
<img src="assets/soal2/yui.png">

- hikari<br>
<img src="assets/soal2/hikari.png">
- asuka<br>
<img src="assets/soal2/asuka.png">

- misato<br>
<img src="assets/soal2/misato.png">

- shigeru<br>
<img src="assets/soal2/shigeru.png">

- fuyutsuki<br>
<img src="assets/soal2/fuyutsuki.png">

- shinji<br>
<img src="assets/soal2/shinji.png">

- rei<br>
<img src="assets/soal2/rei.png">

- mari<br>
<img src="assets/soal2/mari.png">

- kaworu<br>
<img src="assets/soal2/kaworu.png">

- kensuke<br>
<img src="assets/soal2/kensuke.png">

- ritsuko<br>
<img src="assets/soal2/ritsuko.png">

- makoto<br>
<img src="assets/soal2/makoto.png">

- toji<br>
<img src="assets/soal2/toji.png">

- maya<br>
<img src="assets/soal2/maya.png">

# SOAL 3
 Aturan:
- Router selain Gendou: **satu default route ke atas** + rute hanya untuk subnet di bawahnya.
- Gendou: default route ke NAT1 (didapat otomatis dari DHCP, **jangan ditulis manual**) + rute ke tiap cabang.
- Subnet dalam satu cabang yang bisa digabung **tepat** menjadi satu CIDR sudah diringkas.
