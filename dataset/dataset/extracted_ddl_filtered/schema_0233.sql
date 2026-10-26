-- Source: https://github.com/lvxin1986/bluedolphin/blob/adacde77915235a8db57c314a13f5c65d922fbad/mysql-5.7.17/mysql-test/include/mysqlpump_stmt.inc?raw=true
-- Tables detected: 25 | FK/REFERENCES mentions: 10

CREATE TABLE dt1 (a INT);

CREATE TABLE dt2 (a INT, b VARCHAR(10), primary key(a));

CREATE TABLE dt3 (`a"b"` char(2));

CREATE TABLE categories(
   c_id int not null auto_increment primary key,
   c_name varchar(255) not null,
   c_description text,
   UNIQUE(c_id, c_name)
) ENGINE=InnoDB;

CREATE TABLE products(
   p_id int not null auto_increment primary key,
   p_name varchar(355) not null,
   p_price decimal,
   c_id int not null,
   FOREIGN KEY fk_categories(c_id)
   REFERENCES categories(c_id)
   ON UPDATE CASCADE
   ON DELETE RESTRICT
)ENGINE=InnoDB;

CREATE TABLE vendors(
    v_id int not null auto_increment primary key,
    v_name varchar(255)
)ENGINE=InnoDB;

CREATE TABLE d2t1 (
   id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
   fname VARCHAR(200) NOT NULL,
   lname  VARCHAR(60) ,
   phone VARCHAR(15) DEFAULT NULL,
   created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   eid tinyint NOT NULL DEFAULT 011,
  PRIMARY KEY (id),
  UNIQUE(id,fname)
)
ENGINE = InnoDB;

CREATE TABLE d2t2 (
   id INT PRIMARY KEY AUTO_INCREMENT,
   fname VARCHAR(200) NOT NULL,
   lname  VARCHAR(60) ,
   phone VARCHAR(15) DEFAULT NULL,
   created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
   eid tinyint NOT NULL DEFAULT 011,
   KEY d2t2_index2 (fname,eid),
  KEY d2t2_index3 (Id,eid)
)
ENGINE = InnoDB;

CREATE TABLE d3t1 (a INT);

CREATE TABLE d3t2 (a INT, b VARCHAR(10), primary key(a));

CREATE TABLE d3t3 (`a"b"` char(2));

CREATE TABLE d3t4 (`x"z"` int,xyz varchar(20),notes text);

CREATE TABLE parent (
    id INT NOT NULL,
    PRIMARY KEY (id)
) ENGINE=INNODB;

CREATE TABLE child (
    id INT,
    parent_id INT,
    INDEX par_ind (parent_id),
    FOREIGN KEY (parent_id)
        REFERENCES parent(id)
        ON DELETE CASCADE
) ENGINE=INNODB;

CREATE TABLE product (
    category INT NOT NULL, id INT NOT NULL,
    price DECIMAL,
    PRIMARY KEY(category, id)
)   ENGINE=INNODB;

CREATE TABLE customer (
    id INT NOT NULL,
    PRIMARY KEY (id)
)   ENGINE=INNODB;

CREATE TABLE product_order (
    no INT NOT NULL AUTO_INCREMENT,
    product_category INT NOT NULL,
    product_id INT NOT NULL,
    customer_id INT NOT NULL,
    PRIMARY KEY(no),
    INDEX (product_category, product_id),
    INDEX (customer_id),
    FOREIGN KEY (product_category, product_id)
      REFERENCES product(category, id)
      ON UPDATE CASCADE ON DELETE RESTRICT,
    FOREIGN KEY (customer_id)
      REFERENCES customer(id)
)ENGINE=INNODB;

