#!/bin/bash
start_nodes(){
   local CASSANDRA_CLIENT_PORT=10000
   local SOLR_CLIENT_PORT=20000
   for n in $(echo "n0 n1 n2 s3 s4"); do 
   #for n in $(echo "n0"); do 
     echo "Start $n"
     docker run --name=$n   -h $n -t -d -i  -p "$CASSANDRA_CLIENT_PORT:9042" -p  "$SOLR_CLIENT_PORT:8983"  test/datastax   /bin/bash
     CASSANDRA_CLIENT_PORT=$(($CASSANDRA_CLIENT_PORT + 1))
     SOLR_CLIENT_PORT=$(($SOLR_CLIENT_PORT + 1))
   done
}




config_node(){

   IP0=$(docker inspect --format='{{ .NetworkSettings.IPAddress }}'  n0)
   echo "node0 IP $IP0"

   for n in $(echo "n0 n1 n2 s3 s4"); do 
     echo "Copy configre script to $n"
     docker cp  dse-entrypoint-config $n:/
   done

   for n in $(echo "n0 n1 n2"); do
      echo "configure $n"
      docker exec  -t -i   $n  sh -c "env SEEDS=$IP0  DC_NAME=DC_Cassandra   RACK_NAME=RAC1   /dse-entrypoint-config"
   done

   for n in $(echo "s3 s4"); do
      echo "configure $n"
      docker exec  -t -i   $n  sh -c "env SEEDS=$IP0  DC_NAME=DC_Solr   RACK_NAME=RAC1   /dse-entrypoint-config"
   done
}

start_service() {
   DSE_HOME=/opt/dse
   #config_node
   docker exec  -d -t -i  n0   sh -c "gosu dse $DSE_HOME/bin/dse cassandra  -f >/dse.log  2>&1"    #cassandra node
   #sleep 30
   docker exec  -d -t -i  n1   sh -c "gosu dse $DSE_HOME/bin/dse cassandra  -f >/dse.log  2>&1"   
   #sleep 30
   docker exec  -d -t -i  n2   sh -c "gosu dse $DSE_HOME/bin/dse cassandra  -f >/dse.log  2>&1"  
   #sleep 30

   docker exec  -d -t -i  s3   sh -c  "gosu dse $DSE_HOME/bin/dse cassandra  -f  -s >/dse.log  2>&1"  #search node , solr
   #sleep 10
   docker exec  -d -t -i  s4   sh -c  "gosu dse $DSE_HOME/bin/dse cassandra  -f  -s >/dse.log  2>&1" 
   #sleep 10
}


start_nodes
config_node
start_service

