# test_xgrid

  This repository contains test code to allow the comparison of the GFDL
exchange grid and the ESMF exchange grid.

  To compile, run the compile.csh script in the scripts directory. When compiling on a
different machine that Hera, a new env file will need to be written to
load the modules necessary for compiling on that machine. Once that is
written it should be switched for the env.here file in compile.csh. Currenty,
the XGridReproduce of ESMF should be used to compile. There remains a small
issue with the XGrid code on the ESMF master. Once that's fixed, I'll remove
this message and change hera.env.

  To run using slurm, first modify the run.slurm script. The #SBATCH -D
directive should be modified to give the path to the output directory.
Typically this directory is the "output" directory at the same level
as the script directory (i.e. ../output). Also, rootdir should be set to
give the path to the top of the test_xgrid directory. After these
modifications, and any others necessary to fit the script to the current
machine, sbatch run.slurm can be used to run the test.

