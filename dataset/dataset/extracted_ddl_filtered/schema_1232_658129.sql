-- Source: https://github.com/aswinvk28/buildot-idea/blob/b570481584caaf4441b7686126836026b10c9310/Buildot-dry-run/db/db.sql?raw=true
-- Tables detected: 36 | FK constraints: 52

CREATE TABLE `abuse_reports` (
  `report_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(50) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `activation` (
  `activation_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`activation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `banner_category` (
  `banner_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_category` varchar(255) DEFAULT NULL,
  `width` int(3) DEFAULT NULL,
  `height` int(3) DEFAULT NULL,
  PRIMARY KEY (`banner_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

CREATE TABLE `banners` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_title` varchar(255) DEFAULT NULL,
  `banner_cat_id` int(11) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `link` varchar(500) DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`banner_id`),
  KEY `FK_banners` (`banner_cat_id`),
  CONSTRAINT `FK_banners` FOREIGN KEY (`banner_cat_id`) REFERENCES `banner_category` (`banner_cat_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `logo` varchar(150) DEFAULT NULL,
  `portfolio` varchar(200) DEFAULT NULL,
  `company_status` int(1) DEFAULT '0',
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

CREATE TABLE `company_functional_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `company_project_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `project_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `attachment` varchar(150) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `fr_member` (`member_id`),
  KEY `fr_company_projects` (`project_id`),
  CONSTRAINT `fr_company_projects` FOREIGN KEY (`project_id`) REFERENCES `company_projects` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `fr_member` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

CREATE TABLE `company_project_message_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_message` text,
  `msg_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `attachment` varchar(150) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `fr_project_message` (`msg_id`),
  KEY `fr_member_table` (`member_id`),
  CONSTRAINT `fr_member_table` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `fr_project_message` FOREIGN KEY (`msg_id`) REFERENCES `company_project_message` (`msg_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `company_projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL,
  `project_type` varchar(255) DEFAULT NULL,
  `project_location` varchar(255) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `project_owner` int(11) DEFAULT NULL,
  `companyId` int(11) DEFAULT NULL,
  `project_description` text,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `fr_countryId` (`countryId`),
  KEY `fr_company` (`companyId`),
  KEY `fr_members` (`project_owner`),
  CONSTRAINT `fr_company` FOREIGN KEY (`companyId`) REFERENCES `company` (`company_id`) ON DELETE CASCADE,
  CONSTRAINT `fr_countryId` FOREIGN KEY (`countryId`) REFERENCES `countries` (`countryId`) ON DELETE CASCADE,
  CONSTRAINT `fr_members` FOREIGN KEY (`project_owner`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `countries` (
  `countryId` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_name` varchar(255) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `country_letter` varchar(255) DEFAULT NULL,
  `currency_display` tinyint(1) DEFAULT '0',
  `selected` tinyint(1) DEFAULT '0',
  `display` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=latin1;

CREATE TABLE `event_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `event_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `FK_event_message` (`event_id`),
  KEY `FK_event_message_1` (`member_id`),
  CONSTRAINT `FK_event_message` FOREIGN KEY (`event_id`) REFERENCES `events` (`event_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_event_message_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

CREATE TABLE `event_message_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_message` text,
  `msg_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `FK_event_message_reply` (`msg_id`),
  KEY `FK_event_message_reply_1` (`member_id`),
  CONSTRAINT `FK_event_message_reply` FOREIGN KEY (`msg_id`) REFERENCES `event_message` (`msg_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_event_message_reply_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

CREATE TABLE `events` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_title` varchar(150) DEFAULT NULL,
  `description` text,
  `location` varchar(255) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `event_date` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`),
  KEY `FK_events` (`created_by`),
  KEY `FK_events_countries` (`countryId`),
  CONSTRAINT `FK_events` FOREIGN KEY (`created_by`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_events_countries` FOREIGN KEY (`countryId`) REFERENCES `countries` (`countryId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `forget_password` (
  `fid` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `friend_requests` (
  `friend_request_id` int(10) NOT NULL AUTO_INCREMENT,
  `from_member_id` int(15) DEFAULT NULL,
  `to_member_id` int(15) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`friend_request_id`),
  KEY `FK_friend_requests` (`from_member_id`),
  KEY `FK_friend_requests_1` (`to_member_id`),
  CONSTRAINT `FK_friend_requests` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_friend_requests_1` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=latin1;

CREATE TABLE `group_members` (
  `member_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`member_group_id`),
  KEY `FK_group_members` (`group_id`),
  KEY `FK_group_members_1` (`member_id`),
  CONSTRAINT `FK_group_members` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_group_members_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

CREATE TABLE `group_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text,
  `group_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `FK_group_message` (`group_id`),
  KEY `FK_group_message_1` (`member_id`),
  CONSTRAINT `FK_group_message` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_group_message_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

CREATE TABLE `group_message_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `reply_message` text,
  `msg_id` int(11) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `FK_group_message_reply` (`member_id`),
  KEY `FK_group_message_reply_1` (`msg_id`),
  CONSTRAINT `FK_group_message_reply` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_group_message_reply_1` FOREIGN KEY (`msg_id`) REFERENCES `group_message` (`msg_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

CREATE TABLE `groups` (
  `group_id` int(10) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL,
  `group_type` varchar(100) DEFAULT NULL,
  `group_owner` int(11) DEFAULT NULL,
  `website` varchar(150) DEFAULT NULL,
  `privacy` varchar(25) DEFAULT NULL,
  `summary` text,
  `description` text,
  `group_image` varchar(150) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `FK_groups` (`group_owner`),
  CONSTRAINT `FK_groups` FOREIGN KEY (`group_owner`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `hide_updates` (
  `hide_id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`hide_id`),
  KEY `member_id` (`member_id`),
  KEY `update_id` (`update_id`),
  CONSTRAINT `hide_updates_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `hide_updates_ibfk_2` FOREIGN KEY (`update_id`) REFERENCES `updates` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `job_categories` (
  `job_cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `job_cat_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`job_cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

CREATE TABLE `job_openings` (
  `job_opening_id` int(15) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `location` varchar(255) DEFAULT NULL,
  `contact_number` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `job_cat_id` int(11) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `status` int(1) DEFAULT '1',
  `created_by` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`job_opening_id`),
  KEY `FK_job_openings` (`job_cat_id`),
  KEY `FK_job_openings_1` (`created_by`),
  CONSTRAINT `FK_job_openings` FOREIGN KEY (`job_cat_id`) REFERENCES `job_categories` (`job_cat_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_job_openings_1` FOREIGN KEY (`created_by`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `members` (
  `member_id` int(15) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `company_type` varchar(255) DEFAULT NULL,
  `company_functional_area_id` int(11) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `designation` varchar(150) DEFAULT NULL,
  `telephone` varchar(15) DEFAULT NULL,
  `mobile` varchar(15) DEFAULT NULL,
  `fax` varchar(15) DEFAULT NULL,
  `location` varchar(150) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `member_photo` varchar(150) DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  `cv` varchar(200) DEFAULT NULL,
  `portfolio` varchar(200) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `FK_members` (`user_id`),
  KEY `FK_members_company` (`company_id`),
  KEY `FK_members_functional_area` (`company_functional_area_id`),
  KEY `FK_members_countries` (`countryId`),
  CONSTRAINT `FK_members` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_members_company` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_members_countries` FOREIGN KEY (`countryId`) REFERENCES `countries` (`countryId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

CREATE TABLE `post_reply` (
  `post_reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) DEFAULT NULL,
  `send_by` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`post_reply_id`),
  KEY `FK_post_reply` (`post_id`),
  KEY `FK_post_reply_1` (`send_by`),
  CONSTRAINT `FK_post_reply` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_post_reply_1` FOREIGN KEY (`send_by`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(500) DEFAULT NULL,
  `send_by` int(11) DEFAULT NULL,
  `attachment` varchar(150) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  KEY `FK_posts` (`send_by`),
  CONSTRAINT `FK_posts` FOREIGN KEY (`send_by`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `project_invites` (
  `project_invite_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `from_member_id` int(11) DEFAULT NULL,
  `to_member_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`project_invite_id`),
  KEY `project_id` (`project_id`),
  KEY `from_member_id` (`from_member_id`),
  KEY `to_member_id` (`to_member_id`),
  CONSTRAINT `project_invites_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `company_projects` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `project_invites_ibfk_2` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `project_invites_ibfk_3` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_ref_no` varchar(15) DEFAULT NULL,
  `project_name` varchar(150) DEFAULT NULL,
  `project_location` varchar(150) DEFAULT NULL,
  `countryId` int(11) DEFAULT NULL,
  `location_map` varchar(150) DEFAULT NULL,
  `max_alloc_budget` int(10) DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `closing_date` date DEFAULT NULL,
  `description` text,
  `attachment1` varchar(150) DEFAULT NULL,
  `attachment2` varchar(150) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `publishto` int(1) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FK_projects` (`member_id`),
  KEY `FK_projects_countries` (`countryId`),
  CONSTRAINT `FK_projects` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_projects_countries` FOREIGN KEY (`countryId`) REFERENCES `countries` (`countryId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `read_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `read_projects_ibfk_1` (`member_id`),
  KEY `read_projects_ibfk_2` (`project_id`),
  CONSTRAINT `read_projects_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `read_projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

CREATE TABLE `read_tenders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `member_id` int(11) DEFAULT NULL,
  `tender_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `read_tenders_ibfk_1` (`member_id`),
  KEY `read_tenders_ibfk_2` (`tender_id`),
  CONSTRAINT `read_tenders_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `read_tenders_ibfk_2` FOREIGN KEY (`tender_id`) REFERENCES `tenders` (`tender_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `share_invites` (
  `share_id` int(11) NOT NULL AUTO_INCREMENT,
  `from_member_id` int(11) DEFAULT NULL,
  `to_member_id` int(11) DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`share_id`),
  KEY `FK_share_invites` (`from_member_id`),
  KEY `FK_share_invites_1` (`to_member_id`),
  CONSTRAINT `FK_share_invites` FOREIGN KEY (`from_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_share_invites_1` FOREIGN KEY (`to_member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `tender_comments` (
  `tender_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `tender_id` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tender_comment_id`),
  KEY `FK_tender_comments` (`tender_id`),
  KEY `FK_tender_comments_1` (`member_id`),
  CONSTRAINT `FK_tender_comments` FOREIGN KEY (`tender_id`) REFERENCES `tenders` (`tender_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_tender_comments_1` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

CREATE TABLE `tenders` (
  `tender_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `proposed_budget` int(10) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `sector` varchar(255) DEFAULT NULL,
  `attachment` varchar(150) DEFAULT NULL,
  `count` int(10) DEFAULT '0',
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`tender_id`),
  KEY `FK_tenders` (`project_id`),
  KEY `FK_tenders_members` (`member_id`),
  CONSTRAINT `FK_tenders` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_tenders_members` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

CREATE TABLE `update_reply` (
  `reply_id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `send_by` int(11) DEFAULT NULL,
  `update_id` int(11) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `FK_update_reply` (`update_id`),
  KEY `FK_update_reply_1` (`send_by`),
  CONSTRAINT `FK_update_reply` FOREIGN KEY (`update_id`) REFERENCES `updates` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_update_reply_1` FOREIGN KEY (`send_by`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=latin1;

CREATE TABLE `updates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `update_message` varchar(255) DEFAULT NULL,
  `member_id` int(11) DEFAULT NULL,
  `table_name` varchar(50) DEFAULT NULL,
  `ids` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `FK_updates` (`member_id`),
  CONSTRAINT `FK_updates` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `usertype` int(11) DEFAULT '1',
  `status` int(1) DEFAULT '0',
  `created` timestamp NULL DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_users` (`usertype`),
  CONSTRAINT `FK_users` FOREIGN KEY (`usertype`) REFERENCES `usertype` (`usertype`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=latin1;

CREATE TABLE `usertype` (
  `usertype` int(11) NOT NULL AUTO_INCREMENT,
  `usertypename` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`usertype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

