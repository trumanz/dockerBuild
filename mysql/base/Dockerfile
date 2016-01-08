FROM  trumanz/ubuntu14.04-dev

ADD  apt.conf  /etc/apt/


RUN  apt-get update \
     && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server 
