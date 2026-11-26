#!/bin/sh

NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
DIR=${DIR:-/root}
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
case "$NODE" in
  *fuyutsuki*)       NAMA=fuyutsuki;  ROUTES="default 10.74.4.72/29 10.74.3.192/27" ;;
  *pen-pen*|*penpen*) NAMA=penpen;    ROUTES="default" ;;
  *tokyo3*)          NAMA=tokyo3core; ROUTES="default" ;;
  *) echo "Jalankan di Fuyutsuki, Pen-Pen, atau Tokyo3-Core (atau NODE=...)."; exit 1;;
esac
[ -f "$DIR/$NAMA.sh" ] || { echo "$DIR/$NAMA.sh tidak ada. Buat dulu (script jaringan node)."; exit 1; }

cnt() { echo "$1  filter=$(iptables -S | wc -l)  nat=$(iptables -t nat -S | wc -l)  rute=$(ip route | wc -l)"; }
cnt_nolabel() { echo "$(iptables -S | wc -l) $(iptables -t nat -S | wc -l) $(ip route | wc -l)"; }
restore() { iptables-restore < "$DIR/$NAMA.rules"; sh "$DIR/$NAMA.sh" >/dev/null 2>&1; }

echo "##### 1. SIMPAN"
iptables-save > "$DIR/$NAMA.rules"; ls -l "$DIR/$NAMA.rules"
cnt AWAL; A=$(cnt_nolabel); iptables -S; iptables -t nat -S; ip route

echo "##### 2. HANCURKAN (semua rule termasuk nat + rute buatan sendiri)"
iptables -F; iptables -X; iptables -t nat -F; iptables -t nat -X
iptables -P INPUT ACCEPT; iptables -P FORWARD ACCEPT; iptables -P OUTPUT ACCEPT
for r in $ROUTES; do ip route del $r 2>/dev/null; done
cnt HANCUR; iptables -S; iptables -t nat -S; ip route

echo "##### 3. PULIHKAN PERTAMA"
restore; cnt PULIH-1; B=$(cnt_nolabel)

echo "##### 4. PULIHKAN KEDUA (berturut-turut)"
restore; cnt PULIH-2; C=$(cnt_nolabel)

echo "##### 5. CEK TIDAK DOBEL (harus kosong)"
iptables -S | sort | uniq -d
iptables -t nat -S | sort | uniq -d
ip route | sort | uniq -d

if [ "$A" = "$B" ] && [ "$B" = "$C" ]; then echo "[LULUS] AWAL = PULIH-1 = PULIH-2"
else echo "[GAGAL] jumlah baris berbeda: AWAL=($A) PULIH-1=($B) PULIH-2=($C)"; fi
echo "Bukti fungsi: lihat panduan soal 20 (ping/nc sesuai node)"
