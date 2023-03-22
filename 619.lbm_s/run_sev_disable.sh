#!/bin/bash 
let warmUp=5
let execute=10
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
echo start benchmark 619.lbm_s
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./lbm_s_base.mytest-m64 20 reference.dat 0 1 200_200_260_ldc.of > lbm.out 2>> lbm.err ;} >> 2.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./lbm_s_base.mytest-m64 20 reference.dat 0 1 200_200_260_ldc.of > lbm.out 2>> lbm.err ;} >> 2.out 2>&1
done
echo finish one execute!
