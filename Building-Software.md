First you need to load maali using:

    $ module load maali

Run <tt>maali</tt> with no options to see what the switches are:

    usage: /pawsey/sles11sp4/tools/binary/maali/1.0b7/bin/maali -t toolname -v toolversion [-h] [-d] [-c maali config file] [-m] [-l] [-r compiler/version] [-b] [-g] [-s] [-w] [-a] [-u] [-x]

	maali - Pawsey Supercomputing Centre Build System

	OPTIONS:
	   -t      tool name
	   -v      tool version
	   -h      show this message
	   -d      run in debug mode
	   -c      maali configuration file
	   -m      just create the module file
	   -l      use the options from the last run
	   -r      build with the specified compiler (and no others)
	   -b      build the tool, but don't create a module file
	   -g      group build in /group//software
	   -s      activate system build
	   -w      workstation build in /home/maali/software
	   -a      activate this version as the default version
	   -f      force download from github
	   -u      unistall by hiding the module
	   -x      expunge tool from history
	   -n      NVIDIA mode; compile software with cuda support

At the minimum you need a tool name and a tool version. If you are building system software you will need a config file as well.

For example, we can install pdsh using:

    $ maali -t pdsh -v 2.29 -c sles11sp4
    Please set MAALI_BUILDER_UID your uid so we can track who is building software on 

System builds require you to set the environment variable <tt>MAALI_BUILDER_UID</tt> to your uid so we can track who installed the software:

    export MAALI_BUILDER_UID=schibeci

So when we run it again:

    $ maali -t pdsh -v 2.29 -c sles11sp4
    .. loading gcc/4.3.4
    downloading the source code for pdsh 2.29
    building pdsh 2.29 with gcc/4.3.4
    .. loading gcc/4.3.4
    .. check for build only modules
    .. unpacking the source code for pdsh 2.29
    .. compiling pdsh 2.29 with gcc/4.3.4
    creating module in /pawsey/sles11sp4/modulefiles/tools/pdsh

maali will search for cygnet files in five places:
* the user's home directory: <tt>$HOME/.maali/$MAALI_OS/cygnet_files/</tt>
* the user's home directory: <tt>$HOME/.maali/cygnet_files/</tt>
* a system-wide locate defined by <tt>$MAALI_FILES</tt>
* as part of the system-wide installation defined by <tt>$MAALI_DIR/cygnet_files</tt> (for version 1.0b7 on Zeus, this would be <tt>/pawsey/sles11sp4/tools/binary/maali/1.0b7/cygnet_files</tt>)
* you current working directory

The first match wins. In our example above, maali could not find cygnet file, so downloaded one from github and stored it in <tt>$HOME/.maali/$MAALI_OS/cygnet_files/</tt>:

    $ cat $HOME/.maali/sles11sp4/cygnet_files/pdsh.cyg
	##############################################################################
	# maali cygnet file for pdsh
	##############################################################################

	# specify which compilers we want to build the tool with
	MAALI_TOOL_COMPILERS="$MAALI_DEFAULT_SYSTEM_GCC"

	# URL to download the source code from
	MAALI_URL="https://pdsh.googlecode.com/files/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION.tar.bz2"

	# location we are downloading the source code to
	MAALI_DST="$MAALI_SRC/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION.tar.bz2"

	# where the unpacked source code is located
	MAALI_TOOL_BUILD_DIR="$MAALI_BUILD_DIR/$MAALI_TOOL_NAME-$MAALI_TOOL_VERSION"

	# type of tool (eg. apps, devel, python, etc.)
	MAALI_TOOL_TYPE="tools"

	# add additional configure options
	MAALI_TOOL_CONFIGURE='--with-ssh'

	# for auto-building module files
	MAALI_MODULE_SET_PATH=1
	MAALI_MODULE_SET_LD_LIBRARY_PATH=1
	MAALI_MODULE_SET_MANPATH=1

	##############################################################################</pre>

We can then load the compiled software:

    $ module load pdsh
	$ which pdsh
	/pawsey/sles11sp4/tools/gcc/4.3.4/pdsh/2.29/bin/pdsh
	$ pdsh -V
	pdsh-2.29
	rcmd modules: ssh,rsh,exec (default: rsh)
	misc modules: (none)

