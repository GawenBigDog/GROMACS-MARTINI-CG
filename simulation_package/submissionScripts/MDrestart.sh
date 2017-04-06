#!/bin/bash

if [ $# -lt 2 ]; then
    echo
    echo "USAGE: ./MDrestart.sh [RESTART WHICH MD RUN] [FINAL ITERATION]"
    echo
    exit
else
    echo "Simulating..."
fi

# Production run
nmax=$2
nrun=$1

awk -v nrun=$nrun '{s=substr($0,1,5);if(s=="nrun=")printf("nrun=%d\n", nrun); else print}' template.MDrestart > MDrestart

sleep 5

sbatch MDrestart
