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
echo start benchmark 999.specrand_ir
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./specrand_ir_base.mytest-m64 324342 24239 > rand.24239.out 2>> rand.24239.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./specrand_ir_base.mytest-m64 324342 24239 > rand.24239.out 2>> rand.24239.err ;} >> 1.out 2>&1
done

echo finish one command!
