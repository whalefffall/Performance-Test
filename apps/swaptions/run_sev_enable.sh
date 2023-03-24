#!/bin/bash 
let warmUp=50
let execute=100
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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/test/parsec/lib
echo start benchmark apps/swaptions
echo start warm up for swaptions
for((var=0; var<$warmUp; var++))
    do
        ./swaptions -ns 32 -sm 20000 -nt 1>> 1.out
done
echo finish one warm up!
echo start execute for swaptions
for((var=0; var<$execute; var++))
    do
        ./swaptions -ns 32 -sm 20000 -nt 1>> 1.out
done
echo finish one execute!
