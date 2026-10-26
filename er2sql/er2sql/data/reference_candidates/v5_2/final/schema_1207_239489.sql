-- Source: https://github.com/Daksh-Vatyani/Farmvilla/blob/3c5e49700413113a3fe1d947333f327585ec60a1/id17103288_farmvilla.sql?raw=true
-- Tables detected: 3 | FK constraints: 1
CREATE TABLE guard (
    email text NOT NULL,
    password text NOT NULL
);
CREATE TABLE guests (
    email varchar(30) DEFAULT NULL,
    guest text DEFAULT NULL,
    status text DEFAULT NULL
);
CREATE TABLE profile (
    email varchar(30) NOT NULL,
    password text NOT NULL,
    fname varchar(30) NOT NULL,
    lname varchar(30) NOT NULL,
    mobile varchar(30) NOT NULL,
    property varchar(30) NOT NULL,
    photo text NOT NULL
);
ALTER TABLE guests ADD CONSTRAINT guests_ibfk_1 FOREIGN KEY (email) REFERENCES profile (email) ON DELETE CASCADE ON UPDATE CASCADE;
