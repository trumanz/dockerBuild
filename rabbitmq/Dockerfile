FROM  trumanz/ubuntu14.04-dev

ADD  apt.conf  /etc/apt/

RUN  echo "deb http://www.rabbitmq.com/debian/ testing main"  >  /etc/apt/sources.list.d/rabbitmq.list

RUN  curl -L https://www.rabbitmq.com/rabbitmq-signing-key-public.asc  | sudo apt-key add -

RUN  apt-get update  && apt-get install -y rabbitmq-server
