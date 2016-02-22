## Dockerfile to create FiPy instance

FROM ubuntu:15.10

MAINTAINER wd15 "https://github.com/wd15"

## Install only required packages for making a user as the
## `setup.bash` script install most of the required packages for FiPy

RUN apt-get -y update && apt-get install -y git sudo

## Create a user with no sudo password.

RUN useradd -m testuser
RUN passwd -d testuser
RUN adduser testuser sudo
RUN echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

## Install FiPy using the Ansible script in the `fipy-dockerize`
## repository.

RUN runuser -l testuser -c "cd ~; mkdir -p git; cd git; git clone https://github.com/wd15/fipy-dockerize.git"
RUN runuser -l testuser -c "cd ~/git/fipy-dockerize; ./setup.bash"
RUN runuser -l testuser -c 'echo "PATH=$HOME/anaconda/bin:$PATH" >> ~/.bashrc'

## This was in a Travis CI example and might be required to run the
## tests using Travis CI

EXPOSE 4567