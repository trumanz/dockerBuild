#!/bin/sh


.  /dse-config.sh


CASS_RACK=/opt/dse-4.8.2/resources/cassandra/conf/cassandra-rackdc.properties
sed -i -- "s/^dc=.*/dc=dc_solr/g" $CASS_RACK


/opt/dse-4.8.2/bin/dse  cassandra  -f   -s

