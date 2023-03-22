TEXT="$1"
gcc -O3 -I utilities -I stencils/$TEXT utilities/polybench.c stencils/$TEXT/$TEXT.c -DPOLYBENCH_TIME -o $TEXT
echo gcc -O3 -I utilities -I stencils/$TEXT utilities/polybench.c stencils/$TEXT/$TEXT.c -DPOLYBENCH_TIME -o $TEXT
echo cp $TEXT Gramine/stencils/$TEXT/
echo rm $TEXT

