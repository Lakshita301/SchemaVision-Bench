-- Source: https://github.com/DAINTINESS-Group/Schema_Evolution_Datasets/blob/9a5b20bd52424fc31e41d22c50f3847e1c7574ad/SchemaEvolutionDatasets2017/CMS's/Zabbix/postgresql/schemata/rev_1.153.sql?raw=true
-- Tables detected: 48 | FK/REFERENCES mentions: 66

CREATE TABLE hosts (
  hostid		serial,
  host			varchar(64)	DEFAULT '' 		NOT NULL,
  useip			int4		DEFAULT '0'		NOT NULL,
  ip			varchar(15)	DEFAULT '127.0.0.1'	NOT NULL,
  port			int4		DEFAULT '0'		NOT NULL,
  status		int4		DEFAULT '0'		NOT NULL,
  disable_until		int4		DEFAULT '0'		NOT NULL,
  error			varchar(128)	DEFAULT ''		NOT NULL,
  available		int4		DEFAULT '0'		NOT NULL,
  errors_from		int4		DEFAULT '0'		NOT NULL,
  templateid		int4		DEFAULT '0'		NOT NULL,
  PRIMARY KEY (hostid)
);

CREATE TABLE items (
  itemid		serial,
  type			int4		NOT NULL,
  snmp_community	varchar(64)	DEFAULT ''	NOT NULL,
  snmp_oid		varchar(255)	DEFAULT ''	NOT NULL,
  snmp_port		int4		DEFAULT '161'	NOT NULL,
  hostid		int4		NOT NULL,
  description		varchar(255)	DEFAULT '' NOT NULL,
  key_			varchar(64)	DEFAULT '' NOT NULL,
  delay			int4		DEFAULT '0' NOT NULL,
  history		int4		DEFAULT '90' NOT NULL,
  trends		int4		DEFAULT '365' NOT NULL,
-- lastdelete is no longer required
--  lastdelete		int4		DEFAULT '0' NOT NULL,
  nextcheck		int4		DEFAULT '0' NOT NULL,
  lastvalue		varchar(255)	DEFAULT NULL,
  lastclock		int4		DEFAULT NULL,
  prevvalue		varchar(255)	DEFAULT NULL,
  status		int4		DEFAULT '0' NOT NULL,
  value_type		int4		DEFAULT '0' NOT NULL,
  trapper_hosts		varchar(255)	DEFAULT '' NOT NULL,
  units			varchar(10)	DEFAULT '' NOT NULL,
  multiplier		int4		DEFAULT '0' NOT NULL,
  delta			int4		DEFAULT '0' NOT NULL,
  prevorgvalue		float8		DEFAULT NULL,
  snmpv3_securityname	varchar(64)	DEFAULT '' NOT NULL,
  snmpv3_securitylevel	int4		DEFAULT '0' NOT NULL,
  snmpv3_authpassphrase	varchar(64)	DEFAULT '' NOT NULL,
  snmpv3_privpassphrase	varchar(64)	DEFAULT '' NOT NULL,
  formula		varchar(255)	DEFAULT '0' NOT NULL,
  error			varchar(128)	DEFAULT '' NOT NULL,
  lastlogsize		int4		DEFAULT '0' NOT NULL,
  logtimefmt		varchar(64)	DEFAULT '' NOT NULL,
  templateid		int4		DEFAULT '0' NOT NULL,
  valuemapid		int4		 DEFAULT '0' NOT NULL,
  PRIMARY KEY (itemid)
--  FOREIGN KEY (hostid) REFERENCES hosts
);

CREATE TABLE config (
--  smtp_server		varchar(255)	DEFAULT '' NOT NULL,
--  smtp_helo		varchar(255)	DEFAULT '' NOT NULL,
--  smtp_email		varchar(255)	DEFAULT '' NOT NULL,
--  password_required	int4		DEFAULT '0' NOT NULL,
  alert_history		int4		DEFAULT '0' NOT NULL,
  alarm_history		int4		DEFAULT '0' NOT NULL,
  refresh_unsupported	int4		DEFAULT '0' NOT NULL
  work_period		varchar(100)	DEFAULT '1-5,00:00-24:00' NOT NULL
);