CREATE TABLE `db1_1gb`.`customer` (
`C_CUSTKEY` int(11) NOT NULL,
`C_NAME` varchar(25) NOT NULL,
`C_ADDRESS` varchar(40) NOT NULL,
`C_nationKEY` mediumint(9) NOT NULL,
`C_PHONE` char(15) NOT NULL,
`C_ACCTBAL` double(8,2) NOT NULL,
`C_MKTSEGMENT` char(10) NOT NULL,
`C_COMMENT` varchar(117) NOT NULL,
`C_SUMMARY` mediumblob NOT NULL,
`C_ISACTIVE` tinyint(1) DEFAULT NULL,
PRIMARY KEY (`C_CUSTKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `db1_1gb`.`lineitem` (
`L_ORDERKEY` int(11) NOT NULL,
`L_partKEY` int(11) NOT NULL,
`L_SUPPKEY` int(11) NOT NULL,
`L_LINENUMBER` bigint(20) NOT NULL,
`L_QUANTITY` double NOT NULL,
`L_EXTENDEDPRICE` decimal(15,2) NOT NULL,
`L_DISCOUNT` float NOT NULL,
`L_TAX` decimal(15,2) NOT NULL,
`L_RETURNFLAG` char(1) DEFAULT NULL,
`L_LINESTATUS` tinytext NOT NULL,
`L_SHIPDATE` datetime NOT NULL,
`L_COMMITDATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
`L_RECEIPTDATE` date DEFAULT NULL,
`L_SHIPINSTRUCT` text NOT NULL,
`L_SHIPMODE` enum('ROAD','RAIL','SEA','AIR','TRUCK','MAIL','FOB','SHIP','REG AIR') DEFAULT NULL,
`L_COMMENT` longtext NOT NULL,
`L_TAGS` char(50) DEFAULT NULL,
PRIMARY KEY (`L_ORDERKEY`,`L_LINENUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `db1_1gb`.`nation` (
`N_nationKEY` int(11) NOT NULL,
`N_NAME` char(25) NOT NULL,
`N_regionKEY` int(11) NOT NULL,
`N_COMMENT` mediumtext,
PRIMARY KEY (`N_nationKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `db1_1gb`.`orders` (
`O_ORDERKEY` int(11) NOT NULL,
`O_CUSTKEY` int(11) NOT NULL,
`O_ordersTATUS` char(20) NOT NULL,
`O_TOTALPRICE` decimal(15,2) NOT NULL,
`O_ORDERDATE` date NOT NULL,
`O_ORDERPRIORITY` char(15) NOT NULL,
`O_CLERK` char(15) NOT NULL,
`O_SHIPPRIORITY` tinyint(4) NOT NULL,
`O_COMMENT` blob NOT NULL,
`O_ORDERYEAR` year(4) NOT NULL,
`O_SUMMARY` longblob NOT NULL,
PRIMARY KEY (`O_ORDERKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `db1_1gb`.`part` (
`P_partKEY` int(11) NOT NULL,
`P_NAME` varchar(55) NOT NULL,
`P_MFGR` char(25) NOT NULL,
`P_BRAND` binary(16) NOT NULL,
`P_TYPE` varbinary(128) NOT NULL,
`P_SIZE` smallint(6) NOT NULL,
`P_CONTAINER` char(10) NOT NULL,
`P_RETAILPRICE` decimal(15,2) NOT NULL,
`P_COMMENT` varchar(23) NOT NULL,
`P_SUMMARY` tinyblob NOT NULL,
PRIMARY KEY (`P_partKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `db1_1gb`.`partsupp` (
`PS_partKEY` int(11) NOT NULL,
`PS_SUPPKEY` int(11) NOT NULL,
`PS_AVAILQTY` int(11) NOT NULL,
`PS_SUPPLYCOST` float NOT NULL,
`PS_COMMENT` varchar(199) NOT NULL,
PRIMARY KEY (`PS_partKEY`,`PS_SUPPKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `db1_1gb`.`region` (
`R_regionKEY` int(11) NOT NULL,
`R_NAME` char(25) NOT NULL,
`R_COMMENT` longtext,
PRIMARY KEY (`R_regionKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `db1_1gb`.`supplier` (
`S_SUPPKEY` int(11) NOT NULL,
`S_NAME` char(25) NOT NULL,
`S_ADDRESS` varchar(40) NOT NULL,
`S_nationKEY` int(11) NOT NULL,
`S_PHONE` char(15) NOT NULL,
`S_ACCTBAL` decimal(15,2) NOT NULL,
`S_COMMENT` varchar(101) NOT NULL,
`S_SUMMARY` blob NOT NULL,
PRIMARY KEY (`S_SUPPKEY`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE products
ADD FOREIGN KEY fk_vendor(v_id)
REFERENCES vendors(v_id)
ON DELETE NO ACTION
ON UPDATE CASCADE;

