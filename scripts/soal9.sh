
NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
case "$NODE" in *shigeru*) ;; *) echo "Script ini hanya untuk Shigeru (atau NODE=shigeru)."; exit 1;; esac
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }

UP_GW=10.74.4.129     # Gendou sisi link L6
UP_IF=eth0
DOGMA=10.74.4.72/29

echo "===== SEBELUM PERBAIKAN ====="
echo "ip_forward = $(cat /proc/sys/net/ipv4/ip_forward)"
ip rule; echo "--- tabel 100:"; ip route show table 100; echo "--- tabel main:"; ip route

# 1. aktifkan kembali IP forwarding
sysctl -w net.ipv4.ip_forward=1
# 2. hapus rule policy-routing sabotase (prio 90 -> tabel 100) dan isi tabelnya
ip rule show | grep 'lookup 100' | cut -d: -f1 | while read p; do ip rule del pref "$p"; done
ip route flush table 100 2>/dev/null
# 3. hapus blackhole ke subnet Dogma
ip route del blackhole $DOGMA 2>/dev/null
# 4. kembalikan default route ke Gendou (ke atas)
ip route replace default via $UP_GW dev $UP_IF

echo "===== SESUDAH PERBAIKAN ====="
echo "ip_forward = $(cat /proc/sys/net/ipv4/ip_forward)"
ip rule; ip route
echo "--- jalur ke Lilith:"; ip route get 10.74.4.74
echo "Uji: dari Lilith 'ping -c3 10.74.4.83' dan dari Armisael 'ping -c3 10.74.4.74'"
