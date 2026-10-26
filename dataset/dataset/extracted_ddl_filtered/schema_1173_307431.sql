-- Source: https://github.com/IosifDobos/Databases/blob/a643abc4e99bb9ad2e96f43d10cf1b62eeeb74a5/Assignment%201%20Part%20III/C16735789-CAPart3-Week12.sql?raw=true
-- Tables detected: 9 | FK constraints: 10

CREATE TABLE Role
(
roleID NUMBER(6) NOT NULL ,
roleName VARCHAR2(50) NOT NULL ,

CONSTRAINT role_pk PRIMARY KEY (roleID)
);

CREATE TABLE Staff
(
staffID NUMBER(6) NOT NULL ,

staffName VARCHAR2(50) NOT NULL ,
staffAddress VARCHAR2(50) NOT NULL ,
staffPhoneNo VARCHAR2(10) NOT NULL ,
staffEmail VARCHAR2(50) ,
staffPPS VARCHAR2(9) NOT NULL ,
roleID NUMBER(6) NOT NULL ,

CONSTRAINT staffEmail_chk CHECK (staffEmail Like '%@%'),
CONSTRAINT staff_pk PRIMARY KEY (staffID),
CONSTRAINT staff_role_fk FOREIGN KEY (roleID) REFERENCES Role (roleID)
);

CREATE TABLE Supplier
(
supplierID NUMBER(6) NOT NULL ,
supplierName VARCHAR2(50) NOT NULL ,
supplierAddress VARCHAR2(50) NOT NULL ,
supplierContactNo VARCHAR2(10) NOT NULL ,

CONSTRAINT supplier_pk PRIMARY KEY (supplierID)
);

CREATE TABLE Product
(
stockCode NUMBER(6) NOT NULL ,
stockDescription VARCHAR2(50) NOT NULL ,
costPrice NUMBER(6,2) NOT NULL ,
retailPrice NUMBER(6,2) NOT NULL ,
drugnondrug NUMBER(1) DEFAULT 0,--A product is shown to be a drug if this value is 1 and not a drug if this value is 0
supplierID NUMBER(6) NOT NULL ,
CONSTRAINT costPrice_chk CHECK (costPrice < 1000),
CONSTRAINT product_pk PRIMARY KEY (stockCode),
CONSTRAINT product_supplier_fk FOREIGN KEY (supplierID) REFERENCES Supplier (supplierID)
);

CREATE TABLE NonDrugSale
(
ndsDate TIMESTAMP NOT NULL ,
staffID NUMBER(6) NOT NULL ,
stockCode NUMBER(6) NOT NULL ,
amountSold NUMBER(3) NOT NULL ,

CONSTRAINT nonDrugSale_pk PRIMARY KEY (ndsDate,staffID,stockCode),
CONSTRAINT nonDrugSale_staff_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID),
CONSTRAINT nonDrugSale_product_fk FOREIGN KEY (stockCode) REFERENCES Product (stockCode)
);

CREATE TABLE Customer
(
custID NUMBER(6) NOT NULL ,
custName VARCHAR2(50) NOT NULL ,
custAddress VARCHAR2(50) NOT NULL ,
custPhone NUMBER(10) NOT NULL ,
medCard NUMBER(8) NULL ,

CONSTRAINT customer_pk PRIMARY KEY (custID)
);

CREATE TABLE Doctor
(
docID NUMBER(6) NOT NULL ,
docName VARCHAR2(50) NOT NULL ,
surgName VARCHAR2(50) NOT NULL ,
surgAddress VARCHAR2(50) NOT NULL ,

CONSTRAINT doctor_pk PRIMARY KEY (docID)
);

CREATE TABLE Prescription
(
prescriptionID NUMBER(6) NOT NULL ,
custID NUMBER(6) NOT NULL ,
docID NUMBER(6) NOT NULL ,
staffID NUMBER(6) DEFAULT 2 ,--Default is Kevin as it says he is the one who normally does it

CONSTRAINT prescription_pk PRIMARY KEY (prescriptionID),
CONSTRAINT prescription_customer_fk FOREIGN KEY (custID) REFERENCES Customer (custID),
CONSTRAINT prescription_doctor_fk FOREIGN KEY (docID) REFERENCES Doctor (docID),
CONSTRAINT prescription_staff_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID)
);

CREATE TABLE PrescriptionItem
(
prescriptionID NUMBER(6) NOT NULL ,
stockCode NUMBER(6) NOT NULL ,
staffID NUMBER(6),
preDosage NUMBER(6,2) NOT NULL ,
preInstructions VARCHAR2(100) NOT NULL ,

CONSTRAINT prescriptionItem_pk PRIMARY KEY (prescriptionID,stockCode),
CONSTRAINT preItem_staff_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID),
CONSTRAINT preItem_prescription_fk FOREIGN KEY (prescriptionID) REFERENCES Prescription (prescriptionID),
CONSTRAINT preItem_product_fk FOREIGN KEY (stockCode) REFERENCES Product (stockCode)
);

