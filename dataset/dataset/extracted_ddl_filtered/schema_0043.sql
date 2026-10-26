-- Source: https://github.com/kdimolikas/WebParmenidianTruth/blob/5af6174287f48663e3b7156fe90a3beeb61b783a/resources/projects/Zabbix/rev_1.034.sql?raw=true
-- Tables detected: 23 | FK/REFERENCES mentions: 38

CREATE TABLE hosts (
  hostid		serial,
  host			varchar(64)	DEFAULT '' 		NOT NULL,
  useip			int4		DEFAULT '0'		NOT NULL,
  ip			varchar(15)	DEFAULT '127.0.0.1'	NOT NULL,
  port			int4		DEFAULT '0'		NOT NULL,
  status		int4		DEFAULT '0'		NOT NULL,
  disable_until		int4		DEFAULT '0'		NOT NULL,
  PRIMARY KEY (hostid)
);

CREATE TABLE items (
  itemid		serial,
  type			int4		NOT NULL,
  value_type		int4		DEFAULT '0' NOT NULL,
  snmp_community	varchar(64)	DEFAULT '' NOT NULL,
  snmp_oid		varchar(255)	DEFAULT '' NOT NULL,
  hostid		int4		NOT NULL,
  description		varchar(255)	DEFAULT '' NOT NULL,
  key_			varchar(64)	DEFAULT '' NOT NULL,
  delay			int4		DEFAULT '0' NOT NULL,
  history		int4		DEFAULT '0' NOT NULL,
  lastdelete		int4		DEFAULT '0' NOT NULL,
  nextcheck		int4		DEFAULT '0' NOT NULL,
  lastvalue		float8		DEFAULT NULL,
  lastclock		int4		DEFAULT NULL,
  prevvalue		float8		DEFAULT NULL,
  status		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (itemid),
  FOREIGN KEY (hostid) REFERENCES hosts (hostid)
);

CREATE TABLE config (
  smtp_server		varchar(255)	DEFAULT '' NOT NULL,
  smtp_helo		varchar(255)	DEFAULT '' NOT NULL,
  smtp_email		varchar(255)	DEFAULT '' NOT NULL,
  password_required	int4		DEFAULT '0' NOT NULL,
  alert_history		int4		DEFAULT '0' NOT NULL,
  alarm_history		int4		DEFAULT '0' NOT NULL
);

CREATE TABLE groups (
  groupid		serial,
  name			varchar(64)	DEFAULT '' NOT NULL,
  PRIMARY KEY (groupid)
);

CREATE TABLE triggers (
  triggerid		serial,
  expression		varchar(255)	DEFAULT '' NOT NULL,
  description		varchar(255)	DEFAULT '' NOT NULL,
  url			varchar(255)	DEFAULT '' NOT NULL,
  istrue		int4		DEFAULT '0' NOT NULL,
  priority		int2		DEFAULT '0' NOT NULL,
  lastchange		int4		DEFAULT '0' NOT NULL,
  dep_level		int2		DEFAULT '0' NOT NULL,
  comments		text,
  PRIMARY KEY (triggerid)
);

CREATE TABLE trigger_depends (
  triggerid_down	int4	DEFAULT '0' NOT NULL,
  triggerid_up		int4	DEFAULT '0' NOT NULL,
  PRIMARY KEY		(triggerid_down, triggerid_up)
);

CREATE TABLE users (
  userid		serial,
  groupid		int4		NOT NULL DEFAULT '0',
  alias			varchar(100)	DEFAULT '' NOT NULL,
  name			varchar(100)	DEFAULT '' NOT NULL,
  surname		varchar(100)	DEFAULT '' NOT NULL,
  passwd		char(32)	DEFAULT '' NOT NULL,
  PRIMARY KEY (userid),
  FOREIGN KEY (groupid) REFERENCES groups (groupid)
);

CREATE TABLE actions (
  actionid		serial,
  triggerid		int4		DEFAULT '0' NOT NULL,
  userid		int4		DEFAULT '0' NOT NULL,
  good			int4		DEFAULT '0' NOT NULL,
  delay			int4		DEFAULT '0' NOT NULL,
  subject		varchar(255)	DEFAULT '' NOT NULL,
  message		text		DEFAULT '' NOT NULL,
  nextcheck		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (actionid),
  FOREIGN KEY (triggerid) REFERENCES triggers (triggerid),
  FOREIGN KEY (userid) REFERENCES users (userid)
);

CREATE TABLE alerts (
  alertid		serial,
  actionid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  type			varchar(10)	DEFAULT '' NOT NULL,
  sendto		varchar(100)	DEFAULT '' NOT NULL,
  subject		varchar(255)	DEFAULT '' NOT NULL,
  message		text		DEFAULT '' NOT NULL,
  PRIMARY KEY (alertid),
  FOREIGN KEY (actionid) REFERENCES actions (actionid)
);

