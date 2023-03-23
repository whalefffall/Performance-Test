#!/bin/bash

mkdir Gramine
cd Gramine

mkdir datamining
cd datamining
mkdir correlation
mkdir covariance
cd ..

mkdir linear-algebra
cd linear-algebra
mkdir blas
cd blas
mkdir gemm
mkdir gemver
mkdir gesummv
mkdir symm
mkdir syr2k
mkdir syrk
mkdir trmm
cd ..
mkdir kernels
cd kernels
mkdir 2mm
mkdir 3mm
mkdir atax
mkdir bicg
mkdir doitgen
mkdir mvt
cd ..
mkdir solvers
cd solvers
mkdir cholesky
mkdir durbin
mkdir gramschmidt
mkdir lu
mkdir ludcmp
mkdir trisolv
cd ..
cd ..

mkdir medley
cd medley
mkdir deriche
mkdir floyd-warshall
mkdir nussinov
cd ..

mkdir stencils
cd stencils
mkdir adi
mkdir fdtd-2d
mkdir heat-3d
mkdir jacobi-1d
mkdir jacobi-2d
mkdir seidel-2d
cd ../..


gcc -O3 -I utilities -I datamining/correlation utilities/polybench.c datamining/correlation/correlation.c -DPOLYBENCH_TIME -o correlation -lm
cp correlation Gramine/datamining/correlation/
rm correlation

gcc -O3 -I utilities -I datamining/covariance utilities/polybench.c datamining/covariance/covariance.c -DPOLYBENCH_TIME -o covariance
cp covariance Gramine/datamining/covariance/
rm covariance 

gcc -O3 -I utilities -I linear-algebra/blas/gemm utilities/polybench.c linear-algebra/blas/gemm/gemm.c -DPOLYBENCH_TIME -o gemm
cp gemm Gramine/linear-algebra/blas/gemm/
rm gemm 

gcc -O3 -I utilities -I linear-algebra/blas/gemver utilities/polybench.c linear-algebra/blas/gemver/gemver.c -DPOLYBENCH_TIME -o gemver
cp gemver Gramine/linear-algebra/blas/gemver/
rm gemver

gcc -O3 -I utilities -I linear-algebra/blas/gesummv utilities/polybench.c linear-algebra/blas/gesummv/gesummv.c -DPOLYBENCH_TIME -o gesummv
cp gesummv Gramine/linear-algebra/blas/gesummv/
rm gesummv

gcc -O3 -I utilities -I linear-algebra/blas/symm utilities/polybench.c linear-algebra/blas/symm/symm.c -DPOLYBENCH_TIME -o symm
cp symm Gramine/linear-algebra/blas/symm/
rm symm

gcc -O3 -I utilities -I linear-algebra/blas/syr2k utilities/polybench.c linear-algebra/blas/syr2k/syr2k.c -DPOLYBENCH_TIME -o syr2k
cp syr2k Gramine/linear-algebra/blas/syr2k/
rm syr2k

gcc -O3 -I utilities -I linear-algebra/blas/syrk utilities/polybench.c linear-algebra/blas/syrk/syrk.c -DPOLYBENCH_TIME -o syrk
cp syrk Gramine/linear-algebra/blas/syrk/
rm syrk

gcc -O3 -I utilities -I linear-algebra/blas/trmm utilities/polybench.c linear-algebra/blas/trmm/trmm.c -DPOLYBENCH_TIME -o trmm
cp trmm Gramine/linear-algebra/blas/trmm/
rm trmm

gcc -O3 -I utilities -I linear-algebra/kernels/2mm utilities/polybench.c linear-algebra/kernels/2mm/2mm.c -DPOLYBENCH_TIME -o 2mm
cp 2mm Gramine/linear-algebra/kernels/2mm/
rm 2mm

gcc -O3 -I utilities -I linear-algebra/kernels/3mm utilities/polybench.c linear-algebra/kernels/3mm/3mm.c -DPOLYBENCH_TIME -o 3mm
cp 3mm Gramine/linear-algebra/kernels/3mm/
rm 3mm

gcc -O3 -I utilities -I linear-algebra/kernels/atax utilities/polybench.c linear-algebra/kernels/atax/atax.c -DPOLYBENCH_TIME -o atax
cp atax Gramine/linear-algebra/kernels/atax/
rm atax

gcc -O3 -I utilities -I linear-algebra/kernels/bicg utilities/polybench.c linear-algebra/kernels/bicg/bicg.c -DPOLYBENCH_TIME -o bicg
cp bicg Gramine/linear-algebra/kernels/bicg/
rm bicg

