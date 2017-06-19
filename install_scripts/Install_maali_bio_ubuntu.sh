#!/bin/bash

# update your current image from the default repo 
# This is will ensure that the remaining package management installs will work!
sudo apt-get -y update

# install to allow x11 fowarding of gui interfaces
sudo apt-get -y install xauth x11-apps libxt-dev 

# install nano xemacs emacs editors
sudo apt-get -y install nano xemacs21 xemacs21-bin xemacs21-supportel xemacs21-basesupport-el

sudo apt-get -y install emacs emacs24 emacs24-common emacs-goodies-el vim 

# install tools that are needed for maali to work
sudo apt-get -y install bc wget make environment-modules libtool

# install the default gnu compilers
# to find the the version number "gcc -v"
sudo apt-get -y install gcc gfortran g++ libgomp1

if [ ! -d "/nectar" ]; then
  sudo mkdir /nectar  
  sudo chown -R ubuntu /nectar
fi

# install additional packages needed to install R/3.3.+ with maali  

sudo apt install libreadline6 libreadline6-dev
sudo apt install libssl-dev


