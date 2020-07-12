
#!/bin/bash 
#variables
counter=0
max_number=0
min=10
min_number=0

# dictionary
declare -A roll_records
 
while [ ! $counter -eq 10 ]
do
	roll_a_dice=$(( RANDOM%6+1 ))
	counter=${roll_records[$roll_a_dice]}
	((counter++))
	if [ $counter -lt $min ]
	then
		min=$counter
		min_number=$roll_a_dice
	elif [ $counter -gt $min ] && [ $roll_a_dice -eq $min_number ]
	then
		min=$counter
	fi
	roll_records[$roll_a_dice]=$counter
	max_number=$roll_a_dice
done

echo "$min_number has occured minimum time with $min occurences"
echo "$max_number has occured maximum times with 10 occurences"

