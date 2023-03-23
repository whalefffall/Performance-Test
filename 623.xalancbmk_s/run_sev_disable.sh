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
echo start benchmark 623.xalancbmk_s
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xalancbmk_s_base.mytest-m64 -v test.xml xalanc.xsl > test-test.out 2>> test-test.err ;} >> 2.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./xalancbmk_s_base.mytest-m64 -v test.xml xalanc.xsl > test-test.out 2>> test-test.err ;} >> 2.out 2>&1
done
echo finish one execute!
