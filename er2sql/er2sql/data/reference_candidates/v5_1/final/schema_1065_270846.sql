-- Source: https://github.com/kffl/triss-server/blob/fd6f0f6ac620cade943082cf0e7cf913e47a9464/triss-core/src/main/resources/db/prepareTestData.sql?raw=true
-- Tables detected: 16 | FK constraints: 20
--     Employee Info
--  Document Info
CREATE TABLE Status
(
    id BIGINT PRIMARY KEY,
    namePl varchar(255) UNIQUE NOT NULL,
    nameEng varchar(255) UNIQUE NOT NULL
);

CREATE TABLE Vehicle
(
    id BIGSERIAL PRIMARY KEY,
    namePl varchar(255) UNIQUE NOT NULL,
    nameEng varchar(255) UNIQUE NOT NULL
);

CREATE TABLE PaymentType
(
    id BIGSERIAL PRIMARY KEY,
    namePl varchar(255) UNIQUE NOT NULL,
    nameEng varchar(255) UNIQUE NOT NULL
);

CREATE TABLE DocumentType
(
    id BIGSERIAL PRIMARY KEY,
    namePl varchar(255) UNIQUE NOT NULL,
    nameEng varchar(255) UNIQUE NOT NULL
);

CREATE TABLE Institute
(
    id BIGSERIAL PRIMARY KEY,
    name varchar(255) UNIQUE NOT NULL,
    active boolean default True
);

CREATE TABLE Place
(
    id BIGSERIAL PRIMARY KEY,
    city VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    UNIQUE (city, country)
);

CREATE TABLE PrepaymentFee
(
    id BIGSERIAL PRIMARY KEY,
    amount DECIMAL(7, 2) NOT NULL,
    paymentType BIGINT        NOT NULL,
    CONSTRAINT paymentType_pf_fk FOREIGN KEY (paymentType) REFERENCES PaymentType (id)
);

CREATE TABLE Prepayment
(
    id BIGSERIAL PRIMARY KEY,
    conferenceFeeId BIGINT,
    accommodationFeeId BIGINT,
    CONSTRAINT conferenceFee_pr_fk FOREIGN KEY (conferenceFeeId) REFERENCES PrepaymentFee (id),
    CONSTRAINT accommodationFee_pr_fk FOREIGN KEY (accommodationFeeId) REFERENCES PrepaymentFee (id)
);

CREATE TABLE Employee
(
    id BIGSERIAL PRIMARY KEY,
    employeeId BIGINT UNIQUE,
    firstName varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,
    birthDate DATE,
    academicDegree varchar(255),
    phoneNumber varchar(255),
    employeeType varchar(255),
    instituteID BIGINT,
    CONSTRAINT institute_em_fk FOREIGN KEY (instituteID) REFERENCES Institute (id)
);

CREATE TABLE IdentityDocument
(
    id BIGSERIAL PRIMARY KEY,
    employeeID BIGINT       NOT NULL,
    type BIGINT       NOT NULL,
    number VARCHAR(255) NOT NULL,
    CONSTRAINT employee_id_fk FOREIGN KEY (employeeID) REFERENCES Employee (employeeId),
    CONSTRAINT documentType_id_fk FOREIGN KEY (type) REFERENCES DocumentType (id)
);

CREATE TABLE FinancialSource
(
    id BIGSERIAL PRIMARY KEY,
    allocationAccount VARCHAR(255),
    MPK VARCHAR(255),
    financialSourceValue VARCHAR(255),
    project VARCHAR(255)
);

CREATE TABLE AdvanceApplication
(
    id BIGSERIAL PRIMARY KEY,
    placeId BIGINT        NOT NULL,
    startDate DATE          NOT NULL,
    endDate DATE          NOT NULL,
    residenceDietQuantity INTEGER       NOT NULL,
    residenceDietAmount DECIMAL(7, 2) NOT NULL,
    accommodationQuantity INTEGER       NOT NULL,
    accommodationLimit DECIMAL(7, 2) NOT NULL,
    travelDietAmount DECIMAL(7, 2) NOT NULL,
    travelCosts DECIMAL(7, 2) NOT NULL,
    otherCostsDescription VARCHAR(255),
    otherCostsAmount DECIMAL(7, 2),
    residenceDietSum DECIMAL(7, 2) NOT NULL,
    accommodationSum DECIMAL(7, 2) NOT NULL,
    advanceSum DECIMAL(7, 2) NOT NULL,
    CONSTRAINT place_aa_fk FOREIGN KEY (placeId) REFERENCES Place (id)
);

