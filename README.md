## Dockerize FiPY

Test FiPy installation on a Docker instance.

### Install Docker

See https://docs.docker.com/engine/installation/linux/ubuntulinux/ for
details.

### Build an Empty Interactive Docker Instance

    $ sudo service docker start
    $ docker build --no-cache -t fipy-test .

### Test FiPy

Build the environment in Docker

    $ docker run -i -t fipy-test /bin/bash
    # su testuser
    # cd /home/testuser/git/fipy
    # python setup.py test --pysparse
