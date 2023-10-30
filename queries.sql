-- Find all users that will participate in certain event that is currently active or upcoming
SELECT *
FROM "event_participants"
WHERE "event_id" = 1;

-- Find all boardgames that users will bring to certain event
SELECT *
FROM "event_boardgames"
WHERE "event_id" = 1;

-- Find all boardgames from user collection
SELECT *
FROM "collections"
WHERE "user_id" = 1;

-- Find all favourite games from user collection
SELECT *
FROM "collections"
WHERE "user_id" = 1
AND "favourite" = 1;

-- Find all boardgames in database
SELECT *
FROM "boardgames";

-- Find all local events that are upcoming or active
SELECT *
FROM "events"
WHERE "type" = 'local'
AND "status" = 'upcoming'
OR "status" = 'active';

-- Find all away events that are upcoming or active
SELECT *
FROM "events"
WHERE "type" = 'away'
AND "status" = 'upcoming'
OR "status" = 'active';

-- Add new user
INSERT INTO "users" ("username", "first_name", "last_name", "city", "email", "password", "organization", "status")
VALUES ('yarodg', 'Jarek', 'Toothkiewicz', 'Dabrowa Gornicza', 'yaro123@mail.com', 'hash', 'Planszowa Dabrowa', 'player');

-- Add new boardgame to collection
INSERT INTO "boardgames" ("title", "publisher", "players", "cover_image", "description")
VALUES ('Rising Sun', 'Portal Games', '3-5', ' ', 'Area control game sets in japan theme');

INSERT INTO "collections" ("user_id", "bg_id")
VALUES ('1', '1');

-- Register to certain event
INSERT INTO "events" ("id", "name", "start_date", "end_date", "location", "host", "type", "status", "registrations")
VALUES ('1', 'Planszowa Dabrowa', '2023-10-28', '2023-10-30', 'Dabrowa Gornicza', 'Planszowa Dabrowa', 'away', 'upcoming', '1');