CREATE TABLE groups (
  groupid		serial,
  name			varchar(64)     DEFAULT '' NOT NULL,
  PRIMARY KEY (groupid)
);

CREATE TABLE hosts_groups (
  hostid		int4		DEFAULT '0' NOT NULL,
  groupid		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (hostid,groupid)
);

CREATE TABLE triggers (
  triggerid		serial,
  expression		varchar(255)	DEFAULT '' NOT NULL,
  description		varchar(255)	DEFAULT '' NOT NULL,
  url			varchar(255)	DEFAULT '' NOT NULL,
  status		int4		DEFAULT '0' NOT NULL,
  value			int4		DEFAULT '0' NOT NULL,
  priority		int2		DEFAULT '0' NOT NULL,
  lastchange		int4		DEFAULT '0' NOT NULL,
  dep_level		int2		DEFAULT '0' NOT NULL,
  comments		text,
  error			varchar(128)	DEFAULT '' NOT NULL,
  templateid		int4 DEFAULT '0' NOT NULL,
  PRIMARY KEY (triggerid)
);

CREATE TABLE trigger_depends (
  triggerid_down	int4	DEFAULT '0' NOT NULL,
  triggerid_up		int4	DEFAULT '0' NOT NULL,
  PRIMARY KEY		(triggerid_down, triggerid_up)
);

CREATE TABLE users (
  userid		serial,
  alias			varchar(100)	DEFAULT '' NOT NULL,
  name			varchar(100)	DEFAULT '' NOT NULL,
  surname		varchar(100)	DEFAULT '' NOT NULL,
  passwd		char(32)	DEFAULT '' NOT NULL,
  url			varchar(255)	DEFAULT '' NOT NULL,
  autologout		int4		DEFAULT '900' NOT NULL,
  lang			varchar(5)	DEFAULT 'en_gb' NOT NULL,
  refresh		int4		DEFAULT '30' NOT NULL,
  PRIMARY KEY (userid)
);

CREATE TABLE auditlog (
  auditid		serial,
  userid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  action		int4		DEFAULT '0' NOT NULL,
  resourcetype		int4		DEFAULT '0' NOT NULL,
  details		varchar(128)	DEFAULT '0' NOT NULL,
  PRIMARY KEY (auditid)
);

CREATE TABLE actions (
  actionid		serial,
  userid		int4		DEFAULT '0' NOT NULL,
--  delay			int4		DEFAULT '0' NOT NULL,
  subject		varchar(255)	DEFAULT '' NOT NULL,
  message		text		DEFAULT '' NOT NULL,
--  nextcheck		int4		DEFAULT '0' NOT NULL,
  recipient		int4		DEFAULT '0' NOT NULL,
  maxrepeats		int4		DEFAULT '0' NOT NULL,
  repeatdelay		int4		DEFAULT '600' NOT NULL,
  source		int2		DEFAULT '0' NOT NULL,
  actiontype		int2		DEFAULT '0' NOT NULL,
  status		int2		DEFAULT '0' NOT NULL,
  scripts		text		DEFAULT '' NOT NULL,
  PRIMARY KEY (actionid)
--  depends on scope. Could be hostid or 0.
--  FOREIGN KEY (triggerid) REFERENCES triggers
--  could be groupid
--  FOREIGN KEY (userid) REFERENCES users
);

CREATE TABLE conditions (
  conditionid		serial,
  actionid		int4		DEFAULT '0' NOT NULL,
  conditiontype		int4		DEFAULT '0' NOT NULL,
  operator		int1		DEFAULT '0' NOT NULL,
  value			varchar(255)	DEFAULT '' NOT NULL,
  PRIMARY KEY (conditionid)
--  FOREIGN KEY (actionid) REFERENCES actions
);

