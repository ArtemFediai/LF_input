#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=64
#SBATCH --time=24:00:00
#SBATCH --job-name CT-1
#SBATCH --error out_%j.err
#SBATCH --output out_%j.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=artem.fedyay@gmail.com

module purge
module load gnu8/8.3.0
module load openmpi3/3.1.4

export LIGHTFORGE=/home/ws/bh5670/lightforge
export THREADFARM=/home/ws/bh5670/threadfarm
export PYTHONPATH=$LIGHTFORGE:$PYTHONPATH
export PYTHONPATH=$THREADFARM:$PYTHONPATH

export PATH=$LIGHTFORGE:$PATH

echo 'The value of $PATH is' $PATH
echo 'The value of $PYTHONPATH is' $PYTHONPATH

#export LOCAL=/home/ws/bh5670
#export LD_LIBRARY_PATH=$LOCAL/lib:$LD_LIBRARY_PATH
#export PATH=$LOCAL/bin:$PATH

export SCRATCH=/scratch

cd ${SLURM_SUBMIT_DIR}
ulimit -s unlimited

mpirun thread_mpi_exe.py joblist
