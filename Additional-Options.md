## Restricting Access

You can use <tt>MAALI_MODULE_RESTRICT_GROUP</tt> to restrict who has access to the software. This should be set to a posix group which the installing username is a member of as it is only used for system builds.

For example USEARCH is restricted to the <tt>usearch</tt> POSIX group using:

    MAALI_MODULE_RESTRICT_GROUP='usearch'

If you override <tt>maali_build</tt>, <tt>maali_cmake_build</tt> or <tt>maali_python_build</tt> you should make sure permissions are set correctly on the installed files:

    function maali_build {
	  maali_run "cd $MAALI_BUILD_DIR"
	  maali_run "mkdir -p $MAALI_INSTALL_DIR/bin"
	  maali_run "install -m 750 ${MAALI_TOOL_NAME}${MAALI_TOOL_VERSION}_i86linux32 $MAALI_INSTALL_DIR/bin/$MAALI_TOOL_NAME"

	  maali_run "chmod 750 $MAALI_INSTALL_DIR"
	  maali_run "chmod 750 $MAALI_INSTALL_DIR/bin"
	  maali_run "chgrp -R $MAALI_MODULE_RESTRICT_GROUP $MAALI_INSTALL_DIR"
	}

## Creating Module files

All of the variables that let you set environment variables in module files start with <tt>MAALI_MODULE_SET_</tt> and should set the environment variable of everything that follows this:

* <tt>MAALI_MODULE_SET_C_INCLUDE_PATH</tt> prepends <tt>C_INCLUDE_PATH</tt> with <tt>$MAALI_APP_HOME/include</tt>
* <tt>MAALI_MODULE_SET_CPATH</tt> prepends <tt>CPATH</tt> with <tt>$MAALI_APP_HOME/include</tt>
* <tt>MAALI_MODULE_SET_CPLUS_INCLUDE_PATH</tt> prepends <tt>CPLUS_INCLUDE_PATH</tt> with <tt>$MAALI_APP_HOME/include</tt>
* <tt>MAALI_MODULE_SET_CRAY_LD_LIBRARY_PATH</tt> prepends <tt>CRAY_LD_LIBRARY_PATH</tt> with <tt>$MAALI_APP_HOME/lib</tt> 
* <tt>MAALI_MODULE_SET_FCPATH</tt> prepends <tt>FCPATH</tt> with <tt>$MAALI_APP_HOME/include</tt>
* <tt>MAALI_MODULE_SET_FPATH</tt> prepends <tt>FPATH</tt> with <tt>$MAALI_APP_HOME/include</tt>
* <tt>MAALI_MODULE_SET_INCLUDE_PATH</tt> prepends <tt>INCLUDE_PATH</tt> with <tt>$MAALI_APP_HOME/include</tt>
* <tt>MAALI_MODULE_SET_LD_LIBRARY_PATH</tt> prepends <tt>LD_LIBRARY_PATH</tt> with <tt>$MAALI_APP_HOME/lib</tt>
* <tt>MAALI_MODULE_SET_LD_PRELOAD</tt> prepends <tt>LD_PRELOAD</tt> with <tt>$MAALI_APP_HOME/lib/$MAALI_MODULE_SET_LD_PRELOAD</tt>
* <tt>MAALI_MODULE_SET_MANPATH</tt> prepends <tt>MANPATH</tt> with <tt>$MAALI_APP_HOME/share/man</tt>
* <tt>MAALI_MODULE_SET_PERLLIB</tt> prepends <tt>PERLLIB</tt> and <tt>PERL5LIB</tt> with <tt>$MAALI_APP_HOME/lib/perl5/site_perl/5.10.1</tt> if set to 1, <tt>$MAALI_APP_HOME/$MAALI_MODULE_SET_PERLLIB</tt> otherwise
* <tt>MAALI_MODULE_SET_PKG_CONFIG_PATH</tt> prepends <tt>PKG_CONFIG_PATH</tt> with <tt>$MAALI_APP_HOME/lib/pkgconfig</tt>


Everything else that starts with <tt>MAALI_MODULE_SET_</tt> will have <tt>MAALI_MODULE_SET_</tt> stripped from the name and maali will add setenv name with the value of the variable to the module file.


