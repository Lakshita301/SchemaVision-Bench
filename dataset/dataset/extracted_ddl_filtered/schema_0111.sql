-- Source: https://github.com/autentia/TNTConcept/blob/9133a5c821326ab4a1a88535717aca148f175b00/tntconcept-web/src/test/selenium/Backup/tntconcept0.17.empty%2020090508%201144.sql?raw=true
-- Tables detected: 73 | FK/REFERENCES mentions: 97

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Account descriptive name',
  `number` varchar(20) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Account number',
  `accountTypeId` int(11) NOT NULL COMMENT 'Account type',
  `description` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Account description',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_account_accountTypeId` (`accountTypeId`),
  CONSTRAINT `fk_account_accountTypeId` FOREIGN KEY (`accountTypeId`) REFERENCES `accounttype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='almacenan las cuentas';

CREATE TABLE `accountentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL COMMENT 'account where the entry is charged',
  `accountEntryTypeId` int(11) NOT NULL COMMENT 'Account entry type',
  `entryDate` date NOT NULL COMMENT 'account entry date',
  `entryAmountDate` date NOT NULL COMMENT 'account entry amount date (fecha valor)',
  `concept` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `amount` decimal(10,2) NOT NULL COMMENT 'account entry amount',
  `observations` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `entryNumber` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `docNumber` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_accountEntry_accountId` (`accountId`),
  KEY `ndx_accountEntry_accountEntryTypeId` (`accountEntryTypeId`),
  CONSTRAINT `fk_accountEntry_accountEntryTypeId` FOREIGN KEY (`accountEntryTypeId`) REFERENCES `accountentrytype` (`id`),
  CONSTRAINT `fk_accountEntry_accountId` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='los movimientos';

CREATE TABLE `accountentrygroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Account entry group descriptive name',
  `description` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='grupos de movimiento';

CREATE TABLE `accountentrytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountEntryGroupId` int(11) NOT NULL COMMENT 'Account entry group',
  `name` varchar(256) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Account descriptive name',
  `observations` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `accountEntryTypeId` int(11) DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `customizableId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_accountEntryType_accountEntryGroupId` (`accountEntryGroupId`),
  KEY `FK_accountentrytype_accountEntryTypeId` (`accountEntryTypeId`),
  CONSTRAINT `fk_accountEntryType_accountEntryGroupId` FOREIGN KEY (`accountEntryGroupId`) REFERENCES `accountentrygroup` (`id`),
  CONSTRAINT `FK_accountentrytype_accountEntryTypeId` FOREIGN KEY (`accountEntryTypeId`) REFERENCES `accountentrytype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tipos de movimientos';

CREATE TABLE `accounttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Account type descriptive name',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='lmacenan las cuentas';

CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `startDate` datetime DEFAULT '0000-00-00 00:00:00',
  `duration` int(11) NOT NULL COMMENT 'Duración en minutos',
  `description` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `roleId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_activity_userId` (`userId`),
  KEY `fk_activity_roleId` (`roleId`),
  CONSTRAINT `fk_activity_roleId` FOREIGN KEY (`roleId`) REFERENCES `projectrole` (`id`),
  CONSTRAINT `fk_activity_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Activityes de los Users';

CREATE TABLE `activityfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `externalActivityId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `insertDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `file` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `fileMime` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activityFile_externalActivity` (`externalActivityId`),
  KEY `fk_activityFile_user` (`userId`),
  CONSTRAINT `fk_activityFile_externalActivity` FOREIGN KEY (`externalActivityId`) REFERENCES `externalactivity` (`id`),
  CONSTRAINT `fk_activityFile_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `bill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creationDate` date NOT NULL,
  `expiration` smallint(6) DEFAULT NULL,
  `paymentMode` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `state` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `number` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(4096) COLLATE utf8_spanish_ci NOT NULL,
  `file` varchar(512) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fileMime` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `observations` varchar(4096) COLLATE utf8_spanish_ci DEFAULT NULL,
  `projectId` int(11) NOT NULL DEFAULT '5' COMMENT 'project id',
  `startBillDate` date NOT NULL DEFAULT '1980-01-01',
  `endBillDate` date NOT NULL DEFAULT '1980-01-01',
  `billType` varchar(16) COLLATE utf8_spanish_ci NOT NULL DEFAULT 'ISSUED',
  `orderNumber` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contactId` int(11) DEFAULT NULL,
  `providerId` int(11) DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `bookNumber` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_bill_projectId` (`projectId`),
  KEY `ndx_bill_contactId` (`contactId`),
  KEY `ndx_bill_providerId` (`providerId`),
  CONSTRAINT `fk_bill_contactId` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `fk_bill_projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_bill_providerId` FOREIGN KEY (`providerId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `bill_accountentry` (
  `billId` int(11) NOT NULL COMMENT 'bill id',
  `accountEntryId` int(11) NOT NULL COMMENT 'account entry id',
  `observations` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`billId`,`accountEntryId`),
  KEY `ndx_bill_AccountEntry_billId` (`billId`),
  KEY `ndx_bill_AccountEntry_accountEntryId` (`accountEntryId`),
  CONSTRAINT `fk_billAccountEntry_accountEntryId` FOREIGN KEY (`accountEntryId`) REFERENCES `accountentry` (`id`),
  CONSTRAINT `fk_billAccountEntry_billId` FOREIGN KEY (`billId`) REFERENCES `bill` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='relaciona n m Facturas y movimientos';

CREATE TABLE `billbreakdown` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `billId` int(11) NOT NULL,
  `concept` varchar(4096) COLLATE utf8_spanish_ci NOT NULL,
  `units` decimal(10,2) NOT NULL DEFAULT '1.00',
  `amount` decimal(10,2) NOT NULL,
  `iva` decimal(4,2) NOT NULL DEFAULT '16.00',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_billBreakDown_bill` (`billId`),
  CONSTRAINT `fk_billBreakDown_bill` FOREIGN KEY (`billId`) REFERENCES `bill` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `book` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `author` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ISBN` varchar(13) COLLATE utf8_spanish_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `purchaseDate` datetime DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Book_userId` (`userId`),
  CONSTRAINT `FK_Book_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `bulletinboard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoryId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `creationDate` datetime NOT NULL,
  `message` varchar(2048) COLLATE utf8_spanish_ci NOT NULL,
  `title` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `documentPath` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `documentContentType` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_bulletinboard_categoryId` (`categoryId`),
  KEY `ndx_bulletinboard_userId` (`userId`),
  CONSTRAINT `fk_bulletinboard_categoryId` FOREIGN KEY (`categoryId`) REFERENCES `bulletinboardcategory` (`id`),
  CONSTRAINT `fk_bulletinboard_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='mensajes del tabln';

CREATE TABLE `bulletinboardcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='almacenan las categoras';

