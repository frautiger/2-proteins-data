#! /bin/bash

wget http://vina.scripps.edu/download/autodock_vina_1_1_2_linux_x86.tgz
tar -xvf autodock_vina_1_1_2_linux_x86.tgz

mkdir -p bAe
mkdir -p bAtp

for f in *.pdbqt; do
    b=`basename $f .pdbqt`
    echo Processing ligand $b protein bAe     
    autodock_vina_1_1_2_linux_x86/bin/vina --config config-bAe-mkz.txt --ligand $f --out bAe/bAe-${b}.pdbqt 
#--out bAe/bAe-${b}.pdb 
--log bAe/bAe-${b}.txt

    echo Processing ligand $b protein bAtp    
    autodock_vina_1_1_2_linux_x86/bin/vina --config config-bAtp-mkz.txt --ligand $f --out bAtp/bAtp-${b}.pdbqt 
#--out bAtp/bAtp-${b}.pdb 
--log bAtp/bAtp-${b}.txt

done
