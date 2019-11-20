# maali
## A build system by the Pawsey Supercomputing Centre

Prerequisite: *maali* assumes that modules are available in your system, via either 
[Environment Modules](https://modules.readthedocs.io/en/latest/) 
or [Lmod](https://lmod.readthedocs.io/en/latest/).

You should be able to install *maali* on your workstation by using:
```
git clone https://github.com/PawseySC/maali
cd maali
MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/4.8.5' ./maali -t maali -v 1.7.1 -w
```
where `gcc/4.8.5` is an available modulefile for GCC 4.8.5.


Richer sample installation scripts can be found in `pawsey-install/`.
For instance, for a personal installation of *maali* on Magnus use:
```
pawsey-install/magnus.sh 1.7.1
```
Pawsey staff add the flag `-s` to perform a system installation.


To install a package, use something like:
```
module load maali/1.7.1
maali -t cpmd -v 4.1
```

Cygnet files (i.e. build configuration files) are looked for in a dedicated Github repo, 
which by default is https://github.com/PawseySC/maali-cygnet.
