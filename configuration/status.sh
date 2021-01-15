cpu(){
	read cpu a b c previdle rest < /proc/stat
	prevtotal=$((a+b+c+previdle))
	sleep 0.5
	read cpu a b c idle rest < /proc/stat
	total=$((a+b+c+idle))
	cpu=$((100*( (total-prevtotal) - (idle-previdle) ) / (total-prevtotal) ))
	icon1=""
	printf " %s %s" "$icon1" "$cpu% |"
}

memory(){
	mem="$(free -m | awk 'NR==2{printf "%sM", $3}')"
	icon2=""
	printf " %s %s " "$icon2" "$mem"
}

swap(){
	Swap="$(free -m | awk 'NR==3{printf "%s/%sswap\n", $3,$2,$3*100/$2 }')"
	icon3=""
	printf " %s %s " "$icon3" " $Swap |"
}

TEMP(){
	TEMP="$(sensors|awk 'BEGIN{i=0;t=0;b=0}/id [0-9]/{b=$4};/Core/{++i;t+=$3}END{if(i>0){printf("%0.1f\n",t/i)}else{sub(/[^0-9.]/,"",b);print b}}')"
	icon4=""
	printf " %s %s " "$icon4" " $TEMP"
}

echo "$(cpu)$(memory)$(TEMP)"
