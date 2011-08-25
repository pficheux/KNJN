#!/bin/sh
STR=(H e l l o ' ' L i n u x !)

# Init LCD
echo -n 3800
echo -n 0f00
echo -n 0100
sleep 2

# Send string as hex code
for i in ${!STR[*]}
do
    C=${STR[i]}
    if [ "$C" = " " ]; then
	echo -n 20
    else
	printf "%x" \'${STR[i]}
    fi
done
