-- Source: https://github.com/alibaba/AliSQLBackup/blob/26573de135d115b100dbbfb9698274463ade5c8d/mysql-test/include/subquery.inc?raw=true
-- Tables detected: 453 | FK/REFERENCES mentions: 2

create table t1 (a int);

create table t2 (a int, b int);

create table t3 (a int);

create table t4 (a int not null, b int not null);

create table t5 (a int);

create table t6 (patient_uq int, clinic_uq int, index i1 (clinic_uq));

create table t7( uq int primary key, name char(25));

CREATE TABLE t3 (a varchar(20),b char(1) NOT NULL default '0');

CREATE TABLE t2 (a varchar(20),b int NOT NULL default '0');

CREATE TABLE t1 (a varchar(20),b date NOT NULL default '0000-00-00');

CREATE TABLE `t8` (
  `pseudo` varchar(35) character set latin1 NOT NULL default '',
  `email` varchar(60) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`pseudo`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `t1` (
  `topic` mediumint(8) unsigned NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `pseudo` varchar(35) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`pseudo`,`date`,`topic`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM ROW_FORMAT=DYNAMIC;

CREATE TABLE `t1` (
  `numeropost` mediumint(8) unsigned NOT NULL auto_increment,
  `maxnumrep` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`numeropost`),
  UNIQUE KEY `maxnumrep` (`maxnumrep`)
) ENGINE=MyISAM ROW_FORMAT=FIXED;

CREATE TABLE `t2` (
      `mot` varchar(30) NOT NULL default '',
      `topic` mediumint(8) unsigned NOT NULL default '0',
      `date` date NOT NULL default '0000-00-00',
      `pseudo` varchar(35) NOT NULL default '',
       PRIMARY KEY  (`mot`,`pseudo`,`date`,`topic`)
    ) ENGINE=MyISAM ROW_FORMAT=DYNAMIC;

CREATE TABLE `t1` (
  `numeropost` mediumint(8) unsigned NOT NULL auto_increment,
  `maxnumrep` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`numeropost`),
  UNIQUE KEY `maxnumrep` (`maxnumrep`)
) ENGINE=MyISAM ROW_FORMAT=FIXED;

create table t1 (a int);

CREATE TABLE t1 (field char(1) NOT NULL DEFAULT 'b');

CREATE TABLE `t1` (
  `numeropost` mediumint(8) unsigned NOT NULL default '0',
  `numreponse` int(10) unsigned NOT NULL auto_increment,
  `pseudo` varchar(35) NOT NULL default '',
  PRIMARY KEY  (`numeropost`,`numreponse`),
  UNIQUE KEY `numreponse` (`numreponse`),
  KEY `pseudo` (`pseudo`,`numeropost`)
) ENGINE=MyISAM;

CREATE TABLE t1 (a int(1));

create table t1 (a int NOT NULL, b int, primary key (a));

create table t2 (a int NOT NULL, b int, primary key (a));

create table t1 (a int NOT NULL, b int, primary key (a));

create table t2 (a int NOT NULL, b int, primary key (a));

create table t11 (a int NOT NULL, b int, primary key (a));

create table t12 (a int NOT NULL, b int, primary key (a));

create table t2 (a int NOT NULL, b int, primary key (a));

CREATE TABLE t1 (x int);

create table t2 (a int);

create table t3 (b int);

CREATE TABLE t1 (x int not null, y int, primary key (x));

create table t2 (a int);

create table t3 (a int);

CREATE TABLE t2 (id int(11) default NULL, KEY id (id)) ENGINE=MyISAM CHARSET=latin1;

CREATE TABLE t1 (id int(11) default NULL, KEY id (id)) ENGINE=MyISAM CHARSET=latin1;

create table t1 (a int);

create table t1 (a varchar(20));

create table t1 (a float);

CREATE TABLE t1 (a int(11) NOT NULL default '0', PRIMARY KEY  (a));

CREATE TABLE t2 (a int(11) default '0', INDEX (a));

CREATE TABLE t3 (a int(11) default '0');

create table t1 (a float);

create table t1 (a int, b int, c varchar(10));

create table t2 (a int);

create table t1 (a int, b real, c varchar(10));

create table t1 (a int);

CREATE TABLE t1 (a int, KEY(a));

create table t1 (a int);

create table t2 (b int);

create table t1 (a int, b int);

create table t2 like t1;

CREATE TABLE `t1` (`i` int(11) NOT NULL default '0',PRIMARY KEY  (`i`)) ENGINE=MyISAM CHARSET=latin1;

CREATE TABLE t1 (a int(1));

CREATE TABLE `t1` (
  `mot` varchar(30) character set latin1 NOT NULL default '',
  `topic` mediumint(8) unsigned NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `pseudo` varchar(35) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`mot`,`pseudo`,`date`,`topic`),
  KEY `pseudo` (`pseudo`,`date`,`topic`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `t2` (
  `mot` varchar(30) character set latin1 NOT NULL default '',
  `topic` mediumint(8) unsigned NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `pseudo` varchar(35) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`mot`,`pseudo`,`date`,`topic`),
  KEY `pseudo` (`pseudo`,`date`,`topic`),
  KEY `topic` (`topic`)
) ENGINE=MyISAM CHARSET=latin1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `t3` (
  `numeropost` mediumint(8) unsigned NOT NULL auto_increment,
  `maxnumrep` int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (`numeropost`),
  UNIQUE KEY `maxnumrep` (`maxnumrep`)
) ENGINE=MyISAM CHARSET=latin1;

