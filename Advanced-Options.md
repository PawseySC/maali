The core of maali is a function called maali_build which should work with most software:

    function maali_build {
	  # this is the core function for creating software

	  # allows late evaluation
	  MAALI_TOOL_CONFIGURE_EVAL=`eval echo "$MAALI_TOOL_CONFIGURE"`

	  cd "$MAALI_TOOL_BUILD_DIR"
	  maali_run "./configure --prefix=$MAALI_INSTALL_DIR $MAALI_TOOL_CONFIGURE_EVAL"
	  maali_run "make"
	  maali_run "make install"
	}

If you need to add other options to configure, simply set <tt>MAALI_TOOL_CONFIGURE</tt>. For example, the cygenet file for pdsh sets this to:

    MAALI_TOOL_CONFIGURE='--with-ssh'

The cygnet file for TurboVNC this is set to:

    MAALI_TOOL_CONFIGURE='-DTJPEG_INCLUDE_DIR=$MAALI_LIBJPEGTURBO_HOME/include -DTJPEG_LIBRARY=$MAALI_LIBJPEGTURBO_HOME/lib/libturbojpeg.a'

All maali software will set an environment variable MAALI_ + tool name in uppercase (without dashes or pluses) + _HOME to the install location (or home) of the software. This allows you to refer to installed software without static paths. If we do a <tt>module display libjpeg-turbo</tt> we get:

    -------------------------------------------------------------------
    /pawsey/sles11sp4/modulefiles/devel/libjpeg-turbo/1.4.2:
    
    setenv           MAALI_LIBJPEGTURBO_HOME /pawsey/sles11sp4/devel/gcc/4.3.4/libjpeg-turbo/1.4.2 
    prepend-path     PATH /pawsey/sles11sp4/devel/gcc/4.3.4/libjpeg-turbo/1.4.2/bin 
    -------------------------------------------------------------------

Because libjpeg-turbo is a pre-requisite of turbovnc, we set MAALI_TOOL_PREREQ to indicate it is required:

    MAALI_TOOL_PREREQ="libjpeg-turbo/1.4.2"

maali will <tt>module load</tt> each of the modules listed in <tt>MAALI_TOOL_PREREQ</tt>. If it can't load it, it will stop processing. As another example, GCC requires three software dependencies:

    MAALI_TOOL_PREREQ="gmp/4.3.2 mpfr/2.4.2 mpc/1.0.2"

They are all loaded before gcc is compiled. The GCC cygnet file also re-defines the standard <tt>maali_build</tt> function, as it wants to build in a sub-directory:

    function maali_build {
	  cd "$MAALI_TOOL_BUILD_DIR"
	  mkdir build-gcc
	  cd build-gcc

	  maali_run "../configure --prefix=$MAALI_INSTALL_DIR --enable-languages=c,c++,fortran --enable-shared --enable-threads=posix --disable-multilib --enable-cxa_atexit --with-gmp=$MAALI_GMP_HOME --with-mpfr=$MAALI_MPFR_HOME --with-mpc=$MAALI_MPC_HOME"
	  maali_run "make"
	  maali_run "make install"
	}

Notice the references to <tt>MAALI_GMP_HOME</tt>, <tt>MAALI_MPFR_HOME</tt> and <tt>MAALI_MPC_HOME</tt>. <tt>module load</tt> for each of these dependencies is added to the module file for GCC as well:

    -------------------------------------------------------------------
	/pawsey/sles11sp4/modulefiles/devel/gcc/4.8.5:

	module           load gmp/4.3.2 
	module           load mpfr/2.4.2 
	module           load mpc/1.0.2 
	setenv           MAALI_GCC_HOME /pawsey/sles11sp4/devel/gcc/4.3.4/gcc/4.8.5 
	setenv           CC gcc 
	setenv           COMPILER gcc 
	setenv           COMPILER_VER 4.8.5 
	setenv           CXX g++ 
	setenv           F77 gfortran 
	setenv           F90 gfortran 
	setenv           F95 gfortran 
	setenv           F9X gfortran 
	setenv           FC gfortran 
	prepend-path     LD_LIBRARY_PATH /pawsey/sles11sp4/devel/gcc/4.3.4/gcc/4.8.5/lib 
	prepend-path     MANPATH /pawsey/sles11sp4/devel/gcc/4.3.4/gcc/4.8.5/share/man 
	prepend-path     PATH /pawsey/sles11sp4/devel/gcc/4.3.4/gcc/4.8.5/bin 
	-------------------------------------------------------------------

But how are the other setenv's generated? By setting the following variables:

    MAALI_MODULE_SET_COMPILER='gcc'
	MAALI_MODULE_SET_COMPILER_VER='$MAALI_TOOL_VERSION'
	MAALI_MODULE_SET_CC='gcc'
	MAALI_MODULE_SET_CXX='g++'
	MAALI_MODULE_SET_FC='gfortran'
	MAALI_MODULE_SET_F77='gfortran'
	MAALI_MODULE_SET_F90='gfortran'
	MAALI_MODULE_SET_F95='gfortran'
	MAALI_MODULE_SET_F9X='gfortran'

Any environment variable that starts with <tt>MAALI_MODULE_SET_</tt> will be used to create the module. The <tt>MAALI_MODULE_SET_</tt> gets stripped off to determine the name of the variables. You can even use environment variables in the values. For example, wise wants to set WISECONFIGDIR to the location of the config files. We set:

    MAALI_MODULE_SET_WISECONFIGDIR='$MAALI_APP_HOME/wisecfg'

