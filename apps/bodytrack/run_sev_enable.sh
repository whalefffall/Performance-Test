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
echo start benchmark apps/bodytrack
echo start warm up for bodytrack
for((var=0; var<$warmUp; var++))
    do
        ./bodytrack sequenceB_2 4 2 2000 5 0 1>> 1.out
done
echo finish one warm up!
echo start execute for bodytrack
for((var=0; var<$execute; var++))
    do
        ./bodytrack sequenceB_2 4 2 2000 5 0 1>> 1.out
done
rm -r sequenceB_2/
echo finish one execute!
