#!/bin/bash

if [ $# -eq 0 ]; then
    echo
    echo "USAGE: ./buildlipid.sh [FILENAME] [Protein PDB]"
    echo
    exit
fi

FILENAME=$1
PDB=$2

rm mff_membrane.* solvated.*

pipc=40
popc=666
dppc=242
papc=303
pepc=162
pgpc=363
pupc=20
prpc=202
pipe=21
pope=62
dppe=21
pape=62
pqpe=21
pgpe=104
pupe=228
prpe=581
pipa=1
popa=28
pgpa=24
prpa=4
pips=0
pops=0
paps=0
pqps=0
pgps=94
prps=187
pipi=0
popi=38
pvpi=38
papi=150
pupi=0
jppg=0
pipg=0
popg=3
oppg=3
dppg=4
papg=0
pgpg=1
opc=6
vpc=6
ppc=51
ipc=0
posm=48
pvsm=48
dpsm=528
pgsm=24
pnsm=144
dpce=53
pnce=0
dpg3=12
png3=1
chol=5532

if [ $# -lt 2 ];then
    asinine.py -center -l PIPC:$pipc -l POPC:$popc -l DPPC:$dppc -l PAPC:$papc -l PEPC:$pepc -l PGPC:$pgpc -l PUPC:$pupc -l PRPC:$prpc -l PIPE:$pipe -l POPE:$pope -l DPPE:$dppe -l PAPE:$pape -l PQPE:$pqpe -l PGPE:$pgpe -l PUPE:$pupe -l PRPE:$prpe -l PIPA:$pipa -l POPA:$popa -l PGPA:$pgpa -l PRPA:$prpa -l PIPS:$pips -l POPS:$pops -l PAPS:$paps -l PQPS:$pqps -l PGPS:$pgps -l PRPS:$prps -l PIPI:$pipi -l POPI:$popi -l PVPI:$pvpi -l PAPI:$papi -l PUPI:$pupi -l JPPG:$jppg -l PIPG:$pipg -l POPG:$popg -l OPPG:$oppg -l DPPG:$dppg -l PAPG:$papg -l PGPG:$pgpg -l OPC:$opc -l VPC:$vpc -l PPC:$ppc -l IPC:$ipc -l POSM:$posm -l PVSM:$pvsm -l DPSM:$dpsm -l PGSM:$pgsm -l PNSM:$pnsm -l DPCE:$dpce -l PNCE:$pnce -l DPG3:$dpg3 -l PNG3:$png3 -l CHOL:$chol -sol PW -pbc rectangular -x 23 -y 23 -z 23 -o solvated.gro -p solvated.top
else
    asinine.py -f $PDB -center -l PIPC:$pipc -l POPC:$popc -l DPPC:$dppc -l PAPC:$papc -l PEPC:$pepc -l PGPC:$pgpc -l PUPC:$pupc -l PRPC:$prpc -l PIPE:$pipe -l POPE:$pope -l DPPE:$dppe -l PAPE:$pape -l PQPE:$pqpe -l PGPE:$pgpe -l PUPE:$pupe -l PRPE:$prpe -l PIPA:$pipa -l POPA:$popa -l PGPA:$pgpa -l PRPA:$prpa -l PIPS:$pips -l POPS:$pops -l PAPS:$paps -l PQPS:$pqps -l PGPS:$pgps -l PRPS:$prps -l PIPI:$pipi -l POPI:$popi -l PVPI:$pvpi -l PAPI:$papi -l PUPI:$pupi -l JPPG:$jppg -l PIPG:$pipg -l POPG:$popg -l OPPG:$oppg -l DPPG:$dppg -l PAPG:$papg -l PGPG:$pgpg -l OPC:$opc -l VPC:$vpc -l PPC:$ppc -l IPC:$ipc -l POSM:$posm -l PVSM:$pvsm -l DPSM:$dpsm -l PGSM:$pgsm -l PNSM:$pnsm -l DPCE:$dpce -l PNCE:$pnce -l DPG3:$dpg3 -l PNG3:$png3 -l CHOL:$chol -sol PW -pbc rectangular -x 23 -y 23 -z 23 -dm 2.2 -ring -o solvated.gro -p solvated.top
fi

mv solvated.gro tmp.gro

cp ../ff/include.top tmp.top
grep -v include solvated.top >> tmp.top

sed "s/.*INSANE.*/$FILENAME/" tmp.top > $FILENAME.top
sed "s/.*INSANE.*/$FILENAME/" tmp.gro > solvated.gro

exit
