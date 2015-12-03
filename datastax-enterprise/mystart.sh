#!/bin/bash
start_nodes(){
   for n in $(echo "node0 node1 node2 node3 node4 node5 node6 node7 node8"); do 
     echo $n
     docker run --name=$n  -h $n -t -d -i   test/datastax   /bin/bash
   done
}




config_node(){
IP0=$(docker inspect --format='{{ .NetworkSettings.IPAddress }}'  node0)
IP3=$(docker inspect --format='{{ .NetworkSettings.IPAddress }}'  node3)
echo "node0 IP $IP0"
echo "node3 IP $IP3"
   for n in  $(echo "node0 node1 node2 node3 node4 node5 node6 node7 node8"); do 
     echo $n
     docker cp  dse-entrypoint-config $n:/
   done
   for n in $(echo "node0 node1 node2"); do
      docker exec  -t -i   $n  sh -c "env SEEDS=$IP0,$IP3  DC_NAME=DC_Cassandra   RACK_NAME=RAC1   /dse-entrypoint-config"
   done
   for n in $(echo "node3 node4 node5"); do
      docker exec  -t -i   $n  sh -c "env SEEDS=$IP0,$IP3  DC_NAME=DC_Analytics   RACK_NAME=RAC1   /dse-entrypoint-config"
   done
   for n in $(echo "node6 node7"); do
      docker exec  -t -i   $n  sh -c "env SEEDS=$IP0,$IP3  DC_NAME=DC_Solr   RACK_NAME=RAC1   /dse-entrypoint-config"
   done
   
}

start_service() {
   DSE_HOME=/opt/dse
   #config_node
   #start  seed first, node0-2 as cassandra node
   docker exec  -d -t -i  node0   sh -c "gosu dse $DSE_HOME/bin/dse cassandra  -f >/dse.log  2>&1"    #cassandra node
   sleep 10
   #docker exec  -d -t -i  node3   gosu dse $DSE_HOME/bin/dse cassandra  -f  -s -k #Search Analytics node,  spark + solr
   docker exec  -d -t -i  node1   sh -c "gosu dse $DSE_HOME/bin/dse cassandra  -f >/dse.log  2>&1"   
   sleep 10
   docker exec  -d -t -i  node2   sh -c "gosu dse $DSE_HOME/bin/dse cassandra  -f >/dse.log  2>&1"  
   sleep 10

   docker exec  -d -t -i  node6   sh -c  "gosu dse $DSE_HOME/bin/dse cassandra  -f  -s >/dse.log  2>&1"  #search node , solr
   sleep 10
   docker exec  -d -t -i  node7   sh -c  "gosu dse $DSE_HOME/bin/dse cassandra  -f  -s >/dse.log  2>&1" 
   sleep 10
}


#start_nodes
config_node
#start_service