CREATE TABLE t1 SELECT * FROM (SELECT 1 as a,(SELECT 1)) a;

CREATE TABLE t1;

CREATE TABLE t1 SELECT * FROM (SELECT 1 as a,(SELECT a)) a;

CREATE TABLE t1;

CREATE TABLE t1 SELECT * FROM (SELECT 1 as a,(SELECT a+0)) a;

CREATE TABLE t1;

CREATE TABLE t1 SELECT (SELECT 1 as a UNION SELECT 1+1 limit 1,1) as a;

CREATE TABLE t1;

create table t1 (a int);

CREATE TABLE t1 (
  ID int(11) NOT NULL auto_increment,
  name char(35) NOT NULL default '',
  t2 char(3) NOT NULL default '',
  District char(20) NOT NULL default '',
  Population int(11) NOT NULL default '0',
  PRIMARY KEY  (ID)
) ENGINE=MyISAM;

CREATE TABLE t2 (
  Code char(3) NOT NULL default '',
  Name char(52) NOT NULL default '',
  Continent enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL default 'Asia',
  Region char(26) NOT NULL default '',
  SurfaceArea float(10,2) NOT NULL default '0.00',
  IndepYear smallint(6) default NULL,
  Population int(11) NOT NULL default '0',
  LifeExpectancy float(3,1) default NULL,
  GNP float(10,2) default NULL,
  GNPOld float(10,2) default NULL,
  LocalName char(45) NOT NULL default '',
  GovernmentForm char(45) NOT NULL default '',
  HeadOfState char(60) default NULL,
  Capital int(11) default NULL,
  Code2 char(2) NOT NULL default '',
  PRIMARY KEY  (Code)
) ENGINE=MyISAM;

CREATE TABLE `t1` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `pseudo` varchar(35) character set latin1 NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=MyISAM PACK_KEYS=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `t1` (
  `i` int(11) NOT NULL default '0',
  PRIMARY KEY  (`i`)
) ENGINE=MyISAM CHARSET=latin1;

CREATE TABLE t1 (
  id int(11) default NULL
) ENGINE=MyISAM CHARSET=latin1;

CREATE TABLE t2 (
  id int(11) default NULL,
  name varchar(15) default NULL
) ENGINE=MyISAM CHARSET=latin1;

create table t1 (a int, unique index indexa (a));

create table t1 (id int not null auto_increment primary key, salary int, key(salary));

CREATE TABLE t1 (
  ID int(10) unsigned NOT NULL auto_increment,
  SUB_ID int(3) unsigned NOT NULL default '0',
  REF_ID int(10) unsigned default NULL,
  REF_SUB int(3) unsigned default '0',
  PRIMARY KEY (ID,SUB_ID),
  UNIQUE KEY t1_PK (ID,SUB_ID),
  KEY t1_FK (REF_ID,REF_SUB),
  KEY t1_REFID (REF_ID)
) ENGINE=MyISAM CHARSET=cp1251;

create table t1 (a int, b int);

create table t2 (a int, b int);

CREATE TABLE `t1` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `pseudo` varchar(35) NOT NULL default '',
  `email` varchar(60) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `pseudo` (`pseudo`)
) ENGINE=MyISAM CHARSET=latin1 PACK_KEYS=1 ROW_FORMAT=DYNAMIC;

create table t1 (a int, b int);

create table t2 (a int, b int);

create table t3 (a int, b int);

create table t1 (s1 int);

create table t2 (s1 int);

create table t1 (s1 int);

create table t2 (s1 int);

CREATE TABLE t1 (s1 CHAR(5) COLLATE latin1_german1_ci,
                 s2 CHAR(5) COLLATE latin1_swedish_ci);

create table t1(toid int,rd int);

create table t2(userid int,pmnew int,pmtotal int);

create table t1 (s1 char(5));

create table t1 (s1 char(5), index s1(s1));

create table t2 (s1 char(5), index s1(s1));

create table t2 (a int, b int);

create table t3 (a int);

CREATE TABLE `t1` ( `id` mediumint(9) NOT NULL auto_increment, `taskid` bigint(20) NOT NULL default '0', `dbid` int(11) NOT NULL default '0', `create_date` datetime NOT NULL default '0000-00-00 00:00:00', `last_update` datetime NOT NULL default '0000-00-00 00:00:00', PRIMARY KEY  (`id`)) ENGINE=MyISAM CHARSET=latin1 AUTO_INCREMENT=3 ;

CREATE TABLE `t2` (`db_id` int(11) NOT NULL auto_increment,`name` varchar(200) NOT NULL default '',`primary_uid` smallint(6) NOT NULL default '0',`secondary_uid` smallint(6) NOT NULL default '0',PRIMARY KEY  (`db_id`),UNIQUE KEY `name_2` (`name`),FULLTEXT KEY `name` (`name`)) ENGINE=MyISAM CHARSET=latin1 AUTO_INCREMENT=2147483647;

CREATE TABLE `t3` (`taskgenid` mediumint(9) NOT NULL auto_increment,`dbid` int(11) NOT NULL default '0',`taskid` int(11) NOT NULL default '0',`mon` tinyint(4) NOT NULL default '1',`tues` tinyint(4) NOT NULL default '1',`wed` tinyint(4) NOT NULL default '1',`thur` tinyint(4) NOT NULL default '1',`fri` tinyint(4) NOT NULL default '1',`sat` tinyint(4) NOT NULL default '0',`sun` tinyint(4) NOT NULL default '0',`how_often` smallint(6) NOT NULL default '1',`userid` smallint(6) NOT NULL default '0',`active` tinyint(4) NOT NULL default '1',PRIMARY KEY  (`taskgenid`)) ENGINE=MyISAM CHARSET=latin1 AUTO_INCREMENT=2 ;

