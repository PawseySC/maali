#!/bin/bash -l

# This is the path to a project wide R package library.
R_LIBRARY="$HOME/Rlibrary/3.3.3"
echo ${R_LIBRARY}
# this is name of the package you want to add 
# note the for PACKLIST it is PACKLIST='"package_a","package_b"'
# so keep track of the double and single quotes and commas!

PACKLIST='"R2admb","pscl","lmtest","bbmle","PairedData","ggplot2","data.table"'

#  loads the compilers/libraries/applications into your shell environment

module load gnu r/3.3.3 

#  leave in script allows you to see what modules loaded listed in the
#  standard SBATCH output files and error files associated with every job.
 
module list


# write out installer script to R
cat > /tmp/Rpackage_install.R <<- EOF
local({r = getOption("repos");r["CRAN"]="https://cran.curtin.edu.au"; options(repos=r)})
setRepositories(graphics=F,ind=1:6)
packs=c(${PACKLIST})
install.packages(packs,lib="${R_LIBRARY}")
install.packages("glmmADMB",repos=c("http://glmmadmb.r-forge.r-project.org/repos",getOption("repos")),type="source",lib="${R_LIBRARY}")
EOF

#Check to see if Rlib exists
if [ ! -d ${R_LIBRARY} ]; then 
    mkdir -p ${R_LIBRARY}
    echo create ${R_LIBRARY}
    # check for .Renviron in $HOME, create the file if missing
    if [ ! -e $HOME/.Renviron ];then
	cat > /$HOME/.Renviron <<- EOF
	# set the R_LIBS_USER path
	R_LIBS_USER=${R_LIBRARY} 
	EOF
    fi
fi

# set a local variable to a file for standard output information
# So when building your R packages in batch mode standard output 
# is redirected to file instead of screen.  Useful for debugging
# failed builds.
#
R_install_output=Rpkg_build.log

# cd to the directory where you will build the rpkgs 
cd /tmp

##  RUN R-package_installer script
echo started building Rpackage_$JOBID script
#use this to installed R packages

R CMD BATCH Rpackage_install.R $HOME/${R_install_output}

echo finished install Rpackage_$JOBID script

echo R package installer finished on `hostname` at `date`.
