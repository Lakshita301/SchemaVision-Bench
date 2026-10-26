-- Source: https://github.com/vitaradiuk/kretkom.atliekos/blob/7b38bd60f32c1a2d77adc017a218afd13f588cb3/target/atliekos_Api/WEB-INF/classes/atlieku_db.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 2

CREATE TABLE `street`(
`id` int(10) NOT NULL AUTO_INCREMENT,
`street_name` varchar(50) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `waste`(
`id` int(10) NOT NULL AUTO_INCREMENT,
`waste_name` varchar(50) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wastecollection`(
`id` int(10) NOT NULL AUTO_INCREMENT,
`street_id` int(10) NOT NULL,
`waste_id` int(10) NOT NULL,
`wasteCollect_date` varchar(19) NOT NULL,
PRIMARY KEY (`id`), FOREIGN KEY (`street_id`) REFERENCES `street` (`id`), FOREIGN KEY (`waste_id`) REFERENCES `waste` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