Look at the log files:

    $ head $HOME/.maali/sles11sp4/logs/*pdsh*
	#####################################################################
	pdsh 2.29 is being built by David Schibeci
	#####################################################################
	#####################################################################
	building pdsh 2.29 with gcc/4.3.4
	#####################################################################
	-- Making directory /pawsey/sles11sp4/tools/gcc/4.3.4/pdsh/2.29
	-- Running ./configure --prefix=/pawsey/sles11sp4/tools/gcc/4.3.4/pdsh/2.29 --with-ssh in /pawsey/sles11sp4/build/pdsh-2.29
	checking metadata... yes
	checking build system type... x86_64-unknown-linux-gnu

There is also a debug switch you can set on maali to get **very** verbose output:

    $ maali -t pdsh -v 2.29 -c sles11sp4 -d
	Searching for /home/maali/.maali/sles11sp4/cygnet_files/pdsh.cyg
	Searching for /home/maali/.maali/cygnet_files/pdsh.cyg
	Searching for logs/cygnet_files/pdsh.cyg
	Searching for ./pdsh.cyg
	--2015-10-25 15:32:31--  https://raw.githubusercontent.com/Pawseyops/maali-cygnet/master/sles11sp4/pdsh.cyg
	Resolving raw.githubusercontent.com... 103.245.222.133
	Connecting to raw.githubusercontent.com|103.245.222.133|:443... connected.
	HTTP request sent, awaiting response... 200 OK
	Length: 1007 [text/plain]
	Saving to: `/home/maali/.maali/sles11sp4/cygnet_files/pdsh.cyg'

	100%[=========================================================================================================================================>] 1,007       --.-K/s   in 0s      

	2015-10-25 15:32:31 (113 MB/s) - `/home/maali/.maali/sles11sp4/cygnet_files/pdsh.cyg' saved [1007/1007]

	Checking the size of /home/maali/.maali/sles11sp4/cygnet_files/pdsh.cyg
	.. loading gcc/4.3.4
	Trying to load gcc/4.3.4
	downloading the source code for pdsh 2.29
	.. need to download https://pdsh.googlecode.com/files/pdsh-2.29.tar.bz2 to /pawsey/sles11sp4/src/pdsh-2.29.tar.bz2
	building pdsh 2.29 with gcc/4.3.4
	.. before module load $MAALI_COMPILER
	Currently Loaded Modulefiles:
	  1) maali/1.0b7     2) slurm/14.11.8
	.. loading gcc/4.3.4
	Trying to load gcc/4.3.4
	.. after module load $MAALI_COMPILER
	Currently Loaded Modulefiles:
	  1) maali/1.0b7     2) slurm/14.11.8   3) gcc/4.3.4
	.. check for build only modules
	.. unpacking the source code for pdsh 2.29
	.. compiling pdsh 2.29 with gcc/4.3.4
	Running ./configure --prefix=/pawsey/sles11sp4/tools/gcc/4.3.4/pdsh/2.29 --with-ssh in /pawsey/sles11sp4/build/pdsh-2.29
	checking metadata... yes
	checking build system type... x86_64-unknown-linux-gnu
	checking host system type... x86_64-unknown-linux-gnu
	checking target system type... x86_64-unknown-linux-gnu
	checking for a BSD-compatible install... /usr/bin/install -c
	checking whether build environment is sane... yes

	SNIP

	make[2]: Nothing to be done for `install-data-am'.
	make[2]: Leaving directory `/pawsey/sles11sp4/build/pdsh-2.29/scripts'
	make[1]: Leaving directory `/pawsey/sles11sp4/build/pdsh-2.29/scripts'
	Making install in config
	make[1]: Entering directory `/pawsey/sles11sp4/build/pdsh-2.29/config'
	make[2]: Entering directory `/pawsey/sles11sp4/build/pdsh-2.29/config'
	make[2]: Nothing to be done for `install-exec-am'.
	make[2]: Nothing to be done for `install-data-am'.
	make[2]: Leaving directory `/pawsey/sles11sp4/build/pdsh-2.29/config'
	make[1]: Leaving directory `/pawsey/sles11sp4/build/pdsh-2.29/config'
	make[1]: Entering directory `/pawsey/sles11sp4/build/pdsh-2.29'
	make[2]: Entering directory `/pawsey/sles11sp4/build/pdsh-2.29'
	make[2]: Nothing to be done for `install-exec-am'.
	make[2]: Nothing to be done for `install-data-am'.
	make[2]: Leaving directory `/pawsey/sles11sp4/build/pdsh-2.29'
	make[1]: Leaving directory `/pawsey/sles11sp4/build/pdsh-2.29'
	creating module in /pawsey/sles11sp4/modulefiles/tools/pdsh
	differences between /pawsey/sles11sp4/modulefiles/tools/pdsh/2.29 and /pawsey/sles11sp4/modulefiles/tools/pdsh/2.29~