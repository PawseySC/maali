#!/bin/bash

sudo apt-get update
sudo apt-get -y install xauth x11-apps 
sudo apt-get -y install nano xemacs21 xemacs21-supportel

sudo apt-get -y install bc wget git make 
sudo apt-get -y install gfortran-4.8

sudo apt-get -y install g++-4.8
sudo apt-get -y install environment-modules
sudo apt-get -y install liblapack3

# This installs the openmpi libs that comes with ubuntu package management repository

sudo apt-get -y install build-essential flex bison cmake zlib1g-dev libboost-system-dev libboost-thread-dev libopenmpi-dev openmpi-bin gnuplot libreadline-dev libncurses-dev libxt-dev
 
sudo apt-get -y install qt4-dev-tools libqt4-dev libqt4-opengl-dev freeglut3-dev libqtwebkit-dev 

sudo apt-get -y install libscotch-dev libcgal-dev

#sudo chown -R ubuntu /mnt

wget http://downloads.sourceforge.net/foam/OpenFOAM-3.0.1.tgz?use_mirror=mesh

wget http://downloads.sourceforge.net/foam/ThirdParty-3.0.1.tgz?use_mirror=mesh

mv OpenFOAM-3.0.1.tgz?use_mirror=mesh OpenFOAM-3.0.1.tgz
mv ThirdParty-3.0.1.tgz?use_mirror=mesh ThirdParty-3.0.1.tgz

