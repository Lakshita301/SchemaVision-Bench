-- Source: https://github.com/chaseqi7/RealEst8/blob/805ac0b051807e6bef1695838b71a10af4b35a57/createDatabase.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE TargetProperty
(
    TargetPropertyID INT(10) NOT NULL PRIMARY KEY,
    PreferLocationAddress VARCHAR(50),
    PreferLocationCity VARCHAR(25),
    PreferLocationProvince VARCHAR(25),
    PreferLocationPostalCode VARCHAR(6),
    TargetPropertyType VARCHAR(25),
    SaleOrRent VARCHAR(25),
    LowerPriceLimit DOUBLE(10,2),
    UpperPriceLimit DOUBLE(10,2),
    ListedSince DATE,
    NumberOfBedrooms INT(10),
    NumberOfWashrooms INT(10),
    OpenHouseOnly BOOLEAN
);

CREATE TABLE User
(
    UserID INT(10) NOT NULL PRIMARY KEY,
    Email VARCHAR(50) NOT NULL,
    Password BINARY(50) NOT NULL,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Role VARCHAR(25) NOT NULL,
    Address VARCHAR(50),
    City VARCHAR(25),
    Province VARCHAR(25),
    PostalCode VARCHAR(6),
    PhoneNumber VARCHAR(10),
    TargerPropertyID INT(10) NOT NULL,
    CONSTRAINT targetPropertyFK
        FOREIGN KEY (TargerPropertyID)
        REFERENCES TargetProperty(TargetPropertyID)
);

CREATE TABLE Agent
(
    AgentID INT(10) NOT NULL PRIMARY KEY,
    YearOfExperience INT(3) NOT NULL,
    UserID INT(10) NOT NULL,
    CONSTRAINT userIDFK
        FOREIGN KEY (UserID)
        REFERENCES User(UserID)
);

