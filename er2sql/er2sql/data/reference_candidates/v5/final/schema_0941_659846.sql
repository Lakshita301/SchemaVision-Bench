-- Source: https://github.com/missTam/Library-App/blob/55094e91498e865e23a688facd08e60cce14392c/resources/scripts/sqlite_create_db.sql?raw=true
-- Tables detected: 5 | FK constraints: 2
CREATE TABLE authors 
    (
    _id INTEGER PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL
);

CREATE TABLE genres
    (
    _id INTEGER PRIMARY KEY,
    name VARCHAR NOT NULL
);

CREATE TABLE books 
    (
    _id INTEGER PRIMARY KEY,
    title VARCHAR NOT NULL,
    publication_year INTEGER,
    library_card INTEGER,
    author INTEGER NOT NULL
);

CREATE TABLE library_cards 
    (
    _id INTEGER PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    valid_until DATE NOT NULL
);

CREATE TABLE relation
    (
    book INTEGER NOT NULL,
    genre INTEGER NOT NULL
);
ALTER TABLE books ADD FOREIGN KEY (library_card) REFERENCES library_cards (_id);
ALTER TABLE books ADD FOREIGN KEY (author) REFERENCES authors (_id);
