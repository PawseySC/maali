
# MAALI_TOOL_TYPE - string variable that is set in the cygnet file to the type of tool being installed 

# MAALI_TOOL_VERSION - string variable that is set in the cygnet file as an input argument on the maali usage are for the -v flag..

# MAALI_DEFAULT_PYTHON - list of the python versions set in the cygnet files used in a for loop in the main maali script.
for MAALI_DEFAULT_PYTHON_COMPILER in $MAALI_DEFAULT_PYTHON; do

### MAALI_DST - used in the cygnet files as a key-pair value for the directory where the codes source repo is defined.

### MAALI_FILES_DIR - string variable used to defined the list of directories to search for cygnet files -- should be renamed something like CYGNET_FILE_DIR

### MAALI_FOUND_CYGENT - booleand variable set to 1 if cygnet file is found on system otherwise maali will try to download cygnet files from github.

### MAALI_INSTALL_DIR - string variable that uses "$MAALI_INSTALL_TOOLDIR/$MAALI_TOOL_VERSION" as defined in the cygnet files. This is the installation directory for the tool.

### MAALI_MODULE_CONFLICT - string variable set in maali cygnet files listing module conflicts

### MAALI_MODULE_RESTRICT_GROUP - string variable set in the maali cygnet files and used in the maali_module function

### MAALI_MODULE_SET_CPATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_CRAY_LD_LIBRARY_PATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_FCPATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_FPATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_INCLUDE_PATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_LD_LIBRARY_PATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_MANPATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_PATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_PERLLIB -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_PKG_CONFIG_PATH - boolean variable used in the cygnet files to setup the PKG_CONFIG path in the module file.

### MAALI_MODULE_SET_PYTHONPATH -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_SET_R_LIBS  -string variable defined in the cygnet file to setup module environment 

### MAALI_MODULE_LIST_WM_CFLAGS -string variable set in the openFOAM cygnet file

### MAALI_MODULE_LIST_WM_CXXFLAGS - string variable set in the openFOAM cygnet file

### MAALI_MODULE_WHATIS - string variable that is set in the maali cygnet files with a text string about what the code does.
contents of files in /etc. MAALI_OS is part of the path for location cygnet files.

### MAALI_PREREQ_MODULE - string variable that is set in the cygnet files used to list any prequisite modules for writing environment modules.

### MAALI_DEFAULT_SYSTEM_GCC - string variable defined in config file and used in cygnet files when only building with the default gcc/gnu compilers
### MAALI_TOOL_BUILD_DIR - string variable defined in the cygnet files that is the full path to where the source code is compiled
### MAALI_TOOL_BUILD_PREREQ - string variable defined in the cygnet files that is lists any prerequisite modules.
### MAALI_TOOL_COMPILERS - string variable defined in the cygnet files that is the list of compilers to use to install application.
### MAALI_TOOL_CONFIGURE - string variable defined in the cygnet files that is the list of configuration options used to create the Makefile.
### MAALI_TOOL_CONFIGURE_EVAL - string variable defined in the cygnet files for the configure command
### MAALI_TOOL_CRAY_PRGENV - string variable that is set in the cygnet files, used to define the list of compilers that 
### MAALI_TOOL_CUDA_COMPILERS - string variable that is set in the cygnet files, used to define the list of CUDA compilers.
### MAALI_TOOL_NAME - string variable that is set to the name of the application/lib in the cygnet file
### MAALI_TOOL_PATCHES - variable that list the tool patches numbers in the tool cygnet files.
### MAALI_TOOL_PREREQ - variable that is set in the cygnet files that list the prerequist module files needed for the application or tool

### MAALI_UNPACK_MKDIR - boolean variable defined in the libcircle.cyg cygnet file that is used in the maali_unpack function.
### MAALI_UNZIP_EXCLUDE - string variable defined in the tassel.cyg cygnet file.
### MAALI_URL - string variable defined in the cygnet files that is url location for the wget command.
### MAALI_WIKI_CATEGORY - string variable defined in the cygnet files


# MAALI_PYTHON_LIBDIR - string variable set in the python.cyg file to defined as an environment variable for use in other python packages. 
