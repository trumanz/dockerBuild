FROM  test/base4datastax


# tarball can be download into the folder where Dockerfile is
# wget --user=$USER --password=$PASS http://downloads.datastax.com/enterprise/dse-4.8.0-bin.tar.gz
# you may want to replace dse-4.8.0-bin.tar.gz with the corresponding downloaded package name
ADD dse-4.8.2-bin.tar.gz /opt


# keep data here. Optionally bind directly to a volume on the server. I.E.:
#VOLUME /data /data
VOLUME /data
ENV DSE_HOME /opt/dse
ENV DSE_ENV $DSE_HOME/bin/dse-env.sh
ENV CONF_DIR /conf
ENV DSE_CONF $CONF_DIR/dse
ENV CASSANDRA_CONF $CONF_DIR/cassandra
ENV HADOOP_CONF_DIR $CONF_DIR/hadoop
ENV TOMCAT_CONF_DIR $CONF_DIR/tomcat
ENV HIVE_CONF_DIR $CONF_DIR/hive
ENV SPARK_CONF_DIR $CONF_DIR/spark
RUN ln -s /opt/dse* $DSE_HOME

# keep configs here
VOLUME /conf

# and logs here
VOLUME /logs

# point C* logs dir to the created volume
RUN sed -i -- "s|/var/log/cassandra|/logs|g" $DSE_HOME/bin/dse.in.sh

# create a dedicated user for running DSE node
RUN groupadd -g 1337 dse && \
 useradd -u 1337 -g dse -s /bin/bash -d $DSE_HOME dse && \
 chown -R dse:dse /opt/dse*
VOLUME /opt/dse


# starting node using custom entrypoint that configures paths, interfaces, etc.
COPY dse-entrypoint /usr/local/bin/
RUN chmod +x /usr/local/bin/dse-entrypoint
#ENTRYPOINT ["/usr/local/bin/dse-entrypoint"]


# Running any other DSE/C* command should be done on behalf dse user
# Perform that using a generic command launcher
COPY dse-cmd-launcher /usr/local/bin/
RUN chmod +x /usr/local/bin/dse-cmd-launcher


# link dse commands to the launcher
RUN for cmd in cqlsh dsetool nodetool dse cassandra-stress datastax-agent ; do \
 ln -sf /usr/local/bin/dse-cmd-launcher /usr/local/bin/$cmd ; \
done


# the detailed list of ports
# http://docs.datastax.com/en/datastax_enterprise/4.7/datastax_enterprise/sec/secConfFirePort.html
# needed for datastax-agent
RUN locale-gen en_US en_US.UTF-8 && \
 ln -s /opt/dse/datastax-agent/conf /etc/datastax-agent
ENV OPSC_ADDR_DIR /opt/dse/datastax-agent/conf


# Cassandra
EXPOSE 7000 9042 9160
# Solr (assuming DSE Max)
EXPOSE 8983 8984
# Spark (assuming DSE Max)
EXPOSE 4040 7080 7081 7077
# Hadoop (assuming DSE Max)
EXPOSE 8012 50030 50060 9290
# Hive/Shark
EXPOSE 10000
# OpsCenter agent
EXPOSE 61621


