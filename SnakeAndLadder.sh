#!/bin/bash -x

user1=0
count=0
while [[ $user1 -lt 100 ]]
do
	die_value=$(( (RANDOM % 6) +1 ))
	option=$(( (RANDOM % 3) +1 ))

	if [[ $option -eq 1 ]]
	then
		user1=$(( user1 + die_value ))
		if [[ $user1 -gt 100 ]]
		then
			user1=$(( user1 - die_value ))
		elif [[ $user1 -eq 100 ]]
		then
			echo Congrats User 1... You Win
			echo Total $(( count )) number of time the dice was played
			exit
		fi
	elif [[ $option -eq 2 ]]
	then
		user1=$(( user1 - die_value ))
		if [[ $user1 -lt 0 ]]
		then
			user1=0
		fi
	fi
	count=$(( count + 1 ))
	user1array[count]=$user1
done
