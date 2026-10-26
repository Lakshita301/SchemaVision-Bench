-- Source: https://github.com/inverse-inc/packetfence/blob/ffbea2f78da69d7674031da98f2034fb23c56fe8/db/pf-schema-10.3.0.sql?raw=true
-- Tables detected: 44 | FK/REFERENCES mentions: 11

CREATE TABLE `tenant` (
  id int NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  portal_domain_name VARCHAR(255),
  domain_name VARCHAR(255),
  PRIMARY KEY (id),
  UNIQUE KEY tenant_name (`name`),
  UNIQUE KEY tenant_portal_domain_name (`portal_domain_name`),
  UNIQUE KEY tenant_domain_name (`domain_name`)
);

CREATE TABLE class (
  security_event_id int(11) NOT NULL,
  description varchar(255) NOT NULL default "none",
  auto_enable char(1) NOT NULL default "Y",
  max_enables int(11) NOT NULL default 0,
  grace_period int(11) NOT NULL,
  window varchar(255) NOT NULL default 0,
  vclose int(11),
  priority int(11) NOT NULL,
  template varchar(255),
  max_enable_url varchar(255),
  redirect_url varchar(255),
  button_text varchar(255),
  enabled char(1) NOT NULL default "N",
  vlan varchar(255),
  target_category varchar(255),
  delay_by int(11) NOT NULL default 0,
  external_command varchar(255) DEFAULT NULL,
  PRIMARY KEY (security_event_id),
  KEY password_target_category (target_category)
) ENGINE=InnoDB;

CREATE TABLE person (
  tenant_id int NOT NULL DEFAULT 1,
  pid varchar(255) NOT NULL,
  `firstname` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `telephone` varchar(255) default NULL,
  `company` varchar(255) default NULL,
  `address` varchar(255) default NULL,
  `notes` varchar(255),
  `sponsor` varchar(255) default NULL,
  `anniversary` varchar(255) default NULL,
  `birthday` varchar(255) default NULL,
  `gender` char(1) default NULL,
  `lang` varchar(255) default NULL,
  `nickname` varchar(255) default NULL,
  `cell_phone` varchar(255) default NULL,
  `work_phone` varchar(255) default NULL,
  `title` varchar(255) default NULL,
  `building_number` varchar(255) default NULL,
  `apartment_number` varchar(255) default NULL,
  `room_number` varchar(255) default NULL,
  `custom_field_1` varchar(255) default NULL,
  `custom_field_2` varchar(255) default NULL,
  `custom_field_3` varchar(255) default NULL,
  `custom_field_4` varchar(255) default NULL,
  `custom_field_5` varchar(255) default NULL,
  `custom_field_6` varchar(255) default NULL,
  `custom_field_7` varchar(255) default NULL,
  `custom_field_8` varchar(255) default NULL,
  `custom_field_9` varchar(255) default NULL,
  `portal` varchar(255) default NULL,
  `source` varchar(255) default NULL,
  `psk` varchar(255) NULL DEFAULT NULL,
  `potd` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`tenant_id`, `pid`),
  CONSTRAINT `person_tenant_id` FOREIGN KEY(`tenant_id`) REFERENCES `tenant` (`id`)
) ENGINE=InnoDB;