CREATE TABLE Application
(
    id BIGSERIAL PRIMARY KEY,
    firstName varchar(255) NOT NULL,
    surname varchar(255) NOT NULL,
    birthDate DATE         NOT NULL,
    academicDegree varchar(255) NOT NULL,
    phoneNumber varchar(255) NOT NULL,
    employeeId BIGINT       NOT NULL,
    identityDocumentType BIGINT       NOT NULL,
    identityDocumentNumber VARCHAR(255) NOT NULL,
    createdOn DATE         NOT NULL,
    placeId BIGINT       NOT NULL,
    instituteId BIGINT       NOT NULL,
    abroadStartDate DATE         NOT NULL,
    abroadEndDate DATE         NOT NULL,
    purpose VARCHAR(255) NOT NULL,
    conference VARCHAR(255) NOT NULL,
    subject VARCHAR(255) NOT NULL,
    conferenceStartDate DATE         NOT NULL,
    conferenceEndDate DATE         NOT NULL,
    financialSourceId BIGINT,
    abroadStartDateInsurance DATE,
    abroadEndDateInsurance DATE,
    selfInsured BOOL         NOT NULL,
    advanceApplicationId BIGINT       NOT NULL,
    prepaymentId BIGINT       NOT NULL,
    comments VARCHAR(255),
    wildaComments VARCHAR(255),
    directorComments VARCHAR(255),
    rectorComments VARCHAR(255),
    status BIGINT       NOT NULL,
    CONSTRAINT institute_ap_fk FOREIGN KEY (instituteId) REFERENCES Institute (id),
    CONSTRAINT employee_ap_fk FOREIGN KEY (employeeId) REFERENCES Employee (employeeId),
    CONSTRAINT place_ap_fk FOREIGN KEY (placeId) REFERENCES Place (id),
    CONSTRAINT financialSource_ap_fk FOREIGN KEY (financialSourceId) REFERENCES FinancialSource (id),
    CONSTRAINT advanceApplication_ap_fk FOREIGN KEY (advanceApplicationId) REFERENCES AdvanceApplication (id),
    CONSTRAINT prepayment_ap_fk FOREIGN KEY (prepaymentId) REFERENCES Prepayment (id),
    CONSTRAINT documentType_ap_fk FOREIGN KEY (identityDocumentType) REFERENCES DocumentType (id),
    CONSTRAINT status_ap_fk FOREIGN KEY (status) REFERENCES Status (id)
);

CREATE TABLE Transport
(
    id BIGSERIAL PRIMARY KEY,
    applicationID BIGINT       NOT NULL,
    destinationFrom VARCHAR(255) NOT NULL,
    destinationTo VARCHAR(255) NOT NULL,
    departureDay DATE         NOT NULL,
    departureHour INTEGER      NOT NULL,
    departureMinute INTEGER      NOT NULL,
    carrier VARCHAR(255) NOT NULL,
    vehicleSelect BIGINT       NOT NULL,
    CONSTRAINT application_tr_fk FOREIGN KEY (applicationID) REFERENCES Application (id),
    CONSTRAINT vehicle_tr_fk FOREIGN KEY (vehicleSelect) REFERENCES Vehicle (id)
);

CREATE TABLE SettlementApplication
(
    id BIGSERIAL PRIMARY KEY,
    applicationId BIGINT NOT NULL,
    creatorId BIGINT NOT NULL,
    status BIGINT NOT NULL,
    lastModifiedDate Date   NOT NULL,
    wildaComments varchar(255),
    CONSTRAINT application_sa_fk FOREIGN KEY (applicationId) REFERENCES Application (id),
    CONSTRAINT status_sa_fk FOREIGN KEY (status) REFERENCES Status (id)
);

CREATE TABLE SettlementElement
(
    id BIGSERIAL PRIMARY KEY,
    settlementApplicationId BIGINT        NOT NULL,
    documentNumber VARCHAR(255)  NOT NULL,
    value DECIMAL(7, 2) NOT NULL,
    comment VARCHAR(255)  NOT NULL,
    scanLoc VARCHAR(255),
    CONSTRAINT SettlementApplication_se_fk FOREIGN KEY (settlementApplicationId) REFERENCES SettlementApplication (id)
);
