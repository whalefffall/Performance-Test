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
echo start benchmark Gramine/linear-algebra/blas/syr2k
echo start warm up for syr2k
for((var=0; var<$warmUp; var++))
    do
        ./syr2k>> 1.out
done
echo finish one warm up!
echo start execute for syr2k
for((var=0; var<$execute; var++))
    do
        ./syr2k>> 1.out
done
echo finish one execute!
