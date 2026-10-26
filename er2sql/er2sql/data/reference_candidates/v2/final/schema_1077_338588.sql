-- Source: https://github.com/qehremanekber/PersonalBlog/blob/4d6afbf9476a209195dcbea3f7b7afa87a596fbc/pythonProject/schema.sql?raw=true
-- Tables detected: 3 | FK constraints: 3

CREATE TABLE posts(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    title TEXT NOT NULL,
    content TEXT NOT NULL,
    user1 INTEGER,
    FOREIGN KEY(user1) REFERENCES users(user_id)
);

CREATE TABLE users(
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    email VARCHAR not null,
    name text not null,
    surname text not null,
    username text not null,
    gender bit not null,
    password TEXT NOT NULL
);

CREATE TABLE comments(
    cid INTEGER PRIMARY KEY AUTOINCREMENT,
    ccreated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ccontent TEXT NOT NULL,
    user2 INTEGER,
    posted INTEGER,
    FOREIGN KEY(user2) REFERENCES users(user_id),
    FOREIGN KEY(posted) REFERENCES posts(id)
);

