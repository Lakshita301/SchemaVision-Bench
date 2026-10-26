-- Source: https://github.com/alisonperez/ndg/blob/da8abbfff1a209b6506fbd1019c0aa11a0d73133/ndg-server-core/resources/ndg.sql?raw=true
-- Tables detected: 9 | FK/REFERENCES mentions: 11

CREATE TABLE `company` (
  `idCompany` int(11) NOT NULL auto_increment,
  `companyName` varchar(100) NOT NULL,
  `companyType` varchar(100) NOT NULL,
  `companyCountry` varchar(100) NOT NULL,
  `companyIndustry` varchar(100) NOT NULL,
  `companySize` varchar(255) NOT NULL,
  PRIMARY KEY  (`idCompany`),
  UNIQUE KEY `idCompany` (`idCompany`),
  UNIQUE KEY `companyName` (`companyName`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `device` (
  `idDevice` int(11) NOT NULL auto_increment,
  `deviceModel` varchar(10) default NULL,
  PRIMARY KEY  (`idDevice`),
  UNIQUE KEY `idDevice` (`idDevice`),
  UNIQUE KEY `deviceModel` (`deviceModel`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `role` (
  `idRole` int(11) NOT NULL auto_increment,
  `roleName` varchar(15) default NULL,
  PRIMARY KEY  (`idRole`),
  UNIQUE KEY `idRole` (`idRole`),
  UNIQUE KEY `roleName` (`roleName`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `idUser` int(11) NOT NULL auto_increment,
  `password` varchar(255) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `countryCode` varchar(255) default NULL,
  `areaCode` varchar(255) default NULL,
  `phoneNumber` varchar(255) default NULL,
  `userAdmin` varchar(50) NOT NULL,
  `userValidated` char(1) NOT NULL,
  `whoUseIt` char(1) NOT NULL,
  `emailPreferences` char(1) NOT NULL,
  `howDoYouPlanUseNdg` varchar(255) default NULL,
  `firstTimeUse` char(1) NOT NULL,
  `validationKey` varchar(255) default NULL,
  `idCompany` int(11) NOT NULL,
  `idRole` int(11) NOT NULL,
  `hasFullPermissions` char(1) NOT NULL default 'n',
  PRIMARY KEY  (`idUser`),
  UNIQUE KEY `idUser` (`idUser`),
  UNIQUE KEY `email` (`email`),
  KEY `FK_user_idRole` (`idRole`),
  KEY `FK_user_idCompany` (`idCompany`),
  KEY `FK36EBCBF6DE700B` (`idRole`),
  KEY `FK36EBCBA7EBF1F2` (`idCompany`),
  CONSTRAINT `FK_user_idCompany` FOREIGN KEY (`idCompany`) REFERENCES `company` (`idCompany`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_user_idRole` FOREIGN KEY (`idRole`) REFERENCES `role` (`idRole`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `imei` (
  `imei` varchar(15) NOT NULL,
  `msisdn` varchar(25) NOT NULL,
  `qtdeResults` int(11) default NULL,
  `idUser` int(11) NOT NULL,
  `idDevice` int(11) NOT NULL,
  PRIMARY KEY  (`imei`),
  UNIQUE KEY `msisdn` (`msisdn`),
  KEY `FK_imei_idDevice` (`idDevice`),
  KEY `FK_imei_idUser` (`idUser`),
  KEY `FK3160C8882A600B` (`idDevice`),
  KEY `FK3160C8F6E146B5` (`idUser`),
  CONSTRAINT `FK_imei_idDevice` FOREIGN KEY (`idDevice`) REFERENCES `device` (`idDevice`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_imei_idUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `surveys` (
  `idSurvey` varchar(10) NOT NULL,
  `surveyXML` text,
  `idUser` int(11) NOT NULL,
  PRIMARY KEY  (`idSurvey`),
  UNIQUE KEY `idSurvey` (`idSurvey`),
  KEY `FK_surveys_idUser` (`idUser`),
  KEY `FK91914459F6E146B5` (`idUser`),
  CONSTRAINT `FK_surveys_idUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `results` (
  `idResult` varchar(8) NOT NULL,
  `resultXML` text,
  `idSurvey` varchar(10) NOT NULL,
  PRIMARY KEY  (`idResult`),
  UNIQUE KEY `idResult` (`idResult`),
  KEY `FK_results_idSurvey` (`idSurvey`),
  KEY `FK416B3BF6D99AD6BC` (`idSurvey`),
  CONSTRAINT `FK_results_idSurvey` FOREIGN KEY (`idSurvey`) REFERENCES `surveys` (`idSurvey`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `transactionlog` (
  `idTransactionLog` int(11) NOT NULL auto_increment,
  `address` varchar(20) default NULL,
  `transactionType` varchar(2) default NULL,
  `transactionStatus` varchar(20) default NULL,
  `transmissionMode` varchar(5) default NULL,
  `transactionDate` date default NULL,
  `idSurvey` varchar(10) default NULL,
  `idResult` varchar(8) default NULL,
  `imei` varchar(15) default NULL,
  `idUser` int(11) NOT NULL,
  PRIMARY KEY  (`idTransactionLog`),
  UNIQUE KEY `idTransactionLog` (`idTransactionLog`),
  KEY `FK_transactionlog_idSurvey` (`idSurvey`),
  KEY `FK_transactionlog_imei` (`imei`),
  KEY `FK_transactionlog_idResult` (`idResult`),
  KEY `FK_transactionlog_idUser` (`idUser`),
  KEY `FK3C3C7BA6D99AD6BC` (`idSurvey`),
  KEY `FK3C3C7BA65D5AA3FD` (`imei`),
  KEY `FK3C3C7BA6D46F1842` (`idResult`),
  KEY `FK3C3C7BA6F6E146B5` (`idUser`),
  CONSTRAINT `FK_transactionlog_idResult` FOREIGN KEY (`idResult`) REFERENCES `results` (`idResult`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_transactionlog_idSurvey` FOREIGN KEY (`idSurvey`) REFERENCES `surveys` (`idSurvey`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_transactionlog_idUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `FK_transactionlog_imei` FOREIGN KEY (`imei`) REFERENCES `imei` (`imei`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=132 DEFAULT CHARSET=latin1;

CREATE TABLE `userbalance` (
  `idUSerBalance` int(11) NOT NULL auto_increment,
  `users` int(11) default NULL,
  `imeis` int(11) default NULL,
  `sendAlerts` int(11) default NULL,
  `results` int(11) default NULL,
  `surveys` int(11) default NULL,
  `idUser` int(11) default NULL,
  PRIMARY KEY  (`idUSerBalance`),
  KEY `FK_userbalance_idUser` (`idUser`),
  KEY `FK7691B8B1F6E146B5` (`idUser`),
  CONSTRAINT `FK_userbalance_idUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`idUser`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

