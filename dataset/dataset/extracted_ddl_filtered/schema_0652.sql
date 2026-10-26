-- Source: https://github.com/xanderodempsey/IFB299ToDoBrisbane/blob/77df3ce7653c84e38771b9748525701a4a76ed0c/SmartCity/SmartCity/SmartCity.sql?raw=true
-- Tables detected: 28 | FK/REFERENCES mentions: 20

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `city` (
  `CITY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cityinformation_mall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `address` longtext NOT NULL,
  `phone` longtext NOT NULL,
  `emailAddress` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `cityinformation_museum` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `address` longtext NOT NULL,
  `phone` longtext NOT NULL,
  `emailAddress` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cityinformation_park` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `address` longtext NOT NULL,
  `phone` longtext NOT NULL,
  `emailAddress` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cityinformation_restaurant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `address` longtext NOT NULL,
  `phone` longtext NOT NULL,
  `emailAddress` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cityinformation_zoo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `address` longtext NOT NULL,
  `phone` longtext NOT NULL,
  `emailAddress` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `colleges` (
  `COLLEGE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) DEFAULT NULL,
  `COLLEGE_NAME` varchar(50) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `SUBURB` varchar(50) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`COLLEGE_ID`),
  KEY `CITY_ID` (`CITY_ID`),
  CONSTRAINT `colleges_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `departments` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `COLLEGE_ID` int(11) DEFAULT NULL,
  `DEPARTMENT_NAME` varchar(50) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `COLLEGE_ID` (`COLLEGE_ID`),
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`COLLEGE_ID`) REFERENCES `colleges` (`COLLEGE_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `industry` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) DEFAULT NULL,
  `BUSINESS_NAME` varchar(50) DEFAULT NULL,
  `INDUSTRY_TYPE` int(11) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `SUBURB` varchar(50) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `CITY_ID` (`CITY_ID`),
  KEY `INDUSTRY_TYPE` (`INDUSTRY_TYPE`),
  CONSTRAINT `industry_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON UPDATE CASCADE,
  CONSTRAINT `industry_ibfk_2` FOREIGN KEY (`INDUSTRY_TYPE`) REFERENCES `industrytype` (`INDUSTRY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `industrytype` (
  `INDUSTRY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `INDUSTRY_NAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`INDUSTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `libraries` (
  `LIBRARY_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `SUBURB` varchar(50) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`LIBRARY_ID`),
  KEY `CITY_ID` (`CITY_ID`),
  CONSTRAINT `libraries_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `malls` (
  `MALL_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `SUBURB` varchar(50) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`MALL_ID`),
  KEY `CITY_ID` (`CITY_ID`),
  CONSTRAINT `malls_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `museums` (
  `MUSEUM_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) DEFAULT NULL,
  `MUSEUM_NAME` varchar(50) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `SUBURB` varchar(50) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`MUSEUM_ID`),
  KEY `CITY_ID` (`CITY_ID`),
  CONSTRAINT `museums_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `park` (
  `PARK_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) DEFAULT NULL,
  `PARK_NAME` varchar(50) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `SUBURB` varchar(50) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  PRIMARY KEY (`PARK_ID`),
  KEY `CITY_ID` (`CITY_ID`),
  CONSTRAINT `park_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `restaurant` (
  `RESTAURANT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) DEFAULT NULL,
  `RESTAURANT_NAME` varchar(50) DEFAULT NULL,
  `CUISINE` varchar(20) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `SUBURB` varchar(50) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`RESTAURANT_ID`),
  KEY `CITY_ID` (`CITY_ID`),
  CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_type` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_userprofile_user_id_87251ef1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

CREATE TABLE `usertype` (
  `TYPE_ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE_NAME` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `zoo` (
  `ZOO_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CITY_ID` int(11) DEFAULT NULL,
  `ZOO_NAME` varchar(50) DEFAULT NULL,
  `STREET` varchar(50) DEFAULT NULL,
  `SUBURB` varchar(50) DEFAULT NULL,
  `POSTCODE` int(11) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `PHONE_NUMBER` int(11) DEFAULT NULL,
  PRIMARY KEY (`ZOO_ID`),
  KEY `CITY_ID` (`CITY_ID`),
  CONSTRAINT `zoo_ibfk_1` FOREIGN KEY (`CITY_ID`) REFERENCES `city` (`CITY_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

