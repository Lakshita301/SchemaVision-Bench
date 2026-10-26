-- Source: https://github.com/Qing-bot/project/blob/2891f67266d5b366ace55df3a149301669c5d306/Query%20DDL.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 14

CREATE TABLE [User] (
    UserID char(6) NOT NULL CHECK (UserID LIKE'USR[0-9][0-9][0-9]'), 
    NickName varchar(255) NOT NULL CHECK (LEN(NickName)>5) , 
    FullName varchar(255) NOT NULL, 
    Email varchar(255) NULL CHECK (Email LIKE'%@%'), 
    City varchar(255) NULL, 
    [Description] varchar(255) NULL, 
    PRIMARY KEY (UserID));

CREATE TABLE Director (
    DirectorID char(6) NOT NULL CHECK (DirectorID LIKE 'DIR[0-9][0-9][0-9]'), 
    [Name] varchar(255) NOT NULL,
    Email varchar(255) NOT NULL CHECK (Email LIKE '%@%'), 
    City varchar(255) NULL, 
    [Address] varchar(255) NULL, 
    PhoneNumber VARCHAR(255) NULL, 
    PRIMARY KEY (DirectorID));

CREATE TABLE [Movie Genre] (
    GenreID char(6) NOT NULL CHECK (GenreID like 'GEN[0-9][0-9][0-9]'), 
    [Name] varchar(255) NOT NULL, 
    PRIMARY KEY (GenreID));

CREATE TABLE Publisher (
    PublisherID char(6) NOT NULL CHECK (PublisherID LIKE'PUB[0-9][0-9][0-9]'), 
    [Name] varchar(255) NOT NULL, 
    Email varchar(255) NOT NULL CHECK (Email like '%@%'), 
    City varchar(255) NULL, 
    [Address] varchar(255) NULL CHECK (LEN([Address])>15), 
    PhoneNumber varchar(255) NULL, 
    PRIMARY KEY (PublisherID));

CREATE TABLE Movie (
    MovieID char(6) NOT NULL CHECK (MovieID LIKE 'MOV[0-9][0-9][0-9]'), 
    Director char(6) NOT NULL CHECK (Director LIKE 'DIR[0-9][0-9][0-9]'), 
    Publisher char(6) NOT NULL CHECK (Publisher LIKE 'PUB[0-9][0-9][0-9]'), 
    Title varchar(255) NOT NULL, 
    [Description] varchar(255) NOT NULL CHECK (LEN([Description])>20), 
    ReleaseDate datetime NOT NULL CHECK(year(ReleaseDate) BETWEEN 2000 AND 2016), 
    Price numeric(19, 0) NULL,
    PRIMARY KEY (MovieID));

CREATE TABLE [Movie Genre Details] (
    MovieID char(6) NOT NULL CHECK (MovieID LIKE 'MOV[0-9][0-9][0-9]'), 
    GenreID char(6) NOT NULL CHECK (GenreID LIKE 'GEN[0-9][0-9][0-9]'), 
    PRIMARY KEY (MovieID, GenreID));

CREATE TABLE Review (
    UserID char(6) NOT NULL CHECK (UserID LIKE 'USR[0-9][0-9][0-9]'), 
    MovieID char(6) NOT NULL CHECK (MovieID LIKE 'MOV[0-9][0-9][0-9]'), 
    [Recommendation status] varchar(255) NOT NULL CHECK([Recommendation status] = 'Recommended' or [Recommendation status] = 'Not Recommended') , 
    [Review content] varchar(255) NOT NULL CHECK(len([Review content])>20), 
    [Date] datetime NOT NULL, 
    PRIMARY KEY (UserID, MovieID));

CREATE TABLE [Sales Transaction Details] (
    SalesID char(6) NOT NULL CHECK (SalesID LIKE 'SAL[0-9][0-9][0-9]'), 
    UserID char(6) NOT NULL CHECK (UserID LIKE 'USR[0-9][0-9][0-9]'), 
    MovieID char(6) NOT NULL CHECK (MovieID LIKE 'MOV[0-9][0-9][0-9]'), 
    Quantity int NOT NULL, 
    [Transaction Date] datetime NOT NULL, 
    PRIMARY KEY (SalesID, UserID, MovieID));

CREATE TABLE [Sales Transaction Header] (
    SalesID char(6) NOT NULL CHECK (SalesID LIKE 'SAL[0-9][0-9][0-9]'), 
    UserID char(6) NOT NULL CHECK (UserID LIKE 'USR[0-9][0-9][0-9]'), 
    TransactionDate datetime NOT NULL, 
    PRIMARY KEY (SalesID, UserID));

-- Foreign keys added via ALTER TABLE:
ALTER TABLE Movie ADD CONSTRAINT FKMovie918511 
FOREIGN KEY (Publisher) REFERENCES Publisher (PublisherID);

ALTER TABLE Movie ADD CONSTRAINT FKMovie958517 
FOREIGN KEY (Director) REFERENCES Director (DirectorID);

ALTER TABLE [Sales Transaction Header] ADD CONSTRAINT [FKSales Tran494172] 
FOREIGN KEY (UserID) REFERENCES [User] (UserID);

ALTER TABLE [Movie Genre Details] ADD CONSTRAINT [FKMovie Genr649817] 
FOREIGN KEY (GenreID) REFERENCES [Movie Genre] (GenreID);

ALTER TABLE [Movie Genre Details] ADD CONSTRAINT [FKMovie Genr3883] 
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID);

ALTER TABLE Review ADD CONSTRAINT FKReview197106 
FOREIGN KEY (UserID) REFERENCES [User] (UserID);

ALTER TABLE Review ADD CONSTRAINT FKReview223904 
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID);

ALTER TABLE [Sales Transaction Details] ADD CONSTRAINT [FKSales Tran549533] 
FOREIGN KEY (SalesID, UserID) 
REFERENCES [Sales Transaction Header] (SalesID, UserID);

ALTER TABLE [Sales Transaction Details] ADD CONSTRAINT [FKSales Tran394944] 
FOREIGN KEY (MovieID) REFERENCES Movie (MovieID);

