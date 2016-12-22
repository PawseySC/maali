#!/bin/bash 

# make sure /mnt is owned by ubuntu
sudo chown -R ubuntu /mnt

#additional packages to install
sudo apt install -y ffmpeg
sudo apt install -y libjpeg-dev 
sudo apt install -y libpng12-dev
sudo apt install -y python2.7-dev
sudo apt install -y python-dev

# to install lammps 
# need to install these dependent applications/libraries 
# cmake is used to install lapack 
# lapack is needed for fftw-parallel
# lapack/3.6.1 openmpi/2.0.1 fftw-parallel/3.3.5  
# assumes maali/1.0.6 is install

module load maali gnu/5.4.0

maali -t cmake -v 3.6.3 -c nectar -w

maali -t lapack -v 3.6.1 -c nectar -w

maali -t openmpi -v 2.0.1 -c nectar -w

maali -t fftw-parallel -v 3.3.5 -c nectar -w

maali -t lammps -v 18Oct16 -c nectar -w

cp Run_lammps $HOME/.

