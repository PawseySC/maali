#!/bin/bash

# update your current image from the repo 
# This is will ensure that the remaining package management installs will work!
sudo dnf update

# install to allow x11 fowarding of gui interfaces
sudo dnf -y install xorg-x11-xauth xorg-x11-apps 

# install nano xemacs emacs editors
sudo dnf -y install nano xemacs xemacs-el xemacs-devel xemacs-packages-base xemacs-packages-extra
sudo dnf -y install emacs emacs-common emacs-goodies-el 

# install tools that are needed for maali to work
sudo dnf -y install bc wget make environment-modules

# install the default gnu compilers
# to find the the version number "gcc -V"
sudo dnf -y install gcc gcc-gfortran gcc-c++ 





