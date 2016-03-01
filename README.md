# Try the [Materials Data Curator](https://github.com/usnistgov/mdcs)
  in a Docker Instance

The official linux installation for the
[Materials Data Curator](https://github.com/usnistgov/mdcs) (MDC) is
in a
[text file in the MDC repo](https://github.com/usnistgov/MDCS/blob/stable/docs/Installation%20Instructions%20for%20Linux).

## Install Docker

Install Docker and run the Deamon. See
https://docs.docker.com/engine/installation/linux/ubuntulinux/ for
installation details.

    $ sudo service docker start

## Pull the Docker instance

Pull the Docker Instance from Dockerhub

    $ docker pull docker.io/wd15/mdc-test

## Test the MDC

Test the build inside the instance.

    $ docker run -i -t wd15/mdc-test:latest /bin/bash
    # su testuser
    # cd /home/testuser/git/mdc
    # run the MDC

## Build the Docker instance

Clone this repository and build the instance.

    $ git clone https://github.com/wd15/mdc-dockerize.git
    $ cd mdc-dockerize
    $ docker build --no-cache -t wd15/mdc-test:latest .

## Push the Docker instance

Create the repository in Dockerhub and then push it.

    $ docker login
    $ docker push docker.io/wd15/mdc-test:latest
