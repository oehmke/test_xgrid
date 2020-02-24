# test_xgrid

  This repository contains test code to allow the comparison of the Geophysical Fluid Dynamics Laboratory (GFDL)
exchange grid and the Earth System Modeling Framework (ESMF) exchange grid. It creates an exchange grid using either 
GFDL or ESMF exchange grid creation routines. The exchange grid is created between a cubed sphere atmosphere grid (C48)
on one side, and a cubed sphere land grid (C48) plus a tripolar ocean grid (720x480) on the other. To do the comparison,
data is transferred from the atmosphere grid, to the exchange grid, to the land/ocean grids, and then back again. 
The two types of exchange grid are compared both by how accurately the integral of the data is preserved (conservation)
between the different stages, and by the time taken to transfer the data between the different stages. The eventual goal is 
for ESMF's exchange grid to be able to replicate GFDL's closely enough that it can be used to provide functionality like that
used to couple models in GFDL's Flexible Modeling System (FMS) in ESMF based general purpose model coupling systems. 

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

