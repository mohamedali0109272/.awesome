#!/usr/bin/bash

	ls  /sys/class/net/ | grep -v "lo" |\
	dmenu -c -l 15 -m dmenumon -nb "#000000" -sb "#AC0021" -fn FontAwesome:size=17 -p "netspeed" |\
	xargs -i sed -i \
	"s/\/sys\/class\/net\/.*\/statistics\/rx_bytes/\/sys\/class\/net\/{}\/statistics\/rx_bytes/g"\
	~/.config/awesome/configuration/status/netspeed.sh


return 0
