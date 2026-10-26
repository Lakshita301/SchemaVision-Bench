-- Source: https://github.com/Istoleyourfrogs/walk-a-dog/blob/71251970f0cf1d861b23143736e11fc87798260d/files/spolnici_walkadog.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 2

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `breeds` (
  `breed_id` int(11) NOT NULL,
  `breed` varchar(60) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

CREATE TABLE `dogs` (
  `dog_id` int(11) NOT NULL,
  `owner_fk` int(11) NOT NULL,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `age` int(3) NOT NULL,
  `breed` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `vaccinated` tinyint(1) DEFAULT '0',
  `trained` tinyint(1) DEFAULT '0',
  `aggression` tinyint(1) DEFAULT '0',
  `other` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `newsletter` (
  `id` int(11) NOT NULL,
  `mail` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `hashedMail` varchar(60) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `code_fk` char(10) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `hashed_email` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `review_code` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `verification_code` char(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `walks` (
  `walk_id` int(11) NOT NULL,
  `user_fk` int(11) NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `one_time_walk` datetime DEFAULT NULL,
  `weekly_walk_day` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weekly_walk_time` time DEFAULT NULL,
  `daily_walk_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `dogs`
  ADD CONSTRAINT `user-dog` FOREIGN KEY (`owner_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `walks`
  ADD CONSTRAINT `walks-user_constraint` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

