-- Source: https://github.com/pkul3003/primenova/blob/944b51f30495325bd7a94df2a4f21306dfa29501/hopeandcure_db/old_hmsdb/hmsdb_21Aug.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 15

CREATE TABLE `appointments` (
  `UHID` int(11) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `Consultant` varchar(255) NOT NULL,
  `DateOfAppointment` date NOT NULL,
  `TimeOfAppointment` time NOT NULL,
  `ContactNumber` bigint(20) NOT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ReferredBy` varchar(255) DEFAULT NULL,
  `ComingFromCity` varchar(255) DEFAULT NULL,
  `ComingFromArea` varchar(255) DEFAULT NULL,
  `PatientRelativeName` varchar(255) DEFAULT NULL,
  `RelationWithPatient` varchar(255) DEFAULT NULL,
  `RelativeContactNumber` varchar(10) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`UHID`,`DateOfAppointment`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `consultants` (
  `staffid` bigint(20) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `PrimarySpeciality` varchar(300) NOT NULL,
  `SecondarySpeciality` varchar(300) DEFAULT NULL,
  `HighestQualification` varchar(300) NOT NULL,
  `Physician` enum('yes','no') NOT NULL,
  `Surgeon` enum('yes','no') NOT NULL,
  `EmergencyContactNumber` bigint(20) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `staffid` (`staffid`),
  CONSTRAINT `consultants_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff_login` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `occular_prescription` (
  `UHID` int(11) NOT NULL,
  `OpticalPrescription1` varchar(300) DEFAULT NULL,
  `OpticalPrescription2` varchar(300) DEFAULT NULL,
  `OpticalPrescription3` varchar(300) DEFAULT NULL,
  `Precaution1` varchar(300) DEFAULT NULL,
  `Precaution2` varchar(300) DEFAULT NULL,
  `Precaution3` varchar(300) DEFAULT NULL,
  `SpecialistReferral` enum('YES','NO') DEFAULT NULL,
  `ReferredSpecialist1` varchar(300) DEFAULT NULL,
  `ReferredSpecialist2` varchar(300) DEFAULT NULL,
  `ReferredSpecialist3` varchar(300) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UHID` (`UHID`),
  CONSTRAINT `occular_prescription_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `ocular_complaint_types` (
  `ComplaintType` varchar(100) NOT NULL,
  `ComplaintDescription` varchar(300) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ComplaintType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `optical_investigation` (
  `UHID` int(11) NOT NULL,
  `Procedure1` varchar(100) DEFAULT NULL,
  `Procedure2` varchar(100) DEFAULT NULL,
  `Procedure3` varchar(100) DEFAULT NULL,
  `InvestigationSummary` varchar(300) DEFAULT NULL,
  `XylocaineTest` varchar(300) DEFAULT NULL,
  `BloodPressureSystolic` varchar(100) DEFAULT NULL,
  `BloodPressureDiastolic` varchar(100) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UHID` (`UHID`),
  CONSTRAINT `optical_investigation_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `optometary_results` (
  `UHID` int(11) NOT NULL,
  `AutorefactrometerReadingRight` varchar(100) DEFAULT NULL,
  `AutorefactrometerReadingLeft` varchar(100) DEFAULT NULL,
  `KeratometryReadingRight` varchar(100) DEFAULT NULL,
  `KeratometryReadingLeft` varchar(100) DEFAULT NULL,
  `UnaidedVisionRight` varchar(100) DEFAULT NULL,
  `UnaidedVisionLeft` varchar(100) DEFAULT NULL,
  `VisionWithPinhole` varchar(100) DEFAULT NULL,
  `Retinoscopy` varchar(100) DEFAULT NULL,
  `Acceptance` varchar(100) DEFAULT NULL,
  `IntraOccularPressure` enum('SCHIOTZ','NCT','APPLANATION','DIGITALLY') DEFAULT NULL,
  `SAC` varchar(100) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UHID` (`UHID`),
  CONSTRAINT `optometary_results_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_address` (
  `UHID` int(11) NOT NULL,
  `AddressLine1` varchar(255) NOT NULL,
  `AddressLine2` varchar(255) DEFAULT NULL,
  `Landmark` varchar(255) DEFAULT NULL,
  `Area` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `District` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `PINCode` bigint(20) DEFAULT NULL,
  `EmergencyContactNumber` bigint(20) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `UHID` (`UHID`),
  CONSTRAINT `patient_address_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_complaints` (
  `UHID` int(11) NOT NULL,
  `Complaint1` varchar(300) DEFAULT NULL,
  `Complaint1DurationWeeks` varchar(100) DEFAULT NULL,
  `Complaint2` varchar(300) DEFAULT NULL,
  `Complaint2DurationWeeks` varchar(100) DEFAULT NULL,
  `Complaint3` varchar(300) DEFAULT NULL,
  `Complaint3DurationWeeks` varchar(100) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UHID` (`UHID`),
  CONSTRAINT `patient_complaints_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_medical_facts` (
  `UHID` int(11) NOT NULL,
  `BloodGroup` varchar(255) NOT NULL,
  `BloodPressureSystolic` varchar(255) DEFAULT NULL,
  `BloodPressureDiastolic` varchar(255) DEFAULT NULL,
  `isDiabetic` enum('YES','NO') DEFAULT NULL,
  `isHighBBPatient` enum('YES','NO') DEFAULT NULL,
  `isHeartPatient` enum('YES','NO') DEFAULT NULL,
  `PatientWeight` float(2,2) DEFAULT NULL,
  `SugarLevelFasting` int(11) DEFAULT NULL,
  `SugarLeaveRandom` int(11) DEFAULT NULL,
  `SugarLevelPostLunch` int(11) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UHID` (`UHID`),
  CONSTRAINT `patient_medical_facts_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_occular_facts` (
  `UHID` int(11) NOT NULL,
  `UsingSpectacles` enum('YES','NO') DEFAULT NULL,
  `UsingContacts` enum('YES','NO') DEFAULT NULL,
  `RightGlassPrescription` varchar(100) DEFAULT NULL,
  `LeftGlassPrescription` varchar(100) DEFAULT NULL,
  `EyeColor` varchar(100) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UHID` (`UHID`),
  CONSTRAINT `patient_occular_facts_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_previous_occular_illness` (
  `UHID` int(11) NOT NULL,
  `KnownOcularCondition` varchar(300) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UHID` (`UHID`),
  CONSTRAINT `patient_previous_occular_illness_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patient_systemic_history` (
  `UHID` int(11) NOT NULL,
  `ComplaintType` varchar(100) NOT NULL,
  `ComplaintDescription` varchar(300) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `UHID` (`UHID`),
  KEY `ComplaintType` (`ComplaintType`),
  CONSTRAINT `patient_systemic_history_ibfk_1` FOREIGN KEY (`UHID`) REFERENCES `patients` (`UHID`),
  CONSTRAINT `patient_systemic_history_ibfk_2` FOREIGN KEY (`ComplaintType`) REFERENCES `systemic_complaint_types` (`ComplaintType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `patients` (
  `UHID` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `ContactNumber` varchar(10) NOT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Aadhar` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UHID`),
  UNIQUE KEY `UC_Patient` (`FirstName`,`LastName`,`DOB`,`ContactNumber`,`Aadhar`)
) ENGINE=InnoDB AUTO_INCREMENT=1276 DEFAULT CHARSET=latin1;

CREATE TABLE `staff_address` (
  `staffid` bigint(20) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `AddressLine1` varchar(255) NOT NULL,
  `AddressLine2` varchar(255) DEFAULT NULL,
  `Landmark` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `PINCode` bigint(20) DEFAULT NULL,
  `EmergencyContactNumber` bigint(20) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `staffid` (`staffid`),
  CONSTRAINT `staff_address_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff_login` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `staff_details` (
  `staffid` bigint(20) NOT NULL,
  `FirstName` varchar(255) NOT NULL,
  `MiddleName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) NOT NULL,
  `DOB` date NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `ContactNumber` bigint(20) NOT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `staffid` (`staffid`),
  CONSTRAINT `staff_details_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff_login` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `staff_login` (
  `staffid` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(32) NOT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`staffid`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=latin1;

CREATE TABLE `staff_roles` (
  `staffid` bigint(20) NOT NULL,
  `Admin` enum('yes','no') DEFAULT NULL,
  `Receptionist` enum('yes','no') DEFAULT NULL,
  `Consultant` enum('yes','no') DEFAULT NULL,
  `Optometerist` enum('yes','no') DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `staffid` (`staffid`),
  CONSTRAINT `staff_roles_ibfk_1` FOREIGN KEY (`staffid`) REFERENCES `staff_login` (`staffid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `systemic_complaint_types` (
  `ComplaintType` varchar(100) NOT NULL,
  `ComplaintDescription` varchar(300) DEFAULT NULL,
  `RecordTouchDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ComplaintType`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

