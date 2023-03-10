#!/bin/bash 
let warmUp=2
let execute=3
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
echo start benchmark 527.cam4_r
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./cam4_r_base.mytest-m64 > cam4_r_base.mytest-m64.txt 2>> cam4_r_base.mytest-m64.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./cam4_r_base.mytest-m64 > cam4_r_base.mytest-m64.txt 2>> cam4_r_base.mytest-m64.err ;} >> 1.out 2>&1
done

echo finish one command!
