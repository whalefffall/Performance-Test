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
echo start benchmark apps/raytrace
echo start warm up for rtview
for((var=0; var<$warmUp; var++))
    do
        ./rtview happy_buddha.obj -automove -nthreads 1 -frames 3 -res 960 540>> 2.out
done
echo finish one warm up!
echo start execute for rtview
for((var=0; var<$execute; var++))
    do
        ./rtview happy_buddha.obj -automove -nthreads 1 -frames 3 -res 960 540>> 2.out
done
rm happy_buddha.obj
echo finish one execute!
