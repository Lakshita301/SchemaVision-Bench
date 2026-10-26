-- Source: https://github.com/jjzhang166/Mini-SmartHome/blob/8226871d0ba60d58aa006c08cc2b3c000d96ab87/smarthome.sql?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 9

CREATE TABLE `tb_datapoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `tb_datapoint_ibfk_1` FOREIGN KEY (`sensor_id`) REFERENCES `tb_sensor` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_datapoint_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `tb_datapoint_general_ibfk_1` FOREIGN KEY (`sensor_id`) REFERENCES `tb_sensor` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_datapoint_lite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `tb_datapoint_lite_ibfk_1` FOREIGN KEY (`sensor_id`) REFERENCES `tb_sensor` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1052 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_datapoint_number` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sensor_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `value` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sensor_id` (`sensor_id`),
  CONSTRAINT `tb_datapoint_number_ibfk_1` FOREIGN KEY (`sensor_id`) REFERENCES `tb_sensor` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_datapoint_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dp_id` int(11) NOT NULL,
  `key` varchar(30) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dp_id` (`dp_id`),
  CONSTRAINT `tb_datapoint_value_ibfk_1` FOREIGN KEY (`dp_id`) REFERENCES `tb_datapoint` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tags` varchar(50) DEFAULT NULL,
  `about` varchar(200) DEFAULT NULL,
  `locate` varchar(50) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` int(11) DEFAULT '0',
  `last_active` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tb_device_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10020 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_sensor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `type` int(11) NOT NULL,
  `tags` varchar(50) DEFAULT NULL,
  `about` varchar(200) DEFAULT NULL,
  `device_id` int(11) NOT NULL,
  `last_update` int(11) DEFAULT '0',
  `last_data` varchar(100) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `device_id` (`device_id`),
  KEY `type` (`type`),
  CONSTRAINT `tb_sensor_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `tb_device` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `tb_sensor_ibfk_2` FOREIGN KEY (`type`) REFERENCES `tb_sensor_type` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100015 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_sensor_type` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `token` varchar(50) NOT NULL,
  `token_exptime` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `regtime` int(11) NOT NULL,
  `apikey` varchar(100) NOT NULL,
  `about` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_name` (`username`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

CREATE TABLE `tb_user_token` (
  `user_id` int(11) NOT NULL,
  `token` varchar(50) NOT NULL,
  `deadline` int(11) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `access_token` (`token`),
  CONSTRAINT `tb_user_token_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

