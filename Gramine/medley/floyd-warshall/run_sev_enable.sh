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
echo start benchmark Gramine/medley/floyd-warshall
echo start warm up for floyd-warshall
for((var=0; var<$warmUp; var++))
    do
        ./floyd-warshall>> 1.out
done
echo finish one warm up!
echo start execute for floyd-warshall
for((var=0; var<$execute; var++))
    do
        ./floyd-warshall>> 1.out
done
echo finish one execute!
