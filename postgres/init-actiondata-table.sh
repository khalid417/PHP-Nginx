#!/bin/ash
set -e
psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "Cards"."ActionData" ("Song", "SingCost", "CardId") VALUES
    (false, 0, 11),
    (false, 0, 12),
    (true, 2, 13),
    (true, 5, 23),
    (true, 3, 28),
    (true, 2, 30),
    (false, 0, 41),
    (false, 0, 46),
    (false, 0, 62),
    (false, 0, 63),
    (false, 0, 64),
    (true, 3, 66),
    (false, 0, 69),
    (false, 0, 98),
    (true, 5, 106),
    (false, 0, 113),
    (false, 0, 114),
    (false, 0, 115),
    (false, 0, 124),
    (false, 0, 126),
    (true, 7, 127),
    (true, 5, 128),
    (true, 3, 129),
    (true, 1, 130),
    (true, 4, 131),
    (false, 0, 133);
EOSQL