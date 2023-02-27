#!/bin/bash
let warmUp=100      #   Default warm up 100 times
let execute=100     #   Default execute 100 times

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

# Ececute 500.perlbench_r
cd ./500.perlbench_r
./run.sh -w $warmUp -e $execute
cd ..

