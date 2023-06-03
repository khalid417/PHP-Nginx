#!/bin/ash
set -e
psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- Cards Schema
    CREATE SCHEMA IF NOT EXISTS "Cards"
        AUTHORIZATION pg_database_owner;
    COMMENT ON SCHEMA "Cards"
        IS 'standard public schema';
    GRANT USAGE ON SCHEMA "Cards" TO PUBLIC;
    GRANT ALL ON SCHEMA "Cards" TO pg_database_owner;

    -- Card Schema Types
    CREATE TYPE "Cards"."CardType" AS ENUM
    ('Character', 'Action', 'Item');
    ALTER TYPE "Cards"."CardType"
        OWNER TO postgres;
    CREATE TYPE "Cards"."Classification" AS ENUM
        ('Item', 'Action', 'Song', 'Dreamborn', 'Floodborn', 'Storyborn', 'Hero', 'Villain', 'Ally', 'King', 'Queen', 'Prince', 'Princess', 'Inventor', 'Broom', 'Sorcerer', 'Pirate', 'Captain', 'Dragon', 'Alien', 'Deity', 'Detective', 'Fairy', 'Musketeer', 'Tigger', 'Mentor');
    ALTER TYPE "Cards"."Classification"
        OWNER TO postgres;
    CREATE TYPE "Cards"."Ink" AS ENUM
        ('Amber', 'Ruby', 'Steel', 'Amethyst', 'Emerald', 'Sapphire');
    ALTER TYPE "Cards"."Ink"
        OWNER TO postgres;

    -- Cards Schema Tables
    -- Card Data
    CREATE TABLE IF NOT EXISTS "Cards"."CardData"
    (
        "FrontAsset" text COLLATE pg_catalog."default" NOT NULL,
        "Name" text COLLATE pg_catalog."default" NOT NULL,
        "Cost" integer NOT NULL,
        "Inkwell" boolean NOT NULL,
        "Ink" "Cards"."Ink" NOT NULL,
        "CardType" "Cards"."CardType" NOT NULL,
        "Classifications" "Cards"."Classification"[] NOT NULL,
        "SetId" text COLLATE pg_catalog."default",
        "Id" integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
        "Text" text COLLATE pg_catalog."default",
        CONSTRAINT "CardData_pkey" PRIMARY KEY ("Id")
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Cards"."CardData"
        OWNER to postgres;
    -- Character Data
    CREATE TABLE IF NOT EXISTS "Cards"."CharacterData"
    (
        "Strength" integer NOT NULL,
        "Willpower" integer NOT NULL,
        "Lore" integer NOT NULL,
        "Shift" integer,
        "CardId" integer NOT NULL,
        CONSTRAINT "CharacterData_CardId_fkey" FOREIGN KEY ("CardId")
            REFERENCES "Cards"."CardData" ("Id") MATCH SIMPLE
            ON UPDATE CASCADE
            ON DELETE CASCADE
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Cards"."CharacterData"
        OWNER to postgres;
    CREATE INDEX IF NOT EXISTS "CharacterIndex"
        ON "Cards"."CharacterData" USING btree
        ("CardId" ASC NULLS LAST)
        TABLESPACE pg_default;
    -- Action Data
    CREATE TABLE IF NOT EXISTS "Cards"."ActionData"
    (
        "Song" boolean NOT NULL,
        "SingCost" integer,
        "CardId" integer NOT NULL,
        CONSTRAINT "ActionData_CardId_fkey" FOREIGN KEY ("CardId")
            REFERENCES "Cards"."CardData" ("Id") MATCH SIMPLE
            ON UPDATE CASCADE
            ON DELETE CASCADE
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Cards"."ActionData"
        OWNER to postgres;
    CREATE INDEX IF NOT EXISTS "ActionIndex"
        ON "Cards"."ActionData" USING btree
        ("CardId" ASC NULLS LAST)
        TABLESPACE pg_default;
    -- Ability Asset
    CREATE TABLE IF NOT EXISTS "Cards"."AbilityAsset"
    (
        "AssetId" text COLLATE pg_catalog."default",
        "CardId" integer NOT NULL,
        CONSTRAINT "AbilityAsset_CardId_fkey" FOREIGN KEY ("CardId")
            REFERENCES "Cards"."CardData" ("Id") MATCH SIMPLE
            ON UPDATE CASCADE
            ON DELETE CASCADE
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Cards"."AbilityAsset"
        OWNER to postgres;
    CREATE INDEX IF NOT EXISTS "AbilityIndex"
        ON "Cards"."AbilityAsset" USING btree
        ("CardId" ASC NULLS LAST)
        TABLESPACE pg_default;

    -- Users Schema
    CREATE SCHEMA IF NOT EXISTS "Users"
    AUTHORIZATION postgres;
    GRANT USAGE ON SCHEMA "Users" TO PUBLIC;
    GRANT ALL ON SCHEMA "Users" TO postgres;

    -- Users Schema Tables
    -- UserList
    CREATE TABLE IF NOT EXISTS "Users"."UserList"
    (
        "Id" integer NOT NULL,
        "DisplayName" text COLLATE pg_catalog."default",
        CONSTRAINT "UserList_pkey" PRIMARY KEY ("Id")
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Users"."UserList"
        OWNER to postgres;

    -- Decks Schema
    CREATE SCHEMA IF NOT EXISTS "Decks"
    AUTHORIZATION postgres;
    GRANT USAGE ON SCHEMA "Decks" TO PUBLIC;
    GRANT ALL ON SCHEMA "Decks" TO postgres;

    -- Decks Schema Tables
    -- DeckLists
    CREATE TABLE IF NOT EXISTS "Decks"."DeckLists"
    (
        "Name" text COLLATE pg_catalog."default" NOT NULL,
        "Id" integer NOT NULL,
        "Creator" integer,
        CONSTRAINT "DeckLists_pkey" PRIMARY KEY ("Id"),
        CONSTRAINT "DeckLists_Creator_fkey" FOREIGN KEY ("Creator")
            REFERENCES "Users"."UserList" ("Id") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Decks"."DeckLists"
        OWNER to postgres;
    CREATE INDEX IF NOT EXISTS "UserIndex"
        ON "Decks"."DeckLists" USING btree
        ("Creator" ASC NULLS LAST)
        TABLESPACE pg_default;
    -- CardEntries
    CREATE TABLE IF NOT EXISTS "Decks"."CardEntries"
    (
        "DeckId" integer NOT NULL,
        "CardId" integer NOT NULL,
        CONSTRAINT "CardEntries_CardId_fkey" FOREIGN KEY ("CardId")
            REFERENCES "Cards"."CardData" ("Id") MATCH SIMPLE
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        CONSTRAINT "CardEntries_DeckId_fkey" FOREIGN KEY ("DeckId")
            REFERENCES "Decks"."DeckLists" ("Id") MATCH SIMPLE
            ON UPDATE CASCADE
            ON DELETE CASCADE
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Decks"."CardEntries"
        OWNER to postgres;
    CREATE INDEX IF NOT EXISTS "CardIndex"
        ON "Decks"."CardEntries" USING btree
        ("CardId" ASC NULLS LAST)
        TABLESPACE pg_default;
    CREATE INDEX IF NOT EXISTS "DeckIndex"
        ON "Decks"."CardEntries" USING btree
        ("DeckId" ASC NULLS LAST)
        TABLESPACE pg_default;

    -- Games Schema
    CREATE SCHEMA IF NOT EXISTS "Games"
        AUTHORIZATION postgres;
    GRANT USAGE ON SCHEMA "Games" TO PUBLIC;
    GRANT ALL ON SCHEMA "Games" TO postgres;

    -- Games Schema Types
    -- StateTransitions
    CREATE TYPE "Games"."StateTransitions" AS ENUM
        ('Mulligan', 'Quest', 'Challenge', 'Play', 'UseEffect', 'Sing', 'Shift', 'AddToTop', 'AddToBottom', 'AddToHand', 'ChooseTarget', 'AddToInkwell', 'EndTurn');
    ALTER TYPE "Games"."StateTransitions"
        OWNER TO postgres;
    -- TurnPlayer
    CREATE TYPE "Games"."TurnPlayer" AS ENUM
        ('Player1', 'Player2');
    ALTER TYPE "Games"."TurnPlayer"
        OWNER TO postgres;
    
    -- Games Schema Tables
    -- GameList
    CREATE TABLE IF NOT EXISTS "Games"."GameList"
    (
        "Id" integer NOT NULL,
        "Deck1" integer,
        "Deck2" integer,
        "Player1" integer,
        "Player2" integer,
        "Winner" integer,
        CONSTRAINT "GameList_pkey" PRIMARY KEY ("Id"),
        CONSTRAINT "GameList_Deck1_fkey" FOREIGN KEY ("Deck1")
            REFERENCES "Decks"."DeckLists" ("Id") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT "GameList_Deck2_fkey" FOREIGN KEY ("Deck2")
            REFERENCES "Decks"."DeckLists" ("Id") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT "GameList_Player1_fkey" FOREIGN KEY ("Player1")
            REFERENCES "Users"."UserList" ("Id") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT "GameList_Player2_fkey" FOREIGN KEY ("Player2")
            REFERENCES "Users"."UserList" ("Id") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION,
        CONSTRAINT "GameList_Winner_fkey" FOREIGN KEY ("Winner")
            REFERENCES "Users"."UserList" ("Id") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Games"."GameList"
        OWNER to postgres;
    CREATE INDEX IF NOT EXISTS "DeckIndex"
        ON "Games"."GameList" USING btree
        ("Deck1" ASC NULLS LAST)
        TABLESPACE pg_default;
    CREATE INDEX IF NOT EXISTS "UserIndex"
        ON "Games"."GameList" USING btree
        ("Player1" ASC NULLS LAST)
        TABLESPACE pg_default;
    -- GameStates
    CREATE TABLE IF NOT EXISTS "Games"."GameStates"
    (
        "Id" integer NOT NULL,
        "GameId" integer,
        "P1Hand" integer[],
        "P2Hand" integer[],
        "P1Field" integer[],
        "P2Field" integer[],
        "P1Discard" integer[],
        "P2Discard" integer[],
        "P1Deck" integer[],
        "P2Deck" integer[],
        "Transition" "Games"."StateTransitions",
        "TransitionTarget" integer,
        "TurnPlayer" "Games"."TurnPlayer",
        CONSTRAINT "GameStates_pkey" PRIMARY KEY ("Id"),
        CONSTRAINT "GameStates_GameId_fkey" FOREIGN KEY ("GameId")
            REFERENCES "Games"."GameList" ("Id") MATCH SIMPLE
            ON UPDATE CASCADE
            ON DELETE CASCADE,
        CONSTRAINT "GameStates_TransitionTarget_fkey" FOREIGN KEY ("TransitionTarget")
            REFERENCES "Cards"."CardData" ("Id") MATCH SIMPLE
            ON UPDATE NO ACTION
            ON DELETE NO ACTION
    )
    TABLESPACE pg_default;
    ALTER TABLE IF EXISTS "Games"."GameStates"
        OWNER to postgres;
    CREATE INDEX IF NOT EXISTS "CardIndex"
        ON "Games"."GameStates" USING btree
        ("TransitionTarget" ASC NULLS LAST)
        TABLESPACE pg_default;
    CREATE INDEX IF NOT EXISTS "GameIndex"
        ON "Games"."GameStates" USING btree
        ("GameId" ASC NULLS LAST)
        TABLESPACE pg_default;
EOSQL