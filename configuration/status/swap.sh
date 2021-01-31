#!/usr/bin/sh
Swap="$(free -m | awk 'NR==3{printf "%s/%sswap\n", $3,$2,$3*100/$2 }')"
icon3=""
printf " %s %s " "$icon3" " $Swap |"