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
													    cd ./621.wrf_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 621.wrf_s
													    cd ./623.xalancbmk_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 623.xalancbmk_s
													    cd ./625.x264_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 625.x264_s
													    cd ./627.cam4_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 627.cam4_s
													    cd ./628.pop2_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 628.pop2_s
													    cd ./631.deepsjeng_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 631.deepsjeng_s
													    cd ./638.imagick_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 638.imagick_s
													    cd ./641.leela_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 641.leela_s
													    cd ./644.nab_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 644.nab_s
													    cd ./648.exchange2_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 648.exchange2_s
													    cd ./649.fotonik3d_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 649.fotonik3d_s
													    cd ./654.roms_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 654.roms_s
													    cd ./657.xz_s
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 657.xz_s
													    cd ./996.specrand_fs
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 996.specrand_fs
													    cd ./997.specrand_fr
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 997.specrand_fr
													    cd ./998.specrand_is
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 998.specrand_is
													    cd ./999.specrand_ir
													    rm 1.out
													    ./run_sev_enable.sh -w $warmUp -e $execute
													    cd ..
													    echo finish benchmark 999.specrand_ir
