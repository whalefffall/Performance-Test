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
echo start benchmark 602.gcc_s
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./sgcc_base.mytest-m64 t1.c -O3 -finline-limit=50000 -o t1.opts-O3_-finline-limit_50000.s > t1.opts-O3_-finline-limit_50000.out 2>> t1.opts-O3_-finline-limit_50000.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./sgcc_base.mytest-m64 t1.c -O3 -finline-limit=50000 -o t1.opts-O3_-finline-limit_50000.s > t1.opts-O3_-finline-limit_50000.out 2>> t1.opts-O3_-finline-limit_50000.err ;} >> 1.out 2>&1
done
echo finish one execute!
