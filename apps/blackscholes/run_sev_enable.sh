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
tar -xvf input_simmedium.tar
echo start benchmark apps/blackscholes
echo start warm up for blackscholes
for((var=0; var<$warmUp; var++))
    do
        ./blackscholes 1 in_16K.txt prices.txt>> 1.out
done
echo finish one warm up!
echo start execute for blackscholes
for((var=0; var<$execute; var++))
    do
        ./blackscholes 1 in_16K.txt prices.txt>> 1.out
done
rm in_16K.txt
echo finish one execute!