CREATE TABLE media_type (
  mediatypeid		serial,
  type			int4		DEFAULT '0' NOT NULL,
  description		varchar(100)	DEFAULT '' NOT NULL,
  smtp_server		varchar(255)	DEFAULT '' NOT NULL,
  smtp_helo		varchar(255)	DEFAULT '' NOT NULL,
  smtp_email		varchar(255)	DEFAULT '' NOT NULL,
  exec_path		varchar(255)	DEFAULT '' NOT NULL,
  gsm_modem		varchar(255)	DEFAULT '' NOT NULL,
  PRIMARY KEY(mediatypeid)
);

CREATE TABLE alerts (
  alertid		serial,
  actionid		int4		DEFAULT '0' NOT NULL,
  triggerid		int4		DEFAULT '0' NOT NULL,
  userid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
--  type		varchar(10)	DEFAULT '' NOT NULL,
  mediatypeid		int4		DEFAULT '0' NOT NULL,
  sendto		varchar(100)	DEFAULT '' NOT NULL,
  subject		varchar(255)	DEFAULT '' NOT NULL,
  message		text		DEFAULT '' NOT NULL,
  status		int4		DEFAULT '0' NOT NULL,
  retries		int4		DEFAULT '0' NOT NULL,
  error			varchar(128)	DEFAULT '' NOT NULL,
  repeats		int4		DEFAULT '0' NOT NULL,
  maxrepeats		int4		DEFAULT '0' NOT NULL,
  nextcheck		int4		DEFAULT '0' NOT NULL,
  delay			int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (alertid)
--  FOREIGN KEY (actionid) REFERENCES actions,
--  FOREIGN KEY (triggerid) REFERENCES triggers,
--  FOREIGN KEY (mediatypeid) REFERENCES media_type
);

CREATE TABLE alarms (
  alarmid		serial,
  triggerid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  value			int4		DEFAULT '0' NOT NULL,
  acknowledged		int2		DEFAULT '0' NOT NULL,
  PRIMARY KEY (alarmid)
--  FOREIGN KEY (triggerid) REFERENCES triggers
);

CREATE TABLE functions (
  functionid		serial,
  itemid		int4		DEFAULT '0' NOT NULL,
  triggerid		int4		DEFAULT '0' NOT NULL,
  lastvalue		varchar(255),
  function		varchar(12)	DEFAULT '' NOT NULL,
  parameter		varchar(255)	DEFAULT '0' NOT NULL,
  PRIMARY KEY (functionid)
--  FOREIGN KEY (itemid) REFERENCES items,
--  FOREIGN KEY (triggerid) REFERENCES triggers
);

CREATE TABLE history (
  itemid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  value			float8		DEFAULT '0.0000' NOT NULL
--  PRIMARY KEY (itemid,clock),
--  FOREIGN KEY (itemid) REFERENCES items
);

CREATE TABLE history_uint (
  itemid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  value			double precision	DEFAULT '0' NOT NULL
--  PRIMARY KEY (itemid,clock),
--  FOREIGN KEY (itemid) REFERENCES items
);

CREATE TABLE history_str (
  itemid                int4            DEFAULT '0' NOT NULL,
  clock                 int4            DEFAULT '0' NOT NULL,
  value                 varchar(255)    DEFAULT '' NOT NULL
--  PRIMARY KEY (itemid,clock),
--  FOREIGN KEY (itemid) REFERENCES items
);

CREATE TABLE items_template (
  itemtemplateid	int4		NOT NULL,
  description		varchar(255)	DEFAULT '' NOT NULL,
  key_			varchar(64)	DEFAULT '' NOT NULL,
  delay			int4		DEFAULT '0' NOT NULL,
  value_type		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (itemtemplateid)
);

CREATE TABLE triggers_template (
  triggertemplateid	int4		NOT NULL,
  itemtemplateid	int4		NOT NULL,
  description		varchar(255)	DEFAULT '' NOT NULL,
  expression		varchar(255)	DEFAULT '' NOT NULL,
  PRIMARY KEY (triggertemplateid),
  FOREIGN KEY (itemtemplateid) REFERENCES items_template
);

