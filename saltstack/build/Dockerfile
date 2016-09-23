FROM trumanz/ubuntu14.04-dev

MAINTAINER Truman Zhou <truman.ck.zhou@gmail.com>

#https://docs.saltstack.com/en/latest/topics/installation/ubuntu.html

#1. add saltstack apt repo
RUN apt-get update
RUN apt-get install -y python-software-properties software-properties-common

RUN env http_proxy="10.5.96.90:3128" wget -O - https://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -

RUN echo "deb http://repo.saltstack.com/apt/ubuntu/14.04/amd64/latest trusty main" > /etc/apt/sources.list.d/saltstack.list

#2. install saltstack
RUN apt-get update
RUN apt-get install -y salt-master salt-minion
RUN apt-get install -y salt-ssh salt-syndic
RUN apt-get install -y salt-cloud
RUN apt-get install -y salt-api

#3. add salt key for preseed, and master's key
ADD  conf/keys/sls-common-key.pub  /etc/salt/pki/master/minions/sls-common-key
ADD  conf/keys/master.pem   /etc/salt/pki/master/master.pem
ADD  conf/keys/master.pub   /etc/salt/pki/master/master.pub

#4. configuraton
ADD  conf/master.d/* /etc/salt/master.d/

#3. Git Fileserver Backend 
# https://docs.saltstack.com/en/latest/topics/tutorials/gitfs.html
#RUN apt-get install python-git
#ADD  conf/gitfs.conf  /etc/salt/master.d/
#ADD  conf/reactor.conf  /etc/salt/master.d/
#ssh for git
#RUN mkdir /root/.ssh
#ADD  conf/ssh     /root/.ssh/

#RUN mkdir /srv/reactor
#ADD conf/update_fileserver.sls  /srv/reactor/


#salt key
#ADD salt_key/salt_minion.pub    /etc/salt/pki/master/minions/salt_minion

#4. work with vmware
#https://docs.saltstack.com/en/latest/topics/cloud/vmware.html
#RUN pip install pyvmomi


#ADD  sh_vcenter.conf  /etc/salt/cloud.providers.d/

#ADD  vm_clone.conf  /etc/salt/cloud.profiles.d/


EXPOSE 4505
EXPOSE 4506
VOLUME  /etc/salt/


