-- Source: https://github.com/RasulaMakbul/IRASV5Summer2021Group3/blob/c9066b93d70fca0d2d984a647d64619d105a9808/spmv3.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 5

CREATE TABLE `tblassessment` (
  `sl` int(11) NOT NULL,
  `assessmentID` varchar(100) NOT NULL,
  `assessmentType` varchar(100) NOT NULL,
  `MarksObtained` varchar(100) NOT NULL,
  `courseID` varchar(100) NOT NULL,
  `studentID` varchar(100) NOT NULL,
  `coID` varchar(100) NOT NULL,
  `sectionNo` varchar(100) NOT NULL,
  `semester` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblco` (
  `sl` int(11) NOT NULL,
  `courseID` varchar(100) NOT NULL,
  `ploID` int(11) NOT NULL,
  `co1` tinyint(1) NOT NULL,
  `co2` tinyint(1) NOT NULL,
  `co3` tinyint(1) NOT NULL,
  `co4` tinyint(1) NOT NULL,
  `co5` tinyint(1) NOT NULL,
  `co6` tinyint(1) NOT NULL,
  `co7` tinyint(1) NOT NULL,
  `co8` tinyint(1) NOT NULL,
  `co9` tinyint(1) NOT NULL,
  `co10` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblcourse` (
  `sl` int(11) NOT NULL,
  `courseID` varchar(100) NOT NULL,
  `courseTitle` varchar(250) NOT NULL,
  `credit` double NOT NULL,
  `totalCO` int(11) NOT NULL,
  `programID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbldepartment` (
  `sl` int(11) NOT NULL,
  `departmentID` varchar(100) NOT NULL,
  `departmentName` varchar(200) NOT NULL,
  `schoolID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblenrollment` (
  `sl` int(11) NOT NULL,
  `enrollmentID` varchar(100) NOT NULL,
  `enrollmentYear` varchar(100) NOT NULL,
  `studentID` varchar(100) NOT NULL,
  `programID` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblevaluation` (
  `sl` int(11) NOT NULL,
  `studentID` varchar(100) NOT NULL,
  `assessmentID` varchar(100) NOT NULL,
  `obtainedMarks` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblmarks` (
  `sl` int(11) NOT NULL,
  `studentID` varchar(100) NOT NULL,
  `courseID` varchar(100) NOT NULL,
  `examName` varchar(200) NOT NULL,
  `semester` varchar(200) NOT NULL,
  `section` varchar(5) NOT NULL,
  `q1_mark` int(11) NOT NULL,
  `q1_co` int(11) NOT NULL,
  `q1_max` int(11) NOT NULL,
  `q2_mark` int(11) NOT NULL,
  `q2_co` int(11) NOT NULL,
  `q2_max` int(11) NOT NULL,
  `q3_mark` int(11) NOT NULL,
  `q3_co` int(11) NOT NULL,
  `q3_max` int(11) NOT NULL,
  `q4_mark` int(11) NOT NULL,
  `q4_co` int(11) NOT NULL,
  `q4_max` int(11) NOT NULL,
  `q5_mark` int(11) NOT NULL,
  `q5_co` int(11) NOT NULL,
  `q5_max` int(11) NOT NULL,
  `q6_mark` int(11) NOT NULL,
  `q6_co` int(11) NOT NULL,
  `q6_max` int(11) NOT NULL,
  `q7_mark` int(11) NOT NULL,
  `q7_co` int(11) NOT NULL,
  `q7_max` int(11) NOT NULL,
  `q8_mark` int(11) NOT NULL,
  `q8_co` int(11) NOT NULL,
  `q8_max` int(11) NOT NULL,
  `q9_mark` int(11) NOT NULL,
  `q9_co` int(11) NOT NULL,
  `q9_max` int(11) NOT NULL,
  `q10_mark` int(11) NOT NULL,
  `q10_co` int(11) NOT NULL,
  `q10_max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblplo` (
  `sl` int(11) NOT NULL,
  `programID` varchar(100) NOT NULL,
  `ploNo` int(11) NOT NULL,
  `ploName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblprogram2` (
  `sl` int(11) NOT NULL,
  `ProgramID` varchar(100) NOT NULL,
  `programName` varchar(200) NOT NULL,
  `school` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tblschool` (
  `sl` int(11) NOT NULL,
  `SchoolID` varchar(100) NOT NULL,
  `SchoolName` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `tbluser` (
  `sl` int(11) NOT NULL,
  `userID` varchar(100) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `programID` varchar(100) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `tblco`
  ADD CONSTRAINT `FKCourseID` FOREIGN KEY (`courseID`) REFERENCES `tblcourse` (`courseID`),
  ADD CONSTRAINT `fkPLOID` FOREIGN KEY (`ploID`) REFERENCES `tblplo` (`sl`);

ALTER TABLE `tblcourse`
  ADD CONSTRAINT `FK` FOREIGN KEY (`programID`) REFERENCES `tblprogram2` (`ProgramID`);

ALTER TABLE `tblmarks`
  ADD CONSTRAINT `FKcourse` FOREIGN KEY (`courseID`) REFERENCES `tblcourse` (`courseID`),
  ADD CONSTRAINT `fkStudent` FOREIGN KEY (`studentID`) REFERENCES `tbluser` (`userID`);

