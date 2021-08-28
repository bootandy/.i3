#!/bin/bash
# lifted from https://github.com/derrickcope/scripts/blob/master/i3blocks/blocklets/bandwidth.sh

TYPE=$1
if [ "$1" != "rx" -a "$1" != "tx" ]; then
    echo "Invalid argument: $1" 1>&2
    echo "Must be 'tx' or 'rx'" 1>&2
    echo "Usage: $0 (rx|tx)" 1>&2
    exit 1
fi

if [ "$1" == "tx" ]; then
	echo -n "↑"
fi
if [ "$1" == "rx" ]; then
	echo -n "↓"
fi
FILE=/tmp/i3blocks_bandwidth_$TYPE
touch $FILE

PREV=$(cat $FILE)
CUR=0

NETDIR=/sys/class/net
for IFACE in $(ls -1 $NETDIR); do
    # Skip the loopback interface
	if [[ $IFACE == lo ]]; then
        continue
    fi
    if [[ $IFACE == veth* ]]; then
         continue
    fi
    if [[ $IFACE == docker* ]]; then
         continue
    fi
    F=$NETDIR/$IFACE/statistics/${TYPE}_bytes
    N=$(cat $F)
    CUR=$(expr $CUR + $N)
done

delta=$(expr $CUR - $PREV)
delta=$(expr $delta / 5000)
echo $delta kB/s

if [[ "$delta" -lt 1001 ]]; then
  # step from yellow - to red
  a=$(((1000-delta)/4))
  printf '\n#FF%02x00' $a
elif [[ "$delta" -gt 1000 ]]; then
  printf '\n#FF0000'
fi

echo $CUR > $FILE
