-- Source: https://github.com/AnastasiyaDubovik/DBdiff/blob/c37921ffec01130ae5137a8b458930469215a450/databases.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE authors_book(
    id_author int PRIMARY KEY,
    first_name text,
    second_name text,
    CONSTRAINT length_name CHECK (length(first_name) < 15 AND length(second_name)<15)
);

CREATE TABLE books(
    id_book int PRIMARY KEY,
    name_book varchar(256),
    description_book text,
    release_year int
);

CREATE TABLE book_author(
    id_link int PRIMARY KEY,
    id_author int,
    id_book int,
    FOREIGN KEY (id_author)  REFERENCES authors_book(id_author),
    FOREIGN KEY (id_book) REFERENCES books(id_book)
);

