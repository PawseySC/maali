
_MAALI_TOOL_TYPE_ - string variable that is set in the cygnet file to the type of tool being installed 

_MAALI_TOOL_VERSION_ - string variable that is set in the cygnet file as an input argument on the maali usage are for the -v flag..

_MAALI_DEFAULT_PYTHON_ - list of the python versions set in the cygnet files used in a for loop in the main maali script.

<code> for MAALI_DEFAULT_PYTHON_COMPILER in $MAALI_DEFAULT_PYTHON; do </code>

_MAALI_DST_ - used in the cygnet files as a key-pair value for the directory where the codes source repo is defined.

_MAALI_FILES_DIR_ - string variable used to defined the list of directories to search for cygnet files -- should be renamed something like CYGNET_FILE_DIR

_MAALI_FOUND_CYGENT_ - boolean variable set to 1 if cygnet file is found on system otherwise maali will try to download cygnet files from github.

_MAALI_INSTALL_DIR_ - string variable that uses "$MAALI_INSTALL_TOOLDIR/$MAALI_TOOL_VERSION" as defined in the cygnet files. This is the installation directory for the tool.

_MAALI_MODULE_CONFLICT_ - string variable set in maali cygnet files listing module conflicts

_MAALI_MODULE_RESTRICT_GROUP_ - string variable set in the maali cygnet files and used in the maali_module function

_MAALI_MODULE_SET_CPATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_CRAY_LD_LIBRARY_PATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_FCPATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_FPATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_INCLUDE_PATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_LD_LIBRARY_PATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_MANPATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_PATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_PERLLIB_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_PKG_CONFIG_PATH_ - boolean variable used in the cygnet files to setup the PKG_CONFIG path in the module file.

_MAALI_MODULE_SET_PYTHONPATH_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_SET_R_LIBS_ - string variable defined in the cygnet file to setup module environment 

_MAALI_MODULE_LIST_WM_CFLAGS_ -string variable set in the openFOAM cygnet file

_MAALI_MODULE_LIST_WM_CXXFLAGS_ - string variable set in the openFOAM cygnet file

_MAALI_MODULE_WHATIS_ - string variable that is set in the maali cygnet files with a text string about what the code does.
contents of files in */etc*. MAALI_OS is part of the path for location cygnet files.

_MAALI_PREREQ_MODULE_ - string variable that is set in the cygnet files used to list any prequisite modules for writing environment modules.

_MAALI_DEFAULT_SYSTEM_GCC_ - string variable defined in config file and used in cygnet files when only building with the default gcc/gnu compilers

_MAALI_TOOL_BUILD_DIR_ - string variable defined in the cygnet files that is the full path to where the source code is compiled

_MAALI_TOOL_BUILD_PREREQ_ - string variable defined in the cygnet files that is lists any prerequisite modules.

_MAALI_TOOL_COMPILERS_ - string variable defined in the cygnet files that is the list of compilers to use to install application.

_MAALI_TOOL_CONFIGURE_ - string variable defined in the cygnet files that is the list of configuration options used to create the Makefile.

_MAALI_TOOL_CONFIGURE_EVAL_ - string variable defined in the cygnet files for the configure command

_MAALI_TOOL_CRAY_PRGENV_ - string variable that is set in the cygnet files, used to define the list of compilers that 

_MAALI_TOOL_CUDA_COMPILERS_ - string variable that is set in the cygnet files, used to define the list of CUDA compilers.

_MAALI_TOOL_NAME_ - string variable that is set to the name of the application/lib in the cygnet file

_MAALI_TOOL_PATCHES_ - variable that list the tool patches numbers in the tool cygnet files.

_MAALI_TOOL_PREREQ_ - variable that is set in the cygnet files that list the prerequist module files needed for the application or tool

_MAALI_UNPACK_MKDIR_ - boolean variable defined in the libcircle.cyg cygnet file that is used in the maali_unpack function.

_MAALI_UNZIP_EXCLUDE_ - string variable defined in the tassel.cyg cygnet file.

_MAALI_URL_ - string variable defined in the cygnet files that is url location for the wget command.

_MAALI_WIKI_CATEGORY_ - string variable defined in the cygnet files

# _MAALI_PYTHON_LIBDIR_ - string variable set in the python.cyg file to defined as an environment variable for use in other python packages. 
