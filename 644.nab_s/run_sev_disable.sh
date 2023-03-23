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
echo start benchmark 644.nab_s
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./nab_s_base.mytest-m64 hkrdenq 1930344093 1000 > hkrdenq.out 2>> hkrdenq.err ;} >> 2.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./nab_s_base.mytest-m64 hkrdenq 1930344093 1000 > hkrdenq.out 2>> hkrdenq.err ;} >> 2.out 2>&1
done
echo finish one execute!
