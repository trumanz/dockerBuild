FROM  trumanz/ubuntu14.04-dev


RUN env   https_proxy="10.5.96.90:3128" wget  https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/2.3.2/elasticsearch-2.3.2.tar.gz 
RUN tar xf elasticsearch*.tar.gz   -C /opt 
RUN rm  elasticsearch*.tar.gz
RUN ln -s /opt/elasticsearch*  /opt/elasticsearch
RUN /opt/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf
ADD run.sh /
