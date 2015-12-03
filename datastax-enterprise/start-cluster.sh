#!/bin/bash
IMAGE=$1
NUM_NODES=$2
NODE_OPTS=$3

[ -z "$CLUSTER_NAME" ] && CLUSTER_NAME="Test_Cluster"

docker run -d -e CLUSTER_NAME="$CLUSTER_NAME" --name node1 $IMAGE $NODE_OPTS

SEEDS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' node1)

let n=1

while [ $n != $NUM_NODES ]; do
   let n=n+1
   docker run -d -e SEEDS=$SEEDS -e CLUSTER_NAME="$CLUSTER_NAME" --name node${n} $IMAGE
   $NODE_OPTS
done

