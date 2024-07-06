# Ubuntu Dockerfile - https://github.com/dockerfile/ubuntu

# PULL BASE IMAGE
FROM ubuntu:22.04

# INSTALL THINGS
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim nano wget && \
  apt-get install -y python3 && \
  apt-get install -y python3-pip && \
  apt-get install -y apache2 && \
  add-apt-repository ppa:ondrej/php && \
  apt-get install -y php8.0 libapache2-mod-php8.0 && \
  apt-get install -y sudo && \
  adduser someone && echo 'someone:changeme' | chpasswd && adduser someone sudo && \
  mkdir -p /home/someone && \
  chown -R someone: /home/someone && \
  echo 'root:changeme' | chpasswd && \
  rm -rf /var/lib/apt/lists/*

# ADD FILES
# ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts

# Set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

# Define working directory
WORKDIR /home/someone

# Define default command
CMD ["bash"]