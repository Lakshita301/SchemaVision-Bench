-- Source: https://github.com/firebearrex/Practinum-1/blob/114bbff47060b651990ea1172e0d6314e8b3fb5f/Data-Definition-Statements/0351_create.sql?raw=true
-- Tables detected: 22 | FK/REFERENCES mentions: 52

CREATE TABLE DepartmentLevel (
  levelID INT PRIMARY KEY,
  level VARCHAR(255)
);

CREATE TABLE  HealthDepartment (
    departmentID VARCHAR(255),
    address TEXT,
    phone VARCHAR(25),
    levelID INT,
    PRIMARY KEY (departmentID),
    FOREIGN KEY (levelID) REFERENCES DepartmentLevel(levelID)
);

CREATE TABLE TriageAssociate (
  TAid VARCHAR(255),
  departmentID TEXT NOT NULL,
  PRIMARY KEY (TAid)
);

CREATE TABLE TestCenter (
    TCid VARCHAR(255),
    address TEXT,
    phone VARCHAR(25),
    PRIMARY KEY (TCid)
);

CREATE TABLE MobileTestingSites (
  TCid VARCHAR(255),
  startDate Date,
  endDate Date,
  community varchar(255),
  PRIMARY KEY(TCid),
  FOREIGN KEY(TCid)
      REFERENCES TestCenter(TCid)
);

CREATE TABLE CityRunTestingSite (
  TCid VARCHAR(255),
  cityName VARCHAR(255) NOT NULL,
  appointmentAvailable BOOLEAN NOT NULL,
  PRIMARY KEY (TCid),
  FOREIGN KEY (TCid) REFERENCES TestCenter (TCid)
);

CREATE TABLE SupportServiceProvider (
  SSPid VARCHAR(255) PRIMARY KEY,
  p_name varchar(255),
  affiliation Text,
  address Text,
  phone varchar(25)
);

CREATE TABLE MedicalProvider (
  MPid VARCHAR(255),
  affiliation varchar(255),
  address Text,
  phone varchar(25),
  PRIMARY KEY (MPid)
);

CREATE TABLE NeighborhoodTestSite (
  TCid VARCHAR(255),
  postCode int,
  PRIMARY KEY (TCid),
  FOREIGN KEY (TCid)
      REFERENCES TestCenter(TCid)
);

CREATE TABLE PatientInterviewer (
    PIid VARCHAR(255) PRIMARY KEY,
    departmentID VARCHAR(255),
    TAid VARCHAR(255),
    FOREIGN KEY (departmentID) REFERENCES HealthDepartment(departmentID),
    FOREIGN KEY (TAid) REFERENCES TriageAssociate(TAid)
);

CREATE TABLE Patient (
   patientID VARCHAR(255) PRIMARY KEY,
   identificationTime Date,
   symptomOnsetTime date,
   name VARCHAR(255),
   gender VARCHAR(255),
   age INT,
   phone varchar(25),
   interviewTime Date,
   PIid VARCHAR(255),
   FOREIGN KEY(PIid)
       REFERENCES PatientInterviewer (PIid)
       ON UPDATE RESTRICT ON DELETE CASCADE
);

CREATE TABLE Relationship (
  patientID VARCHAR(255),
  contactID VARCHAR(255),
  Primary KEY(patientID, contactID),
  FOREIGN KEY(patientID)
      REFERENCES Patient(patientID),
  FOREIGN KEY(contactID)
      REFERENCES Contact(contactID)
);

CREATE TABLE TestCenterReferral (
  CTid VARCHAR(255),
  TCid VARCHAR(255),
  Primary KEY(CTid, TCid),
  FOREIGN KEY(CTid)
      REFERENCES ContactTracer(CTid),
  FOREIGN KEY(TCid)
      REFERENCES TestCenter(TCid)
);

CREATE TABLE ContactTracer (
  CTid VARCHAR(255),
  Email TEXT NOT NULL UNIQUE,
  phone VARCHAR(25) NOT NULL,
  departmentID VARCHAR(255) NOT NULL,  
  PRIMARY KEY (CTid),
  FOREIGN KEY (departmentID) REFERENCES HealthDepartment (departmentID)
);

CREATE TABLE SupportServiceReferral (
  SSPid VARCHAR(255),
  CTid VARCHAR(255),
  PRIMARY KEY (SSPid, CTid),
  FOREIGN KEY (SSPid) REFERENCES SupportServiceProvider (SSPid),
  FOREIGN KEY (CTid) REFERENCES ContactTracer (CTid)
);

CREATE TABLE Contact (
  contactID VARCHAR(255),
  CTid VARCHAR(255),
  notificationTime DATE NOT NULL,
  contactTimeWithPatient DATE NOT NULL,
  name VARCHAR(255) NOT NULL,
  gender ENUM('Male', 'Female', 'Other'),
  age INT,
  phone VARCHAR(25) NOT NULL,
  testResults BOOLEAN NOT NULL,
  riskID INT,
  PRIMARY KEY (contactID),
  FOREIGN KEY (CTid) REFERENCES ContactTracer (CTid),
  FOREIGN KEY (riskID) REFERENCES Risk (riskID)
);

CREATE TABLE Risk (
  riskID INT NOT NULL,
  risk VARCHAR(255) NOT NULL,
  PRIMARY KEY (riskID)
);

CREATE TABLE SupportServiceCustomer (
  contactID VARCHAR(255),
  SSPid VARCHAR(255),
  PRIMARY KEY(contactID, SSPid),
  FOREIGN KEY (SSPid) REFERENCES SupportServiceProvider (SSPid),
  FOREIGN KEY (contactID) REFERENCES Contact (contactID)
);

CREATE TABLE MedicalReferral (
  CTid VARCHAR(255),
  MPid VARCHAR(255),
  PRIMARY KEY (CTid, MPid),
  FOREIGN KEY (CTid) REFERENCES ContactTracer (CTid),
  FOREIGN KEY (MPid) REFERENCES MedicalProvider (MPid)
);

CREATE TABLE ContactAssignment (
    TAid VARCHAR(255) NOT NULL,
    CTid VARCHAR(255) NOT NULL,
    PRIMARY KEY (TAid, CTid),
    FOREIGN KEY (TAid) REFERENCES TriageAssociate (TAid),
    FOREIGN KEY (CTid) REFERENCES ContactTracer (CTid)
);

CREATE TABLE TestForContact (
    contactID VARCHAR(255) NOT NULL,
    TCid VARCHAR(255) NOT NULL,
    PRIMARY KEY (contactID, TCid),
    FOREIGN KEY (contactID) REFERENCES Contact(contactID),
    FOREIGN KEY (TCid) REFERENCES TestCenter(TCid)
);

CREATE TABLE MedicalProvidePatient (
    contactID VARCHAR(255) NOT NULL,
    MPid VARCHAR(255) NOT NULL,
    PRIMARY KEY (contactID, MPid),
    FOREIGN KEY (contactID) REFERENCES Contact(contactID),
    FOREIGN KEY (MPid) REFERENCES MedicalProvider(MPid)
);

