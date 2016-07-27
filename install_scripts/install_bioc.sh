#!/bin/bash
sudo apt-get -y install r-base r-base-dev
sudo apt-get -y install r-bioc-affy
sudo apt-get -y install r-bioc-affyio
sudo apt-get -y install r-bioc-altcdfenvs
sudo apt-get -y install r-bioc-annotate
sudo apt-get -y install r-bioc-annotationdbi
sudo apt-get -y install r-bioc-aroma.light
sudo apt-get -y install r-bioc-biobase
sudo apt-get -y install r-bioc-biocgenerics
sudo apt-get -y install r-bioc-biocinstaller
sudo apt-get -y install r-bioc-biocparallel
sudo apt-get -y install r-bioc-biomart
sudo apt-get -y install r-bioc-biostrings

#R CMD BATCH R-installer.R
