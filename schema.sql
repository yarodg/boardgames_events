-- Represent users in the web app
CREATE TABLE "users" (
    "id" INTEGER,
    "username" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "organization" TEXT,
    "status" TEXT NOT NULL CHECK("status" IN('player', 'local host', 'event organizer')),
    PRIMARY KEY("id")
);

-- Represent events and their details
CREATE TABLE "events" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    "location" TEXT NOT NULL,
    "host_id" TEXT NOT NULL,
    "type" TEXT NOT NULL CHECK("type" IN('local', 'away')),
    "status" TEXT NOT NULL CHECK("status" IN('upcoming', 'active', 'ended')),
    "registrations" TEXT NOT NULL CHECK("registrations" BETWEEN 0 AND 1) DEFAULT 0,
    PRIMARY KEY("id"),
    FOREIGN KEY("host_id") REFERENCES "users"("id")
);

-- Represents boardgames in community
CREATE TABLE "boardgames" (
    "id" INTEGER,
    "title", TEXT NOT NULL,
    "publisher" TEXT,
    "players" TEXT,
    "cover_image" BLOB,
    "description" TEXT,
    PRIMARY KEY("id")
);


-- Represents users boardgames collection
CREATE TABLE "collections" (
    "id" INTEGER,
    "user_id" INTEGER,
    "bg_id" INTEGER,
    "ownership" NUMERIC NOT NULL CHECK("ownership" BETWEEN 0 AND 1),
    "add_date" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sessions_played" INTEGER DEFAULT 0,
    "favourite" NUMERIC NOT NULL CHECK("favourite" BETWEEN 0 AND 1) DEFAULT 0,
    PRIMARY KEY("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("bg_id") REFERENCES "boardgames"("id")
);

-- Represents boardgames people take on the event
CREATE TABLE "event_boardgames" (
    "id" INTEGER,
    "event_id" INTEGER,
    "user_id" INTEGER,
    "bg_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("event_id") REFERENCES "events"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("bg_id") REFERENCES "boardgames"("id")
);

-- Represents people participaiting in the event
CREATE TABLE "event_participants" (
    "id" INTEGER,
    "event_id" INTEGER,
    "user_id" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("event_id") REFERENCES "events"("id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id")
);


-- Create indexes to speed common searchers
CREATE INDEX "users_search" ON "users" ("username", "first_name", "last_name");
CREATE INDEX "events_search" ON "events" ("name", "location", "type", "status");
CREATE INDEX "collections_search" ON "collections" ("user_id", "bg_id");
CREATE INDEX "boardgames_search" ON "boardgames" ("title");
