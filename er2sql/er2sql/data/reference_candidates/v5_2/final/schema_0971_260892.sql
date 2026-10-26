-- Source: https://github.com/kkapka/ProjektPAI/blob/4485e443e6d2c4c265528d73a4c22c5eec760419/online_classifieds.sql?raw=true
-- Tables detected: 14 | FK constraints: 11

CREATE TABLE `ad` (
  `id_ad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_ad` varchar(50) NOT NULL,
  `description_ad` text NOT NULL,
  `view_counter_ad` int(10) unsigned NOT NULL,
  `author_ad` int(10) unsigned NOT NULL,
  `category_ad` int(10) unsigned NOT NULL,
  `location_ad` int(10) unsigned NOT NULL,
  `datetime_add_ad` datetime NOT NULL,
  `datetime_end_ad` datetime NOT NULL,
  `price_ad` decimal(10,0) unsigned NOT NULL,
  PRIMARY KEY (`id_ad`),
  KEY `author_ad_FK` (`author_ad`),
  KEY `location_ad_FK` (`location_ad`),
  KEY `category_ad_FK` (`category_ad`),
  CONSTRAINT `author_ad_FK` FOREIGN KEY (`author_ad`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `category_ad_FK` FOREIGN KEY (`category_ad`) REFERENCES `category` (`id_category`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `location_ad_FK` FOREIGN KEY (`location_ad`) REFERENCES `location` (`id_location`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8;

CREATE TABLE `address` (
  `id_address` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_address` int(10) unsigned NOT NULL,
  `street_address` varchar(100) NOT NULL,
  `street_number_address` varchar(10) NOT NULL,
  PRIMARY KEY (`id_address`),
  KEY `location_address_FK` (`location_address`),
  CONSTRAINT `location_address_FK` FOREIGN KEY (`location_address`) REFERENCES `location` (`id_location`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

CREATE TABLE `ad_archive` (
  `id_ad_archive` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_ad_archive` varchar(50) NOT NULL,
  `description_ad_archive` text NOT NULL,
  `view_counter_ad_archive` int(10) unsigned NOT NULL,
  `author_ad_archive` int(10) unsigned NOT NULL,
  `category_ad_archive` int(10) unsigned NOT NULL,
  `location_ad_archive` int(10) unsigned NOT NULL,
  `datetime_add_ad_archive` datetime NOT NULL,
  `datetime_end_ad_archive` datetime NOT NULL,
  `price_ad_archive` decimal(10,0) unsigned NOT NULL,
  `id_ad_ad_archive` int(10) unsigned NOT NULL,
  `operation_date_ad_archive` datetime NOT NULL,
  `operation_type_ad_archive` char(1) NOT NULL,
  PRIMARY KEY (`id_ad_archive`)
) ENGINE=InnoDB AUTO_INCREMENT=822 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (id_ad_archive)
(PARTITION p0 VALUES LESS THAN (10000) ENGINE = InnoDB) */;

CREATE TABLE `category` (
  `id_category` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_category` int(10) unsigned NOT NULL DEFAULT '0',
  `name_category` varchar(100) NOT NULL,
  PRIMARY KEY (`id_category`),
  KEY `parent_category_FK` (`parent_category`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

CREATE TABLE `county` (
  `id_county` int(10) unsigned NOT NULL,
  `name_county` varchar(50) NOT NULL,
  PRIMARY KEY (`id_county`),
  KEY `id_county` (`id_county`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gallery` (
  `id_ad_gallery` int(10) unsigned NOT NULL,
  `id_photo_gallery` int(10) unsigned NOT NULL,
  KEY `id_ad_gallery_FK` (`id_ad_gallery`),
  KEY `id_photo_gallery_FK` (`id_photo_gallery`),
  CONSTRAINT `id_photo_gallery_FK` FOREIGN KEY (`id_photo_gallery`) REFERENCES `photo` (`id_photo`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gender` (
  `id_gender` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_gender` varchar(50) NOT NULL,
  PRIMARY KEY (`id_gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `location` (
  `id_location` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_location` varchar(50) NOT NULL,
  `id_voivodeship_location` int(10) unsigned NOT NULL,
  `id_county_location` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_location`),
  KEY `id_voivodeship_location` (`id_voivodeship_location`),
  KEY `id_county_location` (`id_county_location`),
  CONSTRAINT `location_ibfk_1` FOREIGN KEY (`id_voivodeship_location`) REFERENCES `voivodeship` (`id_voivodeship`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `location_ibfk_2` FOREIGN KEY (`id_county_location`) REFERENCES `county` (`id_county`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=920 DEFAULT CHARSET=utf8;

CREATE TABLE `photo` (
  `id_photo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_photo` varchar(2083) NOT NULL,
  PRIMARY KEY (`id_photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `session` (
  `id_session` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user_session` int(10) unsigned NOT NULL,
  `token_session` varchar(255) NOT NULL,
  `ip_user_session` varchar(39) DEFAULT NULL,
  `user_web_browser_session` varchar(255) DEFAULT NULL,
  `login_time_session` datetime DEFAULT NULL,
  PRIMARY KEY (`id_session`),
  KEY `id_user_session_FK` (`id_user_session`),
  CONSTRAINT `id_user_session_FK` FOREIGN KEY (`id_user_session`) REFERENCES `user` (`id_user`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password_user` varchar(255) NOT NULL,
  `mail_user` varchar(255) NOT NULL,
  `type_user` int(10) unsigned NOT NULL,
  `name_user` varchar(100) NOT NULL,
  `surname_user` varchar(100) NOT NULL,
  `gender_user` int(10) unsigned NOT NULL,
  `telephone_number_user` int(10) unsigned NOT NULL,
  `address_user` int(10) unsigned NOT NULL,
  `register_datetime_user` datetime NOT NULL,
  `lock_user` enum('no','yes') NOT NULL DEFAULT 'no',
  `salt_user` varchar(255) NOT NULL,
  `first_failed_login_user` datetime DEFAULT NULL,
  `failed_login_count_user` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `login_user_UK` (`login_user`) USING BTREE,
  UNIQUE KEY `mail_user_UK` (`mail_user`) USING BTREE,
  KEY `gender_user_FK` (`gender_user`),
  KEY `type_user_FK` (`type_user`),
  KEY `address_user_FK` (`address_user`),
  CONSTRAINT `address_user_FK` FOREIGN KEY (`address_user`) REFERENCES `address` (`id_address`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `gender_user_FK` FOREIGN KEY (`gender_user`) REFERENCES `gender` (`id_gender`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `type_user_FK` FOREIGN KEY (`type_user`) REFERENCES `user_type` (`id_user_type`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

CREATE TABLE `user_archive` (
  `id_user_archive` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `login_user_archive` varchar(255) NOT NULL,
  `password_user_archive` varchar(255) NOT NULL,
  `mail_user_archive` varchar(255) NOT NULL,
  `type_user_archive` int(10) unsigned NOT NULL,
  `name_user_archive` varchar(100) NOT NULL,
  `surname_user_archive` varchar(100) NOT NULL,
  `gender_user_archive` int(10) unsigned NOT NULL,
  `telephone_number_user_archive` int(10) unsigned DEFAULT NULL,
  `address_user_archive` int(10) unsigned NOT NULL,
  `register_datetime_user_archive` datetime NOT NULL,
  `lock_user_archive` enum('no','yes') NOT NULL DEFAULT 'no',
  `id_user_user_archive` int(10) unsigned NOT NULL,
  `type_operation_user_archive` char(1) NOT NULL,
  `operation_date_user_archive` datetime NOT NULL,
  PRIMARY KEY (`id_user_archive`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8
/*!50100 PARTITION BY RANGE (id_user_archive)
(PARTITION p0 VALUES LESS THAN (10000) ENGINE = InnoDB,
 PARTITION p1 VALUES LESS THAN (20000) ENGINE = InnoDB) */;

CREATE TABLE `user_type` (
  `id_user_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_user_type` varchar(50) NOT NULL,
  `permission_user_type` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_user_type`),
  KEY `permission_FK` (`permission_user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `voivodeship` (
  `id_voivodeship` int(10) unsigned NOT NULL,
  `name_voivodeship` varchar(50) NOT NULL,
  PRIMARY KEY (`id_voivodeship`),
  KEY `id_voivodeship` (`id_voivodeship`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