CREATE TABLE media (
  mediaid		serial,
  userid		int4		DEFAULT '0' NOT NULL,
--  type		varchar(10)	DEFAULT '' NOT NULL,
  mediatypeid		int4		DEFAULT '0' NOT NULL,
  sendto		varchar(100)	DEFAULT '' NOT NULL,
  active		int4		DEFAULT '0' NOT NULL,
  severity		int4		DEFAULT '63' NOT NULL,
  period		varchar(100)	DEFAULT '1-7,00:00-23:59' NOT NULL,
  PRIMARY KEY (mediaid)
--  FOREIGN KEY (userid) REFERENCES users,
--  FOREIGN KEY (mediatypeid) REFERENCES media_type
);

CREATE TABLE sysmaps (
  sysmapid		serial,
  name			varchar(128)	DEFAULT '' NOT NULL,
  width			int4		DEFAULT '0' NOT NULL,
  height		int4		DEFAULT '0' NOT NULL,
  background		varchar(64)	DEFAULT '' NOT NULL,
  label_type		int4		DEFAULT '0' NOT NULL,
  label_location	int2		DEFAULT '0' NOT NULL,
  PRIMARY KEY (sysmapid)
);

CREATE TABLE sysmaps_elements (
  selementid		serial,
  sysmapid		int4		DEFAULT '0' NOT NULL,
  elementid		int4		DEFAULT '0' NOT NULL,
  elementtype		int4		DEFAULT '0' NOT NULL,
  icon			varchar(32)	DEFAULT 'Server' NOT NULL,
  icon_on		varchar(32)	DEFAULT 'Server' NOT NULL,
  label			varchar(128)	DEFAULT '' NOT NULL,
  label_location	int2		DEFAULT NULL,
  x			int4		DEFAULT '0' NOT NULL,
  y			int4		DEFAULT '0' NOT NULL,
  url			varchar(255)	DEFAULT '' NOT NULL,
  PRIMARY KEY (shostid)
--  FOREIGN KEY (sysmapid) REFERENCES sysmaps,
--  FOREIGN KEY (hostid) REFERENCES hosts
);

CREATE TABLE sysmaps_links (
  linkid		serial,
  sysmapid		int4		DEFAULT '0' NOT NULL,
  selementid1		int4		DEFAULT '0' NOT NULL,
  selementid2		int4		DEFAULT '0' NOT NULL
-- may be NULL 
  triggerid		int4,
  drawtype_off		int4		DEFAULT '0' NOT NULL,
  color_off		varchar(32)	DEFAULT 'Black' NOT NULL,
  drawtype_on		int4		DEFAULT '0' NOT NULL,
  color_on		varchar(32)	DEFAULT 'Red' NOT NULL,
  PRIMARY KEY (linkid)
--  FOREIGN KEY (sysmapid) REFERENCES sysmaps,
--  FOREIGN KEY (shostid1) REFERENCES sysmaps_hosts,
--  FOREIGN KEY (shostid2) REFERENCES sysmaps_hosts
);

CREATE TABLE graphs (
  graphid		serial,
  name			varchar(128)	DEFAULT '' NOT NULL,
  width			int4		DEFAULT '0' NOT NULL,
  height		int4		DEFAULT '0' NOT NULL,
  yaxistype		int2		DEFAULT '0' NOT NULL,
  yaxismin		float8		DEFAULT '0' NOT NULL,
  yaxismax		float8		DEFAULT '0' NOT NULL,
  templateid		int4		DEFAULT '0' NOT NULL,
  show_work_period	int2		DEFAULT '1' NOT NULL,
  show_triggers		int2		DEFAULT '1' NOT NULL,
  PRIMARY KEY (graphid)
);

CREATE TABLE graphs_items (
  gitemid		serial,
  graphid		int4		DEFAULT '0' NOT NULL,
  itemid		int4		DEFAULT '0' NOT NULL,
  drawtype		int4		DEFAULT '0' NOT NULL,
  sortorder		int4		DEFAULT '0' NOT NULL,
  color			varchar(32)	DEFAULT 'Dark Green' NOT NULL,
  yaxisside		int2		DEFAULT '1' NOT NULL,
  PRIMARY KEY (gitemid)
--  FOREIGN KEY (graphid) REFERENCES graphs,
--  FOREIGN KEY (itemid) REFERENCES items
);

