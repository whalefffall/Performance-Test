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
echo start benchmark 600.perlbench_s
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./perlbench_s_base.mytest-m64 -I. -I./lib makerand.pl > makerand.out 2>> makerand.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./perlbench_s_base.mytest-m64 -I. -I./lib makerand.pl > makerand.out 2>> makerand.err ;} >> 1.out 2>&1
done

echo finish one command!
echo start warm up for command 2
for((var=0; var<$warmUp; var++))
    do
        { time -p ./perlbench_s_base.mytest-m64 -I. -I./lib test.pl > test.out 2>> test.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute command 2
for((var=0; var<$execute; var++))
    do
        { time -p ./perlbench_s_base.mytest-m64 -I. -I./lib test.pl > test.out 2>> test.err ;} >> 1.out 2>&1
done

echo finish one command!
