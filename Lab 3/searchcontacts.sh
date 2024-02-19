#!/bin/bash

file_name=mycontacts.txt

search_birthday=false
serach_name=false

function print_result() {
    echo ""
    if [ -z "$result" ]; then
        if [ "$search_birthday" == true ]; then
            echo "No contact’s birthday is today"
        elif [ "$serach_name" == true ]; then
            echo "No matched contact found"
        else
            echo "No matching"
        fi
        
    else
        echo "Name       Birthday      Phone        Email"
        while read -r line
        do
            IFS=','
            read -ra tokens <<< "$line"
            for token in "${tokens[@]}"
            do
                echo -n "$token      "
            done
            echo ""

            IFS='\t\n'
        done <<< "$result"
        
    fi

    echo ""
}

day_of_week=$(date +%A)
current_time=$(date +"%T")
current_month=$(date +"%m")
current_day=$(date +"%d")

echo "Today is $day_of_week and the current time is current_time"
echo ""

result=$(grep "$current_month-$current_day" "$file_name")

search_birthday=true
serach_name=false

print_result

read -p "Please type the name to be searched: " name

result=$(grep -i "$name" "$file_name")

search_birthday=false
serach_name=true

print_result