CREATE TABLE `t4` (`task_id` smallint(6) NOT NULL default '0',`description` varchar(200) NOT NULL default '') ENGINE=MyISAM CHARSET=latin1;

CREATE TABLE t1 (id int(11) default NULL) ENGINE=MyISAM CHARSET=latin1;

CREATE TABLE t2 (id int(11) default NULL) ENGINE=MyISAM CHARSET=latin1;

create table t1 (s1 int);

create table t1 (s1 char);

CREATE TABLE t1 (number char(11) NOT NULL default '') ENGINE=MyISAM CHARSET=latin1;

CREATE TABLE t2 (code char(5) NOT NULL default '',UNIQUE KEY code (code)) ENGINE=MyISAM CHARSET=latin1;

create table t1 (s1 int);

create table t2 (s1 int);

CREATE TABLE t1(COLA FLOAT NOT NULL,COLB FLOAT NOT NULL,COLC VARCHAR(20) DEFAULT NULL,PRIMARY KEY (COLA, COLB));

CREATE TABLE t2(COLA FLOAT NOT NULL,COLB FLOAT NOT NULL,COLC CHAR(1) NOT NULL,PRIMARY KEY (COLA));

CREATE TABLE t1 (a int(1));

create table t1 (a int, b decimal(13, 3));

CREATE TABLE `t1` (
  `id` int(11) NOT NULL auto_increment,
  `id_cns` tinyint(3) unsigned NOT NULL default '0',
  `tipo` enum('','UNO','DUE') NOT NULL default '',
  `anno_dep` smallint(4) unsigned zerofill NOT NULL default '0000',
  `particolare` mediumint(8) unsigned NOT NULL default '0',
  `generale` mediumint(8) unsigned NOT NULL default '0',
  `bis` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `idx_cns_gen_anno` (`anno_dep`,`id_cns`,`generale`,`particolare`),
  UNIQUE KEY `idx_cns_par_anno` (`id_cns`,`anno_dep`,`tipo`,`particolare`,`bis`)
);

