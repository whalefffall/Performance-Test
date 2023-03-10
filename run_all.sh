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
cd ./500.perlbench_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./502.gcc_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./503.bwaves_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./505.mcf_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./507.cactuBSSN_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./508.namd_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./510.parest_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./511.povray_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./519.lbm_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./520.omnetpp_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./521.wrf_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./523.xalancbmk_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./525.x264_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./526.blender_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./527.cam4_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./531.deepsjeng_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./538.imagick_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./541.leela_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./544.nab_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./548.exchange2_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./549.fotonik3d_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./554.roms_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./557.xz_r
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./600.perlbench_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./602.gcc_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./603.bwaves_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./605.mcf_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./607.cactuBSSN_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./619.lbm_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./620.omnetpp_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./621.wrf_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./623.xalancbmk_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./625.x264_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./627.cam4_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./628.pop2_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./631.deepsjeng_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./638.imagick_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./641.leela_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./644.nab_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./648.exchange2_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./649.fotonik3d_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./654.roms_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./657.xz_s
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./996.specrand_fs
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./997.specrand_fr
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./998.specrand_is
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
cd ./999.specrand_ir
./run.sh  -w $warmUp -e $execute
cd ..
echo finish one benchmark!
