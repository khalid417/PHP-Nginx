#!/bin/ash
set -e
psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "Cards"."CharacterData" ("Strength", "Willpower", "Lore", "Shift", "CardId") VALUES        
    (2, 3, 2, 0, 1),
    (1, 2, 1, 0, 2),
    (1, 3, 1, 0, 3),
    (2, 3, 1, 0, 4),
    (3, 3, 1, 0, 5),
    (1, 2, 2, 0, 6),
    (7, 5, 2, 0, 7),
    (5, 5, 4, 0, 8),
    (4, 4, 2, 0, 9),
    (3, 5, 3, 4, 10),
    (2, 2, 1, 0, 15),
    (2, 2, 2, 0, 16),
    (3, 5, 2, 3, 17),
    (2, 2, 1, 0, 20),
    (3, 4, 2, 0, 21),
    (3, 2, 1, 0, 22),
    (1, 5, 3, 0, 24),
    (4, 4, 2, 0, 26),
    (4, 3, 1, 0, 27),
    (2, 2, 1, 0, 29),
    (2, 7, 2, 0, 31),
    (5, 3, 1, 0, 32),
    (2, 5, 1, 0, 33),
    (2, 3, 1, 0, 34),
    (2, 3, 1, 0, 35),
    (5, 4, 2, 0, 36),
    (5, 5, 2, 5, 37),
    (4, 5, 1, 0, 38),
    (1, 3, 1, 0, 39),
    (2, 7, 2, 0, 40),
    (1, 2, 1, 0, 42),
    (1, 1, 1, 0, 44),
    (0, 3, 2, 0, 45),
    (4, 6, 2, 0, 47),
    (3, 3, 2, 0, 48),
    (1, 3, 1, 0, 49),
    (2, 2, 1, 0, 50),
    (2, 5, 1, 0, 51),
    (0, 4, 1, 0, 52),
    (3, 3, 1, 0, 53),
    (3, 4, 2, 0, 54),
    (3, 4, 1, 0, 55),
    (3, 4, 2, 0, 56),
    (4, 5, 2, 0, 57),
    (3, 4, 1, 0, 58),
    (3, 3, 2, 0, 59),
    (1, 1, 2, 0, 60),
    (2, 2, 1, 0, 61),
    (2, 2, 1, 0, 67),
    (2, 4, 1, 0, 70),
    (6, 6, 2, 0, 71),
    (6, 7, 1, 6, 72),
    (1, 3, 1, 0, 73);
EOSQL