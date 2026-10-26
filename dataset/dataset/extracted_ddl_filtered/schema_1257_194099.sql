-- Source: https://github.com/Genskill2/005-web-application-AmalBalraj/blob/0638959b31fdca1c8e467d197197216c256332be/petshop/sql/000_initial.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

CREATE TABLE animal (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       name TEXT UNIQUE NOT NULL
       );

CREATE TABLE tag (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       name TEXT UNIQUE NOT NULL
       );

CREATE TABLE pet (
       id INTEGER PRIMARY KEY AUTOINCREMENT,
       name TEXT,
       bought DATE,
       sold DATE,
       description TEXT,
       species INTEGER,
       FOREIGN KEY (species) references animal(id) ON DELETE CASCADE
);

CREATE TABLE tags_pets (
       pet INTEGER,
       tag INTEGER,
       FOREIGN KEY (pet) references pet(id) ON DELETE CASCADE,
       FOREIGN KEY (tag) references tag(id) ON DELETE CASCADE
);

