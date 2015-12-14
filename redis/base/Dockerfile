FROM  trumanz/ubuntu14.04-dev

RUN apt-get install make
RUN mkdir redis-build && cd redis-build &&\
    wget  http://download.redis.io/releases/redis-3.0.5.tar.gz && \
    tar xzf redis-3.0.5.tar.gz  && \
    cd redis-3.0.5  && \
    mkdir -p /opt/redis/etc && \
    make PREFIX=/opt/redis   install  && \
    cp redis.conf  /opt/redis/etc
#TODO
#delete the redis-build director

