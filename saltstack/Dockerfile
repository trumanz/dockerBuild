FROM trumanz/ubuntu14.04-dev

MAINTAINER Truman Zhou <truman.ck.zhou@gmail.com>

#https://docs.saltstack.com/en/latest/topics/installation/ubuntu.html

RUN apt-get update

RUN apt-get install -y python-software-properties software-properties-common

RUN add-apt-repository ppa:saltstack/salt

RUN add-apt-repository ppa:saltstack/salt2015-5

RUN echo deb http://ppa.launchpad.net/saltstack/salt/ubuntu `lsb_release -sc` main | sudo tee /etc/apt/sources.list.d/saltstack.list

RUN env http_proxy="10.5.96.90:3128" wget -q -O- "http://keyserver.ubuntu.com:11371/pks/lookup?op=get&search=0x4759FA960E27C0A6" | sudo apt-key add -

RUN apt-get update

RUN apt-get install -y salt-api salt-cloud salt-master salt-minion salt-ssh salt-syndic




#Git Fileserver Backend 
# https://docs.saltstack.com/en/latest/topics/tutorials/gitfs.html
yum install python-pygit2


#work with vmware
#https://docs.saltstack.com/en/latest/topics/cloud/vmware.html
RUN pip install pyvmomi
