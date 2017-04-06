#!/bin/bash

test=$1

rm -f *# *~ *.pdb
rm -f ./*/*# ./*/*~
rm -f slurm-*

if [ $test == "-a" ];then
    rm -f ./*/*.log ./*/*.tpr ./*/*.trr ./*/*.edr ./*/*.xtc ./*/*.cpt
    rm -f ./heat/*.mdp
    rm -f ./equil/*.mdp
    rm -f ./min_*/*.gro
    rm -f ./heat/*.gro
    rm -f ./equil/*.gro
fi