gcc -O3 -I utilities -I linear-algebra/kernels/doitgen utilities/polybench.c linear-algebra/kernels/doitgen/doitgen.c -DPOLYBENCH_TIME -o doitgen
cp doitgen Gramine/linear-algebra/kernels/doitgen/
rm doitgen

gcc -O3 -I utilities -I linear-algebra/kernels/mvt utilities/polybench.c linear-algebra/kernels/mvt/mvt.c -DPOLYBENCH_TIME -o mvt
cp mvt Gramine/linear-algebra/kernels/mvt/
rm mvt

gcc -O3 -I utilities -I linear-algebra/solvers/cholesky utilities/polybench.c linear-algebra/solvers/cholesky/cholesky.c -DPOLYBENCH_TIME -o cholesky -lm
cp cholesky Gramine/linear-algebra/solvers/cholesky/
rm cholesky

gcc -O3 -I utilities -I linear-algebra/solvers/durbin utilities/polybench.c linear-algebra/solvers/durbin/durbin.c -DPOLYBENCH_TIME -o durbin
cp durbin Gramine/linear-algebra/solvers/durbin/
rm durbin

gcc -O3 -I utilities -I linear-algebra/solvers/gramschmidt utilities/polybench.c linear-algebra/solvers/gramschmidt/gramschmidt.c -DPOLYBENCH_TIME -o gramschmidt -lm
cp gramschmidt Gramine/linear-algebra/solvers/gramschmidt/
rm gramschmidt

gcc -O3 -I utilities -I linear-algebra/solvers/lu utilities/polybench.c linear-algebra/solvers/lu/lu.c -DPOLYBENCH_TIME -o lu
cp lu Gramine/linear-algebra/solvers/lu/
rm lu

gcc -O3 -I utilities -I linear-algebra/solvers/ludcmp utilities/polybench.c linear-algebra/solvers/ludcmp/ludcmp.c -DPOLYBENCH_TIME -o ludcmp
cp ludcmp Gramine/linear-algebra/solvers/ludcmp/
rm ludcmp

gcc -O3 -I utilities -I linear-algebra/solvers/trisolv utilities/polybench.c linear-algebra/solvers/trisolv/trisolv.c -DPOLYBENCH_TIME -o trisolv
cp trisolv Gramine/linear-algebra/solvers/trisolv/
rm trisolv

gcc -O3 -I utilities -I medley/deriche utilities/polybench.c medley/deriche/deriche.c -DPOLYBENCH_TIME -o deriche
cp deriche Gramine/medley/deriche/
rm deriche

gcc -O3 -I utilities -I medley/floyd-warshall utilities/polybench.c medley/floyd-warshall/floyd-warshall.c -DPOLYBENCH_TIME -o floyd-warshall
cp floyd-warshall Gramine/medley/floyd-warshall/
rm floyd-warshall

gcc -O3 -I utilities -I medley/nussinov utilities/polybench.c medley/nussinov/nussinov.c -DPOLYBENCH_TIME -o nussinov
cp nussinov Gramine/medley/nussinov/
rm nussinov

gcc -O3 -I utilities -I stencils/adi utilities/polybench.c stencils/adi/adi.c -DPOLYBENCH_TIME -o adi
cp adi Gramine/stencils/adi/
rm adi

gcc -O3 -I utilities -I stencils/fdtd-2d utilities/polybench.c stencils/fdtd-2d/fdtd-2d.c -DPOLYBENCH_TIME -o fdtd-2d
cp fdtd-2d Gramine/stencils/fdtd-2d/
rm fdtd-2d

gcc -O3 -I utilities -I stencils/heat-3d utilities/polybench.c stencils/heat-3d/heat-3d.c -DPOLYBENCH_TIME -o heat-3d
cp heat-3d Gramine/stencils/heat-3d/
rm heat-3d

gcc -O3 -I utilities -I stencils/jacobi-1d utilities/polybench.c stencils/jacobi-1d/jacobi-1d.c -DPOLYBENCH_TIME -o jacobi-1d
cp jacobi-1d Gramine/stencils/jacobi-1d/
rm jacobi-1d

gcc -O3 -I utilities -I stencils/jacobi-2d utilities/polybench.c stencils/jacobi-2d/jacobi-2d.c -DPOLYBENCH_TIME -o jacobi-2d
cp jacobi-2d Gramine/stencils/jacobi-2d/
rm jacobi-2d

gcc -O3 -I utilities -I stencils/seidel-2d utilities/polybench.c stencils/seidel-2d/seidel-2d.c -DPOLYBENCH_TIME -o seidel-2d
cp seidel-2d Gramine/stencils/seidel-2d/
rm seidel-2d