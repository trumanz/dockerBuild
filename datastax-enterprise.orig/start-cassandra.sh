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

HOST_IP=`hostname --ip-address`
SEEDS=${SEEDS:-$HOST_IP}



CASS_YAML=/opt/dse/resources/cassandra/conf/cassandra.yaml
echo "CLUSTER_NAME=$CLUSTER_NAME"
echo "SEEDS=$SEEDS"


sed -i -- "s/Test Cluster/${CLUSTER_NAME}/g"  $CASS_YAML
sed -i -- "s/seeds:.*/seeds: \"${SEEDS}\"/g"  $CASS_YAML

/opt/dse/bin/dse  cassandra  -f  -c

