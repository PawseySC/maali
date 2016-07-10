# maali
Pawsey Supercomputing Centre Build System

You should be able to install maali by using:

* `git clone https://github.com/Pawseyops/maali`
* `cd maali`
* `MAALI_DEFAULT_COMPILERS='gcc/4.8.3 intel/15.0.0' ./maali -t maali -v 1.0b1`

where `gcc/4.8.3` and `intel/15.0.0` are modulefiles for GCC 4.8.3 and the Intel Compiler 15.0.0 respectively.

For Cray Systems we use something like:

```
MAALI_DEFAULT_CRAY_PRGENVS='PrgEnv-cray/5.2.25 PrgEnv-gnu/5.2.25 PrgEnv-intel/5.2.25' \
MAALI_DEFAULT_CRAY_PES='sandybridge ivybridge haswell' \
MAALI_DEFAULT_COMPILERS='gcc/4.8.2 gcc/4.9.2 intel/14.0.1.106 cce/8.3.0 cce/8.3.12' \
MAALI_DEFAULT_PYTHON='python/2.6.9 python/2.7.10' \
./maali -t maali -v 1.0b1
```



These variable match up to this way in cygnet files.
```
# specify which PrgEnv we want to build the tool with
MAALI_TOOL_CRAY_PRGENV="$MAALI_DEFAULT_CRAY_GCC_PRGENV $MAALI_DEFAULT_CRAY_INTEL_PRGENV"

# specify which cpus to target
MAALI_TOOL_CRAY_CPU_TARGET="$MAALI_DEFAULT_CRAY_PES"

# specify which compilers we want to build the tool with
MAALI_TOOL_COMPILERS="$MAALI_DEFAULT_COMPILERS"
```

## list of maali functions

