-- Source: https://github.com/cjszk/wholesale-inventory/blob/0c3b025a2ced99f4d2450dcf2e9e6f372669b747/sample_database_ddq_file.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 3

CREATE TABLE `bsg_cert` (
  `certification_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`certification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `bsg_cert_people` (
  `cid` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  `certification_date` date NOT NULL,
  PRIMARY KEY (`cid`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `bsg_cert_people_ibfk_1` FOREIGN KEY (`cid`) REFERENCES `bsg_cert` (`certification_id`),
  CONSTRAINT `bsg_cert_people_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `bsg_people` (`character_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `bsg_people` (
  `character_id` int(11) NOT NULL AUTO_INCREMENT,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `homeworld` int(11) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `race` varchar(5) NOT NULL DEFAULT 'Human',
  PRIMARY KEY (`character_id`),
  KEY `homeworld` (`homeworld`),
  CONSTRAINT `bsg_people_ibfk_1` FOREIGN KEY (`homeworld`) REFERENCES `bsg_planets` (`planet_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;

CREATE TABLE `bsg_planets` (
  `planet_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `population` bigint(20) DEFAULT NULL,
  `language` varchar(255) DEFAULT NULL,
  `capital` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`planet_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

CREATE TABLE `bsg_spaceship` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `seperate_saucer_section` bit(1) DEFAULT b'0',
  `length` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

