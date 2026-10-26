-- Source: https://github.com/Esteve172/Manejo-bases-de-datos-.-Grupo-Henry-Valeria-y-Victor/blob/16e9682610c28ad3b8963cc286cf5a5fb9141f77/project.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6
CREATE TABLE regimen (
    id_regimen char(5) NOT NULL,
    regimen varchar(40) NOT NULL,
    id_area_area integer NOT NULL,
    CONSTRAINT regimen_pk PRIMARY KEY (id_regimen,id_area_area)
);
CREATE TABLE lugar_de_parto (
    id_lugar serial NOT NULL,
    inst_salud integer NOT NULL,
    domicilio integer NOT NULL,
    otro integer NOT NULL,
    sin_informacion integer NOT NULL,
    total integer NOT NULL,
    ano integer NOT NULL,
    id_regimen_regimen char(5),
    id_area_area_regimen integer,
    CONSTRAINT "lugar_pk" PRIMARY KEY (id_lugar)
);
CREATE TABLE tipo_de_parto (
    id_tipo serial NOT NULL,
    cesarea integer NOT NULL,
    espontaneo integer NOT NULL,
    instrumentado integer NOT NULL,
    sin_informacion integer NOT NULL,
    total integer NOT NULL,
    ano integer NOT NULL,
    id_regimen_regimen char(5),
    id_area_area_regimen integer,
    CONSTRAINT "tipo de parto_pk" PRIMARY KEY (id_tipo)
);
CREATE TABLE area (
    id_area serial NOT NULL,
    nombre varchar(50) NOT NULL,
    CONSTRAINT "area_pk" PRIMARY KEY (id_area)
);
ALTER TABLE regimen ADD CONSTRAINT area_fk FOREIGN KEY (id_area_area)
REFERENCES area (id_area) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE lugar_de_parto ADD CONSTRAINT regimen_fk FOREIGN KEY (id_regimen_regimen,id_area_area_regimen)
REFERENCES regimen (id_regimen,id_area_area) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE tipo_de_parto ADD CONSTRAINT regimen_fk FOREIGN KEY (id_regimen_regimen,id_area_area_regimen)
REFERENCES regimen (id_regimen,id_area_area) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
