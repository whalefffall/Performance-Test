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
echo start benchmark 511.povray_r
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./povray_r_base.mytest-m64 SPEC-benchmark-test.ini > SPEC-benchmark-test.stdout 2>> SPEC-benchmark-test.stderr ;} >> 2.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./povray_r_base.mytest-m64 SPEC-benchmark-test.ini > SPEC-benchmark-test.stdout 2>> SPEC-benchmark-test.stderr ;} >> 2.out 2>&1
done
echo finish one execute!
