#!/bin/bash 
#dictionary
declare -A birthrecord
#variables
person_number=0
function find_month(){
	local month_no=$1
	case $month_no in
		1) echo "january" ;;
		2) echo "february" ;;
		3) echo "march"  ;;
		4) echo "april"  ;;
		5) echo "may"  ;;
		6) echo "june" ;;
		7) echo "july" ;;
		8) echo "august"  ;;
		9) echo "september";;
		10) echo "october"  ;;
		11) echo "november" ;;
		12) echo "december";;
	esac
}
# putting person number in there respective birth month
while [ $person_number -lt 50 ]
do
	random_day=$((RANDOM%366))     #generating random day from 366 day of the year
	month_number=`date +%m -d "1992-01-01 +$random_day days"`     # gives month in octal formate
	birth_date=`date +%d-%m-%y -d "1992-01-01 +$random_day days"`     # gives month in octal formate
	month_number="$((10#$month_number))"      # converting octal to decimal formate
	birth_record[$month_number]="${birth_record[$month_number]}, I-$person_number=$birth_date"
	((person_number++))
done
#displaying the result
for i in "${!birth_record[@]}"
do
	month=$( find_month $i )
	echo "$month->${birth_record[$i]}"
done