CREATE TABLE `collaborator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(10) DEFAULT NULL,
  `contactId` int(10) DEFAULT NULL,
  `organizationId` int(10) DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_collaborator_user` (`userId`),
  KEY `fk_collaborator_contact` (`contactId`),
  KEY `fk_collaborator_organization` (`organizationId`),
  CONSTRAINT `fk_collaborator_contact` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `fk_collaborator_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`),
  CONSTRAINT `fk_collaborator_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `commissioning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `requestDate` datetime NOT NULL,
  `name` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `scope` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `content` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `products` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `deliveryDate` datetime NOT NULL,
  `budget` decimal(10,2) DEFAULT NULL,
  `notes` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `authorSignature` tinyint(1) NOT NULL DEFAULT '0',
  `reviserSignature` tinyint(1) NOT NULL DEFAULT '0',
  `adminSignature` tinyint(1) NOT NULL DEFAULT '0',
  `justifyInformation` tinyint(1) NOT NULL DEFAULT '0',
  `developedActivities` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `difficultiesAppeared` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `results` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `conclusions` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `evaluation` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `projectId` int(10) DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commissioning_project` (`projectId`),
  CONSTRAINT `fk_commissioning_project` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `commissioning_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commissioningId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commissioning_user_commissioning` (`commissioningId`),
  KEY `fk_commissioning_user_user` (`userId`),
  CONSTRAINT `fk_commissioning_user_commissioning` FOREIGN KEY (`commissioningId`) REFERENCES `commissioning` (`id`),
  CONSTRAINT `fk_commissioning_user_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `commissioningchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `oldValue` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `newValue` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `commissioningId` int(10) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `deleteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commissioningChange_commissioning` (`commissioningId`),
  KEY `fk_commissioningChange_user` (`userId`),
  CONSTRAINT `fk_commissioningChange_commissioning` FOREIGN KEY (`commissioningId`) REFERENCES `commissioning` (`id`),
  CONSTRAINT `fk_commissioningChange_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `commissioningdelay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `originalDate` datetime NOT NULL,
  `delayedToDate` datetime NOT NULL,
  `commissioningId` int(10) DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commissioningDelay_commissioning` (`commissioningId`),
  CONSTRAINT `fk_commissioningDelay_commissioning` FOREIGN KEY (`commissioningId`) REFERENCES `commissioning` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `commissioningfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commissioningId` int(10) NOT NULL,
  `userId` int(10) NOT NULL,
  `insertDate` datetime NOT NULL,
  `updateDate` datetime DEFAULT NULL,
  `file` varchar(400) COLLATE utf8_spanish_ci NOT NULL,
  `fileMime` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commissioningFile_commissioning` (`commissioningId`),
  KEY `fk_commissioningFile_user` (`userId`),
  CONSTRAINT `fk_commissioningFile_commissioning` FOREIGN KEY (`commissioningId`) REFERENCES `commissioning` (`id`),
  CONSTRAINT `fk_commissioningFile_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `commissioningpaymentdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commissioningId` int(10) NOT NULL,
  `collaboratorId` int(11) NOT NULL,
  `paymentMode` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bankAccount` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `billNumber` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_commissioning_collaborator_commissioning` (`commissioningId`),
  KEY `fk_commissioning_collaborator_collaborator` (`collaboratorId`),
  CONSTRAINT `fk_commissioning_collaborator_collaborator` FOREIGN KEY (`collaboratorId`) REFERENCES `collaborator` (`id`),
  CONSTRAINT `fk_commissioning_collaborator_commissioning` FOREIGN KEY (`commissioningId`) REFERENCES `commissioning` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `companystate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL COMMENT 'aplicacin que manda el mail',
  `creationDate` datetime NOT NULL,
  `description` longtext COLLATE utf8_spanish_ci NOT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_companystate_userId` (`userId`),
  CONSTRAINT `fk_companystate_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='comentario del director de empresa';

CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `email2` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone2` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fax` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `postalCode` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ndx_contact_provinceId` (`provinceId`),
  CONSTRAINT `fk_contact_province` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='contactos de las Organizationes';

CREATE TABLE `contact_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contact_tag_tag` (`tagId`),
  KEY `fk_contact_tag_contact` (`contactId`),
  CONSTRAINT `fk_contact_tag_tag` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`),
  CONSTRAINT `fk_contact_tag_contact` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `contacthistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactId` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mobile` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `notified` tinyint(1) NOT NULL DEFAULT '0',
  `email2` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone2` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fax` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `postalCode` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `province` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `position` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `department` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `organization` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contacthistory_contact` (`contactId`),
  KEY `fk_contacthistory_user` (`userId`),
  CONSTRAINT `fk_contacthistory_contact` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `fk_contacthistory_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Histórico de cambios de Contactos';

