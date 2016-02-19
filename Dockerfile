FROM ubuntu:15.10
RUN apt-get -y update && apt-get install -y git sudo
RUN useradd -m testuser
RUN passwd -d testuser
RUN adduser testuser sudo
RUN echo 'testuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN runuser -l testuser -c "cd ~; mkdir -p git; cd git; git clone https://github.com/wd15/fipy-dockerize.git"
RUN runuser -l testuser -c "cd ~/git/fipy-dockerize; ./setup.bash"
RUN runuser -l testuser -c 'echo "PATH=$HOME/anaconda/bin:$PATH" >> ~/.bashrc'
