-- Source: https://github.com/walidaous/gestion_etudians/blob/3751ae9e178243a7402e7930e409b43f47aff0c6/school1.sql?raw=true
-- Tables detected: 4 | FK constraints: 2
-- Foreign keys added via ALTER TABLE:
CREATE TABLE classe (
    id int NOT NULL,
    code varchar(50) NOT NULL,
    id_filiere varchar(50) NOT NULL
);

CREATE TABLE etudiant (
    id int NOT NULL,
    nom varchar(50) NOT NULL,
    prenom varchar(50) NOT NULL,
    ville varchar(50) NOT NULL,
    sexe varchar(20) NOT NULL,
    id_classe varchar(50) NOT NULL
);

CREATE TABLE filiere (
    id int NOT NULL,
    libelle varchar(50) NOT NULL,
    code varchar(50) NOT NULL
);

CREATE TABLE login (
    id int NOT NULL,
    usename varchar(50) NOT NULL,
    password varchar(50) NOT NULL
);


                          

ALTER TABLE classe
  ADD CONSTRAINT fk_fl FOREIGN KEY (id_filiere) REFERENCES filiere (code);

ALTER TABLE etudiant
  ADD CONSTRAINT etudiant_ibfk_1 FOREIGN KEY (id_classe) REFERENCES classe (code);
