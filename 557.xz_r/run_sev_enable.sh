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
echo start benchmark 557.xz_r
# Bare Ubuntu
echo start warm up for command 1
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1548636 1555348 0 > cpu2006docs.tar-4-0.out 2>> cpu2006docs.tar-4-0.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 1
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1548636 1555348 0 > cpu2006docs.tar-4-0.out 2>> cpu2006docs.tar-4-0.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 2
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1462248 -1 1 > cpu2006docs.tar-4-1.out 2>> cpu2006docs.tar-4-1.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 2
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1462248 -1 1 > cpu2006docs.tar-4-1.out 2>> cpu2006docs.tar-4-1.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 3
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1428548 -1 2 > cpu2006docs.tar-4-2.out 2>> cpu2006docs.tar-4-2.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 3
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1428548 -1 2 > cpu2006docs.tar-4-2.out 2>> cpu2006docs.tar-4-2.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 4
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1034828 -1 3e > cpu2006docs.tar-4-3e.out 2>> cpu2006docs.tar-4-3e.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 4
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1034828 -1 3e > cpu2006docs.tar-4-3e.out 2>> cpu2006docs.tar-4-3e.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 5
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1061968 -1 4 > cpu2006docs.tar-4-4.out 2>> cpu2006docs.tar-4-4.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 5
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1061968 -1 4 > cpu2006docs.tar-4-4.out 2>> cpu2006docs.tar-4-4.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 6
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1034588 -1 4e > cpu2006docs.tar-4-4e.out 2>> cpu2006docs.tar-4-4e.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 6
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 4 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 1034588 -1 4e > cpu2006docs.tar-4-4e.out 2>> cpu2006docs.tar-4-4e.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 7
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 650156 -1 0 > cpu2006docs.tar-1-0.out 2>> cpu2006docs.tar-1-0.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 7
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 650156 -1 0 > cpu2006docs.tar-1-0.out 2>> cpu2006docs.tar-1-0.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 8
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 639996 -1 1 > cpu2006docs.tar-1-1.out 2>> cpu2006docs.tar-1-1.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 8
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 639996 -1 1 > cpu2006docs.tar-1-1.out 2>> cpu2006docs.tar-1-1.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 9
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 637616 -1 2 > cpu2006docs.tar-1-2.out 2>> cpu2006docs.tar-1-2.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 9
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 637616 -1 2 > cpu2006docs.tar-1-2.out 2>> cpu2006docs.tar-1-2.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 10
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 628996 -1 3e > cpu2006docs.tar-1-3e.out 2>> cpu2006docs.tar-1-3e.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 10
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 628996 -1 3e > cpu2006docs.tar-1-3e.out 2>> cpu2006docs.tar-1-3e.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 11
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 631912 -1 4 > cpu2006docs.tar-1-4.out 2>> cpu2006docs.tar-1-4.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 11
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 631912 -1 4 > cpu2006docs.tar-1-4.out 2>> cpu2006docs.tar-1-4.err ;} >> 1.out 2>&1
done
echo finish one execute!
echo start warm up for command 12
for((var=0; var<$warmUp; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 629064 -1 4e > cpu2006docs.tar-1-4e.out 2>> cpu2006docs.tar-1-4e.err ;} >> 1.out 2>&1
done
echo finish one warm up!
echo start execute for command 12
for((var=0; var<$execute; var++))
    do
        { time -p ./xz_r_base.mytest-m64 cpu2006docs.tar.xz 1 055ce243071129412e9dd0b3b69a21654033a9b723d874b2015c774fac1553d9713be561ca86f74e4f16f22e664fc17a79f30caa5ad2c04fbc447549c2810fae 629064 -1 4e > cpu2006docs.tar-1-4e.out 2>> cpu2006docs.tar-1-4e.err ;} >> 1.out 2>&1
done
echo finish one execute!
