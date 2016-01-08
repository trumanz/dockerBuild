FROM  trumanz/ubuntu14.04-dev


RUN env   https_proxy="10.5.96.90:3128" wget https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.1.1/elasticsearch-2.1.1.tar.gz  \
    && tar xf elasticsearch-2.1.1.tar.gz   -C /opt \
    && rm  elasticsearch-2.1.1.tar.gz
