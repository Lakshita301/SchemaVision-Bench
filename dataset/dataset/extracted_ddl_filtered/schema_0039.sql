-- Source: https://github.com/chmsteam/CHMS/blob/aae01e26961addb0f3f832f8396ce9f34906b722/chms_db/CHMSdumpOct7.sql?raw=true
-- Tables detected: 25 | FK/REFERENCES mentions: 19

CREATE TABLE `tblagency` (
  `strName` varchar(100) DEFAULT NULL,
  `strAddress` varchar(200) DEFAULT NULL,
  `strTelNum` varchar(11) DEFAULT NULL,
  `strEmail` varchar(45) DEFAULT NULL,
  `strOwner` varchar(45) DEFAULT NULL,
  `strOIC` varchar(45) DEFAULT NULL,
  `strLogo` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblclient` (
  `intClientID` int(11) NOT NULL,
  `strContact` varchar(45) DEFAULT NULL,
  `strCAHouseNo` varchar(45) DEFAULT NULL,
  `strCAStreet` varchar(45) DEFAULT NULL,
  `strCAProvince` varchar(45) DEFAULT NULL,
  `strCity` varchar(45) DEFAULT NULL,
  `strPAddress` varchar(70) DEFAULT NULL,
  `strOAddress` varchar(70) DEFAULT NULL,
  `strOContact` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intClientID`),
  KEY `intClientID_idx` (`intClientID`),
  CONSTRAINT `intClientID` FOREIGN KEY (`intClientID`) REFERENCES `tbluser` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblcontract` (
  `intConTransID` int(11) NOT NULL,
  `intConReqNo` int(11) NOT NULL,
  `intConHWID` int(11) DEFAULT NULL,
  `intConSalary` decimal(9,2) DEFAULT NULL,
  `strConStatus` varchar(20) DEFAULT NULL,
  `datDateStarted` date DEFAULT NULL,
  `strCurStatus` varchar(20) DEFAULT NULL,
  `intConReplacementLeft` int(11) DEFAULT NULL,
  `strConCopy` varchar(50),
  KEY `intConTransID` (`intConTransID`),
  CONSTRAINT `intConTransID` FOREIGN KEY (`intConTransID`) REFERENCES `tblfinalrequest` (`intRequestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblfee` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(30) DEFAULT NULL,
  `fltFee` decimal(9,2) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `tblfinalrequest` (
  `intRequestID` int(11) NOT NULL AUTO_INCREMENT,
  `intRequest_ClientID` int(11) NOT NULL,
  `strRequestType` varchar(15) DEFAULT NULL,
  `strRequestName` varchar(50) DEFAULT NULL,
  `strRequestDesc` varchar(250) DEFAULT NULL,
  `datRequestDate` date DEFAULT NULL,
  `strRequestStatus` varchar(15) DEFAULT NULL,
  `datRequestNeedDate` date DEFAULT NULL,
  PRIMARY KEY (`intRequestID`),
  KEY `intRequest_ClientID_idx` (`intRequest_ClientID`),
  CONSTRAINT `intRequest_ClientID` FOREIGN KEY (`intRequest_ClientID`) REFERENCES `tbluser` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `tblfreereplacement` (
  `intFreeReplacement` int(11) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblhouseholdworker` (
  `intHWID` int(11) NOT NULL,
  `intServiceID` int(11) DEFAULT NULL,
  `datBirthDay` date DEFAULT NULL,
  `strGender` varchar(10) DEFAULT NULL,
  `strCivilStatus` varchar(20) DEFAULT NULL,
  `strCitizenship` varchar(30) DEFAULT NULL,
  `strReligion` varchar(20) DEFAULT NULL,
  `strHeight` varchar(10) DEFAULT NULL,
  `strWeight` varchar(10) DEFAULT NULL,
  `strCellNum` varchar(11) DEFAULT NULL,
  `strTelNum` varchar(11) DEFAULT NULL,
  `strCAHouseNo` varchar(45) DEFAULT NULL,
  `strCAStreet` varchar(45) DEFAULT NULL,
  `strCAMunicipality` varchar(45) DEFAULT NULL,
  `strCity` varchar(45) DEFAULT NULL,
  `strPAddress` varchar(70) DEFAULT NULL,
  `strPofBirth` varchar(70) DEFAULT NULL,
  `strOtherSkills` longtext,
  PRIMARY KEY (`intHWID`),
  KEY `intHWID_idx` (`intHWID`),
  KEY `intServiceID_idx` (`intServiceID`),
  CONSTRAINT `intHWID` FOREIGN KEY (`intHWID`) REFERENCES `tbluser` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `intServiceID` FOREIGN KEY (`intServiceID`) REFERENCES `tblmservice` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblhw_educbg` (
  `intHWID_educbg` int(11) NOT NULL,
  `strType` varchar(15) DEFAULT NULL,
  `strSchoolName` varchar(50) DEFAULT NULL,
  `strSchoolAdd` varchar(250) DEFAULT NULL,
  `intSchoolGrad` int(11) DEFAULT NULL,
  `strSchoolSkill` varchar(50) DEFAULT NULL,
  KEY `intHWID_educbg_idx` (`intHWID_educbg`),
  CONSTRAINT `intHWID_educbg` FOREIGN KEY (`intHWID_educbg`) REFERENCES `tbluser` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblhw_ref` (
  `intHWID_ref` int(11) NOT NULL,
  `strType` varchar(15) DEFAULT NULL,
  `strName` varchar(50) DEFAULT NULL,
  `strAddress` varchar(100) DEFAULT NULL,
  `strOccupation` varchar(20) DEFAULT NULL,
  `strTelNo` varchar(15) DEFAULT NULL,
  KEY `intHWID_ref_idx` (`intHWID_ref`),
  CONSTRAINT `intHWID_ref` FOREIGN KEY (`intHWID_ref`) REFERENCES `tbluser` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblhw_workbg` (
  `intHWID_workbg` int(11) NOT NULL,
  `strWorkName` varchar(50) DEFAULT NULL,
  `strWorkAdd` varchar(250) DEFAULT NULL,
  `strWorkPosition` varchar(50) DEFAULT NULL,
  `intWorkStart` int(11) DEFAULT NULL,
  `intWorkEnd` int(11) DEFAULT NULL,
  KEY `intHWID_workbg_idx` (`intHWID_workbg`),
  CONSTRAINT `intHWID_workbg` FOREIGN KEY (`intHWID_workbg`) REFERENCES `tbluser` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblinitialrequest` (
  `intIRequestID` int(11) NOT NULL,
  `intIRequest_No` int(11) DEFAULT NULL,
  `intITypeOfService` int(11) DEFAULT NULL,
  `intIQuantity` int(11) DEFAULT NULL,
  `intIRequestAge1` int(11) DEFAULT NULL,
  `intIRequestAge2` int(11) DEFAULT NULL,
  `strIRequestGender` varchar(10) DEFAULT NULL,
  `strIRequestEduc` varchar(20) DEFAULT NULL,
  `intIRequestExp` int(11) DEFAULT NULL,
  `deciRequestSalary` decimal(9,2) DEFAULT NULL,
  KEY `intIRequest_No` (`intIRequest_No`),
  KEY `intIRequestID_idx` (`intIRequestID`),
  CONSTRAINT `intIRequestID` FOREIGN KEY (`intIRequestID`) REFERENCES `tblfinalrequest` (`intRequestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblleaverequest` (
  `intLeaveRequestID` int(11) NOT NULL,
  `intHouseholdID` int(11) DEFAULT NULL,
  `intClientID` int(11) DEFAULT NULL,
  `datDateCreated` date DEFAULT NULL,
  `intTypeOfLeave` int(11) DEFAULT NULL,
  `strAddressOnLeave` varchar(100) DEFAULT NULL,
  `strReason` varchar(250) DEFAULT NULL,
  `datDateFrom` date DEFAULT NULL,
  `datDateTo` date DEFAULT NULL,
  `strReliever` varchar(10) DEFAULT NULL,
  `strLeaveStatus` varchar(50) DEFAULT NULL,
  `strRejReas` longtext,
  KEY `intTypeOfLeave` (`intTypeOfLeave`),
  KEY `intLeaveRequestID` (`intLeaveRequestID`),
  CONSTRAINT `intLeaveRequestID` FOREIGN KEY (`intLeaveRequestID`) REFERENCES `tblfinalrequest` (`intRequestID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intTypeOfLeave` FOREIGN KEY (`intTypeOfLeave`) REFERENCES `tblmleave` (`intID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblmcity` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(100) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `tblmincidentreport` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(100) DEFAULT NULL,
  `strDesc` varchar(250) DEFAULT NULL,
  `strLevel` varchar(20) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tblmleave` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(100) DEFAULT NULL,
  `intDays` int(11) DEFAULT NULL,
  `intDaysForFile` int(11) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `tblmreplacereason` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(100) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `tblmrequirements` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(100) DEFAULT NULL,
  `strType` varchar(100) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `tblmservice` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(100) DEFAULT NULL,
  `deciRate` decimal(9,2) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `tblmskills` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strName` varchar(100) DEFAULT NULL,
  `intSkillID_intID` int(11) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  KEY `intSkillID_idx` (`intID`),
  KEY `intSkillID_intID` (`intSkillID_intID`),
  CONSTRAINT `intSkillID_intID` FOREIGN KEY (`intSkillID_intID`) REFERENCES `tblmservice` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `tblreliever` (
  `intReq_RelID` int(11) NOT NULL,
  `intTobeRelievedID` int(11) DEFAULT NULL,
  `intRelieverID` int(11) DEFAULT NULL,
  `strRelieverStatus` varchar(30) DEFAULT NULL,
  KEY `intReq_RelID` (`intReq_RelID`),
  CONSTRAINT `intReq_RelID` FOREIGN KEY (`intReq_RelID`) REFERENCES `tblleaverequest` (`intLeaveRequestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblreplacement` (
  `intReplaceReqID` int(11) NOT NULL,
  `intReplaceOldHWID` int(11) NOT NULL,
  `intReplaceNewHWID` int(11) DEFAULT NULL,
  KEY `intReplaceReqID` (`intReplaceReqID`),
  KEY `intReplaceOldHWID` (`intReplaceOldHWID`),
  CONSTRAINT `intReplaceOldHWID` FOREIGN KEY (`intReplaceOldHWID`) REFERENCES `tblhouseholdworker` (`intHWID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `intReplaceReqID` FOREIGN KEY (`intReplaceReqID`) REFERENCES `tblfinalrequest` (`intRequestID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblreport` (
  `intReportID` int(11) NOT NULL AUTO_INCREMENT,
  `intReporterID` int(11) DEFAULT NULL,
  `intRecipentID` int(11) DEFAULT NULL,
  `intTypeofReport` int(11) DEFAULT NULL,
  `strReason` varchar(250) DEFAULT NULL,
  `strPicture` varchar(45) DEFAULT NULL,
  `strValidity` varchar(50) DEFAULT NULL,
  `datDateReported` date DEFAULT NULL,
  `strReportStatus` varchar(50) DEFAULT NULL,
  `strActionTaken` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`intReportID`),
  KEY `intTypeofReport` (`intTypeofReport`),
  CONSTRAINT `intTypeofReport` FOREIGN KEY (`intTypeofReport`) REFERENCES `tblmincidentreport` (`intID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tblresults` (
  `intRRequestID` int(11) NOT NULL,
  `intRRequest_No` int(11) DEFAULT NULL,
  `intRHWID` int(11) DEFAULT NULL,
  `strRHWStatus` varchar(20) DEFAULT NULL,
  `strRClientStatus` varchar(20) DEFAULT NULL,
  KEY `intRRequestID` (`intRRequestID`),
  KEY `intRHWID` (`intRHWID`),
  CONSTRAINT `intRHWID` FOREIGN KEY (`intRHWID`) REFERENCES `tbluser` (`intID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `intRRequestID` FOREIGN KEY (`intRRequestID`) REFERENCES `tblfinalrequest` (`intRequestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbltransaction` (
  `intTRequestID` int(11) NOT NULL,
  `intTClientID` int(11) DEFAULT NULL,
  `datDateRequested` date DEFAULT NULL,
  `intTypeofDeployment` int(11) DEFAULT NULL,
  `datDateofDeployment` date DEFAULT NULL,
  `timTimeofDeployment` time DEFAULT NULL,
  `strContract` varchar(100) DEFAULT NULL,
  `strContractStatus` varchar(20) DEFAULT NULL,
  `datDateSettled` date DEFAULT NULL,
  `datDateExpiry` date DEFAULT NULL,
  `strTStatus` varchar(20) DEFAULT NULL,
  `strORNumber` varchar(20) DEFAULT NULL,
  `strInvoiceNum` varchar(20) DEFAULT NULL,
  `strORPicture` varchar(45) DEFAULT NULL,
  `strConRemarks` longtext,
  KEY `intTRequestID` (`intTRequestID`),
  CONSTRAINT `intTRequestID` FOREIGN KEY (`intTRequestID`) REFERENCES `tblfinalrequest` (`intRequestID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tbluser` (
  `intID` int(11) NOT NULL AUTO_INCREMENT,
  `strFName` varchar(45) DEFAULT NULL,
  `strMName` varchar(45) DEFAULT NULL,
  `strLName` varchar(45) DEFAULT NULL,
  `strEmail` varchar(45) DEFAULT NULL,
  `strPassword` varchar(45) DEFAULT NULL,
  `strPicture` varchar(100) DEFAULT NULL,
  `strType` varchar(45) DEFAULT NULL,
  `strStatus` varchar(45) DEFAULT NULL,
  `datDateRegistered` date DEFAULT NULL,
  PRIMARY KEY (`intID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

