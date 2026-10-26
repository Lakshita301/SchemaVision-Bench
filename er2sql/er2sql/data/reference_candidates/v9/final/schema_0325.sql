-- Source: https://github.com/abduljalashraf/EECS484/blob/bee2e9dda60f65b5a6d0d6e5ee9fcd827d1301cd/484_HW2/Booktown/BuildBooktown.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 8

CREATE TABLE Authors(
    Author_ID INTEGER PRIMARY KEY,
    Last_Name VARCHAR(20) NOT NULL,
    First_Name VARCHAR(20) NOT NULL
);

CREATE TABLE Publishers(
    Publisher_ID INTEGER PRIMARY KEY,
    Name VARCHAR(50) UNIQUE NOT NULL,
    City VARCHAR(20) NOT NULL
);

CREATE TABLE Subjects(
    Subject_ID INTEGER PRIMARY KEY,
    Subject VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE Books(
    Book_ID INTEGER PRIMARY KEY,
    Title VARCHAR(45) UNIQUE NOT NULL,
    Author_ID INTEGER NOT NULL,
    Subject_ID INTEGER NOT NULL,
    FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID),
    FOREIGN KEY (Subject_ID) REFERENCES Subjects(Subject_ID)
);

CREATE TABLE Editions(
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_ID INTEGER NOT NULL,
    Edition INTEGER NOT NULL,
    Publisher_ID INTEGER NOT NULL,
    Publication_Date VARCHAR(10) NOT NULL,
    Pages INTEGER NOT NULL,
    CoverType CHARACTER(1) NOT NULL,
    UNIQUE(Book_ID, Edition),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES Publishers(Publisher_ID),
    CHECK (Edition > 0),
    CHECK (Pages > 0),
    CHECK (CoverType = 'H' OR
           CoverType = 'P')
);

