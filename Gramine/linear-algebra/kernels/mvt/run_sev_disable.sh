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
echo start benchmark Gramine/linear-algebra/kernels/mvt
echo start warm up for mvt
for((var=0; var<$warmUp; var++))
    do
        ./mvt>> 2.out
done
echo finish one warm up!
echo start execute for mvt
for((var=0; var<$execute; var++))
    do
        ./mvt>> 2.out
done
echo finish one execute!
