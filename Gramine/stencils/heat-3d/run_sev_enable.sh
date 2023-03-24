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
echo start benchmark Gramine/stencils/heat-3d
echo start warm up for heat-3d
for((var=0; var<$warmUp; var++))
    do
        ./heat-3d>> 1.out
done
echo finish one warm up!
echo start execute for heat-3d
for((var=0; var<$execute; var++))
    do
        ./heat-3d>> 1.out
done
echo finish one execute!
