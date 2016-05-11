FROM  trumanz/ubuntu14.04-dev


RUN env   https_proxy="10.5.96.90:3128" wget https://download.elastic.co/logstash/logstash/logstash-all-plugins-2.3.1.tar.gz
RUN tar xf logstash-all-plugins-*.tar.gz  -C /opt 
RUN rm logstash-all-plugins-*.tar.gz

RUN ln -s  /opt/logstash-*  /opt/logstash

