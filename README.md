# maali
Pawsey Supercomputing Centre Build System
Maali is used to automate the make/cmake builds and the creation of environment modules.
The build scripts are called by maali to configure, compile and install software for HPC systems.
Maali is the result of efforts led by Chris Bording, Christopher Harris and  David Schibeci
You should be able to install maali on any of the Pawsey Supercomputing Resources by using:

##  Maali installation instructions 
Maali uses itself to install Maali. 
Some assumptions made with maali one is that you are setting up a hierachral module 
environment. This requires that you add in some cases set additional environment
variables the COMPILER and COMPILER_VER are used throughout for defined the install
path for most applications the major execption is python.

for example in the gnu compiler module we define 
```
setenv          COMPILER        gcc
setenv          COMPILER_VER    4.8.3
```

* `git clone https://github.com/Pawseyops/maali`
* `cd maali`
* `MAALI_DEFAULT_COMPILERS='gcc/4.8.3 intel/15.0.0' ./maali -t maali -v 1.0b1`

where `gcc/4.8.3` and `intel/15.0.0` are modulefiles for GCC 4.8.3 and the Intel Compiler 15.0.0 respectively.

For Cray Systems we use something like:

```
MAALI_DEFAULT_CRAY_PRGENVS='PrgEnv-cray/5.2.25 PrgEnv-gnu/5.2.25 PrgEnv-intel/5.2.25' \
MAALI_DEFAULT_CRAY_PES='sandybridge ivybridge haswell' \
MAALI_DEFAULT_COMPILERS='gcc/4.8.2 gcc/4.9.2 intel/14.0.1.106 cce/8.3.0 cce/8.3.12' \
MAALI_DEFAULT_PYTHON='python/2.6.9 python/2.7.10' \
./maali -t maali -v 1.0b1
```


Some assumptions made with maali one is that you are setting up a hierachral module 
environment. This requires that you add in some cases set additional environment
variables the COMPILER and COMPILER_VER are used throughout for defined the install
path for most applications the major execption is python.

for example in the gnu compiler module we define 
```
setenv          COMPILER        gcc
setenv          COMPILER_VER    4.8.3
```

## Installing at external sites!
At the Pawsey Supercomputing Centre we have several system-wide aliases for the different 
file systems.  This includes the group file system which is intended to be used for 
long-term storage of executables, input data, important output data, and so on. It allows all 
members within a project group have read and write access to the /group/[project] directory, 
so it can be used for sharing files within a project. 

MYGROUP = /group/$PAWSEY_PROJECT/$USER

In the maali script the ** DEFAULT ** MAALI_ROOT variable is set to
MAALI_ROOT="$MYGROUP/software/$MAALI_OS"

So if you wish to use maali for your own project
in your $HOME/.bashrc export the MYGROUP variable to what matches up to your ** group file** system
as defined for the Pawsey Supercomputing Centre.
 
```
export MYGROUP=/your_testgroup/[project_name]/$USER
```
#NOTE you need make sure that you have chmod and chown the path you have defined for MYGROUP!
#


The MAALI_ROOT path variable can be defined in the maali.config file that is downloaded with maali.
During installation the maali.config file with be copied to $HOME/.maali directory.

** /$MAALI_ROOT ** this will be site/install specific. If it is a system install should 
be root directory level (/).  Note you will need to check the ** /$MAALI_ROOT **
owner names and group names and make the appropiate changes with the chown command.

The directories in $MAALI_ROOT are created automatically when maali is installed
/$MAALI_ROOT/$MAALI_OS is the root path maali for which all sub-directories that maali will
create at the packages and modules are installed.

for example the defaults paths would be:
/$MAALI_ROOT/apps - The application install directory this where 
                              --prefix is usually set to.  
/$MAALI_ROOT/build - For most applications we copy and extract the 
                               source and build it in a seperate directory.
/$MAALI_ROOT/src - This is where we save all the src packages that 
                             are downloaded for each build.
/$MAALI_ROOT/tools - This is where on maali is installed
/$MAALI_ROOT/modulefiles - the environment module files are located here.

In the application directory (/$MAALI_ROOT/apps) we create the main 
branches for different compilers 

To do a system install of maali you should modify the maali.config file first then 
you just need to run the following command.  

./maali -t maali -v <version> -c maali -d

You will need to then add the maali modulefiles to your MODULEPATH
either in your .bashrc file in your $HOME directory.  

Here is an example using the ** DEFAULT ** paths 
export MODULEPATH=/$MAALI_ROOT/modulefiles/devel:/$MAALI_ROOT/modulefiles/tools:/$MAALI_ROOT/modulefiles/apps:$MODULEPATH

You can then source your ".bashrc" file with the command "source ~/.bashrc"
Note: The simplest way to pickup changes to your .bashrc file is to logout and
 log back in.

There is a sample gnu compiler module name gnu/4.8.3 in $MAALI_OS/samples 
directory. 
Check to ensure that the compiler version is correct for your system 
"gcc -v" will show the gnu version for the default gnu compilers.
Rename and edit the COMPILER_VER variable as needed.

Copy it to the /$MAALI_ROOT/$MAALI_OS/modulefiles/devel  

Next you will want to define the MAALI_TOOL_COMPILERS variable in your 
```
.maali/$MAALI_SYSTEM.config file.
```
then run ** add_builder ** to create the list of users who can install software

```

./add_builder fgump "Forrest Gump" Forrest.Gump@email.com
```

# Extra notes
```
/proc/cpuinfo - is a file that has detailed information about the local cpu 
lscpu - list information about the CPU
lspci | grep NVIDIA - will show what GPUs are installed

These variable match up to this way in cygnet files.
```
# specify which PrgEnv we want to build the tool with
MAALI_TOOL_CRAY_PRGENV="$MAALI_DEFAULT_CRAY_GCC_PRGENV $MAALI_DEFAULT_CRAY_INTEL_PRGENV"

# specify which cpus to target
MAALI_TOOL_CRAY_CPU_TARGET="$MAALI_DEFAULT_CRAY_PES"

# specify which compilers we want to build the tool with
MAALI_TOOL_COMPILERS="$MAALI_DEFAULT_COMPILERS"

```
