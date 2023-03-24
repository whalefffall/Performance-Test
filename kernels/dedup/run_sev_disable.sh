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
echo start benchmark kernels/dedup
echo start warm up for dedup
for((var=0; var<$warmUp; var++))
    do
        ./dedup -c -p -v -t 1 -i media.dat -o output.dat.ddp>> 2.out
done
echo finish one warm up!
echo start execute for dedup
for((var=0; var<$execute; var++))
    do
        ./dedup -c -p -v -t 1 -i media.dat -o output.dat.ddp>> 2.out
done
rm media.dat
echo finish one execute!
