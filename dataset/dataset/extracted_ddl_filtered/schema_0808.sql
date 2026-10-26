-- Source: https://github.com/northhurricane/mysql-5.7.23/blob/12d0efc0e607466987019dbeb62217d1b933eeac/mysql-test/include/mix1.inc?raw=true
-- Tables detected: 92 | FK/REFERENCES mentions: 33

create table t1 (
  c_id int(11) not null default '0',
  org_id int(11) default null,
  unique key contacts$c_id (c_id),
  key contacts$org_id (org_id)
);

create table t2 (
  slai_id int(11) not null default '0',
  owner_tbl int(11) default null,
  owner_id int(11) default null,
  sla_id int(11) default null,
  inc_web int(11) default null,
  inc_email int(11) default null,
  inc_chat int(11) default null,
  inc_csr int(11) default null,
  inc_total int(11) default null,
  time_billed int(11) default null,
  activedate timestamp null default null,
  expiredate timestamp null default null,
  state int(11) default null,
  sla_set int(11) default null,
  unique key t2$slai_id (slai_id),
  key t2$owner_id (owner_id),
  key t2$sla_id (sla_id)
);

CREATE TABLE t1 (a int, b int, KEY b (b));

CREATE TABLE t2 (a int, b int, PRIMARY KEY  (a,b));

CREATE TABLE t3 (a int, b int, c int, PRIMARY KEY  (a),
  UNIQUE KEY b (b,c), KEY a (a,b,c));

CREATE TABLE `t1` (`id1` INT) ;

CREATE TABLE `t2` (
  `id1` INT,
  `id2` INT NOT NULL,
  `id3` INT,
  `id4` INT NOT NULL,
  UNIQUE (`id2`,`id4`),
  KEY (`id1`)
);

create table t1 (c1 int) engine=innodb;

CREATE TABLE t1(c1 TEXT, UNIQUE (c1(1)), cnt INT DEFAULT 1)
  ENGINE=INNODB CHARACTER SET UTF8;

CREATE TABLE t1(c1 VARCHAR(2), UNIQUE (c1(1)), cnt INT DEFAULT 1)
  ENGINE=INNODB CHARACTER SET UTF8;

CREATE TABLE t1(c1 CHAR(2), UNIQUE (c1(1)), cnt INT DEFAULT 1)
  ENGINE=INNODB CHARACTER SET UTF8;

CREATE TABLE t1 (
  a1 decimal(10,0) DEFAULT NULL,
  a2 blob,
  a3 time DEFAULT NULL,
  a4 blob,
  a5 char(175) DEFAULT NULL,
  a6 timestamp NOT NULL DEFAULT '2000-01-01 01:01:01',
  a7 tinyblob,
  INDEX idx (a6,a7(239),a5)
) ENGINE=InnoDB;

create table t1m (a int) engine = $other_engine_type;

create table t1i (a int);

create table t2m (a int) engine = $other_engine_type;

create table t2i (a int);

create table t1 (
  a1 char(64), a2 char(64), b char(16), c char(16) not null, d char(16), dummy char(64) default ' '
) ENGINE = $other_engine_type;

create table t4 (
  pk_col int auto_increment primary key, a1 char(64), a2 char(64), b char(16), c char(16) not null, d char(16), dummy char(64) default ' '
);

CREATE TABLE t1 (i INT NOT NULL PRIMARY KEY) ENGINE= InnoDB;

CREATE TABLE t2 (
  i INT NOT NULL,
  FOREIGN KEY (i) REFERENCES t1 (i) ON DELETE NO ACTION
) ENGINE= InnoDB;

create table t1 (
  a varchar(30), b varchar(30), primary key(a), key(b)
);

create table t1(a int, key(a));

create table t1 (f1 int, f2 char(1), primary key(f1,f2)) stats_persistent=0;

CREATE TABLE t1 (id int(11) NOT NULL PRIMARY KEY, name varchar(20),
                 INDEX (name));

CREATE TABLE t2 (id int(11) NOT NULL PRIMARY KEY, fkey int(11));

