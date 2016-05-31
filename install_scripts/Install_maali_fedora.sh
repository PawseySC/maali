#!/bin/bash

sudo dnf update

sudo dnf -y install xorg-x11-xauth xorg-x11-apps 
sudo dnf -y install nano xemacs xemacs-el xemacs-devel xemacs-packages-base xemacs-packages-extra
sudo dnf -y install emacs emacs-common emacs-goodies-el 
sudo dnf -y install bc wget make 
sudo dnf -y install gcc gcc-gfortran gcc-c++ 
sudo dnf -y install environment-modules




