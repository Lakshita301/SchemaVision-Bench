-- Source: https://github.com/IosifDobos/Databases/blob/a643abc4e99bb9ad2e96f43d10cf1b62eeeb74a5/Assignment%201%20Part%20III/C16735789-CAPart3-Week12.sql?raw=true
-- Tables detected: 9 | FK constraints: 10
--A product is shown to be a drug if this value is 1 and not a drug if this value is 0
--Default is Kevin as it says he is the one who normally does it
CREATE TABLE Role
(
    roleID NUMERIC(6) NOT NULL,
    roleName VARCHAR(50) NOT NULL,
    CONSTRAINT role_pk PRIMARY KEY (roleID)
);

CREATE TABLE Staff
(
    staffID NUMERIC(6) NOT NULL,
    staffName VARCHAR(50) NOT NULL,
    staffAddress VARCHAR(50) NOT NULL,
    staffPhoneNo VARCHAR(10) NOT NULL,
    staffEmail VARCHAR(50),
    staffPPS VARCHAR(9) NOT NULL,
    roleID NUMERIC(6) NOT NULL,
    CONSTRAINT staffEmail_chk CHECK (staffEmail Like '%@%'),
    CONSTRAINT staff_pk PRIMARY KEY (staffID),
    CONSTRAINT staff_role_fk FOREIGN KEY (roleID) REFERENCES Role (roleID)
);

CREATE TABLE Supplier
(
    supplierID NUMERIC(6) NOT NULL,
    supplierName VARCHAR(50) NOT NULL,
    supplierAddress VARCHAR(50) NOT NULL,
    supplierContactNo VARCHAR(10) NOT NULL,
    CONSTRAINT supplier_pk PRIMARY KEY (supplierID)
);

CREATE TABLE Product
(
    stockCode NUMERIC(6) NOT NULL,
    stockDescription VARCHAR(50) NOT NULL,
    costPrice NUMERIC(6,2) NOT NULL,
    retailPrice NUMERIC(6,2) NOT NULL,
    drugnondrug NUMERIC(1) DEFAULT 0,
    supplierID NUMERIC(6) NOT NULL,
    CONSTRAINT costPrice_chk CHECK (costPrice < 1000),
    CONSTRAINT product_pk PRIMARY KEY (stockCode),
    CONSTRAINT product_supplier_fk FOREIGN KEY (supplierID) REFERENCES Supplier (supplierID)
);

CREATE TABLE NonDrugSale
(
    ndsDate TIMESTAMP NOT NULL,
    staffID NUMERIC(6) NOT NULL,
    stockCode NUMERIC(6) NOT NULL,
    amountSold NUMERIC(3) NOT NULL,
    CONSTRAINT nonDrugSale_pk PRIMARY KEY (ndsDate,staffID,stockCode),
    CONSTRAINT nonDrugSale_staff_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID),
    CONSTRAINT nonDrugSale_product_fk FOREIGN KEY (stockCode) REFERENCES Product (stockCode)
);

CREATE TABLE Customer
(
    custID NUMERIC(6) NOT NULL,
    custName VARCHAR(50) NOT NULL,
    custAddress VARCHAR(50) NOT NULL,
    custPhone NUMERIC(10) NOT NULL,
    medCard NUMERIC(8) NULL,
    CONSTRAINT customer_pk PRIMARY KEY (custID)
);

CREATE TABLE Doctor
(
    docID NUMERIC(6) NOT NULL,
    docName VARCHAR(50) NOT NULL,
    surgName VARCHAR(50) NOT NULL,
    surgAddress VARCHAR(50) NOT NULL,
    CONSTRAINT doctor_pk PRIMARY KEY (docID)
);

CREATE TABLE Prescription
(
    prescriptionID NUMERIC(6) NOT NULL,
    custID NUMERIC(6) NOT NULL,
    docID NUMERIC(6) NOT NULL,
    staffID NUMERIC(6) DEFAULT 2,
    CONSTRAINT prescription_pk PRIMARY KEY (prescriptionID),
    CONSTRAINT prescription_customer_fk FOREIGN KEY (custID) REFERENCES Customer (custID),
    CONSTRAINT prescription_doctor_fk FOREIGN KEY (docID) REFERENCES Doctor (docID),
    CONSTRAINT prescription_staff_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID)
);

CREATE TABLE PrescriptionItem
(
    prescriptionID NUMERIC(6) NOT NULL,
    stockCode NUMERIC(6) NOT NULL,
    staffID NUMERIC(6),
    preDosage NUMERIC(6,2) NOT NULL,
    preInstructions VARCHAR(100) NOT NULL,
    CONSTRAINT prescriptionItem_pk PRIMARY KEY (prescriptionID,stockCode),
    CONSTRAINT preItem_staff_fk FOREIGN KEY (staffID) REFERENCES Staff (staffID),
    CONSTRAINT preItem_prescription_fk FOREIGN KEY (prescriptionID) REFERENCES Prescription (prescriptionID),
    CONSTRAINT preItem_product_fk FOREIGN KEY (stockCode) REFERENCES Product (stockCode)
);
