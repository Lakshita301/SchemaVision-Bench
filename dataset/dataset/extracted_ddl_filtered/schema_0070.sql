-- Source: https://github.com/ivanszl/tadashigallery/blob/02a9f5bffe9ad539ce02b986b72e8510c8695a18/data/table.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2

CREATE TABLE `folders` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `folder_name` varchar(30) NOT NULL,
  `parent_id` mediumint(8) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `files` (
  `file_id` char(32) NOT NULL,
  `title` varchar(60) NOT NULL,
  `file_ext` varchar(5) NOT NULL,
  `file_path` char(38) NOT NULL,
  `file_size` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `folder_files` (
  `folder_id` mediumint(8) unsigned NOT NULL,
  `file_id` char(32) NOT NULL,
  PRIMARY KEY (`folder_id`,`file_id`),
  KEY `file_fk` (`file_id`),
  CONSTRAINT `file_fk` FOREIGN KEY (`file_id`) REFERENCES `files` (`file_id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `folder_fk` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `access_token` (
  `access_key` CHAR(8) NOT NULL,
  `access_secret` CHAR(32) NOT NULL,
  `description` VARCHAR(255) DEFAULT '',
  PRIMARY KEY (`access_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

