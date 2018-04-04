#! /bin/bash

wget http://vina.scripps.edu/download/autodock_vina_1_1_2_linux_x86.tgz
tar -xvf autodock_vina_1_1_2_linux_x86.tgz

for f in *.pdbqt; do
    b=`basename $f .pdbqt`
    echo Processing ligand $b protein bAe 
    autodock_vina_1_1_2_linux_x86/bin/vina --config config-bAe-mkz.txt --ligand $f --out bAe-${b}.pdbqt --log bAe-${b}.txt

done
