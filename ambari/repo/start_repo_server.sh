#!/bin/sh


REPO_PATH=/shared/ambari/data/

#http://docs.hortonworks.com/HDPDocuments/Ambari-2.2.0.0/bk_Installing_HDP_AMB/content/_getting_started_setting_up_a_local_repository.html

wget http://public-repo-1.hortonworks.com/ambari/ubuntu14/2.x/updates/2.2.0.0/ambari-2.2.0.0-ubuntu14.tar.gz
wget http://public-repo-1.hortonworks.com/HDP/ubuntu14/2.x/updates/2.3.4.0/HDP-2.3.4.0-ubuntu14-deb.tar.gz
wget http://public-repo-1.hortonworks.com/HDP-UTILS-1.1.0.20/repos/ubuntu14/HDP-UTILS-1.1.0.20-ubuntu14.tar.gz


tar xf  ambari-2.2.0.0-ubuntu14.tar.gz  -C   $REPO_PATH
tar xf  HDP-2.3.4.0-ubuntu14-deb.tar.gz -C   $REPO_PATH
tar xf HDP-UTILS-1.1.0.20-ubuntu14.tar.gz -C  $REPO_PATH

docker run --name=ambari-repo-server  -t -i  -d  -v  $REPO_PATH:/var/www/html/ trumanz/apache2  /bin/bash
docker exec -t -i  ambari-repo-server  /etc/init.d/apache2 start
