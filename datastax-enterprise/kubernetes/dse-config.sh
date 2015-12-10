#!/bin/sh


SORTED_ARGS=`getopt -o c:s --long cluster-name:,datacenter: -n 'test.sh' -- "$@"`

if [ $? != 0 ]; then
    echo "Argument parse failed" >&2;
    exit 1 ;
fi

eval set -- "$SORTED_ARGS"


while true ; do
    case "$1" in
        --cluster-name) CLUSTER_NAME=$2; shift  2;;
        --datacenter) DATA_CENTER=$2; shift  2;;
        --) shift ; break ;;
        --) shift ; break ;;
        *) echo "Argument error!" ; exit 1 ;;
    esac
done

#HOST_IP=`hostname --ip-address`
HOST_IP=`hostname --all-ip-addresses`

echo "HOST_IP=$HOST_IP"
echo "CLUSTER_NAME=$CLUSTER_NAME"


CASS_YAML=/opt/dse-4.8.2/resources/cassandra/conf/cassandra.yaml
CASS_RACK=/opt/dse-4.8.2/resources/cassandra/conf/cassandra-rackdc.properties

[ -z "${CLUSTER_NAME}" ] ||   sed -i -- "s/Test Cluster/${CLUSTER_NAME}/g"  $CASS_YAML

[ -z "${DATA_CENTER}" ] ||   sed -i -- "s/^dc=.*/dc=${DATA_CENTER}/g"  $CASS_RACK

sed -i -- "s/^rpc_address:.*/rpc_address: \"${HOST_IP}\"/g"  $CASS_YAML
sed -i -- "s/^listen_address:.*/listen_address: \"${HOST_IP}\"/g"  $CASS_YAML

sed -i -- "s/^endpoint_snitch:.*/endpoint_snitch: GossipingPropertyFileSnitch/g" $CASS_YAML

#set the seed provider for kubernbtes
sed -i --  "s/- class_name:.*/- class_name: io.k8s.cassandra.KubernetesSeedProvider/g"    $CASS_YAML



## set datacenter and rack name




