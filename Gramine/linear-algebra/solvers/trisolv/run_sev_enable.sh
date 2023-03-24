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
echo start benchmark Gramine/linear-algebra/solvers/trisolv
echo start warm up for trisolv
for((var=0; var<$warmUp; var++))
    do
        ./trisolv>> 1.out
done
echo finish one warm up!
echo start execute for trisolv
for((var=0; var<$execute; var++))
    do
        ./trisolv>> 1.out
done
echo finish one execute!
