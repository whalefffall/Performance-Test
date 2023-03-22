#!/bin/bash
let warmUp=1      #   Default warm up 100 times
let execute=1     #   Default execute 100 times
ex_path="$PWD" 

while getopts ":w:e:p:" opt
do
    case $opt in
        w)
            warmUp=$OPTARG
        ;;
        e)
            execute=$OPTARG
        ;;
        e)
            ex_path=$OPTARG
        ;;
        ?)
        echo "Unknown parameter"
        exit 1;;
esac done

# Warm Up for Ubuntu
for((var=0; var<$warmUp; var++))
    do
        { ./syr2k  2>&1;} >> $ex_path/WarmUpForUbuntu.output 2>&1
done
# Execute
for((var=0; var<$execute; var++))
    do
        { ./syr2k  2>&1;} >> $ex_path/ResultForUbuntu.output 2>&1
done

# Warm Up for gramine-direct
for((var=0; var<$warmUp; var++))
    do
        { gramine-direct ./syr2k  2>&1;} >> $ex_path/WarmUpForGramine.output 2>&1
done
# Execute
for((var=0; var<$execute; var++))
    do
        { gramine-direct ./syr2k  2>&1;} >> $ex_path/ResultForGramine.output 2>&1
done

# Warm Up for gramine-sgx
for((var=0; var<$warmUp; var++))
    do
        { gramine-sgx ./syr2k 2>&1;} >> $ex_path/WarmUpForSGX.output 2>&1
done
# Execute
for((var=0; var<$execute; var++))
    do
        { gramine-sgx ./syr2k  2>&1;} >> $ex_path/ResultForSGX.output 2>&1
done
