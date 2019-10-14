#!/bin/bash

export MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/8.3.0 intel/19.0.5'
export MAALI_MODULE_SET_MAALI_DEFAULT_SYSTEM_GCC='gcc/4.8.5'
export MAALI_MODULE_SET_MAALI_DEFAULT_CPU_TARGET='broadwell cascadelake'
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI_COMPILERS='openmpi-ucx/4.0.1'
export MAALI_MODULE_SET_MAALI_DEFAULT_CUDAMPI_COMPILERS='openmpi-ucx-gpu/4.0.1'
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI='openmpi-ucx-gpu/4.0.1'
export MAALI_MODULE_SET_MAALI_DEFAULT_CUDA_COMPILERS="cuda/10.1"
export MAALI_MODULE_SET_MAALI_DEFAULT_PYTHON='python/3.6.3'
export MAALI_MODULE_SET_MAALI_LUA_MODULE=1
export MAALI_LUA_MODULE=1

if [ $# -lt 1 ] ; then
  echo "Please provide the maali version as an argument. Exiting now."
  exit
fi

# the flag "-s" is for a system installation; remove it for any personal installation
./maali -t maali -v $1 -s -d -a

exit
