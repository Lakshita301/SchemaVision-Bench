-- Source: https://github.com/kdimolikas/WebParmenidianTruth/blob/5af6174287f48663e3b7156fe90a3beeb61b783a/resources/projects/Zabbix/rev_1.096.sql?raw=true
-- Tables detected: 39 | FK/REFERENCES mentions: 50
-- lastdelete is no longer required
--  lastdelete		int4		DEFAULT '0' NOT NULL,
--  smtp_server		varchar(255)	DEFAULT '' NOT NULL,
--  smtp_helo		varchar(255)	DEFAULT '' NOT NULL,
--  smtp_email		varchar(255)	DEFAULT '' NOT NULL,
--  password_required	int4		DEFAULT '0' NOT NULL,
--  depends on scope. Could be hostid or 0.
--  FOREIGN KEY (triggerid) REFERENCES triggers (triggerid)
--  could be groupid
--  FOREIGN KEY (userid) REFERENCES users (userid)
--  type		varchar(10)	DEFAULT '' NOT NULL,
--  PRIMARY KEY (itemid,clock),
--  PRIMARY KEY (itemid,clock),
--  type		varchar(10)	DEFAULT '' NOT NULL,
-- may be NULL 
CREATE TABLE hosts (
    hostid serial,
    host varchar(64)	DEFAULT '' 		NOT NULL,
    useip int4		DEFAULT '0'		NOT NULL,
    ip varchar(15)	DEFAULT '127.0.0.1'	NOT NULL,
    port int4		DEFAULT '0'		NOT NULL,
    status int4		DEFAULT '0'		NOT NULL,
    disable_until int4		DEFAULT '0'		NOT NULL,
    network_errors int4		DEFAULT '0'		NOT NULL,
    error varchar(128)	DEFAULT ''		NOT NULL,
    available int4		DEFAULT '0'		NOT NULL,
    PRIMARY KEY (hostid)
);

CREATE TABLE items (
    itemid serial,
    type int4		NOT NULL,
    snmp_community varchar(64)	DEFAULT ''	NOT NULL,
    snmp_oid varchar(255)	DEFAULT ''	NOT NULL,
    snmp_port int4		DEFAULT '161'	NOT NULL,
    hostid int4		NOT NULL,
    description varchar(255)	DEFAULT '' NOT NULL,
    key_ varchar(64)	DEFAULT '' NOT NULL,
    delay int4		DEFAULT '0' NOT NULL,
    history int4		DEFAULT '90' NOT NULL,
    trends int4		DEFAULT '365' NOT NULL,
    nextcheck int4		DEFAULT '0' NOT NULL,
    lastvalue varchar(255)	DEFAULT NULL,
    lastclock int4		DEFAULT NULL,
    prevvalue varchar(255)	DEFAULT NULL,
    status int4		DEFAULT '0' NOT NULL,
    value_type int4		DEFAULT '0' NOT NULL,
    trapper_hosts varchar(255)	DEFAULT '' NOT NULL,
    units varchar(10)	DEFAULT '' NOT NULL,
    multiplier int4		DEFAULT '0' NOT NULL,
    delta int4		DEFAULT '0' NOT NULL,
    prevorgvalue float8		DEFAULT NULL,
    snmpv3_securityname varchar(64)	DEFAULT '' NOT NULL,
    snmpv3_securitylevel int4		DEFAULT '0' NOT NULL,
    snmpv3_authpassphrase varchar(64)	DEFAULT '' NOT NULL,
    snmpv3_privpassphrase varchar(64)	DEFAULT '' NOT NULL,
    formula varchar(255)	DEFAULT '{.last(0)}' NOT NULL,
    error varchar(128)	DEFAULT '' NOT NULL,
    lastlogsize int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (itemid),
    FOREIGN KEY (hostid) REFERENCES hosts (hostid)
);

CREATE TABLE config (
    alert_history int4		DEFAULT '0' NOT NULL,
    alarm_history int4		DEFAULT '0' NOT NULL
);

CREATE TABLE groups (
    groupid serial,
    name varchar(64)     DEFAULT '' NOT NULL,
    PRIMARY KEY (groupid),
    UNIQUE (name)
);

CREATE TABLE hosts_groups (
    hostid int4		DEFAULT '0' NOT NULL,
    groupid int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (hostid,groupid)
);

CREATE TABLE triggers (
    triggerid serial,
    expression varchar(255)	DEFAULT '' NOT NULL,
    description varchar(255)	DEFAULT '' NOT NULL,
    url varchar(255)	DEFAULT '' NOT NULL,
    status int4		DEFAULT '0' NOT NULL,
    value int4		DEFAULT '0' NOT NULL,
    priority int2		DEFAULT '0' NOT NULL,
    lastchange int4		DEFAULT '0' NOT NULL,
    dep_level int2		DEFAULT '0' NOT NULL,
    comments text,
    PRIMARY KEY (triggerid)
);

