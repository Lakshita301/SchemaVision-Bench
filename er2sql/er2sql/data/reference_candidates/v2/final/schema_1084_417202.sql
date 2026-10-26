-- Source: https://github.com/DiscoStu00/myversionJenkins2/blob/c5faf20b0ed37d8ee2f7fc06e732ac5eb53084cd/spring-boot-samples/spring-boot-sample-jooq/src/main/resources/schema.sql?raw=true
-- Tables detected: 5 | FK constraints: 4
CREATE TABLE language (
    id NUMBER(7)     NOT NULL PRIMARY KEY,
    cd CHAR(2)       NOT NULL,
    description VARCHAR(50)
);

CREATE TABLE author (
    id NUMBER(7)     NOT NULL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)  NOT NULL,
    date_of_birth DATE,
    year_of_birth NUMBER(7),
    distinguished NUMBER(1)
);

CREATE TABLE book (
    id NUMBER(7)     NOT NULL PRIMARY KEY,
    author_id NUMBER(7)     NOT NULL,
    title VARCHAR(400) NOT NULL,
    published_in NUMBER(7)     NOT NULL,
    language_id NUMBER(7)     NOT NULL,
    CONSTRAINT fk_book_author     FOREIGN KEY (author_id)   REFERENCES author(id),
    CONSTRAINT fk_book_language   FOREIGN KEY (language_id) REFERENCES language(id)
);

CREATE TABLE book_store (
    name VARCHAR(400) NOT NULL UNIQUE
);

CREATE TABLE book_to_book_store (
    name VARCHAR(400) NOT NULL,
    book_id INTEGER       NOT NULL,
    stock INTEGER,
    PRIMARY KEY(name, book_id),
    CONSTRAINT fk_b2bs_book_store FOREIGN KEY (name)        REFERENCES book_store (name) ON DELETE CASCADE,
    CONSTRAINT fk_b2bs_book       FOREIGN KEY (book_id)     REFERENCES book (id)         ON DELETE CASCADE
);
