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
echo start benchmark kernels/canneal
echo start warm up for canneal
for((var=0; var<$warmUp; var++))
    do
        ./canneal 1 15000 2000 200000.nets 64>> 2.out
done
echo finish one warm up!
echo start execute for canneal
for((var=0; var<$execute; var++))
    do
        ./canneal 1 15000 2000 200000.nets 64>> 2.out
done
rm 200000.nets
echo finish one execute!