CREATE TABLE `contactinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contactId` int(11) NOT NULL,
  `positionId` int(11) NOT NULL,
  `departmentId` int(10) unsigned NOT NULL,
  `organizationId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_contactinfo_contact` (`contactId`),
  KEY `fk_contactinfo_position` (`positionId`),
  KEY `fk_contactinfo_department` (`departmentId`),
  KEY `fk_contactinfo_organization` (`organizationId`),
  CONSTRAINT `fk_contactinfo_contact` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `fk_contactinfo_position` FOREIGN KEY (`positionId`) REFERENCES `position` (`id`),
  CONSTRAINT `fk_contactinfo_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_contactinfo_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `contracttype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2048) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `credittitle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `number` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `concept` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `state` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `type` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `issueDate` date NOT NULL,
  `expirationDate` date DEFAULT NULL,
  `organizationId` int(11) NOT NULL,
  `observations` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_credittitle_organizationId` (`organizationId`),
  CONSTRAINT `fk_credittitle_organizationId` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `credittitle_bill` (
  `billId` int(11) NOT NULL,
  `creditTitleId` int(11) NOT NULL,
  PRIMARY KEY (`billId`,`creditTitleId`),
  KEY `ndx_creditTitle_Bill_billId` (`billId`),
  KEY `ndx_creditTitle_Bill_creditTitleId` (`creditTitleId`),
  CONSTRAINT `fk_creditTitle_Bill_billId` FOREIGN KEY (`billId`) REFERENCES `bill` (`id`),
  CONSTRAINT `fk_creditTitle_Bill_creditTitleId` FOREIGN KEY (`creditTitleId`) REFERENCES `credittitle` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(10) unsigned DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `description` varchar(2048) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_department_department` (`parentId`),
  CONSTRAINT `fk_department_department` FOREIGN KEY (`parentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `department_organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `departmentId` int(10) unsigned NOT NULL,
  `organizationId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_organization_department` (`departmentId`),
  KEY `fk_department_organization_organization` (`organizationId`),
  CONSTRAINT `fk_department_organization_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_department_organization_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `department_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `departmentId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_department_tag_tag` (`tagId`),
  KEY `fk_department_tag_department` (`departmentId`),
  CONSTRAINT `fk_department_tag_tag` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`),
  CONSTRAINT `fk_department_tag_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creationDate` datetime DEFAULT NULL,
  `name` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `description` varchar(4096) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `documentcategory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(4096) COLLATE utf8_spanish_ci DEFAULT NULL,
  `code` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `categoryid` int(10) unsigned DEFAULT NULL,
  `documentslastupdate` datetime DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `documentcategorydoc` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `categoryid` int(10) unsigned NOT NULL,
  `documentid` int(10) unsigned NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DocumentCategorydoc_category` (`categoryid`),
  KEY `FK_DocumentCategorydoc_docu` (`documentid`),
  CONSTRAINT `FK_DocumentCategorydoc_category` FOREIGN KEY (`categoryid`) REFERENCES `documentcategory` (`id`),
  CONSTRAINT `FK_DocumentCategorydoc_docu` FOREIGN KEY (`documentid`) REFERENCES `document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `documentversion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `documentPath` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `creationDate` datetime NOT NULL,
  `version` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `documentid` int(10) unsigned NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DocumentVersion_document_id` (`documentid`),
  CONSTRAINT `FK_DocumentVersion_document_id` FOREIGN KEY (`documentid`) REFERENCES `document` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `externalactivity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `category` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `location` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `organizer` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `comments` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `documentCategoryId` int(10) unsigned DEFAULT NULL,
  `ownerId` int(10) DEFAULT NULL,
  `departmentId` int(10) DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_externalactivity_documentcategory` (`documentCategoryId`),
  CONSTRAINT `fk_externalactivity_documentcategory` FOREIGN KEY (`documentCategoryId`) REFERENCES `documentcategory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `financialratio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `ratioDate` date NOT NULL,
  `banksAccounts` decimal(10,2) NOT NULL,
  `customers` decimal(10,2) NOT NULL,
  `stocks` decimal(10,2) NOT NULL,
  `amortizations` decimal(10,2) NOT NULL,
  `infrastructures` decimal(10,2) NOT NULL,
  `shortTermLiability` decimal(10,2) NOT NULL,
  `obligationBond` decimal(10,2) NOT NULL,
  `capital` decimal(10,2) NOT NULL,
  `reserves` decimal(10,2) NOT NULL,
  `incomes` decimal(10,2) NOT NULL,
  `expenses` decimal(10,2) NOT NULL,
  `otherExploitationExpenses` decimal(10,2) NOT NULL,
  `financialExpenses` decimal(10,2) NOT NULL,
  `taxes` decimal(10,2) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Ratios financieros';

CREATE TABLE `frequency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `months` int(10) unsigned DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Frecuencia de los asientos contables';

