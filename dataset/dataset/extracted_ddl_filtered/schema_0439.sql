-- Source: https://github.com/wumingmin/debeziumResource/blob/a638d5599b1d3fb8f1545a4ce858cf368eb0c186/integration-tests/mysql/debezium-connector-mysql-5.7-gtid-integration-tests/src/test/docker/init/setup.sql?raw=true
-- Tables detected: 19 | FK/REFERENCES mentions: 12

CREATE TABLE products (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(512),
  weight FLOAT
);

CREATE TABLE products_on_hand (
  product_id INTEGER NOT NULL PRIMARY KEY,
  quantity INTEGER NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE customers (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE KEY
) AUTO_INCREMENT=1001;

CREATE TABLE orders (
  order_number INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_date DATE NOT NULL,
  purchaser INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  FOREIGN KEY order_customer (purchaser) REFERENCES customers(id),
  FOREIGN KEY ordered_product (product_id) REFERENCES products(id)
) AUTO_INCREMENT = 10001;

CREATE TABLE products (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(512),
  weight FLOAT
);

CREATE TABLE products_on_hand (
  product_id INTEGER NOT NULL PRIMARY KEY,
  quantity INTEGER NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id)
);

CREATE TABLE customers (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE KEY
) AUTO_INCREMENT=1001;

CREATE TABLE orders (
  order_number INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  order_date DATE NOT NULL,
  purchaser INTEGER NOT NULL,
  quantity INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  FOREIGN KEY order_customer (purchaser) REFERENCES customers(id),
  FOREIGN KEY ordered_product (product_id) REFERENCES products(id)
) AUTO_INCREMENT = 10001;

CREATE TABLE t1464075356413_testtable6 (
  pk_column int auto_increment NOT NULL,
  varbinary_col varbinary(20) NOT NULL,
  PRIMARY KEY(pk_column)
);

CREATE TABLE dbz84_integer_types_table (
  -- The column lengths are used for display purposes, and do not affect the range of values
  colTinyIntA tinyint NOT NULL DEFAULT 100,
  colTinyIntB tinyint(1) NOT NULL DEFAULT 101,
  colTinyIntC tinyint(2) UNSIGNED NOT NULL DEFAULT 102,
  colTinyIntD tinyint(3) UNSIGNED NOT NULL DEFAULT 103,
  colSmallIntA smallint NOT NULL DEFAULT 200,
  colSmallIntB smallint(1) NOT NULL DEFAULT 201,
  colSmallIntC smallint(2) NOT NULL DEFAULT 201,
  colSmallIntD smallint(3) NOT NULL DEFAULT 201,
  colMediumIntA mediumint NOT NULL DEFAULT 300,
  colMediumIntB mediumint(1) NOT NULL DEFAULT 301,
  colMediumIntC mediumint(2) NOT NULL DEFAULT 302,
  colMediumIntD mediumint(3) NOT NULL DEFAULT 303,
  colIntA int NOT NULL DEFAULT 400,
  colIntB int(1) NOT NULL DEFAULT 401,
  colIntC int(2) NOT NULL DEFAULT 402,
  colIntD int(3) NOT NULL DEFAULT 403,
  colBigIntA bigint NOT NULL DEFAULT 500,
  colBigIntB bigint(1) NOT NULL DEFAULT 501,
  colBigIntC bigint(2) NOT NULL DEFAULT 502,
  colBigIntD bigint(3) NOT NULL DEFAULT 503
);

CREATE TABLE dbz_85_fractest (
  c1 DATE,
  c2 TIME(2),
  c3 DATETIME(2),
  c4 TIMESTAMP(2)
);

CREATE TABLE dbz_100_enumsettest (
  c1 ENUM('a','b','c'),
  c2 SET('a','b','c')
);

CREATE TABLE dbz_102_charsettest (
  id INT(11) NOT NULL AUTO_INCREMENT,
  text VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8;

CREATE TABLE dbz_114_zerovaluetest (
  c1 DATE,
  c2 TIME(2),
  c3 DATETIME(2),
  c4 TIMESTAMP(2)
);

CREATE TABLE dbz_123_bitvaluetest (
  c1 BIT,
  c2 BIT(2),
  c3 BIT(8) NOT NULL,
  c4 BIT(64)
);

create table like ...
CREATE TABLE dbz_104_customers LIKE connector_test.customers;

CREATE TABLE dbz_147_decimalvalues (
  pk_column int auto_increment NOT NULL,
  decimal_value decimal(7,2) NOT NULL,
  PRIMARY KEY(pk_column)
);

CREATE TABLE dbz_126_jsontable (
  id INT AUTO_INCREMENT NOT NULL,
  json JSON,
  expectedJdbcStr VARCHAR(256), -- value that we get back from JDBC
  expectedBinlogStr VARCHAR(256), -- value we parse from the binlog
  PRIMARY KEY(id)
) DEFAULT CHARSET=utf8;

CREATE TABLE dbz_342_timetest (
  c1 TIME(2),
  c2 TIME(0),
  c3 TIME(3),
  c4 TIME(3),
  c5 TIME(6)
);

