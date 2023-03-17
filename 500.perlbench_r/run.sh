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
echo start benchmark 500.perlbench_r
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./perlbench_r_base.mytest-m64 -I. -I./lib makerand.pl > makerand.out 2>> makerand.err ;} >> 2.out 2>&1
done
echo finish one warm up!
echo start execute command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./perlbench_r_base.mytest-m64 -I. -I./lib makerand.pl > makerand.out 2>> makerand.err ;} >> 2.out 2>&1
done

echo finish one command!
echo start warm up for command 2
for((var=0; var<$warmUp; var++))
    do
        { time -p ./perlbench_r_base.mytest-m64 -I. -I./lib test.pl > test.out 2>> test.err ;} >> 2.out 2>&1
done
echo finish one warm up!
echo start execute command 2
for((var=0; var<$execute; var++))
    do
        { time -p ./perlbench_r_base.mytest-m64 -I. -I./lib test.pl > test.out 2>> test.err ;} >> 2.out 2>&1
done

echo finish one command!
