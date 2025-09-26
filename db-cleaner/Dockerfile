from alpine/psql:17.6
LABEL org.opencontainers.image.authors="alicef@gentoo.org"

RUN apk update && apk add --no-cache cronie && rm -rf /var/cache/apk/* && touch /tmp/psql-output
COPY crontab /etc/cron.d/psql-cron
COPY slim.psql /slim.psql
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD crond && tail -f /tmp/psql-output
