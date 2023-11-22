/* rajout de la date dans "event" */
ALTER TABLE event
ADD date DATE;


/* enlver la clé étrangère "id_player" de la table "club"*/
BEGIN TRANSACTION;
CREATE TABLE nouvelle_club AS
SELECT
    id,
    name,
    id_coach,
    id_stadium,
    id_league,
    id_country,
    id_city
FROM club;

DROP TABLE club;

ALTER TABLE nouvelle_club RENAME TO club;
COMMIT;

/* mise à jour des tables suite au changement de la table "club" */

CREATE TABLE match_result_temp (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_match INTEGER NOT NULL,
    id_club INTEGER NOT NULL,
    goals INTEGER NOT NULL
);
INSERT INTO match_result_temp SELECT * FROM match_result;
DROP TABLE match_result;
ALTER TABLE match_result_temp RENAME TO match_result;

CREATE TABLE IF NOT EXISTS match_temp (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_club1 INTEGER NOT NULL,
    id_club2 INTEGER NOT NULL,
    id_stadium INTEGER NOT NULL,
    id_league INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL,
);
INSERT INTO match_temp SELECT * FROM match;
DROP TABLE match;
ALTER TABLE match_temp RENAME TO match;

CREATE TABLE IF NOT EXISTS coach_temp (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    age INTEGER NOT NULL,
    id_club INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL
);
INSERT INTO coach_temp SELECT * FROM coach;
DROP TABLE coach;
ALTER TABLE coach_temp RENAME TO coach;

CREATE TABLE IF NOT EXISTS stadium_temp (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    id_club INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL
);
INSERT INTO stadium_temp SELECT * FROM stadium;
DROP TABLE stadium;
ALTER TABLE stadium_temp RENAME TO stadium;

CREATE TABLE IF NOT EXISTS player_temp (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    age INTEGER NOT NULL,
    height INTEGER NOT NULL,
    weight INTEGER NOT NULL,
    id_position INTEGER NOT NULL,
    id_club INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL
);
INSERT INTO player_temp SELECT * FROM player;
DROP TABLE player;
ALTER TABLE player_temp RENAME TO player;

ALTER TABLE match_result
ADD score VARCHAR(10),
ADD buts_club1 INTEGER,
ADD buts_club2 INTEGER;

ALTER TABLE match 
ADD points_club1 INTEGER,
ADD points_club2 INTEGER;

DELETE FROM club
WHERE id = 56;