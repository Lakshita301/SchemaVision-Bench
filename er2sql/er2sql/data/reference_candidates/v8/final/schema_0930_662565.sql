-- Source: https://github.com/powerstack/powerstack-blog/blob/afcfd654b4827dcabd3a666c08ac3dedb6a1521a/app/sql/pgsql.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE users(
    id SERIAL NOT NULL PRIMARY KEY,
    username VARCHAR(32) UNIQUE,
    password TEXT NOT NULL,
    roles TEXT NOT NULL,
    name VARHCAR(100) NOT NULL
);

CREATE TABLE posts(
    id SERIAL NOT NULL PRIMARY KEY,
    author INTEGER NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    tags TEXT NULL,
    created INTEGER NOT NULL DEFAULT 0,
    updated INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY(author) REFERENCES users(id)
);

CREATE TABLE comments(
    id SERIAL NOT NULL PRIMARY KEY,
    post INTEGER NOT NULL,
    email VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    ip TEXT NOT NULL,
    created INTEGER NOT NULL DEFAULT 0,
    FOREIGN KEY(post) REFERENCES posts(id)
);

