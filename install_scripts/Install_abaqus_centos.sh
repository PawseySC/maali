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
# need to open html files on abaqus.civil.uwa.edu.au
sudo yum install firefox


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




