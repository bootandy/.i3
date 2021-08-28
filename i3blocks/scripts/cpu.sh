 #!/bin/bash

# grab cpu data a second apart to estimate load
a=$(grep 'cpu ' /proc/stat)
sleep 1
b=$(grep 'cpu ' /proc/stat)

c="$a $b"
d=$(echo $c | awk -v RS="" '{print ($13-$2+$15-$4)*100/($13-$2+$15-$4+$16-$5)}')

# Rounding
d=$(echo "scale=1; $d/1.0" | bc)


printf  '💻 %s%%\n' $d
as_int=$( printf "%.0f" $d)

# step from yellow - to red
a=$((((100-as_int)/2)*5))
printf '\n#FF%02x00' $a
