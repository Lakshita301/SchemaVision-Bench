-- Source: https://github.com/htmlacademy-nodejs/1649811-typoteka-3/blob/869451f5f2f2aaca4836274a940a495bcc020f64/schema.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 8

CREATE TABLE categories
(
    id    SERIAL PRIMARY KEY,
    title VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE users
(
    id        SERIAL PRIMARY KEY,
    firstname VARCHAR NOT NULL,
    lastname  VARCHAR NOT NULL,
    email     VARCHAR NOT NULL UNIQUE,
    password  VARCHAR NOT NULL,
    avatar    VARCHAR DEFAULT '',
    role      VARCHAR DEFAULT 'reader'
);

CREATE TABLE articles
(
    id        SERIAL PRIMARY KEY,
    title     VARCHAR   NOT NULL UNIQUE,
    picture   VARCHAR DEFAULT NULL,
    announce  VARCHAR   NOT NULL,
    "fullText"  TEXT    DEFAULT NULL,
    "createdAt" TIMESTAMP NOT NULL
);

CREATE TABLE comments
(
    id          SERIAL PRIMARY KEY,
    text        TEXT      NOT NULL,
    "createdAt"   TIMESTAMP NOT NULL,
    "userId"    INTEGER   NOT NULL,
    "articleId" INTEGER   NOT NULL,
    FOREIGN KEY ("userId") REFERENCES users (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY ("articleId") REFERENCES articles (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE article_categories
(
    "articleId"  INTEGER NOT NULL,
    "categoryId" INTEGER NOT NULL,
    CONSTRAINT article_categories_pk PRIMARY KEY ("articleId", "categoryId"),
    FOREIGN KEY ("articleId") REFERENCES articles (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY ("categoryId") REFERENCES categories (id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE tokens
(
    token VARCHAR PRIMARY KEY
);