CREATE TABLE `t2` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `max_anno_dep` smallint(6) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`)
);

create table t1 (a int);

CREATE TABLE t1 (a int, b int, INDEX (a));

create table t1(val varchar(10));

create table t1 (id int not null, text varchar(20) not null default '', primary key (id));

create table t2 (id int not null, text varchar(20) not null default '', primary key (id));

create table t1 (a int);

create table t1(id int);

create table t2(id int);

create table t3(flag int);

CREATE TABLE t1 (id INT);

CREATE TABLE t2 (id INT);

CREATE TABLE t1 ( a int, b int );

CREATE TABLE t1 ( a double, b double );

CREATE TABLE t1 ( a char(1), b char(1));

create table t1 (a int, b int);

CREATE TABLE t1 (t1_a int);

CREATE TABLE t2 (t2_a int, t2_b int, PRIMARY KEY (t2_a, t2_b));

CREATE TABLE t1 (id int(11) default NULL,name varchar(10) default NULL);

CREATE TABLE t2 (id int(11) default NULL, pet varchar(10) default NULL);

CREATE TABLE t1 ( a int, b int );

CREATE TABLE t2 ( c int, d int );

CREATE TABLE t3 SELECT a AS abc, b FROM t1 outr WHERE b =
  (SELECT MIN(b) FROM t1 WHERE a=outr.a);

CREATE TABLE t3 SELECT a AS abc, b FROM t1 outr WHERE b = (SELECT MIN(b) FROM t1 WHERE a=outr.a);

CREATE TABLE `t1` ( `a` int(11) default NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1;

CREATE TABLE `t2` ( `b` int(11) default NULL, `a` int(11) default NULL) ENGINE=MyISAM DEFAULT CHARSET=latin1;

create table t1 (a int not null auto_increment primary key, b varchar(40), fulltext(b));

create table t2 (a int);

CREATE TABLE t1(`IZAVORGANG_ID` VARCHAR(11) CHARACTER SET latin1 COLLATE latin1_bin,`KUERZEL` VARCHAR(10) CHARACTER SET latin1 COLLATE latin1_bin,`IZAANALYSEART_ID` VARCHAR(11) CHARACTER SET latin1 COLLATE latin1_bin,`IZAPMKZ_ID` VARCHAR(11) CHARACTER SET latin1 COLLATE latin1_bin);

CREATE TABLE `t1` ( `aid` int(11) NOT NULL default '0', `bid` int(11) NOT NULL default '0', PRIMARY KEY  (`aid`,`bid`));

CREATE TABLE `t2` ( `aid` int(11) NOT NULL default '0', `bid` int(11) NOT NULL default '0', PRIMARY KEY  (`aid`,`bid`));

CREATE TABLE t1 (howmanyvalues bigint, avalue int);

create table t1 (x int);

CREATE TABLE `t1` ( `master` int(10) unsigned NOT NULL default '0', `map` smallint(6) unsigned NOT NULL default '0', `slave` int(10) unsigned NOT NULL default '0', `access` int(10) unsigned NOT NULL default '0', UNIQUE KEY `access_u` (`master`,`map`,`slave`));

CREATE TABLE `t2` ( `id` int(10) unsigned NOT NULL default '0', `pid` int(10) unsigned NOT NULL default '0', `map` smallint(6) unsigned NOT NULL default '0', `level` tinyint(4) unsigned NOT NULL default '0', `title` varchar(255) default NULL, PRIMARY KEY  (`id`,`pid`,`map`), KEY `level` (`level`), KEY `id` (`id`,`map`)) ;

create table t1 (a int not null, b int not null, c int, primary key (a,b));

create table t1 (a int, b int);

create table t2 (a int, b int);

create table t1 (id int);

create table t2 (id int, body text, fulltext (body));

create table t1 (s1 int,s2 int);

create table t1 (s1 int);

CREATE TABLE t1 (
  Code char(3) NOT NULL default '',
  Name char(52) NOT NULL default '',
  Continent enum('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL default 'Asia',
  Region char(26) NOT NULL default '',
  SurfaceArea float(10,2) NOT NULL default '0.00',
  IndepYear smallint(6) default NULL,
  Population int(11) NOT NULL default '0',
  LifeExpectancy float(3,1) default NULL,
  GNP float(10,2) default NULL,
  GNPOld float(10,2) default NULL,
  LocalName char(45) NOT NULL default '',
  GovernmentForm char(45) NOT NULL default '',
  HeadOfState char(60) default NULL,
  Capital int(11) default NULL,
  Code2 char(2) NOT NULL default ''
) ENGINE=MyISAM;

create table t1 (a1 int);

create table t2 (b1 int);

create table t1 (a integer, b integer);

create table t1 (a integer, b integer);

create  table t1 (a integer);

CREATE TABLE t1 (
  categoryId int(11) NOT NULL,
  courseId int(11) NOT NULL,
  startDate datetime NOT NULL,
  endDate datetime NOT NULL,
  createDate datetime NOT NULL,
  modifyDate timestamp NOT NULL,
  attributes text NOT NULL
);

CREATE TABLE t2 (
  userId int(11) NOT NULL,
  courseId int(11) NOT NULL,
  date datetime NOT NULL
);

CREATE TABLE t3 (
  groupId int(11) NOT NULL,
  parentId int(11) NOT NULL,
  startDate datetime NOT NULL,
  endDate datetime NOT NULL,
  createDate datetime NOT NULL,
  modifyDate timestamp NOT NULL,
  ordering int(11)
);

CREATE TABLE t4 (
  id int(11) NOT NULL,
  groupTypeId int(11) NOT NULL,
  groupKey varchar(50) NOT NULL,
  name text,
  ordering int(11),
  description text,
  createDate datetime NOT NULL,
  modifyDate timestamp NOT NULL
);

CREATE TABLE t5 (
  userId int(11) NOT NULL,
  groupId int(11) NOT NULL,
  createDate datetime NOT NULL,
  modifyDate timestamp NOT NULL
);

create table t1 (a int);

create table t1 (a int);

create table t2 (a int);

create table t1 (a int, b int);

CREATE TABLE `t1` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `sessionid` bigint(20) unsigned default NULL,
  `time` int(10) unsigned NOT NULL default '0',
  `type` set('A','D','E','F','G','I','L','N','U') collate latin1_general_ci NOT
NULL default '',
  `data` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`itemid`)
) DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `t2` (
  `sessionid` bigint(20) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned NOT NULL default '0',
  `date` int(10) unsigned NOT NULL default '0',
  `ip` varchar(15) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`sessionid`)
) DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

create table t1 (fld enum('0','1'));

CREATE TABLE t1 (a int);

CREATE TABLE t2 (a int, b int);

CREATE TABLE t3 (b int NOT NULL);

CREATE TABLE t1 (f1 INT);

CREATE TABLE t2 (f2 INT);

create table t1 (s1 char);

create table t1 (
  retailerID varchar(8) NOT NULL,
  statusID   int(10) unsigned NOT NULL,
  changed    datetime NOT NULL,
  UNIQUE KEY retailerID (retailerID, statusID, changed)
);

create table t1(a int, primary key (a));

create table t2 (a int primary key, b varchar(32), c int, unique key b(c, b));

CREATE TABLE t1 (
  field1 int NOT NULL,
  field2 int NOT NULL,
  field3 int NOT NULL,
  PRIMARY KEY  (field1,field2,field3)
);

CREATE TABLE t2 (
  fieldA int NOT NULL,
  fieldB int NOT NULL,
  PRIMARY KEY  (fieldA,fieldB)
);

CREATE TABLE t1(a int, INDEX (a));

CREATE TABLE t2(a int);

CREATE TABLE t1 (a DATETIME);

CREATE TABLE t2 AS SELECT
  (SELECT a FROM t1 WHERE a < '2000-01-01') AS sub_a
   FROM t1 WHERE a > '2000-01-01';

CREATE TABLE t2;

CREATE TABLE t3 AS (SELECT a FROM t1 WHERE a < '2000-01-01') UNION (SELECT a FROM t1 WHERE a > '2000-01-01');

CREATE TABLE t3;

CREATE TABLE t1 (a int);

CREATE TABLE t1 (a int);

CREATE TABLE t2 (b int, c int);

create table t1 (df decimal(5,1));

create table t1 (df decimal(5,1));

CREATE TABLE t1 (
  grp int(11) default NULL,
  a decimal(10,2) default NULL);

CREATE table t1 ( c1 integer );

CREATE TABLE t2 ( c2 integer );

CREATE TABLE t1 ( c1 integer );

CREATE TABLE t2 ( c2 integer );

CREATE TABLE t3 ( c3 integer );

CREATE TABLE `t1` (
  `itemid` bigint(20) unsigned NOT NULL auto_increment,
  `sessionid` bigint(20) unsigned default NULL,
  `time` int(10) unsigned NOT NULL default '0',
  `type` set('A','D','E','F','G','I','L','N','U') collate latin1_general_ci NOT
NULL default '',
  `data` text collate latin1_general_ci NOT NULL,
  PRIMARY KEY  (`itemid`)
) DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE `t2` (
  `sessionid` bigint(20) unsigned NOT NULL auto_increment,
  `pid` int(10) unsigned NOT NULL default '0',
  `date` int(10) unsigned NOT NULL default '0',
  `ip` varchar(15) collate latin1_general_ci NOT NULL default '',
  PRIMARY KEY  (`sessionid`)
) DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

CREATE TABLE t1 (EMPNUM   CHAR(3));

CREATE TABLE t2 (EMPNUM   CHAR(3) );

CREATE TABLE t1(select_id BIGINT, values_id BIGINT);

CREATE TABLE t2 (select_id BIGINT, values_id BIGINT,
                 PRIMARY KEY(select_id,values_id));

create table t1 (fld enum('0','1'));

CREATE TABLE t1 (a int, b int);

CREATE TABLE t2 (c int, d int);

CREATE TABLE t3 (e int);

create table t1( f1 int,f2 int);

create table t1 (c int, key(c));

create table t2 (a int, b int);

CREATE TABLE t1 (a INT);

create table t1 (i int, j bigint);

CREATE TABLE t1 (i BIGINT UNSIGNED);

CREATE TABLE t2 (i BIGINT UNSIGNED);

CREATE TABLE t1 (
  id bigint(20) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE t2 (
  id bigint(20) unsigned NOT NULL auto_increment,
  mid bigint(20) unsigned NOT NULL,
  date date NOT NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE t1 (
  i1 int(11) NOT NULL default '0',
  i2 int(11) NOT NULL default '0',
  t datetime NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (i1,i2,t)
);

CREATE TABLE t2 (
  i1 int(11) NOT NULL default '0',
  i2 int(11) NOT NULL default '0',
  t datetime default NULL,
  PRIMARY KEY  (i1)
);

CREATE TABLE t1 (i INT);

CREATE TABLE t1 (a VARCHAR(250), b INT auto_increment, PRIMARY KEY (b));

CREATE TABLE t1 (a INT, b INT);

CREATE TABLE t2 (a INT);

CREATE TABLE t1 (a int, b int, PRIMARY KEY (b));

CREATE TABLE t2 (x int auto_increment, y int, z int,
                 PRIMARY KEY (x), FOREIGN KEY (y) REFERENCES t1 (b));

create table t3 (a int);

CREATE TABLE t1 (id char(4) PRIMARY KEY, c int);

CREATE TABLE t2 (c int);

CREATE TABLE t3 (c int);

CREATE TABLE t1(f1 int);

CREATE TABLE t2(f2 int, f21 int, f3 timestamp);

CREATE TABLE t1 (a int, b INT, c CHAR(10) NOT NULL);

CREATE TABLE t1 (
  id_1 int(5) NOT NULL,
  t varchar(4) DEFAULT NULL
);

CREATE TABLE t2 (
  id_2 int(5) NOT NULL,
  t varchar(4) DEFAULT NULL
);

CREATE TABLE t1xt2 (
  id_1 int(5) NOT NULL,
  id_2 int(5) NOT NULL
);

CREATE TABLE t1 (a int);

CREATE TABLE t1 (a int, b int);

CREATE TABLE t2 (m int, n int);

CREATE TABLE t1 (a int, b int);

CREATE TABLE t2 (m int, n int);

CREATE TABLE t1 (a int, b INT, d INT, c CHAR(10) NOT NULL, PRIMARY KEY (a, b));

CREATE TABLE t1 (a int, b int);

CREATE TABLE t1 (a INT);

CREATE TABLE t2 (x INT);

CREATE TABLE t1 (a int, b int, KEY (a));

CREATE TABLE t1 (id int NOT NULL, st CHAR(2), INDEX idx(id));

CREATE TABLE t2 (id int NOT NULL, INDEX idx(id));

CREATE TABLE t1 (a int);

CREATE TABLE t1 (
  a varchar(255) default NULL,
  b timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  INDEX idx(a,b)
);

CREATE TABLE t2 (
  a varchar(255) default NULL
);

CREATE TABLE t1 (a INTEGER, b INTEGER);

CREATE TABLE t2 (x INTEGER);

CREATE TABLE t1 (a INT, b INT);

CREATE TABLE t1 (a INT);

CREATE TABLE t2 (a INT);

CREATE TABLE t1 (a1 INT, a2 INT);

CREATE TABLE t2 (b1 INT, b2 INT);

CREATE TABLE t1 (s1 BINARY(5), s2 VARBINARY(5));

CREATE TABLE t1 (a1 VARBINARY(2) NOT NULL DEFAULT '0', PRIMARY KEY (a1));

CREATE TABLE t2 (a2 BINARY(2) default '0', INDEX (a2));

CREATE TABLE t3 (a3 BINARY(2) default '0');

CREATE TABLE t1 (a1 BINARY(3) PRIMARY KEY, b1 VARBINARY(3));

CREATE TABLE t2 (a2 VARBINARY(3) PRIMARY KEY);

CREATE TABLE t3 (a3 VARBINARY(3) PRIMARY KEY);

CREATE TABLE t1(a INT, b INT);

CREATE TABLE t1 (a INT);

CREATE TABLE t2 (a INT);

create table t0(a int);

create table t1(f11 int, f12 int);

create table t2(f21 int unsigned not null, f22 int, f23 varchar(10));

CREATE TABLE t4 (
  f7 varchar(32) collate utf8_bin NOT NULL default '',
  f10 varchar(32) collate utf8_bin default NULL,
  PRIMARY KEY  (f7)
);

CREATE TABLE t2 (
  f4 varchar(32) collate utf8_bin NOT NULL default '',
  f2 varchar(50) collate utf8_bin default NULL,
  f3 varchar(10) collate utf8_bin default NULL,
  PRIMARY KEY  (f4),
  UNIQUE KEY uk1 (f2)
);

CREATE TABLE t1 (
  f8 varchar(32) collate utf8_bin NOT NULL default '',
  f1 varchar(10) collate utf8_bin default NULL,
  f9 varchar(32) collate utf8_bin default NULL,
  PRIMARY KEY  (f8)
);

CREATE TABLE t3 (
  f6 varchar(32) collate utf8_bin NOT NULL default '',
  f5 varchar(50) collate utf8_bin default NULL,
  PRIMARY KEY (f6)
);

create table t1 (a float(5,4) zerofill);

create table t2 (a float(5,4),b float(2,0));

CREATE TABLE `C` (
  `int_nokey` int(11) NOT NULL,
  `int_key` int(11) NOT NULL,
  KEY `int_key` (`int_key`)
);

CREATE TABLE t1 (
  a int,
  b int,
  UNIQUE (a), KEY (b)
);

CREATE TABLE st1 like t1;

CREATE TABLE st2 like t1;

CREATE TABLE t1 (pk int PRIMARY KEY, int_key int);

CREATE TABLE t2 (pk int PRIMARY KEY, int_key int);

create table t1 (oref int, grp int, ie int) ;

create table t2 (oref int, a int);

create table t3 (a int);

create table t1 (a int, oref int, key(a));

create table t2 (a int, oref int);

create table t1 (a int, b int, primary key (a));

create table t2 (a int, b int);

create table t1 (a int, b int, key(a));

create table t2 like t1;

create table t3 (a int, oref int);

create table t1 (a int NOT NULL, b int NOT NULL, key(a));

create table t2 like t1;

create table t3 (a int, oref int);

create table t1 (oref int, grp int);

create table t2 (oref int, a int);

create table t1 (a int, b int, primary key (a));

create table t2 (a int, b int);

create table t3 (a int);

create table t2 (a int, b int, oref int);

create table t1 (a int, b int, c int, key(a,b));

create table t4 (x int);

create table t1 (oref char(4), grp int, ie1 int, ie2 int);

create table t2 (oref char(4), a int, b int);

create table t1 (oref char(4), grp int, ie int);

create table t2 (oref char(4), a int);

create table t1 (oref char(4), grp int, ie1 int, ie2 int);

create table t2 (oref char(4), a int, b int);

create table t1 (oref char(4), grp int, ie int primary key);

create table t2 (oref char(4), a int);

create table t1 (a int, b int);

create table t2 (a int, b int);

CREATE TABLE t1 (a int, b INT, c CHAR(10) NOT NULL, PRIMARY KEY (a, b));

CREATE TABLE t2 (a int, b INT, c CHAR(10) NOT NULL, PRIMARY KEY (a, b));

CREATE TABLE t1 (a int);

CREATE TABLE t2 (b int, PRIMARY KEY(b));

CREATE TABLE t1 (id int);

CREATE TABLE t2 (id int PRIMARY KEY);

CREATE TABLE t3 (id int PRIMARY KEY, name varchar(10));

CREATE TABLE t1 (a INT NOT NULL);

CREATE TABLE t2 (a INT UNSIGNED NOT NULL PRIMARY KEY);

CREATE TABLE t1 (a INT);

CREATE TABLE t2 (placeholder CHAR(11));

CREATE TABLE t1 (a INT);

CREATE TABLE t2 SELECT * FROM t1;

create table t1 (a int, b decimal(13, 3));

CREATE TABLE t1 (
  pk INT PRIMARY KEY,
  int_key INT,
  varchar_key VARCHAR(5) UNIQUE,
  varchar_nokey VARCHAR(5)
);

CREATE TABLE t1 (a INT);

CREATE TABLE t1 (a INT, b INT, c INT);

CREATE TABLE t1 (a INT, b INT, KEY(a));

CREATE TABLE t2 LIKE t1;

CREATE TABLE t3 LIKE t1;

CREATE TABLE t1 (
  a INT,
  b INT,
  PRIMARY KEY (a),
  KEY b (b)
);

CREATE TABLE t2 LIKE t1;

CREATE TABLE t3 LIKE t1;

CREATE TABLE t1(a1 int);

CREATE TABLE t1(a1 int);

CREATE TABLE t2(a1 int);

create table t2(i int);

CREATE TABLE t1 (
  pk int NOT NULL,
  col_varchar_key varchar(1) DEFAULT NULL,
  PRIMARY KEY (pk),
  KEY col_varchar_key (col_varchar_key)
);

create table t_out (subcase char(3),
                    a1 char(2), b1 char(2), c1 char(2));

create table t_in  (a2 char(2), b2 char(2), c2 char(2));

CREATE TABLE t1 (a INT, b INT);

CREATE TABLE t1 (s1 CHAR(1));

CREATE TABLE t1(c INT, KEY(c));

CREATE TABLE t2(a INT, b INT);

CREATE TABLE t1(pk INT PRIMARY KEY, a INT, INDEX idx(a));

CREATE TABLE t2(pk INT PRIMARY KEY, a INT, b INT, INDEX idxa(a));

CREATE TABLE t1 (a INT, b INT, PRIMARY KEY (a), KEY b (b));

CREATE TABLE t2 (
  a INT,
  b INT,
  c INT,
  d INT,
  PRIMARY KEY (a),
  UNIQUE KEY b (b,c,d),
  KEY b_2 (b),
  KEY c (c),
  KEY d (d)
);

CREATE TABLE t3 (
  a INT,
  b INT,
  c INT,
  PRIMARY KEY (a),
  UNIQUE KEY b (b,c),
  KEY c (c),
  KEY b_2 (b)
);

CREATE TABLE t1 (id int);

CREATE TABLE t2 (id int, c int);

create table t1(id integer primary key, g integer, v integer, s char(1));

create table t2(id integer primary key, g integer, v integer, s char(1));

CREATE TABLE t1( a INT );

CREATE TABLE t2( a INT, b INT );

CREATE TABLE t1 (a ENUM('rainbow'));

CREATE TABLE t1 (a LONGBLOB);

CREATE TABLE t1(a INT);

CREATE TABLE t1(a LONGTEXT);

create table t0 (a int);

create table t1 (
  a int(11) default null,
  b int(11) default null,
  key (a)
);

create table t2 (a int(11) default null);

create table t3 (a int(11) default null);

create table t4 (a int(11) default null);

create table t5 (a int(11) default null);

CREATE TABLE t1 (
  i1 int DEFAULT NULL,
  i2 int DEFAULT NULL
) ;

CREATE TABLE t2 (
  i1 int DEFAULT NULL,
  i2 int DEFAULT NULL
) ;

CREATE TABLE t1 (
	t1_id INT UNSIGNED,

	PRIMARY KEY(t1_id)
) Engine=MyISAM;

CREATE TABLE t2 SELECT * FROM t1;

CREATE TABLE t3 (
	t3_id INT UNSIGNED AUTO_INCREMENT,
	t1_id INT UNSIGNED,
	amount DECIMAL(16,2),

	PRIMARY KEY(t3_id),
	KEY(t1_id)
) Engine=MyISAM;

create table t0 (a int);

create table t1 (
  a int(11) default null,
  b int(11) default null,
  key (a)
);

create table t2 (a int(11) default null);

create table t3 (a int(11) default null);

create table t4 (a int(11) default null);

create table t5 (a int(11) default null);

CREATE TABLE t1 (
  i1 int DEFAULT NULL,
  i2 int DEFAULT NULL
) ;

CREATE TABLE t2 (
  i1 int DEFAULT NULL,
  i2 int DEFAULT NULL
) ;

CREATE TABLE t1 (a VARCHAR(10), FULLTEXT KEY a (a));

CREATE TABLE t2 (b INT);

CREATE TABLE t1(i INT);

CREATE TABLE t1s(i INT);

CREATE TABLE t2s(i INT);

CREATE TABLE t1 (
 pk INT NOT NULL PRIMARY KEY,
 number INT,
 KEY key_number (number)
);

CREATE TABLE t2 (
 pk INT NOT NULL PRIMARY KEY,
 number INT,
 KEY key_number (number)
);

CREATE TABLE t1 (a INT, b INT, INDEX (a));

CREATE TABLE t1 (i INTEGER);

CREATE TABLE t2 (i INTEGER, KEY k(i));

CREATE TABLE t1(a INT NOT NULL, KEY (a));

CREATE TABLE t1 (a INT);

CREATE TABLE parent (id int);

CREATE TABLE child (parent_id int, other int);

CREATE TABLE t1 (
  i int(11) DEFAULT NULL,
  v varchar(1) DEFAULT NULL
);

CREATE TABLE t2 (
  i int(11) DEFAULT NULL,
  v varchar(1) DEFAULT NULL,
  KEY i_key (i)
);

CREATE TABLE t1 (a INT, b INT, INDEX (a));

CREATE TABLE cc (
  pk INT,
  col_int_key INT,
  col_varchar_key VARCHAR(1),
  PRIMARY KEY (pk),
  KEY col_int_key (col_int_key),
  KEY col_varchar_key (col_varchar_key,col_int_key)
) ENGINE=MyISAM;

CREATE TABLE bb (
  pk INT,
  col_date_key DATE,
  PRIMARY KEY (pk),
  KEY col_date_key (col_date_key)
) ENGINE=MyISAM;

CREATE TABLE c (
  pk INT,
  col_int_key INT,
  col_varchar_key VARCHAR(1),
  PRIMARY KEY (pk),
  KEY col_int_key (col_int_key),
  KEY col_varchar_key (col_varchar_key,col_int_key)
) ENGINE=MyISAM;

CREATE TABLE b (
  pk INT,
  col_int_key INT,
  col_varchar_key VARCHAR(1),
  PRIMARY KEY (pk),
  KEY col_int_key (col_int_key),
  KEY col_varchar_key (col_varchar_key,col_int_key)
) ENGINE=MyISAM;

CREATE TABLE t1 (c int);

CREATE TABLE t2 (d int , KEY (d));

CREATE TABLE t1 (
  `pk` int(11) NOT NULL AUTO_INCREMENT,
  `int_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`pk`),
  KEY `int_key` (`int_key`)
) ENGINE=MyISAM;

