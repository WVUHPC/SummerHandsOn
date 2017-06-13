#!/bin/bash

for i in 2.5 5.0 7.5 10.0
do
    dirname=MASS_$i
    if [ -d $dirname  ] 
    then
        echo "Directory $dirname exists!"
    else
        mkdir $dirname
    fi
    if [ -a $dirname/runjob.pbs ]
    then
        echo "File $dirname/runjob.pbs exists"
    else
        ln -s ../runjob.pbs -t $dirname
    fi
    cat in.crack | sed "s/\(mass\s*1\s*\) 1.0/\1 $i/g" > $dirname/in.crack

done
