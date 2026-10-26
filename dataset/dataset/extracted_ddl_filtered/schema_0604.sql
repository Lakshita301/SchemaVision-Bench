-- Source: https://github.com/dhishan/neighbourhood/blob/a9cb6d215a0bef84d25eca46fa1bba2531776326/SQLQueries/Export_Neighbourhood.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 17

CREATE TABLE `blocks` (
  `bid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL,
  `nid` int(6) NOT NULL,
  `ne_latitude` decimal(9,6) NOT NULL,
  `ne_longitude` decimal(9,6) NOT NULL,
  `nw_latitude` decimal(9,6) NOT NULL,
  `nw_longitude` decimal(9,6) NOT NULL,
  `sw_latitude` decimal(9,6) NOT NULL,
  `sw_longitude` decimal(9,6) NOT NULL,
  `se_latitude` decimal(9,6) NOT NULL,
  `se_longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`bid`),
  KEY `nid` (`nid`),
  CONSTRAINT `blocks_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `neighbourhood` (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

CREATE TABLE `f_request` (
  `uid_requested_by` int(6) NOT NULL,
  `uid_requested_of` int(6) NOT NULL,
  `status` enum('waiting','accepted') NOT NULL DEFAULT 'waiting',
  PRIMARY KEY (`uid_requested_by`,`uid_requested_of`),
  KEY `uid_requested_of` (`uid_requested_of`),
  CONSTRAINT `f_request_ibfk_1` FOREIGN KEY (`uid_requested_by`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `f_request_ibfk_2` FOREIGN KEY (`uid_requested_of`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `m_history` (
  `uid` int(6) NOT NULL,
  `bid` int(6) NOT NULL,
  `since` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `till` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`uid`,`bid`,`till`),
  KEY `m_history_ibfk_2` (`bid`),
  CONSTRAINT `m_history_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `m_history_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `blocks` (`bid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `m_request` (
  `uid` int(6) NOT NULL,
  `bid` int(6) NOT NULL,
  `uid1` int(6) DEFAULT NULL,
  `uid2` int(6) DEFAULT NULL,
  `uid3` int(6) DEFAULT NULL,
  `acceptance_cnt` int(1) DEFAULT '3',
  `acceptedat` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`uid`,`bid`,`acceptedat`),
  KEY `uid1` (`uid1`),
  KEY `uid2` (`uid2`),
  KEY `uid3` (`uid3`),
  KEY `bid` (`bid`),
  CONSTRAINT `m_request_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `m_request_ibfk_2` FOREIGN KEY (`uid1`) REFERENCES `user` (`uid`) ON DELETE SET NULL,
  CONSTRAINT `m_request_ibfk_3` FOREIGN KEY (`uid2`) REFERENCES `user` (`uid`) ON DELETE SET NULL,
  CONSTRAINT `m_request_ibfk_4` FOREIGN KEY (`uid3`) REFERENCES `user` (`uid`) ON DELETE SET NULL,
  CONSTRAINT `m_request_ibfk_5` FOREIGN KEY (`bid`) REFERENCES `blocks` (`bid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `membership` (
  `uid` int(6) NOT NULL,
  `bid` int(6) NOT NULL,
  `since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`,`bid`),
  KEY `membership_ibfk_2_idx` (`bid`),
  CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `membership_ibfk_2` FOREIGN KEY (`bid`) REFERENCES `blocks` (`bid`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `messages` (
  `mid` bigint(20) NOT NULL,
  `author` int(6) NOT NULL,
  `m_body` text,
  `tid` bigint(20) NOT NULL,
  `postedat` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `image` blob,
  `latitude` decimal(9,6) DEFAULT NULL,
  `longitude` decimal(9,6) DEFAULT NULL,
  `ReadFlag` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`mid`),
  KEY `author` (`author`),
  KEY `tid` (`tid`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`author`) REFERENCES `user` (`uid`) ON DELETE NO ACTION,
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`tid`) REFERENCES `threads` (`tid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `neighbourhood` (
  `nid` int(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `nw_latitude` decimal(9,6) NOT NULL,
  `nw_longitude` decimal(9,6) NOT NULL,
  `ne_latitude` decimal(9,6) NOT NULL,
  `ne_longitude` decimal(9,6) NOT NULL,
  `se_latitude` decimal(9,6) NOT NULL,
  `se_longitude` decimal(9,6) NOT NULL,
  `sw_latitude` decimal(9,6) NOT NULL,
  `sw_longitude` decimal(9,6) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=latin1;

CREATE TABLE `relationship` (
  `uid1` int(6) NOT NULL DEFAULT '0',
  `uid2` int(6) NOT NULL DEFAULT '0',
  `type` enum('friend','neighbour') NOT NULL DEFAULT 'friend',
  `since` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid1`,`uid2`,`type`),
  KEY `relationship_ibfk_2` (`uid2`),
  CONSTRAINT `relationship_ibfk_1` FOREIGN KEY (`uid1`) REFERENCES `user` (`uid`) ON DELETE CASCADE,
  CONSTRAINT `relationship_ibfk_2` FOREIGN KEY (`uid2`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `threads` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(40) NOT NULL,
  `scope` enum('personnel','block','neighbourhood','friends','neighbours') NOT NULL DEFAULT 'block',
  `scope_id` int(6) DEFAULT NULL,
  `start_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `user` (
  `uid` int(6) NOT NULL AUTO_INCREMENT,
  `email` varchar(80) NOT NULL,
  `fullname` varchar(20) NOT NULL,
  `streetadr1` varchar(40) NOT NULL,
  `streetadr2` varchar(40) DEFAULT NULL,
  `city` varchar(30) NOT NULL,
  `state` char(2) NOT NULL DEFAULT '',
  `zip` int(5) NOT NULL,
  `intro` text,
  `ppic` blob,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `user_login` (
  `uid` int(6) NOT NULL,
  `uname` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uname` (`uname`),
  CONSTRAINT `user_login_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

