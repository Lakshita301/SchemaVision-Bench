-- Source: https://github.com/ldzandsmile/cosmetic/blob/48929f1a37dd3a24d4cc38ab29083948cd6bd5eb/cosmetics.sql?raw=true
-- Tables detected: 15 | FK/REFERENCES mentions: 15

CREATE TABLE `comment_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `like_number` int(11) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `cosmetics_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqpe59eiwk5vfiyysau6pa35b4` (`user_id`),
  KEY `FKdjdgn817tfv0oq3e74kjx02i` (`cosmetics_id`),
  CONSTRAINT `FKdjdgn817tfv0oq3e74kjx02i` FOREIGN KEY (`cosmetics_id`) REFERENCES `cosmetic_cosmetics` (`id`),
  CONSTRAINT `FKqpe59eiwk5vfiyysau6pa35b4` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `comment_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKls2bhol2proluapdv6ad68j2u` (`comment_id`),
  CONSTRAINT `FKls2bhol2proluapdv6ad68j2u` FOREIGN KEY (`comment_id`) REFERENCES `comment_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `comment_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `comment_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3kq8l6gw8ur80mdu7kp0dfu8j` (`comment_id`),
  CONSTRAINT `FK3kq8l6gw8ur80mdu7kp0dfu8j` FOREIGN KEY (`comment_id`) REFERENCES `comment_comment` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `cosmetic_cosmetics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `describes` varchar(500) DEFAULT NULL,
  `is_recommend` tinyint(1) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `function_id` bigint(20) DEFAULT NULL,
  `result_id` bigint(20) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8cdagkxvkm3a14im5m5cjcitf` (`type_id`),
  KEY `FKqyha8ik09eefvu1rt9lxksq6b` (`function_id`),
  KEY `FKsfn1jv8w15vuxfmqnc8tfu4od` (`result_id`),
  CONSTRAINT `FK8cdagkxvkm3a14im5m5cjcitf` FOREIGN KEY (`type_id`) REFERENCES `cosmetic_type` (`id`),
  CONSTRAINT `FKqyha8ik09eefvu1rt9lxksq6b` FOREIGN KEY (`function_id`) REFERENCES `cosmetic_functions` (`id`),
  CONSTRAINT `FKsfn1jv8w15vuxfmqnc8tfu4od` FOREIGN KEY (`result_id`) REFERENCES `test_result` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `cosmetic_functions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `functions` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `cosmetic_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `path` varchar(100) DEFAULT NULL,
  `cosmetics_id` bigint(20) DEFAULT NULL,
  `is_cosmeticImage` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKa5y4o1sgu29bh2h9yweee4bd7` (`cosmetics_id`),
  CONSTRAINT `FKa5y4o1sgu29bh2h9yweee4bd7` FOREIGN KEY (`cosmetics_id`) REFERENCES `cosmetic_cosmetics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

CREATE TABLE `cosmetic_like` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_like` bit(1) DEFAULT NULL,
  `cosmetics_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2f87wleq3lu3xnb6163kx550t` (`cosmetics_id`),
  KEY `FKpo5qa2q48r224l4gxxqtr35lx` (`user_id`),
  CONSTRAINT `FK2f87wleq3lu3xnb6163kx550t` FOREIGN KEY (`cosmetics_id`) REFERENCES `cosmetic_cosmetics` (`id`),
  CONSTRAINT `FKpo5qa2q48r224l4gxxqtr35lx` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

CREATE TABLE `cosmetic_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `test_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `answer` varchar(100) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `problem_id` bigint(20) DEFAULT NULL,
  `options` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKiyt91473l3au6y0sxg39pb7jt` (`problem_id`),
  CONSTRAINT `FKiyt91473l3au6y0sxg39pb7jt` FOREIGN KEY (`problem_id`) REFERENCES `test_problem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

CREATE TABLE `test_number` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `describes` varchar(500) DEFAULT NULL,
  `is_show` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `test_problem` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `problem` varchar(500) DEFAULT NULL,
  `type` varchar(8) DEFAULT NULL,
  `number_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK361a2d05nbmpdgin5hawbvogo` (`number_id`),
  CONSTRAINT `FK361a2d05nbmpdgin5hawbvogo` FOREIGN KEY (`number_id`) REFERENCES `test_number` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `test_result` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `highest_score` int(11) DEFAULT NULL,
  `minimum_score` int(11) DEFAULT NULL,
  `answer` varchar(500) DEFAULT NULL,
  `proposal` varchar(1000) DEFAULT NULL,
  `number_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKigqodf3hc28mq6d8tke3pumso` (`number_id`),
  CONSTRAINT `FKigqodf3hc28mq6d8tke3pumso` FOREIGN KEY (`number_id`) REFERENCES `test_number` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE `user_collection` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note_title` varchar(20) DEFAULT NULL,
  `note_author` varchar(16) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKnm4vrkloci6cw40kqninw3t4k` (`user_id`),
  CONSTRAINT `FKnm4vrkloci6cw40kqninw3t4k` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `user_note` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) DEFAULT NULL,
  `type` varchar(5) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK14w14odrxunb7g781c293ta3h` (`user_id`),
  CONSTRAINT `FK14w14odrxunb7g781c293ta3h` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `user_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(16) DEFAULT NULL,
  `password` varchar(16) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL,
  `nickname` varchar(16) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `eamil` varchar(30) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

