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
echo start benchmark 620.omnetpp_s
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./omnetpp_s_base.mytest-m64 -c General -r 0 > omnetpp.General-0.out 2>> omnetpp.General-0.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./omnetpp_s_base.mytest-m64 -c General -r 0 > omnetpp.General-0.out 2>> omnetpp.General-0.err ;} >> 1.out 2>&1
done
echo finish one execute!
