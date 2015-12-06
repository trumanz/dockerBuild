#!/bin/sh

#
docker run  --name=n0   -h n0  -d -t -i  trumanz/dsecassandra    /start-cassandra.sh  --cluster-name="TestCluster"

IP0=$(docker inspect --format='{{ .NetworkSettings.IPAddress }}'  n0)

docker run --name=n1   -h n1    -d -t -i  trumanz/dsecassandra    /start-cassandra.sh  --cluster-name="TestCluster"  --seeds="${IP0}"
docker run --name=n2   -h n2    -d -t -i  trumanz/dsecassandra    /start-cassandra.sh  --cluster-name="TestCluster"  --seeds="${IP0}"


