# maali
## Pawsey Supercomputing Centre Build System


You should be able to install *maali* by using:
```
git clone https://github.com/PawseySC/maali
cd maali
MAALI_MODULE_SET_MAALI_DEFAULT_COMPILERS='gcc/4.8.5' ./maali -t maali -v 1.7
```
where `gcc/4.8.5` is an available modulefile for GCC 4.8.5.

Richer sample installation scripts can be found in `pawsey_install/`.
For instance, for a personal installation of maali on Magnus use:
```
pawsey_install/magnus.sh 1.7
```
Pawsey staff add the flag `-s` to perform a system installation.

To install a package, use something like:
```
module load maali/1.7
maali -t cpmd -v 4.1
```
