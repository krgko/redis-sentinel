# Redis-sentinel

For redis if running single node it might down some how. So, we need to deploy redis with cluster and use sentinel for high availability provider.

## Components

1. Redis
2. Sentinel

## Sentinel

Features
- Monitoring
- Automatic failover (promote slave to master)
- Notification
- Configuration provider

## Architecture

Will be 1 master, 1 slave with 1 sentinel by default

## Docker command

- To build docker image with start container `docker-compose up -d --build`
- To get current master node `docker-compose exec redis-sentinel redis-cli -p 26379 SENTINEL get-master-addr-by-name mymaster` if use default value of this repository
- To scale up container `docker-compose scale {service_name}`
- To pause and unpause instance `docker-compose {pause|unpause} {service_name}`

- To connect sentinel `redis-cli -p 26379`

## Making redis more secure

- Build modified redis with defined new secret for master and slave
- To use redis-cli with secret
```
redis-cli -a this_is_a_secret {command...}
```

**Note:** This part does not implement in this project yet.