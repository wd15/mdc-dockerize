# Try FiPy in a Docker Instance

## Install Docker

See https://docs.docker.com/engine/installation/linux/ubuntulinux/ for
details.

## Build an Empty Interactive Docker Instance

    $ git clone https://github.com/wd15/fipy-dockerize.git
    $ cd fipy-dockerize
    $ sudo service docker start
    $ docker build --no-cache -t fipy-test .

## Test FiPy

Build the environment in Docker

    $ docker run -i -t fipy-test /bin/bash
    # su testuser
    # cd /home/testuser/git/fipy
    # python setup.py test --pysparse
