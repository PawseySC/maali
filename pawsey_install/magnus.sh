#!/bin/bash

export MAALI_MODULE_SET_MAALI_DEFAULT_CRAY_PRGENVS="PrgEnv-cray/6.0.4 PrgEnv-gnu/6.0.4 PrgEnv-intel/6.0.4"
export MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS="gcc/4.9.3 gcc/5.3.0 gcc/6.1.0 gcc/7.2.0 intel/17.0.4.196 cce/8.6.5"
export MAALI_MODULE_SET_MAALI_DEFAULT_SYSTEM_GCC="gcc/4.8.5"
export MAALI_MODULE_SET_MAALI_DEFAULT_CPU_TARGET="sandybridge ivybridge haswell"
export MAALI_MODULE_SET_MAALI_DEFAULT_MPI="cray-mpich/7.7.0"
export MAALI_MODULE_SET_MAALI_DEFAULT_CUDA_COMPILERS="cudatoolkit/8.0.61_2.4.3-6.0.5.0_3.6__gb475d12"
export MAALI_MODULE_SET_MAALI_DEFAULT_PYTHON="python/2.7.14 python/3.6.3"
export MAALI_MODULE_SET_MAALI_REQUIRED_SYSTEM_MODULES="modules/3.2.10.6 craype/2.5.13 craype-network-aries"
export MAALI_MODULE_LIST_MAALI_REQUIRED_SYSTEM_MODULES="off"

if [ $# -lt 1 ] ; then
  echo "Please provide at least the maali version as an argument. Exiting now."
  exit
fi

./maali -t maali -v "$@"

exit
