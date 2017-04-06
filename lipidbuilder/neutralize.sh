#!/bin/bash

if [ $# -ne 1 ]; then
    echo
    echo "USAGE: ./neutralize.sh [FILENAME]"
    echo
    exit
else
    echo "Neutralizing..."
fi

FILENAME=$1

cat <<EOF > neutral.mdp
; neutral.mdp - used as input into grompp to generate ions.tpr
integrator = steep         ; Algorithm (steep = steepest descent minimization)
emtol      = 1000.0        ; Stop minimization when the maximum force < 1000.0 kJ/mol/nm
emstep     = 0.01          ; Energy step size
nsteps     = 500           ; Maximum number of (minimization) steps to perform
nstlist    = 1             ; Frequency to update the neighbor list and long range forces
ns_type    = grid          ; Method to determine neighbor list (simple, grid)
rlist      = 1.0           ; Cut-off for making neighbor list (short range forces)
coulombtype= PME           ; Treatment of long range electrostatic interactions
rcoulomb   = 1.0           ; Short-range electrostatic cut-off
rvdw       = 1.0           ; Short-range Van der Waals cut-off
pbc        = xyz           ; Periodic Boundary Conditions (yes/no)
EOF

gmx grompp -f neutral.mdp -c solvated.gro -p $FILENAME.top -o neutral.tpr -maxwarn 1000
gmx genion -s neutral.tpr -o $FILENAME.gro -p $FILENAME.top -pname NA -nname CL -conc 0.15 -neutral

echo "Complete."
