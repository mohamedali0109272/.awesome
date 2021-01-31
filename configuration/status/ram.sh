#!/usr/bin/sh
mem="$(free -h | awk 'NR==2{printf "%s", $3}')"
icon2=""
printf " %s %s " "$icon2" "$mem"