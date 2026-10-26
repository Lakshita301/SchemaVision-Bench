-- Source: https://github.com/clockmakerbrett/the-bug-files/blob/385ecadab89f655f8ef8b0e7b1da7f0d9a73f884/database.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(25),
    password_hash VARCHAR(100)
);

CREATE TABLE projects(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    name VARCHAR(25),
    description VARCHAR(255),
    CONSTRAINT fk_project FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE bugs(
    id SERIAL PRIMARY KEY,
    project_id INTEGER,
    status status_type DEFAULT 'To Do',
    description VARCHAR(255),
    comments VARCHAR(255)"",
    CONSTRAINT fk_project FOREIGN KEY(project_id) REFERENCES projects(id)
);
