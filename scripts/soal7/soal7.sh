# CEK PORT YANG SEDANG LISTENING
ss -ltn 

# LILITH 
for t in 10.74.4.58:5000 10.74.4.59:5000 10.74.4.59:5001 10.74.4.60:5000; do
  h=${t%:*}; p=${t#*:}
  s=$(date +%s)
  echo "Pesan dari Lilith ke $t" | nc -w 3 $h $p
  rc=$?
  echo "$t exit=$rc durasi=$(( $(date +%s) - s ))s"
done

# Magi-Casper dan Magi-Melchior
cat /root/nc_5000.log

# Magi-Balthasar
echo "--- port 5000 ---"; cat /root/nc_5000.log
echo "--- port 5001 ---"; cat /root/nc_5001.log