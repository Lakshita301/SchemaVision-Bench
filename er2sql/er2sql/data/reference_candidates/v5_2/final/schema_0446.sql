-- Source: https://github.com/joseortiz9/ProgrammingLabs_itmo/blob/150ce8300e0878d9ab04f0281cc8b55f84459615/generate_db_script.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 14
CREATE TABLE dragon_colors (
    id SERIAL PRIMARY KEY,
    color VARCHAR(30) NOT NULL
);

CREATE TABLE dragon_types (
    id SERIAL PRIMARY KEY,
    type VARCHAR(30) NOT NULL
);

CREATE TABLE dragon_characters (
    id SERIAL PRIMARY KEY,
    "character" VARCHAR(30) NOT NULL
);

CREATE TABLE dragons (
    id SERIAL PRIMARY KEY,
    key INT UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    creation_date TIMESTAMP NOT NULL,
    age BIGINT NULL,
    color INT NOT NULL,
    type INT NOT NULL,
    "character" INT NOT NULL,
    FOREIGN KEY (color) REFERENCES dragon_colors(id),
    FOREIGN KEY (type) REFERENCES dragon_types(id),
    FOREIGN KEY (character) REFERENCES dragon_characters(id)
);

CREATE TABLE dragon_heads (
    id SERIAL PRIMARY KEY,
    num_eyes REAL NULL,
    dragon_id INT NOT NULL,
    FOREIGN KEY (dragon_id) REFERENCES dragons(id) ON DELETE CASCADE
);

CREATE TABLE coordinates (
    id SERIAL PRIMARY KEY,
    x BIGINT NOT NULL,
    y DECIMAL NOT NULL,
    dragon_id INT NOT NULL,
    FOREIGN KEY (dragon_id) REFERENCES dragons(id) ON DELETE CASCADE
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE users_dragons (
    user_id INT NOT NULL,
    dragon_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (dragon_id) REFERENCES dragons(id) ON DELETE CASCADE
);