CREATE TABLE alarms (
  alarmid		serial,
  triggerid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  istrue		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (alarmid),
  FOREIGN KEY (triggerid) REFERENCES triggers (triggerid)
);

CREATE TABLE functions (
  functionid		serial,
  itemid		int4		DEFAULT '0' NOT NULL,
  triggerid		int4		DEFAULT '0' NOT NULL,
  lastvalue		float8		DEFAULT '0.0000' NOT NULL,
  function		varchar(10)	DEFAULT '' NOT NULL,
  parameter		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (functionid),
  FOREIGN KEY (itemid) REFERENCES items (itemid),
  FOREIGN KEY (triggerid) REFERENCES triggers (triggerid)
);

CREATE TABLE history (
  itemid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  value			float8		DEFAULT '0.0000' NOT NULL,
  PRIMARY KEY (itemid,clock),
  FOREIGN KEY (itemid) REFERENCES items (itemid)
);

CREATE TABLE history_str (
  itemid                int4            DEFAULT '0' NOT NULL,
  clock                 int4            DEFAULT '0' NOT NULL,
  value                 varchar(255)    DEFAULT '' NOT NULL,
  PRIMARY KEY (itemid,clock),
  FOREIGN KEY (itemid) REFERENCES items (itemid)
);

CREATE TABLE items_template (
  itemtemplateid	int4		NOT NULL,
  description		varchar(255)	DEFAULT '' NOT NULL,
  key_			varchar(64)	DEFAULT '' NOT NULL,
  delay			int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (itemtemplateid)
);

CREATE TABLE triggers_template (
  triggertemplateid	int4		NOT NULL,
  itemtemplateid	int4		NOT NULL,
  description		varchar(255)	DEFAULT '' NOT NULL,
  expression		varchar(255)	DEFAULT '' NOT NULL,
  PRIMARY KEY (triggertemplateid),
  FOREIGN KEY (itemtemplateid) REFERENCES items_template (itemtemplateid)
);

CREATE TABLE media (
  mediaid		serial,
  userid		int4		DEFAULT '0' NOT NULL,
  type			varchar(10)	DEFAULT '' NOT NULL,
  sendto		varchar(100)	DEFAULT '' NOT NULL,
  active		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (mediaid),
  FOREIGN KEY (userid) REFERENCES users (userid)
);

CREATE TABLE sysmaps (
  sysmapid		serial,
  name			varchar(128)	DEFAULT '' NOT NULL,
  width			int4		DEFAULT '0' NOT NULL,
  height		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (sysmapid)
);

CREATE TABLE sysmaps_hosts (
  shostid		serial,
  sysmapid		int4		DEFAULT '0' NOT NULL,
  hostid		int4		DEFAULT '0' NOT NULL,
  icon			varchar(32)	DEFAULT 'Server' NOT NULL,
  label			varchar(128)	DEFAULT '' NOT NULL,
  x			int4		DEFAULT '0' NOT NULL,
  y			int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (shostid),
  FOREIGN KEY (sysmapid) REFERENCES sysmaps (sysmapid),
  FOREIGN KEY (hostid) REFERENCES hosts (hostid)
);

CREATE TABLE sysmaps_links (
  linkid		serial,
  sysmapid		int4		DEFAULT '0' NOT NULL,
  shostid1		int4		DEFAULT '0' NOT NULL,
  shostid2		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (linkid),
  FOREIGN KEY (sysmapid) REFERENCES sysmaps (sysmapid),
  FOREIGN KEY (shostid1) REFERENCES sysmaps_hosts (shostid1),
  FOREIGN KEY (shostid2) REFERENCES sysmaps_hosts (shostid2)
);

CREATE TABLE graphs (
  graphid		serial,
  name			varchar(128)	DEFAULT '' NOT NULL,
  width			int4		DEFAULT '0' NOT NULL,
  height		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (graphid),
  UNIQUE (name)
);

CREATE TABLE graphs_items (
  gitemid		serial,
  graphid		int4		DEFAULT '0' NOT NULL,
  itemid		int4		DEFAULT '0' NOT NULL,
  color			varchar(32)	DEFAULT 'Dark Green' NOT NULL,
  PRIMARY KEY (gitemid),
  FOREIGN KEY (graphid) REFERENCES graphs (graphid),
  FOREIGN KEY (itemid) REFERENCES items (itemid)
);

CREATE TABLE services (
  serviceid		serial,
  name			varchar(128)	DEFAULT '' NOT NULL,
  status		int2		DEFAULT '0' NOT NULL,
  triggerid		int4,
  PRIMARY KEY (serviceid)
);

CREATE TABLE services_links (
  serviceupid		int4		DEFAULT '0' NOT NULL,
  servicedownid		int4		DEFAULT '0' NOT NULL,
  soft			int2		DEFAULT '0' NOT NULL
);

