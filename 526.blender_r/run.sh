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
echo start benchmark 526.blender_r
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./blender_r_base.mytest-m64 cube.blend --render-output cube_ --threads 1 -b -F RAWTGA -s 1 -e 1 -a > cube.1.spec.out 2>> cube.1.spec.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./blender_r_base.mytest-m64 cube.blend --render-output cube_ --threads 1 -b -F RAWTGA -s 1 -e 1 -a > cube.1.spec.out 2>> cube.1.spec.err ;} >> 1.out 2>&1
done

echo finish one command!
