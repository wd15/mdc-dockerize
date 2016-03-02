## Dockerfile to create FiPy instance

FROM ubuntu:15.10

MAINTAINER wd15 "https://github.com/wd15"

## Install only required packages for making a user as the
## `setup.bash` script installs most of the required packages for the
## MDC

RUN apt-get -y update && apt-get install -y git sudo

## Create a user with no sudo password.

RUN useradd -m testuser
RUN passwd -d testuser
RUN adduser testuser sudo
RUN echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

## Install MDC using the Ansible script in the `mdc-dockerize`
## repository.

RUN runuser -l testuser -c "cd ~; mkdir -p git; cd git; git clone https://github.com/wd15/mdc-dockerize.git; cd ~/git/mdc-dockerize; git pull origin master"
RUN runuser -l testuser -c "cd ~/git/mdc-dockerize; ./setup.bash"
RUN runuser -l testuser -c 'echo "PATH=$HOME/anaconda/bin:$PATH" >> ~/.bashrc'
CMD runuser -l testuser -c "cd ~/git/mdc-dockerize; ./setup.bash --tags mongodb; cd ~/git/mdc; python setup.py runserver &"
EXPOSE 8000