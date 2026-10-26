-- Source: https://github.com/qyyao/GoA_database/blob/b8c458b073ec702fcc7f4e7508a2bd567c14ef26/goa.sql?raw=true
-- Tables detected: 17 | FK constraints: 20
CREATE TABLE Challenge (
    ChallengeID INT NOT NULL UNIQUE,
    BadgeID INT,
    LessonID INT,
    PRIMARY KEY	(ChallengeID)
);
CREATE TABLE Question (
    ChallengeID INT NOT NULL,
    QuestionID INT NOT NULL,
    Answer VARCHAR(200),
    fakeAnswer1 VARCHAR(200),
    FakeAnswer2 VARCHAR(200),
    FakeAnswer3 VARCHAR(200),
    Text text,
    PRIMARY KEY (QuestionID)
);
CREATE TABLE Assignment (
    AssignmentID INT NOT NULL UNIQUE,
    LessonID INT,
    Format VARCHAR(200),
    Description TEXT,
    DueTime TIME,
    PRIMARY KEY (AssignmentID)
);
CREATE TABLE AnonymousSuggestions (
    SuggestionID INT NOT NULL UNIQUE,
    Device VARCHAR(100),
    Text TEXT,
    PRIMARY KEY (SuggestionID)
);
CREATE TABLE AssignmentCompletes(
    AssignmentID INT NOT NULL,
    UserID INT NOT NULL,
    CompletionStatus VARCHAR(100),
    PRIMARY KEY (AssignmentID, UserID)
);
CREATE TABLE ChallengeCompletes (
    ChallengeID INT NOT NULL,
    UserID INT NOT NULL,
    Mark INT,
    Progress VARCHAR(100),
    PRIMARY KEY(ChallengeID, UserID)
);
CREATE TABLE LessonIsIn (
    LessonID INT NOT NULL,
    CohortID INT NOT NULL,
    PRIMARY KEY(LessonID, CohortID)
);
CREATE TABLE Earned (
    UserID INT NOT NULL,
    BadgeID INT NOT NULL,
    PRIMARY KEY (UserID, BadgeID)
);
CREATE TABLE Team (
    TeamID INT NOT NULL UNIQUE,
    Name VARCHAR(100) NOT NULL,
    TeamVideos VARCHAR(100),
    VotesReceived INT,
    PRIMARY KEY(TeamID)
);
CREATE TABLE Cohort (
    CohortID INT NOT NULL UNIQUE,
    ProgressDate Date,
    PRIMARY KEY(CohortID)
);
CREATE TABLE goaEvent(
    EventID INT NOT NULL UNIQUE,
    Description TEXT,
    Date DATE,
    Location VARCHAR(100),
    CohortID INT,
    PRIMARY KEY(EventID)
);
CREATE TABLE Badge (
    BadgeID INT 	NOT NULL UNIQUE,
    Ordinal VARCHAR(10),
    Name VARCHAR(100),
    NotEarnedURL TEXT,
    EarnedURL TEXT,
    Description TEXT,
    CourseID INT	NOT NULL,
    PRIMARY KEY	(BadgeID)
);
CREATE TABLE goaUser(
    UserID INT 	NOT NULL UNIQUE,
    FirstName VARCHAR(50),
    MiddleInitial VARCHAR(50),
    LastName VARCHAR(50),
    School VARCHAR(50),
    ImageURL TEXT,
    Email VARCHAR(100),
    UserType VARCHAR(50),
    TeamID INT	NOT NULL,
    CohortID INT	NOT NULL,
    Password VARCHAR(15),
    PRIMARY KEY	(UserID)
);
CREATE TABLE Resources(
    ResourceID INT NOT NULL UNIQUE,
    URL TEXT,
    Description TEXT,
    LessonID INT,
    PRIMARY KEY(ResourceID)
);
CREATE TABLE Lesson(
    LessonID INT NOT NULL UNIQUE,
    Type VARCHAR(50),
    Description TEXT,
    weekNumber INT,
    Title VARCHAR(50),
    startDate DATE,
    endDate DATE,
    slidesURL TEXT,
    CourseID INT,
    PRIMARY KEY(LessonID)
);
CREATE TABLE Course(
    CourseID INT NOT NULL UNIQUE,
    Name VARCHAR(50),
    PRIMARY KEY(CourseID)
);
CREATE TABLE CanadianLocations(
    Location VARCHAR(100)
);
ALTER TABLE Earned ADD FOREIGN KEY (UserID)  REFERENCES goaUser (UserID) ON DELETE CASCADE;
ALTER TABLE goaUser ADD FOREIGN KEY (TeamID)  REFERENCES Team(TeamID);
ALTER TABLE Challenge ADD FOREIGN KEY (BadgeID)  REFERENCES Badge (BadgeID);
ALTER TABLE AssignmentCompletes ADD FOREIGN KEY (UserID)  REFERENCES goaUser(UserID) ON DELETE CASCADE;
ALTER TABLE ChallengeCompletes ADD FOREIGN KEY (UserID)  REFERENCES goaUser(UserID) ON DELETE CASCADE;
ALTER TABLE LessonIsIn ADD FOREIGN KEY (CohortID)  REFERENCES Cohort (CohortID);
ALTER TABLE Earned ADD FOREIGN KEY (UserID)  REFERENCES goaUser (UserID) ON DELETE CASCADE;
ALTER TABLE Earned ADD FOREIGN KEY (BadgeID)  REFERENCES Badge (BadgeID);
ALTER TABLE Challenge ADD FOREIGN KEY (LessonID)  REFERENCES Lesson (LessonID);
ALTER TABLE Question ADD FOREIGN KEY (ChallengeID)  REFERENCES Challenge(ChallengeID);
ALTER TABLE Assignment ADD FOREIGN KEY (LessonID)  REFERENCES Lesson (LessonID);
ALTER TABLE AssignmentCompletes ADD FOREIGN KEY (AssignmentID) REFERENCES Assignment(AssignmentID);
ALTER TABLE ChallengeCompletes ADD FOREIGN KEY (ChallengeID)  REFERENCES Challenge (ChallengeID);
ALTER TABLE LessonIsIn ADD FOREIGN KEY (LessonID)  REFERENCES Lesson (LessonID);
ALTER TABLE Earned ADD FOREIGN KEY (BadgeID)  REFERENCES Badge (BadgeID);
ALTER TABLE goaEvent ADD FOREIGN KEY (CohortID)  REFERENCES Cohort(CohortID);
ALTER TABLE Badge ADD FOREIGN KEY (CourseID)  REFERENCES Course(CourseID);
ALTER TABLE goaUser ADD FOREIGN KEY (CohortID)  REFERENCES Cohort(CohortID);
ALTER TABLE Resources ADD FOREIGN KEY (LessonID)  REFERENCES Lesson (LessonID);
ALTER TABLE Lesson ADD FOREIGN KEY (CourseID)  REFERENCES Course (CourseID);
