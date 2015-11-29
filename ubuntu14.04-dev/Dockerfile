FROM ubuntu:14.04
MAINTAINER Truman Zhou <truman.ck.zhou@gmail.com>

# Installl package
RUN apt-get update &&  apt-get install -y xterm  openssh-server  openjdk-7-jdk g++ vim  wget  tcpdump  net-tools sudo  netcat iputils-ping git firefox

 

#enable ssh with root
RUN  echo "root:root"  | chpasswd

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config


#enable sudo root
RUN echo "root  ALL=(ALL)  ALL" >>  /etc/sudoers