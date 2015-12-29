#!/bin/sh

#https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=41812517


ASIP=$(docker inspect -f  '{{.NetworkSettings.IPAddress}}' as)

echo ASIP
curl --user admin:admin  http://$ASIP:8080/api/v1/clusters

echo "===="
echo "Create cluster"
#curl --user admin:admin -i -H "X-Requested-By:ambari"  -X POST -d '{ "Clusters":{"version":"HDP-2.3"}}'  http://$ASIP:8080/api/v1/clusters/c1

echo "===="
echo "boostrap host"
KEY=$(cat ../ssh/id_rsa)
DATA='{"verbose":true, "sshKey":"$KEY", "hosts": [ "ag1", "ag2", "ag3" ], "user": "root" }'
curl --user admin:admin -i -H "X-Requested-By:ambari" -H  'Content-Type: application/json'   -X POST  -d '$DATA'    http://$ASIP:8080/api/v1/bootstrap

