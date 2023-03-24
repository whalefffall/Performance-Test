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
echo start benchmark apps/facesim
echo start warm up for facesim
for((var=0; var<$warmUp; var++))
    do
        ./facesim -timing -threads 1>> 1.out
done
echo finish one warm up!
echo start execute for facesim
for((var=0; var<$execute; var++))
    do
        ./facesim -timing -threads 1>> 1.out
done
rm -r Face_Data/
echo finish one execute!
