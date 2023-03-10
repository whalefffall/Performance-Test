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
echo start benchmark 508.namd_r
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./namd_r_base.mytest-m64 --input apoa1.input --iterations 1 --output apoa1.test.output > namd.out 2>> namd.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./namd_r_base.mytest-m64 --input apoa1.input --iterations 1 --output apoa1.test.output > namd.out 2>> namd.err ;} >> 1.out 2>&1
done

echo finish one command!