CREATE TABLE trigger_depends (
    triggerid_down int4	DEFAULT '0' NOT NULL,
    triggerid_up int4	DEFAULT '0' NOT NULL,
    PRIMARY KEY		(triggerid_down, triggerid_up)
);

CREATE TABLE users (
    userid serial,
    alias varchar(100)	DEFAULT '' NOT NULL,
    name varchar(100)	DEFAULT '' NOT NULL,
    surname varchar(100)	DEFAULT '' NOT NULL,
    passwd char(32)	DEFAULT '' NOT NULL,
    url varchar(255)	DEFAULT '' NOT NULL,
    PRIMARY KEY (userid)
);

CREATE TABLE audit (
    auditid serial,
    userid int4		DEFAULT '0' NOT NULL,
    clock int4		DEFAULT '0' NOT NULL,
    action int4		DEFAULT '0' NOT NULL,
    resource int4		DEFAULT '0' NOT NULL,
    details varchar(128)	DEFAULT '0' NOT NULL,
    PRIMARY KEY (auditid)
);

CREATE TABLE actions (
    actionid serial,
    triggerid int4		DEFAULT '0' NOT NULL,
    userid int4		DEFAULT '0' NOT NULL,
    scope int4		DEFAULT '0' NOT NULL,
    severity int4		DEFAULT '0' NOT NULL,
    good int4		DEFAULT '0' NOT NULL,
    delay int4		DEFAULT '0' NOT NULL,
    subject varchar(255)	DEFAULT '' NOT NULL,
    message text		DEFAULT '' NOT NULL,
    nextcheck int4		DEFAULT '0' NOT NULL,
    recipient int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (actionid)
);

CREATE TABLE media_type (
    mediatypeid serial,
    type int4		DEFAULT '0' NOT NULL,
    description varchar(100)	DEFAULT '' NOT NULL,
    smtp_server varchar(255)	DEFAULT '' NOT NULL,
    smtp_helo varchar(255)	DEFAULT '' NOT NULL,
    smtp_email varchar(255)	DEFAULT '' NOT NULL,
    exec_path varchar(255)	DEFAULT '' NOT NULL,
    PRIMARY KEY(mediatypeid)
);

CREATE TABLE alerts (
    alertid serial,
    actionid int4		DEFAULT '0' NOT NULL,
    clock int4		DEFAULT '0' NOT NULL,
    mediatypeid int4		DEFAULT '0' NOT NULL,
    sendto varchar(100)	DEFAULT '' NOT NULL,
    subject varchar(255)	DEFAULT '' NOT NULL,
    message text		DEFAULT '' NOT NULL,
    status int4		DEFAULT '0' NOT NULL,
    retries int4		DEFAULT '0' NOT NULL,
    error varchar(128)	DEFAULT '' NOT NULL,
    PRIMARY KEY (alertid),
    FOREIGN KEY (actionid) REFERENCES actions (actionid),
    FOREIGN KEY (mediatypeid) REFERENCES media_type (mediatypeid)
);

CREATE TABLE alarms (
    alarmid serial,
    triggerid int4		DEFAULT '0' NOT NULL,
    clock int4		DEFAULT '0' NOT NULL,
    istrue int4		DEFAULT '0' NOT NULL,
    value int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (alarmid),
    FOREIGN KEY (triggerid) REFERENCES triggers (triggerid)
);

CREATE TABLE functions (
    functionid serial,
    itemid int4		DEFAULT '0' NOT NULL,
    triggerid int4		DEFAULT '0' NOT NULL,
    lastvalue varchar(255),
    function varchar(10)	DEFAULT '' NOT NULL,
    parameter varchar(255)	DEFAULT '0' NOT NULL,
    PRIMARY KEY (functionid),
    FOREIGN KEY (itemid) REFERENCES items (itemid),
    FOREIGN KEY (triggerid) REFERENCES triggers (triggerid)
);

CREATE TABLE history (
    itemid int4		DEFAULT '0' NOT NULL,
    clock int4		DEFAULT '0' NOT NULL,
    value float8		DEFAULT '0.0000' NOT NULL,
    FOREIGN KEY (itemid) REFERENCES items (itemid)
);

CREATE TABLE history_str (
    itemid int4            DEFAULT '0' NOT NULL,
    clock int4            DEFAULT '0' NOT NULL,
    value varchar(255)    DEFAULT '' NOT NULL,
    FOREIGN KEY (itemid) REFERENCES items (itemid)
);

CREATE TABLE items_template (
    itemtemplateid int4		NOT NULL,
    description varchar(255)	DEFAULT '' NOT NULL,
    key_ varchar(64)	DEFAULT '' NOT NULL,
    delay int4		DEFAULT '0' NOT NULL,
    value_type int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (itemtemplateid)
);

