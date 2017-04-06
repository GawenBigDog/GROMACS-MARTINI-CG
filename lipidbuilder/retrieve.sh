#!/bin/bash

if [ $# -ne 1 ]; then
    echo
    echo "USAGE: ./retrieve.sh [PATH]"
    echo
    exit
else
    echo "Retrieving files..."
fi

LOCATION=$1

cp $LOCATION/*.itp ./ff
cp $LOCATION/*.itp ../simulation_package/ff
