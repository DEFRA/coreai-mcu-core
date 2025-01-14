#!/bin/bash

MIGRATIONS_BASE_PATH="/liquibase/services"

function runDbMigrations() {
  for db in $(ls $MIGRATIONS_BASE_PATH); do
    echo "Migrating up $db"

    psql postgresql://$POSTGRES_USERNAME:$POSTGRES_PASSWORD@$POSTGRES_HOST:$POSTGRES_PORT \
      -c "CREATE DATABASE $db"

    liquibase --driver=org.postgresql.Driver \
      --changeLogFile="/changelog/db.changelog.xml" \
      --searchPath="$MIGRATIONS_BASE_PATH/$db" \
      --url=jdbc:postgresql://$POSTGRES_HOST:$POSTGRES_PORT/$db \
      --username="$POSTGRES_USERNAME" --password="$POSTGRES_PASSWORD" --defaultSchemaName="$POSTGRES_NAME" \
      update
  done
}

runDbMigrations
