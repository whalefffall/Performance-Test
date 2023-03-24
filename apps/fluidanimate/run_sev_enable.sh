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
echo start benchmark apps/fluidanimate
echo start warm up for fluidanimate
for((var=0; var<$warmUp; var++))
    do
        ./fluidanimate 1 5 in_100K.fluid out.fluid>> 1.out
done
echo finish one warm up!
echo start execute for fluidanimate
for((var=0; var<$execute; var++))
    do
        ./fluidanimate 1 5 in_100K.fluid out.fluid>> 1.out
done
rm in_100K.fluid
echo finish one execute!
