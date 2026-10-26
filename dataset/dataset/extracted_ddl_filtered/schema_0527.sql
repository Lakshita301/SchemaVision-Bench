-- Source: https://github.com/Cafe-Variome/CafeVariome/blob/890471a9c74bdc825749aa51f866ea60b1740588/Install/MySql/cafevariome.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 10

CREATE TABLE `eavs` (
  `id` int(15) NOT NULL,
  `uid` char(36) NOT NULL,
  `source_id` int(11) NOT NULL,
  `fileName` mediumint(8) UNSIGNED NOT NULL,
  `subject_id` varchar(36) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` varchar(200) DEFAULT NULL,
  `elastic` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `url` varchar(256) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `networks` (
  `network_key` int(11) NOT NULL,
  `network_name` mediumtext NOT NULL,
  `network_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `network_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  `network_key` int(11) NOT NULL,
  `group_type` varchar(50) NOT NULL,
  `url` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `network_groups_sources` (
  `id` int(11) UNSIGNED NOT NULL,
  `source_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `installation_key` varchar(32) CHARACTER SET latin1 NOT NULL,
  `network_key` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `network_requests` (
  `id` int(10) NOT NULL,
  `network_key` int(11) NOT NULL,
  `installation_key` varchar(100) NOT NULL,
  `url` mediumtext NOT NULL,
  `justification` mediumtext NOT NULL,
  `email` varchar(50) NOT NULL,
  `ip` mediumtext NOT NULL,
  `token` varchar(32) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pages` (
  `id` int(11) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Content` mediumtext NOT NULL,
  `Author` int(11) UNSIGNED NOT NULL,
  `Active` bit(1) NOT NULL,
  `Removable` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `pipeline` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `subject_id_location` tinyint(3) NOT NULL DEFAULT '0',
  `subject_id_attribute_name` varchar(100) NOT NULL,
  `grouping` tinyint(4) NOT NULL DEFAULT '0',
  `group_columns` varchar(200) DEFAULT NULL,
  `dateformat` tinyint(4) DEFAULT NULL,
  `hpo_attribute_name` varchar(100) DEFAULT NULL,
  `negated_hpo_attribute_name` varchar(100) DEFAULT NULL,
  `orpha_attribute_name` varchar(100) DEFAULT NULL,
  `internal_delimiter` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `settings` (
  `setting_id` int(11) NOT NULL,
  `setting_key` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `setting_name` varchar(50) DEFAULT NULL,
  `info` mediumtext NOT NULL,
  `setting_group` varchar(50) DEFAULT NULL,
  `validation_rules` varchar(100) NOT NULL DEFAULT 'required|xss_clean'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sources` (
  `source_id` int(11) UNSIGNED NOT NULL,
  `owner_name` mediumtext NOT NULL,
  `email` mediumtext NOT NULL,
  `name` varchar(30) NOT NULL,
  `uri` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `long_description` mediumtext NOT NULL,
  `status` varchar(15) NOT NULL,
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `record_count` bigint(255) NOT NULL DEFAULT '0',
  `elastic_status` tinyint(1) DEFAULT '0',
  `elastic_lock` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `uploaddatastatus` (
  `FileName` varchar(100) NOT NULL,
  `uploadStart` datetime NOT NULL,
  `uploadEnd` datetime DEFAULT NULL,
  `Status` varchar(20) NOT NULL,
  `elasticStatus` varchar(20) NOT NULL,
  `source_id` int(11) NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `ID` int(11) UNSIGNED NOT NULL,
  `patient` varchar(50) DEFAULT NULL,
  `tissue` varchar(50) DEFAULT NULL,
  `pipeline_id` int(11) DEFAULT NULL,
  `setting_file` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `upload_error` (
  `ID` mediumint(8) UNSIGNED NOT NULL,
  `error_id` mediumint(8) UNSIGNED NOT NULL,
  `message` varchar(500) NOT NULL,
  `error_code` int(5) NOT NULL,
  `source_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `upload_jobs` (
  `ID` int(8) NOT NULL,
  `source_id` int(11) NOT NULL,
  `user_id` mediumint(8) UNSIGNED NOT NULL,
  `linking_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT '0',
  `token` varchar(50) DEFAULT NULL,
  `remote` tinyint(1) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_groups_networks` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` int(11) UNSIGNED NOT NULL,
  `installation_key` varchar(100) NOT NULL,
  `network_key` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `menu_items`
  ADD CONSTRAINT `Page_FK` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `network_groups_sources`
  ADD CONSTRAINT `NetworkGroupIDFK` FOREIGN KEY (`group_id`) REFERENCES `network_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `SourceIDFK` FOREIGN KEY (`source_id`) REFERENCES `sources` (`source_id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `network_requests`
  ADD CONSTRAINT `NetworkRequest_NetworkKey_FK` FOREIGN KEY (`network_key`) REFERENCES `networks` (`network_key`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `pages`
  ADD CONSTRAINT `Author_FK` FOREIGN KEY (`Author`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `uploaddatastatus`
  ADD CONSTRAINT `Pipeline_Id_FK` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `users_groups_networks`
  ADD CONSTRAINT `GroupIDFK` FOREIGN KEY (`group_id`) REFERENCES `network_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `UserFK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

