-- Source: https://github.com/TanaseSebastian/StudioMedico/blob/e1c010a38eb9376dd54e0378afdb66adc6686d4c/PrenotazioniStudioMedico/script_SQL/STUDIOMEDICO.sql?raw=true
-- Tables detected: 6 | FK constraints: 6

CREATE TABLE DIPARTIMENTI (
  codDipartimento int NOT NULL AUTO_INCREMENT,
  piano varchar(50) NOT NULL,
  phone varchar(45) NOT NULL,
  nome varchar(45) NOT NULL,
  PRIMARY KEY (codDipartimento)
);

CREATE TABLE UTENTI (
  CF char(16) NOT NULL unique,
  NOME varchar(50) NOT NULL,
  COGNOME varchar(50) NOT NULL,
  USERNAME varchar(50) NOT NULL unique,
  EMAIL varchar(50) NOT NULL unique,
  PHONE char(10) NOT NULL,
  PSW varchar(128) NOT NULL,
  AMMINISTRATORE char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (CF)
);

CREATE TABLE DOTTORI (
  codDottore int NOT NULL AUTO_INCREMENT,
  nome varchar(45) NOT NULL,
  cognome varchar(45) NOT NULL,
  phone varchar(45) NOT NULL,
  email varchar(45) NOT NULL,
  codDipartimento int NOT NULL,
  PRIMARY KEY (codDottore),
  KEY codDipartimento_idx (codDipartimento),
  CONSTRAINT codDipartimento FOREIGN KEY (codDipartimento) REFERENCES DIPARTIMENTI (codDipartimento) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PRESTAZIONI(
codPrestazione INT NOT NULL auto_increment primary key,
Nome varchar(255) NOT NULL,
codDipartimento INT NOT NULL,
FOREIGN KEY (codDipartimento) REFERENCES DIPARTIMENTI(codDipartimento) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PRENOTAZIONI (
  codPrenotazione int NOT NULL AUTO_INCREMENT,
  dateTime datetime NOT NULL,
  commento varchar(250) DEFAULT NULL,
  codPrestazione INT NOT NULL,
  codFisc char(16) NOT NULL,
  codDottore int NOT NULL,
  stato varchar(20) NOT NULL DEFAULT "In attesa",
  PRIMARY KEY (codPrenotazione),
  KEY CF_idx (codFisc),
  KEY codDottore_idx (codDottore),
  CONSTRAINT CF FOREIGN KEY (codFisc) REFERENCES UTENTI (CF) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT codDottore FOREIGN KEY (codDottore) REFERENCES DOTTORI (codDottore) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT codPrestazione FOREIGN KEY (codPrestazione) REFERENCES PRESTAZIONI(codPrestazione) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE fatture (
codiceFattura INT NOT NULL AUTO_INCREMENT , 
codicePrenotazione INT NOT NULL , 
importo DECIMAL(8,2) NOT NULL ,
dataEmissione DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
documento BLOB NULL DEFAULT NULL,
 PRIMARY KEY (codiceFattura),
 FOREIGN KEY (codicePrenotazione) REFERENCES PRENOTAZIONI(codPrenotazione) ON DELETE CASCADE ON UPDATE CASCADE
 );

