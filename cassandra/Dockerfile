FROM  trumanz/ubuntu14.04-dev
MAINTAINER Truman Zhou <truman.ck.zhou@gmail.com>


#cassandra from  datastax
#http://docs.datastax.com/en/cassandra/2.0/cassandra/install/installDeb_t.html

#RUN apt-get install -y curl
#RUN apt-get install -y libjna-java
RUN echo "deb http://debian.datastax.com/community stable main" | sudo tee -a /etc/apt/sources.list.d/cassandra.sources.list
RUN curl -L http://debian.datastax.com/debian/repo_key | sudo apt-key add -
RUN apt-get update
RUN apt-get install -y dsc20=2.0.11-1 cassandra=2.0.11
RUN sudo service cassandra stop && sudo rm -rf /var/lib/cassandra/data/system/*