CREATE TABLE `node_category` (
  `category_id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `max_nodes_per_pid` int default 0,
  `notes` varchar(255) default NULL,
  `include_parent_acls` varchar(255) default NULL,
  `fingerbank_dynamic_access_list` varchar(255) default NULL,
  `acls` TEXT NOT NULL default '',
  `inherit_vlan` varchar(50) default NULL,
  `inherit_role` varchar(50) default NULL,
  `inherit_web_auth_url` varchar(50) default NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY node_category_name (`name`)
) ENGINE=InnoDB;

CREATE TABLE node (
  tenant_id int NOT NULL DEFAULT 1,
  mac varchar(17) NOT NULL,
  pid varchar(255) NOT NULL default "default",
  category_id bigint default NULL,
  detect_date datetime NOT NULL default "0000-00-00 00:00:00",
  regdate datetime NOT NULL default "0000-00-00 00:00:00",
  unregdate datetime NOT NULL default "0000-00-00 00:00:00",
  lastskip datetime NOT NULL default "0000-00-00 00:00:00",
  time_balance int(10) unsigned DEFAULT NULL,
  bandwidth_balance bigint(20) unsigned DEFAULT NULL,
  status varchar(15) NOT NULL default "unreg",
  user_agent varchar(255) default NULL,
  computername varchar(255) default NULL,
  notes varchar(255) default NULL,
  last_arp datetime NOT NULL default "0000-00-00 00:00:00",
  last_dhcp datetime NOT NULL default "0000-00-00 00:00:00",
  dhcp_fingerprint varchar(255) default NULL,
  dhcp6_fingerprint varchar(255) default NULL,
  dhcp_vendor varchar(255) default NULL,
  dhcp6_enterprise varchar(255) default NULL,
  device_type varchar(255) default NULL,
  device_class varchar(255) default NULL,
  device_version varchar(255) DEFAULT NULL,
  device_score int DEFAULT NULL,
  device_manufacturer varchar(255) DEFAULT NULL,
  bypass_vlan varchar(50) default NULL,
  voip enum('no','yes') NOT NULL DEFAULT 'no',
  autoreg enum('no','yes') NOT NULL DEFAULT 'no',
  sessionid varchar(30) default NULL,
  machine_account varchar(255) default NULL,
  bypass_role_id int default NULL,
  last_seen DATETIME NOT NULL DEFAULT "0000-00-00 00:00:00",
  PRIMARY KEY (`tenant_id`, `mac`),
  KEY pid (pid),
  KEY category_id (category_id),
  KEY `node_status` (`status`, `unregdate`),
  KEY `node_dhcpfingerprint` (`dhcp_fingerprint`),
  KEY `node_last_seen` (`last_seen`),
  KEY `node_bypass_role_id` (`bypass_role_id`),
  CONSTRAINT `0_57` FOREIGN KEY (`tenant_id`, `pid`) REFERENCES `person` (`tenant_id`, `pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `node_category_key` FOREIGN KEY (`category_id`) REFERENCES `node_category` (`category_id`),
  CONSTRAINT `node_tenant_id` FOREIGN KEY(`tenant_id`) REFERENCES `tenant` (`id`)
) ENGINE=InnoDB;

