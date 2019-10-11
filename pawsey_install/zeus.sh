#!/bin/bash

export MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/4.8.5 gcc/5.5.0 gcc/7.2.0 intel/17.0.5'
export MAALI_MODULE_SET_MAALI_DEFAULT_SYSTEM_GCC='gcc/4.8.5'
export MAALI_MODULE_SET_MAALI_DEFAULT_TOOL_CPU_TARGET='sandybridge broadwell knl'
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI_COMPILERS='openmpi/2.1.2'
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI='openmpi/2.1.2'
export MAALI_MODULE_SET_MAALI_DEFAULT_CUDA_COMPILERS="cuda/8.0"
export MAALI_MODULE_SET_MAALI_DEFAULT_PYTHON='python/2.7.14 python/3.6.3'
export MAALI_MODULE_SET_MAALI_LUA_MODULE=1
export MAALI_LUA_MODULE=1

if [ $# -lt 1 ] ; then
  echo "Please provide the maali version as an argument. Exiting now."
  exit
fi

# the flag "-s" is for a system installation; remove it for any personal installation
./maali -t maali -v $1 -s -d -a

exit
