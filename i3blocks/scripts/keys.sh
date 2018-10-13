v=`xset -q | grep Caps | awk '{printf "CapsLock: %-3s NumLock: %-3s\n", $4, $8 }'`

# If Caps lock is on
caps_state=`xset -q | grep Caps | awk '{print $4}'`
echo "$v"
if [ "$caps_state" = "on" ]; then
	exit 33
fi