<tt>MAALI_MODULE_SET_PATH</tt> prepends <tt>PATH</tt> with <tt>$MAALI_APP_HOME/bin</tt> if set to 1 or <tt>$MAALI_APP_HOME</tt> if set to "toplevel". Otherwise is treated as a space separated locations to be added to <tt>$MAALI_APP_HOME</tt>. For example glimmer sets this to <tt>MAALI_MODULE_SET_PATH="bin scripts"</tt> so <tt>$MAALI_APP_HOME/bin</tt> and <tt>$MAALI_APP_HOME/scripts</tt> get pre-pended to <tt>PATH</tt>.


<tt>MAALI_MODULE_SET_PYTHONPATH</tt> prepends <tt>PYTHONPATH</tt> with <tt>$MAALI_APP_HOME/\$env(MAALI_PYTHON_LIBDIR)/python\$env(PYTHON_LIB_VERSION)/site-packages</tt>. This happens automatically with Python Libraries.


<tt>MAALI_MODULE_WHATIS</tt> sets module what-is.


There is an option on maali to **just** generate the module file. This is useful when you have forgotten to set one of the above variables, and want to re-create the module file. This can be done by specifying the <tt>-m</tt> switch:

    $ maali -t parallel -v 20151022 -c sles11sp4 -m
	Using /home/maali/.maali/sles11sp4/cygnet_files/parallel.cyg for tool configuration information
	just re-creating the module file
	creating module in /pawsey/sles11sp4/modulefiles/tools/parallel</pre>


## Re-building with a specific compiler

You can compile software with a specific compiler if you want to test whether a new compiler (or even compiler version) can support compiling the software. This is specified using the <tt>-r</tt> switch:

    maali -t parallel -v 20151022 -c sles11sp4 -r 'intel/15.0.5' -b
	Using /home/maali/.maali/sles11sp4/cygnet_files/parallel.cyg for tool configuration information
	.. setting MAALI_TOOL_COMPILERS to intel/15.0.5
	.. loading intel/15.0.5
	downloading the source code for parallel 20151022
	building parallel 20151022 with intel/15.0.5
	.. loading intel/15.0.5
	.. check for build only modules
	.. unpacking the source code for parallel 20151022
	.. compiling parallel 20151022 with intel/15.0.5
	creating module in /pawsey/sles11sp4/modulefiles/tools/parallel
	skipping module creation

Note we also use the <tt>-b</tt> switch to prevent the module file being re-created. If we didn't this could potentially break software as the module would be re-created incorrectly:

    maali -t parallel -v 20151022 -c sles11sp4 -r 'intel/15.0.5' 
	Using /home/maali/.maali/sles11sp4/cygnet_files/parallel.cyg for tool configuration information
	.. setting MAALI_TOOL_COMPILERS to intel/15.0.5
	.. loading intel/15.0.5
	downloading the source code for parallel 20151022
	building parallel 20151022 with intel/15.0.5
	.. loading intel/15.0.5
	.. check for build only modules
	.. unpacking the source code for parallel 20151022
	.. compiling parallel 20151022 with intel/15.0.5
	creating module in /pawsey/sles11sp4/modulefiles/tools/parallel

Note than the intel version has put a conflict in with gcc/4.8.5:

    $ diff /pawsey/sles11sp4/modulefiles/tools/parallel/20151022 /pawsey/sles11sp4/modulefiles/tools/parallel/20151022~
	15,18c15,17
	< conflict gcc/4.8.5
	< setenv       MAALI_PARALLEL_HOME /pawsey/sles11sp4/tools/$env(COMPILER)/$env(COMPILER_VER)/parallel/20151022
	< prepend-path MANPATH             /pawsey/sles11sp4/tools/$env(COMPILER)/$env(COMPILER_VER)/parallel/20151022/share/man
	< prepend-path PATH                /pawsey/sles11sp4/tools/$env(COMPILER)/$env(COMPILER_VER)/parallel/20151022/bin
	---
	> setenv       MAALI_PARALLEL_HOME /pawsey/sles11sp4/tools/gcc/4.3.4/parallel/20151022
	> prepend-path MANPATH             /pawsey/sles11sp4/tools/gcc/4.3.4/parallel/20151022/share/man
	> prepend-path PATH                /pawsey/sles11sp4/tools/gcc/4.3.4/parallel/20151022/bin