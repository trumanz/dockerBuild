FROM  trumanz/ubuntu14.04-dev


RUN env   https_proxy="10.5.96.90:3128" wget https://download.elastic.co/kibana/kibana/kibana-4.5.0-linux-x64.tar.gz 
RUN tar xf kibana-*.tar.gz  -C /opt 
RUN rm  kibana-*.tar.gz
RUN ln -s /opt/kibana-*  /opt/kibana
ADD run.sh  /

