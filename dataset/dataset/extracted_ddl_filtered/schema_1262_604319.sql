-- Source: https://github.com/Unversed/365-Database-Systems/blob/bd29175d333b2a876340c79e2bb19ee24bd1bd7e/Course/CoursesSubB.sql?raw=true
-- Tables detected: 9 | FK constraints: 12

CREATE TABLE `Department` (
   `id` INT(11) NOT NULL,
   `name` VARCHAR(30) DEFAULT NULL,
   PRIMARY KEY (`id`),
   UNIQUE KEY `UKname` (`name`)
);

CREATE TABLE `Person` (
   `id` INT(11) NOT NULL AUTO_INCREMENT,
   `lastName` VARCHAR(15) DEFAULT NULL,
   `firstName` VARCHAR(15) DEFAULT NULL,
   `age` INT(11) DEFAULT NULL,
   `gender` CHAR(1) NOT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `Student` (
   `id` INT(11) NOT NULL,
   `majorId` INT(11) DEFAULT NULL,
   `unitsCompleted` INT(11) DEFAULT NULL,
   `gpa` DOUBLE DEFAULT NULL,
   PRIMARY KEY (`id`),
   CONSTRAINT `FKStudent_id` FOREIGN KEY (`id`)
      REFERENCES `Person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `FKStudent_majorId` FOREIGN KEY (`majorId`)
      REFERENCES `Department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE `Teacher` (
   `id` INT(11) NOT NULL,
   `deptId` INT(11) DEFAULT NULL,
   `difficultyRating` INT(11) NOT NULL DEFAULT '5',
   PRIMARY KEY (`id`),
   CONSTRAINT `FKTeacher_id` FOREIGN KEY (`id`)
      REFERENCES `Person` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `FKTeacher_deptId` FOREIGN KEY (`deptId`)
      REFERENCES `Department` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE `Course` (
   `id` INT(11) NOT NULL AUTO_INCREMENT,
   `title` VARCHAR(20) DEFAULT NULL,
   `number` VARCHAR(5) DEFAULT NULL,
   `numUnits` INT(11) DEFAULT NULL,
   `deptId` INT(11) DEFAULT NULL,
   `coordId` INT(11) DEFAULT NULL,
  `avgGrade` DOUBLE DEFAULT NULL,
   PRIMARY KEY (`id`),
   CONSTRAINT `FKCourse_deptId` FOREIGN KEY (`deptId`)
      REFERENCES `Department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `FKCourse_coordId` FOREIGN KEY (`coordId`)
      REFERENCES `Teacher` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE `Term` (
   `id` INT(11) NOT NULL,
   `name` VARCHAR(10) DEFAULT NULL,
   `startDate` DATE DEFAULT NULL,
   `endDate` DATE DEFAULT NULL,
   `numSections` INT(11) DEFAULT NULL,
   PRIMARY KEY (`id`)
);

CREATE TABLE `Section` (
   `id` INT(11) NOT NULL,
   `courseId` INT(11) DEFAULT NULL,
   `termId` INT(11) DEFAULT NULL,
   PRIMARY KEY (`id`),
   CONSTRAINT `FKSection_courseId` FOREIGN KEY (`courseId`)
      REFERENCES `Course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `FKSection_termId` FOREIGN KEY (`termId`) 
      REFERENCES `Term` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Teaches` (
   `teacherId` INT(11) NOT NULL,
   `sectionId` INT(11) NOT NULL,
   PRIMARY KEY (`teacherId`, `sectionId`),
   CONSTRAINT `FKTeaches_teacherId` FOREIGN KEY (`teacherId`)
      REFERENCES `Teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `FKTeaches_sectionId` FOREIGN KEY (`sectionId`)
      REFERENCES `Section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE `Takes` (
   `studentId` INT(11) NOT NULL,
   `sectionId` INT(11) NOT NULL,
   `grade` SMALLINT(6) DEFAULT NULL,
   PRIMARY KEY (`studentId`, `sectionId`),
   CONSTRAINT `FKTakes_studentId` FOREIGN KEY (`studentId`)
      REFERENCES `Student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
   CONSTRAINT `FKTakes_sectionId` FOREIGN KEY (`sectionId`) 
      REFERENCES `Section` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
);