<tt>MAALI_APP_HOME</tt> is an internal variable that maali uses to determine where a particular pieces of software is locate at run time. For a piece of software compiled with a single compiler this is the same as <tt>MAALI_INSTALL_DIR</tt>. For software is compiled with two compilers, it is set to:

    MAALI_APP_HOME="$MAALI_APPS_DIR/\$env(COMPILER)/\$env(COMPILER_VER)/$MAALI_TOOL_NAME/$MAALI_TOOL_VERSION"

The other kind of pre-requisite module is one required for building software, but not for running software. Like CMake. Set <tt>MAALI_TOOL_BUILD_PREREQ</tt> to a space seperate list of required software for building:

    MAALI_TOOL_BUILD_PREREQ="cmake/2.8.12.2"

If you specify CMake, maali will use the <tt>maali_cmake_build</tt> function instead:

    function maali_cmake_build {
	  # for tools that use cmake

	  # allows late evaluation
	  MAALI_TOOL_CONFIGURE_EVAL=`eval echo "$MAALI_TOOL_CONFIGURE"`

	  # cmake likes to build in a director of it's own
	  maali_makedir "$MAALI_TOOL_BUILD_DIR/$MAALI_TOOL_NAME-build"
	  cd "$MAALI_TOOL_BUILD_DIR/$MAALI_TOOL_NAME-build"

	  maali_run "cmake -DCMAKE_INSTALL_PREFIX=$MAALI_INSTALL_DIR $MAALI_TOOL_CONFIGURE $MAALI_CMAKE_PATH"
	  if [ $DEBUG ]; then
		maali_run "make VERBOSE=TRUE"
	  else
		maali_run "make"
	  fi
	  maali_run "make install"
	}

But as with <tt>maali_build</tt> you can overrride it. TurboVNC uses:

    function maali_cmake_build {

	  # allows late evaluation
	  MAALI_TOOL_CONFIGURE_EVAL=`eval echo "$MAALI_TOOL_CONFIGURE"`

	  # cmake likes to build in a director of it's own
	  maali_makedir "$MAALI_TOOL_BUILD_DIR/$MAALI_TOOL_NAME-build"
	  cd "$MAALI_TOOL_BUILD_DIR/$MAALI_TOOL_NAME-build"

	  maali_run "cmake -G \"Unix Makefiles\" -DCMAKE_INSTALL_PREFIX=$MAALI_INSTALL_DIR $MAALI_TOOL_CONFIGURE $MAALI_CMAKE_PATH"
	  if [ $DEBUG ]; then
		maali_run "make VERBOSE=TRUE"
	  else
		maali_run "make"
	  fi
	  maali_run "make install"
	}

python libraries are also treated a little differently. Instead of setting <tt>MAALI_TOOL_COMPILERS</tt> to gcc or intel, we set it to a python module (eg. "python/2.6.9"). Once again, maali detects this and will set <tt>MAALI_PYTHON_TOOL</tt> to 1 and  <tt>MAALI_TOOL_TYPE</tt> to "python". It uses the function <tt>maali_python_build</tt> to build the software:

    function maali_python_build {
	  # should work with most python packages

	  # need to add the python library path to PYTHONPATH temporarily
	  MAALI_OLD_PYTHONPATH=$PYTHONPATH
	  MAALI_NEWPYTHONPATH="$MAALI_INSTALL_DIR/$MAALI_PYTHON_LIBDIR/python$MAALI_PYTHON_LIB_VERSION/site-packages"
	  export PYTHONPATH="$MAALI_NEWPYTHONPATH:$PYTHONPATH"

	  maali_makedir "$MAALI_NEWPYTHONPATH"

	  cd "$MAALI_TOOL_BUILD_DIR"
	  maali_run "python setup.py build"
	  maali_run "python setup.py install --prefix=$MAALI_INSTALL_DIR"

	  export PYTHONPATH=$MAALI_OLD_PYTHONPATH
	}

It will also set <tt>PYTHONPATH</tt> in the module file to the correct path. And load the default python on the system, if the user has not loaded a python version before hand.

The cygnet file for a python library should be very simple. Something like:

    ##############################################################################
	# maali cygnet file for distribute
	##############################################################################

	# specify which compilers we want to build the tool with
	MAALI_TOOL_COMPILERS="$MAALI_DEFAULT_PYTHON"

	# URL to download the source code from
	MAALI_URL="http://pypi.python.org/packages/source/$MAALI_PYTHON_FIRSTLETTER/$MAALI_TOOL_NAME_ORIG/$MAALI_TOOL_NAME_ORIG-$MAALI_TOOL_VERSION.tar.gz"

	# location we are downloading the source code to
	MAALI_DST="$MAALI_SRC/$MAALI_TOOL_NAME_ORIG-$MAALI_TOOL_VERSION.tar.gz"

	# where the unpacked source code is located
	MAALI_TOOL_BUILD_DIR="$MAALI_BUILD_DIR/$MAALI_TOOL_NAME_ORIG-$MAALI_TOOL_VERSION"

	# tool pre-requisites
	MAALI_TOOL_PREREQ=""

	# tool build pre-requisites - not added to the module, only needed for building (loaded after MAALI_TOOL_PREREQ)
	MAALI_TOOL_BUILD_PREREQ="setuptools/1.1.6"

	##############################################################################
