echo -n '💾 '
#df -kh | grep ubuntu | awk '{print $3, $5}'
df -kh | grep nvme | head -1 | awk '{print $3, $5}'

# If disk usage high then exit with error code:
#v=`df -kh | grep ubuntu | awk '{print $5}'`
v=`df -kh | grep nvme | head -1 | awk '{print $5}' | sed 's/%//'`

#echo $v
if [ "$((v))" -gt 80 ]; then
	exit 33
fi

