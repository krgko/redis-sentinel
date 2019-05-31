FROM redis:5.0
MAINTAINER Koo Koo Koo

ADD sentinel.conf /etc/redis/sentinel.conf
RUN chown redis:redis /etc/redis/sentinel.conf

ENV SENTINEL_QUORUM 1
ENV SENTINEL_DOWN_AFTER 1000
ENV SENTINEL_FAILOVER 1000
ENV SENTINEL_PORT 26379

ADD entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
EXPOSE 26379

ENTRYPOINT ["entrypoint.sh"]