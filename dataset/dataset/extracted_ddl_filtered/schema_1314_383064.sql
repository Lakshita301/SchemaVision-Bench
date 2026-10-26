-- Source: https://github.com/VERSALIFESA/VersaLifeHealth/blob/7d7770f314f0ee00954640ed2e3a08656e75b581/Assests/Entities%20SQL(s)/all_tabbes.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

CREATE TABLE tbl_patient (
    pat_ID         DECIMAL (18)  NOT NULL, -- cannot be primary key since pat_number is auto_incremented, hence primary by default
    pat_number     INT           auto_increment NOT NULL primary key,
    pat_firstname  VARCHAR (100) NULL NOT NULL,
    pat_middlename VARCHAR (100) NULL,
    pat_lastname   VARCHAR (100) NOT NULL,
    pat_title      VARCHAR (10)  NOT NULL,
    pat_gender     VARCHAR (10)  NOT NULL,
    pat_DOB        DATE          NOT NULL,
    pat_age        INT           NULL,
    pat_race       VARCHAR (10)  NULL,
    pat_tel        DECIMAL (18)  NULL,
    pat_mobile     DECIMAL (18)  NULL,
    pat_email      VARCHAR (150) NULL,
    pat_address    VARCHAR (255) NULL,
    pat_city       VARCHAR (255) NULL,
    pat_province   VARCHAR (100) NULL,
    pat_postalCode INT           NULL,
    pat_date       TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    pat_notes      VARCHAR (255) NULL,
    pat_attachment VARCHAR (255) NULL
);

CREATE TABLE tbl_assessment (
	ass_ID          INT           NOT NULL,
    ass_duration    INT           NULL,
    ass_expiryDate  DATE          NULL,
    ass_fitness     VARCHAR (20)  NULL,
    ass_note        VARCHAR (255) NULL,
    ass_medicalType VARCHAR (50)  NULL,
    ass_dateTime    TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY CLUSTERED (ass_ID ASC)
);

CREATE TABLE tbl_healthRecord (
	HR_ID                  INT           NOT NULL,
    HR_OtherMedication     VARCHAR (100) NULL,
    HR_OtherMedicationNote VARCHAR (255) NULL,
    HR_DateTime            TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    ass_ID                 INT           NULL,
    pat_number             INT,
    PRIMARY KEY CLUSTERED (HR_ID ASC),
    FOREIGN KEY (ass_ID) REFERENCES tbl_assessment (ass_ID),
    FOREIGN KEY (pat_number) REFERENCES tbl_patient (pat_number) -- changed from pat_ID to pat_number since pat_ID is not a primary key anymore
);

CREATE TABLE tbl_physical (
	ass_ID        INT           PRIMARY KEY,
    psy_datetime  TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    psy_height    DECIMAL (18)  NULL,
    psy_weight    DECIMAL (18)  NULL,
    psy_cannabis  VARCHAR (10)  NULL,
    psy_chestXray VARCHAR (255) NULL,
    FOREIGN KEY (ass_ID) REFERENCES tbl_assessment (ass_ID)
);

