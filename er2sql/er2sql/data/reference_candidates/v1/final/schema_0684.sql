-- Source: https://github.com/camwebb/klinikDB/blob/421f948096a92cef5e4ee9c6966a3d2c83fba3dc/sql/klinikDB.sql?raw=true
-- Tables detected: 19 | FK/REFERENCES mentions: 24
--  `desa` varchar(50) COLLATE utf8_bin NOT NULL,
--  `kecamatan` varchar(30) COLLATE utf8_bin NOT NULL,
--  `kabupaten` varchar(20) COLLATE utf8_bin NOT NULL,
--  `spousename` varchar(100) COLLATE utf8_bin DEFAULT NULL,
--  `address` varchar(100) COLLATE utf8_bin DEFAULT NULL,
--  `phone` varchar(100) COLLATE utf8_bin DEFAULT NULL,
CREATE TABLE "Users" (
    "UserID" int NOT NULL AUTO_INCREMENT,
    "UserName" varchar(32) COLLATE utf8_bin NOT NULL,
    "Password" varchar(32) COLLATE utf8_bin NOT NULL,
    "Role" enum('ADMIN','MEDICAL','PHARMACY')
    COLLATE utf8_bin NOT NULL,
    PRIMARY KEY ("UserID"),
    UNIQUE KEY "userName" ("UserName")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "antenatal" (
    "id" int NOT NULL AUTO_INCREMENT,
    "patientID" int NOT NULL,
    "G" enum('0','1','2','3','4','5','6','7','8','9','10')
    DEFAULT NULL COMMENT 'Gestations',
    "P" enum('0','1','2','3','4','5','6','7','8','9','10')
    DEFAULT NULL COMMENT 'Paritus',
    "A" enum('0','1','2','3','4','5','6','7','8','9','10')
    DEFAULT NULL COMMENT 'Abortus',
    "M" enum('0','1','2','3','4','5','6','7','8','9','10')
    DEFAULT NULL COMMENT 'Mati',
    "date" date NOT NULL COMMENT 'visit date',
    "docID" int NOT NULL,
    "visit" enum('1','2','3','4','5','6','7','8','9','10')
    NOT NULL COMMENT 'visit number, this pregnancy',
    "weight" decimal(4,1) DEFAULT NULL COMMENT 'mother weight, kg',
    "tfu" decimal(4,1) DEFAULT NULL COMMENT 'fundus height, cm',
    "height" int DEFAULT NULL COMMENT 'mother height, cm',
    "bp_syst" int DEFAULT NULL COMMENT 'systolic BP',
    "bp_dia" int DEFAULT NULL COMMENT 'diastolic BP',
    "heart_m" int DEFAULT NULL COMMENT 'mother heart rate, bpm',
    "heart_c" int DEFAULT NULL COMMENT 'baby heart rate, bpm',
    "last_period" date NOT NULL COMMENT 'Last period',
    "birth_date" date NOT NULL COMMENT 'predicted labor date',
    "nextvisit" date NOT NULL COMMENT 'next visit date',
    "risk" enum('bas','haut') COLLATE utf8_bin NOT NULL COMMENT 'predicted risk',
    "tetanus" enum('0','1','2','3','4','5')
     DEFAULT NULL COMMENT 'Number of anti-tetanus shots',
    "edema" SMALLINT DEFAULT NULL,
    "bleeding" SMALLINT DEFAULT NULL,
    "shrinking" SMALLINT DEFAULT NULL,
    "stillfet" SMALLINT DEFAULT NULL,
    "malaria" SMALLINT DEFAULT NULL,
    "ultrasound" SMALLINT DEFAULT NULL,
    "sti" SMALLINT DEFAULT NULL,
    "notes" varchar(500) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "visits" ("patientID","date","visit"),
    KEY "patientID" ("patientID"),
    KEY "docID" ("docID"),
    CONSTRAINT "docID" FOREIGN KEY ("docID") REFERENCES "doc" ("id"),
    CONSTRAINT "patientID" FOREIGN KEY ("patientID") REFERENCES "patient" ("id")
) ;

CREATE TABLE "diagnoses" (
    "id" int NOT NULL AUTO_INCREMENT,
    "patientID" int NOT NULL,
    "date" date NOT NULL,
    "suspect" SMALLINT NOT NULL DEFAULT 0,
    "docID" int NOT NULL,
    "icd10ID" int NOT NULL,
    "note" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "patientID" ("patientID"),
    KEY "icd10ID" ("icd10ID"),
    KEY "docID" ("docID"),
    CONSTRAINT "diagnoses_ibfk_1" FOREIGN KEY ("patientID")
    REFERENCES "patient" ("id"),
    CONSTRAINT "diagnoses_ibfk_2" FOREIGN KEY ("icd10ID")
    REFERENCES "icd10" ("id"),
    CONSTRAINT "diagnoses_ibfk_3" FOREIGN KEY ("docID")
    REFERENCES "doc" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "doc" (
    "id" int NOT NULL AUTO_INCREMENT,
    "nama" varchar(100) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "nama" ("nama")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "drug" (
    "id" int NOT NULL AUTO_INCREMENT,
    "genericID" int NOT NULL,
    "format" enum('ampoule','inhalateur','capsule','solution','nébuliseur','sachet','sirop','sirop sec','vaporisateur','suppositoire','tablette','gouttes','tube','flacon','poudre') COLLATE utf8_bin NOT NULL,
    "size" decimal(10,2) DEFAULT NULL,
    "units" enum('g','mg','ug','L','mL','IU') COLLATE utf8_bin DEFAULT NULL,
    "conc" varchar(20) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "genericID_2" ("genericID","format","size"),
    KEY "genericID" ("genericID"),
    CONSTRAINT "drug_ibfk_1" FOREIGN KEY ("genericID") REFERENCES "drugGeneric" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "drugDispense" (
    "id" int NOT NULL AUTO_INCREMENT,
    "drugID" int NOT NULL,
    "numberTot" int DEFAULT NULL,
    "date" date NOT NULL,
    "dosage" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "patientID" int NOT NULL,
    "docID" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "drugID" ("drugID"),
    KEY "patientID" ("patientID"),
    KEY "docID" ("docID"),
    CONSTRAINT "drugDispense_ibfk_1" FOREIGN KEY ("patientID") REFERENCES "patient" ("id"),
    CONSTRAINT "drugDispense_ibfk_2" FOREIGN KEY ("drugID") REFERENCES "drug" ("id"),
    CONSTRAINT "drugDispense_ibfk_3" FOREIGN KEY ("docID") REFERENCES "doc" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "drugGeneric" (
    "id" int NOT NULL AUTO_INCREMENT,
    "nameEng" varchar(100) CHARACTER SET utf8 NOT NULL,
    "class" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "nameEng" ("nameEng")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "drugManuf" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(100) CHARACTER SET utf8 NOT NULL,
    "alamat" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name" ("name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "drugPackage" (
    "id" int NOT NULL AUTO_INCREMENT,
    "unitID" int NOT NULL,
    "container" enum('bouteille','boîte de conserve','boîte','individuel') COLLATE utf8_bin NOT NULL,
    "unitsPerCont" int NOT NULL,
    "tradeName" varchar(100) COLLATE utf8_bin NOT NULL,
    "manufID" int NOT NULL,
    "keepStocked" int DEFAULT NULL,
    "oldestExpiry" date DEFAULT NULL,
    "inUse" enum('oui','non') COLLATE utf8_bin NOT NULL DEFAULT 'oui',
    PRIMARY KEY ("id"),
    UNIQUE KEY "manufID_2" ("manufID","unitID","unitsPerCont","container"),
    KEY "unitID" ("unitID"),
    KEY "manufID" ("manufID"),
    CONSTRAINT "drugPackage_ibfk_1" FOREIGN KEY ("unitID") REFERENCES "drug" ("id"),
    CONSTRAINT "drugPackage_ibfk_2" FOREIGN KEY ("manufID") REFERENCES "drugManuf" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "drugStock" (
    "id" int NOT NULL AUTO_INCREMENT,
    "packageID" int NOT NULL,
    "correction" SMALLINT NOT NULL DEFAULT 0,
    "number" int NOT NULL,
    "transDate" date NOT NULL,
    "costRp" int DEFAULT NULL,
    "batch" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "supplID" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "packageID" ("packageID"),
    KEY "supplID" ("supplID"),
    CONSTRAINT "drugStock_ibfk_2" FOREIGN KEY ("supplID")
    REFERENCES "drugSuppl" ("id"),
    CONSTRAINT "drugStock_ibfk_4" FOREIGN KEY ("packageID")
    REFERENCES "drugPackage" ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "drugSuppl" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "address" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "phone" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "email" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "contact" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name" ("name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "dusun" (
    "id" int NOT NULL AUTO_INCREMENT,
    "commune" varchar(50) COLLATE utf8_bin DEFAULT NULL,
    "dusun" varchar(50) COLLATE utf8_bin NOT NULL,
    "sous" varchar(50) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "dusun" ("dusun","sous")
) ;

CREATE TABLE "icd10" (
    "id" int NOT NULL AUTO_INCREMENT,
    "code" varchar(50) COLLATE utf8_bin NOT NULL,
    "name" varchar(200) COLLATE utf8_bin NOT NULL,
    "common" SMALLINT NOT NULL DEFAULT 0,
    PRIMARY KEY ("id"),
    UNIQUE KEY "icd10" ("code")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1694;

CREATE TABLE "patient" (
    "id" int NOT NULL AUTO_INCREMENT,
    "patrec" int NOT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "sex" enum('H','F') COLLATE utf8_bin NOT NULL,
    "fathername" varchar(100) COLLATE utf8_bin NOT NULL,
    "mothername" varchar(100) COLLATE utf8_bin NOT NULL,
    "child1name" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "birthdate" date NOT NULL,
    "approxdob" SMALLINT NOT NULL DEFAULT 0,
    "birthvillage" int null default null,
    "dusunID" int NOT NULL,
    "notes" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "patrec" ("patrec"),
    KEY "dusunID" ("dusunID"),
    CONSTRAINT "patient_ibfk_1" FOREIGN KEY ("dusunID") REFERENCES "dusun" ("id"),
    CONSTRAINT "patient_ibfk_2" FOREIGN KEY ("birthvillage") REFERENCES "dusun" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "visit" (
    "id" int NOT NULL AUTO_INCREMENT,
    "patientID" int NOT NULL,
    "visitTypeID" int NOT NULL,
    "amount" int DEFAULT NULL,
    "date" date NOT NULL,
    "docID" int DEFAULT NULL,
    "location" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "patientID" ("patientID"),
    KEY "visitTypeID" ("visitTypeID"),
    KEY "docID" ("docID"),
    CONSTRAINT "visit_ibfk_1" FOREIGN KEY ("patientID") REFERENCES "patient" ("id"),
    CONSTRAINT "visit_ibfk_2" FOREIGN KEY ("visitTypeID") REFERENCES "visitType" ("id"),
    CONSTRAINT "visit_ibfk_3" FOREIGN KEY ("docID") REFERENCES "doc" ("id"),
    CONSTRAINT "visit_ibfk_4" FOREIGN KEY ("location") REFERENCES "dusun" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "visitType" (
    "id" int NOT NULL AUTO_INCREMENT,
    "label" varchar(50) COLLATE utf8_bin NOT NULL,
    "type" enum('service','payment') COLLATE utf8_bin NOT NULL DEFAULT 'service',
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "fp" (
    "id" int NOT NULL AUTO_INCREMENT,
    "patientID" int NOT NULL,
    "date" date NOT NULL COMMENT 'visit date',
    "docID" int NOT NULL,
    "newpat" enum('nouveau','ancien') DEFAULT NULL,
    "type" enum('diu','injectable','pillule','implant') NOT NULL,
    "grosesse" enum('negatif','positif') DEFAULT NULL,
    "last_period" date DEFAULT NULL COMMENT 'last period',
    "nextvisit" date DEFAULT NULL COMMENT 'next visit date',
    "kidage" int DEFAULT NULL COMMENT 'age last kid (months)',
    "notes" varchar(500) DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "fp_pat+date+type" ("patientID","date","type"),
    KEY "fp_patientID" ("patientID"),
    KEY "fp_docID" ("docID"),
    CONSTRAINT "fp_docID" FOREIGN KEY ("docID") REFERENCES "doc" ("id"),
    CONSTRAINT "fp_patientID" FOREIGN KEY ("patientID") REFERENCES "patient" ("id")
) ;

CREATE TABLE "vaxShot" (
    "id" int NOT NULL AUTO_INCREMENT,
    "patientID" int NOT NULL,
    "date" date NOT NULL COMMENT 'visit date',
    "docID" int NOT NULL,
    "newvax" enum('nouveau','ancien') DEFAULT NULL,
    "vaxID" int NOT NULL,
    "nextvisit" date DEFAULT NULL COMMENT 'next visit date',
    "notes" varchar(500) DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "vaxShot_pat+date+vax" (patientID, "date","vaxID"),
    KEY "vaxShot_patientID" ("patientID"),
    KEY "vaxShot_docID" ("docID"),
    KEY "vaxShot_vaxID" ("vaxID"),
    CONSTRAINT "vaxShot_docID" FOREIGN KEY ("docID") REFERENCES "doc" ("id"),
    CONSTRAINT "vaxShot_patientID" FOREIGN KEY ("patientID") REFERENCES "patient" ("id"),
    CONSTRAINT "vaxShot_vaxID" FOREIGN KEY ("vaxID") REFERENCES "vax" ("id")
) ;

CREATE TABLE "vax" (
    "id" int NOT NULL AUTO_INCREMENT,
    "short" varchar(50) NOT NULL,
    "notes" varchar(200) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "vax_short" ("short")
) ;
