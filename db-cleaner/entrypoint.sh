#!/bin/sh
printenv | sed 's/^\(.*\)$/export \1/g' > /db-connection-env

echo "export PGHOST=db" >> /db-connection-env
echo "export PGPORT=5432" >> /db-connection-env
echo "export PGUSER=$POSTGRES_USER" >> /db-connection-env
echo "export PGDATABASE=$POSTGRES_DB" >> /db-connection-env
echo "export PGPASSWORD=$POSTGRES_PASSWORD" >> /db-connection-env

exec "$@"
