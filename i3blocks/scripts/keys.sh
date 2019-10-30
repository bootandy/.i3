v=`xset -q | grep Num | awk '{printf "Num: %-3s\n", $8 }'`

# If numlock is on
num_state=`xset -q | grep Num | awk '{print $8}'`
echo "$v"
if [ "$num_state" = "off" ]; then
	exit 33
fi

