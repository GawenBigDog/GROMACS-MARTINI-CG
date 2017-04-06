#!/bin/bash

die () {
    echo >&1 "$@"
    exit 1
}

[ "$#" -eq 1 ] || die "Usage: launcher.sh nrun"

prev=$1
nrun=`expr $prev + 1`

echo $prev
echo $nrun

awk -v nrun=$nrun '{s=substr($0,1,5);if(s=="nrun=")printf("nrun=%d\n", nrun); else print}' template.MDdeneb | awk -v prev=$prev '{s=substr($0,1,5);if(s=="prev=")printf("prev=%d\n", prev); else print}' > MDdeneb

sleep 5

sbatch MDdeneb
