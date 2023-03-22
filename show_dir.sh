#!/bin/bash
let warmUp=100      #   Default warm up 100 times
let execute=50     #   Default execute 100 times
ab_path=$PWD

while getopts ":w:e:" opt
do
    case $opt in
        w)
            warmUp=$OPTARG
        ;;
        e)
            execute=$OPTARG
        ;;
        ?)
        echo "Unknown parameter"
        exit 1;;
esac done

# Define a recursive function to traverse through subdirectories
function traverse_dir {
    for file in "$1"/*; do
        if [[ -d "$file" ]]; then
            traverse_dir "$file"
        else
            if [[ -x "$file" && -f "$file" ]]; then
                # If the file is executable and a regular file, print its name
                DIRPATH="$(dirname "$file")"
                echo cd "$DIRPATH"
                echo chmod +x run.sh
                echo ./run.sh -w \$warmUp -e \$execute
                echo cd /polybench-c-4.2.1-beta

                # NAME="$(basename "$file")"
                
                # echo "Executing file $NAME in $DIRPATH"
                # cd "$DIRPATH"
                # chmod +x run.sh
                # ./run.sh -w $warmUp -e $execute
                # cd "$ab_path"
                break
            fi
        fi
    done
}

traverse_dir "Gramine"