CREATE TABLE triggers_template (
    triggertemplateid int4		NOT NULL,
    itemtemplateid int4		NOT NULL,
    description varchar(255)	DEFAULT '' NOT NULL,
    expression varchar(255)	DEFAULT '' NOT NULL,
    PRIMARY KEY (triggertemplateid),
    FOREIGN KEY (itemtemplateid) REFERENCES items_template (itemtemplateid)
);

CREATE TABLE media (
    mediaid serial,
    userid int4		DEFAULT '0' NOT NULL,
    mediatypeid int4		DEFAULT '0' NOT NULL,
    sendto varchar(100)	DEFAULT '' NOT NULL,
    active int4		DEFAULT '0' NOT NULL,
    severity int4		DEFAULT '63' NOT NULL,
    period varchar(100)	DEFAULT '1-7,00:00-23:59' NOT NULL,
    PRIMARY KEY (mediaid),
    FOREIGN KEY (userid) REFERENCES users (userid),
    FOREIGN KEY (mediatypeid) REFERENCES media_type (mediatypeid)
);

CREATE TABLE sysmaps (
    sysmapid serial,
    name varchar(128)	DEFAULT '' NOT NULL,
    width int4		DEFAULT '0' NOT NULL,
    height int4		DEFAULT '0' NOT NULL,
    background varchar(64)	DEFAULT '' NOT NULL,
    label_type int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (sysmapid)
);

CREATE TABLE sysmaps_hosts (
    shostid serial,
    sysmapid int4		DEFAULT '0' NOT NULL,
    hostid int4		DEFAULT '0' NOT NULL,
    icon varchar(32)	DEFAULT 'Server' NOT NULL,
    icon_on varchar(32)	DEFAULT 'Server' NOT NULL,
    label varchar(128)	DEFAULT '' NOT NULL,
    x int4		DEFAULT '0' NOT NULL,
    y int4		DEFAULT '0' NOT NULL,
    url varchar(255)	DEFAULT '' NOT NULL,
    PRIMARY KEY (shostid),
    FOREIGN KEY (sysmapid) REFERENCES sysmaps (sysmapid),
    FOREIGN KEY (hostid) REFERENCES hosts (hostid)
);

CREATE TABLE sysmaps_links (
    linkid serial,
    sysmapid int4		DEFAULT '0' NOT NULL,
    shostid1 int4		DEFAULT '0' NOT NULL,
    shostid2 int4		DEFAULT '0' NOT NULL,
    triggerid int4,
    drawtype_off int4		DEFAULT '0' NOT NULL,
    color_off varchar(32)	DEFAULT 'Black' NOT NULL,
    drawtype_on int4		DEFAULT '0' NOT NULL,
    color_on varchar(32)	DEFAULT 'Red' NOT NULL,
    PRIMARY KEY (linkid),
    FOREIGN KEY (sysmapid) REFERENCES sysmaps (sysmapid),
    FOREIGN KEY (shostid1) REFERENCES sysmaps_hosts (shostid1),
    FOREIGN KEY (shostid2) REFERENCES sysmaps_hosts (shostid2)
);

CREATE TABLE graphs (
    graphid serial,
    name varchar(128)	DEFAULT '' NOT NULL,
    width int4		DEFAULT '0' NOT NULL,
    height int4		DEFAULT '0' NOT NULL,
    yaxistype int2		DEFAULT '0' NOT NULL,
    yaxismin float8		DEFAULT '0' NOT NULL,
    yaxismax float8		DEFAULT '0' NOT NULL,
    PRIMARY KEY (graphid),
    UNIQUE (name)
);

CREATE TABLE graphs_items (
    gitemid serial,
    graphid int4		DEFAULT '0' NOT NULL,
    itemid int4		DEFAULT '0' NOT NULL,
    drawtype int4		DEFAULT '0' NOT NULL,
    sortorder int4		DEFAULT '0' NOT NULL,
    color varchar(32)	DEFAULT 'Dark Green' NOT NULL,
    PRIMARY KEY (gitemid),
    FOREIGN KEY (graphid) REFERENCES graphs (graphid),
    FOREIGN KEY (itemid) REFERENCES items (itemid)
);

CREATE TABLE services (
    serviceid serial,
    name varchar(128)	DEFAULT '' NOT NULL,
    status int2		DEFAULT '0' NOT NULL,
    algorithm int2		DEFAULT '0' NOT NULL,
    triggerid int4,
    showsla int4		DEFAULT '0' NOT NULL,
    goodsla float8		DEFAULT '99.9' NOT NULL,
    sortorder int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (serviceid)
);

