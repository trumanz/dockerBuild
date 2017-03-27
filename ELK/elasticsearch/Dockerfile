FROM  trumanz/ubuntu14.04-dev


#https://www.elastic.co/guide/en/elasticsearch/reference/5.1/zip-targz.html

RUN curl -O https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.1.2.tar.gz
RUN tar xf elasticsearch*.tar.gz   -C /opt 
RUN rm  elasticsearch*.tar.gz
RUN ln -s /opt/elasticsearch*  /opt/elasticsearch
#RUN /opt/elasticsearch/bin/plugin install lmenezes/elasticsearch-kopf
RUN useradd  elastic
RUN chown -R  elastic:elastic   /opt/elasticsearch*
RUN sed  -i  's/^#network.host:/network.host: 0.0.0.0 #/'   /opt/elasticsearch/config/elasticsearch.yml
ADD es_entrypoint.sh /
