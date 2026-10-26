-- Source: https://github.com/joshmeidl/VirtualSal/blob/b2ed7a34d74d0cbd57cce7684dc5d84b98ba5cb6/src/Backend/Database/database.sql?raw=true
-- Tables detected: 6 | FK constraints: 5

CREATE TABLE UserRegistry
(
    userID INT(5) PRIMARY KEY NOT NULL
        IDENTITY(1,1),
    fName VARCHAR
    (20) NOT NULL,
    lName VARCHAR
    (20) NULL,
    username VARCHAR
    (20) NOT NULL UNIQUE,
    email VARCHAR
    (40) NOT NULL UNIQUE,
    pw VARCHAR
    (20) NOT NULL
);

CREATE TABLE Schedule
(
    userID INT(5) NOT NULL,
    semester VARCHAR(6) NOT NULL,
    term INT(5) NOT NULL,
    courseName VARCHAR(30) NOT NULL,
    professorName VARCHAR(30) NOT NULL,
    sectionNumber INT(5) NOT NULL,
    FOREIGN KEY (userID) REFERENCES UserRegistry(userID)
);

CREATE TABLE CourseRegistry
(
    courseName VARCHAR(30) NOT NULL,
    courseDescription VARCHAR(150) NULL,
    semester VARCHAR(6) NOT NULL,
    term INT(5) NOT NULL,
    professorName VARCHAR(30) NOT NULL,
    sectionNumber INT(5) NOT NULL
);

CREATE TABLE Question
(
    creationDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    courseName VARCHAR(30) NOT NULL,
    posterID INT(5) NOT NULL,
    questionID INT(5) PRIMARY KEY IDENTITY(1,1),
    questionTitle VARCHAR(50) NOT NULL,
    questionBody VARCHAR(200) NULL,
    FOREIGN KEY (posterID) REFERENCES UserRegistry(userID)

);

CREATE TABLE Answer
(
    answerID INT(5) PRIMARY KEY IDENTITY(1,1),
    questionID INT
        (5) NOT NULL,
    userID INT
        (5) NOT NULL,
    answerBody VARCHAR
        (200) NULL,
    upvotes INT
        (5) NULL,
    downvotes INT
        (5) NULL,
    FOREIGN KEY
        (userID) REFERENCES UserRegistry
        (userID),
    FOREIGN KEY
        (questionID) REFERENCES Question
        (questionID)
);

CREATE TABLE Review
(
    posterID INT(5) NOT NULL,
    courseName VARCHAR(100) NOT NULL,
    professor VARCHAR(50) NOT NULL,
    workloadVal INT(5) NOT NULL,
    clarity INT(5) NOT NULL,
    comment VARCHAR(200) NULL,
    FOREIGN KEY (posterID) REFERENCES UserRegistry(userID)
);

