FROM ubuntu:14.04
MAINTAINER Truman Zhou <truman.ck.zhou@gmail.com>

#ADD apt.conf /etc/apt/

#base dev software
RUN apt-get update -y \
    && apt-get install -y software-properties-common python-software-properties \
    && apt-get install -y openssh-server \
    && apt-get install -y libglpk-dev  \
    && apt-get install -y git vim g++ make \
    && apt-get install -y  python-dev python-pip \
    && apt-get install -y wget curl  tcpdump  net-tools netcat iputils-ping  iptraf \
    && apt-get install -y sudo  \
    && apt-get install -y libboost-all-dev  \
    && apt-get install -y libjsoncpp-dev  \
    && apt-get autoclean


    
# && apt-get install -y xterm firefox

# JAVA
RUN env DEBIAN_FRONTEND=noninteractivei \
       add-apt-repository -y ppa:webupd8team/java \
    && apt-get -y update \
    && yes | apt-get -y install oracle-java8-installer \
    && apt-get  autoclean

RUN apt-get install -y libjna-java
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

#gcovr
RUN wget https://github.com/gcovr/gcovr/archive/3.3.tar.gz
RUN pip install 3.3.tar.gz

#enable ssh with root
RUN  echo "root:root"  | chpasswd

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config


#enable sudo root
RUN echo "root  ALL=(ALL)  ALL" >>  /etc/sudoers
