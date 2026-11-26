
#!/bin/sh
# =============================================================================
# SOAL 10 - Para pilot terkunci di dalam (PERBAIKAN)
# Node   : Misato DAN Gendou (file yang sama, dijalankan di masing-masing node)
# Waktu  : jalankan SETELAH break_nat.sh
#
# Penyebab (2 buah):
#   - Misato : SNAT --to-source 172.31.99.1 untuk subnet Cage (10.74.4.64/29)
#              yang menuju luar 10.74.0.0/16. Sumber paket Cage berubah jadi
#              172.31.99.1 (bukan bagian 10.74.0.0/19, jadi lolos MASQUERADE
#              Gendou dan/atau jatuh ke FORWARD DROP; NAT1 tidak bisa membalas).
#   - Gendou : RETURN untuk -s 10.74.4.64/29 -o eth0 di posisi 1 POSTROUTING,
#              membuat paket Cage melewati MASQUERADE tanpa diterjemahkan.
# Kenapa Intel (Spy) aman: jalurnya Kaji -> Gendou, tidak lewat Misato dan
# sumbernya 10.74.4.102 tidak cocok dengan kedua aturan itu.
# Cage -> Lilith normal: SNAT Misato memakai '! -d 10.74.0.0/16' (tujuan
# internal tidak disentuh).
# Alamat sumber diterjemahkan HANYA di Gendou pada kondisi normal.
# =============================================================================
NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
CAGE=10.74.4.64/29
WAN=eth0

delrule() {   # hapus aturan nat sampai tidak ada lagi (maks 5x, anti loop)
  for i in 1 2 3 4 5; do
    iptables -t nat -C "$@" 2>/dev/null || break
    iptables -t nat -D "$@"
  done
}

case "$NODE" in
  *misato*)
    echo "===== Misato: SEBELUM ====="; iptables -t nat -S POSTROUTING
    delrule POSTROUTING -s $CAGE ! -d 10.74.0.0/16 -o $WAN -j SNAT --to-source 172.31.99.1
    echo "===== Misato: SESUDAH ====="; iptables -t nat -S POSTROUTING
    ;;
  *gendo*)
    echo "===== Gendou: SEBELUM ====="; iptables -t nat -L POSTROUTING -n -v --line-numbers
    delrule POSTROUTING -s $CAGE -o $WAN -j RETURN
    # pastikan MASQUERADE normal tetap ada (idempotent)
    iptables -t nat -C POSTROUTING -s 10.74.0.0/19 -o $WAN -j MASQUERADE 2>/dev/null || \
      iptables -t nat -A POSTROUTING -s 10.74.0.0/19 -o $WAN -j MASQUERADE
    echo "===== Gendou: SESUDAH ====="; iptables -t nat -L POSTROUTING -n -v --line-numbers
    ;;
  *) echo "Jalankan di Misato dan di Gendo (atau NODE=misato / NODE=gendo)."; exit 1;;
esac
echo "Uji: dari Unit-01 'ping -c3 8.8.8.8' (harus berhasil)"
