#!/bin/bash -x

user1=0
user2=0
count=1
while [[ $user1 -lt 100 || $user2 -lt 100 ]]
do
	die_value=$(( (RANDOM % 6) +1 ))
	option=$(( (RANDOM % 3) +1 ))

	if [[ $option -eq 1 && $(( count % 2 )) -eq 0 ]]
	then
		user1=$(( user1 + die_value ))
		if [[ $user1 -gt 100 ]]
		then
			user1=$(( user1 - die_value ))
		elif [[ $user1 -eq 100 ]]
		then
			echo Congrats User 1... You Win
			echo Total $(( count - 1 )) number of time the dice was played
			exit
		fi
	elif [[ $option -eq 2 && $(( count % 2 )) -eq 0 ]]
	then
		user1=$(( user1 - die_value ))
		if [[ $user1 -lt 0 ]]
		then
			user1=0
		fi
	elif [[ $option -eq 1 && $(( count % 2 )) -ne 0 ]]
   then
      user2=$(( user2 + die_value ))
      if [[ $user1 -gt 100 ]]
      then
         user2=$(( user2 - die_value ))
      elif [[ $user2 -eq 100 ]]
      then
         echo Congrats User 2... You Win
			echo Total $(( count - 1 )) number of time the dice was played
         exit
      fi
   elif [[ $option -eq 2 && $(( count % 2 )) -ne 0 ]]
   then
      user2=$(( user2 - die_value ))
      if [[ $user2 -lt 0 ]]
      then
         user2=0
      fi
   fi
	count=$(( count + 1 ))
	user2array[count]=$user2
	user1array[count]=$user1
done

