# maali
Pawsey Supercomputing Centre Build System

You should be able to install maali by using:

* `git clone https://github.com/Pawseyops/maali`
* `cd maali`
* `MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/4.8.3 intel/15.0.0' ./maali -t maali -v 1.0a1`

where `gcc/4.8.3` and `intel/15.0.0` are modulefiles for GCC 4.8.3 and the Intel Compiler 15.0.0 respectively.

For Cray Systems we use something like:

```
MAALI_MODULE_SET_MAALI_DEFAULT_CRAY_PRGENVS='PrgEnv-cray/5.2.25 PrgEnv-gnu/5.2.25 PrgEnv-intel/5.2.25' \
MAALI_MODULE_SET_MAALI_DEFAULT_CRAY_PES='craype-sandybridge craype-ivybridge craype-haswell' \
MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/4.8.2 gcc/4.9.2 intel/14.0.1.106 cce/8.3.0 cce/8.3.12' \
MAALI_MODULE_SET_MAALI_DEFAULT_PYTHON='python/2.6.9 python/2.7.10' \
./maali -t maali -v 1.0a4
```
