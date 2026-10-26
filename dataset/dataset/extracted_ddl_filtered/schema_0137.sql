-- Source: https://github.com/Nigafic/Shcherbakov_Artem_Java_Liga/blob/31a2f6ec158e082603a4c761ad0f16941a4a4cdc/Lessons/src/lesson5/uml/scratch.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 8

CREATE TABLE Subject
(
    Id   INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(25) not null
);

CREATE TABLE Teacher
(
    Id        INT AUTO_INCREMENT PRIMARY KEY,
    FIO       VARCHAR(30) not null,
    Age       INT         NOT NULL,
    Sex       VARCHAR(10) not null,
    SubjectId int         not null,
    FOREIGN KEY (SubjectId) REFERENCES Subject(Id) ON DELETE CASCADE
);

CREATE TABLE Pupil
(
    Id        INT AUTO_INCREMENT PRIMARY KEY,
    FIO       VARCHAR(30) not null,
    Age       INT         NOT NULL,
    Sex       VARCHAR(10) not null,
    SubjectId int         not null,
    FOREIGN KEY (SubjectId) REFERENCES Subject (Id) ON DELETE CASCADE
);

CREATE TABLE School
(
    Id        INT AUTO_INCREMENT PRIMARY KEY,
    Name      VARCHAR(30) not null,
    Address   VARCHAR(30) not null,
    PupilId   int         not null,
    TeacherId int         not null,
    FOREIGN KEY (PupilId) REFERENCES Pupil (Id) ON DELETE CASCADE,
    FOREIGN KEY (TeacherId) REFERENCES Teacher (Id) ON DELETE CASCADE
);