CREATE TABLE `holiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `date` datetime NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `idea` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `creationDate` datetime NOT NULL,
  `description` varchar(2048) COLLATE utf8_spanish_ci NOT NULL,
  `cost` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `benefits` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `name` varchar(300) COLLATE utf8_spanish_ci NOT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_idea_userId` (`userId`),
  CONSTRAINT `fk_idea_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Ideas de los empleados';

CREATE TABLE `interaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL DEFAULT '5' COMMENT 'project id',
  `userId` int(11) NOT NULL DEFAULT '1' COMMENT 'user id',
  `interactionTypeId` int(11) NOT NULL DEFAULT '6' COMMENT 'type id',
  `creationDate` datetime NOT NULL,
  `interest` varchar(16) COLLATE utf8_spanish_ci NOT NULL COMMENT 'enum InteractionInterest',
  `description` varchar(2048) COLLATE utf8_spanish_ci NOT NULL,
  `file` varchar(400) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fileMime` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `offerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_interaction_projectId` (`projectId`),
  KEY `ndx_interaction_userId` (`userId`),
  KEY `ndx_interaction_interactionTypeId` (`interactionTypeId`),
  KEY `ndx_interaction_offerId` (`offerId`),
  CONSTRAINT `fk_interaction_interactionTypeId` FOREIGN KEY (`interactionTypeId`) REFERENCES `interactiontype` (`id`),
  CONSTRAINT `fk_interaction_offerId` FOREIGN KEY (`offerId`) REFERENCES `offer` (`id`),
  CONSTRAINT `fk_interaction_projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_interaction_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='contactos que se mantienen con ';

