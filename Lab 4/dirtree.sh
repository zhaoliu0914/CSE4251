#!/bin/bash

function list_files() {
    local directory="$1"
    local indent="$2"
    
    # List files and directories in the current directory
    local files_and_directories=$(find "$directory" -maxdepth 1 -exec basename {} \;)

    # Iterate over the files and directories
    for item in $files_and_directories; do
        echo "$indent$item"

        # Check if it's a directory and recurse into it
        if [ -d "$directory/$item" ]; then
            list_files "$directory/$item" "$indent    "
        fi
    done
}

# run command "pwd" to get current directory
current_directory=$(pwd)

# Call the function to display directories and files recursively
list_files "$current_directory" ""
