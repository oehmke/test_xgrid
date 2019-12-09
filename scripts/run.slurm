#!/usr/bin/csh -fv
########################################################################
# generic run script for experiments                     
#
# TO CHANGE THIS TO WORK FOR A NEW LOCATION:
#   + Change $SBATCH -D to point to the output directory up one level (../output)
#   + Change rootdir to point to the parent directory of where this script is located (i.e. ..)
#
########################################################################
#SBATCH -J test_xgrid
#SBATCH -t 30
#SBATCH -n 36
#SBATCH -q debug
#SBATCH -A nems
#SBATCH -o test_xgrid.%j.out
#SBATCH -e test_xgrid.%j.err
#SBATCH -D /scratch1/NCEPDEV/nems/Robert.Oehmke/test_xgrid/output

  set rootdir = /scratch1/NCEPDEV/nems/Robert.Oehmke/test_xgrid/  
  set echo
  set debug = 1
  set name = test_xgrid
  set inputdir = $rootdir/input
  set executable = $rootdir/exec/test_xgrid.x

  set mosaic_grid = $inputdir/C48.C48.tripolar.mosaic.tar
  set atmos_data = $inputdir/atmos_daily.tar
  set npes = 36

  setenv siteConfig ./env.cshrc
  if ( -f $siteConfig ) source $siteConfig
  limit stacksize    unlimited
  limit coredumpsize unlimited

  setenv MPICH_UNEX_BUFFER_SIZE 256m
  setenv MPICH_MAX_SHORT_MSG_SIZE 64000
  setenv MPICH_PTL_UNEX_EVENTS 160k
  setenv cores_per_node  32
  setenv KMP_STACKSIZE 256m
  setenv NC_BLKSZ 1M

  set workDir = $rootdir/work/
  if ( -d $workDir ) then
   rm -rf $workDir
  endif
  mkdir -p $workDir

  cd $workDir
 
  if ( ! -d INPUT   ) mkdir INPUT 
  if ( ! -d RESTART ) mkdir RESTART

  cd $workDir/INPUT
  tar -xvf $mosaic_grid
  tar -xvf $atmos_data

  cd $workDir
  cp $executable $executable:t
cat > input.nml <<EOF
 &xgrid_nml
     use_esmf_xgrid = .true.
     interp_method = 'first_order'
     make_exchange_reproduce=.false.
     xgrid_clocks_on = .true.
/

 &fms_nml
     domains_stack_size=100000
/

 &xgrid_test_nml
 test_unstruct = .false.
 atm_layout=2,3
 lnd_layout= 2,3
 ice_layout=6,6
 nk_lnd = 12
 nk_ice = 12
 num_loop = 1000
 atm_input_file='INPUT/atmos_daily'
 atm_field_name='t_ref_max'
/
EOF

# nk_lnd = 12
# nk_ice = 12

# check module files
  echo "Check module files"
  module list

 # Run executable
  srun ./$executable:t |& tee fms.out
  if ( $status != 0 ) then
     echo "ERROR: test_xgrid  case1"
     exit 1
  else
     echo "NOTE: successfully run test_xgrid case1"
  endif
