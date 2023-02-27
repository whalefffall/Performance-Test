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

# Warm Up
for((var=0; var<$warmUp; var++))
    do
        { time -p ./perlbench_r -I. -I./lib makerand.pl > makerand.out 2>> makerand.err 2>&1;} >> 1.output 2>&1
done
# Execute the first Command
for((var=0; var<$execute; var++))
    do
        { time -p ./perlbench_r -I. -I./lib makerand.pl > makerand.out 2>> makerand.err 2>&1;} >> 1.output 2>&1
done

# Warm Up
for((var=0; var<$warmUp; var++))
    do
        { time -p ./perlbench_r -I. -I./lib test.pl > test.out 2>> test.err 2>&1;} >> 1.output 2>&1
done
# Execute the second Command
for((var=0; var<$execute; var++))
    do
        { time -p ./perlbench_r -I. -I./lib test.pl > test.out 2>> test.err 2>&1;} >> 1.output 2>&1
done