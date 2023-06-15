#!/bin/ash
set -e
psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "Cards"."CharacterData" ("Strength", "Willpower", "Lore", "Shift", "CardId", "Epithet") VALUES        
    (2, 3, 2, 0, 1, 'Inventive Engineer'),
    (1, 2, 1, 0, 2, 'Forceful Duelist'),
    (1, 3, 1, 0, 3, 'Miserable as Usual'),
    (2, 3, 1, 0, 4, 'Snow Queen'),
    (3, 3, 1, 0, 5, 'True Hero'),
    (1, 2, 2, 0, 6, 'Bumbler'),
    (7, 5, 2, 0, 7, 'Monstrous Dragon'),
    (5, 5, 4, 0, 8, 'Brave Little Tailor'),
    (4, 4, 2, 0, 9, 'Unrivaled Archer'),
    (3, 5, 3, 4, 10, 'Rock Star'),
    (2, 2, 1, 0, 15, 'New Dog'),
    (2, 2, 2, 0, 16, 'Regal Princess'),
    (3, 5, 2, 3, 17, 'Dreaming Guardian'),
    (2, 2, 1, 0, 20, 'Bucket Brigade'),
    (3, 4, 2, 0, 21, 'Wayward Sorcerer'),
    (3, 2, 1, 0, 22, 'Lord of the Underworld'),
    (1, 5, 3, 0, 24, 'Of Motonui'),
    (4, 4, 2, 0, 26, 'Hardheaded'),
    (4, 3, 1, 0, 27, 'Captain of the Jolly Roger'),
    (2, 2, 1, 0, 29, 'Sorceress'),
    (2, 7, 2, 0, 31, 'World-Famous Inventor'),
    (5, 3, 1, 0, 32, 'Fiery Usurper'),
    (2, 5, 1, 0, 33, 'Briar Rose'),
    (2, 3, 1, 0, 34, 'Boisterous Fowl'),
    (2, 3, 1, 0, 35, 'Beloved Princess'),
    (5, 4, 2, 0, 36, 'Mastermind'),
    (5, 5, 2, 5, 37, 'Heroic Outlaw'),
    (4, 5, 1, 0, 38, 'Imperial Soldier'),
    (1, 3, 1, 0, 39, 'Detective'),
    (2, 7, 2, 0, 40, 'Musketeer'),
    (1, 2, 1, 0, 42, 'Boat Snack'),
    (1, 1, 1, 0, 44, 'Rapunzel''s Companion'),
    (0, 3, 2, 0, 45, 'Not All There'),
    (4, 6, 2, 0, 47, 'Returned King'),
    (3, 3, 2, 0, 48, 'Disguised'),
    (1, 3, 1, 0, 49, 'Dashing and Brave'),
    (2, 2, 1, 0, 50, 'Maleficent''s Underlings'),
    (2, 5, 1, 0, 51, 'Wicked Sorcerer'),
    (0, 4, 1, 0, 52, 'Charlatan'),
    (3, 3, 1, 0, 53, 'Relentless Pursuer'),
    (3, 4, 2, 0, 54, 'On Human Legs'),
    (3, 4, 1, 0, 55, 'Belle''s Confidant'),
    (3, 4, 2, 0, 56, 'Sinister Visitor'),
    (4, 5, 2, 0, 57, 'Renegade Scientist'),
    (3, 4, 1, 0, 58, 'Steamboat Pilot'),
    (3, 3, 2, 0, 59, 'True Friend'),
    (1, 1, 2, 0, 60, 'Biding Her Time'),
    (2, 2, 1, 0, 61, 'Alchemist'),
    (2, 2, 1, 0, 67, 'Voice of Reason'),
    (2, 4, 1, 0, 70, 'Tiny Tactician'),
    (6, 6, 2, 0, 71, 'Galactic Federation Captain'),
    (6, 7, 1, 6, 72, 'King of Olympus'),
    (1, 3, 1, 0, 73, 'Friendly Snowman'),
    (3, 4, 2, 0, 74, 'On the Job'),
    (1, 4, 1, 0, 75, 'Loud-Mouthed Parrot'),
    (1, 2, 1, 0, 76, 'Grub Rustler'),
    (2, 2, 1, 0, 77, 'Highly Educated Owl'),
    (3, 3, 1, 0, 78, 'Mysterious Sage'),
    (4, 4, 2, 0, 79, 'Wolfsbane');
EOSQL