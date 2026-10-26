-- Source: https://github.com/luke0x/connector/blob/007a44f6f1c99eccd1ac34094e9431dbeab97f35/vendor/rails/activerecord/test/fixtures/db_definitions/firebird.sql?raw=true
-- Tables detected: 33 | FK/REFERENCES mentions: 2

CREATE TABLE accounts (
  id BIGINT NOT NULL,
  firm_id BIGINT,
  credit_limit INTEGER,
  PRIMARY KEY (id)
);

CREATE TABLE funny_jokes (
  id BIGINT NOT NULL,
  name VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE companies (
  id BIGINT NOT NULL,
  "TYPE" VARCHAR(50),
  ruby_type VARCHAR(50),
  firm_id BIGINT,
  name VARCHAR(50),
  client_of INTEGER,
  rating INTEGER DEFAULT 1,
  PRIMARY KEY (id)
);

CREATE TABLE topics (
  id BIGINT NOT NULL,
  title VARCHAR(255),
  author_name VARCHAR(255),
  author_email_address VARCHAR(255),
  written_on TIMESTAMP,
  bonus_time TIME,
  last_read DATE,
  content VARCHAR(4000),
  approved D_BOOLEAN DEFAULT 1,
  replies_count INTEGER DEFAULT 0,
  parent_id BIGINT,
  "TYPE" VARCHAR(50),
  PRIMARY KEY (id)
);

CREATE TABLE developers (
  id BIGINT NOT NULL,
  name VARCHAR(100),
  salary INTEGER DEFAULT 70000,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE projects (
  id BIGINT NOT NULL,
  name VARCHAR(100),
  "TYPE" VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE developers_projects (
  developer_id BIGINT NOT NULL,
  project_id BIGINT NOT NULL,
  joined_on DATE,
  access_level SMALLINT DEFAULT 1
);

CREATE TABLE orders (
  id BIGINT NOT NULL,
  name VARCHAR(100),
  billing_customer_id BIGINT,
  shipping_customer_id BIGINT,
  PRIMARY KEY (id)
);

CREATE TABLE customers (
  id BIGINT NOT NULL,
  name VARCHAR(100),
  balance INTEGER DEFAULT 0,
  address_street VARCHAR(100),
  address_city VARCHAR(100),
  address_country VARCHAR(100),
  gps_location VARCHAR(100),
  PRIMARY KEY (id)
);

CREATE TABLE movies (
  movieid BIGINT NOT NULL,
  name varchar(100),
  PRIMARY KEY (movieid)
);

CREATE TABLE subscribers (
  nick VARCHAR(100) NOT NULL,
  name VARCHAR(100),
  PRIMARY KEY (nick)
);

CREATE TABLE booleantests (
  id BIGINT NOT NULL,
  "VALUE" D_BOOLEAN,
  PRIMARY KEY (id)
);

CREATE TABLE auto_id_tests (
  auto_id BIGINT NOT NULL,
  "VALUE" INTEGER,
  PRIMARY KEY (auto_id)
);

CREATE TABLE entrants (
  id BIGINT NOT NULL,
  name VARCHAR(255) NOT NULL,
  course_id INTEGER NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE colnametests (
  id BIGINT NOT NULL,
  "REFERENCES" INTEGER NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE mixins (
  id BIGINT NOT NULL,
  parent_id BIGINT,
  pos INTEGER,
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  lft INTEGER,
  rgt INTEGER,
  root_id BIGINT,
  "TYPE" VARCHAR(40),
  PRIMARY KEY (id)
);

CREATE TABLE people (
  id BIGINT NOT NULL,
  first_name VARCHAR(40),
  lock_version INTEGER DEFAULT 0 NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE readers (
    id BIGINT NOT NULL,
    post_id BIGINT NOT NULL,
    person_id BIGINT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE binaries (
  id BIGINT NOT NULL,
  data BLOB,
  PRIMARY KEY (id)
);

CREATE TABLE computers (
  id BIGINT NOT NULL,
  developer INTEGER NOT NULL,
  "extendedWarranty" INTEGER NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE posts (
  id BIGINT NOT NULL,
  author_id BIGINT,
  title VARCHAR(255) NOT NULL,
  "TYPE" VARCHAR(255) NOT NULL,
  body VARCHAR(3000) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE comments (
  id BIGINT NOT NULL,
  post_id BIGINT NOT NULL,
  "TYPE" VARCHAR(255) NOT NULL,
  body VARCHAR(3000) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE authors (
  id BIGINT NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tasks (
  id BIGINT NOT NULL,
  "STARTING" TIMESTAMP,
  ending TIMESTAMP,
  PRIMARY KEY (id)
);

CREATE TABLE categories (
  id BIGINT NOT NULL,
  name VARCHAR(255) NOT NULL,
  "TYPE" VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE categories_posts (
  category_id BIGINT NOT NULL,
  post_id BIGINT NOT NULL,
  PRIMARY KEY (category_id, post_id)
);

CREATE TABLE fk_test_has_pk (
  id BIGINT NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE fk_test_has_fk (
  id BIGINT NOT NULL,
  fk_id BIGINT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (fk_id) REFERENCES fk_test_has_pk(id)
);

CREATE TABLE keyboards (
  key_number BIGINT NOT NULL,
  name VARCHAR(50),
  PRIMARY KEY (key_number)
);

CREATE TABLE defaults (
  id BIGINT NOT NULL,
  default_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE legacy_things (
  id BIGINT NOT NULL,
  tps_report_number INTEGER,
  version INTEGER DEFAULT 0 NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE numeric_data (
  id BIGINT NOT NULL,
  bank_balance DECIMAL(10,2),
  big_bank_balance DECIMAL(15,2),
  world_population DECIMAL(10),
  my_house_population DECIMAL(2),
  decimal_number_with_default DECIMAL(3,2) DEFAULT 2.78,
  PRIMARY KEY (id)
);

CREATE TABLE mixed_case_monkeys (
 "monkeyID" BIGINT NOT NULL,
 "fleaCount" INTEGER
);

