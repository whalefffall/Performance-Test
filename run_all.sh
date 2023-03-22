#!/bin/bash
let warmUp=1      #   Default warm up 100 times
let execute=5     #   Default execute 100 times
ab_path=$PWD

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

cd Gramine/datamining/correlation
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/datamining/covariance
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/blas/gemm
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/blas/gemver
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/blas/gesummv
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/blas/symm
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/blas/syr2k
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/blas/syrk
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/blas/trmm
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/kernels/2mm
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/kernels/3mm
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/kernels/atax
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/kernels/bicg
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/kernels/doitgen
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/kernels/mvt
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/solvers/cholesky
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/solvers/durbin
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/solvers/gramschmidt
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/solvers/lu
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/solvers/ludcmp
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/linear-algebra/solvers/trisolv
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/medley/deriche
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/medley/floyd-warshall
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/medley/nussinov
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/stencils/adi
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/stencils/fdtd-2d
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/stencils/heat-3d
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/stencils/jacobi-1d
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/stencils/jacobi-2d
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta
cd Gramine/stencils/seidel-2d
chmod +x run.sh
./run.sh -w $warmUp -e $execute
cd /polybench-c-4.2.1-beta