CREATE TABLE action (
  security_event_id int(11) NOT NULL,
  action varchar(255) NOT NULL,
  PRIMARY KEY (security_event_id,action),
  CONSTRAINT `FOREIGN` FOREIGN KEY (`security_event_id`) REFERENCES `class` (`security_event_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE security_event (
  id BIGINT NOT NULL AUTO_INCREMENT,
  tenant_id int NOT NULL DEFAULT 1,
  mac varchar(17) NOT NULL,
  security_event_id int(11) NOT NULL,
  start_date datetime NOT NULL,
  release_date datetime default "0000-00-00 00:00:00",
  status varchar(10) default "open",
  ticket_ref varchar(255) default NULL,
  notes text,
  KEY security_event_id (security_event_id),
  KEY status (status),
  KEY uniq_mac_status_id (mac,status,security_event_id),
  KEY security_event_release_date (release_date),
  CONSTRAINT `tenant_id_mac_fkey_node` FOREIGN KEY (`tenant_id`, `mac`) REFERENCES `node` (`tenant_id`, `mac`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `security_event_id_fkey_class` FOREIGN KEY (`security_event_id`) REFERENCES `class` (`security_event_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `security_event_tenant_id` FOREIGN KEY(`tenant_id`) REFERENCES `tenant` (`id`),
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE ip4log (
  tenant_id int NOT NULL DEFAULT 1,
  mac varchar(17) NOT NULL,
  ip varchar(45) NOT NULL,
  start_time datetime NOT NULL,
  end_time datetime default "0000-00-00 00:00:00",
  PRIMARY KEY (`tenant_id`, `ip`),
  KEY ip4log_mac_end_time (mac,end_time),
  KEY ip4log_end_time (end_time),
  CONSTRAINT `ip4log_tenant_id` FOREIGN KEY(`tenant_id`) REFERENCES `tenant` (`id`)
) ENGINE=InnoDB;

CREATE TABLE ip4log_history (
  id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  tenant_id int NOT NULL DEFAULT 1,
  mac varchar(17) NOT NULL,
  ip varchar(45) NOT NULL,
  start_time datetime NOT NULL,
  end_time datetime NOT NULL,
  KEY ip4log_history_mac_end_time (mac,end_time),
  KEY end_time (end_time),
  KEY start_time (start_time)
) ENGINE=InnoDB;

CREATE TABLE ip4log_archive (
  id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  tenant_id int NOT NULL DEFAULT 1,
  mac varchar(17) NOT NULL,
  ip varchar(45) NOT NULL,
  start_time datetime NOT NULL,
  end_time datetime NOT NULL,
  KEY end_time (end_time),
  KEY start_time (start_time)
) ENGINE=InnoDB;

CREATE TABLE ip6log (
  tenant_id int NOT NULL DEFAULT 1,
  mac varchar(17) NOT NULL,
  ip varchar(45) NOT NULL,
  type varchar(32) DEFAULT NULL,
  start_time datetime NOT NULL,
  end_time datetime default "0000-00-00 00:00:00",
  PRIMARY KEY (tenant_id, ip),
  KEY ip6log_mac_end_time (mac,end_time),
  KEY ip6log_end_time (end_time),
  CONSTRAINT `ip6log_tenant_id` FOREIGN KEY(`tenant_id`) REFERENCES `tenant` (`id`)
) ENGINE=InnoDB;

CREATE TABLE ip6log_history (
  id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  tenant_id int NOT NULL DEFAULT 1,
  mac varchar(17) NOT NULL,
  ip varchar(45) NOT NULL,
  type varchar(32) DEFAULT NULL,
  start_time datetime NOT NULL,
  end_time datetime NOT NULL,
  KEY ip6log_history_mac_end_time (mac,end_time),
  KEY end_time (end_time),
  KEY start_time (start_time)
) ENGINE=InnoDB;

CREATE TABLE ip6log_archive (
  id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  tenant_id int NOT NULL DEFAULT 1,
  mac varchar(17) NOT NULL,
  ip varchar(45) NOT NULL,
  type varchar(32) DEFAULT NULL,
  start_time datetime NOT NULL,
  end_time datetime NOT NULL,
  KEY end_time (end_time),
  KEY start_time (start_time)
) ENGINE=InnoDB;

CREATE TABLE `locationlog` (
  `tenant_id` int NOT NULL DEFAULT 1,
  `mac` varchar(17) default NULL,
  `switch` varchar(17) NOT NULL default '',
  `port` varchar(20) NOT NULL default '',
  `vlan` varchar(50) default NULL,
  `role` varchar(255) default NULL,
  `connection_type` varchar(50) NOT NULL default '',
  `connection_sub_type` varchar(50) default NULL,
  `dot1x_username` varchar(255) NOT NULL default '',
  `ssid` varchar(32) NOT NULL default '',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `switch_ip` varchar(17) DEFAULT NULL,
  `switch_ip_int` int(10) unsigned AS (INET_ATON(`switch_ip`)) PERSISTENT,
  `switch_mac` varchar(17) DEFAULT NULL,
  `stripped_user_name` varchar (255) DEFAULT NULL,
  `realm`  varchar (255) DEFAULT NULL,
  `session_id` VARCHAR(255) DEFAULT NULL,
  `ifDesc` VARCHAR(255) DEFAULT NULL,
  `voip` enum('no','yes') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`tenant_id`, `mac`),
  KEY `locationlog_end_time` ( `end_time`),
  KEY `locationlog_view_switchport` (`switch`,`port`,`vlan`),
  KEY `locationlog_ssid` (`ssid`),
  KEY `locationlog_session_id_end_time` (`session_id`, `end_time`),
  KEY `locationlog_switch_ip_int` (`switch_ip_int`),
  CONSTRAINT `locationlog_tenant_id` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`)
) ENGINE=InnoDB;

CREATE TABLE `locationlog_history` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tenant_id` int NOT NULL DEFAULT 1,
  `mac` varchar(17) default NULL,
  `switch` varchar(17) NOT NULL default '',
  `port` varchar(20) NOT NULL default '',
  `vlan` varchar(50) default NULL,
  `role` varchar(255) default NULL,
  `connection_type` varchar(50) NOT NULL default '',
  `connection_sub_type` varchar(50) default NULL,
  `dot1x_username` varchar(255) NOT NULL default '',
  `ssid` varchar(32) NOT NULL default '',
  `start_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `end_time` datetime NOT NULL default '0000-00-00 00:00:00',
  `switch_ip` varchar(17) DEFAULT NULL,
  `switch_ip_int` int(10) unsigned AS (INET_ATON(`switch_ip`)) PERSISTENT,
  `switch_mac` varchar(17) DEFAULT NULL,
  `stripped_user_name` varchar (255) DEFAULT NULL,
  `realm`  varchar (255) DEFAULT NULL,
  `session_id` VARCHAR(255) DEFAULT NULL,
  `ifDesc` VARCHAR(255) DEFAULT NULL,
  `voip` enum('no','yes') NOT NULL DEFAULT 'no',
  KEY `locationlog_view_mac` (`tenant_id`, `mac`, `end_time`),
  KEY `locationlog_end_time` ( `end_time`),
  KEY `locationlog_view_switchport` (`switch`,`port`,`end_time`,`vlan`),
  KEY `locationlog_ssid` (`ssid`),
  KEY `locationlog_session_id_end_time` (`session_id`, `end_time`),
  KEY `locationlog_switch_ip_int` (`switch_ip_int`)
) ENGINE=InnoDB;

CREATE TABLE `password` (
  `tenant_id` int NOT NULL DEFAULT 1,
  `pid` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `valid_from` datetime NOT NULL DEFAULT "0000-00-00 00:00:00",
  `expiration` datetime NOT NULL,
  `access_duration` varchar(255) default NULL,
  `access_level` varchar(255) DEFAULT 'NONE',
  `category` int DEFAULT NULL,
  `sponsor` tinyint(1) NOT NULL default 0,
  `unregdate` datetime NOT NULL default "0000-00-00 00:00:00",
  `login_remaining` int DEFAULT NULL,
  PRIMARY KEY (tenant_id, pid),
  KEY password_category (category),
  UNIQUE KEY pid_password_unique (pid)
) ENGINE=InnoDB;

CREATE TABLE sms_carrier (
    id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT comment 'primary key for SMS carrier',
    name varchar(64) unique key comment 'name of the carrier',
    email_pattern varchar(255) not null comment 'sprintf pattern for making an email address from a phone number',
    created datetime not null comment 'date this record was created',
    modified timestamp comment 'date this record was modified'
) ENGINE=InnoDB CHARACTER SET utf8 COLLATE utf8_bin AUTO_INCREMENT = 100056;

CREATE TABLE radius_nas (
  id int(10) NOT NULL auto_increment,
  `tenant_id` int NOT NULL DEFAULT 1,
  nasname varchar(128) NOT NULL,
  shortname varchar(32),
  type varchar(30) default 'other',
  ports int(5),
  secret varchar(60) default 'secret' NOT NULL,
  server varchar(64),
  community varchar(50),
  description varchar(200) default 'RADIUS Client',
  config_timestamp BIGINT,
  start_ip INT UNSIGNED DEFAULT 0,
  end_ip INT UNSIGNED DEFAULT 0,
  range_length INT DEFAULT 0,
  unique_session_attributes varchar(255),
  PRIMARY KEY nasname (nasname),
  KEY id (id),
  INDEX radius_nas_start_ip_end_ip (start_ip, end_ip)
) ENGINE=InnoDB;

CREATE TABLE radacct (
  `radacctid` bigint(21) NOT NULL AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL DEFAULT '1',
  `acctsessionid` varchar(64) NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) NOT NULL DEFAULT '',
  `username` varchar(64) NOT NULL DEFAULT '',
  `groupname` varchar(64) NOT NULL DEFAULT '',
  `realm` varchar(64) DEFAULT '',
  `nasipaddress` varchar(15) NOT NULL DEFAULT '',
  `nasportid` varchar(32) DEFAULT NULL,
  `nasporttype` varchar(32) DEFAULT NULL,
  `acctstarttime` datetime DEFAULT NULL,
  `acctupdatetime` datetime DEFAULT NULL,
  `acctstoptime` datetime DEFAULT NULL,
  `acctinterval` int(12) DEFAULT NULL,
  `acctsessiontime` int(12) unsigned DEFAULT NULL,
  `acctauthentic` varchar(32) DEFAULT NULL,
  `connectinfo_start` varchar(50) DEFAULT NULL,
  `connectinfo_stop` varchar(50) DEFAULT NULL,
  `acctinputoctets` bigint(20) DEFAULT NULL,
  `acctoutputoctets` bigint(20) DEFAULT NULL,
  `calledstationid` varchar(50) NOT NULL DEFAULT '',
  `callingstationid` varchar(50) NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) NOT NULL DEFAULT '',
  `servicetype` varchar(32) DEFAULT NULL,
  `framedprotocol` varchar(32) DEFAULT NULL,
  `framedipaddress` varchar(15) NOT NULL DEFAULT '',
  `nasidentifier` varchar(64) DEFAULT NULL,
  `calledstationssid` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`radacctid`),
  KEY `acctuniqueid` (`acctuniqueid`),
  KEY `username` (`username`),
  KEY `framedipaddress` (`framedipaddress`),
  KEY `acctsessionid` (`acctsessionid`),
  KEY `acctsessiontime` (`acctsessiontime`),
  KEY `acctinterval` (`acctinterval`),
  KEY `acctstoptime` (`acctstoptime`),
  KEY `nasipaddress` (`nasipaddress`),
  KEY `callingstationid` (`callingstationid`),
  KEY `acctstart_acctstop` (`acctstarttime`,`acctstoptime`)
) ENGINE = INNODB;

CREATE TABLE radacct_log (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tenant_id` int NOT NULL DEFAULT 1,
  acctsessionid varchar(64) NOT NULL default '',
  username varchar(64) NOT NULL default '',
  nasipaddress varchar(15) NOT NULL default '',
  acctstatustype varchar(25) NOT NULL default '',
  timestamp datetime NULL default NULL,
  acctinputoctets bigint(20) default NULL,
  acctoutputoctets bigint(20) default NULL,
  acctsessiontime int(12) default NULL,
  acctuniqueid varchar(32) NOT NULL default '',
  KEY acctsessionid (acctsessionid),
  KEY username (username),
  KEY nasipaddress (nasipaddress),
  KEY timestamp (timestamp),
  KEY acctuniqueid (acctuniqueid)
) ENGINE=InnoDB;

CREATE TABLE radreply (
  id int(11) unsigned NOT NULL auto_increment,
  tenant_id int NOT NULL DEFAULT 1,
  username varchar(64) NOT NULL default '',
  attribute varchar(64) NOT NULL default '',
  op char(2) NOT NULL DEFAULT ':=',
  value varchar(253) NOT NULL default '',
  PRIMARY KEY (id),
  KEY (`tenant_id`, `username`)
);

CREATE TABLE scan (
  id varchar(20) NOT NULL,
  `tenant_id` int NOT NULL DEFAULT 1,
  ip varchar(255) NOT NULL,
  mac varchar(17) NOT NULL,
  type varchar(255) NOT NULL,
  start_date datetime NOT NULL,
  update_date timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  status varchar(255) NOT NULL,
  report_id varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE billing (
  id varchar(20) NOT NULL,
  ip varchar(255) NOT NULL,
  mac varchar(17) NOT NULL,
  type varchar(255) NOT NULL,
  start_date datetime NOT NULL,
  update_date timestamp NOT NULL ON UPDATE CURRENT_TIMESTAMP,
  status varchar(255) NOT NULL,
  item varchar(255) NOT NULL,
  price varchar(255) NOT NULL,
  person varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE savedsearch (
  id BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  pid varchar(255) NOT NULL,
  namespace varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  query text,
  in_dashboard tinyint
) ENGINE=InnoDB;

CREATE TABLE wrix (
  id varchar(255) NOT NULL,
  `Provider_Identifier` varchar(64) NULL DEFAULT NULL,
  `Location_Identifier` varchar(64) NULL DEFAULT NULL,
  `Service_Provider_Brand` varchar(64) NULL DEFAULT NULL,
  `Location_Type` varchar(64) NULL DEFAULT NULL,
  `Sub_Location_Type` varchar(64) NULL DEFAULT NULL,
  `English_Location_Name` TEXT NULL DEFAULT NULL,
  `Location_Address1` varchar(128) NULL DEFAULT NULL,
  `Location_Address2` varchar(128) NULL DEFAULT NULL,
  `English_Location_City` varchar(64) NULL DEFAULT NULL,
  `Location_Zip_Postal_Code` varchar(32) NULL DEFAULT NULL,
  `Location_State_Province_Name` varchar(64) NULL DEFAULT NULL,
  `Location_Country_Name` varchar(16) NULL DEFAULT NULL,
  `Location_Phone_Number` varchar(32) NULL DEFAULT NULL,
  `SSID_Open_Auth` varchar(32) NULL DEFAULT NULL,
  `SSID_Broadcasted` char(1) NULL DEFAULT NULL,
  `WEP_Key` varchar(128) NULL DEFAULT NULL,
  `WEP_Key_Entry_Method` varchar(32) NULL DEFAULT NULL,
  `WEP_Key_Size` varchar(32) NULL DEFAULT NULL,
  `SSID_1X` varchar(32) NULL DEFAULT NULL,
  `SSID_1X_Broadcasted` varchar(1) NULL DEFAULT NULL,
  `Security_Protocol_1X` varchar(16) NULL DEFAULT NULL,
  `Client_Support` varchar(128) NULL DEFAULT NULL,
  `Restricted_Access` varchar(1) NULL DEFAULT NULL,
  `Location_URL` varchar(128) NULL DEFAULT NULL,
  `Coverage_Area` varchar(255) NULL DEFAULT NULL,
  `Open_Monday` varchar(32) NULL DEFAULT NULL,
  `Open_Tuesday` varchar(32) NULL DEFAULT NULL,
  `Open_Wednesday` varchar(32) NULL DEFAULT NULL,
  `Open_Thursday` varchar(32) NULL DEFAULT NULL,
  `Open_Friday` varchar(32) NULL DEFAULT NULL,
  `Open_Saturday` varchar(32) NULL DEFAULT NULL,
  `Open_Sunday` varchar(32) NULL DEFAULT NULL,
  `Longitude` varchar(32) NULL DEFAULT NULL,
  `Latitude` varchar(32) NULL DEFAULT NULL,
  `UTC_Timezone` varchar(16) NULL DEFAULT NULL,
  `MAC_Address` varchar(32) NULL DEFAULT NULL,
   PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE activation (
  `code_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tenant_id` int NOT NULL DEFAULT 1,
  `pid` varchar(255) default NULL,
  `mac` varchar(17) default NULL,
  `contact_info` varchar(255) NOT NULL, -- email or phone number were approbation request is sent
  `carrier_id` int(11) NULL,
  `activation_code` varchar(255) NOT NULL,
  `expiration` datetime NOT NULL,
  `unregdate` datetime default NULL,
  `category_id` int default NULL,
  `status` varchar(60) default NULL,
  `type` varchar(60) NOT NULL,
  `portal` varchar(255) default NULL,
  `source_id` varchar(255) default NULL,
  KEY `mac` (mac),
  KEY `identifier` (pid, mac),
  KEY `activation` (activation_code, status)
) ENGINE=InnoDB;

CREATE TABLE keyed (
  id VARCHAR(255),
  value LONGBLOB,
  PRIMARY KEY(id)
) ENGINE=InnoDB;

CREATE TABLE pf_version (`id` INT NOT NULL PRIMARY KEY, `version` VARCHAR(11) NOT NULL UNIQUE KEY, created_at DATETIME DEFAULT CURRENT_TIMESTAMP) ENGINE=InnoDB;

CREATE TABLE radius_audit_log (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tenant_id` int NOT NULL DEFAULT 1,
  created_at TIMESTAMP NOT NULL,
  mac char(17) NOT NULL,
  ip varchar(255) NULL,
  computer_name varchar(255) NULL,
  user_name varchar(255) NULL,
  stripped_user_name varchar(255) NULL,
  realm varchar(255) NULL,
  event_type varchar(255) NULL,
  switch_id varchar(255) NULL,
  switch_mac varchar(255) NULL,
  switch_ip_address varchar(255) NULL,
  radius_source_ip_address varchar(255),
  called_station_id varchar(255) NULL,
  calling_station_id varchar(255) NULL,
  nas_port_type varchar(255) NULL,
  ssid varchar(255) NULL,
  nas_port_id varchar(255) NULL,
  ifindex varchar(255) NULL,
  nas_port varchar(255) NULL,
  connection_type varchar(255) NULL,
  nas_ip_address varchar(255) NULL,
  nas_identifier varchar(255) NULL,
  auth_status varchar(255) NULL,
  reason TEXT NULL,
  auth_type varchar(255) NULL,
  eap_type varchar(255) NULL,
  role varchar(255) NULL,
  node_status varchar(255) NULL,
  profile varchar(255) NULL,
  source varchar(255) NULL,
  auto_reg char(1) NULL,
  is_phone char(1) NULL,
  pf_domain varchar(255) NULL,
  uuid varchar(255) NULL,
  radius_request TEXT,
  radius_reply TEXT,
  request_time int(11) DEFAULT NULL,
  radius_ip varchar(45) NULL,
  KEY `created_at` (created_at),
  KEY `mac` (mac),
  KEY `ip` (ip),
  KEY `user_name` (user_name),
  KEY `auth_status` (auth_status, created_at)
) ENGINE=InnoDB;

CREATE TABLE `dhcp_option82` (
  `mac` varchar(17) NOT NULL PRIMARY KEY,
  `created_at` TIMESTAMP NOT NULL,
  `option82_switch` varchar(17) NULL,
  `switch_id` varchar(17) NULL,
  `port` varchar(8) NOT NULL default '',
  `vlan` varchar(255) default NULL,
  `circuit_id_string` varchar(255) default NULL,
  `module` varchar(255) default NULL,
  `host` varchar(255) default NULL,
  UNIQUE KEY mac (mac)
) ENGINE=InnoDB;

CREATE TABLE `dhcp_option82_history` (
  `dhcp_option82_history_id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `mac` varchar(17) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `option82_switch` varchar(17) NULL,
  `switch_id` varchar(17) NULL,
  `port` varchar(8) NOT NULL default '',
  `vlan` varchar(255) default NULL,
  `circuit_id_string` varchar(255) default NULL,
  `module` varchar(255) default NULL,
  `host` varchar(255) default NULL,
  INDEX (mac)
) ENGINE=InnoDB;

CREATE TABLE auth_log (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tenant_id` int NOT NULL DEFAULT 1,
  `process_name` varchar(255) NOT NULL,
  `mac` varchar(17) NOT NULL,
  `pid` varchar(255) NOT NULL default "default",
  `status` varchar(255) NOT NULL default "incomplete",
  `attempted_at` datetime NOT NULL,
  `completed_at` datetime,
  `source` varchar(255) NOT NULL,
  `profile` VARCHAR(255) DEFAULT NULL,
  KEY pid (pid),
  KEY  attempted_at (attempted_at)
) ENGINE=InnoDB;

CREATE TABLE `chi_cache` (
  `key` VARCHAR(767),
  `value` LONGBLOB,
  `expires_at` REAL,
  PRIMARY KEY (`key`),
  KEY chi_cache_expires_at (expires_at)
);

CREATE TABLE key_value_storage (
  id VARCHAR(255),
  value BLOB,
  PRIMARY KEY(id)
) ENGINE=InnoDB;

CREATE TABLE user_preference (
  tenant_id int NOT NULL DEFAULT 1,
  pid varchar(255) NOT NULL,
  id varchar(255) NOT NULL,
  value LONGBLOB,
  PRIMARY KEY (`tenant_id`, `pid`, `id`)
) ENGINE=InnoDB;

CREATE TABLE `dns_audit_log` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(45) NOT NULL,
  `mac` char(17) NOT NULL,
  `qname` varchar(255) DEFAULT NULL,
  `qtype` varchar(255) DEFAULT NULL,
  `scope` varchar(22) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL,
   KEY `created_at` (`created_at`),
   KEY `mac` (`mac`),
   KEY `ip` (`ip`)
) ENGINE=InnoDB;

CREATE TABLE `admin_api_audit_log` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `tenant_id` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `user_name` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `action` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `object_id` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `method` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL,
  `request` mediumtext COLLATE utf8mb4_bin,
  `status` smallint(5) NOT NULL,
   KEY `action` (`action`),
   KEY `user_name` (`user_name`),
   KEY `object_id_action` (`object_id`, `action`),
   KEY `created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPRESSED;

CREATE TABLE dhcppool (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  pool_name             varchar(30) NOT NULL,
  idx                   int(11) NOT NULL,
  mac                   VARCHAR(30) NOT NULL,
  free                  BOOLEAN NOT NULL default '1',
  released              DATETIME(6) NULL default NULL,
  UNIQUE KEY dhcppool_poolname_idx (pool_name, idx),
  KEY mac (mac),
  KEY released (released)
) ENGINE=InnoDB;

CREATE TABLE `pki_cas` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cn` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `organisational_unit` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `key_type` int(11) DEFAULT NULL,
  `key_size` int(11) DEFAULT NULL,
  `digest` int(11) DEFAULT NULL,
  `key_usage` varchar(255) DEFAULT NULL,
  `extended_key_usage` varchar(255) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `key` longtext,
  `cert` longtext,
  `issuer_key_hash` varchar(255) DEFAULT NULL,
  `issuer_name_hash` varchar(255) DEFAULT NULL,
  `ocsp_url` varchar(255) DEFAULT NULL,
  UNIQUE KEY `cn` (`cn`),
  UNIQUE KEY `uix_cas_issuer_key_hash` (`issuer_key_hash`),
  UNIQUE KEY `uix_cas_issuer_name_hash` (`issuer_name_hash`),
  KEY `mail` (`mail`),
  KEY `organisation` (`organisation`),
  KEY `idx_cas_deleted_at` (`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

CREATE TABLE `pki_certs` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cn` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `ca_id` int(10) unsigned DEFAULT NULL,
  `ca_name` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `organisational_unit` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `key` longtext,
  `cert` longtext,
  `profile_id` int(10) unsigned DEFAULT NULL,
  `profile_name` varchar(255) DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `serial_number` varchar(255) DEFAULT NULL,
  `dns_names` varchar(255) DEFAULT NULL,
  `ip_addresses` varchar(255) DEFAULT NULL,
  UNIQUE KEY `cn` (`cn`),
  KEY `profile_name` (`profile_name`),
  KEY `valid_until` (`valid_until`),
  KEY `idx_certs_deleted_at` (`deleted_at`),
  KEY `mail` (`mail`),
  KEY `ca_id` (`ca_id`),
  KEY `ca_name` (`ca_name`),
  KEY `organisation` (`organisation`),
  KEY `profile_id` (`profile_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

CREATE TABLE `pki_profiles` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `organisational_unit` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `ca_id` int(10) unsigned DEFAULT NULL,
  `ca_name` varchar(255) DEFAULT NULL,
  `validity` int(11) DEFAULT NULL,
  `key_type` int(11) DEFAULT NULL,
  `key_size` int(11) DEFAULT NULL,
  `digest` int(11) DEFAULT NULL,
  `key_usage` varchar(255) DEFAULT NULL,
  `extended_key_usage` varchar(255) DEFAULT NULL,
  `ocsp_url` varchar(255) DEFAULT NULL,
  `p12_mail_password` int(11) DEFAULT NULL,
  `p12_mail_subject` varchar(255) DEFAULT NULL,
  `p12_mail_from` varchar(255) DEFAULT NULL,
  `p12_mail_header` varchar(255) DEFAULT NULL,
  `p12_mail_footer` varchar(255) DEFAULT NULL,
  `scep_enabled` int(11) DEFAULT NULL,
  `scep_challenge_password` varchar(255) DEFAULT NULL,
  `scep_days_before_renewal` varchar(255) DEFAULT NULL,
  UNIQUE KEY `name` (`name`),
  KEY `idx_profiles_deleted_at` (`deleted_at`),
  KEY `ca_id` (`ca_id`),
  KEY `ca_name` (`ca_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3;

CREATE TABLE `pki_revoked_certs` (
  `id` BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cn` varchar(255) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `ca_id` int(10) unsigned DEFAULT NULL,
  `ca_name` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL,
  `organisation` varchar(255) DEFAULT NULL,
  `organisational_unit` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `locality` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `key` longtext,
  `cert` longtext,
  `profile_id` int(10) unsigned DEFAULT NULL,
  `profile_name` varchar(255) DEFAULT NULL,
  `valid_until` timestamp NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `serial_number` varchar(255) DEFAULT NULL,
  `dns_names` varchar(255) DEFAULT NULL,
  `ip_addresses` varchar(255) DEFAULT NULL,
  `revoked` timestamp NULL DEFAULT NULL,
  `crl_reason` int(11) DEFAULT NULL,
  KEY `valid_until` (`valid_until`),
  KEY `crl_reason` (`crl_reason`),
  KEY `idx_revoked_certs_deleted_at` (`deleted_at`),
  KEY `cn` (`cn`),
  KEY `mail` (`mail`),
  KEY `ca_id` (`ca_id`),
  KEY `profile_id` (`profile_id`),
  KEY `profile_name` (`profile_name`),
  KEY `ca_name` (`ca_name`),
  KEY `organisation` (`organisation`),
  KEY `revoked` (`revoked`)
) ENGINE=InnoDB;

CREATE TABLE bandwidth_accounting (
    node_id BIGINT UNSIGNED NOT NULL,
    unique_session_id BIGINT UNSIGNED NOT NULL,
    time_bucket DATETIME NOT NULL,
    source_type ENUM('net_flow','radius') NOT NULL,
    in_bytes BIGINT SIGNED NOT NULL,
    out_bytes BIGINT SIGNED NOT NULL,
    mac CHAR(17) NOT NULL,
    tenant_id SMALLINT NOT NULL,
    last_updated DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    total_bytes BIGINT SIGNED AS (in_bytes + out_bytes) VIRTUAL,
    PRIMARY KEY (node_id, time_bucket, unique_session_id),
    KEY bandwidth_aggregate_buckets (time_bucket, node_id, unique_session_id, in_bytes, out_bytes),
    KEY bandwidth_source_type_time_bucket (source_type, time_bucket),
    KEY bandwidth_last_updated_source_type (last_updated, source_type),
    KEY bandwidth_node_id_unique_session_id_last_updated (node_id, unique_session_id, last_updated),
    KEY bandwidth_accounting_tenant_id_mac (tenant_id, mac)
);

CREATE TABLE bandwidth_accounting_history (
    node_id BIGINT UNSIGNED NOT NULL,
    time_bucket DATETIME NOT NULL,
    in_bytes BIGINT SIGNED NOT NULL,
    out_bytes BIGINT SIGNED NOT NULL,
    total_bytes BIGINT SIGNED AS (in_bytes + out_bytes) VIRTUAL,
    mac CHAR(17) NOT NULL,
    tenant_id SMALLINT NOT NULL,
    PRIMARY KEY (node_id, time_bucket),
    KEY bandwidth_aggregate_buckets (time_bucket, node_id, in_bytes, out_bytes),
    KEY bandwidth_accounting_tenant_id_mac (tenant_id, mac)
);

