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
export OMP_NUM_THREADS=1
tar -xvf input_simmedium.tar
echo start benchmark apps/freqmine
echo start warm up for freqmine
for((var=0; var<$warmUp; var++))
    do
        ./freqmine kosarak_500k.dat 410>> 1.out
done
echo finish one warm up!
echo start execute for freqmine
for((var=0; var<$execute; var++))
    do
        ./freqmine kosarak_500k.dat 410>> 1.out
done
rm kosarak_500k.dat
echo finish one execute!