CREATE TABLE `interactiontype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Interaction type descriptive name',
  `description` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Interaction type description',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tipos de interacciones';

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buyDate` date DEFAULT NULL,
  `asignedToId` int(11) DEFAULT NULL,
  `renting` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'De renting (1) o no (0)',
  `cost` decimal(10,2) DEFAULT NULL,
  `amortizable` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Amortizable (1) o no (0)consumible',
  `serialNumber` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `type` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `provider` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `trademark` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `model` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `speed` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `storage` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ram` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `location` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `description` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_invetory_userId` (`asignedToId`),
  CONSTRAINT `fk_inventory_userId` FOREIGN KEY (`asignedToId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Inventory de mquinas';

CREATE TABLE `magazine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Magazines a las que se envan';

CREATE TABLE `objective` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `projectId` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `state` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `name` varchar(512) COLLATE utf8_spanish_ci NOT NULL,
  `log` longtext COLLATE utf8_spanish_ci,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_objective_userId` (`userId`),
  KEY `ndx_objective_projectId` (`projectId`),
  CONSTRAINT `fk_objective_projectId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_objective_userId` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Se almacenan los Objectives';

CREATE TABLE `occupation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL,
  `description` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `duration` int(11) NOT NULL COMMENT 'Duración en minutos',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_occupation_userId` (`userId`),
  KEY `ndx_occupation_projectId` (`projectId`),
  CONSTRAINT `fk_occupation_projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`),
  CONSTRAINT `fk_occupation_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Future occupations of Users';

CREATE TABLE `offer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `organizationId` int(11) NOT NULL,
  `contactId` int(11) NOT NULL,
  `creationDate` date NOT NULL,
  `validityDate` date DEFAULT NULL,
  `maturityDate` date DEFAULT NULL,
  `offerPotential` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `offerState` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `offerRejectReasonId` int(11) DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `number` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `observations` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `showIvaIntoReport` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ndx_offer_organizationId` (`organizationId`),
  KEY `ndx_offer_contactId` (`contactId`),
  KEY `ndx_offer_offerRejectReasonId` (`offerRejectReasonId`),
  KEY `ndx_offer_userId` (`userId`),
  CONSTRAINT `fk_offer_contactId` FOREIGN KEY (`contactId`) REFERENCES `contact` (`id`),
  CONSTRAINT `fk_offer_offerRejectReasonId` FOREIGN KEY (`offerRejectReasonId`) REFERENCES `offerrejectreason` (`id`),
  CONSTRAINT `fk_offer_organizationId` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`),
  CONSTRAINT `fk_offer_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Ofertas';

CREATE TABLE `offercost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offerId` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `iva` decimal(4,2) NOT NULL DEFAULT '16.00',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `units` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `fk_offerCost_offerId` (`offerId`),
  CONSTRAINT `fk_offerCost_offerId` FOREIGN KEY (`offerId`) REFERENCES `offer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `offerrejectreason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Causas rechazo de ofertas';

CREATE TABLE `offerrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `offerId` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `costPerHour` decimal(10,2) NOT NULL,
  `expectedHours` int(11) NOT NULL,
  `iva` decimal(4,2) NOT NULL DEFAULT '16.00',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_offerRole_offerId` (`offerId`),
  CONSTRAINT `fk_offerRole_offerId` FOREIGN KEY (`offerId`) REFERENCES `offer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `organization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizationTypeId` int(11) NOT NULL DEFAULT '1' COMMENT 'organization type id',
  `organizationISOCategoryId` int(11) NOT NULL DEFAULT '1' COMMENT 'iso category id',
  `name` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cif` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `street` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `number` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Building number in street',
  `locator` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Location information inside building',
  `postalCode` varchar(32) COLLATE utf8_spanish_ci DEFAULT NULL,
  `city` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provinceId` int(11) NOT NULL,
  `state` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `country` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fax` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `website` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ftpsite` varchar(256) COLLATE utf8_spanish_ci DEFAULT NULL,
  `notes` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_organization_organizationTypeId` (`organizationTypeId`),
  KEY `ndx_organization_isoOrganizationCategoryId` (`organizationISOCategoryId`),
  CONSTRAINT `fk_organization_isoOrganizationCategoryId` FOREIGN KEY (`organizationISOCategoryId`) REFERENCES `organizationisocategory` (`id`),
  CONSTRAINT `fk_organization_organizationTypeId` FOREIGN KEY (`organizationTypeId`) REFERENCES `organizationtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='los clientes';

CREATE TABLE `organization_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `organizationId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_organization_tag_tag` (`tagId`),
  KEY `fk_organization_tag_organization` (`organizationId`),
  CONSTRAINT `fk_organization_tag_tag` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`),
  CONSTRAINT `fk_organization_tag_organization` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `organizationisocategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL COMMENT 'ISO Organization Category descriptive name',
  `description` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'ISO Organization Category description',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tipos de organizaciones segun ISO';

CREATE TABLE `organizationtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL COMMENT 'Organization type descriptive name',
  `description` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Organization type description',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tipos de organizaciones';

CREATE TABLE `periodicalaccountentry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `accountId` int(11) NOT NULL COMMENT 'account where the entry is charged',
  `accountEntryTypeId` int(11) NOT NULL COMMENT 'entry type',
  `frequencyId` int(11) NOT NULL COMMENT 'entry frequency',
  `concept` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `entryDate` date NOT NULL COMMENT 'entry date',
  `amount` decimal(10,2) NOT NULL COMMENT 'entry amount',
  `rise` decimal(4,2) DEFAULT NULL COMMENT 'account entry rise',
  `observations` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_periodicalAccountEntry_accountId` (`accountId`),
  KEY `ndx_periodicalAccountEntry_accountEntryTypeId` (`accountEntryTypeId`),
  KEY `ndx_periodicalAccountEntry_frequencyId` (`frequencyId`),
  CONSTRAINT `fk_periodicalAccountEntry_accountEntryTypeId` FOREIGN KEY (`accountEntryTypeId`) REFERENCES `accountentrytype` (`id`),
  CONSTRAINT `fk_periodicalAccountEntry_accountId` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`),
  CONSTRAINT `fk_periodicalAccountEntry_frequencyId` FOREIGN KEY (`frequencyId`) REFERENCES `frequency` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='asientos contables periodicos';

