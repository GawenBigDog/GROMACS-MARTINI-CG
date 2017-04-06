#!/bin/bash

td="./submissionScripts"

declare -a arr=("CPUmin" "CPUnvteq" "CPUnpteq" "CPUrelax" "MDstart" "template.MDdeneb" "template.MDrestart")

title=""
initFile=""
indexFile=""

for file in "${arr[@]}"
do
    sed -e 's/REPLACEME1/'$title'/' $td/$file | sed -e 's/REPLACEME2/"'$initFile'"/' | sed -e 's/REPLACEME3/"'$indexFile'"/' > $file
done

cp $td/launcher.sh .
cp $td/MDextend.sh .
cp $td/MDrestart.sh .

chmod +x launcher.sh
chmod +x MDextend.sh
chmod +x MDrestart.sh 
