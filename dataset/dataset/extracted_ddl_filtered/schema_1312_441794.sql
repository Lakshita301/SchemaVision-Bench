-- Source: https://github.com/M-Kempkes/drempeltoets/blob/8956b43d512a41b6a9962ca4634cd1cb7a09728c/database.sql?raw=true
-- Tables detected: 4 | FK constraints: 2

CREATE TABLE medewerker (
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE activiteiten (
    id int NOT NULL AUTO_INCREMENT,
    omschrijving varchar(255) NOT NULL,
    PRIMARY KEY (id)
    
);

CREATE TABLE jongeren (
    id int NOT NULL AUTO_INCREMENT,
    firstname varchar(255) NOT NULL,
    lastname varchar(255) NOT NULL,
    NAW varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE koppel (
    id int NOT NULL AUTO_INCREMENT,
    activiteitenid int NOT NULL,
    jongerenid int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (activiteitenid) REFERENCES activiteiten(id) ON DELETE CASCADE,
    FOREIGN KEY (jongerenid) REFERENCES jongeren(id) ON DELETE CASCADE
);

