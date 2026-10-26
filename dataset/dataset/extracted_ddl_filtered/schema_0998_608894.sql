-- Source: https://github.com/Baasb20/project1/blob/4b3f810efeea1c845943205187bbf55d11f8816a/sql_statements.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

CREATE TABLE account(
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(250) NOT NULL,
    email VARCHAR(250) UNIQUE NOT NULL,
    usertype_id INT NOT NULL,
    password VARCHAR(250) NOT NULL,
    create_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY(id)
    FOREIGN KEY(usertype_id) REFERENCES usertype(id)
);

CREATE TABLE usertype(
    id INT NOT NULL AUTO_INCREMENT,
    type VARCHAR(250) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY(id),
);

CREATE TABLE persoon(
    id INT NOT NULL AUTO_INCREMENT,
    account_id INT NOT NULL,
    firstname VARCHAR(250) NOT NULL,
    middlename VARCHAR(250),
    lastname VARCHAR(250) NOT NULL,
    create_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (account_id) REFERENCES account(id)
);

