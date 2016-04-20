FROM  trumanz/ubuntu14.04-dev

#ADD  apt.conf  /etc/apt/

RUN  apt-get update  && apt-get install -y postgresql  slony1-2-bin

ADD  start_pg.sh  /
