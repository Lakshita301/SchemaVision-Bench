-- Source: https://github.com/rifqiadliansyah/FinalProjectPBO_6/blob/8cde966bcd2b4bb33b2eca4efe59f7d440ffcc79/Database%20koperasi%20Export/koperasi.sql?raw=true
-- Tables detected: 4 | FK constraints: 3
CREATE TABLE individu (
    idnasabah int NOT NULL,
    nik int DEFAULT NULL,
    npwp int DEFAULT NULL
);
CREATE TABLE nasabah (
    idnasabah int NOT NULL,
    nama varchar(100) DEFAULT NULL,
    alamat varchar(100) DEFAULT NULL
);
CREATE TABLE perusahaan (
    idnasabah int NOT NULL,
    nib varchar(100) DEFAULT NULL
);
CREATE TABLE rekening (
    no_rekening int NOT NULL,
    saldo DOUBLE PRECISION DEFAULT NULL,
    idnasabah int DEFAULT NULL
);
ALTER TABLE individu ADD CONSTRAINT individu_ibfk_1 FOREIGN KEY (idnasabah) REFERENCES nasabah (idnasabah) ON UPDATE CASCADE;
ALTER TABLE perusahaan ADD CONSTRAINT perusahaan_ibfk_1 FOREIGN KEY (idnasabah) REFERENCES nasabah (idnasabah) ON UPDATE CASCADE;
ALTER TABLE rekening ADD CONSTRAINT rekening_ibfk_1 FOREIGN KEY (idnasabah) REFERENCES nasabah (idnasabah) ON UPDATE CASCADE;