CREATE TABLE t2 (id int(11) NOT NULL PRIMARY KEY, fkey int(11),
#                  FOREIGN KEY (fkey) REFERENCES t2(id));

CREATE TABLE t1 (
  id int NOT NULL,
  name varchar(20) NOT NULL,
  dept varchar(20) NOT NULL,
  age tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (id),
  INDEX (name,dept)
) ENGINE=InnoDB STATS_PERSISTENT=0;

CREATE TABLE `test` (`test1` varchar(3) NOT NULL,
  `test2` varchar(4) NOT NULL,PRIMARY KEY  (`test1`))
  ENGINE=InnoDB DEFAULT CHARSET=latin1;

create table t1(
id int auto_increment,
c char(1) not null,
counter int not null default 1,
primary key (id),
unique key (c)
) engine=innodb;

CREATE TABLE t1(
  id int AUTO_INCREMENT PRIMARY KEY,
  stat_id int NOT NULL,
  acct_id int DEFAULT NULL,
  INDEX idx1 (stat_id, acct_id),
  INDEX idx2 (acct_id)
) ENGINE=MyISAM;

CREATE TABLE t2(
  id int AUTO_INCREMENT PRIMARY KEY,
  stat_id int NOT NULL,
  acct_id int DEFAULT NULL,
  INDEX idx1 (stat_id, acct_id),
  INDEX idx2 (acct_id)
) ENGINE=InnoDB STATS_PERSISTENT=0;

create table t1(a int) engine=innodb;

create table t1;

CREATE TABLE t1 (a CHAR(2), KEY (a)) ENGINE = InnoDB DEFAULT CHARSET=UTF8;

CREATE TABLE t2 (a CHAR(2), KEY (a)) ENGINE = InnoDB;

CREATE TABLE t3 (a CHAR(2), KEY (a)) ENGINE = MyISAM;

create table t1 (a int) engine=innodb;

create table bug29807 (a int);

CREATE TABLE t1 (a INT) ENGINE=InnoDB;

CREATE TABLE t2 (a INT) ENGINE=InnoDB;

CREATE TABLE t1 (
  id int NOT NULL auto_increment PRIMARY KEY,
  b int NOT NULL,
  c datetime NOT NULL,
  INDEX idx_b(b),
  INDEX idx_c(c)
) ENGINE=InnoDB;

CREATE TABLE t2 (
  b int NOT NULL auto_increment PRIMARY KEY,
  c datetime NOT NULL
) ENGINE= MyISAM;

CREATE TABLE t1 (a int, b int);

CREATE TABLE t2 (primary key (a)) select * from t1;

CREATE TABLE t2 (a int, b int, primary key (a));

CREATE TABLE IF NOT EXISTS t2 (primary key (a)) select * from t1;

create table t1(f1 varchar(800) binary not null, key(f1))
  character set utf8 collate utf8_general_ci;

CREATE TABLE t1 (a INT PRIMARY KEY, b INT, c FLOAT, KEY b(b)) ENGINE = INNODB;

create table t1 (a int) engine=innodb;

create table t24918_access (id int);

create table t24918 (id int) engine=myisam;

create table t24918_trans (id int) engine=innodb;

CREATE TABLE t1 (a int, b int, PRIMARY KEY (a), KEY bkey (b)) ENGINE=InnoDB;

CREATE TABLE t2 (a int, b int, c int, PRIMARY KEY (a), KEY bkey (b,c))
  ENGINE=InnoDB;

CREATE TABLE t1 (a INT, PRIMARY KEY (a)) ENGINE=InnoDB;

create table t1(a text) engine=innodb default charset=utf8;

create table t1;

CREATE TABLE t1 (
  a INT,
  b INT,
  KEY (b)
) ENGINE=InnoDB;

CREATE TABLE t1(
  a INT, 
  b INT NOT NULL, 
  c INT NOT NULL, 
  d INT, 
  UNIQUE KEY (c,b)
) engine=innodb;

CREATE TABLE t1 (a INT, b INT, PRIMARY KEY (a), INDEX b (b)) ENGINE=InnoDB;

CREATE TABLE t1(c INT)
  ENGINE = InnoDB
  ROW_FORMAT = COMPACT;

create table t1(a char(10) not null, unique key aa(a(1)),
                b char(4) not null, unique key bb(b(4))) engine=innodb;

create table t1;

CREATE TABLE t1 (id int, type char(6), d int, INDEX idx(id,d)) ENGINE=InnoDB;

CREATE TABLE t1 (a int, b int, c int, PRIMARY KEY (a), KEY t1_b (b))
 ENGINE=InnoDB;

CREATE TABLE t1 (a char(50)) ENGINE=InnoDB;

CREATE TABLE t1 (f1 INTEGER PRIMARY KEY COMMENT 'My ID#', f2 INTEGER DEFAULT NULL, f3 CHAR(10) DEFAULT 'My ID#', CONSTRAINT f2_ref FOREIGN KEY (f2) REFERENCES t1 (f1)) ENGINE=INNODB;

CREATE TABLE t1;

create table t1 (a bit(1) not null,b int) engine=myisam;

create table t2 (c int) engine=innodb;

CREATE TABLE `t2` (
  `k` int(11) NOT NULL auto_increment,
  `a` int(11) default NULL,
  `c` int(11) default NULL,
  PRIMARY KEY  (`k`),
  UNIQUE KEY `idx_1` (`a`)
);

create table t1 (i int);

create table t1 (i int);

create table t1(f1 varchar(5) unique, f2 timestamp NOT NULL DEFAULT
  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

CREATE TABLE t1 (a INT PRIMARY KEY, b VARCHAR(256))
ENGINE = $engine_type;

CREATE TABLE t2 (a INT);

Create table with identical constraint names behaves incorrectly
#

if ($test_foreign_keys)
{
  CREATE TABLE t1 (a INT NOT NULL, b INT NOT NULL, PRIMARY KEY (a,b)) engine=innodb;

CREATE TABLE t2 (c INT NOT NULL, d INT NOT NULL, PRIMARY KEY (c,d),
                  CONSTRAINT c2 FOREIGN KEY f2 (c) REFERENCES t1 (a,b) ON UPDATE NO ACTION) engine=innodb;

CREATE TABLE t2 (c INT NOT NULL, d INT NOT NULL, PRIMARY KEY (c,d),
                  CONSTRAINT c2 FOREIGN KEY (c) REFERENCES t1 (a,b) ON UPDATE NO ACTION) engine=innodb;

CREATE TABLE t2 (c INT NOT NULL, d INT NOT NULL, PRIMARY KEY (c,d),
                  CONSTRAINT c1 FOREIGN KEY c2 (c) REFERENCES t1 (a) ON DELETE NO ACTION,
                  CONSTRAINT c2 FOREIGN KEY (c) REFERENCES t1 (a) ON UPDATE NO ACTION) engine=innodb;

CREATE TABLE t2 (c INT NOT NULL, d INT NOT NULL, PRIMARY KEY (c,d),
                  FOREIGN KEY (c) REFERENCES t1 (a,k) ON UPDATE NO ACTION) engine=innodb;

CREATE TABLE t2 (c INT NOT NULL, d INT NOT NULL, PRIMARY KEY (c,d),
                  FOREIGN KEY f1 (c) REFERENCES t1 (a,k) ON UPDATE NO ACTION) engine=innodb;

CREATE TABLE t2 (c INT NOT NULL, d INT NOT NULL, PRIMARY KEY (c,d),
                  CONSTRAINT c1 FOREIGN KEY f1 (c) REFERENCES t1 (a) ON DELETE NO ACTION,
                  CONSTRAINT c2 FOREIGN KEY (c) REFERENCES t1 (a) ON UPDATE NO ACTION,
                  FOREIGN KEY f3 (c) REFERENCES t1 (a) ON UPDATE NO ACTION,
                  FOREIGN KEY (c) REFERENCES t1 (a) ON UPDATE NO ACTION) engine=innodb;

CREATE TABLE t2;

create table t1 (a int auto_increment primary key) engine=innodb;

CREATE TABLE t1
  (vid integer NOT NULL,
   tid integer NOT NULL,
   idx integer NOT NULL,
   name varchar(128) NOT NULL,
   type varchar(128) NULL,
   PRIMARY KEY(idx, vid, tid),
   UNIQUE(vid, tid, name)
) ENGINE=InnoDB;

CREATE TABLE t1 (c1 INT, c2 INT, c3 INT, KEY (c3), KEY (c2, c3))
  ENGINE=$engine_type;

CREATE TABLE t1 (c1 REAL, c2 REAL, c3 REAL, KEY (c3), KEY (c2, c3))
  ENGINE=$engine_type;

CREATE TABLE t1 (c1 DECIMAL(12,2), c2 DECIMAL(12,2), c3 DECIMAL(12,2), 
  KEY (c3), KEY (c2, c3))
  ENGINE=$engine_type;

CREATE TABLE t1 (
  a int NOT NULL
) engine= innodb;

CREATE TABLE t2 (
  a int NOT NULL,
  b int NOT NULL,
  filler char(100) DEFAULT NULL,
  KEY a (a,b)
) engine= innodb;

CREATE TABLE t1 (a INT) ENGINE=$engine_type;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE t2 ADD FOREIGN KEY (fkey) REFERENCES t2(id);

ALTER TABLE t2 DROP FOREIGN KEY c2;

