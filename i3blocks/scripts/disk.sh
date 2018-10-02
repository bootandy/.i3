echo -n '💾 '
df -kh | grep ubuntu | awk '{print $3, $5}'

# If disk usage high then exit with error code:
v=`df -kh | grep ubuntu | awk '{print $5}'`
echo $v
if [ "$v" \> "80%" ]; then
	exit 33
fi

