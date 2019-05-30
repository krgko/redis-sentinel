#/bin/bash

sed -i -E "s/port \$SENTINEL_PORT/port $SENTINEL_PORT/" /etc/redis/sentinel.conf
sed -i -E "s/sentinel monitor mymaster redis_master 6379 \$SENTINEL_QUORUM/sentinel monitor mymaster redis_master 6379 $SENTINEL_QUORUM/" /etc/redis/sentinel.conf
sed -i -E "s/sentinel down-after-milliseconds mymaster \$SENTINEL_DOWN_AFTER/sentinel down-after-milliseconds mymaster $SENTINEL_DOWN_AFTER/" /etc/redis/sentinel.conf
sed -i -E "s/sentinel failover-timeout mymaster \$SENTINEL_FAILOVER/sentinel failover-timeout mymaster $SENTINEL_FAILOVER/" /etc/redis/sentinel.conf

# execute docker entrypoint at the run time
exec docker-entrypoint.sh redis-server /etc/redis/sentinel.conf --sentinel