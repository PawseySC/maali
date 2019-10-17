What if we want to install GNU Parallel? First we need to create a new config file for it in <tt>$HOME/.maali/sles11sp4/cygnet_files/</tt>, called <tt>parallel.cyg</tt>. We can check it into CVS later:

    $ cd $HOME/.maali/sles11sp4/cygnet_files/
	$ vi parallel.cyg 
	$ cat parallel.cyg 
	##############################################################################
	# maali cygnet file for pdsh
	##############################################################################

	# specify which compilers we want to build the tool with
	MAALI_TOOL_COMPILERS="$MAALI_DEFAULT_SYSTEM_GCC"

	# URL to download the source code from
	MAALI_URL="http://mirror.aarnet.edu.au/pub/gnu/parallel/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION.tar.bz2"

	# location we are downloading the source code to
	MAALI_DST="$MAALI_SRC/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION.tar.bz2"

	# where the unpacked source code is located
	MAALI_TOOL_BUILD_DIR="$MAALI_BUILD_DIR/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION"

	# type of tool (eg. apps, devel, python, etc.)
	MAALI_TOOL_TYPE="tools"

	# for auto-building module files
	MAALI_MODULE_SET_PATH=1
	MAALI_MODULE_SET_MANPATH=1

First we specify which compilers we want to build the tool with:

    MAALI_TOOL_COMPILERS="$MAALI_DEFAULT_SYSTEM_GCC"

This is a space separated list, so we could have <tt>MAALI_TOOL_COMPILERS="gcc/4.8.5 intel/15.0.5"</tt> to compile with gcc and icc. The system will have a set of default compilers which software should be compiled with, contained in the <tt>MAALI_DEFAULT_COMPILERS</tt> environment variable. maali will automatically detect intel and GNU compilers and fill <tt>MAALI_DEFAULT_GCC_COMPILERS</tt> and <tt>MAALI_DEFAULT_INTEL_COMPILERS</tt> with a subset of the <tt>MAALI_TOOL_COMPILERS</tt> which match.

For example on Zeus:
* <tt>MAALI_DEFAULT_COMPILERS</tt> is set to "gcc/4.8.5 intel/15.0.5"
* so <tt>MAALI_DEFAULT_GCC_COMPILERS</tt> will be set to "gcc/4.8.5"
* and <tt>MAALI_DEFAULT_INTEL_COMPILERS</tt> will be set to "intel/15.0.5"

In our example we are using <tt>MAALI_DEFAULT_SYSTEM_GCC</tt> which is the gcc version that is installed as part of the Operating System. In the case of SLES 11 and CLE 5 this would be gcc 4.3.4. CentOS 6 would be gcc 4.4.7.

Then we need to specify the URL to download the source code from:

    MAALI_URL="http://mirror.aarnet.edu.au/pub/gnu/parallel/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION.tar.bz2"

and the location we are downloading the source code to

    MAALI_DST="$MAALI_SRC/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION.tar.bz2"

There is a function called <tt>maali_download</tt> which checks to see if the code has been downloaded in the "cache" before attempting to download it using <tt>wget</tt>.

We also need to specify where the unpacked source code will be located:

    MAALI_TOOL_BUILD_DIR="$MAALI_BUILD_DIR/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION

There is a function called <tt>maali_unpack</tt> which will use file to determine how to decompress the source code. It looks at the type of file downloaded, and tries to decompress it in <tt>MAALI_BUILD_DIR</tt>.

By default, applications will be installed in <tt>apps</tt>, but we can override this classification:

    MAALI_TOOL_TYPE="tools"

Finally we need to need to tell maali what environment variables need to be set in the module that gets created. In the case of parallel we need to set <tt>PATH</tt> so we can run the binary and <tt>MANPATH</tt> so we can read the man page. We set <tt>MAALI_MODULE_SET_PATH</tt> and <tt>MAALI_MODULE_SET_MANPATH</tt> to 1 in the cygnet file

	# for auto-building module files
	MAALI_MODULE_SET_PATH=1
	MAALI_MODULE_SET_MANPATH=1

We can then build the software:

    $ maali -t parallel -v 20151022 -c sles11sp4
	.. loading gcc/4.3.4
	downloading the source code for parallel 20151022
	building parallel 20151022 with gcc/4.3.4
	.. loading gcc/4.3.4
	.. check for build only modules
	.. unpacking the source code for parallel 20151022
	.. compiling parallel 20151022 with gcc/4.3.4
	creating module in /pawsey/sles11sp4/modulefiles/tools/parallel

Because this is the first version compile on the system, it will also be the default:

    $ module load parallel                                                                                                                               
    $ which parallel
    /pawsey/sles11sp4/tools/gcc/4.3.4/parallel/20151022/bin/parallel

We can also see the <tt>MANPATH</tt> has been set:

    $ module display parallel
    -------------------------------------------------------------------
    /pawsey/sles11sp4/modulefiles/tools/parallel/20151022:
    
    setenv           MAALI_PARALLEL_HOME /pawsey/sles11sp4/tools/gcc/4.3.4/parallel/20151022 
    prepend-path     MANPATH /pawsey/sles11sp4/tools/gcc/4.3.4/parallel/20151022/share/man 
    prepend-path     PATH /pawsey/sles11sp4/tools/gcc/4.3.4/parallel/20151022/bin 
    -------------------------------------------------------------------
    
