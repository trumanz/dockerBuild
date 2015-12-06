#!/bin/sh


SORTED_ARGS=`getopt -o c:s --long cluster-name:,seeds: -n 'test.sh' -- "$@"`

if [ $? != 0 ]; then
    echo "Argument parse failed" >&2;
    exit 1 ;
fi

eval set -- "$SORTED_ARGS"


while true ; do
    case "$1" in
        --cluster-name) CLUSTER_NAME=$2; shift  2;;
        --seeds)  SEEDS=$2;  shift  2;;
        --) shift ; break ;;
        *) echo "Argument error!" ; exit 1 ;;
    esac
done

#HOST_IP=`hostname --ip-address`
HOST_IP=`hostname --all-ip-addresses`
SEEDS=${SEEDS:-$HOST_IP}

echo "HOST_IP=$HOST_IP"
echo "CLUSTER_NAME=$CLUSTER_NAME"
echo "SEEDS=$SEEDS"


CASS_YAML=/opt/dse-4.8.2/resources/cassandra/conf/cassandra.yaml


sed -i -- "s/Test Cluster/${CLUSTER_NAME}/g"  $CASS_YAML
sed -i -- "s/seeds:.*/seeds: \"${SEEDS}\"/g"  $CASS_YAML
sed -i -- "s/^rpc_address:.*/rpc_address: \"${HOST_IP}\"/g"  $CASS_YAML
sed -i -- "s/^listen_address:.*/listen_address: \"${HOST_IP}\"/g"  $CASS_YAML

/opt/dse-4.8.2/bin/dse  cassandra  -f  -c

