-- Source: https://github.com/jawadkhan918/micandroid/blob/aa51bba4e6c35bbaf9b91cf5a290866e26e96756/lightportald/WebContent/WEB-INF/dbscripts/lightCreatedb.sql?raw=true
-- Tables detected: 70 | FK constraints: 4

CREATE TABLE `light_address_book` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `addressGroup` varchar(255) collate utf8_unicode_ci default NULL,
  `fullName` varchar(255) collate utf8_unicode_ci default NULL,
  `homePhone` varchar(255) collate utf8_unicode_ci default NULL,
  `workPhone` varchar(255) collate utf8_unicode_ci default NULL,
  `mobilePhone` varchar(255) collate utf8_unicode_ci default NULL,
  `primaryPhone` int(11) default NULL,
  `workEmail` varchar(255) collate utf8_unicode_ci default NULL,
  `personalEmail` varchar(255) collate utf8_unicode_ci default NULL,
  `primaryEmail` int(11) default NULL,
  `homePage` varchar(255) collate utf8_unicode_ci default NULL,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  `city` varchar(255) collate utf8_unicode_ci default NULL,
  `province` varchar(255) collate utf8_unicode_ci default NULL,
  `country` varchar(255) collate utf8_unicode_ci default NULL,
  `postalCode` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_blog` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `postedById` bigint(20) default NULL,
  `categoryId` bigint(20) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `summary` longtext collate utf8_unicode_ci,
  `content` longtext collate utf8_unicode_ci,
  `status` int(11) default NULL,
  `score` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_blog_category` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `parentId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `ctgrDesc` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_bookmark` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `tagId` varchar(255) collate utf8_unicode_ci default NULL,
  `tagName` varchar(255) collate utf8_unicode_ci default NULL,
  `bookmarkDesc` longtext collate utf8_unicode_ci,
  `userId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_bulletin` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `postById` bigint(20) default NULL,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `status` int(11) default NULL,
  `type` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_calendar` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `startTime` int(11) default NULL,
  `endTime` int(11) default NULL,
  `intervalTime` int(11) default NULL,
  `type` int(11) default NULL,
  `state` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_calendar_event` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `location` varchar(255) collate utf8_unicode_ci default NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `startDate` date default NULL,
  `startTime` int(11) default NULL,
  `endDate` date default NULL,
  `endTime` int(11) default NULL,
  `state` int(11) default NULL,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  `parentId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_calendar_holiday` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `holiday` varchar(255) collate utf8_unicode_ci default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `country` varchar(255) collate utf8_unicode_ci default NULL,
  `description` longtext collate utf8_unicode_ci,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_category_ad` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `status` int(11) default NULL,
  `category` int(11) default NULL,
  `country` varchar(255) collate utf8_unicode_ci default NULL,
  `province` varchar(255) collate utf8_unicode_ci default NULL,
  `city` varchar(255) collate utf8_unicode_ci default NULL,
  `adUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `showDate` date default NULL,
  `effDate` date default NULL,
  `endEffDate` date default NULL,
  `score` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_chatting` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `chatName` varchar(255) collate utf8_unicode_ci default NULL,
  `chatDesc` varchar(255) collate utf8_unicode_ci default NULL,
  `userId` bigint(20) default NULL,
  `chatType` int(11) default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_chatting_record` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `chattingId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `displayName` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_chatting_user` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `chattingId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_connection` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `buddyUserId` bigint(20) default NULL,
  `type` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_feedback` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `content` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `visitCount` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_flash_game` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `description` longtext collate utf8_unicode_ci,
  `instructions` longtext collate utf8_unicode_ci,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `locale` varchar(255) collate utf8_unicode_ci default NULL,
  `popCount` int(11) default NULL,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `postById` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_forum` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `ctgrDesc` varchar(255) collate utf8_unicode_ci default NULL,
  `ownerId` bigint(20) default NULL,
  `status` int(11) default NULL,
  `categoryId` bigint(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK7DDE7CB85F8BDF18` (`categoryId`),
  CONSTRAINT `FK7DDE7CB85F8BDF18` FOREIGN KEY (`categoryId`) REFERENCES `light_forum_category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_forum_category` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `ctgrDesc` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `ownerId` bigint(20) default NULL,
  `status` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_forum_post` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `topic` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `topId` bigint(20) default NULL,
  `forumId` bigint(20) default NULL,
  `categoryId` bigint(20) default NULL,
  `postById` bigint(20) default NULL,
  `lastPostId` bigint(20) default NULL,
  `lastPostById` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_group` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `displayName` varchar(255) collate utf8_unicode_ci default NULL,
  `categoryId` bigint(20) default NULL,
  `openJoin` int(11) default NULL,
  `hiddenGroup` int(11) default NULL,
  `memberInvite` int(11) default NULL,
  `publicForum` int(11) default NULL,
  `memberBulletin` int(11) default NULL,
  `memberImage` int(11) default NULL,
  `noPicForward` int(11) default NULL,
  `matureContent` int(11) default NULL,
  `country` varchar(255) collate utf8_unicode_ci default NULL,
  `province` varchar(255) collate utf8_unicode_ci default NULL,
  `city` varchar(255) collate utf8_unicode_ci default NULL,
  `postalCode` varchar(255) collate utf8_unicode_ci default NULL,
  `shortDesc` varchar(255) collate utf8_unicode_ci default NULL,
  `description` longtext collate utf8_unicode_ci,
  `uri` varchar(255) collate utf8_unicode_ci default NULL,
  `photoUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `photoWidth` int(11) default NULL,
  `photoHeight` int(11) default NULL,
  `caption` varchar(255) collate utf8_unicode_ci default NULL,
  `songUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `ownerId` bigint(20) default NULL,
  `leaderId` bigint(20) default NULL,
  `parentId` bigint(20) default NULL,
  `viewCount` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_group_category` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_horoscope` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `startDate` varchar(255) collate utf8_unicode_ci default NULL,
  `endDate` varchar(255) collate utf8_unicode_ci default NULL,
  `startMonth` int(11) default NULL,
  `startDay` int(11) default NULL,
  `endMonth` int(11) default NULL,
  `endDay` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_horoscope_weekly` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `horoscopeId` bigint(20) default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `description` longtext collate utf8_unicode_ci,
  `weekNumber` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_internal_news` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `postById` bigint(20) default NULL,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_keyword` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `keyword` varchar(255) collate utf8_unicode_ci default NULL,
  `weight` int(11) default NULL,
  `type` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_message` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `postById` bigint(20) default NULL,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `contentFormat` int(11) default NULL,
  `direction` int(11) default NULL,
  `status` int(11) default NULL,
  `event` int(11) default NULL,
  `type` int(11) default NULL,
  `eventId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_micro_blog` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `postById` bigint(20) default NULL,
  `content` longtext collate utf8_unicode_ci,
  `status` int(11) default NULL,
  `score` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_not_keyword` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `word` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_not_word` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `word` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_note` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `color` varchar(255) collate utf8_unicode_ci default NULL,
  `bgColor` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `width` int(11) default NULL,
  `height` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_obj_role` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `permission` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_obj_type` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_org_profile` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `meta` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `maxContent` longtext collate utf8_unicode_ci,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_organization` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `webId` varchar(255) collate utf8_unicode_ci default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `virtualHost` varchar(255) collate utf8_unicode_ci default NULL,
  `mx` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `receiveEmail` varchar(255) collate utf8_unicode_ci default NULL,
  `logoUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `logoIcon` varchar(255) collate utf8_unicode_ci default NULL,
  `userId` bigint(20) default NULL,
  `adminId` bigint(20) default NULL,
  `role` varchar(255) collate utf8_unicode_ci default NULL,
  `type` int(11) default NULL,
  `status` int(11) default NULL,
  `parentId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_permission` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_pic_pos_tag` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `topOrgId` bigint(20) default NULL,
  `pictureId` bigint(20) default NULL,
  `pictureUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `parentId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `positionX` int(11) default NULL,
  `positionY` int(11) default NULL,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `type` int(11) default NULL,
  `objectId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK860427D1423D8307` (`pictureId`),
  CONSTRAINT `FK860427D1423D8307` FOREIGN KEY (`pictureId`) REFERENCES `light_user_picture` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_pic_pos_tag_item` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `topOrgId` bigint(20) default NULL,
  `tagId` bigint(20) default NULL,
  `pictureId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` longtext collate utf8_unicode_ci,
  `itemOwner` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK938D46C1FEAF65ED` (`tagId`),
  CONSTRAINT `FK938D46C1FEAF65ED` FOREIGN KEY (`tagId`) REFERENCES `light_pic_pos_tag` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_popular_item` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `itemDesc` longtext collate utf8_unicode_ci,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `locale` varchar(255) collate utf8_unicode_ci default NULL,
  `postById` bigint(20) default NULL,
  `popCount` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_portal` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `ownerId` varchar(255) collate utf8_unicode_ci default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `theme` varchar(255) collate utf8_unicode_ci default NULL,
  `bgImage` varchar(255) collate utf8_unicode_ci default NULL,
  `bgPosition` varchar(255) collate utf8_unicode_ci default NULL,
  `bgRepeat` int(11) default NULL,
  `headerImage` varchar(255) collate utf8_unicode_ci default NULL,
  `headerPosition` varchar(255) collate utf8_unicode_ci default NULL,
  `headerRepeat` int(11) default NULL,
  `headerHeight` int(11) default NULL,
  `textFont` varchar(255) collate utf8_unicode_ci default NULL,
  `fontSize` int(11) default NULL,
  `textColor` varchar(255) collate utf8_unicode_ci default NULL,
  `transparent` int(11) default NULL,
  `showSearchBar` int(11) default NULL,
  `maxShowTabs` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_portal_tab` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `portalId` bigint(20) default NULL,
  `parentId` bigint(20) default NULL,
  `label` varchar(255) collate utf8_unicode_ci default NULL,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `closeable` int(11) default NULL,
  `editable` int(11) default NULL,
  `moveable` int(11) default NULL,
  `allowAddContent` int(11) default NULL,
  `color` varchar(255) collate utf8_unicode_ci default NULL,
  `defaulted` int(11) default NULL,
  `colBetween` int(11) default NULL,
  `widths` varchar(255) collate utf8_unicode_ci default NULL,
  `windowSkin` varchar(255) collate utf8_unicode_ci default NULL,
  `fitScreen` int(11) default NULL,
  `ownerId` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  `client` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_portlet` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `tabId` bigint(20) default NULL,
  `columnNumber` int(11) default NULL,
  `rowNumber` int(11) default NULL,
  `colspan` int(11) default NULL,
  `label` varchar(255) collate utf8_unicode_ci default NULL,
  `icon` varchar(255) collate utf8_unicode_ci default NULL,
  `iconCssSprite` varchar(255) collate utf8_unicode_ci default NULL,
  `showIcon` int(11) default NULL,
  `client` int(11) default NULL,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `path` varchar(255) collate utf8_unicode_ci default NULL,
  `closeable` int(11) default NULL,
  `refreshMode` int(11) default NULL,
  `editMode` int(11) default NULL,
  `helpMode` int(11) default NULL,
  `configMode` int(11) default NULL,
  `minimized` int(11) default NULL,
  `maximized` int(11) default NULL,
  `windowSkin` varchar(255) collate utf8_unicode_ci default NULL,
  `autoRefreshed` int(11) default NULL,
  `periodTime` int(11) default NULL,
  `showNumber` int(11) default NULL,
  `showType` int(11) default NULL,
  `windowStatus` int(11) default NULL,
  `portletMode` int(11) default NULL,
  `type` int(11) default NULL,
  `allowJS` int(11) default NULL,
  `pageRefreshed` int(11) default NULL,
  `parameter` varchar(255) collate utf8_unicode_ci default NULL,
  `barBgColor` varchar(255) collate utf8_unicode_ci default NULL,
  `barFontColor` varchar(255) collate utf8_unicode_ci default NULL,
  `contentBgColor` varchar(255) collate utf8_unicode_ci default NULL,
  `textColor` varchar(255) collate utf8_unicode_ci default NULL,
  `transparent` int(11) default NULL,
  `marginTop` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_portlet_preferences` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  `portletId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_portlet_ref` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `keywords` varchar(255) collate utf8_unicode_ci default NULL,
  `label` varchar(255) collate utf8_unicode_ci default NULL,
  `icon` varchar(255) collate utf8_unicode_ci default NULL,
  `iconCssSprite` varchar(255) collate utf8_unicode_ci default NULL,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `path` varchar(255) collate utf8_unicode_ci default NULL,
  `subTag` varchar(255) collate utf8_unicode_ci default NULL,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `refreshMode` int(11) default NULL,
  `editMode` int(11) default NULL,
  `helpMode` int(11) default NULL,
  `configMode` int(11) default NULL,
  `minimized` int(11) default NULL,
  `maximized` int(11) default NULL,
  `windowSkin` varchar(255) collate utf8_unicode_ci default NULL,
  `autoRefreshed` int(11) default NULL,
  `periodTime` int(11) default NULL,
  `showNumber` int(11) default NULL,
  `showType` int(11) default NULL,
  `windowStatus` int(11) default NULL,
  `portletMode` int(11) default NULL,
  `type` int(11) default NULL,
  `allowJS` int(11) default NULL,
  `pageRefreshed` int(11) default NULL,
  `parameter` varchar(255) collate utf8_unicode_ci default NULL,
  `userId` varchar(255) collate utf8_unicode_ci default NULL,
  `createdBy` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_recommended_item` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `itemDesc` longtext collate utf8_unicode_ci,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `locale` varchar(255) collate utf8_unicode_ci default NULL,
  `weight` int(11) default NULL,
  `readStatus` int(11) default NULL,
  `personId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_replication_message` (
  `id` bigint(20) NOT NULL,
  `orgId` bigint(20) default NULL,
  `server` varchar(255) collate utf8_unicode_ci default NULL,
  `event` varchar(255) collate utf8_unicode_ci default NULL,
  `className` varchar(255) collate utf8_unicode_ci default NULL,
  `classId` bigint(20) default NULL,
  `message` longblob,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_role_permission` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `roleId` bigint(20) default NULL,
  `permissionId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_sequence_id` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `currentId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_social_activity` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `content` varchar(255) collate utf8_unicode_ci default NULL,
  `type` int(11) default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_subdomain` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `uri` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_subscriber` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `type` int(11) default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_tag_filter` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `regex` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_todo` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  `userId` bigint(20) default NULL,
  `priority` int(11) default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `personId` bigint(20) default NULL,
  `userId` varchar(255) collate utf8_unicode_ci default NULL,
  `password` varchar(255) collate utf8_unicode_ci default NULL,
  `displayName` varchar(255) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `birth` varchar(255) collate utf8_unicode_ci default NULL,
  `gender` varchar(255) collate utf8_unicode_ci default NULL,
  `language` varchar(255) collate utf8_unicode_ci default NULL,
  `region` varchar(255) collate utf8_unicode_ci default NULL,
  `timeZone` varchar(255) collate utf8_unicode_ci default NULL,
  `country` varchar(255) collate utf8_unicode_ci default NULL,
  `province` varchar(255) collate utf8_unicode_ci default NULL,
  `city` varchar(255) collate utf8_unicode_ci default NULL,
  `postalCode` varchar(255) collate utf8_unicode_ci default NULL,
  `userUri` varchar(255) collate utf8_unicode_ci default NULL,
  `uriType` int(11) default NULL,
  `photoUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `photoWidth` int(11) default NULL,
  `photoHeight` int(11) default NULL,
  `caption` varchar(255) collate utf8_unicode_ci default NULL,
  `musicUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `ringToneUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `videoUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `showFriendPicture` int(11) default NULL,
  `showGroupPicture` int(11) default NULL,
  `notification` int(11) default NULL,
  `newsLetter` int(11) default NULL,
  `fqNel` int(11) default NULL,
  `commentNeedApprove` int(11) default NULL,
  `showBirthToFriend` int(11) default NULL,
  `blogCommentFriendOnly` int(11) default NULL,
  `profileFriendViewOnly` int(11) default NULL,
  `imprivacy` int(11) default NULL,
  `noPicForward` int(11) default NULL,
  `myMusicAutoPlay` int(11) default NULL,
  `otherMusucAutoPlay` int(11) default NULL,
  `defaultPictureStatus` int(11) default NULL,
  `defaultMusicStatus` int(11) default NULL,
  `defaultFileStatus` int(11) default NULL,
  `visitCount` int(11) default NULL,
  `disabled` int(11) default NULL,
  `locked` int(11) default NULL,
  `growKeyword` int(11) default NULL,
  `showTitleToFriends` int(11) default NULL,
  `currentStatus` int(11) default NULL,
  `defaultStatus` int(11) default NULL,
  `permission` bigint(20) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  `lastLoginDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_block` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `blockId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_comment` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `objectId` bigint(20) default NULL,
  `objectType` int(11) default NULL,
  `content` longtext collate utf8_unicode_ci,
  `status` int(11) default NULL,
  `parentId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKB4BF2E74DD0DD6C5` (`objectId`),
  CONSTRAINT `FKB4BF2E74DD0DD6C5` FOREIGN KEY (`objectId`) REFERENCES `light_micro_blog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_ext_role` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `roleId` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_favourite` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `favouriteId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_file` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `fileUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `caption` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_group` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `groupId` bigint(20) default NULL,
  `acceptLeaderBulletin` int(11) default NULL,
  `acceptMembersBulletin` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_invite` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `inviteEmail` varchar(255) collate utf8_unicode_ci default NULL,
  `content` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_keyword` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `personId` bigint(20) default NULL,
  `keywordId` bigint(20) default NULL,
  `weight` int(11) default NULL,
  `type` int(11) default NULL,
  `status` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_music` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `musicUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `caption` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  `rankable` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_obj_permission` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `objectId` bigint(20) default NULL,
  `objectTypeId` bigint(20) default NULL,
  `permissionId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_obj_role` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `objectId` bigint(20) default NULL,
  `objectTypeId` bigint(20) default NULL,
  `roleId` bigint(20) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_picture` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `topOrgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `pictureUrl` varchar(255) collate utf8_unicode_ci default NULL,
  `pictureWidth` int(11) default NULL,
  `pictureHeight` int(11) default NULL,
  `caption` varchar(255) collate utf8_unicode_ci default NULL,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  `rankable` int(11) default NULL,
  `score` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_picture_rank` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `pictureId` int(11) default NULL,
  `rankScore` int(11) default NULL,
  `rankById` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_profile` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `firstName` varchar(255) collate utf8_unicode_ci default NULL,
  `middleName` varchar(255) collate utf8_unicode_ci default NULL,
  `lastName` varchar(255) collate utf8_unicode_ci default NULL,
  `occupation` varchar(255) collate utf8_unicode_ci default NULL,
  `ethnicity` int(11) default NULL,
  `bodyType` int(11) default NULL,
  `height` int(11) default NULL,
  `registerPurpose` int(11) default NULL,
  `maritalStatus` int(11) default NULL,
  `sexualOrientation` int(11) default NULL,
  `religion` varchar(255) collate utf8_unicode_ci default NULL,
  `hometown` varchar(255) collate utf8_unicode_ci default NULL,
  `smoker` int(11) default NULL,
  `drinker` int(11) default NULL,
  `childrenStatus` int(11) default NULL,
  `education` int(11) default NULL,
  `income` varchar(255) collate utf8_unicode_ci default NULL,
  `headline` varchar(255) collate utf8_unicode_ci default NULL,
  `aboutMe` longtext collate utf8_unicode_ci,
  `likeToMeet` longtext collate utf8_unicode_ci,
  `interests` longtext collate utf8_unicode_ci,
  `music` longtext collate utf8_unicode_ci,
  `movies` longtext collate utf8_unicode_ci,
  `television` longtext collate utf8_unicode_ci,
  `books` longtext collate utf8_unicode_ci,
  `heroes` longtext collate utf8_unicode_ci,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_user_tag` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `objectId` bigint(20) default NULL,
  `objectType` int(11) default NULL,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_viewed_item` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `link` varchar(255) collate utf8_unicode_ci default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `itemDesc` longtext collate utf8_unicode_ci,
  `tag` varchar(255) collate utf8_unicode_ci default NULL,
  `locale` varchar(255) collate utf8_unicode_ci default NULL,
  `popCount` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_viewed_item_user` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `itemId` bigint(20) default NULL,
  `personId` bigint(20) default NULL,
  `popCount` int(11) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `light_widget` (
  `id` bigint(20) NOT NULL,
  `version` int(11) NOT NULL,
  `orgId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `portletId` bigint(20) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `summary` varchar(255) collate utf8_unicode_ci default NULL,
  `content` longtext collate utf8_unicode_ci,
  `width` varchar(255) collate utf8_unicode_ci default NULL,
  `height` varchar(255) collate utf8_unicode_ci default NULL,
  `maxHeight` varchar(255) collate utf8_unicode_ci default NULL,
  `status` int(11) default NULL,
  `score` int(11) default NULL,
  `createDate` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

