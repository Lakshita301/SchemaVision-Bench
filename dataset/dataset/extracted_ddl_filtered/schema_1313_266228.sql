-- Source: https://github.com/FlyingIsland/e-Arth-Solutions/blob/2565c6d98b7c44c09dfedc398964cef227f3b1b6/S-006_TxnImp/sql/schema.sql?raw=true
-- Tables detected: 4 | FK constraints: 2

CREATE TABLE `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `number` int(10) unsigned NOT NULL,
  `bank` int(10) unsigned NOT NULL,
  `type` varchar(64) NOT NULL,
  `currency` varchar(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `number_UNIQUE` (`number`),
  KEY `bank_idx` (`bank`),
  CONSTRAINT `account_bank` FOREIGN KEY (`bank`) REFERENCES `bank` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `bank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(127) NOT NULL,
  `shortname` varchar(31) NOT NULL,
  `website` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`shortname`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `website_UNIQUE` (`shortname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `transaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(10) unsigned NOT NULL,
  `date` datetime NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `unique_index` (`account`,`date`,`amount`,`description`),
  KEY `transaction_account_idx` (`account`),
  CONSTRAINT `transaction_account` FOREIGN KEY (`account`) REFERENCES `account` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `company` (
  `cik` varchar(50) DEFAULT NULL,
  `name` varchar(300) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `sic` varchar(5) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `asin` (`cik`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

