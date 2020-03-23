#!/bin/bash

export MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/8.3.0 intel/19.0.5'
export MAALI_MODULE_SET_MAALI_DEFAULT_SYSTEM_GCC='gcc/4.8.5'
export MAALI_MODULE_SET_MAALI_DEFAULT_CPU_TARGET='broadwell cascadelake'
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI_COMPILERS='openmpi-ucx/4.0.2'
export MAALI_MODULE_SET_MAALI_DEFAULT_CUDAMPI_COMPILERS='openmpi-ucx-gpu/4.0.2'
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI='openmpi-ucx-gpu/4.0.2'
export MAALI_MODULE_SET_MAALI_DEFAULT_CUDA_COMPILERS="cuda/10.1"
export MAALI_MODULE_SET_MAALI_DEFAULT_PYTHON='python/3.6.3'
export MAALI_MODULE_SET_MAALI_LUA_MODULE=1
export MAALI_LUA_MODULE=1
export MAALI_MODULE_SET_MAALI_DOT_DIR='os.getenv\(\"MYGROUP\"\)..\"/.maali\"'
export MAALI_MODULE_QUOTES_MAALI_DOT_DIR=off
export MAALI_DOT_DIR="$MYGROUP/.maali"
export MAALI_MODULE_SET_MAALI_CLUSTER='os.getenv\(\"PAWSEY_CLUSTER\"\)..\"_\"..os.getenv\(\"PAWSEY_OS\"\)'
export MAALI_MODULE_QUOTES_MAALI_CLUSTER=off
export MAALI_CLUSTER="${PAWSEY_CLUSTER}_${PAWSEY_OS}"

if [ $# -lt 1 ] ; then
  echo "Please provide at least the maali version as an argument. Exiting now."
  exit
fi

./maali -t maali -v "$@"

exit
