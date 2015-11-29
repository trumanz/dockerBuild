FROM ubuntu:14.04
MAINTAINER Truman Zhou <truman.ck.zhou@gmail.com>


#base dev software
RUN    apt-get update -y \
    && apt-get install -y software-properties-common python-software-properties \
    && apt-get install -y openssh-server \
    && apt-get install -y git vim g++ \
    && apt-get install -y wget  tcpdump  net-tools netcat iputils-ping
    && apt-get install -y xterm firefox \
    && apt-get install -y sudo   \
    
# JAVA
RUN DEBIAN_FRONTEND=noninteractivei \
    && add-apt-repository -y ppa:webupd8team/java \
    && apt-get -y update \
    && apt-get -y install oracle-java8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle



#enable ssh with root
RUN  echo "root:root"  | chpasswd

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config


#enable sudo root
RUN echo "root  ALL=(ALL)  ALL" >>  /etc/sudoers
