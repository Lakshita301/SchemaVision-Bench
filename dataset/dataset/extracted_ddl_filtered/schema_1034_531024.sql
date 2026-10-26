-- Source: https://github.com/juwuba/study2019/blob/761c74f3e2e5189bfd730c849739c6f0645d437f/SanJiankeBook/src/main/resources/novelUpdate.sql?raw=true
-- Tables detected: 9 | FK constraints: 8

CREATE TABLE `admin` (
  `adid` int(11) NOT NULL auto_increment,
  `adnumber` varchar(30) default NULL,
  `adpassword` varchar(30) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`adid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `author` (
  `aid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `aname` varchar(30) default NULL,
  `pan_name` varchar(30) default NULL,
  `aage` int(11) default NULL,
  `agrade` varchar(20) default NULL,
  `acard` varchar(30) default NULL,
  `atel` varchar(30) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`aid`),
  KEY `uid` (`uid`),
  CONSTRAINT `author_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `novel` (
  `nid` int(11) NOT NULL auto_increment,
  `tid` int(11) NOT NULL,
  `aid` int(11) NOT NULL,
  `nname` varchar(30) default NULL,
  `npicture` varchar(100) default NULL,
  `ndescription` varchar(500) default NULL,
  `nstatus` varchar(15) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`nid`),
  KEY `tid` (`tid`),
  KEY `aid` (`aid`),
  CONSTRAINT `novel_ibfk_1` FOREIGN KEY (`tid`) REFERENCES `novel_type` (`tid`),
  CONSTRAINT `novel_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `author` (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `novel_chapter` (
  `cid` int(11) NOT NULL auto_increment,
  `nid` int(11) NOT NULL,
  `cname` varchar(100) default NULL,
  `caddress` varchar(300) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`cid`),
  KEY `nid` (`nid`),
  CONSTRAINT `novel_chapter_ibfk_1` FOREIGN KEY (`nid`) REFERENCES `novel` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `novel_type` (
  `tid` int(11) NOT NULL auto_increment,
  `tname` varchar(15) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sensitive_word` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL auto_increment,
  `uname` varchar(30) default NULL,
  `u_number` varchar(30) default NULL,
  `upassword` varchar(30) default NULL,
  `usex` varchar(10) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_book` (
  `ubid` int(11) NOT NULL auto_increment,
  `nid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `ubdate` varchar(30) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` int(11) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`ubid`),
  KEY `uid` (`uid`),
  KEY `nid` (`nid`),
  CONSTRAINT `user_book_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `user_book_ibfk_2` FOREIGN KEY (`nid`) REFERENCES `novel` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user_talk` (
  `utid` int(11) NOT NULL auto_increment,
  `nid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `utdate` varchar(30) default NULL,
  `utcontent` varchar(500) default NULL,
  `standby_1` varchar(100) default NULL,
  `standby_2` varchar(100) default NULL,
  `standby_3` varchar(100) default NULL,
  PRIMARY KEY  (`utid`),
  KEY `uid` (`uid`),
  KEY `nid` (`nid`),
  CONSTRAINT `user_talk_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`),
  CONSTRAINT `user_talk_ibfk_2` FOREIGN KEY (`nid`) REFERENCES `novel` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

