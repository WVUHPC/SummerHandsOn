#!/bin/bash

i=1
while [ $i -lt 20 ]
do
  mass=`echo "1.0 + ($i * 0.2)" | bc`
  j=1
  while [ $j -lt 20 ]
  do
    sigma=`echo "1.0 + ($j * 0.01)" | bc`

    dirname=MASS_${mass}_SIGMA_${sigma}
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
    cat in.crack | sed "s/\(mass\s*1\s*\) 1.0/\1 $mass/g" | \
    sed "s/pair_coeff\s*\* \* 1.0 1.0 2.5/pair_coeff \* \* $sigma 2.5/g" \
    > $dirname/in.crack

    j=$((j+1))
  done
  i=$((i+1))
done
