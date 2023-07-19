#!/bin/ash
set -e
psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "Cards"."AbilityAsset" ("AssetId", "CardId") VALUES
    ('Handler001', 1),
    ('Handler002', 2),
    ('Handler003', 3),
    ('Handler004', 4),
    ('Handler005', 5),
    ('Handler006', 6),
    ('Handler007', 7),
    ('Handler008', 8),
    ('Handler009', 9),
    ('Handler010', 10),
    ('Handler011', 11),
    ('Handler012', 12),
    ('Handler013', 13),
    ('Handler014', 14),
    ('Handler017', 17),
    ('Handler018', 18),
    ('Handler019', 19),
    ('Handler020', 20),
    ('Handler021', 21),
    ('Handler022', 22),
    ('Handler023', 23),
    ('Handler024', 24),
    ('Handler025', 25),
    ('Handler026', 26),
    ('Handler027', 27),
    ('Handler028', 28),
    ('Handler029', 29),
    ('Handler030', 30),
    ('Handler031', 31),
    ('Handler033', 33),
    ('Handler036', 36),
    ('Handler037', 37),
    ('Handler038', 38),
    ('Handler039', 39),
    ('Handler040', 40),
    ('Handler041', 41),
    ('Handler042', 42),
    ('Handler043', 43),
    ('Handler044', 44),
    ('Handler045', 45),
    ('Handler046', 46),
    ('Handler047', 47),
    ('Handler049', 49),
    ('Handler051', 51),
    ('Handler052', 52),
    ('Handler053', 53),
    ('Handler054', 54),
    ('Handler061', 61),
    ('Handler062', 62),
    ('Handler063', 63),
    ('Handler064', 64),
    ('Handler065', 65),
    ('Handler066', 66),
    ('Handler068', 68),
    ('Handler069', 69),
    ('Handler070', 70),
    ('Handler071', 71),
    ('Handler072', 72),
    ('Handler074', 74),
    ('Handler075', 75),
    ('Handler076', 76),
    ('Handler078', 78),
    ('Handler079', 79),
    ('Handler080', 80),
    ('Handler081', 81),
    ('Handler082', 82),
    ('Handler083', 83),
    ('Handler084', 84),
    ('Handler085', 85),
    ('Handler086', 86),
    ('Handler089', 89),
    ('Handler090', 90),
    ('Handler091', 91),
    ('Handler092', 92),
    ('Handler093', 93),
    ('Handler095', 95),
    ('Handler096', 96),
    ('Handler097', 97),
    ('Handler098', 98),
    ('Handler100', 100),
    ('Handler103', 103),
    ('Handler104', 104),
    ('Handler106', 106),
    ('Handler107', 107),
    ('Handler108', 108),
    ('Handler110', 110),
    ('Handler111', 111),
    ('Handler112', 112),
    ('Handler113', 113),
    ('Handler114', 114),
    ('Handler115', 115),
    ('Handler116', 116),
    ('Handler117', 117),
    ('Handler119', 119),
    ('Handler122', 122),
    ('Handler124', 124);
EOSQL