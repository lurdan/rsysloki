FROM alpine

RUN apk upgrade --no-cache --update && \
  apk add --no-cache \
    rsyslog \
    rsyslog-http \
    rsyslog-tls \
    && rm -f /tmp/* /etc/apk/cache/*

COPY etc/ /etc/

VOLUME /var/run/rsyslog/dev
EXPOSE 514/tcp 514/udp

CMD ["rsyslogd", "-n"]
