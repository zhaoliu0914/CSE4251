#!/bin/bash
count_array=()

echo "1. Run the guessing game"
echo "2. Exit"
read -p "Please choose 1 or 2 to continue: " choice

# keeping asking user to choose 1 or 2.
# only 1 to play guessing game.
while [ "$choice" -eq 1 ];
do
    # get an integer from user
    read -p "Guess a number: " answer

    # generate a random number
    goal=`head -c24 < /dev/random | base64 | tr -dc A-Za-z0-9 | od -An -t d1 | head -c15 | tr -d 0 | tr -d ' '`

    #echo "goal = $goal"

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

    # add current count number to the "count_array"
    count_array+=($count)
    echo "correct! You tried $count times to get the correct integer."

    echo "1. Run the guessing game"
    echo "2. Exit"
    read -p "Please choose 1 or 2 to continue: " choice
done

echo "Exiting the guessing game"

size=${#count_array[@]}

# if the size == 0, means user never playing the guessing game.
# if the size > 0, calcuate the average number of guesses.
if [ "$size" -gt 0 ]; then
    for element in "${count_array[@]}"; do
        sum=$((sum + element))
    done
    
    average=$((sum/$size))

    echo "Your average number of guesses is: $average"
else
    echo "You did not guess any integer."
fi
