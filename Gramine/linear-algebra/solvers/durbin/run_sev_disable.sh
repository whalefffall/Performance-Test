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
echo start benchmark Gramine/linear-algebra/solvers/durbin
echo start warm up for durbin
for((var=0; var<$warmUp; var++))
    do
        ./durbin>> 2.out
done
echo finish one warm up!
echo start execute for durbin
for((var=0; var<$execute; var++))
    do
        ./durbin>> 2.out
done
echo finish one execute!
