#!/usr/bin/sh
rx1=$(cat /sys/class/net/wls1/statistics/rx_bytes)
sleep 1
rx2=$(cat /sys/class/net/wls1/statistics/rx_bytes)
ico=$(python -c "print(($rx2 - $rx1) // 1024)")
echo    "|  $ico k"
