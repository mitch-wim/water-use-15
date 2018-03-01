#!/bin/bash  

# add bash-relevant commands to the PATH (on some computers they aren't available until this fix)
PATH=$R_SHELL_PATH_PREFIX:$PATH

# read in the arguments describing how the files should be named
geo=$1
raw=$2
simple=$3
quantized=$4

# convert
echo Topojsonifying...
geo2topo counties=$geo -o $raw

# simplify
echo Simplifying...
toposimplify -s 1e-8 -f $raw -o $simple

# quantize (store as integers, scale later)
echo Quantizing...
topoquantize 1e8 $simple -o $quantized

echo Done.
