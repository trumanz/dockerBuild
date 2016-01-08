FROM  trumanz/ubuntu14.04-dev


RUN env   https_proxy="10.5.96.90:3128" wget https://download.elastic.co/logstash/logstash/logstash-all-plugins-2.1.0.tar.gz \
    && tar xf logstash-all-plugins-2.1.0.tar.gz  -C /opt \
    && rm logstash-all-plugins-2.1.0.tar.gz
