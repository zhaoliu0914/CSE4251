#!/bin/bash
#echo "guess the number:"
# get an integer from user
read -p "Guess a number: " answer

# generate a random number
goal=`head -c24 < /dev/random | base64 | tr -dc A-Za-z0-9 | od -An -t d1 | head -c15 | tr -d 0 | tr -d ' '`

# if the "answer" == "goal", then display correct!
# else continue asking an integer from user.
count=1
while [ "$answer" != "$goal" ];
do
    # check whether the "answer" is greater than or less than the "goal", and display the message to user
    if [ "$answer" -lt "$goal" ]; then
        echo "too small"
    else
        echo "too large"
    fi
    count=$(($count+1))
    read -p "Guess a number: " answer
done

echo "correct!"