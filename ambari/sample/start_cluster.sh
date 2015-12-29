#!/bin/bash


CONTAINERS="
as
ag1
ag2
ag3"


docker diff  as | grep  -v   /var/lib/postgresql/  | grep -v  /var/lib/ambari-server/   | grep -v  /usr/lib/ambari-server   | grep -v pyc$



for c in $CONTAINERS; do 
   echo $c
   docker rm -f $c
   #toal 1024M not using swap
   #docker run   -d -t -m 1024M  --memory-swap=1024M   --name "$c" -h "$c"   trumanz/ambari   /bin/bash
   #toal no memory limiation
   docker run   -d -t   --name "$c" -h "$c"  trumanz/ambari   /bin/bash
   docker exec -t -i  $c  /etc/init.d/ssh restart
done

for c in $CONTAINERS; do 
    ip=$(docker inspect -f  '{{.NetworkSettings.IPAddress}}' $c)
    echo "$c : $ip"   
    for c2 in $CONTAINERS; do 
        docker exec -t -i  $c2   bash -c  "echo '$ip  $c'  >>   /etc/hosts"
    done
done



#docker exec -t -i  as  bash -c "cd /usr/lib/ambari-server/web/javascripts/ && gunzip app.js.gz  && sed -i.bak \"s@].contains(mPoint@, '/etc/resolv.conf', '/etc/hostname', '/etc/hosts'].contains(mPoint@g\" /usr/lib/ambari-server/web/javascripts/app.js  && cd /usr/lib/ambari-server/web/javascripts/ && gzip -9 app.js"

docker exec -t -i  as   bash -c  "echo '' >> /var/lib/ambari-server/ambari-env.sh"
[ -z "${HTTP_PROXY_HOST}" ] ||   docker exec -t -i  as   bash -c  "echo '-Dhttp.proxyHost=$HTTP_PROXY_HOST' >> /var/lib/ambari-server/ambari-env.sh"
[ -z "${HTTP_PROXY_PORT}" ] ||   docker exec -t -i  as   bash -c  "echo '-Dhttp.proxyPort=$HTTP_PROXY_PORT' >> /var/lib/ambari-server/ambari-env.sh"



docker exec -t -i  as   ambari-server setup -s  -j /usr/lib/jvm/java-8-oracle

#sleep 5 # workaround for unknown issue

docker exec  -t -i  as   bash -c "ambari-server start"


ASIP=$(docker inspect -f  '{{.NetworkSettings.IPAddress}}' as)
echo "Try http://$ASIP:8080 with admin:admin on firefox" 
