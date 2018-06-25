#!/bin/bash 

# to install gromacs/5.1.4
# need to install openmpi/2.0.1 fftw/3.3.5 boost/1.62.0 lapack/3.6.1
# assumes maali/1.0.6 is install
module load maali gnu/5.4.0

maali -t cmake -v 3.6.3 -c nectar -w

maali -t lapack -v 3.6.1 -c nectar -w

maali -t openmpi -v 2.0.1 -c nectar -w

maali -t fftw -v 3.3.5 -c nectar -w

maali -t boost -v 1.62.0 -c nectar -w

maali -t gromacs -v 5.1.4 -c nectar -w

