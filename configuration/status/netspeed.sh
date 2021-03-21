#!/usr/bin/bash

    rx1=$(cat /sys/class/net/wls1/statistics/rx_bytes)
    sleep 1
    rx2=$(cat /sys/class/net/wls1/statistics/rx_bytes)
    ico=$(expr $(expr $rx2 - $rx1) / 1024)
    if [[ $ico -ge "1024" ]]; then
            ico=$(expr $ico / 1024 )
            echo  "| $ico M "
    else
            echo  "| $ico K "
    fi
