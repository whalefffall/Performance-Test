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
echo start benchmark kernels/streamcluster
echo start warm up for streamcluster
for((var=0; var<$warmUp; var++))
    do
        ./streamcluster 10 20 64 8192 8192 1000 none output.txt 1>> 2.out
done
echo finish one warm up!
echo start execute for streamcluster
for((var=0; var<$execute; var++))
    do
        ./streamcluster 10 20 64 8192 8192 1000 none output.txt 1>> 2.out
done
echo finish one execute!
