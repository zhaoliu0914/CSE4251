#!/bin/bash

is_continue=true
file_name=mycontacts.txt

while [ "$is_continue" == true ]; do
    echo 1. Enter a new contact
    echo 2. Show contacts
    echo 3. Exit
    read -p "Please input 1, 2, or 3: " operation

    if [ $operation == 1 ]; then
        # Create a contact into file
        echo ""
        read -p "Please enter the full name: " name
        read -p "Please enter the birth date (dd-mm): " birth_date
        read -p "Please enter the phone number (zzz-yyy-yyyy): " phone_number
        read -p "Please enter the email (name@domain.com): " email_address

        content="$name,$birth_date,$phone_number,$email_address"
        echo "$content" >> "$file_name"

        echo ""
        echo "$name has been successfully added a new contact!"
        echo ""

    elif [ $operation == 2 ]; then
        # Print all contacts to console
        echo ""
        if [ -f "$file_name" ]; then
            echo "Name       Birthday      Phone        Email"
            while IFS= read -r line; do
                #echo "$line"
                IFS=','
                read -ra tokens <<< "$line"
                for token in "${tokens[@]}"
                do
                    echo -n "$token      "
                done
                echo ""

                IFS='\t\n'

            done < "$file_name"

        else
            echo "The contact is empty!!!"
        fi
        echo ""
    elif [ $operation == 3 ]; then
        # Quit the program
        is_continue=false

    else
        # Wrong enter, need to re-enter.
        echo Number $operation is a invalid input. Please enter again!!!
        echo ""

    fi

done