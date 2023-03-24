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
cd /test/poly/Gramine/linear-algebra/blas/syrk
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/blas/syrk syrk
cd /test/poly/Gramine/linear-algebra/blas/gesummv
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/blas/gesummv gesummv
cd /test/poly/Gramine/linear-algebra/blas/trmm
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/blas/trmm trmm
cd /test/poly/Gramine/linear-algebra/blas/symm
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/blas/symm symm
cd /test/poly/Gramine/linear-algebra/blas/gemm
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/blas/gemm gemm
cd /test/poly/Gramine/linear-algebra/blas/syr2k
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/blas/syr2k syr2k
cd /test/poly/Gramine/linear-algebra/blas/gemver
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/blas/gemver gemver
cd /test/poly/Gramine/linear-algebra/kernels/bicg
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/kernels/bicg bicg
cd /test/poly/Gramine/linear-algebra/kernels/3mm
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/kernels/3mm 3mm
cd /test/poly/Gramine/linear-algebra/kernels/mvt
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/kernels/mvt mvt
cd /test/poly/Gramine/linear-algebra/kernels/atax
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/kernels/atax atax
cd /test/poly/Gramine/linear-algebra/kernels/2mm
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/kernels/2mm 2mm
cd /test/poly/Gramine/linear-algebra/kernels/doitgen
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/kernels/doitgen doitgen
cd /test/poly/Gramine/linear-algebra/solvers/durbin
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/solvers/durbin durbin
cd /test/poly/Gramine/linear-algebra/solvers/trisolv
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/solvers/trisolv trisolv
cd /test/poly/Gramine/linear-algebra/solvers/cholesky
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/solvers/cholesky cholesky
cd /test/poly/Gramine/linear-algebra/solvers/gramschmidt
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/solvers/gramschmidt gramschmidt
cd /test/poly/Gramine/linear-algebra/solvers/lu
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/solvers/lu lu
cd /test/poly/Gramine/linear-algebra/solvers/ludcmp
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/linear-algebra/solvers/ludcmp ludcmp
cd /test/poly/Gramine/stencils/fdtd-2d
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/stencils/fdtd-2d fdtd-2d
cd /test/poly/Gramine/stencils/jacobi-1d
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/stencils/jacobi-1d jacobi-1d
cd /test/poly/Gramine/stencils/jacobi-2d
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/stencils/jacobi-2d jacobi-2d
cd /test/poly/Gramine/stencils/adi
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/stencils/adi adi
cd /test/poly/Gramine/stencils/seidel-2d
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/stencils/seidel-2d seidel-2d
cd /test/poly/Gramine/stencils/heat-3d
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/stencils/heat-3d heat-3d
cd /test/poly/Gramine/medley/deriche
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/medley/deriche deriche
cd /test/poly/Gramine/medley/floyd-warshall
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/medley/floyd-warshall floyd-warshall
cd /test/poly/Gramine/medley/nussinov
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/medley/nussinov nussinov
cd /test/poly/Gramine/datamining/correlation
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/datamining/correlation correlation
cd /test/poly/Gramine/datamining/covariance
./run_sev_disable.sh -w $warmUp -e $execute
cd /test/poly
echo finish benchmark Gramine/datamining/covariance covariance
