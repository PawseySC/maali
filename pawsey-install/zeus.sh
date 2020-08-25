#!/bin/bash

export MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/4.8.5 gcc/5.5.0 gcc/7.2.0 intel/17.0.5'
export MAALI_MODULE_SET_MAALI_DEFAULT_SYSTEM_GCC='gcc/4.8.5'
export MAALI_MODULE_SET_MAALI_DEFAULT_CPU_TARGET='sandybridge broadwell knl'
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI_COMPILERS='openmpi/2.1.2'
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI='openmpi/2.1.2'
export MAALI_MODULE_SET_MAALI_DEFAULT_CUDA_COMPILERS="cuda/8.0"
export MAALI_MODULE_SET_MAALI_DEFAULT_PYTHON='python/3.6.3'
export MAALI_MODULE_SET_MAALI_LUA_MODULE=1
export MAALI_LUA_MODULE=1
export MAALI_MODULE_SET_MAALI_DOT_DIR='os.getenv\(\"MYGROUP\"\)..\"/.maali\"'
export MAALI_MODULE_QUOTES_MAALI_DOT_DIR=off
export MAALI_DOT_DIR="$MYGROUP/.maali"
export MAALI_MODULE_SET_MAALI_PYTHON_DEFAULT_LOAD=1
if [ $# -lt 1 ] ; then
  echo "Please provide at least the maali version as an argument. Exiting now."
  exit
fi

./maali -t maali -v "$@"

exit
