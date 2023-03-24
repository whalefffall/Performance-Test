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
export IM_CONCURRENCY=1
tar -xvf input_simmedium.tar
echo start benchmark apps/vips
echo start warm up for vips
for((var=0; var<$warmUp; var++))
    do
        ./vips im_benchmark vulture_2336x2336.v output.v>> 2.out
done
echo finish one warm up!
echo start execute for vips
for((var=0; var<$execute; var++))
    do
        ./vips im_benchmark vulture_2336x2336.v output.v>> 2.out
done
rm vulture_2336x2336.v
echo finish one execute!
