#!/bin/bash
temp=$(
    sensors 'coretemp-*' \
        | grep '^Package id' \
        | awk '{ print $4 }' \
        | grep -o '[0-9]\+' \
        | head -n1
)

# Different temperature icons
if [[ "$temp" -lt 30 ]]; then
    printf '\uf2cb'
elif [[ "$temp" -lt 40 ]]; then
    printf '\uf2ca'
elif [[ "$temp" -lt 50 ]]; then
    printf '\uf2c9'
elif [[ "$temp" -lt 60 ]]; then
    printf '\uf2c8'
else
    printf '\uf2c9'
fi

# Green -> yellow -> red
# ??FF00 -> FFFF0 -> FF??00
# 30 -> safe
# 80 -> red

printf '💻  %s°C\n' $temp

if [[ "$temp" -lt 30 ]]; then
    printf '\n#00FF00'

#elif [[ "$temp" -lt 56 ]]; then
#    # step from green to yellow
#    a=$(((temp-30)*10))
#    printf '\n#%02xFF00' $a
#
#elif [[ "$temp" -lt 81 ]]; then
#    # step from yellow - to red
#    a=$(((80-temp)*10))
#    printf '\n#FF%02x00' $a

elif [[ "$temp" -lt 81 ]]; then
    # step from yellow - to red
    a=$(((80-temp)*5))
    printf '\n#FF%02x00' $a

elif [[ "$temp" -gt 80 ]]; then
    printf '\n#FF0000'
fi
