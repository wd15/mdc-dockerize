# Try FiPy in a Docker Instance

## Install Docker

Install Docker and run the Deamon. See
https://docs.docker.com/engine/installation/linux/ubuntulinux/ for
installation details.

    $ sudo service docker start

## Pull the Docker instance

Pull the Docker Instance from Dockerhub

    $ docker pull docker.io/wd15/fipy-test

## Test FiPy

Test the build inside the instance.

    $ docker run -i -t wd15/fipy-test:latest /bin/bash
    # su testuser
    # cd /home/testuser/git/fipy
    # python setup.py test --pysparse

## Build the Docker instance

Clone this repository and build the instance.

    $ git clone https://github.com/wd15/fipy-dockerize.git
    $ cd fipy-dockerize
    $ sudo service docker start
    $ docker build --no-cache -t wd15/fipy-test:latest .

## Push the Docker instance

Create the repository in Dockerhub and then push it.

    $ docker push docker.io/wd15/fipy-test:latest
