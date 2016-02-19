# Dockerize FiPY

Test FiPy installation on a Docker instance.

## Install Docker

See https://docs.docker.com/engine/installation/linux/ubuntulinux/ for
details.

## Build an Empty Interactive Docker Instance

    $ sudo service docker start
    $ docker build --no-cache -t fipy-test .
    $ docker run -i -t fipy-test /bin/bash

## Setup FiPy

Build the environment in Docker

    # su testuser
    # cd /home/testuser/git/fipy-dockerize
    # ./setup.bash

Hit enter when asked for a password.

Finally, run the fipy tests to check that FiPy is installed correctly.

    # cd /home/testuser/git/fipy
    # export PATH="$HOME/anaconda/bin:$PATH"
    # hash -r
    # python setup.py test

## Issues

At the time of writing, the tests are giving the folling issues,

### PySparse

A few error due to element counts with Gmsh. Not significant.

    $ python setup.py test --pysparse
    FAILED (failures=4)
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    Skipped 2 doctest examples because `lsmlib` must be used to run some tests
    Skipped 83 doctest examples because the `tvtk` package cannot be imported
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

### Trilinos

Few errors due to Gmsh element counts.

    $ python setup.py test --trilinos
    FAILED (failures=4)
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    Skipped 2 doctest examples because `lsmlib` must be used to run some tests
    Skipped 2 doctest examples because the PySparse solvers are not being used.
    Skipped 83 doctest examples because the `tvtk` package cannot be imported
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

Mpirun with 1 job works

    $ mpirun -np 1 python setup.py test --trilinos
    FAILED (failures=4)
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    Skipped 2 doctest examples because `lsmlib` must be used to run some tests
    Skipped 2 doctest examples because the PySparse solvers are not being used.
    Skipped 83 doctest examples because the `tvtk` package cannot be imported
    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    --------------------------------------------------------------------------
    mpirun noticed that the job aborted, but has no info as to the process
    that caused that situation.
--------------------------------------------------------------------------



### Scipy

Scipy solvers fail early on due to an MKL issue. Not sure why MKL is
even being invoked.

    $ python setup.py test --scipy
    ...
    Doctest: fipy.terms.cellTerm.CellTerm._test ... ok _buildMatrix (fipy.terms.abstractDiffusionTerm._AbstractDiffusionTerm)
    Doctest: fipy.terms.abstractDiffusionTerm._AbstractDiffusionTerm._buildMatrix ... Intel MKL FATAL ERROR: Cannot load libmkl_avx.so or libmkl_def.so.

which is strange. Not sure why MKL is popping up here.


### Scipy

Fails early on ...

    $ python setup.py test --scipy
    ...
    Doctest: fipy.terms.cellTerm.CellTerm._test ... ok
    _buildMatrix (fipy.terms.abstractDiffusionTerm._AbstractDiffusionTerm)
    Doctest: fipy.terms.abstractDiffusionTerm._AbstractDiffusionTerm._buildMatrix ... Intel MKL FATAL ERROR: Cannot load libmkl_avx.so or libmkl_def.so.

This should be fixed by adding `nomkl` to the conda installs, but it
doesn't seem to work currently.
