# UJI DARI LILITH
for t in 10.74.3.194:80 10.74.4.106:80 10.74.4.106:8080 10.74.3.194:22 10.74.4.106:22; do
  h=${t%:*}; p=${t#*:}
  s=$(date +%s)
  out=$(echo "tes" | nc -w 3 $h $p 2>&1)
  rc=$?
  echo "$t -> [$out] exit=$rc durasi=$(( $(date +%s) - s ))s"
done

# CEK PORT YANG SEDANG LISTENING
ss -ltn 