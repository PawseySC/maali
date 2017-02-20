#!/bin/bash 

# make sure /mnt is owned by ubuntu
sudo chown -R ubuntu /mnt

#additional packages to install
# redhat-lsb is needed for lmutil (check status of license)
sudo yum install -y redhat-lsb
# need p7 zip to unzip abaqus source
sudo yum install -y p7zip zip unzip
# need csh install to run installer
sudo yum install -y tcsh
# need libc.co.6 to run installer
sudo yum install glibc-static

#sudo yum install -y libjpeg-dev 
#sudo yum install -y libpng12-dev
#sudo yum install -y python2.7-dev
#sudo yum install -y python-dev

# to install abaqus 
chmod 755 /mnt/pkg_src/abaqus_6.14/setup
chmod 755 /mnt/pkg_src/abaqus_6.14/lnx86_64/setup
chmod 755 /mnt/pkg_src/abaqus_6.14/lnx86_64/product/UNIX/Disk1/InstData/NoVM/install.bin

# abaqus will require a scratch directory to execute installation 
mkdir -p /mnt/aba_tmp

cd pkg_src

sudo abaqus_6.14/setup 

# need to install these dependent applications/libraries 
# cmake is used to install lapack 
# lapack is needed for fftw-parallel
# lapack/3.6.1 openmpi/2.0.1 fftw-parallel/3.3.5  
# assumes maali/1.0.6 is install




