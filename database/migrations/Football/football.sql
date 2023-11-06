CREATE TABLE IF NOT EXISTS club (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    id_player INTEGER NOT NULL,
    id_coach INTEGER NOT NULL,
    id_stadium INTEGER NOT NULL,
    id_league INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL,
    FOREIGN KEY (id_player) REFERENCES player (id),
    FOREIGN KEY (id_coach) REFERENCES coach (id),
    FOREIGN KEY (id_stadium) REFERENCES stadium (id),
    FOREIGN KEY (id_league) REFERENCES league (id),
    FOREIGN KEY (id_country) REFERENCES country (id),
    FOREIGN KEY (id_city) REFERENCES city (id)
);

CREATE TABLE IF NOT EXISTS player (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    age INTEGER NOT NULL,
    height INTEGER NOT NULL,
    weight INTEGER NOT NULL,
    id_position INTEGER NOT NULL,
    id_club INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL,
    FOREIGN KEY (id_position) REFERENCES position (id),
    FOREIGN KEY (id_club) REFERENCES club (id),
    FOREIGN KEY (id_country) REFERENCES country (id),
    FOREIGN KEY (id_city) REFERENCES city (id)
);

CREATE TABLE IF NOT EXISTS coach (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    age INTEGER NOT NULL,
    id_club INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL,
    FOREIGN KEY (id_club) REFERENCES club (id),
    FOREIGN KEY (id_country) REFERENCES country (id),
    FOREIGN KEY (id_city) REFERENCES city (id)
);

CREATE TABLE IF NOT EXISTS stadium (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    id_club INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL,
    FOREIGN KEY (id_club) REFERENCES club (id),
    FOREIGN KEY (id_country) REFERENCES country (id),
    FOREIGN KEY (id_city) REFERENCES city (id)
);

CREATE TABLE IF NOT EXISTS league (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    id_country INTEGER NOT NULL,
    FOREIGN KEY (id_country) REFERENCES country (id)
);

CREATE TABLE IF NOT EXISTS country (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS city (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    id_country INTEGER NOT NULL,
    FOREIGN KEY (id_country) REFERENCES country (id)
);

CREATE TABLE IF NOT EXISTS position (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS match (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_club1 INTEGER NOT NULL,
    id_club2 INTEGER NOT NULL,
    id_stadium INTEGER NOT NULL,
    id_league INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL,
    FOREIGN KEY (id_club1) REFERENCES club (id),
    FOREIGN KEY (id_club2) REFERENCES club (id),
    FOREIGN KEY (id_stadium) REFERENCES stadium (id),
    FOREIGN KEY (id_league) REFERENCES league (id),
    FOREIGN KEY (id_country) REFERENCES country (id),
    FOREIGN KEY (id_city) REFERENCES city (id)
);

CREATE TABLE IF NOT EXISTS match_player (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_match INTEGER NOT NULL,
    id_player INTEGER NOT NULL,
    FOREIGN KEY (id_match) REFERENCES match (id),
    FOREIGN KEY (id_player) REFERENCES player (id)
);

CREATE TABLE IF NOT EXISTS match_coach (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_match INTEGER NOT NULL,
    id_coach INTEGER NOT NULL,
    FOREIGN KEY (id_match) REFERENCES match (id),
    FOREIGN KEY (id_coach) REFERENCES coach (id)
);

CREATE TABLE IF NOT EXISTS match_event (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_match INTEGER NOT NULL,
    id_player INTEGER NOT NULL,
    id_event INTEGER NOT NULL,
    FOREIGN KEY (id_match) REFERENCES match (id),
    FOREIGN KEY (id_player) REFERENCES player (id),
    FOREIGN KEY (id_event) REFERENCES event (id)
);

CREATE TABLE IF NOT EXISTS event (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    date DATE
);

CREATE TABLE IF NOT EXISTS match_result (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_match INTEGER NOT NULL,
    id_club INTEGER NOT NULL,
    goals INTEGER NOT NULL,
    FOREIGN KEY (id_match) REFERENCES match (id),
    FOREIGN KEY (id_club) REFERENCES club (id)
);

CREATE TABLE IF NOT EXISTS match_referee (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_match INTEGER NOT NULL,
    id_referee INTEGER NOT NULL,
    FOREIGN KEY (id_match) REFERENCES match (id),
    FOREIGN KEY (id_referee) REFERENCES referee (id)
);

CREATE TABLE IF NOT EXISTS referee (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    surname TEXT NOT NULL,
    age INTEGER NOT NULL,
    id_country INTEGER NOT NULL,
    id_city INTEGER NOT NULL,
    FOREIGN KEY (id_country) REFERENCES country (id),
    FOREIGN KEY (id_city) REFERENCES city (id)
);

