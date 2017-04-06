#!/bin/bash

if [ $# -lt 2 ]; then
    echo
    echo "USAGE: ./MDextend.sh [LAST SUCCESSFUL RUN] [FINAL ITERATION]"
    echo
    exit
else
    echo "Simulating..."
fi

# Production run
nmax=$2
nrun=$1

if [ "$nrun" -lt "$nmax" ]; then
    ./launcher.sh $nrun
fi
