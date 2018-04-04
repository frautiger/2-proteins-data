#! /bin/bash

wget http://vina.scripps.edu/download/autodock_vina_1_1_2_linux_x86.tgz
tar -xvf autodock_vina_1_1_2_linux_x86.tgz

for f in *.pdbqt; do
    b=`basename $f .pdbqt`
    echo Processing ligand $b
    mkdir -p $b
    autodock_vina_1_1_2_linux_x86/bin/vina --config config.txt --ligand $f --out ${b}/out.pdbqt --log ${b}/log.txt
done