CREATE TABLE services (
  serviceid		serial,
  name			varchar(128)	DEFAULT '' NOT NULL,
  status		int2		DEFAULT '0' NOT NULL,
  algorithm		int2		DEFAULT '0' NOT NULL,
  triggerid		int4,
  showsla		int4		DEFAULT '0' NOT NULL,
  goodsla		float8		DEFAULT '99.9' NOT NULL,
  sortorder		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (serviceid)
);

CREATE TABLE services_links (
  linkid		serial,
  serviceupid		int4		DEFAULT '0' NOT NULL,
  servicedownid		int4		DEFAULT '0' NOT NULL,
  soft			int2		DEFAULT '0' NOT NULL,
  PRIMARY KEY (linkid)
);

CREATE TABLE rights (
  rightid               serial,
  userid                int4		DEFAULT '0' NOT NULL,
  name                  char(255)	DEFAULT '' NOT NULL,
  permission            char(1)		DEFAULT '' NOT NULL,
  id                    int4,
  PRIMARY KEY (rightid)
);

CREATE TABLE sessions (
	sessionid	varchar(32)	DEFAULT '' NOT NULL,
	userid		int4		DEFAULT '0' NOT NULL,
	lastaccess	int4		DEFAULT '0' NOT NULL,
	PRIMARY KEY (sessionid),
	FOREIGN KEY (userid) REFERENCES users
);

CREATE TABLE service_alarms (
  servicealarmid	serial,
  serviceid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  value			int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (servicealarmid)
);

CREATE TABLE profiles (
  profileid		serial,
  userid		int4		DEFAULT '0' NOT NULL,
  idx			varchar(64)	DEFAULT '' NOT NULL,
  value                 varchar(255)    DEFAULT '' NOT NULL,
  valuetype             int4            DEFAULT 0 NOT NULL,
  PRIMARY KEY (profileid)
);

CREATE TABLE screens (
  screenid		serial,
  name			varchar(255)	DEFAULT 'Screen' NOT NULL,
  hsize			int4		DEFAULT '1' NOT NULL,
  vsize			int4		DEFAULT '1' NOT NULL,
  PRIMARY KEY  (screenid)
);

CREATE TABLE screens_items (
	screenitemid	serial,
	screenid	int4		DEFAULT '0' NOT NULL,
	resourcetype	int4		DEFAULT '0' NOT NULL,
	resourceid	int4		DEFAULT '0' NOT NULL,
	width		int4		DEFAULT '320' NOT NULL,
	height		int4		DEFAULT '200' NOT NULL,
	x		int4		DEFAULT '0' NOT NULL,
	y		int4		DEFAULT '0' NOT NULL,
	colspan		int4		DEFAULT '0' NOT NULL,
	rowspan		int4		DEFAULT '0' NOT NULL,
	elements	int4		DEFAULT '25' NOT NULL,
	valign		int2		DEFAULT '0' NOT NULL,
	halign		int2		DEFAULT '0' NOT NULL,
	style		int4		DEFAULT '0' NOT NULL,
	url		varchar(255)	DEFAULT '' NOT NULL,
  PRIMARY KEY  (screenitemid)
);

CREATE TABLE stats (
--  itemid		int4		DEFAULT '0' NOT NULL,
--  year			int4		DEFAULT '0' NOT NULL,
--  month			int4		DEFAULT '0' NOT NULL,
--  day			int4		DEFAULT '0' NOT NULL,
--  hour			int4		DEFAULT '0' NOT NULL,
--  value_max		float8		DEFAULT '0.0000' NOT NULL,
--  value_min		float8		DEFAULT '0.0000' NOT NULL,
--  value_avg		float8		DEFAULT '0.0000' NOT NULL,
--  PRIMARY KEY (itemid,year,month,day,hour)
--);

CREATE TABLE usrgrp (
  usrgrpid		serial,
  name			varchar(64)	DEFAULT '' NOT NULL,
  PRIMARY KEY (usrgrpid)
);

CREATE TABLE users_groups (
  usrgrpid		int4		DEFAULT '0' NOT NULL,
  userid		int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (usrgrpid,userid)
--  FOREIGN KEY (usrgrpid) REFERENCES usrgrp,
--  FOREIGN KEY (userid) REFERENCES users
);

