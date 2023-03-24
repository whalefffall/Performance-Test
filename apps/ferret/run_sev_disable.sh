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
echo start benchmark apps/ferret
echo start warm up for ferret
for((var=0; var<$warmUp; var++))
    do
        ./ferret corel lsh queries 10 20 1 output.txt>> 2.out
done
echo finish one warm up!
echo start execute for ferret
for((var=0; var<$execute; var++))
    do
        ./ferret corel lsh queries 10 20 1 output.txt>> 2.out
done
rm -r corel/
echo finish one execute!
