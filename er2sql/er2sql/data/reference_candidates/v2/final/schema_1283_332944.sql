-- Source: https://github.com/eleves-ig2i/ig2i-le4-poo-2018-tp4/blob/5696b39ef83fa0efb5fbb6f601b11bb05822b2f6/db_routage_with_data.sql?raw=true
-- Tables detected: 7 | FK constraints: 10
CREATE TABLE instance(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nom VARCHAR(50) NOT NULL
);

CREATE TABLE point(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    pointtype INT,
    x DOUBLE PRECISION NOT NULL,
    y DOUBLE PRECISION NOT NULL,
    ninstance INT,
    FOREIGN KEY (ninstance) REFERENCES instance(id)
);

CREATE TABLE depot(
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES point(id),
    PRIMARY KEY (id)
);

CREATE TABLE planning(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cout DOUBLE PRECISION,
    ninstance INT,
    FOREIGN KEY (ninstance) REFERENCES instance(id)
);

CREATE TABLE vehicule(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    cout DOUBLE PRECISION,
    capaciteutilisee INT,
    capacite INT,
    ndepot INT,
    nplanning INT,
    ninstance INT,
    FOREIGN KEY (ndepot) REFERENCES point(id),
    FOREIGN KEY (nplanning) REFERENCES planning(id),
    FOREIGN KEY (ninstance) REFERENCES instance(id)
);

CREATE TABLE client(
    demand INT NOT NULL CHECK(demand > 0),
    position INT,
    id INT NOT NULL,
    FOREIGN KEY (id) REFERENCES point(id),
    nvehicule INT,
    FOREIGN KEY (nvehicule) REFERENCES vehicule(id),
    PRIMARY KEY (id)
);

CREATE TABLE route(
    id INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    ndepart INT NOT NULL,
    narrivee INT NOT NULL,
    distance DOUBLE PRECISION,
    FOREIGN KEY (ndepart) REFERENCES point(id),
    FOREIGN KEY (narrivee) REFERENCES point(id)
);
