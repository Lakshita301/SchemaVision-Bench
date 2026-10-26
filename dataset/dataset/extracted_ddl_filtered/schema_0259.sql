-- Source: https://github.com/arielantony/evodata/blob/68637c76fb0349eb46fa39483d99c8b4eb4d93a7/tp1_datasets/equipe9/schemas/schema_28713.sql?raw=true
-- Tables detected: 227 | FK/REFERENCES mentions: 1

CREATE TABLE `messu_messages` (
  `msgId` int(14) NOT NULL auto_increment,
  `user` varchar(200) NOT NULL default '',
  `user_from` varchar(200) NOT NULL default '',
  `user_to` text,
  `user_cc` text,
  `user_bcc` text,
  `subject` varchar(255) default NULL,
  `body` text,
  `hash` varchar(32) default NULL,
  `replyto_hash` varchar(32) default NULL,
  `date` int(14) default NULL,
  `isRead` char(1) default NULL,
  `isReplied` char(1) default NULL,
  `isFlagged` char(1) default NULL,
  `priority` int(2) default NULL,
  PRIMARY KEY (`msgId`),
  KEY `userIsRead` (user, `isRead`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `messu_archive` (
  `msgId` int(14) NOT NULL auto_increment,
  `user` varchar(40) NOT NULL default '',
  `user_from` varchar(40) NOT NULL default '',
  `user_to` text,
  `user_cc` text,
  `user_bcc` text,
  `subject` varchar(255) default NULL,
  `body` text,
  `hash` varchar(32) default NULL,
  `replyto_hash` varchar(32) default NULL,
  `date` int(14) default NULL,
  `isRead` char(1) default NULL,
  `isReplied` char(1) default NULL,
  `isFlagged` char(1) default NULL,
  `priority` int(2) default NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `messu_sent` (
  `msgId` int(14) NOT NULL auto_increment,
  `user` varchar(40) NOT NULL default '',
  `user_from` varchar(40) NOT NULL default '',
  `user_to` text,
  `user_cc` text,
  `user_bcc` text,
  `subject` varchar(255) default NULL,
  `body` text,
  `hash` varchar(32) default NULL,
  `replyto_hash` varchar(32) default NULL,
  `date` int(14) default NULL,
  `isRead` char(1) default NULL,
  `isReplied` char(1) default NULL,
  `isFlagged` char(1) default NULL,
  `priority` int(2) default NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `sessions` (
  `sesskey` char(32) NOT NULL,
  `expiry` int(11) unsigned NOT NULL,
  `expireref` varchar(64),
  `data` text NOT NULL,
  PRIMARY KEY (`sesskey`),
  KEY `expiry` (expiry)
) ENGINE=MyISAM;

CREATE TABLE `tiki_actionlog` (
  `actionId` int(8) NOT NULL auto_increment,
  `action` varchar(255) NOT NULL default '',
  `lastModif` int(14) default NULL,
  `object` varchar(255) default NULL,
  `objectType` varchar(32) NOT NULL default '',
  `user` varchar(200) default '',
  `ip` varchar(39) default NULL,
  `comment` varchar(200) default NULL,
  `categId` int(12) NOT NULL default '0',
    `client` VARCHAR( 200 ) NULL DEFAULT NULL,
  PRIMARY KEY (`actionId`),
  KEY `lastModif` (`lastModif`),
  KEY `object` (`object`(100), `objectType`, `action`(100))
) ENGINE=MyISAM;

CREATE TABLE `tiki_actionlog_params` (
  `actionId` int(8) NOT NULL,
  `name` varchar(40) NOT NULL,
  `value` text,
  KEY `actionId` (`actionId`),
  KEY `nameValue` (`name`, `value`(200))
) ENGINE=MyISAM;

CREATE TABLE `tiki_articles` (
  `articleId` int(8) NOT NULL auto_increment,
  `topline` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `subtitle` varchar(255) default NULL,
  `linkto` varchar(255) default NULL,
  `lang` varchar(16) default NULL,
  `state` char(1) default 's',
  `authorName` varchar(60) default NULL,
  `topicId` int(14) default NULL,
  `topicName` varchar(40) default NULL,
  `size` int(12) default NULL,
  `useImage` char(1) default NULL,
  `image_name` varchar(80) default NULL,
  `image_caption` text default NULL,
  `image_type` varchar(80) default NULL,
  `image_size` int(14) default NULL,
  `image_x` int(4) default NULL,
  `image_y` int(4) default NULL,
  `list_image_x` int(4) default NULL,
  `image_data` longblob,
  `publishDate` int(14) default NULL,
  `expireDate` int(14) default NULL,
  `created` int(14) default NULL,
  `heading` text,
  `post_heading` text,
  `body` text,
  `hash` varchar(32) default NULL,
  `author` varchar(200) default NULL,
  `nbreads` int(14) default NULL,
  `votes` int(8) default NULL,
  `points` int(14) default NULL,
  `type` varchar(50) default NULL,
  `rating` decimal(3,2) default NULL,
  `isfloat` char(1) default NULL,
  PRIMARY KEY (`articleId`),
  KEY `title` (`title`),
  KEY `heading` (`heading`(255)),
  KEY `body` (`body`(255)),
  KEY `nbreads` (`nbreads`),
  KEY `author` (`author`(32)),
  KEY `topicId` (`topicId`),
  KEY `publishDate` (`publishDate`),
  KEY `expireDate` (`expireDate`),
  KEY `type` (`type`),
  FULLTEXT KEY `ft` (`title`, `heading`, `body`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_article_types` (
  `type` varchar(50) NOT NULL,
  `use_ratings` varchar(1) default NULL,
  `show_pre_publ` varchar(1) default NULL,
  `show_post_expire` varchar(1) default 'y',
  `heading_only` varchar(1) default NULL,
  `allow_comments` varchar(1) default 'y',
  `show_image` varchar(1) default 'y',
  `show_avatar` varchar(1) default NULL,
  `show_author` varchar(1) default 'y',
  `show_pubdate` varchar(1) default 'y',
  `show_expdate` varchar(1) default NULL,
  `show_reads` varchar(1) default 'y',
  `show_size` varchar(1) default 'n',
  `show_topline` varchar(1) default 'n',
  `show_subtitle` varchar(1) default 'n',
  `show_linkto` varchar(1) default 'n',
  `show_image_caption` varchar(1) default 'n',
  `show_lang` varchar(1) default 'n',
  `creator_edit` varchar(1) default NULL,
  `comment_can_rate_article` char(1) default NULL,
  PRIMARY KEY (`type`),
  KEY `show_pre_publ` (`show_pre_publ`),
  KEY `show_post_expire` (`show_post_expire`)
) ENGINE=MyISAM ;

CREATE TABLE `tiki_banners` (
  `bannerId` int(12) NOT NULL auto_increment,
  `client` varchar(200) NOT NULL default '',
  `url` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `alt` varchar(250) default NULL,
  `which` varchar(50) default NULL,
  `imageData` longblob,
  `imageType` varchar(200) default NULL,
  `imageName` varchar(100) default NULL,
  `HTMLData` text,
  `fixedURLData` varchar(255) default NULL,
  `textData` text,
  `fromDate` int(14) default NULL,
  `toDate` int(14) default NULL,
  `useDates` char(1) default NULL,
  `mon` char(1) default NULL,
  `tue` char(1) default NULL,
  `wed` char(1) default NULL,
  `thu` char(1) default NULL,
  `fri` char(1) default NULL,
  `sat` char(1) default NULL,
  `sun` char(1) default NULL,
  `hourFrom` varchar(4) default NULL,
  `hourTo` varchar(4) default NULL,
  `created` int(14) default NULL,
  `maxImpressions` int(8) default NULL,
  `impressions` int(8) default NULL,
  `maxUserImpressions` int(8) default -1,
  `maxClicks` int(8) default NULL,
  `clicks` int(8) default NULL,
  `zone` varchar(40) default NULL,
  PRIMARY KEY (`bannerId`),
  INDEX ban1(zone,`useDates`,impressions,`maxImpressions`,`hourFrom`,`hourTo`,`fromDate`,`toDate`,mon,tue,wed,thu,fri,sat,sun)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_banning` (
  `banId` int(12) NOT NULL auto_increment,
  `mode` enum('user','ip') default NULL,
  `title` varchar(200) default NULL,
  `ip1` char(3) default NULL,
  `ip2` char(3) default NULL,
  `ip3` char(3) default NULL,
  `ip4` char(3) default NULL,
  `user` varchar(200) default '',
  `date_from` timestamp(14) NOT NULL,
  `date_to` timestamp(14) NOT NULL,
  `use_dates` char(1) default NULL,
  `created` int(14) default NULL,
  `message` text,
  PRIMARY KEY (`banId`),
  INDEX ban(`use_dates`, `date_from`, `date_to`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_banning_sections` (
  `banId` int(12) NOT NULL default '0',
  `section` varchar(100) NOT NULL default '',
  PRIMARY KEY (`banId`,`section`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_blog_activity` (
  `blogId` int(8) NOT NULL default '0',
  `day` int(14) NOT NULL default '0',
  `posts` int(8) default NULL,
  PRIMARY KEY (`blogId`,`day`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_blog_posts` (
  `postId` int(8) NOT NULL auto_increment,
  `blogId` int(8) NOT NULL default '0',
  `data` text,
  `data_size` int(11) unsigned NOT NULL default '0',
  `excerpt` text default NULL,
  `created` int(14) default NULL,
  `user` varchar(200) default '',
  `trackbacks_to` text,
  `trackbacks_from` text,
  `title` varchar(255) default NULL,
  `priv` varchar(1) default NULL,
  `wysiwyg` varchar(1) default NULL,
  PRIMARY KEY (`postId`),
  KEY `data` (`data`(255)),
  KEY `blogId` (`blogId`),
  KEY `created` (`created`),
  FULLTEXT KEY `ft` (`data`, `title`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_blog_posts_images` (
  `imgId` int(14) NOT NULL auto_increment,
  `postId` int(14) NOT NULL default '0',
  `filename` varchar(80) default NULL,
  `filetype` varchar(80) default NULL,
  `filesize` int(14) default NULL,
  `data` longblob,
  PRIMARY KEY (`imgId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_blogs` (
  `blogId` int(8) NOT NULL auto_increment,
  `created` int(14) default NULL,
  `lastModif` int(14) default NULL,
  `title` varchar(200) default NULL,
  `description` text,
  `user` varchar(200) default '',
  `public` char(1) default NULL,
  `posts` int(8) default NULL,
  `maxPosts` int(8) default NULL,
  `hits` int(8) default NULL,
  `activity` decimal(4,2) default NULL,
  `heading` text,
  `use_find` char(1) default NULL,
  `use_title` char(1) default NULL,
  `use_author` char(1) default NULL,
  `use_excerpt` char(1) default NULL,
  `add_date` char(1) default NULL,
  `add_poster` char(1) default NULL,
  `allow_comments` char(1) default NULL,
  `show_avatar` char(1) default NULL,
  `always_owner` char(1) default NULL,
  `show_related` char(1) default NULL,
  `related_max` int(4) default 5,
  PRIMARY KEY (`blogId`),
  KEY `title` (`title`),
  KEY `description` (`description`(255)),
  KEY `hits` (`hits`),
  FULLTEXT KEY `ft` (`title`, `description`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_calendar_categories` (
  `calcatId` int(11) NOT NULL auto_increment,
  `calendarId` int(14) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  PRIMARY KEY (`calcatId`),
  UNIQUE KEY `catname` (`calendarId`, `name`(16))
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_calendar_recurrence` (
  `recurrenceId` int(14) NOT NULL auto_increment,
  `calendarId` int(14) NOT NULL default '0',
  `start` int(4) NOT NULL default '0',
  `end` int(4) NOT NULL default '2359',
  `allday` tinyint(1) NOT NULL default '0',
  `locationId` int(14) default NULL,
  `categoryId` int(14) default NULL,
  `nlId` int(12) NOT NULL default '0',
  `priority` enum('1','2','3','4','5','6','7','8','9') NOT NULL default '1',
  `status` enum('0','1','2') NOT NULL default '0',
  `url` varchar(255) default NULL,
  `lang` char(16) NOT NULL default 'en',
  `name` varchar(255) NOT NULL default '',
  `description` blob,
  `weekly` tinyint(1) default '0',
  `weekday` tinyint(1),
  `monthly` tinyint(1) default '0',
  `dayOfMonth` int(2),
  `yearly` tinyint(1) default '0',
  `dateOfYear` int(4),
  `nbRecurrences` int(8),
  `startPeriod` int(14),
  `endPeriod` int(14),
  `user` varchar(200) default '',
  `created` int(14) NOT NULL default '0',
  `lastmodif` int(14) NOT NULL default '0',
  PRIMARY KEY (`recurrenceId`),
  KEY `calendarId` (`calendarId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_calendar_items` (
  `calitemId` int(14) NOT NULL auto_increment,
  `calendarId` int(14) NOT NULL default '0',
  `start` int(14) NOT NULL default '0',
  `end` int(14) NOT NULL default '0',
  `locationId` int(14) default NULL,
  `categoryId` int(14) default NULL,
  `nlId` int(12) NOT NULL default '0',
  `priority` enum('0', '1','2','3','4','5','6','7','8','9') default '0',
  `status` enum('0','1','2') NOT NULL default '0',
  `url` varchar(255) default NULL,
  `lang` char(16) NOT NULL default 'en',
  `name` varchar(255) NOT NULL default '',
  `description` text,
  `recurrenceId` int(14),
  `changed` tinyint(1) DEFAULT '0',
  `user` varchar(200) default '',
  `created` int(14) NOT NULL default '0',
  `lastmodif` int(14) NOT NULL default '0',
  `allday` tinyint(1) NOT NULL default '0',
  PRIMARY KEY (`calitemId`),
  KEY `calendarId` (`calendarId`),
  FULLTEXT KEY `ft` (`name`,`description`),
  CONSTRAINT `fk_calitems_recurrence`
    FOREIGN KEY (`recurrenceId`) REFERENCES `tiki_calendar_recurrence`(`recurrenceId`)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_calendar_locations` (
  `callocId` int(14) NOT NULL auto_increment,
  `calendarId` int(14) NOT NULL default '0',
  `name` varchar(255) NOT NULL default '',
  `description` blob,
  PRIMARY KEY (`callocId`),
  UNIQUE KEY `locname` (`calendarId`, `name`(16))
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_calendar_roles` (
  `calitemId` int(14) NOT NULL default '0',
  `username` varchar(200) NOT NULL default '',
  `role` enum('0','1','2','3','6') NOT NULL default '0',
  PRIMARY KEY (`calitemId`,`username`(16),`role`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_calendars` (
  `calendarId` int(14) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL default '',
  `description` varchar(255) default NULL,
  `user` varchar(200) NOT NULL default '',
  `customlocations` enum('n','y') NOT NULL default 'n',
  `customcategories` enum('n','y') NOT NULL default 'n',
  `customlanguages` enum('n','y') NOT NULL default 'n',
  `custompriorities` enum('n','y') NOT NULL default 'n',
  `customparticipants` enum('n','y') NOT NULL default 'n',
  `customsubscription` enum('n','y') NOT NULL default 'n',
  `customstatus` enum('n','y') NOT NULL default 'y',
  `created` int(14) NOT NULL default '0',
  `lastmodif` int(14) NOT NULL default '0',
  `personal` enum ('n', 'y') NOT NULL default 'n',
  PRIMARY KEY (`calendarId`)
) ENGINE=MyISAM ;

CREATE TABLE `tiki_calendar_options` (
    `calendarId` int(14) NOT NULL default 0,
    `optionName` varchar(120) NOT NULL default '',
    `value` varchar(255),
    PRIMARY KEY (`calendarId`,`optionName`)
) ENGINE=MyISAM ;

CREATE TABLE `tiki_categories` (
  `categId` int(12) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `description` varchar(250) default NULL,
  `parentId` int(12) default NULL,
  `hits` int(8) default NULL,
  `rootCategId` int(12) default NULL,
  PRIMARY KEY (`categId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_objects` (
  `objectId` int(12) NOT NULL auto_increment,
  `type` varchar(50) default NULL,
  `itemId` varchar(255) default NULL,
  `description` text,
  `created` int(14) default NULL,
  `name` varchar(200) default NULL,
  `href` varchar(200) default NULL,
  `hits` int(8) default NULL,
  `comments_locked` char(1) NOT NULL default 'n',
  PRIMARY KEY (`objectId`),
  KEY (`type`, `objectId`),
  KEY (`itemId`, `type`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_categorized_objects` (
  `catObjectId` int(11) NOT NULL default '0',
  PRIMARY KEY (`catObjectId`)
) ENGINE=MyISAM ;

CREATE TABLE `tiki_category_objects` (
  `catObjectId` int(12) NOT NULL default '0',
  `categId` int(12) NOT NULL default '0',
  PRIMARY KEY (`catObjectId`,`categId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_object_ratings` (
  `catObjectId` int(12) NOT NULL default '0',
  `pollId` int(12) NOT NULL default '0',
  PRIMARY KEY (`catObjectId`,`pollId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_category_sites` (
  `categId` int(10) NOT NULL default '0',
  `siteId` int(14) NOT NULL default '0',
  PRIMARY KEY (`categId`,`siteId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_chat_channels` (
  `channelId` int(8) NOT NULL auto_increment,
  `name` varchar(30) default NULL,
  `description` varchar(250) default NULL,
  `max_users` int(8) default NULL,
  `mode` char(1) default NULL,
  `moderator` varchar(200) default NULL,
  `active` char(1) default NULL,
  `refresh` int(6) default NULL,
  PRIMARY KEY (`channelId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_chat_messages` (
  `messageId` int(8) NOT NULL auto_increment,
  `channelId` int(8) NOT NULL default '0',
  `data` varchar(255) default NULL,
  `poster` varchar(200) NOT NULL default 'anonymous',
  `timestamp` int(14) default NULL,
  PRIMARY KEY (`messageId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_chat_users` (
  `nickname` varchar(200) NOT NULL default '',
  `channelId` int(8) NOT NULL default '0',
  `timestamp` int(14) default NULL,
  PRIMARY KEY (`nickname`,`channelId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_comments` (
  `threadId` int(14) NOT NULL auto_increment,
  `object` varchar(255) NOT NULL default '',
  `objectType` varchar(32) NOT NULL default '',
  `parentId` int(14) default NULL,
  `userName` varchar(200) default '',
  `commentDate` int(14) default NULL,
  `hits` int(8) default NULL,
  `type` char(1) default NULL,
  `points` decimal(8,2) default NULL,
  `votes` int(8) default NULL,
  `average` decimal(8,4) default NULL,
  `title` varchar(255) default NULL,
  `data` text,
  `hash` varchar(32) default NULL,
  `email` varchar(200) default NULL,
  `website` varchar(200) default NULL,
  `user_ip` varchar(15) default NULL,
  `summary` varchar(240) default NULL,
  `smiley` varchar(80) default NULL,
  `message_id` varchar(128) default NULL,
  `in_reply_to` varchar(128) default NULL,
  `comment_rating` tinyint(2) default NULL,
  `archived` char(1) default NULL,
  `approved` char(1) NOT NULL default 'y',
  `locked` char(1) NOT NULL default 'n',
  PRIMARY KEY (`threadId`),
  UNIQUE KEY `no_repeats` (`parentId`, `userName`(40), `title`(100), `commentDate`, `message_id`(40), `in_reply_to`(40)),
  KEY `title` (`title`),
  KEY `data` (`data`(255)),
  KEY `hits` (hits),
  KEY `tc_pi` (`parentId`),
  KEY `objectType` (object, `objectType`),
  KEY `commentDate` (`commentDate`),
  KEY `threaded` (message_id, in_reply_to, `parentId`),
  FULLTEXT KEY `ft` (title,data)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_content` (
  `contentId` int(8) NOT NULL auto_increment,
  `description` text,
  `contentLabel` varchar(255) NOT NULL default '',
  PRIMARY KEY (`contentId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_content_templates` (
  `templateId` int(10) NOT NULL auto_increment,
  `template_type` VARCHAR( 20 ) NOT NULL DEFAULT 'static',
  `content` longblob,
  `name` varchar(200) default NULL,
  `created` int(14) default NULL,
  PRIMARY KEY (`templateId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_content_templates_sections` (
  `templateId` int(10) NOT NULL default '0',
  `section` varchar(250) NOT NULL default '',
  PRIMARY KEY (`templateId`,`section`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_cookies` (
  `cookieId` int(10) NOT NULL auto_increment,
  `cookie` text,
  PRIMARY KEY (`cookieId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_copyrights` (
  `copyrightId` int(12) NOT NULL auto_increment,
  `page` varchar(200) default NULL,
  `title` varchar(200) default NULL,
  `year` int(11) default NULL,
  `authors` varchar(200) default NULL,
  `copyright_order` int(11) default NULL,
  `userName` varchar(200) default '',
  PRIMARY KEY (`copyrightId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_directory_categories` (
  `categId` int(10) NOT NULL auto_increment,
  `parent` int(10) default NULL,
  `name` varchar(240) default NULL,
  `description` text,
  `childrenType` char(1) default NULL,
  `sites` int(10) default NULL,
  `viewableChildren` int(4) default NULL,
  `allowSites` char(1) default NULL,
  `showCount` char(1) default NULL,
  `editorGroup` varchar(200) default NULL,
  `hits` int(12) default NULL,
  PRIMARY KEY (`categId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_directory_search` (
  `term` varchar(250) NOT NULL default '',
  `hits` int(14) default NULL,
  PRIMARY KEY (`term`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_directory_sites` (
  `siteId` int(14) NOT NULL auto_increment,
  `name` varchar(240) default NULL,
  `description` text,
  `url` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `hits` int(12) default NULL,
  `isValid` char(1) default NULL,
  `created` int(14) default NULL,
  `lastModif` int(14) default NULL,
  `cache` longblob,
  `cache_timestamp` int(14) default NULL,
  PRIMARY KEY (`siteId`),
  KEY (`isValid`),
  KEY (url),
  FULLTEXT KEY `ft` (name,description)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_dsn` (
  `dsnId` int(12) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `dsn` varchar(255) default NULL,
  PRIMARY KEY (`dsnId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_dynamic_variables` (
  `name` varchar(40) NOT NULL,
  `data` text,
  `lang` VARCHAR(16) NULL
);

CREATE TABLE `tiki_extwiki` (
  `extwikiId` int(12) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `extwiki` varchar(255) default NULL,
  PRIMARY KEY (`extwikiId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_faq_questions` (
  `questionId` int(10) NOT NULL auto_increment,
  `faqId` int(10) default NULL,
  `position` int(4) default NULL,
  `question` text,
  `answer` text,
  `created` int(14) default NULL,
  PRIMARY KEY (`questionId`),
  KEY `faqId` (`faqId`),
  KEY `question` (question(255)),
  KEY `answer` (answer(255)),
  KEY `created` (`created`),
  FULLTEXT KEY `ft` (question,answer)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_faqs` (
  `faqId` int(10) NOT NULL auto_increment,
  `title` varchar(200) default NULL,
  `description` text,
  `created` int(14) default NULL,
  `questions` int(5) default NULL,
  `hits` int(8) default NULL,
  `canSuggest` char(1) default NULL,
  PRIMARY KEY (`faqId`),
  KEY `title` (title),
  KEY `description` (description(255)),
  KEY `hits` (hits),
  FULLTEXT KEY `ft` (title,description)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_featured_links` (
  `url` varchar(200) NOT NULL default '',
  `title` varchar(200) default NULL,
  `description` text,
  `hits` int(8) default NULL,
  `position` int(6) default NULL,
  `type` char(1) default NULL,
  PRIMARY KEY (`url`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_file_galleries` (
  `galleryId` int(14) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL default '',
  `type` varchar(20) NOT NULL default 'default',
  `description` text,
  `created` int(14) default NULL,
  `visible` char(1) default NULL,
  `lastModif` int(14) default NULL,
  `user` varchar(200) default '',
  `hits` int(14) default NULL,
  `votes` int(8) default NULL,
  `points` decimal(8,2) default NULL,
  `maxRows` int(10) default NULL,
  `public` char(1) default NULL,
  `show_id` char(1) default NULL,
  `show_icon` char(1) default NULL,
  `show_name` char(1) default NULL,
  `show_size` char(1) default NULL,
  `show_description` char(1) default NULL,
  `max_desc` int(8) default NULL,
  `show_created` char(1) default NULL,
  `show_hits` char(1) default NULL,
  `show_lastDownload` char(1) default NULL,
  `parentId` int(14) NOT NULL default -1,
  `lockable` char(1) default 'n',
  `show_lockedby` char(1) default NULL,
  `archives` int(4) default -1,
  `sort_mode` char(20) default NULL,
  `show_modified` char(1) default NULL,
  `show_author` char(1) default NULL,
  `show_creator` char(1) default NULL,
  `subgal_conf` varchar(200) default NULL,
  `show_last_user` char(1) default NULL,
  `show_comment` char(1) default NULL,
  `show_files` char(1) default NULL,
  `show_explorer` char(1) default NULL,
  `show_path` char(1) default NULL,
  `show_slideshow` char(1) default NULL,
  `default_view` varchar(20) default NULL,
  `quota` int(8) default 0,
  `size` int(14) default NULL,
  `wiki_syntax` varchar(200) default NULL,
  `backlinkPerms` char(1) default 'n',
  `show_backlinks` char(1) default NULL,
  `image_max_size_x` int(8) NOT NULL default '0',
  `image_max_size_y` int(8) NOT NULL default '0',
  PRIMARY KEY (`galleryId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_files` (
  `fileId` int(14) NOT NULL auto_increment,
  `galleryId` int(14) NOT NULL default '0',
  `name` varchar(200) NOT NULL default '',
  `description` text,
  `created` int(14) default NULL,
  `filename` varchar(80) default NULL,
  `filesize` int(14) default NULL,
  `filetype` varchar(250) default NULL,
  `data` longblob,
  `user` varchar(200) default '',
  `author` varchar(40) default NULL,
  `hits` int(14) default NULL,
  `lastDownload` int(14) default NULL,
  `votes` int(8) default NULL,
  `points` decimal(8,2) default NULL,
  `path` varchar(255) default NULL,
  `reference_url` varchar(250) default NULL,
  `is_reference` char(1) default NULL,
  `hash` varchar(32) default NULL,
  `search_data` longtext,
  `lastModif` integer(14) DEFAULT NULL,
  `lastModifUser` varchar(200) DEFAULT NULL,
  `lockedby` varchar(200) default '',
  `comment` varchar(200) default NULL,
  `archiveId` int(14) default 0,
  `deleteAfter` int(14) default NULL,
  PRIMARY KEY (`fileId`),
  KEY `name` (name),
  KEY `description` (description(255)),
  KEY `created` (created),
  KEY `archiveId` (`archiveId`),
  KEY `galleryId` (`galleryId`),
  KEY `hits` (hits),
  FULLTEXT KEY `ft` (name,description,search_data,filename)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_forum_attachments` (
  `attId` int(14) NOT NULL auto_increment,
  `threadId` int(14) NOT NULL default '0',
  `qId` int(14) NOT NULL default '0',
  `forumId` int(14) default NULL,
  `filename` varchar(250) default NULL,
  `filetype` varchar(250) default NULL,
  `filesize` int(12) default NULL,
  `data` longblob,
  `dir` varchar(200) default NULL,
  `created` int(14) default NULL,
  `path` varchar(250) default NULL,
  PRIMARY KEY (`attId`),
  KEY `threadId` (`threadId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_forum_reads` (
  `user` varchar(200) NOT NULL default '',
  `threadId` int(14) NOT NULL default '0',
  `forumId` int(14) default NULL,
  `timestamp` int(14) default NULL,
  PRIMARY KEY (`user`,`threadId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_forums` (
  `forumId` int(8) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `created` int(14) default NULL,
  `lastPost` int(14) default NULL,
  `threads` int(8) default NULL,
  `comments` int(8) default NULL,
  `controlFlood` char(1) default NULL,
  `floodInterval` int(8) default NULL,
  `moderator` varchar(200) default NULL,
  `hits` int(8) default NULL,
  `mail` varchar(200) default NULL,
  `useMail` char(1) default NULL,
  `section` varchar(200) default NULL,
  `usePruneUnreplied` char(1) default NULL,
  `pruneUnrepliedAge` int(8) default NULL,
  `usePruneOld` char(1) default NULL,
  `pruneMaxAge` int(8) default NULL,
  `topicsPerPage` int(6) default NULL,
  `topicOrdering` varchar(100) default NULL,
  `threadOrdering` varchar(100) default NULL,
  `att` varchar(80) default NULL,
  `att_store` varchar(4) default NULL,
  `att_store_dir` varchar(250) default NULL,
  `att_max_size` int(12) default NULL,
  `att_list_nb` char(1) default NULL,
  `ui_level` char(1) default NULL,
  `forum_password` varchar(32) default NULL,
  `forum_use_password` char(1) default NULL,
  `moderator_group` varchar(200) default NULL,
  `approval_type` varchar(20) default NULL,
  `outbound_address` varchar(250) default NULL,
  `outbound_mails_for_inbound_mails` char(1) default NULL,
  `outbound_mails_reply_link` char(1) default NULL,
  `outbound_from` varchar(250) default NULL,
  `inbound_pop_server` varchar(250) default NULL,
  `inbound_pop_port` int(4) default NULL,
  `inbound_pop_user` varchar(200) default NULL,
  `inbound_pop_password` varchar(80) default NULL,
  `topic_smileys` char(1) default NULL,
  `ui_avatar` char(1) default NULL,
  `ui_flag` char(1) default NULL,
  `ui_posts` char(1) default NULL,
  `ui_email` char(1) default NULL,
  `ui_online` char(1) default NULL,
  `topic_summary` char(1) default NULL,
  `show_description` char(1) default NULL,
  `topics_list_replies` char(1) default NULL,
  `topics_list_reads` char(1) default NULL,
  `topics_list_pts` char(1) default NULL,
  `topics_list_lastpost` char(1) default NULL,
  `topics_list_lastpost_title` char(1) default NULL,
  `topics_list_lastpost_avatar` char(1) default NULL,
  `topics_list_author` char(1) default NULL,
  `topics_list_author_avatar` char(1) default NULL,
  `vote_threads` char(1) default NULL,
  `forum_last_n` int(2) default 0,
  `threadStyle` varchar(100) default NULL,
  `commentsPerPage` varchar(100) default NULL,
  `is_flat` char(1) default NULL,
  `mandatory_contribution` char(1) default NULL,
  PRIMARY KEY (`forumId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_forums_queue` (
  `qId` int(14) NOT NULL auto_increment,
  `object` varchar(32) default NULL,
  `parentId` int(14) default NULL,
  `forumId` int(14) default NULL,
  `timestamp` int(14) default NULL,
  `user` varchar(200) default '',
  `title` varchar(240) default NULL,
  `data` text,
  `type` varchar(60) default NULL,
  `hash` varchar(32) default NULL,
  `topic_smiley` varchar(80) default NULL,
  `topic_title` varchar(240) default NULL,
  `summary` varchar(240) default NULL,
  `in_reply_to` varchar(128) default NULL,
  `tags` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  PRIMARY KEY (`qId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_forums_reported` (
  `threadId` int(12) NOT NULL default '0',
  `forumId` int(12) NOT NULL default '0',
  `parentId` int(12) NOT NULL default '0',
  `user` varchar(200) default '',
  `timestamp` int(14) default NULL,
  `reason` varchar(250) default NULL,
  PRIMARY KEY (`threadId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_galleries` (
  `galleryId` int(14) NOT NULL auto_increment,
  `name` varchar(80) NOT NULL default '',
  `description` text,
  `created` int(14) default NULL,
  `lastModif` int(14) default NULL,
  `visible` char(1) default NULL,
  `geographic` char(1) default NULL,
  `theme` varchar(60) default NULL,
  `user` varchar(200) default '',
  `hits` int(14) default NULL,
  `maxRows` int(10) default NULL,
  `rowImages` int(10) default NULL,
  `thumbSizeX` int(10) default NULL,
  `thumbSizeY` int(10) default NULL,
  `public` char(1) default NULL,
  `sortorder` varchar(20) NOT NULL default 'created',
  `sortdirection` varchar(4) NOT NULL default 'desc',
  `galleryimage` varchar(20) NOT NULL default 'first',
  `parentgallery` int(14) NOT NULL default -1,
  `showname` char(1) NOT NULL default 'y',
  `showimageid` char(1) NOT NULL default 'n',
  `showdescription` char(1) NOT NULL default 'n',
  `showcreated` char(1) NOT NULL default 'n',
  `showuser` char(1) NOT NULL default 'n',
  `showhits` char(1) NOT NULL default 'y',
  `showxysize` char(1) NOT NULL default 'y',
  `showfilesize` char(1) NOT NULL default 'n',
  `showfilename` char(1) NOT NULL default 'n',
  `defaultscale` varchar(10) NOT NULL DEFAULT 'o',
  `showcategories` char(1) NOT NULL default 'n', 
  PRIMARY KEY (`galleryId`),
  KEY `name` (name),
  KEY `description` (description(255)),
  KEY `hits` (hits),
  KEY `parentgallery` (parentgallery),
  KEY `visibleUser` (visible, user),
  FULLTEXT KEY `ft` (name,description)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_galleries_scales` (
  `galleryId` int(14) NOT NULL default '0',
  `scale` int(11) NOT NULL default '0',
  PRIMARY KEY (`galleryId`,`scale`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_group_inclusion` (
  `groupName` varchar(255) NOT NULL default '',
  `includeGroup` varchar(255) NOT NULL default '',
  PRIMARY KEY (`groupName`(120),`includeGroup`(120))
) ENGINE=MyISAM;

CREATE TABLE `tiki_group_watches` (
  `watchId` int(12) NOT NULL auto_increment,
  `group` varchar(200) NOT NULL default '',
  `event` varchar(40) NOT NULL default '',
  `object` varchar(200) NOT NULL default '',
  `title` varchar(250) default NULL,
  `type` varchar(200) default NULL,
  `url` varchar(250) default NULL,
  PRIMARY KEY (`watchId`),
  INDEX `event-object-group` ( `event` , `object` ( 100 ) , `group` ( 50 ) ) 
) ENGINE=MyISAM;

CREATE TABLE `tiki_history` (
  `historyId` int(12) NOT NULL auto_increment,
  `pageName` varchar(160) NOT NULL default '',
  `version` int(8) NOT NULL default '0',
  `version_minor` int(8) NOT NULL default '0',
  `lastModif` int(14) default NULL,
  `description` varchar(200) default NULL,
  `user` varchar(200) not null default '',
  `ip` varchar(15) default NULL,
  `comment` varchar(200) default NULL,
  `data` longblob,
  `type` varchar(50) default NULL,
  `is_html` TINYINT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`pageName`,`version`),
  KEY `user` (`user`),
  KEY (`historyId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_hotwords` (
  `word` varchar(40) NOT NULL default '',
  `url` varchar(255) NOT NULL default '',
  PRIMARY KEY (`word`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_html_pages` (
  `pageName` varchar(200) NOT NULL default '',
  `content` longblob,
  `refresh` int(10) default NULL,
  `type` char(1) default NULL,
  `created` int(14) default NULL,
  PRIMARY KEY (`pageName`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_html_pages_dynamic_zones` (
  `pageName` varchar(40) NOT NULL default '',
  `zone` varchar(80) NOT NULL default '',
  `type` char(2) default NULL,
  `content` text,
  PRIMARY KEY (`pageName`,`zone`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_images` (
  `imageId` int(14) NOT NULL auto_increment,
  `galleryId` int(14) NOT NULL default '0',
  `name` varchar(200) NOT NULL default '',
  `description` text,
  `lon` float default NULL,
  `lat` float default NULL,
  `created` int(14) default NULL,
  `user` varchar(200) default '',
  `hits` int(14) default NULL,
  `path` varchar(255) default NULL,
  PRIMARY KEY (`imageId`),
  KEY `name` (name),
  KEY `description` (description(255)),
  KEY `hits` (hits),
  KEY `ti_gId` (`galleryId`),
  KEY `ti_cr` (created),
  KEY `ti_us` (user),
  FULLTEXT KEY `ft` (name,description)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_images_data` (
  `imageId` int(14) NOT NULL default '0',
  `xsize` int(8) NOT NULL default '0',
  `ysize` int(8) NOT NULL default '0',
  `type` char(1) NOT NULL default '',
  `filesize` int(14) default NULL,
  `filetype` varchar(80) default NULL,
  `filename` varchar(80) default NULL,
  `data` longblob,
  `etag` varchar(32) default NULL,
  PRIMARY KEY (`imageId`,`xsize`,`ysize`,`type`),
  KEY `t_i_d_it` (`imageId`,type)
) ENGINE=MyISAM;

CREATE TABLE `tiki_language` (
  `id` int(14) NOT NULL auto_increment,
  `source` tinytext NOT NULL,
  `lang` char(16) NOT NULL default '',
  `tran` tinytext,
  `changed` bool,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_link_cache` (
  `cacheId` int(14) NOT NULL auto_increment,
  `url` varchar(250) default NULL,
  `data` longblob,
  `refresh` int(14) default NULL,
  PRIMARY KEY (`cacheId`),
  KEY `url` (url)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_links` (
  `fromPage` varchar(160) NOT NULL default '',
  `toPage` varchar(160) NOT NULL default '',
  `reltype` varchar(50),
  PRIMARY KEY (`fromPage`,`toPage`),
  KEY `toPage` (`toPage`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_live_support_events` (
  `eventId` int(14) NOT NULL auto_increment,
  `reqId` varchar(32) NOT NULL default '',
  `type` varchar(40) default NULL,
  `seqId` int(14) default NULL,
  `senderId` varchar(32) default NULL,
  `data` text,
  `timestamp` int(14) default NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_live_support_message_comments` (
  `cId` int(12) NOT NULL auto_increment,
  `msgId` int(12) default NULL,
  `data` text,
  `timestamp` int(14) default NULL,
  PRIMARY KEY (`cId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_live_support_messages` (
  `msgId` int(12) NOT NULL auto_increment,
  `data` text,
  `timestamp` int(14) default NULL,
  `user` varchar(200) not null default '',
  `username` varchar(200) default NULL,
  `priority` int(2) default NULL,
  `status` char(1) default NULL,
  `assigned_to` varchar(200) default NULL,
  `resolution` varchar(100) default NULL,
  `title` varchar(200) default NULL,
  `module` int(4) default NULL,
  `email` varchar(250) default NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_live_support_modules` (
  `modId` int(4) NOT NULL auto_increment,
  `name` varchar(90) default NULL,
  PRIMARY KEY (`modId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_live_support_operators` (
  `user` varchar(200) NOT NULL default '',
  `accepted_requests` int(10) default NULL,
  `status` varchar(20) default NULL,
  `longest_chat` int(10) default NULL,
  `shortest_chat` int(10) default NULL,
  `average_chat` int(10) default NULL,
  `last_chat` int(14) default NULL,
  `time_online` int(10) default NULL,
  `votes` int(10) default NULL,
  `points` int(10) default NULL,
  `status_since` int(14) default NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_live_support_requests` (
  `reqId` varchar(32) NOT NULL default '',
  `user` varchar(200) NOT NULL default '',
  `tiki_user` varchar(200) default NULL,
  `email` varchar(200) default NULL,
  `operator` varchar(200) default NULL,
  `operator_id` varchar(32) default NULL,
  `user_id` varchar(32) default NULL,
  `reason` text,
  `req_timestamp` int(14) default NULL,
  `timestamp` int(14) default NULL,
  `status` varchar(40) default NULL,
  `resolution` varchar(40) default NULL,
  `chat_started` int(14) default NULL,
  `chat_ended` int(14) default NULL,
  PRIMARY KEY (`reqId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_logs` (
  `logId` int(8) NOT NULL auto_increment,
  `logtype` varchar(20) NOT NULL,
  `logmessage` text NOT NULL,
  `loguser` varchar(40) NOT NULL,
  `logip` varchar(200),
  `logclient` text NOT NULL,
  `logtime` int(14) NOT NULL,
  PRIMARY KEY (`logId`),
  KEY `logtype` (logtype)
) ENGINE=MyISAM;

CREATE TABLE `tiki_mail_events` (
  `event` varchar(200) default NULL,
  `object` varchar(200) default NULL,
  `email` varchar(200) default NULL
) ENGINE=MyISAM;

CREATE TABLE `tiki_mailin_accounts` (
  `accountId` int(12) NOT NULL auto_increment,
  `user` varchar(200) NOT NULL default '',
  `account` varchar(50) NOT NULL default '',
  `pop` varchar(255) default NULL,
  `port` int(4) default NULL,
  `username` varchar(100) default NULL,
  `pass` varchar(100) default NULL,
  `active` char(1) default NULL,
  `type` varchar(40) default NULL,
  `smtp` varchar(255) default NULL,
  `useAuth` char(1) default NULL,
  `smtpPort` int(4) default NULL,
  `anonymous` char(1) NOT NULL default 'y',
  `attachments` char(1) NOT NULL default 'n',
  `article_topicId` int(4) default NULL,
  `article_type` varchar(50) default NULL,
  `discard_after` varchar(255) default NULL,
  PRIMARY KEY (`accountId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_menu_languages` (
  `menuId` int(8) NOT NULL auto_increment,
  `language` char(16) NOT NULL default '',
  PRIMARY KEY (`menuId`,`language`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_menu_options` (
  `optionId` int(8) NOT NULL auto_increment,
  `menuId` int(8) default NULL,
  `type` char(1) default NULL,
  `name` varchar(200) default NULL,
  `url` varchar(255) default NULL,
  `position` int(4) default NULL,
  `section` text default NULL,
  `perm` text default NULL,
  `groupname` text default NULL,
  `userlevel` int(4) default 0,
  `icon` varchar(200),
  PRIMARY KEY (`optionId`),
  UNIQUE KEY `uniq_menu` (`menuId`,`name`(30),`url`(50),`position`,`section`(60),`perm`(50),`groupname`(50))
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_menus` (
  `menuId` int(8) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `description` text,
  `type` char(1) default NULL,
  `icon` varchar(200) default NULL,
  `use_items_icons` char(1) NOT NULL DEFAULT 'n',
  PRIMARY KEY (`menuId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_minical_events` (
  `user` varchar(200) default '',
  `eventId` int(12) NOT NULL auto_increment,
  `title` varchar(250) default NULL,
  `description` text,
  `start` int(14) default NULL,
  `end` int(14) default NULL,
  `security` char(1) default NULL,
  `duration` int(3) default NULL,
  `topicId` int(12) default NULL,
  `reminded` char(1) default NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_minical_topics` (
  `user` varchar(200) default '',
  `topicId` int(12) NOT NULL auto_increment,
  `name` varchar(250) default NULL,
  `filename` varchar(200) default NULL,
  `filetype` varchar(200) default NULL,
  `filesize` varchar(200) default NULL,
  `data` longblob,
  `path` varchar(250) default NULL,
  `isIcon` char(1) default NULL,
  PRIMARY KEY (`topicId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_modules` (
  `moduleId` int(8) NOT NULL auto_increment,
  `name` varchar(200) NOT NULL default '',
  `position` char(1) NOT NULL DEFAULT '',
  `ord` int(4) NOT NULL DEFAULT '0',
  `type` char(1) default NULL,
  `title` varchar(255) default NULL,
  `cache_time` int(14) default NULL,
  `rows` int(4) default NULL,
  `params` text,
  `groups` text,
  PRIMARY KEY (`moduleId`),
  KEY `positionType` (position, type),
  KEY `namePosOrdParam` (`name`(100), `position`, `ord`, `params`(140))
) ENGINE=MyISAM;

CREATE TABLE `tiki_newsletter_subscriptions` (
  `nlId` int(12) NOT NULL default '0',
  `email` varchar(255) NOT NULL default '',
  `code` varchar(32) default NULL,
  `valid` char(1) default NULL,
  `subscribed` int(14) default NULL,
  `isUser` char(1) NOT NULL default 'n',
  `included` char(1) NOT NULL default 'n',
  PRIMARY KEY (`nlId`,`email`,`isUser`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_newsletter_groups` (
  `nlId` int(12) NOT NULL default '0',
  `groupName` varchar(255) NOT NULL default '',
  `code` varchar(32) default NULL,
  PRIMARY KEY (`nlId`,`groupName`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_newsletter_included` (
  `nlId` int(12) NOT NULL default '0',
  `includedId` int(12) NOT NULL default '0',
  PRIMARY KEY (`nlId`,`includedId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_newsletter_pages` (
    `nlId` INT( 12 ) NOT NULL ,
    `wikiPageName` VARCHAR( 160 ) NOT NULL ,
    `validateAddrs` CHAR( 1 ) NOT NULL DEFAULT 'n',
    `addToList` CHAR( 1 ) NOT NULL DEFAULT 'n',
    PRIMARY KEY ( `nlId` , `wikiPageName` )
) ENGINE = MYISAM ;

CREATE TABLE `tiki_newsletters` (
  `nlId` int(12) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `description` text,
  `created` int(14) default NULL,
  `lastSent` int(14) default NULL,
  `editions` int(10) default NULL,
  `users` int(10) default NULL,
  `allowUserSub` char(1) default 'y',
  `allowAnySub` char(1) default NULL,
  `unsubMsg` char(1) default 'y',
  `validateAddr` char(1) default 'y',
  `frequency` int(14) default NULL,
  `allowTxt` char(1) default 'y',
  `author` varchar(200) default NULL,
  `allowArticleClip` char(1) default 'y',
  `autoArticleClip` char(1) default 'n',
  `articleClipTypes` text,
  `articleClipRange` int(14) default NULL,
  PRIMARY KEY (`nlId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_page_footnotes` (
  `user` varchar(200) NOT NULL default '',
  `pageName` varchar(250) NOT NULL default '',
  `data` text,
  PRIMARY KEY (`user`(150),`pageName`(100))
) ENGINE=MyISAM;

CREATE TABLE `tiki_pages` (
  `page_id` int(14) NOT NULL auto_increment,
  `pageName` varchar(160) NOT NULL default '',
  `hits` int(8) default NULL,
  `data` mediumtext,
  `description` varchar(200) default NULL,
  `lastModif` int(14) default NULL,
  `comment` varchar(200) default NULL,
  `version` int(8) NOT NULL default '0',
  `version_minor` int(8) NOT NULL default '0',
  `user` varchar(200) default '',
  `ip` varchar(15) default NULL,
  `flag` char(1) default NULL,
  `points` int(8) default NULL,
  `votes` int(8) default NULL,
  `cache` longtext,
  `wiki_cache` int(10) default NULL,
  `cache_timestamp` int(14) default NULL,
  `pageRank` decimal(4,3) default NULL,
  `creator` varchar(200) default NULL,
  `page_size` int(10) unsigned default '0',
  `lang` varchar(16) default NULL,
  `lockedby` varchar(200) default NULL,
  `is_html` tinyint(1) default 0,
  `created` int(14),
  `wysiwyg` char(1) default NULL,
  `wiki_authors_style` varchar(20) default '',
  `comments_enabled` char(1) default NULL,
  `keywords` TEXT, 
  PRIMARY KEY (`page_id`),
  UNIQUE KEY `pageName` (`pageName`),
  KEY `data` (`data`(255)),
  KEY `pageRank` (`pageRank`),
  FULLTEXT KEY `ft` (`pageName`,`description`,`data`),
  KEY `lastModif`(`lastModif`)
) ENGINE=MyISAM AUTO_INCREMENT=1;

CREATE TABLE `tiki_page_drafts` (
  `user` varchar(200) default '',
  `pageName` varchar(255) NOT NULL,
  `data` mediumtext,
  `description` varchar(200) default NULL,
  `comment` varchar(200) default NULL,
  `lastModif` int(14) default NULL,
  PRIMARY KEY (`pageName`(120), `user`(120))
) ENGINE=MyISAM;

CREATE TABLE `tiki_pageviews` (
  `day` int(14) NOT NULL default '0',
  `pageviews` int(14) default NULL,
  PRIMARY KEY (`day`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_poll_objects` (
  `catObjectId` int(11) NOT NULL default '0',
  `pollId` int(11) NOT NULL default '0',
  `title` varchar(255) default NULL,
  PRIMARY KEY (`catObjectId`,`pollId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_poll_options` (
  `pollId` int(8) NOT NULL default '0',
  `optionId` int(8) NOT NULL auto_increment,
  `title` varchar(200) default NULL,
  `position` int(4) NOT NULL default '0',
  `votes` int(8) default NULL,
  PRIMARY KEY (`optionId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_polls` (
  `pollId` int(8) NOT NULL auto_increment,
  `title` varchar(200) default NULL,
  `votes` int(8) default NULL,
  `active` char(1) default NULL,
  `publishDate` int(14) default NULL,
  `voteConsiderationSpan` int(4) default 0,
  PRIMARY KEY (`pollId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_preferences` (
  `name` varchar(40) NOT NULL default '',
  `value` text,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_private_messages` (
  `messageId` int(8) NOT NULL auto_increment,
  `toNickname` varchar(200) NOT NULL default '',
  `poster` varchar(200) NOT NULL default 'anonymous',
  `timestamp` int(14) default NULL,
  `received` tinyint(1) not null default 0,
  `message` varchar(255) default NULL,
  PRIMARY KEY (`messageId`),
  KEY (`received`),
  KEY (`timestamp`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_programmed_content` (
  `pId` int(8) NOT NULL auto_increment,
  `contentId` int(8) NOT NULL default '0',
  `content_type` VARCHAR( 20 ) NOT NULL DEFAULT 'static',
  `publishDate` int(14) NOT NULL default '0',
  `data` text,
  PRIMARY KEY (`pId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_quiz_question_options` (
  `optionId` int(10) NOT NULL auto_increment,
  `questionId` int(10) default NULL,
  `optionText` text,
  `points` int(4) default NULL,
  PRIMARY KEY (`optionId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_quiz_questions` (
  `questionId` int(10) NOT NULL auto_increment,
  `quizId` int(10) default NULL,
  `question` text,
  `position` int(4) default NULL,
  `type` char(1) default NULL,
  `maxPoints` int(4) default NULL,
  PRIMARY KEY (`questionId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_quiz_results` (
  `resultId` int(10) NOT NULL auto_increment,
  `quizId` int(10) default NULL,
  `fromPoints` int(4) default NULL,
  `toPoints` int(4) default NULL,
  `answer` text,
  PRIMARY KEY (`resultId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_quiz_stats` (
  `quizId` int(10) NOT NULL default '0',
  `questionId` int(10) NOT NULL default '0',
  `optionId` int(10) NOT NULL default '0',
  `votes` int(10) default NULL,
  PRIMARY KEY (`quizId`,`questionId`,`optionId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_quiz_stats_sum` (
  `quizId` int(10) NOT NULL default '0',
  `quizName` varchar(255) default NULL,
  `timesTaken` int(10) default NULL,
  `avgpoints` decimal(5,2) default NULL,
  `avgavg` decimal(5,2) default NULL,
  `avgtime` decimal(5,2) default NULL,
  PRIMARY KEY (`quizId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_quizzes` (
  `quizId` int(10) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `canRepeat` char(1) default NULL,
  `storeResults` char(1) default NULL,
  `questionsPerPage` int(4) default NULL,
  `timeLimited` char(1) default NULL,
  `timeLimit` int(14) default NULL,
  `created` int(14) default NULL,
  `taken` int(10) default NULL,
  `immediateFeedback` char(1) default NULL,
  `showAnswers` char(1) default NULL,
  `shuffleQuestions` char(1) default NULL,
  `shuffleAnswers` char(1) default NULL,
  `publishDate` int(14) default NULL,
  `expireDate` int(14) default NULL,
  `bDeleted` char(1) default NULL,
  `nAuthor` int(4) default NULL,
  `bOnline` char(1) default NULL,
  `bRandomQuestions` char(1) default NULL,
  `nRandomQuestions` tinyint(4) default NULL,
  `bLimitQuestionsPerPage` char(1) default NULL,
  `nLimitQuestionsPerPage` tinyint(4) default NULL,
  `bMultiSession` char(1) default NULL,
  `nCanRepeat` tinyint(4) default NULL,
  `sGradingMethod` varchar(80) default NULL,
  `sShowScore` varchar(80) default NULL,
  `sShowCorrectAnswers` varchar(80) default NULL,
  `sPublishStats` varchar(80) default NULL,
  `bAdditionalQuestions` char(1) default NULL,
  `bForum` char(1) default NULL,
  `sForum` varchar(80) default NULL,
  `sPrologue` text,
  `sData` text,
  `sEpilogue` text,
  `passingperct` int(4) default 0,
  PRIMARY KEY (`quizId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_received_articles` (
  `receivedArticleId` int(14) NOT NULL auto_increment,
  `receivedFromSite` varchar(200) default NULL,
  `receivedFromUser` varchar(200) default NULL,
  `receivedDate` int(14) default NULL,
  `title` varchar(80) default NULL,
  `authorName` varchar(60) default NULL,
  `size` int(12) default NULL,
  `useImage` char(1) default NULL,
  `image_name` varchar(80) default NULL,
  `image_type` varchar(80) default NULL,
  `image_size` int(14) default NULL,
  `image_x` int(4) default NULL,
  `image_y` int(4) default NULL,
  `image_data` longblob,
  `publishDate` int(14) default NULL,
  `expireDate` int(14) default NULL,
  `created` int(14) default NULL,
  `heading` text,
  `body` longblob,
  `hash` varchar(32) default NULL,
  `author` varchar(200) default NULL,
  `type` varchar(50) default NULL,
  `rating` decimal(3,2) default NULL,
  PRIMARY KEY (`receivedArticleId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_received_pages` (
  `receivedPageId` int(14) NOT NULL auto_increment,
  `pageName` varchar(160) NOT NULL default '',
  `data` longblob,
  `description` varchar(200) default NULL,
  `comment` varchar(200) default NULL,
  `receivedFromSite` varchar(200) default NULL,
  `receivedFromUser` varchar(200) default NULL,
  `receivedDate` int(14) default NULL,
  `parent` varchar(255) default NULL,
  `position` tinyint(3) unsigned default NULL,
  `alias` varchar(255) default NULL,
  `structureName` varchar(250) default NULL,
  `parentName` varchar(250) default NULL,
  `page_alias` varchar(250) default '',
  `pos` int(4) default NULL,
  PRIMARY KEY (`receivedPageId`),
  KEY `structureName` (`structureName`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_referer_stats` (
  `referer` varchar(255) NOT NULL default '',
  `hits` int(10) default NULL,
  `last` int(14) default NULL,
  PRIMARY KEY (`referer`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_related_categories` (
  `categId` int(10) NOT NULL default '0',
  `relatedTo` int(10) NOT NULL default '0',
  PRIMARY KEY (`categId`,`relatedTo`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_rss_modules` (
  `rssId` int(8) NOT NULL auto_increment,
  `name` varchar(30) NOT NULL default '',
  `description` text,
  `url` varchar(255) NOT NULL default '',
  `refresh` int(8) default NULL,
  `lastUpdated` int(14) default NULL,
  `showTitle` char(1) default 'n',
  `showPubDate` char(1) default 'n',
  `sitetitle` VARCHAR(255),
  `siteurl` VARCHAR(255),
  `actions` TEXT,
  PRIMARY KEY (`rssId`),
  KEY `name` (name)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_rss_feeds` (
  `name` varchar(60) NOT NULL default '',
  `rssVer` char(1) NOT NULL default '1',
  `refresh` int(8) default '300',
  `lastUpdated` int(14) default NULL,
  `cache` longblob,
  PRIMARY KEY (`name`,`rssVer`)
) ENGINE=MyISAM;

CREATE TABLE tiki_searchindex(
  `searchword` varchar(80) NOT NULL default '',
  `location` varchar(80) NOT NULL default '',
  `page` varchar(255) NOT NULL default '',
  `count` int(11) NOT NULL default '1',
  `last_update` int(11) NOT NULL default '0',
  PRIMARY KEY (`searchword`,`location`,`page`(80)),
  KEY `last_update` (last_update),
  KEY `location` (location(50), page(200))
) ENGINE=MyISAM;

CREATE TABLE tiki_searchsyllable(
  `syllable` varchar(80) NOT NULL default '',
  `lastUsed` int(11) NOT NULL default '0',
  `lastUpdated` int(11) NOT NULL default '0',
  PRIMARY KEY (`syllable`),
  KEY `lastUsed` (`lastUsed`)
) ENGINE=MyISAM;

CREATE TABLE tiki_searchwords(
  `syllable` varchar(80) NOT NULL default '',
  `searchword` varchar(80) NOT NULL default '',
  PRIMARY KEY (`syllable`,`searchword`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_search_stats` (
  `term` varchar(50) NOT NULL default '',
  `hits` int(10) default NULL,
  PRIMARY KEY (`term`)
) ENGINE=MyISAM;

CREATE TABLE tiki_secdb(
  `md5_value` varchar(32) NOT NULL,
  `filename` varchar(250) NOT NULL,
  `tiki_version` varchar(60) NOT NULL,
  `severity` int(4) NOT NULL default '0',
  PRIMARY KEY (`md5_value`,`filename`(100),`tiki_version`),
  KEY `sdb_fn` (filename)
) ENGINE=MyISAM;

CREATE TABLE `tiki_semaphores` (
  `semName` varchar(250) NOT NULL default '',
  `objectType` varchar(20) default 'wiki page',
  `user` varchar(200) NOT NULL default '',
  `timestamp` int(14) default NULL,
  PRIMARY KEY (`semName`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_sent_newsletters` (
  `editionId` int(12) NOT NULL auto_increment,
  `nlId` int(12) NOT NULL default '0',
  `users` int(10) default NULL,
  `sent` int(14) default NULL,
  `subject` varchar(200) default NULL,
  `data` longblob,
  `datatxt` longblob,
  `wysiwyg` char(1) default NULL,
  PRIMARY KEY (`editionId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_sent_newsletters_errors` (
  `editionId` int(12),
  `email` varchar(255),
  `login` varchar(40) default '',
  `error` char(1) default '',
  KEY (`editionId`)
) ENGINE=MyISAM ;

CREATE TABLE `tiki_sessions` (
  `sessionId` varchar(32) NOT NULL default '',
  `user` varchar(200) default '',
  `timestamp` int(14) default NULL,
  `tikihost` varchar(200) default NULL,
  PRIMARY KEY (`sessionId`),
  KEY `user` (user),
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_sheet_layout` (
  `sheetId` int(8) NOT NULL default '0',
  `begin` int(10) NOT NULL default '0',
  `end` int(10) default NULL,
  `headerRow` int(4) NOT NULL default '0',
  `footerRow` int(4) NOT NULL default '0',
  `className` varchar(64) default NULL,
  `parseValues` char( 1 ) NOT NULL default 'n',
  UNIQUE KEY `sheetId` (`sheetId`, `begin`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_sheet_values` (
  `sheetId` int(8) NOT NULL default '0',
  `begin` int(10) NOT NULL default '0',
  `end` int(10) default NULL,
  `rowIndex` int(4) NOT NULL default '0',
  `columnIndex` int(4) NOT NULL default '0',
  `value` varchar(255) default NULL,
  `calculation` varchar(255) default NULL,
  `width` int(4) NOT NULL default '1',
  `height` int(4) NOT NULL default '1',
  `format` varchar(255) default NULL,
  `user` varchar(200) default '',
  UNIQUE KEY `sheetId` (`sheetId`,begin,`rowIndex`,`columnIndex`),
  KEY `sheetId_2` (`sheetId`,`rowIndex`,`columnIndex`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_sheets` (
  `sheetId` int(8) NOT NULL auto_increment,
  `title` varchar(200) NOT NULL default '',
  `description` text,
  `author` varchar(200) NOT NULL default '',
  `parentSheetId` int(8) NULL,
  PRIMARY KEY (`sheetId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_shoutbox` (
  `msgId` int(10) NOT NULL auto_increment,
  `message` varchar(255) default NULL,
  `timestamp` int(14) default NULL,
  `user` varchar(200) NULL default '',
  `hash` varchar(32) default NULL,
  `tweetId` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`msgId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_shoutbox_words` (
  `word` VARCHAR( 40 ) NOT NULL ,
  `qty` INT DEFAULT '0' NOT NULL ,
  PRIMARY KEY (`word`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_structure_versions` (
  `structure_id` int(14) NOT NULL auto_increment,
  `version` int(14) default NULL,
  PRIMARY KEY (`structure_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_structures` (
  `page_ref_id` int(14) NOT NULL auto_increment,
  `structure_id` int(14) NOT NULL,
  `parent_id` int(14) default NULL,
  `page_id` int(14) NOT NULL,
  `page_version` int(8) default NULL,
  `page_alias` varchar(240) NOT NULL default '',
  `pos` int(4) default NULL,
  PRIMARY KEY (`page_ref_id`),
  KEY `pidpaid` (page_id,parent_id),
  KEY `page_id` (page_id)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_submissions` (
  `subId` int(8) NOT NULL auto_increment,
  `topline` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `subtitle` varchar(255) default NULL,
  `linkto` varchar(255) default NULL,
  `lang` varchar(16) default NULL,
  `authorName` varchar(60) default NULL,
  `topicId` int(14) default NULL,
  `topicName` varchar(40) default NULL,
  `size` int(12) default NULL,
  `useImage` char(1) default NULL,
  `image_name` varchar(80) default NULL,
  `image_caption` text default NULL,
  `image_type` varchar(80) default NULL,
  `image_size` int(14) default NULL,
  `image_x` int(4) default NULL,
  `image_y` int(4) default NULL,
  `image_data` longblob,
  `publishDate` int(14) default NULL,
  `expireDate` int(14) default NULL,
  `created` int(14) default NULL,
  `bibliographical_references` text,
  `resume` text,
  `heading` text,
  `body` text,
  `hash` varchar(32) default NULL,
  `author` varchar(200) NOT NULL default '',
  `nbreads` int(14) default NULL,
  `votes` int(8) default NULL,
  `points` int(14) default NULL,
  `type` varchar(50) default NULL,
  `rating` decimal(3,2) default NULL,
  `isfloat` char(1) default NULL,
  PRIMARY KEY (`subId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_suggested_faq_questions` (
  `sfqId` int(10) NOT NULL auto_increment,
  `faqId` int(10) NOT NULL default '0',
  `question` text,
  `answer` text,
  `created` int(14) default NULL,
  `user` varchar(200) NOT NULL default '',
  PRIMARY KEY (`sfqId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_survey_question_options` (
  `optionId` int(12) NOT NULL auto_increment,
  `questionId` int(12) NOT NULL default '0',
  `qoption` text,
  `votes` int(10) default NULL,
  PRIMARY KEY (`optionId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_survey_questions` (
  `questionId` int(12) NOT NULL auto_increment,
  `surveyId` int(12) NOT NULL default '0',
  `question` text,
  `options` text,
  `type` char(1) default NULL,
  `position` int(5) default NULL,
  `votes` int(10) default NULL,
  `value` int(10) default NULL,
  `average` decimal(4,2) default NULL,
  `mandatory` char(1) NOT NULL default 'n',
  `max_answers` int(5) NOT NULL default 0,
  `min_answers` int(5) NOT NULL default 0,
  PRIMARY KEY (`questionId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_surveys` (
  `surveyId` int(12) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `description` text,
  `taken` int(10) default NULL,
  `lastTaken` int(14) default NULL,
  `created` int(14) default NULL,
  `status` char(1) default NULL,
  PRIMARY KEY (`surveyId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_tags` (
  `tagName` varchar(80) NOT NULL default '',
  `pageName` varchar(160) NOT NULL default '',
  `hits` int(8) default NULL,
  `description` varchar(200) default NULL,
  `data` longblob,
  `lastModif` int(14) default NULL,
  `comment` varchar(200) default NULL,
  `version` int(8) NOT NULL default '0',
  `user` varchar(200) NOT NULL default '',
  `ip` varchar(15) default NULL,
  `flag` char(1) default NULL,
  PRIMARY KEY (`tagName`,`pageName`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_theme_control_categs` (
  `categId` int(12) NOT NULL default '0',
  `theme` varchar(250) NOT NULL default '',
  PRIMARY KEY (`categId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_theme_control_objects` (
  `objId` varchar(250) NOT NULL default '',
  `type` varchar(250) NOT NULL default '',
  `name` varchar(250) NOT NULL default '',
  `theme` varchar(250) NOT NULL default '',
  PRIMARY KEY (`objId`(100), `type`(100))
) ENGINE=MyISAM;

CREATE TABLE `tiki_theme_control_sections` (
  `section` varchar(250) NOT NULL default '',
  `theme` varchar(250) NOT NULL default '',
  PRIMARY KEY (`section`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_topics` (
  `topicId` int(14) NOT NULL auto_increment,
  `name` varchar(40) default NULL,
  `image_name` varchar(80) default NULL,
  `image_type` varchar(80) default NULL,
  `image_size` int(14) default NULL,
  `image_data` longblob,
  `active` char(1) default NULL,
  `created` int(14) default NULL,
  PRIMARY KEY (`topicId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_tracker_fields` (
  `fieldId` int(12) NOT NULL auto_increment,
  `trackerId` int(12) NOT NULL default '0',
  `name` varchar(255) default NULL,
  `options` text,
  `type` varchar(15) default NULL,
  `isMain` char(1) default NULL,
  `isTblVisible` char(1) default NULL,
  `position` int(4) default NULL,
  `isSearchable` char(1) NOT NULL default 'y',
  `isPublic` char(1) NOT NULL default 'n',
  `isHidden` char(1) NOT NULL default 'n',
  `isMandatory` char(1) NOT NULL default 'n',
  `description` text,
  `isMultilingual` char(1) default 'n',
  `itemChoices` text,
  `errorMsg` text,
  `visibleBy` text,
  `editableBy` text,
  `descriptionIsParsed` char(1) default 'n',
  `validation` varchar(255) default '',
  `validationParam` varchar(255) default '',
  `validationMessage` varchar(255) default '',
  PRIMARY KEY (`fieldId`),
  INDEX `trackerId` (`trackerId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_tracker_item_attachments` (
  `attId` int(12) NOT NULL auto_increment,
  `itemId` int(12) NOT NULL default 0,
  `filename` varchar(80) default NULL,
  `filetype` varchar(80) default NULL,
  `filesize` int(14) default NULL,
  `user` varchar(200) default NULL,
  `data` longblob,
  `path` varchar(255) default NULL,
  `hits` int(10) default NULL,
  `created` int(14) default NULL,
  `comment` varchar(250) default NULL,
  `longdesc` blob,
  `version` varchar(40) default NULL,
  PRIMARY KEY (`attId`),
  INDEX `itemId` (`itemId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_tracker_item_comments` (
  `commentId` int(12) NOT NULL auto_increment,
  `itemId` int(12) NOT NULL default '0',
  `user` varchar(200) default NULL,
  `data` text,
  `title` varchar(200) default NULL,
  `posted` int(14) default NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_tracker_item_fields` (
  `itemId` int(12) NOT NULL default '0',
  `fieldId` int(12) NOT NULL default '0',
  `value` text,
  `lang` char(16) default NULL,
  PRIMARY KEY (`itemId`,`fieldId`,`lang`),
  INDEX `fieldId` (`fieldId`),
  INDEX value (value(250)),
  INDEX lang (lang),
  FULLTEXT KEY `ft` (value)
) ENGINE=MyISAM;

CREATE TABLE `tiki_tracker_item_field_logs` (
  `version` int(12) NOT NULL,
  `itemId` int(12) NOT NULL default '0',
  `fieldId` int(12) NOT NULL default '0',
  `value` text,
  `lang` char(16) default NULL,
  INDEX `version` (`version`),
  INDEX `itemId` (`itemId`),
  INDEX `fieldId` (`itemId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_tracker_items` (
  `itemId` int(12) NOT NULL auto_increment,
  `trackerId` int(12) NOT NULL default '0',
  `created` int(14) default NULL,
  `createdBy` varchar(200) default NULL,
  `status` char(1) default NULL,
  `lastModif` int(14) default NULL,
  `lastModifBy` varchar(200) default NULL,
  PRIMARY KEY (`itemId`),
  INDEX `trackerId` (`trackerId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_tracker_options` (
  `trackerId` int(12) NOT NULL default '0',
  `name` varchar(80) NOT NULL default '',
  `value` text default NULL,
  PRIMARY KEY (`trackerId`,`name`(30))
) ENGINE=MyISAM ;

CREATE TABLE `tiki_trackers` (
  `trackerId` int(12) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `description` text,
  `descriptionIsParsed` varchar(1) NULL default '0',
  `created` int(14) default NULL,
  `lastModif` int(14) default NULL,
  `showCreated` char(1) default NULL,
  `showStatus` char(1) default NULL,
  `showLastModif` char(1) default NULL,
  `useComments` char(1) default NULL,
  `useAttachments` char(1) default NULL,
  `showAttachments` char(1) default NULL,
  `items` int(10) default NULL,
  `showComments` char(1) default NULL,
  `orderAttachments` varchar(255) NOT NULL default 'filename,created,filesize,hits,desc',
  PRIMARY KEY (`trackerId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_untranslated` (
  `id` int(14) NOT NULL auto_increment,
  `source` tinyblob NOT NULL,
  `lang` char(16) NOT NULL default '',
  PRIMARY KEY (`source`(255),`lang`),
  UNIQUE KEY `id` (id),
  KEY `id_2` (id)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_answers` (
  `userResultId` int(10) NOT NULL default '0',
  `quizId` int(10) NOT NULL default '0',
  `questionId` int(10) NOT NULL default '0',
  `optionId` int(10) NOT NULL default '0',
  PRIMARY KEY (`userResultId`,`quizId`,`questionId`,`optionId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_answers_uploads` (
  `answerUploadId` int(4) NOT NULL auto_increment,
  `userResultId` int(11) NOT NULL default '0',
  `questionId` int(11) NOT NULL default '0',
  `filename` varchar(255) NOT NULL default '',
  `filetype` varchar(64) NOT NULL default '',
  `filesize` varchar(255) NOT NULL default '',
  `filecontent` longblob NOT NULL,
  PRIMARY KEY (`answerUploadId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_assigned_modules` (
  `moduleId` int(8) NOT NULL,
  `name` varchar(200) NOT NULL default '',
  `position` char(1) default NULL,
  `ord` int(4) default NULL,
  `type` char(1) default NULL,
  `user` varchar(200) NOT NULL default '',
  PRIMARY KEY (`name`(30),`user`,`position`, `ord`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_bookmarks_folders` (
  `folderId` int(12) NOT NULL auto_increment,
  `parentId` int(12) default NULL,
  `user` varchar(200) NOT NULL default '',
  `name` varchar(30) default NULL,
  PRIMARY KEY (`user`,`folderId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_bookmarks_urls` (
  `urlId` int(12) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `url` varchar(250) default NULL,
  `data` longblob,
  `lastUpdated` int(14) default NULL,
  `folderId` int(12) NOT NULL default '0',
  `user` varchar(200) NOT NULL default '',
  PRIMARY KEY (`urlId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_login_cookies` (
    `userId` INT NOT NULL,
    `secret` CHAR(64) NOT NULL,
    `expiration` TIMESTAMP NOT NULL,
    PRIMARY KEY (`userId`, `secret`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_mail_accounts` (
  `accountId` int(12) NOT NULL auto_increment,
  `user` varchar(200) NOT NULL default '',
  `account` varchar(50) NOT NULL default '',
  `pop` varchar(255) default NULL,
  `current` char(1) default NULL,
  `port` int(4) default NULL,
  `username` varchar(100) default NULL,
  `pass` varchar(100) default NULL,
  `msgs` int(4) default NULL,
  `smtp` varchar(255) default NULL,
  `useAuth` char(1) default NULL,
  `smtpPort` int(4) default NULL,
  `flagsPublic` char(1) default 'n',                -- COMMENT 'MatWho - Shared Group Mail box if y',
  `autoRefresh` int(4) NOT NULL default 0,        -- COMMENT 'seconds for mail list to refresh, 0 = none',
  `imap` varchar( 255 ) default NULL,
  `mbox` varchar( 255 ) default NULL,
  `maildir` varchar( 255 ) default NULL,
  `useSSL` char( 1 ) NOT NULL default 'n',
  `fromEmail` varchar( 255 ) NOT NULL default '',
  PRIMARY KEY (`accountId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_menus` (
  `user` varchar(200) NOT NULL default '',
  `menuId` int(12) NOT NULL auto_increment,
  `url` varchar(250) default NULL,
  `name` varchar(40) default NULL,
  `position` int(4) default NULL,
  `mode` char(1) default NULL,
  PRIMARY KEY (`menuId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_modules` (
  `name` varchar(200) NOT NULL default '',
  `title` varchar(40) default NULL,
  `data` longblob,
  `parse` char(1) default NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_notes` (
  `user` varchar(200) NOT NULL default '',
  `noteId` int(12) NOT NULL auto_increment,
  `created` int(14) default NULL,
  `name` varchar(255) default NULL,
  `lastModif` int(14) default NULL,
  `data` text,
  `size` int(14) default NULL,
  `parse_mode` varchar(20) default NULL,
  PRIMARY KEY (`noteId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_postings` (
  `user` varchar(200) NOT NULL default '',
  `posts` int(12) default NULL,
  `last` int(14) default NULL,
  `first` int(14) default NULL,
  `level` int(8) default NULL,
  PRIMARY KEY (`user`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_preferences` (
  `user` varchar(200) NOT NULL default '',
  `prefName` varchar(40) NOT NULL default '',
  `value` TEXT,
  PRIMARY KEY (`user`,`prefName`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_quizzes` (
  `user` varchar(200) default '',
  `quizId` int(10) default NULL,
  `timestamp` int(14) default NULL,
  `timeTaken` int(14) default NULL,
  `points` int(12) default NULL,
  `maxPoints` int(12) default NULL,
  `resultId` int(10) default NULL,
  `userResultId` int(10) NOT NULL auto_increment,
  PRIMARY KEY (`userResultId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_taken_quizzes` (
  `user` varchar(200) NOT NULL default '',
  `quizId` varchar(255) NOT NULL default '',
  PRIMARY KEY (`user`,`quizId`(50))
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_tasks_history` (
  `belongs_to` integer(14) NOT NULL,                   -- the first task in a history it has the same id as the task id
  `task_version` integer(4) NOT NULL DEFAULT 0,        -- version number for the history it starts with 0
  `title` varchar(250) NOT NULL,                       -- title
  `description` text DEFAULT NULL,                     -- description
  `start` integer(14) DEFAULT NULL,                    -- date of the starting, if it is not set than there is no starting date
  `end` integer(14) DEFAULT NULL,                      -- date of the end, if it is not set than there is not dealine
  `lasteditor` varchar(200) NOT NULL,                  -- lasteditor: username of last editior
  `lastchanges` integer(14) NOT NULL,                  -- date of last changes
  `priority` integer(2) NOT NULL DEFAULT 3,                     -- priority
  `completed` integer(14) DEFAULT NULL,                -- date of the completation if it is null it is not yet completed
  `deleted` integer(14) DEFAULT NULL,                  -- date of the deleteation it it is null it is not deleted
  `status` char(1) DEFAULT NULL,                       -- null := waiting, o := open / in progress, c := completed -> (percentage = 100)
  `percentage` int(4) DEFAULT NULL,
  `accepted_creator` char(1) DEFAULT NULL,             -- y - yes, n - no, null - waiting
  `accepted_user` char(1) DEFAULT NULL,                -- y - yes, n - no, null - waiting
  PRIMARY KEY (`belongs_to`, `task_version`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_user_tasks` (
  `taskId` integer(14) NOT NULL auto_increment,        -- task id
  `last_version` integer(4) NOT NULL DEFAULT 0,        -- last version of the task starting with 0
  `user` varchar(200) NOT NULL DEFAULT '',              -- task user
  `creator` varchar(200) NOT NULL,                     -- username of creator
  `public_for_group` varchar(30) DEFAULT NULL,         -- this group can also view the task, if it is null it is not public
  `rights_by_creator` char(1) DEFAULT NULL,            -- null the user can delete the task,
  `created` integer(14) NOT NULL,                      -- date of the creation
  `status` char(1) default NULL,
  `priority` int(2) default NULL,
  `completed` int(14) default NULL,
  `percentage` int(4) default NULL,
  PRIMARY KEY (`taskId`),
  UNIQUE(creator, created)
) ENGINE=MyISAM AUTO_INCREMENT=1;

CREATE TABLE `tiki_user_votings` (
  `user` varchar(200) default '',
  `ip` varchar(15) default NULL,
  `id` varchar(255) NOT NULL default '',
  `optionId` int(10) NOT NULL default 0,
  `time` int(14) NOT NULL default 0,
  KEY (`user`(100),id(100)),
  KEY `ip` (`ip`),
  KEY `id` (`id`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_watches` (
  `watchId` int(12) NOT NULL auto_increment,
  `user` varchar(200) NOT NULL default '',
  `event` varchar(40) NOT NULL default '',
  `object` varchar(200) NOT NULL default '',
  `title` varchar(250) default NULL,
  `type` varchar(200) default NULL,
  `url` varchar(250) default NULL,
  `email` varchar(200) default NULL,
  PRIMARY KEY (`watchId`),
  INDEX `event-object-user` ( `event` , `object` ( 100 ) , `user` ( 50 ) )
) ENGINE=MyISAM;

CREATE TABLE `tiki_userfiles` (
  `user` varchar(200) NOT NULL default '',
  `fileId` int(12) NOT NULL auto_increment,
  `name` varchar(200) default NULL,
  `filename` varchar(200) default NULL,
  `filetype` varchar(200) default NULL,
  `filesize` varchar(200) default NULL,
  `data` longblob,
  `hits` int(8) default NULL,
  `isFile` char(1) default NULL,
  `path` varchar(255) default NULL,
  `created` int(14) default NULL,
  PRIMARY KEY (`fileId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_userpoints` (
  `user` varchar(200) NOT NULL default '',
  `points` decimal(8,2) default NULL,
  `voted` int(8) default NULL
) ENGINE=MyISAM;

CREATE TABLE `tiki_webmail_contacts` (
  `contactId` int(12) NOT NULL auto_increment,
  `firstName` varchar(80) default NULL,
  `lastName` varchar(80) default NULL,
  `email` varchar(250) default NULL,
  `nickname` varchar(200) default NULL,
  `user` varchar(200) NOT NULL default '',
  PRIMARY KEY (`contactId`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_webmail_contacts_groups` (
  `contactId` int(12) NOT NULL,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY (`contactId`,`groupName`(200))
) ENGINE=MyISAM ;

CREATE TABLE `tiki_webmail_messages` (
  `accountId` int(12) NOT NULL default '0',
  `mailId` varchar(255) NOT NULL default '',
  `user` varchar(200) NOT NULL default '',
  `isRead` char(1) default NULL,
  `isReplied` char(1) default NULL,
  `isFlagged` char(1) default NULL,
  `flaggedMsg` varchar(50) default '',
  PRIMARY KEY (`accountId`,`mailId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_wiki_attachments` (
  `attId` int(12) NOT NULL auto_increment,
  `page` varchar(200) NOT NULL default '',
  `filename` varchar(80) default NULL,
  `filetype` varchar(80) default NULL,
  `filesize` int(14) default NULL,
  `user` varchar(200) NOT NULL default '',
  `data` longblob,
  `path` varchar(255) default NULL,
  `hits` int(10) default NULL,
  `created` int(14) default NULL,
  `comment` varchar(250) default NULL,
  PRIMARY KEY (`attId`),
  KEY `page` (page)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_zones` (
  `zone` varchar(40) NOT NULL default '',
  PRIMARY KEY (`zone`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_download` (
  `id` int(11) NOT NULL auto_increment,
  `object` varchar(255) NOT NULL default '',
  `userId` int(8) NOT NULL default '0',
  `type` varchar(20) NOT NULL default '',
  `date` int(14) NOT NULL default '0',
  `IP` varchar(50) NOT NULL default '',
  PRIMARY KEY (`id`),
  KEY `object` (object,`userId`,type),
  KEY `userId` (`userId`),
  KEY `type` (type),
  KEY `date` (date)
) ENGINE=MyISAM;

CREATE TABLE `users_grouppermissions` (
  `groupName` varchar(255) NOT NULL default '',
  `permName` varchar(40) NOT NULL default '',
  `value` char(1) default '',
  PRIMARY KEY (`groupName`(30),`permName`)
) ENGINE=MyISAM;

CREATE TABLE `users_groups` (
  `id` int(11) NOT NULL auto_increment,
  `groupName` varchar(255) NOT NULL default '',
  `groupDesc` varchar(255) default NULL,
  `groupHome` varchar(255),
  `usersTrackerId` int(11),
  `groupTrackerId` int(11),
  `usersFieldId` int(11),
  `groupFieldId` int(11),
  `registrationChoice` char(1) default NULL,
  `registrationUsersFieldIds` text,
  `userChoice` char(1) default NULL,
  `groupDefCat` int(12) default 0,
  `groupTheme` varchar(255) default '',
  `isExternal` char(1) default 'n',
  `expireAfter` int(14) default 0,
  `emailPattern`  varchar(255) default '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `groupName` (`groupName`),
  KEY `expireAfter` (`expireAfter`)
) ENGINE=MyISAM AUTO_INCREMENT=1;

CREATE TABLE `users_objectpermissions` (
  `groupName` varchar(255) NOT NULL default '',
  `permName` varchar(40) NOT NULL default '',
  `objectType` varchar(20) NOT NULL default '',
  `objectId` varchar(32) NOT NULL default '',
  PRIMARY KEY (`objectId`, `objectType`, `groupName`(30),`permName`)
) ENGINE=MyISAM;

CREATE TABLE `users_permissions` (
  `permName` varchar(40) NOT NULL default '',
  `permDesc` varchar(250) default NULL,
  `level` varchar(80) default NULL,
  `type` varchar(20) default NULL,
  `admin` varchar(1) default NULL,
  `feature_check` varchar(255) default NULL,
  PRIMARY KEY  (`permName`),
  KEY `type` (`type`)
) ENGINE=MyISAM;

CREATE TABLE `users_usergroups` (
  `userId` int(8) NOT NULL default '0',
  `groupName` varchar(255) NOT NULL default '',
  `created` int(14) default NULL,
  PRIMARY KEY (`userId`,`groupName`(30))
) ENGINE=MyISAM;

CREATE TABLE `users_users` (
  `userId` int(8) NOT NULL auto_increment,
  `email` varchar(200) default NULL,
  `login` varchar(200) NOT NULL default '',
  `password` varchar(30) default '',
  `provpass` varchar(30) default NULL,
  `default_group` varchar(255),
  `lastLogin` int(14) default NULL,
  `currentLogin` int(14) default NULL,
  `registrationDate` int(14) default NULL,
  `challenge` varchar(32) default NULL,
  `pass_confirm` int(14) default NULL,
  `email_confirm` int(14) default NULL,
  `hash` varchar(34) default NULL,
  `created` int(14) default NULL,
  `avatarName` varchar(80) default NULL,
  `avatarSize` int(14) default NULL,
  `avatarFileType` varchar(250) default NULL,
  `avatarData` longblob,
  `avatarLibName` varchar(200) default NULL,
  `avatarType` char(1) default NULL,
  `score` int(11) NOT NULL default 0,
  `valid` varchar(32) default NULL,
  `unsuccessful_logins` int(14) default 0,
  `openid_url` varchar(255) default NULL,
  `waiting` char(1) default NULL,
  PRIMARY KEY (`userId`),
  KEY `score` (score),
  KEY `login` (login),
  KEY `registrationDate` (`registrationDate`),
  KEY `openid_url` (openid_url)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

CREATE TABLE `tiki_integrator_reps` (
  `repID` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL default '',
  `path` varchar(255) NOT NULL default '',
  `start_page` varchar(255) NOT NULL default '',
  `css_file` varchar(255) NOT NULL default '',
  `visibility` char(1) NOT NULL default 'y',
  `cacheable` char(1) NOT NULL default 'y',
  `expiration` int(11) NOT NULL default '0',
  `description` text NOT NULL,
  PRIMARY KEY (`repID`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_integrator_rules` (
  `ruleID` int(11) NOT NULL auto_increment,
  `repID` int(11) NOT NULL default '0',
  `ord` int(2) unsigned NOT NULL default '0',
  `srch` blob NOT NULL,
  `repl` blob NOT NULL,
  `type` char(1) NOT NULL default 'n',
  `casesense` char(1) NOT NULL default 'y',
  `rxmod` varchar(20) NOT NULL default '',
  `enabled` char(1) NOT NULL default 'n',
  `description` text NOT NULL,
  PRIMARY KEY (`ruleID`),
  KEY `repID` (repID)
) ENGINE=MyISAM;

CREATE TABLE `tiki_translated_objects` (
  `traId` int(14) NOT NULL auto_increment,
  `type` varchar(50) NOT NULL,
  `objId` varchar(255) NOT NULL,
  `lang` varchar(16) default NULL,
  PRIMARY KEY (`type`, `objId`),
  KEY `traId` ( `traId` )
) ENGINE=MyISAM AUTO_INCREMENT=1;

CREATE TABLE `tiki_friends` (
  `user` varchar(200) NOT NULL default '',
  `friend` varchar(200) NOT NULL default '',
  PRIMARY KEY (`user`(120),friend(120))
) ENGINE=MyISAM;

CREATE TABLE `tiki_friendship_requests` (
  `userFrom` varchar(200) NOT NULL default '',
  `userTo` varchar(200) NOT NULL default '',
  `tstamp` timestamp(14) NOT NULL,
  PRIMARY KEY (`userFrom`(120),`userTo`(120))
) ENGINE=MyISAM;

CREATE TABLE `tiki_score` (
  event varchar(40) NOT NULL default '',
  score int(11) NOT NULL default '0',
  expiration int(11) NOT NULL default '0',
  PRIMARY KEY (`event`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_users_score` (
  `user` char(200) NOT NULL default '',
  `event_id` char(200) NOT NULL default '',
  `expire` int(14) NOT NULL default '0',
  `tstamp` timestamp(14) NOT NULL,
  PRIMARY KEY (`user`(110),`event_id`(110)),
  KEY `user` (user(110),event_id(110),expire)
) ENGINE=MyISAM;

CREATE TABLE `tiki_file_handlers` (
  `mime_type` varchar(64) default NULL,
  `cmd` varchar(238) default NULL
) ENGINE=MyISAM;

CREATE TABLE `tiki_stats` (
  `object` varchar(255) NOT NULL default '',
  `type` varchar(20) NOT NULL default '',
  `day` int(14) NOT NULL default '0',
  `hits` int(14) NOT NULL default '0',
  PRIMARY KEY (`object`(200),`type`,`day`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_registration_fields` (
  `id` int(11) NOT NULL auto_increment,
  `field` varchar(255) NOT NULL default '',
  `name` varchar(255) default NULL,
  `type` varchar(255) NOT NULL default 'text',
  `show` tinyint(1) NOT NULL default '1',
  `size` varchar(10) default '10',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_actionlog_conf` (
  `id` int(11) NOT NULL auto_increment,
  `action` varchar(32) NOT NULL default '',
  `objectType` varchar(32) NOT NULL default '',
  `status` char(1) default '',
  PRIMARY KEY (`action`, `objectType`),
  KEY (id)
) ENGINE=MyISAM;

CREATE TABLE `tiki_freetags` (
  `tagId` int(10) unsigned NOT NULL auto_increment,
  `tag` varchar(30) NOT NULL default '',
  `raw_tag` varchar(50) NOT NULL default '',
  `lang` varchar(16) NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_freetagged_objects` (
  `tagId` int(12) NOT NULL auto_increment,
  `objectId` int(11) NOT NULL default 0,
  `user` varchar(200) default '',
  `created` int(14) NOT NULL default '0',
  PRIMARY KEY (`tagId`,`user`,`objectId`),
  KEY (`tagId`),
  KEY (user),
  KEY (`objectId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_contributions` (
  `contributionId` int(12) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `description` varchar(250) default NULL,
  PRIMARY KEY (`contributionId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_contributions_assigned` (
  `contributionId` int(12) NOT NULL,
  `objectId` int(12) NOT NULL,
  PRIMARY KEY (`objectId`, `contributionId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_webmail_contacts_ext` (
  `contactId` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  `hidden` tinyint(1) NOT NULL,
  `fieldId` int(10) unsigned NOT NULL,
  KEY `contactId` (`contactId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_webmail_contacts_fields` (
  `user` VARCHAR( 200 ) NOT NULL ,
  `fieldname` VARCHAR( 255 ) NOT NULL ,
  `order` int(2) NOT NULL default '0',
  `show` char(1) NOT NULL default 'n',
  `fieldId` int(10) unsigned NOT NULL auto_increment,
  `flagsPublic` CHAR( 1 ) NOT NULL DEFAULT 'n',
  PRIMARY KEY ( `fieldId` ),
  INDEX ( `user` )
) ENGINE = MyISAM ;

CREATE TABLE `tiki_pages_translation_bits` (
  `translation_bit_id` int(14) NOT NULL auto_increment,
  `page_id` int(14) NOT NULL,
  `version` int(8) NOT NULL,
  `source_translation_bit` int(10) NULL,
  `original_translation_bit` int(10) NULL,
  `flags` SET('critical') NULL DEFAULT '',
  PRIMARY KEY (`translation_bit_id`),
  KEY (`page_id`),
  KEY (`original_translation_bit`),
  KEY (`source_translation_bit`)
);

CREATE TABLE `tiki_pages_changes` (
  `page_id` int(14),
  `version` int(10),
  `segments_added` int(10),
  `segments_removed` int(10),
  `segments_total` int(10),
  PRIMARY KEY (page_id, version)
);

CREATE TABLE `tiki_minichat` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `channel` varchar(31),
  `ts` int(10) unsigned NOT NULL,
  `user` varchar(31) default NULL,
  `nick` varchar(31) default NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `channel` (`channel`)
);

CREATE TABLE `tiki_profile_symbols` (
  `domain` VARCHAR(50) NOT NULL,
  `profile` VARCHAR(100) NOT NULL,
  `object` VARCHAR(150) NOT NULL,
  `type` VARCHAR(20) NOT NULL,
  `value` VARCHAR(50) NOT NULL,
  `named` ENUM('y','n') NOT NULL,
  `creation_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY ( `domain`, `profile`, `object` ),
  INDEX(`named`)
);

CREATE TABLE `tiki_feature` (
  `feature_id` mediumint(9) NOT NULL auto_increment,
  `feature_name` varchar(150) NOT NULL,
  `parent_id` mediumint(9) NOT NULL,
  `status` varchar(12) NOT NULL default 'active',
  `setting_name` varchar(50) default NULL,
  `feature_type` varchar(30) NOT NULL default 'feature',
  `template` varchar(50) default NULL,
  `permission` varchar(50) default NULL,
  `ordinal` mediumint(9) NOT NULL default '1',
  `depends_on` mediumint(9) default NULL,
  `keyword` varchar(30) default NULL,
  `tip` text NULL,
  `feature_count` mediumint(9) NOT NULL default '0',
  `feature_path` varchar(20) NOT NULL default '0',
  PRIMARY KEY (`feature_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1;

CREATE TABLE `tiki_schema` (
  `patch_name` VARCHAR(100) PRIMARY KEY,
  `install_date` TIMESTAMP
) ENGINE=MyISAM;

CREATE TABLE `tiki_semantic_tokens` (
  `token` VARCHAR(15) PRIMARY KEY,
  `label` VARCHAR(25) NOT NULL,
  `invert_token` VARCHAR(15)
) ENGINE=MyISAM ;

CREATE TABLE `tiki_webservice` (
  `service` VARCHAR(25) NOT NULL PRIMARY KEY,
  `url` VARCHAR(250),
  `body` TEXT,
  `schema_version` VARCHAR(5),
  `schema_documentation` VARCHAR(250)
) ENGINE=MyISAM ;

CREATE TABLE `tiki_webservice_template` (
  `service` VARCHAR(25) NOT NULL,
  `template` VARCHAR(25) NOT NULL,
  `engine` VARCHAR(15) NOT NULL,
  `output` VARCHAR(15) NOT NULL,
  `content` TEXT NOT NULL,
  `last_modif` INT,
  PRIMARY KEY ( service, template )
) ENGINE=MyISAM ;

CREATE TABLE `tiki_groupalert` (
  `groupName` varchar(255) NOT NULL default '',
  `objectType` varchar( 20 ) NOT NULL default '',
  `objectId` varchar(10) NOT NULL default '',
  `displayEachuser` char( 1 ) default NULL ,
  PRIMARY KEY (`groupName`, `objectType`, `objectId` )
) ENGINE=MyISAM ;

CREATE TABLE `tiki_sent_newsletters_files` (
  `id` int(11) NOT NULL auto_increment,
  `editionId` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `type` varchar(64) NOT NULL,
  `size` int(11) NOT NULL,
  `filename` varchar(256) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `editionId` (`editionId`)
);

CREATE TABLE `tiki_sefurl_regex_out` (
  `id` int(11) NOT NULL auto_increment,
  `left` varchar(256) NOT NULL,
  `right` varchar(256) NULL default NULL,
  `type` varchar(32) NULL default NULL,
  `silent` char(1) NULL default 'n',
  `feature` varchar(256) NULL default NULL,
  `comment` varchar(256),
  `order` int(11) NULL default 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `left` (`left`(128)),
  INDEX `idx1` (silent, type, feature(30))
);

CREATE TABLE `tiki_plugin_security` (
  `fingerprint` VARCHAR(200) NOT NULL PRIMARY KEY,
  `status` VARCHAR(10) NOT NULL,
  `added_by` VARCHAR(200) NULL,
  `approval_by` VARCHAR(200) NULL,
  `last_update` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_objectType` VARCHAR(20) NOT NULL,
  `last_objectId` VARCHAR(200) NOT NULL,
  KEY `last_object` (last_objectType, last_objectId)
);

CREATE TABLE `tiki_user_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(200) NOT NULL,
  `interval` varchar(20) NOT NULL,
  `view` varchar(8) NOT NULL,
  `type` varchar(5) NOT NULL,
  `time_to_send` datetime NULL default 0,
  `always_email` tinyint(1) NOT NULL,
  `last_report` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_user_reports_cache` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(200) NOT NULL,
  `event` varchar(200) NOT NULL,
  `data` text NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_perspectives` (
  `perspectiveId` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY ( `perspectiveId` )
) ENGINE=MyISAM;

CREATE TABLE `tiki_perspective_preferences` (
  `perspectiveId` int NOT NULL,
  `pref` varchar(40) NOT NULL,
  `value` text,
  PRIMARY KEY ( `perspectiveId`, pref )
) ENGINE=MyISAM;

CREATE TABLE `tiki_transitions` (
    `transitionId` int NOT NULL AUTO_INCREMENT,
    `preserve` int(1) NOT NULL DEFAULT 0,
    `name` varchar(50),
    `type` varchar(20) NOT NULL,
    `from` varchar(255) NOT NULL,
    `to` varchar(255) NOT NULL,
    `guards` text,
    PRIMARY KEY(`transitionId`)
) ENGINE=MyISAM;

CREATE TABLE `tiki_auth_tokens` (
    `tokenId` INT NOT NULL AUTO_INCREMENT,
    `creation` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `timeout` INT NOT NULL DEFAULT 0,
    `hits` INT NOT NULL DEFAULT 1,
    `token` CHAR(32),
    `entry` VARCHAR(50),
    `parameters` VARCHAR(255),
    `groups` VARCHAR(255),
    PRIMARY KEY( `tokenId` ),
    KEY `tiki_auth_tokens_token` (`token`)
);

CREATE TABLE `metrics_assigned` (
    `assigned_id` int(11) NOT NULL AUTO_INCREMENT,
    `metric_id` int(11) NOT NULL,
    `tab_id` int(11) NOT NULL,
    PRIMARY KEY (`assigned_id`),
    KEY `metric_id` (`metric_id`),
    KEY `tab_id` (`tab_id`)
);

CREATE TABLE `metrics_metric` (
    `metric_id` int(11) NOT NULL AUTO_INCREMENT,
    `metric_name` varchar(255) NOT NULL,
    `metric_range` varchar(1) NOT NULL DEFAULT '+' COMMENT 'values: + (daily), @ (monthly&weekly), - (weekly)',
    `metric_datatype` varchar(1) NOT NULL DEFAULT 'i' COMMENT 'values: i(nteger), %(percentage), f(loat), L(ist)',
    `metric_lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `metric_query` text,
    `metric_dsn` VARCHAR(200) NOT NULL DEFAULT 'local',
    PRIMARY KEY (`metric_id`),
    UNIQUE KEY `metric_name` (`metric_name`)
);

CREATE TABLE `metrics_tab` (
    `tab_id` int(11) NOT NULL AUTO_INCREMENT,
    `tab_name` varchar(255) NOT NULL,
    `tab_order` int(11) NOT NULL DEFAULT '0',
    `tab_content` longtext NOT NULL,
    PRIMARY KEY (`tab_id`),
    UNIQUE KEY `tab_name` (`tab_name`)
);

CREATE TABLE `tiki_file_backlinks` (
       `fileId` int(14) NOT NULL,
       `objectId` int(12) NOT NULL,
       KEY `objectId` (`objectId`),
       KEY `fileId` (`fileId`)
);

CREATE TABLE `tiki_payment_requests` (
    `paymentRequestId` INT NOT NULL AUTO_INCREMENT,
    `amount` DECIMAL(7,2) NOT NULL,
    `amount_paid` DECIMAL(7,2) NOT NULL DEFAULT 0.0,
    `currency` CHAR(3) NOT NULL,
    `request_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `due_date` TIMESTAMP NOT NULL,
    `cancel_date` TIMESTAMP NULL,
    `description` VARCHAR(100) NOT NULL,
    `actions` TEXT,
    `detail` TEXT,
    `userId` int(8),
    PRIMARY KEY( `paymentRequestId` )
);

CREATE TABLE `tiki_payment_received` (
    `paymentReceivedId` INT NOT NULL AUTO_INCREMENT,
    `paymentRequestId` INT NOT NULL,
    `payment_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `amount` DECIMAL(7,2),
    `type` VARCHAR(15),
    `details` TEXT,
    `userId` int(8),
    PRIMARY KEY(`paymentReceivedId`),
    KEY `payment_request_ix` (`paymentRequestId`)
);

CREATE TABLE `tiki_discount`( 
    `id` INT NOT NULL AUTO_INCREMENT,
    `code` VARCHAR(255),
    `value` VARCHAR(255),
    `max` INT,
    `comment` TEXT,
    PRIMARY KEY(`id`),
    KEY `code` (`code`)
);

CREATE TABLE IF NOT EXISTS `tiki_translations_in_progress` (
   `page_id` int(14) NOT NULL,
   `language` char(2) NOT NULL,
   KEY `page_id` (`page_id`),
   KEY `language` (`language`),
   UNIQUE (`page_id`, `language`)
);

CREATE TABLE `tiki_rss_items` (
    `rssItemId` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `rssId` INT NOT NULL,
    `guid` VARCHAR(255) NOT NULL,
    `url` TEXT NOT NULL,
    `publication_date` INT UNSIGNED NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `author` VARCHAR(255),
    `description` TEXT,
    `content` TEXT,
    KEY `tiki_rss_items_rss` (`rssId`),
    UNIQUE `tiki_rss_items_item` (`rssId`, `guid`)
);

CREATE TABLE `tiki_object_attributes` (
    `attributeId` INT PRIMARY KEY AUTO_INCREMENT,
    `type` varchar(50) NOT NULL,
    `itemId` varchar(255) NOT NULL,
    `attribute` varchar(25) NOT NULL,
    `value` varchar(100),
    UNIQUE `item_attribute_uq` ( `type`, `itemId`, `attribute` ),
    KEY `attribute_lookup_ix` (`attribute`, `value`)
);

CREATE TABLE `tiki_rating_configs` (
    `ratingConfigId` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `expiry` INT NOT NULL DEFAULT 3600,
    `formula` TEXT NOT NULL,
    `callbacks` TEXT
);

CREATE TABLE `tiki_rating_obtained` (
    `ratingId` INT PRIMARY KEY AUTO_INCREMENT,
    `ratingConfigId` INT NOT NULL,
    `type` VARCHAR(50) NOT NULL,
    `object` INT NOT NULL,
    `expire` INT NOT NULL,
    `value` FLOAT NOT NULL,
    UNIQUE `tiki_obtained_rating_uq` (`type`, `object`, `ratingConfigId`)
);

CREATE TABLE `tiki_object_relations` (
    `relationId` INT PRIMARY KEY AUTO_INCREMENT,
    `relation` varchar(25) NOT NULL,
    `source_type` varchar(50) NOT NULL,
    `source_itemId` varchar(255) NOT NULL,
    `target_type` varchar(50) NOT NULL,
    `target_itemId` varchar(255) NOT NULL,
    KEY `relation_source_ix` (`source_type`, `source_itemId`),
    KEY `relation_target_ix` (`target_type`, `target_itemId`)
);

CREATE TABLE `tiki_todo` (
    `todoId` INT(12) NOT NULL auto_increment,
    `after` INT(12) NOT NULL,
    `event` ENUM('creation', 'modification', 'upload'),
    `objectType` VARCHAR(50),
    `objectId` VARCHAR(255) default NULL,
    `from` VARCHAR(255) default NULL,
    `to` VARCHAR(255) default NULL,
    PRIMARY KEY (`todoId`),
    KEY `what` (`objectType`, `objectId`),
    KEY `after` (`after`)
);

CREATE TABLE `tiki_todo_notif` (
    `todoId` INT(12) NOT NULL,
    `objectType` VARCHAR(50),
    `objectId` VARCHAR(255) default NULL,
    KEY `todoId` (`todoId`),
    KEY `objectId` (`objectId`)
);

CREATE TABLE `tiki_url_shortener` (
  `urlId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` varchar(200) NOT NULL,
  `longurl` tinytext NOT NULL,
  `longurl_hash` varchar(32) NOT NULL,
  `service` varchar(32) NOT NULL,
  `shorturl` varchar(63) NOT NULL,
  PRIMARY KEY (`urlId`),
  UNIQUE KEY `shorturl` (`shorturl`),
  KEY `longurl_hash` (`longurl_hash`)
) ENGINE=MyISAM AUTO_INCREMENT=1 ;

