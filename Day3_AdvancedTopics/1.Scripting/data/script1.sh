#!/bin/bash
# This line is a comment and the line above is the proper way of heading a bash script

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
    filename=$1
else
    echo "Enter a filename to process"
    exit 1
fi

if [ ! -f $filename ]
then
    echo "ERROR: File \"$filename\" not found"
    exit 1
fi

residual=`grep "density residual" $filename | awk '{print $3}'`
etotal=`grep "etotal" $filename | awk '{print $2}'`

echo "Residual: $residual   Energy: $etotal"
