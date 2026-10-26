-- Source: https://github.com/Unversed/365-Database-Systems/blob/bd29175d333b2a876340c79e2bb19ee24bd1bd7e/M2Study/Courses1M2Study.sql?raw=true
-- Tables detected: 9 | FK constraints: 19

CREATE TABLE `Person` (
   `id` INT(11) NOT NULL AUTO_INCREMENT,
   `lastName` VARCHAR(15) DEFAULT NULL,
   `firstName` VARCHAR(15) DEFAULT NULL,
   `gender` CHAR(1) NOT NULL,
   `major` VARCHAR(30) DEFAULT NULL,
   `unitsCompleted` INT(11) DEFAULT NULL,
   `dept` VARCHAR(30) DEFAULT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `Term` (
   `id` INT(11) NOT NULL,
   `name` VARCHAR(10) NOT NULL,
   `startDate` DATE NOT NULL,
   `endDate` DATE NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `Section` (
   `id` INT(11) NOT NULL,
   `title` VARCHAR(20) NOT NULL,
   `number` VARCHAR(5) NOT NULL,
   `numUnits` INT(11) DEFAULT NULL,
   `dept` VARCHAR(30) DEFAULT NULL,
   `termId` INT(11) NOT NULL,
   PRIMARY KEY (`id`),
   CONSTRAINT `FKSection_termId` FOREIGN KEY (`termId`) 
      REFERENCES `Term` (`id`)
);

CREATE TABLE `Teaches` (
   `teacherId` INT(11) NOT NULL,
   `sectionId` INT(11) NOT NULL,
   PRIMARY KEY (`teacherId`,`sectionId`),
   CONSTRAINT `FKTeaches_teacherId` FOREIGN KEY (`teacherId`)
      REFERENCES `Person` (`id`),
   CONSTRAINT `FKTeaches_sectionId` FOREIGN KEY (`sectionId`)
      REFERENCES `Section` (`id`)
);

CREATE TABLE `Takes` (
   `studentId` INT(11) NOT NULL,
   `sectionId` INT(11) NOT NULL,
   PRIMARY KEY (`studentId`,`sectionId`),
   CONSTRAINT `FKTakes_studentId` FOREIGN KEY (`studentId`)
      REFERENCES `Person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `FKTakes_sectionId` FOREIGN KEY (`sectionId`) 
      REFERENCES `Section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Student (
id int primary key,
unitsCompleted INT(11),
major varchar(30) not null
);

CREATE TABLE Teacher (
id INT PRIMARY KEY,
dept varchar(30) not null
);

CREATE TABLE Department (
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30),
CONSTRAINT `UKname` UNIQUE(name)
);

CREATE TABLE Course (
   id INT AUTO_INCREMENT PRIMARY KEY,
   title varchar(20),
   number varchar(5), 
   numUnits INT,
   deptId INT,
   CONSTRAINT `UKnumber_deptId` UNIQUE(number, deptId),
   CONSTRAINT `FKCourse_deptId` FOREIGN KEY (`deptId`) 
      REFERENCES `Department`(`id`) ON DELETE SET NULL ON UPDATE CASCADE
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE Teaches DROP FOREIGN KEY FKTeaches_teacherId;

ALTER TABLE Takes DROP FOREIGN KEY FKTakes_studentId;

ALTER TABLE Student ADD CONSTRAINT FKStudent_id FOREIGN KEY(id)
REFERENCES Person(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Teacher ADD CONSTRAINT FKTeacher_id FOREIGN KEY(id)
REFERENCES Person(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Teaches ADD CONSTRAINT FKTeaches_teacherId FOREIGN KEY(teacherId)
REFERENCES Teacher(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Takes ADD CONSTRAINT FKTakes_studentId FOREIGN KEY(studentId)
REFERENCES Student(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Student 
DROP major,
ADD CONSTRAINT FKStudent_majorId
FOREIGN KEY (majorId)
REFERENCES Department(id) ON DELETE SET NULL;

ALTER TABLE Section
DROP dept,
ADD CONSTRAINT FKSection_deptId 
FOREIGN KEY (deptId)
REFERENCES Department(id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Teacher
DROP dept,
ADD CONSTRAINT FKTeacher_deptId 
FOREIGN KEY (deptId)
REFERENCES Department(id) ON DELETE SET NULL;

ALTER TABLE Section
DROP title,
DROP number,
DROP numUnits,
DROP FOREIGN KEY FKSection_deptId,
DROP deptId,
ADD CONSTRAINT FKSection_courseId 
FOREIGN KEY (courseId)
REFERENCES Course(id) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE Course
ADD COLUMN coordId INT NULL,
ADD CONSTRAINT FKCourse_coordId 
FOREIGN KEY (coordId)
REFERENCES Teacher(id) ON DELETE SET NULL;

ALTER TABLE Teaches DROP FOREIGN KEY FKTeaches_sectionId;

ALTER TABLE Teaches ADD CONSTRAINT FKTeaches_sectionId 
FOREIGN KEY (sectionId) 
REFERENCES Section(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Takes 
DROP FOREIGN KEY FKTakes_studentId;

ALTER TABLE Takes
ADD CONSTRAINT FKTakes_studentId 
FOREIGN KEY(studentId)
REFERENCES Person(id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Teaches 
DROP FOREIGN KEY FKTeaches_sectionId,
DROP FOREIGN KEY FKTeaches_teacherId;

ALTER TABLE Teaches
ADD CONSTRAINT FKTeaches_sectionId 
FOREIGN KEY(sectionId) 
REFERENCES Section(id), 
ADD CONSTRAINT FKTeaches_teacherId
FOREIGN KEY(teacherId)
REFERENCES Person(id);

ALTER TABLE Section
DROP FOREIGN KEY FKSection_courseId,
DROP courseId;

ALTER TABLE Course
DROP FOREIGN KEY FKCourse_coordId,
DROP FOREIGN KEY FKCourse_deptId;

