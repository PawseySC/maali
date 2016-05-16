# maali
Pawsey Supercomputing Centre Build System

You should be able to install maali by using:

* `git clone https://github.com/Pawseyops/maali`
* `cd maali`
* `MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/4.8.3 intel/15.0.0' ./maali -t maali -v 1.0b1`

where `gcc/4.8.3` and `intel/15.0.0` are modulefiles for GCC 4.8.3 and the Intel Compiler 15.0.0 respectively.

For Cray Systems we use something like:

```
MAALI_MODULE_SET_MAALI_DEFAULT_CRAY_PRGENVS='PrgEnv-cray/5.2.25 PrgEnv-gnu/5.2.25 PrgEnv-intel/5.2.25' \
MAALI_MODULE_SET_MAALI_DEFAULT_CRAY_PES='craype-sandybridge craype-ivybridge craype-haswell' \
MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/4.8.2 gcc/4.9.2 intel/14.0.1.106 cce/8.3.0 cce/8.3.12' \
MAALI_MODULE_SET_MAALI_DEFAULT_PYTHON='python/2.6.9 python/2.7.10' \
./maali -t maali -v 1.0b1
```

##  Maali instructions 
Maali is used to automate the make/cmake builds and the creation of  environment modules.
The build scripts are called by maali to configure, compile and install software for HPC systems.
Maali is the result of efforts led by Chris Bording, Christopher Harris and  David Schibeci

Some assumptions made with maali one is that you are setting up a hierachral module 
environment. This requires that you add in some cases set additional environment
 variables the COMPILER and COMPILER_VER are used throughout for defined the install
path for most applications the major execption is python.

for example in the gnu compiler module we define 
```
setenv          COMPILER        gcc
setenv          COMPILER_VER    4.8.3
```

We define in the maali.config the MAALI_ROOT path variable.
** /$MAALI_ROOT ** this will be site/install specific. If it is system install should 
be root directory level (/).  Note you will need to check the ** /$MAALI_ROOT **
owner names and group names and make the appropiate changes with the chown comma
nd.


The directories in $MAALI_ROOT are created automatically when maali is installed
/$MAALI_ROOT/$MAALI_OS/ is the maali rool level directory  at which all the pack
ages and modules are installed.

for example
/$MAALI_ROOT/$MAALI_OS/apps - The application install directory this where 
                              --prefix is usually set to.  
/$MAALI_ROOT/$MAALI_OS/build - For most applications we copy and extract the 
                               source and build it in a seperate directory.
/$MAALI_ROOT/$MAALI_OS/src - This is where we save all the src packages that 
                             are downloaded for each build.
/$MAALI_ROOT/$MAALI_OS/tools - This is where on maali is installed
/$MAALI_ROOT/$MAALI_OS/modulefiles - the environment module files are located he
re.

In the application directory (/$MAALI_ROOT/$MAALI_OS/apps) we create the main 
branches for different compilers 

To install maali 

./maali -t maali -v <version> -c maali -d

You will need to then add the maali modulefiles to your MODULEPATH
either in your .bashrc file in your $HOME directory.  

Here is and example
export MODULEPATH=/$MAALI_ROOT/$MAALI_OS/modulefiles/devel:/$MAALI_ROOT/$MAALI_O
S/modulefiles/tools:/$MAALI_ROOT/$MAALI_OS/modulefiles/apps:$MODULEPATH

You can then source your ".bashrc" file with the command "source ~/.bashrc"
Note: The simplest way to pickup changes to your .bashrc file is to logout and l
og back in.

There is a sample gnu compiler module name gnu/4.8.3 in $MAALI_OS/samples direct
ory. 
Check to ensure that the compiler version is correct for your system 
"gcc -v" will show the gnu version for the default gnu compilers.
Rename and edit the COMPILER_VER variable as needed.

Copy it to the /$MAALI_ROOT/$MAALI_OS/modulefiles/devel  

Next you will want to define the MAALI_TOOL_COMPILERS variable in your 
```
.maali/$MAALI_SYSTEM.config file.
```
then run 

```
./add_builder cbording "Chris Bording" chris.email@email.com
```



# Extra notes
```
/proc/cpuinfo - lists detailed information about the local cpu 
```