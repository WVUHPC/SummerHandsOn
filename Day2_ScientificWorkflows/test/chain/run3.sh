#!/bin/bash

#PBS -q debug
#PBS -m ae
#PBS -M safaramarziganjabad@mix.wvu.edu
#PBS -N test3
#PBS -l nodes=1:ppn=16,mem=16gb
#PBS -l walltime=00:05:00

module load chemistry/namd/ibverbs/2.10
cd /users/safaramarziganjabad/test/chain
NODES=`pwd`/.nodelist
cat $PBS_NODEFILE | perl -e 'while(<>) { chomp; $node{$_}++; } $num = keys %node; print "group main\n"; for (keys %node) { print "host $_ ++cpus $node{$_}\n"; }' > $NODES

 charmrun +p16 ++nodelist $NODES $NAMD helium-3.namd > test3.log
