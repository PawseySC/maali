#!/bin/bash 

module load maali 

maali -t openmpi -v 2.1.1 -c cloud -w 

maali -t bzip2 -v 1.0.6 -c cloud -w 

maali -t curl -v 7.54.0 -c cloud -w 

maali -t zlib -v 1.2.8 -c cloud -w

maali -t xz -v 5.2.3 -c cloud -w

maali -t pcre -v 8.40 -c cloud -w 

maali -t R -v 3.3.3 -c cloud -w 

