#!/bin/bash

ab_path=$PWD

# Define a recursive function to traverse through subdirectories
function traverse_dir {
    for file in "$1"/*; do
        if [[ -d "$file" ]]; then
            traverse_dir "$file"
        else
            if [[ -x "$file" && -f "$file" ]]; then
                # If the file is executable and a regular file, print its name
                DIRPATH="$(dirname "$file")"
                cd "$DIRPATH"
                make all
                cd "$ab_path"
            fi
        fi
    done
}

# Check if an argument was provided and it's a directory
if [[ $# -eq 1 && -d "$1" ]]; then
    # Call the function for the specified directory
    traverse_dir "$1"
    re_path=$1
else
    echo "Please provide a directory path as an argument."
fi
