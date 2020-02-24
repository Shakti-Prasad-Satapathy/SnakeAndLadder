#!/bin/bash -x

user1=0
die_value=$(( (RANDOM % 6) +1 ))

option=$(( (RANDOM % 3) +1 ))

if [[ $option -eq 1 ]]
then
	user1=$(( user1 + die_value ))
elif [[ $option -eq 2 ]]
then
	user1=$(( user1 - die_value ))
	if [[ $user1 -lt 0 ]]
	then
		user1=0
	fi
fi
