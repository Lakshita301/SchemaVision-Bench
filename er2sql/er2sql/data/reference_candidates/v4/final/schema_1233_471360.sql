-- Source: https://github.com/shoshirizel/pokemon-project/blob/85a57541c3f984dc42bb7250fd645ddf5d057bdf/database/create.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

CREATE TABLE owners(
    name VARCHAR(20) PRIMARY KEY,
    town VARCHAR(20)
);

CREATE TABLE pokemon(
    id INT PRIMARY key,
    name VARCHAR(20),
    height INT,
    weight INT
);

CREATE TABLE pokemon_owners(
    pokemon_id INT,
    owner_name VARCHAR(20),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id),
    FOREIGN KEY (owner_name) REFERENCES owners(name),
    UNIQUE(pokemon_id, owner_name)
);

CREATE TABLE pokemon_type(
    pokemon_id INT,
    type VARCHAR(20),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(id)
);

