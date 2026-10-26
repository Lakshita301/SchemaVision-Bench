-- Source: https://github.com/kimanilewis/argila/blob/5fec6997b20151bf9dd5050cb2c021fd3ed12438/DB/argilaV3.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 2

CREATE TABLE `coreRequests` (
  `coreRequestID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `accountNumber` varchar(45) NOT NULL,
  `accountBalance` double(15,2) NOT NULL DEFAULT '0.00',
  `expiryDate` datetime DEFAULT '0001-01-01 00:00:00',
  `timestamp` datetime DEFAULT NULL,
  `MSISDN` bigint(20) DEFAULT NULL,
  `dateCreated` datetime NOT NULL DEFAULT '0001-01-01 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `originIP` int(11) DEFAULT NULL,
  PRIMARY KEY (`coreRequestID`),
  KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;

CREATE TABLE `customerProfileAccounts` (
  `customerProfileAccountID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `customerProfileID` int(11) NOT NULL,
  `LocationID` varchar(100) DEFAULT NULL COMMENT 'refrence to locations table',
  `expiryDate` datetime DEFAULT '0001-01-01 00:00:00',
  `amountBalance` double(15,2) NOT NULL DEFAULT '0.00',
  `startTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expiryTime` datetime DEFAULT NULL,
  `processingStatus` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL DEFAULT '2',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customerProfileAccountID`),
  KEY `customerProfileID` (`customerProfileID`),
  KEY `LocationID` (`LocationID`),
  CONSTRAINT `fk_customerProfileID` FOREIGN KEY (`customerProfileID`) REFERENCES `customerProfiles` (`customerProfileID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `customerProfiles` (
  `customerProfileID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `accountNumber` varchar(45) NOT NULL,
  `MSISDN` bigint(20) DEFAULT NULL,
  `amount` double(15,2) NOT NULL DEFAULT '0.00',
  `statusCode` smallint(1) NOT NULL DEFAULT '0',
  `statusDescription` text,
  `active` tinyint(1) NOT NULL DEFAULT '2',
  `dateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customerProfileID`),
  UNIQUE KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

CREATE TABLE `locations` (
  `LocationID` varchar(100) NOT NULL COMMENT 'Location Idenity ',
  `locationName` varchar(225) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sessionData` (
  `sessionDataID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `customerProfileAccountID` int(11) unsigned NOT NULL,
  `timeSpent` text,
  `amountSpent` double(15,2) NOT NULL DEFAULT '0.00',
  `syncStatus` tinyint(1) NOT NULL DEFAULT '0',
  `syncStatusDescription` text,
  `amountBalance` double(15,2) NOT NULL DEFAULT '0.00',
  `dateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sessionDataID`),
  KEY `customerProfileAccountID` (`customerProfileAccountID`),
  CONSTRAINT `fk_customerProfileAccountID` FOREIGN KEY (`customerProfileAccountID`) REFERENCES `customerProfileAccounts` (`customerProfileAccountID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;

CREATE TABLE `statusCodes` (
  `statusID` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `statusCodeID` int(11) NOT NULL,
  `statusName` varchar(45) DEFAULT NULL,
  `statusDescription` varchar(150) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `dateModified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`statusID`),
  KEY `statusCodeID` (`statusCodeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

