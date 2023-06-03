FROM postgres:15.3-alpine3.18
COPY postgres/init-tables.sh /docker-entrypoint-initdb.d/init-tables.sh
COPY postgres/init-carddata-table.sh /docker-entrypoint-initdb.d/init2-tabledata.sh
COPY postgres/init-characterdata-table.sh /docker-entrypoint-initdb.d/init3-tabledata.sh
COPY postgres/init-actiondata-table.sh /docker-entrypoint-initdb.d/init4-tabledata.sh
COPY postgres/init-abilityasset-table.sh /docker-entrypoint-initdb.d/init5-tabledata.sh