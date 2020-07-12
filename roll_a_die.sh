#!/bin/bash 
#variables
counter=0
max_number=0
min=10
min_number=0

# dictioanry
declare -A roll_records
 
while [ ! $counter -eq 10 ]
do
	roll_a_dice=$(( RANDOM%6+1 ))
	counter=${roll_records[$roll_a_dice]}
	((counter++))
	roll_records[$roll_a_dice]=$counter
	max_number=$roll_a_dice
done

for key in "${!roll_records[@]}"
do
	if [ $key -eq 1 ]
	then
		min=${roll_records[$key]}
		min_number=$key
	elif [ $min -gt ${roll_records[$key]} ]
	then
		min=${roll_records[$key]}
		min_number=$key
	fi
done

for key in "${!roll_records[@]}"
do
	echo $key " - " ${roll_records[$key]}
done

echo "$min_number has occured minimum time with $min occurences"
echo "$max_number has occured maximum times with 10 occurences"