CREATE TABLE t1 (
  pk INTEGER AUTO_INCREMENT,
  col_varchar VARCHAR(1),
  PRIMARY KEY (pk)
)
;

CREATE TABLE t(a VARCHAR(245) DEFAULT
'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');

CREATE TABLE t1(a INT);

CREATE TABLE t2(
  b TEXT, 
  c INT, 
  PRIMARY KEY (b(1))
);

CREATE TABLE t1 (f1 varchar(1));

CREATE TABLE t2 (f1_key varchar(1), KEY (f1_key));

CREATE TABLE t1 (
col_int_key int,
col_varchar_key varchar(1),
col_varchar_nokey varchar(1),
KEY (col_int_key)
);

CREATE TABLE t3 (
col_int_key int,
col_varchar_key varchar(1),
KEY col_int_key (col_int_key),
KEY col_varchar_key (col_varchar_key,col_int_key))
;

CREATE TABLE t1 (f1 INT);

CREATE TABLE t1 (k VARCHAR(1), KEY k(k));

CREATE TABLE t2 (c VARCHAR(1));

CREATE TABLE t3 (c VARCHAR(1));

CREATE TABLE ot (
  col_int_nokey int(11), 
  col_varchar_nokey varchar(1)
) ;

CREATE TABLE it (
  col_int_key int(11), 
  col_varchar_key varchar(1), 
  KEY idx_cvk_cik (col_varchar_key,col_int_key)
) ;

