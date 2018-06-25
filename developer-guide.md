#  Maali developers guide

Reference guide to what is happening under the hood with Maali.

## list of maali functions 
### function maali_build  
   starts on line 74
   this is the core function for configuring, compiling,   software
### function maali_cmake_build
   starts on line 88
   this th
### function maali_download
### function maali_genpkgconfig
### function maali_git_download
### function maali_load_module
### function maali_makedir
### function maali_module
### function maali_python_build
### function maali_run
### function maali_r_build
### function maali_unpack
### function maali_wiki
### function log
### function removedir
### function removefile

## what is happening when maali is installing itself

 

MAALI_TOOL_NAME=
MAALI_TOOL_VERSION=
MAALI_PYTHON_VERSION=
DEBUG=
MAALI_CONFIG=
MAALI_REBUILD=
MAALI_REBUILD_COMPILER=
MAALI_REMODULE=0
MAALI_BUILDONLY=
MAALI_SYSTEM_BUILD=NO
MAALI_CMAKE_PATH=".."
MAALI_MAKE_VERSION_DEFAULT=0
MAALI_FORCE_DOWNLOAD_FROM_GITHUB=0
MAALI_UNINSTALL_HIDE=0
MAALI_UNINSTALL_REMOVE=0
MAALI_SYSTEM_CYGNET_FILE=0
MAALI_CUDA_BUILD=0
MAALI_CUDA_SUPPORT=0

# for auto-building module files
MAALI_MODULE_SET_PATH=
MAALI_MODULE_SET_LD_LIBRARY_PATH=
MAALI_MODULE_SET_CPATH=
MAALI_MODULE_SET_FPATH=
MAALI_MODULE_SET_FCPATH=
MAALI_MODULE_SET_INCLUDE_PATH=
MAALI_MODULE_SET_PKG_CONFIG_PATH=
MAALI_MODULE_SET_MANPATH=
MAALI_MODULE_SET_PERLLIB=

# for auto-building module files for Cray
MAALI_MODULE_SET_CRAY_LD_LIBRARY_PATH=
MAALI_MODULE_PE_PKGCONFIG_NAME=
MAALI_MODULE_PE_PKGCONFIG_CFLAGS=
MAALI_MODULE_PE_PKGCONFIG_LMAALI=


##  Maali configuration for nectar


```
MAALI_OS=ubuntu14
MAALI_SYSTEM=nectar
MAALI_ROOT="/$MAALI_SYSTEM/$MAALI_OS"
MAALI_BUILD_DIR="$MAALI_ROOT/build"
MAALI_MODULE_DIR="$MAALI_ROOT/modulefiles"
MAALI_SRC="$MAALI_ROOT/src"
MAALI_SYSTEM_BUILD="YES"
MAALI_DEFAULT_COMPILERS="gnu/4.9.1"
#MAALI_DEFAULT_PYTHON=""
#MAALI_DEFAULT_MPI="openmpi/1.7.5"
```


### maali sequence

check if /tmp exists

define 
MAALI_BUILD_DIR
MAALI_MODULE_DIR
MAALI_SRC

Source modules.sh if we are on a SLES 
  Check if we are on a CRAY 
   if not
     source /etc/profile.d/modules.sh
   else 
     we are on a cray need to see if we are on an internal loging

define 
MAALI_LOADEDMODULES
MAALI_IS_LOADED=0  

loop through MAALI_LOADEDMOUELS 
  check to see if maali is loaded
  set MAALI_IS_LOADED=1


check if MAALI_IS_LOADED not loaded
    check to if $Maali_version is "tip" (or latest)
    module load maali/$maali_version


check to see if MAALI_TOOL_NAME string length is not zero
  calls usage function!
  exits scripts when done


Check to see if MAALI_TOOL_NAME does not have 'system-' in it and 
MAALI_TOOL_VERSION string length is not zero line 1174
  calls usage function
  exit scripts when done

line 1180 not sure if these will every be true??
check to see if MAALI_TOOL_NAME does not have system- in it
and $MAALI_TOOL_VERSION is not a string of length zero

test $MAALI_TOOL_NAME has system- in it?

Define - need a test to see if MAALI_TOOL_VERSION IS defined
MAALI_TOOL_MAJOR_VERSION
MAALI_TOOL_MAJOR_MINOR_VERSION

