#!/bin/ash
set -e
psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
EOSQL