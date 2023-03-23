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
echo start benchmark 531.deepsjeng_r
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./deepsjeng_r_base.mytest-m64 test.txt > test.out 2>> test.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./deepsjeng_r_base.mytest-m64 test.txt > test.out 2>> test.err ;} >> 1.out 2>&1
done
echo finish one execute!