CREATE TABLE trends (
  itemid		int4		DEFAULT '0' NOT NULL,
  clock			int4		DEFAULT '0' NOT NULL,
  num			int2		DEFAULT '0' NOT NULL,
  value_min		float8		DEFAULT '0.0000' NOT NULL,
  value_avg		float8		DEFAULT '0.0000' NOT NULL,
  value_max		float8		DEFAULT '0.0000' NOT NULL,
  PRIMARY KEY (itemid,clock)
--  FOREIGN KEY (itemid) REFERENCES items
);

CREATE TABLE hosts_templates (
  hosttemplateid	serial,
  hostid		int4		DEFAULT '0' NOT NULL,
  templateid		int4		DEFAULT '0' NOT NULL,
  items			int2		DEFAULT '0' NOT NULL,
  triggers		int2		DEFAULT '0' NOT NULL,
  graphs		int2		DEFAULT '0' NOT NULL,
  PRIMARY KEY (hosttemplateid)
);

CREATE TABLE history_log (
  id			serial,
  itemid                int4            DEFAULT '0' NOT NULL,
  clock                 int4            DEFAULT '0' NOT NULL,
  timestamp		int4		DEFAULT '0' NOT NULL,
  source		varchar(64)	DEFAULT '' NOT NULL,
  severity		int4		DEFAULT '0' NOT NULL,
  value                 varchar(255)    DEFAULT '' NOT NULL,
  PRIMARY KEY (id)
--  FOREIGN KEY (itemid) REFERENCES items
);

CREATE TABLE autoreg (
  id                    serial,
  priority              int4		DEFAULT '0' NOT NULL,
  pattern               varchar(255)	DEFAULT '' NOT NULL,
  hostid                int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE valuemaps (
  valuemapid		serial,
  name			varchar(64)	DEFAULT '' NOT NULL,
  PRIMARY KEY (valuemapid)
);

CREATE TABLE mappings (
  mappingid		serial,
  valuemapid		int4		DEFAULT '0' NOT NULL,
  value			varchar(64)	DEFAULT '' NOT NULL,
  newvalue		varchar(64)	DEFAULT '' NOT NULL,
  PRIMARY KEY (mappingid)
);

CREATE TABLE housekeeper (
  housekeeperid		serial,
  tablename		varchar(64)	DEFAULT '' NOT NULL,
  field			varchar(64)	DEFAULT '' NOT NULL,
  value			int4		DEFAULT '0' NOT NULL,
  PRIMARY KEY (housekeeperid)
);

CREATE TABLE acknowledges (
	acknowledgeid		serial,
	userid			int4		DEFAULT '0' NOT NULL,
	alarmid			int4		DEFAULT '0' NOT NULL,
	clock			int4		DEFAULT '0' NOT NULL,
	message			varchar(255)	DEFAULT '' NOT NULL,
	PRIMARY KEY (acknowledgeid)
--	FOREIGN KEY (alarmid) REFERENCES alarms,
--	FOREIGN KEY (userid) REFERENCES users
);

CREATE TABLE applications (
        applicationid           serial,
        hostid                  int4            DEFAULT '0' NOT NULL,
        name                    varchar(255)    DEFAULT '' NOT NULL,
	templateid		int4		DEFAULT '0' NOT NULL,
        PRIMARY KEY (applicationid)
--        FOREIGN KEY hostid (hostid) REFERENCES hosts
);

CREATE TABLE items_applications (
        applicationid           int4          DEFAULT '0' NOT NULL,
        itemid                  int4          DEFAULT '0' NOT NULL,
        PRIMARY KEY (applicationid,itemid)
--        FOREIGN KEY (applicationid) REFERENCES applications,
 --       FOREIGN KEY (itemid) REFERENCES items
);

CREATE TABLE help_items (
	itemtype	int4		DEFAULT '0' NOT NULL,
	key_		varchar(64)	DEFAULT '' NOT NULL,
	description	varchar(255)	DEFAULT '' NOT NULL,
	PRIMARY KEY	(itemtype, key_)
);

