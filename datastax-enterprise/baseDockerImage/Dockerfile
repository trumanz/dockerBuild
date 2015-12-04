FROM azul/zulu-openjdk:8

ADD  apt.conf  /etc/apt/


RUN export DEBIAN_FRONTEND=noninteractive && \
 apt-get update && \
 apt-get -y install adduser \
 curl \
 lsb-base \
 procps \
 zlib1g \
 gzip \
 python \
 python-support \
 sysstat \
 ntp bash tree && \
 rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root
RUN  env https_proxy="10.5.96.180:3128" curl -o /bin/gosu -SkL "https://github.com/tianon/gosu/releases/download/1.4/gosu-$(dpkg --print-architecture)" \
 && chmod +x /bin/gosu