CREATE TABLE `position` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `deleteDate` datetime DEFAULT NULL,
  `email` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `fax` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `address` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `postalCode` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provinceId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_position_provinceId` (`provinceId`),
  CONSTRAINT `fk_position_province` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `position_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `positionId` int(11) NOT NULL,
  `departmentId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_position_department_position` (`positionId`),
  KEY `fk_position_department_department` (`departmentId`),
  CONSTRAINT `fk_position_department_position` FOREIGN KEY (`positionId`) REFERENCES `position` (`id`),
  CONSTRAINT `fk_position_department_department` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `position_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tagId` int(11) NOT NULL,
  `positionId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_position_tag_tag` (`tagId`),
  KEY `fk_position_tag_position` (`positionId`),
  CONSTRAINT `fk_position_tag_tag` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`),
  CONSTRAINT `fk_position_tag_position` FOREIGN KEY (`positionId`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `positionchange` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `field` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `oldValue` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `newValue` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `positionId` int(10) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `deleteDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_positionChange_position` (`positionId`),
  KEY `fk_positionChange_user` (`userId`),
  CONSTRAINT `fk_positionChange_position` FOREIGN KEY (`positionId`) REFERENCES `position` (`id`),
  CONSTRAINT `fk_positionChange_user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organizationId` int(11) NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date DEFAULT NULL,
  `open` tinyint(1) DEFAULT '0',
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ndx_project_organizationId` (`organizationId`),
  CONSTRAINT `fk_project_organizationId` FOREIGN KEY (`organizationId`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Projects';

CREATE TABLE `projectcost` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `billable` tinyint(1) NOT NULL DEFAULT '1',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_projectCost_projectId` (`projectId`),
  CONSTRAINT `fk_projectCost_projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `projectrole` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `projectId` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `costPerHour` decimal(10,2) NOT NULL,
  `expectedHours` int(11) NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_projectRole_projectId` (`projectId`),
  CONSTRAINT `fk_projectRole_projectId` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `province` (
  `id` int(11) NOT NULL COMMENT 'El id no es autoincremental porque ya tienen unos códigos fijos',
  `name` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla con las Provinces';

CREATE TABLE `publication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `magazineId` int(11) NOT NULL,
  `magazineDeliveryDate` datetime DEFAULT NULL COMMENT 'Fecha de entrega a la Magazine',
  `magazinePublicationDate` date DEFAULT NULL,
  `ownPublicationDate` date DEFAULT NULL COMMENT 'Fecha de publicacin en Adictos',
  `accepted` tinyint(1) DEFAULT NULL COMMENT 'Indicador de si el Tutorial ha sido aceptado (1) o no (0)',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_publication_tutorialId` (`id`),
  KEY `fk_publication_magazineId` (`magazineId`),
  CONSTRAINT `fk_publicacion_tutorialId` FOREIGN KEY (`id`) REFERENCES `tutorial` (`id`),
  CONSTRAINT `fk_publication_magazineId` FOREIGN KEY (`magazineId`) REFERENCES `magazine` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='publicaciones de tutoriales';

CREATE TABLE `requestholiday` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `beginDate` datetime NOT NULL,
  `finalDate` datetime NOT NULL,
  `state` varchar(16) COLLATE utf8_spanish_ci NOT NULL,
  `userId` int(11) NOT NULL,
  `observations` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `userComment` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `chargeYear` date NOT NULL DEFAULT '2007-01-01',
  PRIMARY KEY (`id`),
  KEY `fk_requestHoliday_userId` (`userId`),
  CONSTRAINT `fk_requestHoliday_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Roles de la aplicacin';

CREATE TABLE `setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `name` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `value` varchar(4096) COLLATE utf8_spanish_ci DEFAULT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='User settings';

CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `maxDeliveryDate` datetime NOT NULL,
  `endDate` datetime DEFAULT NULL COMMENT 'Fecha de finalizacin del Tutorial',
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_tutorial_userId` (`userId`),
  CONSTRAINT `fk_tutorial_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tutoriales que son enviado a la';

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `roleId` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'User activo',
  `name` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `nif` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `birthDate` date DEFAULT NULL,
  `academicQualification` varchar(200) COLLATE utf8_spanish_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `mobile` varchar(12) COLLATE utf8_spanish_ci DEFAULT NULL,
  `street` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `postalCode` varchar(5) COLLATE utf8_spanish_ci DEFAULT NULL,
  `provinceId` int(11) DEFAULT NULL,
  `married` tinyint(1) NOT NULL COMMENT 'Casado (1) o no (0)',
  `childrenNumber` tinyint(4) NOT NULL,
  `drivenLicenseType` varchar(10) COLLATE utf8_spanish_ci DEFAULT NULL,
  `vehicleType` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `licensePlate` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `startDate` date NOT NULL COMMENT 'fecha de alta en la empresa',
  `categoryId` int(11) NOT NULL,
  `socialSecurityNumber` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `bank` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `account` varchar(34) COLLATE utf8_spanish_ci DEFAULT NULL,
  `travelAvailability` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL COMMENT 'Disponibilidad para viajar',
  `workingInClient` tinyint(1) NOT NULL COMMENT 'Si esta tabajando en el cliente',
  `email` varchar(128) COLLATE utf8_spanish_ci DEFAULT NULL,
  `genre` varchar(16) COLLATE utf8_spanish_ci DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `salaryExtras` decimal(10,2) DEFAULT NULL,
  `documentCategoryId` int(10) unsigned DEFAULT NULL,
  `securityCard` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `healthInsurance` varchar(64) COLLATE utf8_spanish_ci DEFAULT NULL,
  `notes` varchar(1024) COLLATE utf8_spanish_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8_spanish_ci DEFAULT NULL,
  `endTestPeriodDate` date DEFAULT NULL,
  `endContractDate` date DEFAULT NULL,
  `departmentId` int(10) unsigned NOT NULL DEFAULT '1',
  `contractTypeId` int(10) unsigned DEFAULT NULL,
  `contractObservations` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `dayDuration` int(11) DEFAULT NULL,
  `agreementId` int(11) NOT NULL DEFAULT '1',
  `agreementYearDuration` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ndx_user_roleId` (`roleId`),
  KEY `ndx_user_provinceId` (`provinceId`),
  KEY `ndx_user_categoryId` (`categoryId`),
  KEY `ndx_user_documentCategoryId` (`documentCategoryId`),
  KEY `ndx_user_departmentId` (`departmentId`),
  KEY `ndx_user_contractTypeId` (`contractTypeId`),
  KEY `ndx_user_agreementId` (`agreementId`),
  CONSTRAINT `fk_user_agreementId` FOREIGN KEY (`agreementId`) REFERENCES `workingagreement` (`id`),
  CONSTRAINT `fk_user_categoryId` FOREIGN KEY (`categoryId`) REFERENCES `usercategory` (`id`),
  CONSTRAINT `fk_user_contractTypeId` FOREIGN KEY (`contractTypeId`) REFERENCES `contracttype` (`id`),
  CONSTRAINT `fk_user_departmentId` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `fk_user_documentCategoryId` FOREIGN KEY (`documentCategoryId`) REFERENCES `documentcategory` (`id`),
  CONSTRAINT `fk_user_provinceId` FOREIGN KEY (`provinceId`) REFERENCES `province` (`id`),
  CONSTRAINT `fk_user_roleId` FOREIGN KEY (`roleId`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Users de la aplicacin';

CREATE TABLE `usercategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_spanish_ci NOT NULL,
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Se almacenan las categorias';

CREATE TABLE `version` (
  `version` varchar(32) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='version de la base de datos';

CREATE TABLE `workingagreement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_spanish_ci NOT NULL,
  `description` varchar(2048) COLLATE utf8_spanish_ci DEFAULT NULL,
  `holidays` int(11) NOT NULL DEFAULT '22',
  `ownerId` int(11) DEFAULT NULL,
  `departmentId` int(10) unsigned DEFAULT NULL,
  `insertDate` datetime DEFAULT NULL,
  `updateDate` datetime DEFAULT NULL,
  `yearDuration` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Convenios laborales';

