#!/bin/sh



REDIS_CONF_FILE=/opt/redis/etc/redis.conf

[ -z "${REDIS_MAX_MEMORY}" ] ||   sed -i -- "s/^# maxmemory <bytes>/maxmemory ${REDIS_MAX_MEMORY}/g"  ${REDIS_CONF_FILE}


/opt/redis/bin/redis-server  $REDIS_CONF_FILE

