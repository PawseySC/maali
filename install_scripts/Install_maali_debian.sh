#!/bin/bash

# update your current image from the repo 
# This is will ensure that the remaining package management installs will work!
sudo apt-get -y update

# install to allow x11 fowarding of gui interfaces
sudo apt-get -y install xorg-x11-xauth xorg-x11-apps 

# install nano xemacs emacs editors
sudo apt-get -y install nano xemacs xemacs-el xemacs-devel xemacs-packages-base xemacs-packages-extra
sudo apt-get -y install emacs emacs-common emacs-goodies-el 

# install tools that are needed for maali to work
sudo apt-get -y install bc wget make environment-modules

# install the default gnu compilers
# to find the the version number "gcc -V"
sudo apt-get -y install gcc-4.8 gfortran-4.8 g++-4.8 libgomp1





