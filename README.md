# Dockerize FiPY

Test FiPy installation on a Docker instance.

## Install Docker

See https://docs.docker.com/engine/installation/linux/ubuntulinux/ for
details.

## Build an Empty Interactive Docker Instance

    $ sudo service docker start
    $ docker build --no-cache -t fipy-test .
    $ docker run -i -t fipy-test /bin/bash

---


Run `./setup.bash` in the base directory to install the
environment. To just install the basic environment without emacs or
conda use

    $ ./setup.bash --tags=env

other tags include

 - `conda`
 - `emacs`
 - `javascript`.

## Test with Docker

### Install Docker

https://docs.docker.com/engine/installation/linux/ubuntulinux/

### Test

Build the environment in Docker

    $ sudo service docker start
    $ sudo docker build --no-cache -t env-test .
    $ sudo docker run -i -t env-test /bin/bash
    # su testuser
    # cd /home/testuser/git/env
    # ./setup.bash

and test it

    # su testuser
    # git config --list
    # emacs -nw
    # ipython

## Generate environment.yml

    $ conda env export -n root > environment.yml

Remove references to `conda` and `anaconda` and check that it works

    $ conda env update -n root --file environment.yml

## Ubuntu Setup

### Launcher

http://askubuntu.com/questions/9865/how-can-i-configure-unitys-launcher-auto-hide-behavior/31418#31418

### Launcher multiple screens

http://askubuntu.com/questions/107583/how-can-i-remove-duplicate-second-unity-launcher-on-a-dual-screen-setup

### Workspace switcher

http://www.randomhacks.co.uk/how-change-ubuntu-unity-window-switcher-back-to-old-style/

### Cut and Paste from Keepass

Install ```xsel``` and ```autocutsel```. In the "Startup Applications"
tool put ```autocutsel -s PRIMARY``` call that "Autocutsel
PRIMARY". Also add ```autocutsel``` but with no arguments and call
that "Autocutsel". Both are needed.

### Other

 * Sync Firefox
 * SSH keys: https://help.github.com/articles/generating-ssh-keys/
