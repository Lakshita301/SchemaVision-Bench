-- Source: https://github.com/blibor/spreadshare-hackathon-version/blob/844b13510388b6b98490f17f22db0359334ad9d5/schemas/structure.sql?raw=true
-- Tables detected: 36 | FK constraints: 59

CREATE TABLE `changeRequests` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL,
  `cellId` int(11) unsigned DEFAULT NULL,
  `from` text,
  `to` text,
  `comment` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `cellId` (`cellId`),
  CONSTRAINT `changeRequestsCellId` FOREIGN KEY (`cellId`) REFERENCES `tableCells` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `changeRequestsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cities` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(200) DEFAULT NULL,
  `region` varchar(200) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `continent` varchar(200) DEFAULT NULL,
  `lat` float unsigned DEFAULT NULL,
  `lng` float unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cityId` int(11) unsigned DEFAULT NULL,
  `lat` float unsigned NOT NULL COMMENT 'latitude',
  `lng` float unsigned NOT NULL COMMENT 'longitude',
  `locationName` varchar(200) DEFAULT NULL,
  `createdAt` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cityId` (`cityId`),
  KEY `locationName` (`locationName`),
  CONSTRAINT `locationsCityId` FOREIGN KEY (`cityId`) REFERENCES `cities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableCells` (
  `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `userId` INT(11) UNSIGNED NOT NULL COMMENT 'author (user id)',
  `columnId` INT(11) UNSIGNED DEFAULT NULL COMMENT 'associated column (tableColumns.id)',
  `rowId` INT(11) UNSIGNED DEFAULT NULL,
  `content` TEXT DEFAULT NULL COMMENT 'text content of row',
  `link` VARCHAR(255) DEFAULT NULL COMMENT 'optional link (http://..)',
  `updatedById` INT(11) UNSIGNED NOT NULL COMMENT 'last edited (user id)',
  `updatedAt` INT(11) UNSIGNED NOT NULL COMMENT 'timestamp',
  `createdAt` INT(10) DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `updatedById` (`updatedById`),
  KEY `columnId` (`columnId`),
  KEY `rowId` (`rowId`),
  CONSTRAINT `tableCellsColumnId` FOREIGN KEY (`columnId`) REFERENCES `tableColumns` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableCellsUpdatedById` FOREIGN KEY (`updatedById`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableCellsRowId` FOREIGN KEY (`rowId`) REFERENCES `tableRows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableCellsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableColumns` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL COMMENT 'auther (user.id)',
  `tableId` int(11) unsigned DEFAULT NULL COMMENT 'associated table (tables.id)',
  `title` varchar(200) DEFAULT NULL COMMENT 'column title',
  `position` int(11) DEFAULT NULL COMMENT 'position number / order',
  `width` float unsigned DEFAULT NULL COMMENT 'width in px',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`),
  KEY `tableId` (`tableId`),
  KEY `userId` (`userId`),
  KEY `position` (`position`),
  CONSTRAINT `tableColumnsTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableColumnsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tableComments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parentId` int(11) unsigned DEFAULT NULL COMMENT 'parent tabelComment.id',
  `tableId` int(11) unsigned NOT NULL COMMENT 'tables.id',
  `userId` int(11) unsigned NOT NULL COMMENT 'user.id',
  `comment` text,
  `votesCount` int(11) DEFAULT NULL,
  `createdAt` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  KEY `tableId` (`tableId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tableCommentsParentId` FOREIGN KEY (`parentId`) REFERENCES `tableComments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableCommentsTabelId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableCommentsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableCommentVotes` (
  `commentId` int(11) unsigned NOT NULL COMMENT 'tableComments.id',
  `userId` int(11) unsigned NOT NULL COMMENT 'user that created the comment (user.id)',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`commentId`,`userId`),
  KEY `tableCommentVotesUserid` (`userId`),
  CONSTRAINT `tableCommentVotesCommentId` FOREIGN KEY (`commentId`) REFERENCES `tableComments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableCommentVotesUserid` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableLocations` (
  `tableId` int(11) unsigned NOT NULL COMMENT 'tables.id',
  `locationId` int(11) unsigned NOT NULL COMMENT 'locations.id',
  PRIMARY KEY (`tableId`,`locationId`),
  KEY `tableLocationsLocationId` (`locationId`),
  CONSTRAINT `tableLocationsLocationId` FOREIGN KEY (`locationId`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableLocationsTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableLog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableId` int(11) unsigned DEFAULT NULL COMMENT 'tables.id',
  `userId` int(11) unsigned DEFAULT NULL,
  `logType` tinyint(1) unsigned DEFAULT NULL COMMENT 'log type',
  `text` mediumtext COMMENT 'log text',
  `placeholders` text COMMENT 'json placeholders',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`),
  KEY `tableId` (`tableId`),
  KEY `logType` (`logType`),
  KEY `createdAt` (`createdAt`),
  KEY `userId` (`userId`),
  CONSTRAINT `tableLogTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableLogUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableRelations` (
  `tableId` int(11) unsigned NOT NULL COMMENT 'tables.id',
  `relatedTableId` int(11) unsigned NOT NULL COMMENT 'relation to another table (tables.id)',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`tableId`,`relatedTableId`),
  KEY `tableRelationsRelatedTableId` (`relatedTableId`),
  KEY `createdAt` (`createdAt`),
  CONSTRAINT `tableRelationsRelatedTableId` FOREIGN KEY (`relatedTableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableRelationsTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableRows` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL COMMENT 'user that created the row',
  `tableId` int(11) unsigned DEFAULT NULL,
  `content` longtext COMMENT 'cached json content for row',
  `lineNumber` int(11) DEFAULT NULL,
  `votesCount` int(11) DEFAULT NULL COMMENT 'total votes cache',
  `commentsCount` int(11) DEFAULT NULL COMMENT 'total comments cache',
  `updatedAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `tableId` (`tableId`),
  CONSTRAINT `tableRowsTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableRowsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

CREATE TABLE `tableRowVotes` (
  `rowId` int(11) unsigned NOT NULL COMMENT 'tableRows.id',
  `userId` int(11) unsigned NOT NULL COMMENT 'user.id',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`rowId`,`userId`),
  KEY `tableVotesUserId` (`userId`),
  CONSTRAINT `tableRowVotesRowId` FOREIGN KEY (`rowId`) REFERENCES `tableRows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableRowVotesUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tables` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ownerUserId` int(11) unsigned NOT NULL COMMENT 'author',
  `typeId` tinyint(1) unsigned DEFAULT NULL COMMENT 'table type (types.id)',
  `topic1Id` tinyint(1) unsigned DEFAULT NULL COMMENT 'first topic (topics.id)',
  `topic2Id` tinyint(1) unsigned DEFAULT NULL COMMENT 'second topic (topics.id)',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT 'table name',
  `slug` varchar(100) DEFAULT NULL COMMENT 'slug',
  `tagline` varchar(140) DEFAULT '' COMMENT 'description',
  `image` varchar(255) DEFAULT NULL COMMENT 'image url',
  `flags` tinyint,
  `updatedAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`),
  KEY `typeId` (`typeId`),
  KEY `topic1Id` (`topic1Id`),
  KEY `topic2Id` (`topic2Id`),
  KEY `createdAt` (`createdAt`),
  KEY `ownerUserId` (`ownerUserId`),
  CONSTRAINT `tablesOwnerUserId` FOREIGN KEY (`ownerUserId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tablesTopic1Id` FOREIGN KEY (`topic1Id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tablesTopic2Id` FOREIGN KEY (`topic2Id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tablesTypeId` FOREIGN KEY (`typeId`) REFERENCES `types` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableStats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableId` int(11) unsigned NOT NULL COMMENT 'tables.id',
  `votesCount` int(11) unsigned DEFAULT '0' COMMENT 'upvotes',
  `viewsCount` int(11) unsigned DEFAULT '0' COMMENT 'views',
  `commentsCount` int(11) unsigned DEFAULT '0' COMMENT 'comments',
  `collaboratorCount` int(11) unsigned DEFAULT '0' COMMENT 'collaborators',
  `contributionCount` int(11) unsigned DEFAULT '0' COMMENT 'contributions',
  `tokensCount` int(11) unsigned DEFAULT '0' COMMENT 'all distributed tokens',
  `subscriberCount` int(11) unsigned DEFAULT '0' COMMENT 'subscribers',
  `unconfirmedChangesCount` int(11) unsigned DEFAULT '0' COMMENT 'changelog notification counter',
  PRIMARY KEY (`id`),
  KEY `tableId` (`tableId`),
  CONSTRAINT `tableStatsTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableSubscription` (
  `tableId` int(11) unsigned NOT NULL,
  `userId` int(11) unsigned NOT NULL,
  `createdAt` int(10) DEFAULT NULL,
  PRIMARY KEY (`tableId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `tableSubscriptionTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableSubscriptionUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableTags` (
  `tableId` int(11) unsigned NOT NULL,
  `tagId` int(11) unsigned NOT NULL,
  PRIMARY KEY (`tableId`,`tagId`),
  KEY `tableTagsTagId` (`tagId`),
  CONSTRAINT `tableTagsTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableTagsTagId` FOREIGN KEY (`tagId`) REFERENCES `tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableTokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableId` int(11) unsigned NOT NULL,
  `rowId` int(11) unsigned DEFAULT NULL,
  `userId` int(11) unsigned NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `ownership` float DEFAULT NULL,
  `tokensEarned` float DEFAULT NULL,
  `createdAt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tokensEarned` (`tokensEarned`),
  KEY `ownership` (`ownership`),
  KEY `rowId` (`rowId`),
  KEY `createdAt` (`createdAt`),
  KEY `type` (`type`),
  KEY `tableId` (`tableId`,`userId`),
  KEY `tableTokensUserId` (`userId`),
  CONSTRAINT `tableTokensRowId` FOREIGN KEY (`rowId`) REFERENCES `tableRows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableTokensTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableTokensUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `tableViews` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableId` int(11) unsigned NOT NULL COMMENT 'tables.id',
  `userId` int(11) unsigned NOT NULL COMMENT 'user.id',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`),
  KEY `createdAt` (`createdAt`),
  KEY `tableViewsUserId` (`userId`),
  CONSTRAINT `tableViewsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tableVotes` (
  `tableId` int(11) unsigned NOT NULL COMMENT 'tables.id',
  `userId` int(11) unsigned NOT NULL COMMENT 'user.id',
  `createdAt` int(10) unsigned DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`tableId`,`userId`),
  KEY `tableVotesUserId` (`userId`),
  KEY `createdAt` (`createdAt`),
  CONSTRAINT `tableVotesTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableVotesUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned NULL COMMENT 'user.id',
  `title` varchar(100) DEFAULT NULL COMMENT 'tag name',
  `createdAt` int(10) DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `title` (`title`),
  CONSTRAINT `tableTagsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `topics` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL COMMENT 'image url',
  `color` varchar(6) DEFAULT NULL COMMENT 'hex color',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `types` (
  `id` tinyint(1) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL COMMENT 'image url',
  `color` varchar(6) DEFAULT NULL COMMENT 'hex color',
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `handle` varchar(100) DEFAULT NULL COMMENT 'usernama',
  `name` varchar(255) DEFAULT NULL COMMENT 'given name',
  `email` varchar(255) DEFAULT NULL COMMENT 'email address',
  `securitySalt` varchar(255) DEFAULT NULL COMMENT 'password',
  `authUid` varchar(100) DEFAULT NULL COMMENT 'uid of auth provider (e.g. twitter)',
  `authProvider` varchar(255) DEFAULT NULL COMMENT 'auth provider name',
  `location` varchar(100) DEFAULT NULL COMMENT 'users location',
  `description` mediumtext COMMENT 'text info about',
  `website` varchar(200) DEFAULT NULL COMMENT 'url',
  `tagline` varchar(140) DEFAULT NULL COMMENT 'tagline',
  `image` varchar(255) DEFAULT NULL COMMENT 'image url',
  `emailConfirmationToken` varchar(100) DEFAULT NULL COMMENT 'email confirmation hash',
  `passwordResetToken` varchar(255) DEFAULT '' COMMENT 'password reset hash',
  `passwordResetSentAt` int(10) DEFAULT NULL COMMENT 'hash sent at timestamp',
  `lastSessionId` varchar(100) DEFAULT NULL COMMENT 'session id',
  `lastLogin` int(10) DEFAULT NULL COMMENT 'timestamp',
  `confirmed` int(1) DEFAULT NULL COMMENT 'confirmed = 1, unconfirmed = 0',
  `status` tinyint(1) DEFAULT NULL COMMENT 'deleted = 0, active = 1',
  `createdAt` int(10) DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userConnections` (
  `userId` int(11) unsigned NOT NULL,
  `twitter` varchar(200) DEFAULT NULL,
  `facebook` varchar(200) DEFAULT NULL,
  `medium` varchar(200) DEFAULT NULL,
  `dribbble` varchar(200) DEFAULT NULL,
  `behance` varchar(200) DEFAULT NULL,
  `github` varchar(200) DEFAULT NULL,
  `gitlab` varchar(200) DEFAULT NULL,
  `bitbucket` varchar(200) DEFAULT NULL,
  `slack` varchar(200) DEFAULT NULL,
  `angellist` varchar(200) DEFAULT NULL,
  `googleplus` varchar(200) DEFAULT NULL,
  `stackoverflow` varchar(200) DEFAULT NULL,
  `linkedin` varchar(200) DEFAULT NULL,
  `quora` varchar(200) DEFAULT NULL,
  `reddit` varchar(200) DEFAULT NULL,
  `ycombinator` varchar(200) DEFAULT NULL,
  `instagram` varchar(200) DEFAULT NULL,
  `visco` varchar(200) DEFAULT NULL,
  `soundcloud` varchar(200) DEFAULT NULL,
  `vsco` varchar(200) DEFAULT NULL,
  `fivehundretpx` varchar(200) DEFAULT NULL,
  `codepen` varchar(200) DEFAULT NULL,
  `producthunt` varchar(200) DEFAULT NULL,
  `discord` varchar(200) DEFAULT NULL,
  `raspberrypi` varchar(200) DEFAULT NULL,
  `periscope` varchar(200) DEFAULT NULL,
  `vimeo` varchar(200) DEFAULT NULL,
  `twitch` varchar(200) DEFAULT NULL,
  `patreon` varchar(200) DEFAULT NULL,
  `youtube` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  CONSTRAINT `userConnectionsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userTopics` (
  `userId` int(11) unsigned NOT NULL,
  `topicId` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`topicId`),
  KEY `userTopicsTopicId` (`topicId`),
  CONSTRAINT `userTopicsTopicId` FOREIGN KEY (`topicId`) REFERENCES `topics` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userTopicsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userFollower` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL COMMENT 'user.id',
  `followedByUserId` int(11) unsigned DEFAULT NULL COMMENT 'user.id that follows',
  `createdAt` int(10) DEFAULT NULL COMMENT 'timestamp',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `followedByUserId` (`followedByUserId`),
  CONSTRAINT `userFollowerFollowedByUserId` FOREIGN KEY (`followedByUserId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userFollowerUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userLocations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL,
  `locationId` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userLocationsUserId` (`userId`),
  KEY `userLocationsLocationId` (`locationId`),
  CONSTRAINT `userLocationsLocationId` FOREIGN KEY (`locationId`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userLocationsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userNotifications` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL,
  `sourceTableId` int(11) unsigned DEFAULT NULL,
  `sourceUserId` int(11) unsigned DEFAULT NULL,
  `notificationType` tinyint(5) unsigned DEFAULT NULL,
  `text` mediumtext,
  `placeholders` text,
  `createdAt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `notificationType` (`notificationType`),
  KEY `createdAt` (`createdAt`),
  KEY `sourceTableId` (`sourceTableId`),
  KEY `sourceUserId` (`sourceUserId`),
  CONSTRAINT `userNotifcationsSourceTableId` FOREIGN KEY (`sourceTableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userNotifcationsSourceUserId` FOREIGN KEY (`sourceUserId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userNotificationsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `userResetPassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL COMMENT 'user.id',
  `code` varchar(48) DEFAULT NULL COMMENT 'reset code',
  `createdAt` int(11) unsigned DEFAULT NULL COMMENT 'timestamp',
  `updatedAt` int(11) DEFAULT NULL COMMENT 'timtestamp',
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `code` (`code`),
  CONSTRAINT `userResetPasswordUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userSettings` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL COMMENT 'user.id',
  `followDigest` tinyint(1) unsigned DEFAULT NULL,
  `topicDigest` tinyint(1) unsigned DEFAULT NULL,
  `newProductAnnouncements` tinyint(1) unsigned DEFAULT NULL,
  `showTokensOnProfilePage` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userSettingsUserId` (`userId`),
  CONSTRAINT `userSettingsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `userStats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL,
  `tablesOwnerCount` int(10) DEFAULT '0' COMMENT 'tables count (cache)',
  `rowsOwnerCount` int(10) DEFAULT '0' COMMENT 'rows count (cache)',
  `unreadNotificationsCount` int(10) unsigned DEFAULT '0',
  `contributionsCount` int(10) unsigned DEFAULT '0',
  `tablesCreatedCount` int(10) unsigned DEFAULT '0',
  `rejectedChangeRequestsCount` int(10) unsigned DEFAULT '0',
  `approvedChangeRequestsCount` int(10) unsigned DEFAULT '0',
  `visitedAddTablePage` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userStatsUserId` (`userId`),
  CONSTRAINT `userStatsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

CREATE TABLE `wallet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(11) unsigned DEFAULT NULL,
  `data` text,
  `contractAddress` varchar(200) DEFAULT NULL,
  `tokens` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `contractAddress` (`contractAddress`),
  CONSTRAINT `walletUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableFlags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableId` int(11) unsigned NOT NULL,
  `userId` int(11) unsigned DEFAULT NULL,
  `flag` varchar(25) DEFAULT NULL,
  `text` varchar(200) DEFAULT '',
  `createdAt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  KEY `tableId` (`tableId`),
  CONSTRAINT `tableFlagsTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableFlagsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `tableContributors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tableId` int(11) unsigned DEFAULT NULL COMMENT 'table.id',
  `userId` int(11) unsigned DEFAULT NULL COMMENT 'contributor user.id',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT 'contribution type',
  `tableOwnership` float DEFAULT NULL,
  `createdAt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableProperties` (
  `tableId` int(11) unsigned NOT NULL,
  `fixedRowsTop` mediumint(9) DEFAULT NULL,
  `fixedColumnsLeft` mediumint(9) DEFAULT NULL,
  PRIMARY KEY (`tableId`),
  CONSTRAINT `tablePropertiesTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tableStaffPicks` (
  `tableId` int(11) unsigned NOT NULL COMMENT 'table.id',
  `userId` int(11) unsigned NOT NULL COMMENT 'admin user.id',
  `createdAt` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`tableId`,`userId`),
  KEY `tableStaffPicsUserId` (`userId`),
  CONSTRAINT `tableStaffPicsTableId` FOREIGN KEY (`tableId`) REFERENCES `tables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tableStaffPicsUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

