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
echo start benchmark 625.x264_s
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./x264_s_base.mytest-m64 --dumpyuv 50 --frames 156 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > run_000-156_x264_s_base.mytest-m64_x264.out 2>> run_000-156_x264_s_base.mytest-m64_x264.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./x264_s_base.mytest-m64 --dumpyuv 50 --frames 156 -o BuckBunny_New.264 BuckBunny.yuv 1280x720 > run_000-156_x264_s_base.mytest-m64_x264.out 2>> run_000-156_x264_s_base.mytest-m64_x264.err ;} >> 1.out 2>&1
done
echo finish one execute!
