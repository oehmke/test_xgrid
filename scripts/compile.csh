#!/usr/bin/tcsh 

set debug = 1
set platform = intel

# Change this to point to the appropriate platform compilation settings
source ./env.hera

# Don't have list_paths, so comment out, but leave in case we need it later
#cd ../src
#list_paths -o pathnames_fms shared


# Set directory for executable and compiling
set execDir = ../exec

# Go into executable/compilation dir
cd $execDir

# This isn't available on every platform, so comment out, but leave in case we need to generate a new Makefile in the future
#mkmf -m Makefile -a ../src -p test_xgrid.x -t ../template/$platform.mk -c "-Duse_libMPI -Duse_netCDF -DTEST_XGRID" pathnames_fms  shared/include shared/mpp/include 

# Build based on debug flag
if( $debug == 1 ) then
   make  NETCDF=3 DEBUG=ON OPENMP=ON test_xgrid.x
else
   make  NETCDF=3 OPENMP=ON test_xgrid.x
endif

# Output status
if ( $status == 0 ) then
  echo "<NOTE> : make succeeded for test_xgrid.x"
else
  echo "*ERROR*: make failed for test_xgrid.x"
  exit 1
endif

exit 0
