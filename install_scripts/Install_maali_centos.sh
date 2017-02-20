#!/bin/bash

# update your current image from the repo 
# This is will ensure that the following package managment installs will work!
sudo yum -y update

# install to allow x11 forwarding of gui interfaces
sudo yum -y install xorg-x11-xauth xorg-x11-apps 

# install nano xemacs emacs editors
sudo yum -y install nano vim
sudo yum -y install emacs emacs-common emacs-goodies-el 

# install tools that are needed for maali to work
sudo yum -y install bc wget make environment-modules

# install the default gnu compilers
# to find the the version number "gcc -v"
sudo yum -y install gcc gcc-gfortran gcc-c++ libgomp


if [ ! -d "/nectar" ]; then
  sudo mkdir /nectar
  sudo chown -R ec2-user /nectar
fi 


