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
cd ./500.perlbench_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 500.perlbench_r
cd ./502.gcc_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 502.gcc_r
cd ./503.bwaves_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 503.bwaves_r
cd ./505.mcf_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 505.mcf_r
cd ./507.cactuBSSN_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 507.cactuBSSN_r
cd ./508.namd_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 508.namd_r
cd ./510.parest_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 510.parest_r
cd ./511.povray_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 511.povray_r
cd ./519.lbm_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 519.lbm_r
cd ./520.omnetpp_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 520.omnetpp_r
cd ./521.wrf_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 521.wrf_r
cd ./523.xalancbmk_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 523.xalancbmk_r
cd ./525.x264_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 525.x264_r
cd ./526.blender_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 526.blender_r
cd ./527.cam4_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 527.cam4_r
cd ./531.deepsjeng_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 531.deepsjeng_r
cd ./538.imagick_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 538.imagick_r
cd ./541.leela_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 541.leela_r
cd ./544.nab_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 544.nab_r
cd ./548.exchange2_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 548.exchange2_r
cd ./549.fotonik3d_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 549.fotonik3d_r
cd ./554.roms_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 554.roms_r
cd ./557.xz_r
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 557.xz_r
cd ./600.perlbench_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 600.perlbench_s
cd ./602.gcc_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 602.gcc_s
cd ./603.bwaves_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 603.bwaves_s
cd ./605.mcf_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 605.mcf_s
cd ./607.cactuBSSN_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 607.cactuBSSN_s
cd ./619.lbm_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 619.lbm_s
cd ./620.omnetpp_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 620.omnetpp_s
cd ./621.wrf_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 621.wrf_s
cd ./623.xalancbmk_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 623.xalancbmk_s
cd ./625.x264_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 625.x264_s
cd ./627.cam4_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 627.cam4_s
cd ./628.pop2_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 628.pop2_s
cd ./631.deepsjeng_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 631.deepsjeng_s
cd ./638.imagick_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 638.imagick_s
cd ./641.leela_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 641.leela_s
cd ./644.nab_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 644.nab_s
cd ./648.exchange2_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 648.exchange2_s
cd ./649.fotonik3d_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 649.fotonik3d_s
cd ./654.roms_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 654.roms_s
cd ./657.xz_s
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 657.xz_s
cd ./996.specrand_fs
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 996.specrand_fs
cd ./997.specrand_fr
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 997.specrand_fr
cd ./998.specrand_is
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 998.specrand_is
cd ./999.specrand_ir
./run_sev_disable.sh -w $warmUp -e $execute
cd ..
echo finish benchmark 999.specrand_ir
