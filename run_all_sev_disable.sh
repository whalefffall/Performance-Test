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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/test/parsec/lib
cd /test/parsec/apps/ferret
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/ferret ferret
cd /test/parsec/apps/swaptions
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/swaptions swaptions
cd /test/parsec/apps/facesim
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/facesim facesim
cd /test/parsec/apps/fluidanimate
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/fluidanimate fluidanimate
cd /test/parsec/apps/freqmine
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/freqmine freqmine
cd /test/parsec/apps/raytrace
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/raytrace rtview
cd /test/parsec/apps/vips
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/vips vips
cd /test/parsec/apps/blackscholes
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/blackscholes blackscholes
cd /test/parsec/apps/bodytrack
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/bodytrack bodytrack
cd /test/parsec/apps/x264
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark apps/x264 x264
cd /test/parsec/kernels/canneal
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark kernels/canneal canneal
cd /test/parsec/kernels/dedup
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark kernels/dedup dedup
cd /test/parsec/kernels/streamcluster
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/parsec
echo finish benchmark kernels/streamcluster streamcluster
