#!/bin/bash

# update your current image from the repo 
# This is will ensure that the remaining package management installs will work!
sudo apt-get -y update

# install to allow x11 fowarding of gui interfaces
sudo apt-get -y install xauth x11-apps 

# install nano xemacs emacs editors
sudo apt-get -y install nano xemacs21 xemacs21-bin xemacs21-supportel xemacs21-basesupport-el

sudo apt-get -y install emacs emacs24 emacs24-common emacs-goodies-el 

# install tools that are needed for maali to work
sudo apt-get -y install bc wget make environment-modules

# install the default gnu compilers
# to find the the version number "gcc -v"
sudo apt-get -y install gcc-4.8 gfortran-4.8 g++-4.8 libgomp1


if [ -d "/nectar" ]; then
  sudo mkdir /nectar
  sudo chown -R debian /nectar
fi
 