CREATE TABLE services_links (
    linkid serial,
    serviceupid int4		DEFAULT '0' NOT NULL,
    servicedownid int4		DEFAULT '0' NOT NULL,
    soft int2		DEFAULT '0' NOT NULL,
    PRIMARY KEY (linkid)
);

CREATE TABLE rights (
    rightid serial,
    userid int4		DEFAULT '0' NOT NULL,
    name char(255)	DEFAULT '' NOT NULL,
    permission char(1)		DEFAULT '' NOT NULL,
    id int4,
    PRIMARY KEY (rightid)
);

CREATE TABLE sessions (
    sessionid varchar(32)	DEFAULT '' NOT NULL,
    userid int4		DEFAULT '0' NOT NULL,
    lastaccess int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (sessionid),
    FOREIGN KEY (userid) REFERENCES users (userid)
);

CREATE TABLE service_alarms (
    servicealarmid serial,
    serviceid int4		DEFAULT '0' NOT NULL,
    clock int4		DEFAULT '0' NOT NULL,
    value int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (servicealarmid)
);

CREATE TABLE profiles (
    profileid serial,
    userid int4		DEFAULT '0' NOT NULL,
    idx varchar(64)	DEFAULT '' NOT NULL,
    value varchar(64)	DEFAULT '' NOT NULL,
    PRIMARY KEY (profileid)
);

CREATE TABLE screens (
    screenid serial,
    name varchar(255)	DEFAULT 'Screen' NOT NULL,
    cols int4		DEFAULT '1' NOT NULL,
    rows int4		DEFAULT '1' NOT NULL,
    PRIMARY KEY  (screenid)
);

CREATE TABLE screens_items (
    screenitemid serial,
    screenid int4		DEFAULT '0' NOT NULL,
    resource int4		DEFAULT '0' NOT NULL,
    resourceid int4		DEFAULT '0' NOT NULL,
    width int4		DEFAULT '320' NOT NULL,
    height int4		DEFAULT '200' NOT NULL,
    x int4		DEFAULT '0' NOT NULL,
    y int4		DEFAULT '0' NOT NULL,
    colspan int4		DEFAULT '0' NOT NULL,
    rowspan int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY  (screenitemid)
);

CREATE TABLE stats (
    itemid int4		DEFAULT '0' NOT NULL,
    year int4		DEFAULT '0' NOT NULL,
    month int4		DEFAULT '0' NOT NULL,
    day int4		DEFAULT '0' NOT NULL,
    hour int4		DEFAULT '0' NOT NULL,
    value_max float8		DEFAULT '0.0000' NOT NULL,
    value_min float8		DEFAULT '0.0000' NOT NULL,
    value_avg float8		DEFAULT '0.0000' NOT NULL,
    PRIMARY KEY (itemid,year,month,day,hour)
);

CREATE TABLE usrgrp (
    usrgrpid serial,
    name varchar(64)	DEFAULT '' NOT NULL,
    PRIMARY KEY (usrgrpid)
);

CREATE TABLE users_groups (
    usrgrpid int4		DEFAULT '0' NOT NULL,
    userid int4		DEFAULT '0' NOT NULL,
    PRIMARY KEY (usrgrpid,userid),
    FOREIGN KEY (usrgrpid) REFERENCES usrgrp (usrgrpid),
    FOREIGN KEY (userid) REFERENCES users (userid)
);

CREATE TABLE trends (
    itemid int4		DEFAULT '0' NOT NULL,
    clock int4		DEFAULT '0' NOT NULL,
    num int2		DEFAULT '0' NOT NULL,
    value_min float8		DEFAULT '0.0000' NOT NULL,
    value_avg float8		DEFAULT '0.0000' NOT NULL,
    value_max float8		DEFAULT '0.0000' NOT NULL,
    PRIMARY KEY (itemid,clock),
    FOREIGN KEY (itemid) REFERENCES items (itemid)
);

CREATE TABLE escalations (
    escalationid serial,
    name varchar(64)	DEFAULT '0' NOT NULL,
    PRIMARY KEY (escalationid)
);

CREATE TABLE hosts_templates (
    hosttemplateid serial,
    hostid int4		DEFAULT '0' NOT NULL,
    templateid int4		DEFAULT '0' NOT NULL,
    items int2		DEFAULT '0' NOT NULL,
    triggers int2		DEFAULT '0' NOT NULL,
    actions int2		DEFAULT '0' NOT NULL,
    graphs int2		DEFAULT '0' NOT NULL,
    screens int2		DEFAULT '0' NOT NULL,
    PRIMARY KEY (hosttemplateid)
);

CREATE TABLE history_log (
    id serial,
    itemid int4            DEFAULT '0' NOT NULL,
    clock int4            DEFAULT '0' NOT NULL,
    value varchar(255)    DEFAULT '' NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (itemid) REFERENCES items (itemid)
);
