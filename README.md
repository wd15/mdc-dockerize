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
    # ~/anaconda/bin/python setup.py test