Check to see if we are on a cluster 
 looks for SLURM or PBS
 Defaults MAALI_CORES=1  safe for login nodes
 if on a compute node 
  use N cores

Define 
MAALI_CMDLINE=$*
note caputures the command line??


Define 
MAALI_TOOL_NAME_ORIG
reset MAALI_TOOL_NAME all lower case
MAALI_TOOL_NAME_UPPERCASE


define
MAALI_PYTHON_FIRSTLETTER

check if MAALI_CONFIG is set via usage function
  check if maali is installed
  else copies maali from pwd to $HOEM/.maali
  error test exit


check MAALI_SYSTEM_BUILD true
  check MAALI_BUILDER_UID is not length zero
  create maali wiki directory in HOME/.maali/MAALI_OS/wiki
  define  
  MAALI_BUILDER_BUILD_CN
  MAALI_BUILDER_BUILD_MAIL
  check MAALI_BUILDER_BUILD_CN and MAALI_BUILDER_BUILD_MAIL
  check MAALI_USER_MAP
   source MAALI_USER_MAP
  error test  exit

check if default CRAY program environment

check MAALI_DEFAULT COMPILERS is not zero length
  set MAALI_DEFAULT GCC, intel, CCE compilers
  missing pgi??

check MAALI DEFAULT PYTHON
  set MAALI_DEFAULT_26_PYTHON or MAALI_DEFAULT_27_PYTHON

see if this is rebuild  line 1355
check MAALI_REBUILD true
  define MAALI_REBUILD_COMPILER_LOG
  define MAALI_LOG_PREFIX

create list of loaded modules in  
Define MAALI_LOADEDMODULES
  unload all modules except maali  line 1367
  

load all modules as specified in MAALI_REQUIRED_SYSTEM_MODULES line 1378

make directory MAALI_SRC
make directory MAALI_BUILD_DIR
make directory MAALI_LOG_DIR

set MAALI_FOUND_**CYGENT?**=0 note CYGNET is mispelled

Check to see if we are downloading CYGNET FILES 
  by Checking if MAALI_FORCE_DOWNLOAD_FROM_GITHUB is 0
  
  loop through list of MAALI_FILE_DIR
    is this a DEBUG this is set in usage function

  check MAALI_SYSTEM is not length of ZERO 




check if MAALI_FOUND_CYGENT is 0 then
  try to download cygnet file from github
  check to see if $HOME/.maali/MAALI_OS/MAALI_CYGNET_DIR_NAME exists
    if not create it.
  DEFINE
  MAALI_CYGNET_FILEPATH
  MAALI_FILES_PATH
  call the **maali_git_download** function
  SET MAALI_FOUND_CYGNET =1


Source MAALI_CYGNET_FILEPATH

Check to see if MAALI_CUDA_BUILD is 1
  Check MAALI_CUDA_SUPPORT is 0 
else MAALI_CUDA_BUILD is 0
  Set MAALI_TOOL_CUDA_COMPILERS="na"

loop over the list of MAALI_TOOL_PATCHES
  check to see if this is DEBUB install
  check to see if patch file exists
    if not found 
      is this is a debug    
      call the **maali_git_download** function
  else found patch file


loop of er MAALI_SYSTEM_PACKAGES_PREREQ
  NOTE not sure if this works for ubuntu needs testing
  set MAALI_SYSTEM_PACKAGES_VERSION using rpmquery
  if missing prereq package.
    error out and exit

if MAALI_REBUILD is true
   set MAALI_TOOL_COMPILERS=$MAALI_REBUILD_COMPILER

if MAALI_TOOL_COMPILERS is an empty string "" 
   error out and exit

check to see if build is using python line 1527
loop over MAALI_TOOL_COMPILERS
  Define
  MAALI_COMPILER_NAME 
  if MAALI_COMPILER_NAME is python
    set MAALI_PYTHON_TOOL to 1
    if MAALI_TOOL_TYPE is of length zero
       define MAALI_TOOL_TYPE is **python**
    if MAALI_MODULE_SET_PYTHONPATH is and empty string ""
       set MAALI_MODULE_SET_PYTHONPATH 1






### How are environment modules are created in MAALI?




Line 2048 creating module using  $MAALI_TOOL_MODULE_DIR