-- Source: https://github.com/MindMasterSG/iSavviLiteWeb/blob/ae94ef82a385a3e133ba2affbda36f07fb5f7257/Backup/SMS/DB/sms12042013.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 17

CREATE TABLE `companies` (
  `CompanyId` int(10) unsigned NOT NULL auto_increment,
  `CompanyName` varchar(100) default NULL,
  `Address` varchar(500) default NULL,
  `ContactNumber` varchar(15) default NULL,
  `DeploymentId` int(10) default NULL,
  PRIMARY KEY  (`CompanyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `deployments` (
  `DeploymentId` int(10) unsigned NOT NULL auto_increment,
  `DeploymentName` varchar(100) NOT NULL,
  `Description` varchar(500) default NULL,
  `AddedDate` datetime default NULL,
  `ClientName` varchar(100) default NULL,
  `Address` varchar(200) default NULL,
  PRIMARY KEY  (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `eventmasterlist` (
  `eventid` int(10) unsigned NOT NULL auto_increment,
  `startdate` datetime default NULL,
  `enddate` datetime default NULL,
  `locationid` int(10) unsigned default NULL,
  `numberofguards` int(4) default NULL,
  `specialdutyforguard` varchar(100) default NULL,
  `eventname` varchar(200) default NULL,
  `notes` varchar(500) default NULL,
  `optionalguestlist` varchar(2000) default NULL,
  `personinchargename` varchar(100) default NULL,
  `personinchargenric` varchar(100) default NULL,
  `personinchargecontactnumber` varchar(20) default NULL,
  `DeploymentId` int(10) unsigned default NULL,
  `Remarks` varchar(500) default NULL,
  PRIMARY KEY  (`eventid`),
  KEY `FK_eventmasterlist` (`locationid`),
  CONSTRAINT `FK_eventmasterlist` FOREIGN KEY (`locationid`) REFERENCES `locations` (`LocationId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `events` (
  `EventId` int(10) unsigned NOT NULL auto_increment,
  `DeploymentId` int(10) unsigned NOT NULL,
  `EventName` varchar(100) NOT NULL default '',
  `EventDate` datetime default NULL,
  `Remarks` varchar(500) default NULL,
  `AddedDate` datetime default NULL,
  PRIMARY KEY  (`EventId`),
  KEY `FK_events_1` (`DeploymentId`),
  CONSTRAINT `FK_events_1` FOREIGN KEY (`DeploymentId`) REFERENCES `deployments` (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `gates` (
  `GateId` int(10) unsigned NOT NULL auto_increment,
  `DeploymentId` int(10) unsigned NOT NULL,
  `GateName` varchar(100) NOT NULL default '',
  `AddedDate` datetime default NULL,
  PRIMARY KEY  (`GateId`),
  KEY `FK_gates_1` (`DeploymentId`),
  CONSTRAINT `FK_gates_1` FOREIGN KEY (`DeploymentId`) REFERENCES `deployments` (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `incidents` (
  `incidentid` int(10) NOT NULL auto_increment,
  `reportdate` datetime default NULL,
  `natureofincident` varchar(20) default NULL,
  `dateofincident` datetime default NULL,
  `locationid` int(10) unsigned default NULL,
  `particularsofpersons` varchar(500) default NULL,
  `briefdescription` varchar(500) default NULL,
  `remarksandactionstaken` varchar(500) default NULL,
  `snapshotpath` varchar(100) default NULL,
  `deploymentid` int(10) unsigned default NULL,
  PRIMARY KEY  (`incidentid`),
  KEY `FK_incidents` (`locationid`),
  KEY `FK_incidents_d` (`deploymentid`),
  CONSTRAINT `FK_incidents` FOREIGN KEY (`locationid`) REFERENCES `locations` (`LocationId`),
  CONSTRAINT `FK_incidents_d` FOREIGN KEY (`deploymentid`) REFERENCES `deployments` (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `keys` (
  `KeyId` int(10) unsigned NOT NULL auto_increment,
  `KeyName` varchar(45) NOT NULL default '',
  `DeploymentId` int(10) unsigned NOT NULL,
  `Status` int(10) unsigned default NULL,
  `AddedDate` datetime default NULL,
  PRIMARY KEY  (`KeyId`),
  KEY `FK_keys_1` (`DeploymentId`),
  KEY `FK_keys` (`Status`),
  CONSTRAINT `FK_keys` FOREIGN KEY (`Status`) REFERENCES `keystatuses` (`StatusID`),
  CONSTRAINT `FK_keys_1` FOREIGN KEY (`DeploymentId`) REFERENCES `deployments` (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `keystatuses` (
  `StatusID` int(3) unsigned NOT NULL auto_increment,
  `StatusType` varchar(30) default NULL,
  `AddedDate` datetime default NULL,
  PRIMARY KEY  (`StatusID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `locations` (
  `LocationId` int(10) unsigned NOT NULL auto_increment,
  `DeploymentId` int(10) unsigned NOT NULL,
  `LocationName` varchar(100) NOT NULL default '',
  PRIMARY KEY  (`LocationId`),
  KEY `FK_locations_1` (`DeploymentId`),
  CONSTRAINT `FK_locations_1` FOREIGN KEY (`DeploymentId`) REFERENCES `deployments` (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `lostandfound` (
  `lostandfoundreportid` int(10) NOT NULL auto_increment,
  `nameofperson` varchar(100) default NULL,
  `nric` varchar(30) default NULL,
  `reporteddate` datetime default NULL,
  `remarks` varchar(500) default NULL,
  `deploymentid` int(10) unsigned default NULL,
  PRIMARY KEY  (`lostandfoundreportid`),
  KEY `FK_lostandfound` (`deploymentid`),
  CONSTRAINT `FK_lostandfound` FOREIGN KEY (`deploymentid`) REFERENCES `deployments` (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `occurances` (
  `occuranceid` int(10) NOT NULL auto_increment,
  `serialnumber` varchar(20) default NULL,
  `reportdate` datetime default NULL,
  `occurancetype` varchar(15) default NULL,
  `notes` varchar(3000) default NULL,
  `important` tinyint(1) default NULL,
  `heading` varchar(500) default NULL,
  `deploymentid` int(10) unsigned default NULL,
  PRIMARY KEY  (`occuranceid`),
  KEY `FK_occurances` (`deploymentid`),
  CONSTRAINT `FK_occurances` FOREIGN KEY (`deploymentid`) REFERENCES `deployments` (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `passes` (
  `PassId` int(10) unsigned NOT NULL auto_increment,
  `PassName` varchar(100) default NULL,
  `PassStatus` varchar(10) default NULL,
  `VisitortypeId` int(10) unsigned default NULL,
  `DeploymentId` int(10) default NULL,
  PRIMARY KEY  (`PassId`),
  KEY `FK_passes_visitortypes` (`VisitortypeId`),
  CONSTRAINT `FK_passes` FOREIGN KEY (`VisitortypeId`) REFERENCES `visitortypes` (`VisitortypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `userdetails` (
  `UID` int(10) NOT NULL auto_increment,
  `DeploymentID` int(5) default NULL,
  `UserTypeID` int(5) NOT NULL,
  `LoginID` varchar(20) NOT NULL,
  `UserName` varchar(50) default NULL,
  `EmailID` varchar(100) default NULL,
  `Password` varchar(20) NOT NULL,
  PRIMARY KEY  (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usertypes` (
  `UserTypeId` int(10) unsigned NOT NULL auto_increment,
  `UserType` varchar(45) NOT NULL,
  `Description` varchar(500) default NULL,
  `CreatedDate` datetime default NULL,
  `Parent` varchar(45) default NULL,
  `level` int(10) unsigned default NULL,
  PRIMARY KEY  (`UserTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `vehicles` (
  `identificationunit` varchar(30) NOT NULL,
  `platenumber` varchar(20) default NULL,
  `containernumber` varchar(30) default NULL,
  `description` varchar(200) default NULL,
  `trailernumber` varchar(30) default NULL,
  `contractor` varchar(30) default NULL,
  `length` varchar(10) default NULL,
  `capacity` varchar(10) default NULL,
  `securityguardname` varchar(100) default NULL,
  `authpersonic` varchar(100) default NULL,
  `authpersonname` varchar(100) default NULL,
  `imagepath` varchar(150) default NULL,
  `deploymentid` int(10) unsigned default NULL,
  PRIMARY KEY  (`identificationunit`),
  KEY `FK_vehicles` (`deploymentid`),
  CONSTRAINT `FK_vehicles` FOREIGN KEY (`deploymentid`) REFERENCES `deployments` (`DeploymentId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `visitorcheckinout` (
  `nricid` varchar(30) NOT NULL,
  `name` varchar(100) default NULL,
  `address` varchar(500) default NULL,
  `fromcompany` varchar(100) default NULL,
  `tocompany` int(10) unsigned default NULL,
  `telno` varchar(20) default NULL,
  `persontovisit` varchar(100) default NULL,
  `eventid` int(10) unsigned default NULL,
  `temp` int(10) default NULL,
  `visitortype` int(10) default NULL,
  `keyid` int(10) unsigned default NULL,
  `passid` int(10) unsigned default NULL,
  `gateid` int(10) unsigned default NULL,
  `vehicleplatenumber` varchar(20) default NULL,
  `guardname` varchar(100) default NULL,
  `remarks` varchar(500) default NULL,
  `checkintime` datetime default NULL,
  `checkouttime` datetime default NULL,
  `snapshotpath` varchar(100) default NULL,
  `deploymentid` int(10) unsigned default NULL,
  PRIMARY KEY  (`nricid`),
  KEY `FK_visitorcheckinout_companies` (`tocompany`),
  KEY `FK_visitorcheckinout_gates` (`gateid`),
  KEY `FK_visitorcheckinout_events` (`eventid`),
  KEY `FK_visitorcheckinout_passes` (`passid`),
  KEY `FK_visitorcheckinout_ddep` (`deploymentid`),
  CONSTRAINT `FK_visitorcheckinout_companies` FOREIGN KEY (`tocompany`) REFERENCES `companies` (`CompanyId`),
  CONSTRAINT `FK_visitorcheckinout_ddep` FOREIGN KEY (`deploymentid`) REFERENCES `deployments` (`DeploymentId`),
  CONSTRAINT `FK_visitorcheckinout_passes` FOREIGN KEY (`passid`) REFERENCES `passes` (`PassId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `visitors` (
  `VisitorId` int(10) unsigned NOT NULL auto_increment,
  `DeploymentId` int(10) unsigned NOT NULL,
  `NRIC` varchar(45) NOT NULL,
  `FirstName` varchar(100) default NULL,
  `MiddleName` varchar(100) default NULL,
  `LastName` varchar(100) default NULL,
  `Address` varchar(500) default NULL,
  `ContactNumber` varchar(20) default NULL,
  `CompanyName` varchar(100) default NULL,
  `IsBlacklisted` bit(1) default NULL,
  `AddedDate` datetime default NULL,
  `IsCheckInCheckOut` bit(1) default NULL,
  `eventid` int(10) unsigned default NULL,
  PRIMARY KEY  (`VisitorId`),
  KEY `FK_visitors_1` (`DeploymentId`),
  KEY `FK_visitors_em` (`eventid`),
  CONSTRAINT `FK_visitors_1` FOREIGN KEY (`DeploymentId`) REFERENCES `deployments` (`DeploymentId`),
  CONSTRAINT `FK_visitors_em` FOREIGN KEY (`eventid`) REFERENCES `eventmasterlist` (`eventid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `visitortypes` (
  `VisitortypeId` int(10) unsigned NOT NULL auto_increment,
  `VisitorTypeDescription` varchar(45) NOT NULL default '',
  `AddedDate` datetime default NULL,
  PRIMARY KEY  (`VisitortypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