CREATE TABLE it (
   col_int_key int(11),
   col_varchar_key varchar(1),
   col_varchar_key2 varchar(1),
   KEY idx_cvk_cvk2_cik (col_varchar_key, col_varchar_key2, col_int_key),
   KEY idx_cvk_cik (col_varchar_key, col_int_key)
);

CREATE TABLE t1(a INTEGER);

CREATE TABLE t2(b INTEGER);

CREATE TABLE t1 (
  pk int(11) NOT NULL AUTO_INCREMENT,
  col_int_key int(11) NOT NULL,
  col_varchar_key varchar(1) NOT NULL,
  col_varchar_nokey varchar(1) NOT NULL,
  PRIMARY KEY (pk),
  KEY col_int_key (col_int_key),
  KEY col_varchar_key (col_varchar_key,col_int_key)
);

CREATE TABLE t1 (
  pk int NOT NULL,
  col_int_nokey int NOT NULL,
  col_int_key int NOT NULL,
  col_time_key time NOT NULL,
  col_varchar_key varchar(1) NOT NULL,
  col_varchar_nokey varchar(1) NOT NULL,
  PRIMARY KEY (pk),
  KEY col_int_key (col_int_key),
  KEY col_time_key (col_time_key),
  KEY col_varchar_key (col_varchar_key,col_int_key)
) ENGINE=MyISAM;

