-- Source: https://github.com/iujoseph972/a348-workspace/blob/c0f11210dfd2c93ef1855e253aa410ca7ef5b5b9/mysql/mysql-test/include/mix2.inc?raw=true
-- Tables detected: 236 | FK/REFERENCES mentions: 85

CREATE TABLE statement, where
# the storage engine is assigned explicitely,
eval SET SESSION STORAGE_ENGINE = $other_engine_type;

create table t1 (id int unsigned not null auto_increment, code tinyint unsigned not null, name char(20) not null, primary key (id), key (code), unique (name)) engine=$engine_type;

CREATE TABLE t1 (
  id int(11) NOT NULL auto_increment,
  parent_id int(11) DEFAULT '0' NOT NULL,
  level tinyint(4) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id),
  KEY parent_id (parent_id),
  KEY level (level)
) engine=$engine_type;

CREATE TABLE t1 (
  gesuchnr int(11) DEFAULT '0' NOT NULL,
  benutzer_id int(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (gesuchnr,benutzer_id)
) engine=$engine_type;

create table t1 (a int) engine=$engine_type;

create table t1 (a int,b varchar(20)) engine=$engine_type;

create table t1 (a int,b varchar(20),key(a)) engine=$engine_type;

create table t1 (n int not null primary key) engine=$engine_type;

create table t1 (n int not null primary key) engine=$engine_type;

create table t1 ( id int NOT NULL PRIMARY KEY, nom varchar(64)) engine=$engine_type;

CREATE TABLE t1 (id char(8) not null primary key, val int not null) engine=$engine_type;

create table t1 (a integer) engine=$engine_type;

create table t1 (b integer) engine=$engine_type;

CREATE TABLE t1 (ID INTEGER NOT NULL PRIMARY KEY, NAME VARCHAR(64)) ENGINE=$engine_type;

CREATE TABLE t1 ( _userid VARCHAR(60) NOT NULL PRIMARY KEY) ENGINE=$engine_type;

CREATE TABLE t1 (
  user_id int(10) DEFAULT '0' NOT NULL,
  name varchar(100),
  phone varchar(100),
  ref_email varchar(100) DEFAULT '' NOT NULL,
  detail varchar(200),
  PRIMARY KEY (user_id,ref_email)
)engine=$engine_type;

CREATE TABLE t1 (a int not null, b int not null,c int not null,
key(a),primary key(a,b), unique(c),key(a),unique(b)) ENGINE = $engine_type;

create table t1 (col1 int not null, col2 char(4) not null, primary key(col1)) ENGINE = $other_engine_type;

create table t1 (a int not null , b int, primary key (a)) engine = $engine_type;

create table t2 (a int not null , b int, primary key (a)) engine = $other_engine_type;

CREATE TABLE t1 (
  id int(11) NOT NULL auto_increment,
  ggid varchar(32) binary DEFAULT '' NOT NULL,
  email varchar(64) DEFAULT '' NOT NULL,
  passwd varchar(32) binary DEFAULT '' NOT NULL,
  PRIMARY KEY (id),
  UNIQUE ggid (ggid)
) ENGINE=$engine_type;

CREATE TABLE t1 (
  user_name varchar(12),
  password text,
  subscribed char(1),
  user_id int(11) DEFAULT '0' NOT NULL,
  quota bigint(20),
  weight double,
  access_date date,
  access_time time,
  approved datetime,
  dummy_primary_key int(11) NOT NULL auto_increment,
  PRIMARY KEY (dummy_primary_key)
) ENGINE=$engine_type;

CREATE TABLE t1 (
  id int(11) NOT NULL auto_increment,
  parent_id int(11) DEFAULT '0' NOT NULL,
  level tinyint(4) DEFAULT '0' NOT NULL,
  KEY (id),
  KEY parent_id (parent_id),
  KEY level (level)
) engine=$engine_type;

CREATE TABLE t1 (
   sca_code char(6) NOT NULL,
   cat_code char(6) NOT NULL,
   sca_desc varchar(50),
   lan_code char(2) NOT NULL,
   sca_pic varchar(100),
   sca_sdesc varchar(50),
   sca_sch_desc varchar(16),
   PRIMARY KEY (sca_code, cat_code, lan_code),
   INDEX sca_pic (sca_pic)
) engine = $engine_type ;

CREATE TABLE t1 (a int not null, b timestamp not null, primary key (a)) engine=$engine_type;

create table t1 (a varchar(100) not null, primary key(a), b int not null) engine=$engine_type;

create table t1 (i int, j int ) ENGINE=$engine_type;

CREATE TABLE t1 (
  a int3 unsigned NOT NULL,
  b int1 unsigned NOT NULL,
  UNIQUE (a, b)
) ENGINE = $engine_type;

CREATE TABLE t1 (a int unsigned NOT NULL) engine=$engine_type;

create table t1 (a int  primary key,b int, c int, d int, e int, f int, g int, h int, i int, j int, k int, l int, m int, n int, o int, p int, q int, r int, s int, t int, u int, v int, w int, x int, y int, z int, a1 int, a2 int, a3 int, a4 int, a5 int, a6 int, a7 int, a8 int, a9 int, b1 int, b2 int, b3 int, b4 int, b5 int, b6 int) engine = $engine_type;

create table t1 (id int NOT NULL,id2 int NOT NULL,id3 int NOT NULL,dummy1 char(30),primary key (id,id2),index index_id3 (id3)) engine=$engine_type;

create table t1 (id int NOT NULL,id2 int NOT NULL,id3 int NOT NULL,dummy1 char(30),primary key (id,id2),index index_id3 (id3)) engine=$engine_type;

create table t1 (a char(20), unique (a(5))) engine=$engine_type;

create table t1 (a char(20), index (a(5))) engine=$engine_type;

create table t1;

create table t1
 (
  id int auto_increment primary key,
  name varchar(32) not null,
  value text not null,
  uid int not null,
  unique key(name,uid)
 ) engine=$engine_type;

create table mysqltest.t1 (a int not null) engine= $engine_type;

create table mysqltest.t2 (a int not null) engine= $other_engine_type;

create table mysqltest.t3 (a int not null) engine= $other_engine_type1;

create table t1 (a int not null) engine= $engine_type;

create table t1 (a int not null) engine= $engine_type;

create table t1 (a int not null, b int not null, c int not null, primary key (a),key(b)) engine=$engine_type;

create table t1 (t int not null default 1, key (t)) engine=$engine_type;

CREATE TABLE t1 (
  number bigint(20) NOT NULL default '0',
  cname char(15) NOT NULL default '',
  carrier_id smallint(6) NOT NULL default '0',
  privacy tinyint(4) NOT NULL default '0',
  last_mod_date timestamp NOT NULL,
  last_mod_id smallint(6) NOT NULL default '0',
  last_app_date timestamp NOT NULL,
  last_app_id smallint(6) default '-1',
  version smallint(6) NOT NULL default '0',
  assigned_scps int(11) default '0',
  status tinyint(4) default '0'
) ENGINE=$engine_type;

CREATE TABLE t2 (
  number bigint(20) NOT NULL default '0',
  cname char(15) NOT NULL default '',
  carrier_id smallint(6) NOT NULL default '0',
  privacy tinyint(4) NOT NULL default '0',
  last_mod_date timestamp NOT NULL,
  last_mod_id smallint(6) NOT NULL default '0',
  last_app_date timestamp NOT NULL,
  last_app_id smallint(6) default '-1',
  version smallint(6) NOT NULL default '0',
  assigned_scps int(11) default '0',
  status tinyint(4) default '0'
) ENGINE=$engine_type;

create table t1 (id int unsigned not null auto_increment, code tinyint unsigned not null, name char(20) not null, primary key (id), key (code), unique (name)) engine=$engine_type;

create table t1 (n int(10), d int(10)) engine=$engine_type;

create table t2 (n int(10), d int(10)) engine=$engine_type;

create table t1 (a int, b int) engine=$engine_type;

create table t1 (a varchar(10) not null) engine = $other_engine_type;

create table t2 (b varchar(10) not null unique) engine=$engine_type;

create table t1 (a int not null, b int, primary key (a)) engine = $engine_type;

create table t2 (a int not null, b int, primary key (a)) engine = $engine_type;

CREATE TABLE t1 (id INT NOT NULL, PRIMARY KEY (id)) ENGINE=$engine_type;

CREATE TABLE t2 (id INT PRIMARY KEY, t1_id INT, INDEX par_ind (t1_id), FOREIGN KEY (t1_id) REFERENCES t1(id)  ON DELETE CASCADE ) ENGINE=$engine_type;

CREATE TABLE t1(id INT NOT NULL,  PRIMARY KEY (id)) ENGINE=$engine_type;

CREATE TABLE t2(id  INT PRIMARY KEY, t1_id INT, INDEX par_ind (t1_id)  ) ENGINE=$engine_type;

CREATE TABLE t1 (id CHAR(15) NOT NULL, value CHAR(40) NOT NULL, PRIMARY KEY(id)) ENGINE=$engine_type;

CREATE TABLE t2 (id CHAR(15) NOT NULL, value CHAR(40) NOT NULL, PRIMARY KEY(id)) ENGINE=$engine_type;

CREATE TABLE t3 (id1 CHAR(15) NOT NULL, id2 CHAR(15) NOT NULL, PRIMARY KEY(id1, id2)) ENGINE=$engine_type;

CREATE TABLE t1 (a int not null primary key, b int not null, unique (b)) engine=$engine_type;

CREATE TABLE t1 (a int not null primary key, b int not null, key (b)) engine=$engine_type;

CREATE TABLE t2 (a int not null primary key, b int not null, key (b)) engine=$engine_type;

CREATE TABLE t2 (  NEXT_T         BIGINT NOT NULL PRIMARY KEY) ENGINE=$other_non_trans_engine_type;

CREATE TABLE t1 (  B_ID           INTEGER NOT NULL PRIMARY KEY) ENGINE=$engine_type;

create table t1  ( pk         int primary key,    parent     int not null,    child      int not null,       index (parent)  ) engine = $engine_type;

create table t1 (a int not null auto_increment primary key, b int, c int, key(c)) engine=$engine_type;

create table t2 (a int not null auto_increment primary key, b int) ENGINE = $other_engine_type;

create table t1 (id int primary key auto_increment, fk int, index index_fk (fk)) engine=$engine_type;

create table t1 (a int not null, b int not null, key (a)) engine=$engine_type;

create table t1 ( c char(8) not null ) engine=$engine_type;

create table t2 (c char(8) not null, b char(8) not null, a char(8) not null, primary key(a,b,c)) engine=$engine_type;

create table t1 (a integer auto_increment primary key) engine=$engine_type;

CREATE TABLE t1 (`id 1` INT NOT NULL, PRIMARY KEY (`id 1`)) ENGINE=$engine_type;

CREATE TABLE t2 (id INT PRIMARY KEY, t1_id INT, INDEX par_ind (t1_id), FOREIGN KEY (`t1_id`) REFERENCES `t1`(`id 1`)  ON DELETE CASCADE ) ENGINE=$engine_type;

create table t2;

create table `t1` (`id` int( 11 ) not null  ,primary key ( `id` )) engine = $engine_type;

create table `t2` (`id` int( 11 ) not null default '0',unique key `id` ( `id` ) ,constraint `t1_id_fk` foreign key ( `id` ) references `t1` (`id` )) engine = $engine_type;

create table `t3` (`id` int( 11 ) not null default '0',key `id` ( `id` ) ,constraint `t2_id_fk` foreign key ( `id` ) references `t2` (`id` )) engine = $engine_type;

create table t1(
	id int primary key,
	pid int,
	index(pid),
	foreign key(pid) references t1(id) on delete cascade) engine=$engine_type;

CREATE TABLE t1 (col1 int(1))ENGINE=$engine_type;

CREATE TABLE t2 (col1 int(1),stamp TIMESTAMP,INDEX stamp_idx
(stamp))ENGINE=$engine_type;

CREATE TABLE t1 (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_object` int(10) unsigned default '0',
  `id_version` int(10) unsigned NOT NULL default '1',
  `label` varchar(100) NOT NULL default '',
  `description` text,
  PRIMARY KEY  (`id`),
  KEY `id_object` (`id_object`),
  KEY `id_version` (`id_version`)
) ENGINE=$engine_type;

CREATE TABLE t2 (
  `id` int(10) unsigned NOT NULL auto_increment,
  `id_version` int(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (`id`),
  KEY `id_version` (`id_version`)
) ENGINE=$engine_type;

create table t1 (a int, b varchar(200), c text not null) checksum=1 engine=$other_live_chks_engine_type;

create table t2 (a int, b varchar(200), c text not null) checksum=0 engine=$other_live_chks_engine_type;

create table t3 (a int, b varchar(200), c varchar(200) not null) checksum=1 engine=$other_non_live_chks_engine_type;

create table t4 (a int, b varchar(200), c varchar(200) not null) checksum=0 engine=$other_non_live_chks_engine_type;

create table t5 (a int, b varchar(200), c text not null) checksum=1 engine=$engine_type;

create table t6 (a int, b varchar(200), c text not null) checksum=0 engine=$engine_type;

create table t1 (id int,  name char(10) not null,  name2 char(10) not null) engine=$engine_type;

CREATE TABLE LIKE with InnoDB
#
eval create table t1 (a int) engine=$engine_type;

create table t2 like t1;

create table t2;

create table t1 (id int(11) not null, id2 int(11) not null, unique (id,id2)) engine=$engine_type;

create table t2 (id int(11) not null, constraint t1_id_fk foreign key ( id ) references t1 (id)) engine = $engine_type;

create table t1;

create table t2;

create table t2;

create table t2;

create table t2;

create table t2 (id int(11) not null, id2 int(11) not null, constraint t1_id_fk foreign key (id,id2) references t1 (id,id2)) engine = $engine_type;

create table t2;

create table t2;

create table t2 (id int(11) not null, id2 int(11) not null, unique (id,id2),constraint t1_id_fk foreign key (id2,id) references t1 (id,id2)) engine = $engine_type;

create table t2;

create table t2 (id int(11) not null, id2 int(11) not null, unique (id,id2), constraint t1_id_fk foreign key (id) references t1 (id)) engine = $engine_type;

create table t2;

create table t2 (id int(11) not null, id2 int(11) not null, unique (id,id2),constraint t1_id_fk foreign key (id2,id) references t1 (id,id2)) engine = $engine_type;

create table t2;

create table t2 (id int(11) not null auto_increment, id2 int(11) not null, constraint t1_id_fk foreign key (id) references t1 (id), primary key (id), index (id,id2)) engine = $engine_type;

create table t2;

create table t2 (id int(11) not null auto_increment, id2 int(11) not null, constraint t1_id_fk foreign key (id) references t1 (id)) engine= $engine_type;

create table t2;

create table t2;

create table t2 (id int(11) not null, id2 int(11) not null, constraint t1_id_fk foreign key (id2,id) references t1 (id)) engine = $engine_type;

create table t2 (a int auto_increment primary key, b int, index(b), foreign key (b) references t1(id), unique(b)) engine=$engine_type;

create table t2;

create table t2 (a int auto_increment primary key, b int, foreign key (b) references t1(id), foreign key (b) references t1(id), unique(b)) engine=$engine_type;

create table t2;

create table t1 (a int) engine=$engine_type;

create table t1 (c char(10), index (c,c)) engine=$engine_type;

create table t1 (c1 char(10), c2 char(10), index (c1,c2,c1)) engine=$engine_type;

create table t1 (c1 char(10), c2 char(10), index (c1,c1,c2)) engine=$engine_type;

create table t1 (c1 char(10), c2 char(10), index (c2,c1,c1)) engine=$engine_type;

create table t1 (c1 char(10), c2 char(10)) engine=$engine_type;

create table t1(a int(1) , b int(1)) engine=$engine_type;

CREATE TABLE t1 ( a char(10) ) ENGINE=$engine_type;

CREATE TABLE t1 (a_id tinyint(4) NOT NULL default '0', PRIMARY KEY  (a_id)) ENGINE=$engine_type DEFAULT CHARSET=latin1;

CREATE TABLE t2 (b_id tinyint(4) NOT NULL default '0',b_a tinyint(4) NOT NULL default '0', PRIMARY KEY  (b_id), KEY  (b_a),
                CONSTRAINT fk_b_a FOREIGN KEY (b_a) REFERENCES t1 (a_id) ON DELETE CASCADE ON UPDATE NO ACTION) ENGINE=$engine_type DEFAULT CHARSET=latin1;

create table t1 (a int) engine=$engine_type;

create table t1 (a int not null, b int not null, c blob not null, d int not null, e int, primary key (a,b,c(255),d)) engine=$engine_type;

create table t1 (a char(1), b char(1), key(a, b)) engine=$engine_type;

create table t1 (x bigint unsigned not null primary key) engine=$engine_type;

create table t1 (v varchar(65530), key(v));

create table t1 (v varchar(65536));

create table t1;

create table t1 (v varchar(65530) character set utf8);

create table t1;

create table t1 (v varchar(16384)) engine=$engine_type;

create table t1 (a char(1), b char(1), key(a, b)) engine=$engine_type;

CREATE TABLE t1 ( `a` int(11) NOT NULL auto_increment, `b` int(11) default NULL,PRIMARY KEY  (`a`),UNIQUE KEY `b` (`b`)) ENGINE=$engine_type;

create table t1 (rowid int not null auto_increment, val int not null,primary
key (rowid), unique(val)) engine=$engine_type;

create table t1 (a int not null auto_increment primary key, val int) engine=$engine_type;

CREATE TABLE t1 (GRADE DECIMAL(4) NOT NULL, PRIMARY KEY (GRADE)) ENGINE=$engine_type;

create table t1 (f1 varchar(10), f2 varchar(10), primary key (f1,f2)) engine=$engine_type;

create table t2 (f3 varchar(10), f4 varchar(10), key (f4)) engine=$engine_type;

CREATE TABLE t1 (
id INTEGER NOT NULL AUTO_INCREMENT, PRIMARY KEY (id)
) ENGINE=$engine_type;

CREATE TABLE t2 (
id INTEGER NOT NULL,
FOREIGN KEY (id) REFERENCES t1 (id)
) ENGINE=$engine_type;

CREATE TABLE t1
(
 id INT PRIMARY KEY
) ENGINE=$engine_type;

create table t1 (col1 varchar(2000), index (col1(767)))
 character set = latin1 engine = $engine_type;

create table t2 (col1 char(255), index (col1))
 character set = latin1 engine = $engine_type;

create table t3 (col1 binary(255), index (col1))
 character set = latin1 engine = $engine_type;

create table t4 (col1 varchar(767), index (col1))
 character set = latin1 engine = $engine_type;

create table t5 (col1 varchar(767) primary key)
 character set = latin1 engine = $engine_type;

create table t6 (col1 varbinary(767) primary key)
 character set = latin1 engine = $engine_type;

create table t7 (col1 text, index(col1(767)))
 character set = latin1 engine = $engine_type;

create table t8 (col1 blob, index(col1(767)))
 character set = latin1 engine = $engine_type;

create table t9 (col1 varchar(512), col2 varchar(512), index(col1, col2))
 character set = latin1 engine = $engine_type;

create table t9;

create table t1 (col1 varchar(768), index(col1))
 character set = latin1 engine = $engine_type;

create table t2 (col1 varbinary(768), index(col1))
 character set = latin1 engine = $engine_type;

create table t3 (col1 text, index(col1(768)))
 character set = latin1 engine = $engine_type;

create table t4 (col1 blob, index(col1(768)))
 character set = latin1 engine = $engine_type;

create table t1;

create table t1 (col1 varchar(768) primary key)
 character set = latin1 engine = $engine_type;

create table t2 (col1 varbinary(768) primary key)
 character set = latin1 engine = $engine_type;

create table t3 (col1 text, primary key(col1(768)))
 character set = latin1 engine = $engine_type;

create table t4 (col1 blob, primary key(col1(768)))
 character set = latin1 engine = $engine_type;

CREATE TABLE t1
(
 id INT PRIMARY KEY
) ENGINE=$engine_type;

CREATE TABLE t2
(
 v INT,
 CONSTRAINT c1 FOREIGN KEY (v) REFERENCES t1(id)
) ENGINE=$engine_type;

create table t1(a int not null) engine=$engine_type DEFAULT CHARSET=latin1;

create table t1(a int not null) engine=$engine_type DEFAULT CHARSET=latin1;

create table t2 (a int primary key, b int, foreign key (b) references t1(a)) engine = $engine_type;

create table t1(a char(10) primary key, b varchar(20)) engine = $engine_type;

create table t1(a varchar(10) primary key) engine = $engine_type DEFAULT CHARSET=latin1;

create table t2 (a varchar(10), foreign key (a) references t1(a)) engine = $engine_type DEFAULT CHARSET=utf8;

create table t2 (a varchar(10), foreign key (a) references t1(a)) engine = $engine_type;

create table t1(a varchar(10) primary key) engine = $engine_type;

create table t2 (a varchar(10), foreign key (a) references t1(a)) engine = $engine_type DEFAULT CHARSET=latin1;

create table t1(a varchar(10) primary key) engine = $engine_type DEFAULT CHARSET=latin1;

create table t2 (a varchar(10), foreign key (a) references t1(a)) engine = $engine_type DEFAULT CHARSET=latin1;

create table t3(a varchar(10) primary key) engine = $engine_type DEFAULT CHARSET=utf8;

create table t1(a int primary key) row_format=redundant engine=$engine_type;

create table t2(a int primary key,constraint foreign key(a)references t1(a)) row_format=compact engine=$engine_type;

create table t3(a int primary key) row_format=compact engine=$engine_type;

create table t4(a int primary key,constraint foreign key(a)references t3(a)) row_format=redundant engine=$engine_type;

create table t1 (a varchar(255) character set utf8,
                 b varchar(255) character set utf8,
                 c varchar(255) character set utf8,
                 d varchar(255) character set utf8,
                 key (a,b,c,d)) engine=$engine_type;

create table t1 (a varchar(255) character set utf8,
                 b varchar(255) character set utf8,
                 c varchar(255) character set utf8,
                 d varchar(255) character set utf8,
                 e varchar(255) character set utf8,
                 key (a,b,c,d,e)) engine=$engine_type;

create table t1 (s1 varbinary(2),primary key (s1)) engine=$engine_type;

create table t2 (s1 binary(2),primary key (s1)) engine=$engine_type;

create table t3 (s1 varchar(2) binary,primary key (s1)) engine=$engine_type;

create table t4 (s1 char(2) binary,primary key (s1)) engine=$engine_type;

create table t1 (a int primary key,s1 varbinary(3) not null unique) engine=$engine_type;

create table t2 (s1 binary(2) not null, constraint c foreign key(s1) references t1(s1) on update cascade) engine=$engine_type;

create table t1 (a int primary key,s1 varchar(2) binary not null unique) engine=$engine_type;

create table t2 (s1 char(2) binary not null, constraint c foreign key(s1) references t1(s1) on update cascade) engine=$engine_type;

CREATE TABLE t1(a INT, PRIMARY KEY(a)) ENGINE=$engine_type;

CREATE TABLE t2(a INT) ENGINE=$engine_type;

CREATE TABLE t2;

create table t1(a int not null, b int, c int, d int, primary key(a)) engine=$engine_type;

create table t1(a int not null, b int, c int, d int, primary key(a)) engine=$engine_type;

create table t2(a int not null, b int, c int, d int, primary key(a)) engine=$engine_type;

create table t3(a int not null, b int, c int, d int, primary key(a)) engine=$engine_type;

create table t4(a int not null, b int, c int, d int, primary key(a)) engine=$engine_type;

create table t5(a int not null, b int, c int, d int, primary key(a)) engine=$engine_type;

CREATE TABLE t1 (
  field1 varchar(8) NOT NULL DEFAULT '',
  field2 varchar(8) NOT NULL DEFAULT '',
  PRIMARY KEY  (field1, field2)
) ENGINE=$engine_type;

CREATE TABLE t2 (
  field1 varchar(8) NOT NULL DEFAULT '' PRIMARY KEY,
  FOREIGN KEY (field1) REFERENCES t1 (field1)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=$engine_type;

create table t1 (
  c1 bigint not null,
  c2 bigint not null,
  primary key (c1),
  unique  key (c2)
) engine=$engine_type;

create table t2 (
  c1 bigint not null,
  primary key (c1)
) engine=$engine_type;

create table t1;

create table t1;

create table t1(a date) engine=$engine_type;

create table t2(a date, key(a)) engine=$engine_type;

create table t1 (id int not null, f_id int not null, f int not null,
primary key(f_id, id)) engine=$engine_type;

create table t2 (id int not null,s_id int not null,s varchar(200),
primary key(id)) engine=$engine_type;

create table t1(a int not null, b int, primary key(a)) engine=$engine_type;

create table t1(a int not null, b int, primary key(a)) engine=$engine_type;

create table t1(a int not null, b int, primary key(a)) engine=$engine_type;

create table t2(d int not null, e int, primary key(d)) engine=$engine_type;

create table t3(d int not null, e int, primary key(d)) engine=$engine_type
select * from t2;

create table t1(a int not null, b int, primary key(a));

create table t2(a int not null, b int, primary key(a));

create table t3(d int not null, b int, primary key(d));

create table t5(a int not null, b int, primary key(a));

create table t6(d int not null, e int, primary key(d));

create table t8(a int not null, b int, primary key(a));

create table t9(d int not null, e int, primary key(d));

create table t4(a int not null, b int, primary key(a)) select * from t2;

create table t7(a int not null, b int, primary key(a)) select * from t2 lock in share mode;

create table t10(a int not null, b int, primary key(a)) select * from t2 for update;

CREATE TABLE t1 (DB_ROW_ID int) engine=$engine_type;

CREATE TABLE t1 (
   a BIGINT(20) NOT NULL,
    PRIMARY KEY  (a)
 ) ENGINE=$engine_type DEFAULT CHARSET=UTF8;

CREATE TABLE t2 (
  a BIGINT(20) NOT NULL,
  b VARCHAR(128) NOT NULL,
  c TEXT NOT NULL,
  PRIMARY KEY  (a,b),
  KEY idx_t2_b_c (b,c(200)),
  CONSTRAINT t_fk FOREIGN KEY (a) REFERENCES t1 (a)
   ON DELETE CASCADE
 ) ENGINE=$engine_type DEFAULT CHARSET=UTF8;

create table t1 (g geometry not null, spatial gk(g)) engine=$engine_type;

CREATE TABLE t1 ( a int ) ENGINE=$engine_type;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE t2 ADD FOREIGN KEY (a) REFERENCES t1(a);

ALTER TABLE t2 DROP FOREIGN KEY t2_ibfk_1;

ALTER TABLE t2 ADD CONSTRAINT t2_ibfk_0 FOREIGN KEY (a) REFERENCES t1(a);

ALTER TABLE t2 DROP FOREIGN KEY t2_ibfk_0;

alter table t1 add constraint c2_fk foreign key (c2)
  references t2(c1) on delete cascade;

alter table t1 drop foreign key c2_fk;

