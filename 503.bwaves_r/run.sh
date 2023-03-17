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
echo start benchmark 503.bwaves_r
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./bwaves_r_base.mytest-m64 bwaves_1 < bwaves_1.in > bwaves_1.out 2>> bwaves_1.err ;} >> 2.out 2>&1
done
echo finish one warm up!
echo start execute command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./bwaves_r_base.mytest-m64 bwaves_1 < bwaves_1.in > bwaves_1.out 2>> bwaves_1.err ;} >> 2.out 2>&1
done

echo finish one command!
echo start warm up for command 2
for((var=0; var<$warmUp; var++))
    do
        { time -p ./bwaves_r_base.mytest-m64 bwaves_2 < bwaves_2.in > bwaves_2.out 2>> bwaves_2.err ;} >> 2.out 2>&1
done
echo finish one warm up!
echo start execute command 2
for((var=0; var<$execute; var++))
    do
        { time -p ./bwaves_r_base.mytest-m64 bwaves_2 < bwaves_2.in > bwaves_2.out 2>> bwaves_2.err ;} >> 2.out 2>&1
done

echo finish one command!
