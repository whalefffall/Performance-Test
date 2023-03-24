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
echo start benchmark Gramine/datamining/correlation
echo start warm up for correlation
for((var=0; var<$warmUp; var++))
    do
        ./correlation>> 2.out
done
echo finish one warm up!
echo start execute for correlation
for((var=0; var<$execute; var++))
    do
        ./correlation>> 2.out
done
echo finish one execute!