CREATE TABLE t2 (
  pk int NOT NULL AUTO_INCREMENT,
  col_int_nokey int NOT NULL,
  col_int_key int NOT NULL,
  col_time_key time NOT NULL,
  col_varchar_key varchar(1) NOT NULL,
  col_varchar_nokey varchar(1) NOT NULL,
  PRIMARY KEY (pk),
  KEY col_int_key (col_int_key),
  KEY col_time_key (col_time_key),
  KEY col_varchar_key (col_varchar_key,col_int_key)
) ENGINE=MyISAM;

create table t1(a int);

create table t2(a int primary key, b int);

CREATE TABLE m (c1 VARCHAR(1), c2 INTEGER, c3 INTEGER);

CREATE TABLE o (c1 VARCHAR(1));

CREATE TABLE integers (i1 INTEGER);

CREATE TABLE t1(a TIME NOT NULL);

CREATE TABLE t1(a INT, b CHAR(1));

CREATE TABLE t2(c INT, d CHAR(1));

CREATE TABLE t1 (
  col_varchar_key varchar(1) NOT NULL,
  col_varchar_nokey varchar(1) NOT NULL,
  KEY col_varchar_key (col_varchar_key)
) ENGINE=InnoDB;

CREATE TABLE t2 (
  col_int_nokey INT NOT NULL,
  col_varchar_nokey varchar(1) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE t0 (
 i1 INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE t1(
 col_varchar_key varchar(1),
 KEY col_varchar_key(col_varchar_key)
) engine=MEMORY;

CREATE TABLE t2(
 col_int_nokey int,
 col_int_key int,
 KEY col_int_key(col_int_key)
) engine=MEMORY;

CREATE TABLE t0(i1 INTEGER NOT NULL PRIMARY KEY);

CREATE TABLE t1 (
id int
) ENGINE=InnoDB;

CREATE TABLE t2 (
t1_id int,
position int,
KEY t1_id (t1_id),
KEY t1_id_position (t1_id,position)
) ENGINE=InnoDB;

CREATE TABLE t1 (a int, b int);

CREATE TABLE t2 (a int, b int, KEY a_b (a,b));

CREATE TABLE t4 (a int);

CREATE TABLE t1 (
  pk INT NOT NULL,
  col_int_nokey INT,
  col_int_key INT,
  col_varchar_key VARCHAR(1),
  col_varchar_nokey VARCHAR(1),
  PRIMARY KEY (pk),
  KEY col_int_key (col_int_key),
  KEY col_varchar_key (col_varchar_key,col_int_key)
) ENGINE=MyISAM;

CREATE TABLE t2 $query ;

CREATE TABLE t1(a INT);

CREATE TABLE t2(b INT);

CREATE TABLE t3(c INT);

CREATE TABLE t1 (a INT, b INT);

CREATE TABLE t2 (c INT);

CREATE TABLE t1 (a INT NOT NULL, b INT NOT NULL);

CREATE TABLE t2 (c INT NOT NULL);

CREATE TABLE t1 (
  f1 INTEGER,
  f2 INTEGER
);

