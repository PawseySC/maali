#  Maali developers guide

Reference guide to what is happening under the hood with Maali.

## list of maali functions 
* function maali_build 
  ### this is the core function for creating software
* function maali_cmake_build
* function maali_download
* function maali_genpkgconfig
* function maali_git_download
* function maali_load_module
* function maali_makedir
* function maali_module
* function maali_python_build
* function maali_run
* function maali_r_build
* function maali_unpack
* function maali_wiki
* function log
* function removedir
* function removefile

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