-- Source: https://github.com/DPMI/marc_web/blob/17bd0b8f71cc2f24e0fabb5275a2fb5cfa220812/install/mysql.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 3

CREATE TABLE `meta` (
       `key` varchar(16) PRIMARY KEY,
       `value` blob
);

CREATE TABLE `access` (
  `id` int(11) PRIMARY KEY AUTO_INCREMENT,
  `uname` varchar(64) NOT NULL UNIQUE,
  `passwd` varchar(512) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Name` text NOT NULL,
  `Email` text NOT NULL,
  `active` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `greeting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Welcome messages';

CREATE TABLE `guiconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `selected` int(11) NOT NULL DEFAULT '0',
  `pageStyle` text NOT NULL,
  `pageStyleBad` text NOT NULL,
  `projectName` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_3` (`id`),
  KEY `id` (`id`),
  KEY `id_2` (`id`),
  KEY `id_4` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='GUI config';

CREATE TABLE `mainmenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `string` text NOT NULL,
  `url` text NOT NULL,
  `accesslevel` int(11) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `filter_type` (`id` INT PRIMARY KEY, `name` VARCHAR(32)) ENGINE=InnoDB;

CREATE TABLE `mp_status` (`id` INT PRIMARY KEY, `name` VARCHAR(32)) ENGINE=InnoDB;

CREATE TABLE `measurementpoints` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  `port` int NOT NULL DEFAULT '0',
  `mac` varchar(20) NOT NULL DEFAULT '',
  `comment` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MAMPid` varchar(16) NOT NULL DEFAULT '',
  `maxFilters` int NOT NULL DEFAULT '0',
  `noCI` int NOT NULL DEFAULT '0',

  -- 0.7 additions
  `status` int NOT NULL DEFAULT '0',  -- MP status (e.g. distress)
  `drivers` int NOT NULL,             -- bitmask of capture drivers
  `version` text NOT NULL,                -- semicolon separated list of version-numbers (for presentation)
  `CI_iface` text NOT NULL ,    -- semicolon separated list of CI ifaces (for presentation)

  PRIMARY KEY (`id`),
  CONSTRAINT `fk_mp_status` FOREIGN KEY (`status`) REFERENCES `mp_status`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4 PACK_KEYS=0 COMMENT='List of MPs within the MA';

CREATE TABLE `pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `url` text NOT NULL,
  `accesslevel` int NOT NULL DEFAULT '0',
  `text` text NOT NULL,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `text` (`text`)
) ENGINE=MyISAM DEFAULT CHARSET=UTF8MB4 COMMENT='List of pages on site';

CREATE TABLE IF NOT EXISTS `filter` (
  `filter_id` INT NOT NULL,
  `mp` INT NOT NULL,
  `mode` ENUM('AND', 'OR') NOT NULL DEFAULT 'AND',
  `index` INT NOT NULL DEFAULT 0,
  `CI` CHAR(8) NOT NULL DEFAULT '',
  `VLAN_TCI` INT NOT NULL DEFAULT 0,
  `VLAN_TCI_MASK` INT NOT NULL DEFAULT 0,
  `ETH_TYPE` INT NOT NULL DEFAULT 0,
  `ETH_TYPE_MASK` INT NOT NULL DEFAULT 0,
  `ETH_SRC` VARCHAR(17) NOT NULL DEFAULT '',
  `ETH_SRC_MASK` VARCHAR(17) NOT NULL DEFAULT '',
  `ETH_DST` VARCHAR(17) NOT NULL DEFAULT '',
  `ETH_DST_MASK` VARCHAR(17) NOT NULL DEFAULT '',
  `IP_PROTO` INT NOT NULL DEFAULT 0,
  `IP_SRC` VARCHAR(16) NOT NULL DEFAULT '',
  `IP_SRC_MASK` VARCHAR(16) NOT NULL DEFAULT '',
  `IP_DST` VARCHAR(16) NOT NULL DEFAULT '',
  `IP_DST_MASK` VARCHAR(16) NOT NULL DEFAULT '',
  `SRC_PORT` INT NOT NULL DEFAULT 0,
  `SRC_PORT_MASK` INT NOT NULL DEFAULT 0,
  `DST_PORT` INT NOT NULL DEFAULT 0,
  `DST_PORT_MASK` INT NOT NULL DEFAULT 0,
  `destaddr` VARCHAR(23) NOT NULL DEFAULT '',
  `type` INT NOT NULL DEFAULT 0,
  `caplen` INT NOT NULL DEFAULT 0,
  PRIMARY KEY `pk_filter` (`filter_id`, `mp`),
  CONSTRAINT `fk_filter_mp` FOREIGN KEY (`mp`) REFERENCES `measurementpoints`(`id`),
  CONSTRAINT `fk_filter_type` FOREIGN KEY (`type`) REFERENCES `filter_type`(`id`)
) ENGINE=InnoDB;

CREATE TABLE `version` (`num` INT PRIMARY KEY NOT NULL DEFAULT 1);

