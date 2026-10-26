-- Source: https://github.com/etasdemir/BBM382-Prudentia-Project/blob/bc1b1027de19ea53bdcc65d544c6e63934e84ed6/database/A90463024BAFA3F53E5B366F8DFDDCF6.sql?raw=true
-- Tables detected: 12 | FK constraints: 11

CREATE TABLE `bucket` (
  `id` int(11) NOT NULL,
  `user_email` varchar(255) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id`,`user_email`),
  KEY `user_email` (`user_email`),
  CONSTRAINT `bucket_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `cc` (
  `user_email` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `bucket_id` int(11) NOT NULL,
  `card_num` int(11) DEFAULT NULL,
  `cvc` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_email`,`bucket_id`),
  CONSTRAINT `cc_ibfk_1` FOREIGN KEY (`user_email`, `bucket_id`) REFERENCES `payment` (`user_email`, `bucket_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `has_addresses` (
  `user_email` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `address` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`user_email`,`id`),
  CONSTRAINT `has_addresses_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `includes_bucket` (
  `user_email` varchar(255) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  `bucket_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `product_printer` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `product_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `product_volume` int(11) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  PRIMARY KEY (`user_email`,`bucket_id`,`product_name`,`product_printer`,`product_author`,`product_volume`),
  KEY `product_name` (`product_name`,`product_printer`,`product_author`,`product_volume`),
  CONSTRAINT `includes_bucket_ibfk_1` FOREIGN KEY (`user_email`, `bucket_id`) REFERENCES `bucket` (`user_email`, `id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `includes_bucket_ibfk_2` FOREIGN KEY (`product_name`, `product_printer`, `product_author`, `product_volume`) REFERENCES `product` (`name`, `printer`, `writter`, `volume`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `logdb` (
  `user_email` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`user_email`,`date`),
  CONSTRAINT `logdb_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `payment` (
  `user_email` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `bucket_id` int(11) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `payment_time` time DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `address_id` int(11) NOT NULL,
  `stat_time` date DEFAULT NULL,
  `firm_code` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `stat` varchar(100) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`user_email`,`bucket_id`),
  CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_email`, `bucket_id`) REFERENCES `bucket` (`user_email`, `id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `pp` (
  `user_email` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `bucket_id` int(11) NOT NULL,
  `acc_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_email`,`bucket_id`),
  CONSTRAINT `pp_ibfk_1` FOREIGN KEY (`user_email`, `bucket_id`) REFERENCES `payment` (`user_email`, `bucket_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `product` (
  `name` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `printer` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `writter` varchar(255) COLLATE utf8_turkish_ci NOT NULL,
  `volume` int(11) NOT NULL,
  `brief` varchar(1000) CHARACTER SET latin1 COLLATE latin1_general_cs DEFAULT NULL,
  `product_pic` longblob,
  `cat_id` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`,`printer`,`writter`,`volume`),
  KEY `cat_id` (`cat_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

CREATE TABLE `rate` (
  `user_email` varchar(255) COLLATE latin1_general_cs NOT NULL DEFAULT '',
  `bucket_id` int(11) NOT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `product_printer` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `product_author` varchar(255) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `product_volume` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `explanation` varchar(500) COLLATE latin1_general_cs DEFAULT NULL,
  PRIMARY KEY (`user_email`,`bucket_id`,`product_name`,`product_printer`,`product_author`,`product_volume`),
  KEY `product_name` (`product_name`,`product_printer`,`product_author`,`product_volume`),
  CONSTRAINT `rate_ibfk_1` FOREIGN KEY (`user_email`, `bucket_id`) REFERENCES `bucket` (`user_email`, `id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rate_ibfk_2` FOREIGN KEY (`product_name`, `product_printer`, `product_author`, `product_volume`) REFERENCES `product` (`name`, `printer`, `writter`, `volume`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

CREATE TABLE `user` (
  `email` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `password` varchar(255) COLLATE latin1_general_cs NOT NULL,
  `name` varchar(255) COLLATE latin1_general_cs DEFAULT NULL,
  `gender` tinyint(4) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone_first3` int(11) DEFAULT NULL,
  `phone_rest` int(11) DEFAULT NULL,
  `profil_pic` longblob,
  `is_admin` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

