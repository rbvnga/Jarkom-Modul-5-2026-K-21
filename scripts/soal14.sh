#!/bin/sh

PILOT_START="01:00"
PILOT_STOP="09:00"
PILOT_DAYS="Mon,Tue,Wed,Thu,Fri"
STAF_START="10:00"
STAF_STOP="16:00"

NODE=${NODE:-$(hostname | tr 'A-Z' 'a-z')}
case "$NODE" in *pen-pen*|*penpen*) ;; *) echo "Script ini hanya untuk Pen-Pen (atau NODE=penpen)."; exit 1;; esac
[ "$(id -u)" = 0 ] || { echo "Harus root"; exit 1; }
command -v iptables >/dev/null 2>&1 || { echo "iptables belum terpasang (jalankan penpen-pkg.sh)"; exit 1; }

case "$MODE" in
  cocok) S=$(date -u -d '1 hour ago' +%H:%M); E=$(date -u -d '1 hour' +%H:%M); D=$(date -u +%a)
         PILOT_START=$S; PILOT_STOP=$E; PILOT_DAYS=$D; STAF_START=$S; STAF_STOP=$E ;;
  tidak) S=$(date -u -d '2 hours' +%H:%M); E=$(date -u -d '4 hours' +%H:%M)
         PILOT_START=$S; PILOT_STOP=$E; STAF_START=$S; STAF_STOP=$E ;;
esac

PILOTS="10.74.4.66 10.74.4.67 10.74.4.68 10.74.3.130"   # Unit-01 Unit-02 Unit-00 Sachiel
STAF="10.74.4.74 10.74.4.75"                            # Lilith Adam
DUMMY="10.74.4.51 10.74.4.50 10.74.4.102"               # Dummy-Plug Entry-Plug Spy

iptables -F; iptables -X
iptables -P INPUT ACCEPT; iptables -P FORWARD ACCEPT; iptables -P OUTPUT ACCEPT
# aturan jadwal di paling atas (tanpa ESTABLISHED di atasnya)
for ip in $DUMMY; do
  iptables -A INPUT -s $ip -p icmp --icmp-type echo-request -j DROP
  iptables -A INPUT -s $ip -p tcp --dport 80 -j REJECT --reject-with tcp-reset
done
for ip in $PILOTS; do
  iptables -A INPUT -s $ip -p icmp --icmp-type echo-request -m time --timestart $PILOT_START --timestop $PILOT_STOP --weekdays $PILOT_DAYS -j ACCEPT
  iptables -A INPUT -s $ip -p icmp --icmp-type echo-request -j DROP
  iptables -A INPUT -s $ip -p tcp --dport 80 -m time --timestart $PILOT_START --timestop $PILOT_STOP --weekdays $PILOT_DAYS -j ACCEPT
  iptables -A INPUT -s $ip -p tcp --dport 80 -j REJECT --reject-with tcp-reset
done
for ip in $STAF; do
  iptables -A INPUT -s $ip -p icmp --icmp-type echo-request -m time --timestart $STAF_START --timestop $STAF_STOP -j ACCEPT
  iptables -A INPUT -s $ip -p icmp --icmp-type echo-request -j DROP
  iptables -A INPUT -s $ip -p tcp --dport 80 -m time --timestart $STAF_START --timestop $STAF_STOP -j ACCEPT
  iptables -A INPUT -s $ip -p tcp --dport 80 -j REJECT --reject-with tcp-reset
done
echo "MODE=${MODE:-asli} | jam UTC Pen-Pen: $(date -u '+%a %H:%M')"
echo "PILOT $PILOT_START-$PILOT_STOP ($PILOT_DAYS) | STAF $STAF_START-$STAF_STOP"
iptables -S
