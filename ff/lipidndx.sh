#!/bin/bash

if [ $# -ne 8 ]; then
    echo
    echo "USAGE: ./lipidndx.sh [GRO COORDINATE FILE] [STARTGROUP] [Number of Lipids] [SOLVENT START] [Number of Solvents] [LIPID GROUP] [SOLVENT GROUP] [FILENAME]"
    echo
    exit
else
    echo "Building GROMACS index file..."
fi

GROFILE=$1
LIPIDnA=$2
LIPIDnB=`expr $LIPIDnA + $3 - 1`
SOLVENTnA=$4
SOLVENTnB=`expr $SOLVENTnA + $5 - 1`
LIPIDGROUP=$6
SOLVENTGROUP=$7
FILENAME=$8

LIPIDCOUNT=`expr $LIPIDnB - $LIPIDnA`
LIPIDnC=`expr $SOLVENTnB + 2`
LIPIDnD=`expr $LIPIDnC + $3 - 1`
SOLVENTnC=`expr $LIPIDnD + 1`
SOLVENTnD=`expr $SOLVENTnC + $5 - 1`

rm tmp*
rm lipid.ndx

# Let's define the Lipids group
rm tmp

n=$LIPIDnA
nmax=$LIPIDnB
while [ $n -le $nmax ];do
    echo $n >> tmp
    n=`expr $n + 1`
done

n=$LIPIDnC
nmax=$LIPIDnD
while [ $n -le $nmax ];do
    echo $n >> tmp
    n=`expr $n + 1`
done

printlist=`awk '{print $1}' tmp`
echo $printlist > tmp2
lipidlist=`sed "s/ /|/g" tmp2`

# Let's define the Solvent group
rm tmp

n=$SOLVENTnA
nmax=$SOLVENTnB
while [ $n -le $nmax ];do
    echo $n >> tmp
    n=`expr $n + 1`
done

n=$SOLVENTnC
nmax=$SOLVENTnD
while [ $n -le $nmax ];do
    echo $n >> tmp
    n=`expr $n + 1`
done

printlist=`awk '{print $1}' tmp`
echo $printlist > tmp2
solvent=`sed "s/ /|/g" tmp2`

gmx make_ndx -f $GROFILE -o $FILENAME.ndx <<EOF
   $lipidlist
   $solvent
   name $LIPIDGROUP Lipids
   name $SOLVENTGROUP Solvent
   $1|$LIPIDGROUP
   q
EOF

rm tmp*

grep ] $FILENAME.ndx