function maali_wiki {         line 9-18
function maali_build {        line 83-93
function maali_cmake_build {  line 97-114
function maali_download {     line 118-174
function maali_genpkgconfig { line 178-197
function maali_git_download { line 201-237
function maali_load_module {  line 241-269
function maali_makedir {      line 273-315
function maali_module {       line 319-803
function maali_python_build { line 807-822
function maali_run {          line 826-847
function maali_r_build {      line 851-856 
function maali_unpack {       line 860-918
function log {                line 923-927
function removedir {          line 931-937
function removefile {         line 941-945


##  Definitions
Definitions of the ~250 variables used in maail.

### MAALI_APPS_DIR Directory where the software is installed is based 
 on the tool type
MAALI_APPS_DIR="$MAALI_ROOT/$MAALI_TOOL_TYPE"

### MAALI_APP_HOME Used in function maali_module to define application 
  base directory path using the compiler/compiler version hierarchy
  for include, bin, manpath etc..
MAALI_APP_HOME="$MAALI_APPS_DIR/\$env(COMPILER)/\$env(COMPILER_VER)/$MAALI_TOOL_NAME/$MAALI_TOOL_VERSION"

### MAALI_APP_HOME_NAME - Used in the maali_module function to create a environment variable for the module 
MAALI_APP_HOME_NAME="MAALI_"$MAALI_TOOL_NAME_UPPERCASE"_HOME"

### MAALI_LOADED_PRGENV - Used in the maali_module function when setting the variable MAALI_APP_HOME path variable and set as an evironment module variable for use with Cray systems.
setenv MAALI_LOADED_PRGENV PrgEnv-cray

### MAALI_TOOL_NAME - input variable for the maali command, name of the tool/application being installed ( -t flag )

### MAALI_TOOL_VERSION - input variable for the maali command, version of the tool/application being installed ( -v flag )

### MAALI_BUILDER_BUILD_CN - for system build define ldap details cn
MAALI_BUILDER_BUILD_CN=`ldapsearch -LLL -x '(uid='$MAALI_BUILDER_UID')' cn | grep cn: | sed -e 's/cn: //g'`

### MAALI_BUILDER_BUILD_MAIL - for system build define ldap details email
MAALI_BUILDER_BUILD_MAIL=`ldapsearch -LLL -x '(uid='$MAALI_BUILDER_UID')' mail | grep mail: | sed -e 's/mail: //g'`

### MAALI_BUILDER_UID - input variable for the maali command, for system builds, envivironment variable that maali checks.

### MAALI_BUILDONLY - input variable for the maali command, skips the module file creation.

### MAALI_BUILD_DATE - timestamp of when system build was done.

### MAALI_BUILD_DIR - default build directory
MAALI_BUILD_DIR="$MAALI_ROOT/build"

### MAALI_BUILD_PREREQ_MODULE - loop index name 
 for MAALI_BUILD_PREREQ_MODULE in $MAALI_TOOL_BUILD_PREREQ; do

### MAALI_BUILD_PREREQ_MODULE_NAME - name of module used with version cut off
MAALI_BUILD_PREREQ_MODULE_NAME=`echo $MAALI_BUILD_PREREQ_MODULE | cut -d '/' -f 1`

MAALI_CMAKE_PATH - defines path where cmake command will be run.
MAALI_CMAKE_PATH=".."

MAALI_CMAKE_TOOL - boolean environment variable indicating that the build will use cmake instead of make.

MAALI_CMDLINE - captures the maali command line input arguments
MAALI_CMDLINE=$*

MAALI_COMPILER - used as an index counter in a for loop listing.
 for MAALI_COMPILER in $MAALI_TOOL_COMPILERS; do

### MAALI_TOOL_COMPILERS defined as the list of compiler to build against and part of the installation path.

### MAALI_COMPILER_FOUND_MATCH - used in the maali_module function boolean value

### MAALI_COMPILER_NAME - module name of compiler with the version truncated.

### MAALI_COMPILER_NUMBER - is the number of compilers listed in the MAALI_TOOL_COMPILERS variables.  ( looks unused? )
MAALI_COMPILER_NUMBER=`echo "$MAALI_TOOL_COMPILERS" | wc -w`

### MAALI_COMPILER_TYPE - used as a loop variable in maali_module function part of the MAALI_SUPPORTED_COMPILERS list
for MAALI_COMPILER_TYPE in $MAALI_SUPPORTED_COMPILERS; do

### MAALI_COMPILER_VERSION - is the compiler version number it is obtained different way depending on they compiler.
MAALI_COMPILER_VERSION=`cc -V | head -1` 
 
### MAALI_COMPILER - is the variable used in loops
for MAALI_COMPILER in $MAALI_TOOL_COMPILERS; do

### MAALI_CONFIG - is the variable used to define the maali config file name.
MAALI_CONFIG=$OPTARG

### MAALI_CORES - for use in parallel make -j $MAALI_CORES

### MAALI_CRAY - boolean variable to set if this is a cray system.

### MAALI_CRAY_COMPILER_MATCH - string variable to set to the different cray compiler types - gcc, intel, cce

### MAALI_CRAY_CPU_TARGET - string variable defines cpu target used
   maali_load_module "craype-$MAALI_CRAY_CPU_TARGET"
(NEEDS to be standardize!!)

### MAALI_CRAY_CPU_TARGET_FOUND_MATCH - boolean variable in maali_module function

### MAALI_CRAY_CPU_TARGET_TYPE is the loop variable in the maali_module function
for MAALI_CRAY_CPU_TARGET_TYPE in $MAALI_SUPPORTED_CRAY_CPU_TARGETS; do


### MAALI_CRAY_MODULE is a loop variable used in the maali main script 
for MAALI_CRAY_MODULE in $MAALI_EXTRA_CRAY; do
for MAALI_CRAY_MODULE in $MAALI_PREREQ_MODULE; do

### MAALI_EXTRA_CRAY is string variable that is a list of ???
for MAALI_CRAY_MODULE in $MAALI_EXTRA_CRAY; do

### MAALI_CRAY_PRGENV is a string variable that represents the variable in for loop list used in the maali_module function and the main maali scrtip.
for MAALI_CRAY_PRGENV in $MAALI_TOOL_CRAY_PRGENV; do

### MAALI_CRAY_PRGENV_FOUND_MATCH is a boolean variable used in the maali module function
 if [ $MAALI_CRAY_PRGENV_FOUND_MATCH -eq 0 ]; then

### MAALI_CRAY_PRGENV_NAME - String variable to used to test which PrgEnv is set
MAALI_CRAY_PRGENV_NAME=`echo "$MAALI_CRAY_PRGENV" | cut -d '/' -f 1`


### MAALI_CRAY_PRGENV_TYPE - a string variable set in loop used in the maali_module function
for MAALI_CRAY_PRGENV_TYPE in $MAALI_SUPPORTED_CRAY_PRGENVS; do

### MAALI_CRAY_TOOL_COMPILER - a string variable using the a loop in the maali main function.
for MAALI_CRAY_TOOL_COMPILER in $MAALI_CRAY_TOOL_COMPILERS; do
 
### MAALI_CRAY_TOOL_COMPILERS - is a list of Compilers used
MAALI_CRAY_TOOL_COMPILERS="$MAALI_TOOL_COMPILERS"

### MAALI_CRAY_TOOL_COMPILER_NAME - is a string variable of the environment module with the version truncated.
MAALI_CRAY_TOOL_COMPILER_NAME=`echo "$MAALI_CRAY_TOOL_COMPILER" | cut -d '/' -f 1`

### MAALI_CUDA_BUILD - is a boolean variable for using the CUDA libs set in the cygnet files.

### MAALI_CUDA_SUPPORT - is a boolean variable used to test for CUDA support
MAALI_CUDA_SUPPORT=0  ( could you not use MAALI_CUDA_BUILD )

### MAALI_CYGNET_BUILD_FILE_EXT - a string variable for cygnet file extension
MAALI_CYGNET_BUILD_FILE_EXT='cyg'
 
### MAALI_CYGNET_DIR_NAME - string variable use to define directory for the cygnet files
MAALI_CYGNET_DIR_NAME='cygnet_files'

### MAALI_CYGNET_FILEPATH - installation path of cygnet file 
MAALI_CYGNET_FILEPATH="$MAALI_FILES_PATH/$MAALI_TOOL_NAME.$MAALI_SYSTEM.$MAALI_CYGNET_BUILD_FILE_EXT"

### MAALI_CYGNET_FILESIZE - boolean variable test to that file exists
MAALI_CYGNET_FILESIZE=$(stat -c%s "$MAALI_CYGNET_FILEPATH")

### MAALI_CYGNET_FILES_URL - string variable defined the url for the maali-cygnet files
MAALI_CYGNET_FILES_URL="https://raw.githubusercontent.com/Pawseyops/maali-cygnet/master"

### MAALI_DEFAULT_26_PYTHON
### MAALI_DEFAULT_27_PYTHON
### MAALI_DEFAULT_CCE_COMPILERS

### MAALI_DEFAULT_COMPILER - string variable used in loop in maali main
for MAALI_DEFAULT_COMPILER in $MAALI_DEFAULT_COMPILERS; do
### MAALI_DEFAULT_COMPILERS - list variable using in loop in maali main
for MAALI_DEFAULT_COMPILER in $MAALI_DEFAULT_COMPILERS; do

### MAALI_DEFAULT_COMPILER_NAME - the compiler environment module name with version truncated.
MAALI_DEFAULT_COMPILER_NAME=`echo "$MAALI_DEFAULT_COMPILER" | cut -d '/' -f 1`

### MAALI_DEFAULT_CRAY_CCE_PRGENV - not used set in comment

MAALI_DEFAULT_CRAY_CRAY_PRGENV
MAALI_DEFAULT_CRAY_GCC_PRGENV
MAALI_DEFAULT_CRAY_INTEL_PRGENV
MAALI_DEFAULT_CRAY_PRGENVS
MAALI_DEFAULT_GCC_COMPILERS
MAALI_DEFAULT_INTEL_COMPILERS
MAALI_DEFAULT_PRGENV
MAALI_DEFAULT_PRGENV_NAME
MAALI_DEFAULT_PYTHON
MAALI_DEFAULT_PYTHON_COMPILER
MAALI_DEFAULT_PYTHON_COMPILER_MAJOR_MINOR_VERSION
MAALI_DEFAULT_PYTHON_COMPILER_VERSION
MAALI_DEFAULT_SYSTEM_GCC
MAALI_DIR
MAALI_DIR_PATH
MAALI_DST
MAALI_DST_ARRAY
MAALI_DST_FILESIZE
MAALI_EXIT_STATUS
MAALI_EXTRA_CRAY_REV
MAALI_EXTRA_CRAY
MAALI_FILES
MAALI_FILES_DIR
MAALI_FILES_PATH
MAALI_FORCE_DOWNLOAD_FROM_GITHUB
MAALI_FOUND_CYGENT
MAALI_GIT_DOWNLOAD_DIR
MAALI_GIT_DOWNLOAD_FILE
MAALI_GIT_DOWNLOAD_FILEPATH
MAALI_GIT_DOWNLOAD_FILESIZE
MAALI_GROUP_BUILD
MAALI_IFS
MAALI_INDIVIDUAL_DST
MAALI_INSTALL_DATE
MAALI_INSTALL_DIR
MAALI_INSTALL_TOOLDIR
MAALI_IS_LOADED
MAALI_LOADEDMODULES
MAALI_LOADED_CRAY_COMPILER
MAALI_PREREQ_MODULE_NAME
MAALI_LOADED_PRGENV
MAALI_LOG_DIR
MAALI_LOG_PREFIX
MAALI_MAKE_VERSION_DEFAULT
MAALI_MODULE
MAALI_MODULE_CONFLICT
MAALI_MODULE_CONFLICT_CHECK
MAALI_MODULE_DIR
MAALI_MODULE_MAX_VARIABLE
MAALI_MODULE_MISSING
MAALI_MODULE_NAME
MAALI_MODULE_PE_PKGCONFIG_CFLAGS
MAALI_MODULE_PE_PKGCONFIG_LIBS
MAALI_MODULE_PE_PKGCONFIG_NAME
MAALI_MODULE_PREREQ
MAALI_MODULE_RESTRICT_GROUP
MAALI_MODULE_RESTRICT_GROUP 
MAALI_INSTALL_DIR
MAALI_MODULE_RESTRICT_GROUP
MAALI_MODULE_SET
MAALI_MODULE_SET_
MAALI_MODULE_SET_CPATH
MAALI_MODULE_SET_CRAY_LD_LIBRARY_PATH
MAALI_MODULE_SET_FCPATH
MAALI_MODULE_SET_FPATH
MAALI_MODULE_SET_INCLUDE_PATH
MAALI_MODULE_SET_LD_LIBRARY_PATH
MAALI_MODULE_SET_MAALI
MAALI_MODULE_SET_MANPATH
MAALI_MODULE_SET_PATH
MAALI_MODULE_SET_PERLLIB
MAALI_MODULE_SET_PKG_CONFIG_PATH
MAALI_MODULE_SET_PYTHONPATH
MAALI_MODULE_SET_R_LIBS
MAALI_MODULE_SET_R_LMAALI
MAALI_MODULE_VARIABLE
MAALI_MODULE_VARIABLES_LIST
MAALI_MODULE_VARIABLES_LIST_MAALI
MAALI_MODULE_VARIABLES_LIST_NON_MAALI
MAALI_MODULE_VARIABLE_DIR
MAALI_MODULE_VARIABLE_EVAL
MAALI_MODULE_VARIABLE_VALUE
MAALI_MODULE_VARIABLE_NAME
MAALI_MODULE_VARIABLE_NAME 
MAALI_MODULE_VARIABLE_PREPREND
MAALI_MODULE_VARIABLE_TCL
MAALI_MODULE_VARIABLE_VALUE
MAALI_MODULE_VARIABLE_WIDTH
MAALI_MODULE_VARIABLE_WORDS
MAALI_MODULE_WHATIS
MAALI_NEWPYTHONPATH
MAALI_OLD_PYTHONPATH
MAALI_OS 
MAALI_OS_PATCH_LEVEL
MAALI_OS_VERSION
MAALI_PATCH_NUMBER
MAALI_PKG
MAALI_PREREQ_MODULE
MAALI_PREREQ_MODULE_NAME
MAALI_PYTHON_FIRSTLETTER
MAALI_PYTHON_LIBDIR
MAALI_PYTHON_LIB_VERSION
MAALI_PYTHON_TOOL
MAALI_PYTHON_VERSION
MAALI_REBUILD
MAALI_REBUILD_COMPILER
MAALI_REBUILD_COMPILER_LOG
MAALI_REBUILD_SRC
MAALI_REMODULE
MAALI_REQUIRED_SYSTEM_MODULES
MAALI_ROOT
MAALI_R_TOOL
MAALI_SLASH_COUNT
MAALI_SRC
MAALI_SUPPORTED_COMPILERS
MAALI_SUPPORTED_CRAY_CPU_TARGETS
MAALI_SUPPORTED_CRAY_PRGENVS
MAALI_SYSTEM
MAALI_SYSTEM_BUILD
MAALI_SYSTEM_COMPILER
MAALI_DEFAULT_SYSTEM_GCC
MAALI_SYSTEM_COMPILER
MAALI_DEFAULT_SYSTEM_GCC
MAALI_SYSTEM_COMPILER
MAALI_COMPILER
MAALI_SYSTEM_COMPILER_LIST
MAALI_SYSTEM_CRAY_CPU_TARGET
MAALI_SYSTEM_CRAY_CPU_TARGET_LIST
MAALI_SYSTEM_CRAY_PRGENV
MAALI_SYSTEM_CRAY_PRGENV_LIST
MAALI_SYSTEM_CUDA_LIST
MAALI_SYSTEM_CUDA_VERSION
MAALI_SYSTEM_CUDA_VERSION_MATCH
MAALI_SYSTEM_CYGNET_FILE
MAALI_SYSTEM_DEFAULT_CUDA
MAALI_SYSTEM_DEFAULT_PYTHON
MAALI_SYSTEM_DEFAULT_R
MAALI_SYSTEM_PACKAGES_NAME
MAALI_SYSTEM_PACKAGES_PREREQ
MAALI_SYSTEM_PACKAGES_VERSION
MAALI_TMP_DST
MAALI_TMP_FILE
MAALI_TMP_URL
MAALI_TOOL_BUILD_DIR
MAALI_TOOL_BUILD_PREREQ
MAALI_TOOL_BUILD_PREREQ_REV
MAALI_TOOL_COMPILER
MAALI_TOOL_COMPILERS
MAALI_TOOL_CONFIGURE
MAALI_TOOL_CONFIGURE_EVAL
MAALI_TOOL_CRAY_CPU_TARGET
MAALI_TOOL_CRAY_PRGENV
MAALI_TOOL_CUDA_COMPILER
MAALI_TOOL_CUDA_COMPILERS
MAALI_TOOL_LOG
MAALI_TOOL_MAJOR_MINOR_VERSION
MAALI_TOOL_MAJOR_VERSION
MAALI_TOOL_MODULE
MAALI_TOOL_MODULE_DIR
MAALI_TOOL_NAME
MAALI_TOOL_VERSION
MAALI_TOOL_NAME-gpu
MAALI_TOOL_NAME_ORIG
MAALI_TOOL_NAME_UPPERCASE
MAALI_TOOL_PATCHES
MAALI_TOOL_PREREQ
MAALI_TOOL_PREREQ_MODULE
MAALI_TOOL_PREREQ_REV
MAALI_TOOL_TYPE
MAALI_TOOL_VERSION
MAALI_TOOL_VERSION_CURRENT_DEFAULT
MAALI_TYPE
MAALI_UNINSTALL_HIDE
MAALI_UNINSTALL_REMOVE
MAALI_UNPACK_MKDIR 
MAALI_UNZIP_EXCLUDE
MAALI_URL
MAALI_URL_ARRAY
MAALI_USER_MAP
MAALI_VERSION
MAALI_WGET_CMD
MAALI_WGET_EXTRA
MAALI_WIKI_CATEGORY
MAALI_WIKI_CATEGORY_ITEM
MAALI_WIKI_COMPILER_STRING
MAALI_WIKI_SRC
MAALI_WIKI_SYSTEM_NAME
MAALI_WIKI_TOOL_NAME
