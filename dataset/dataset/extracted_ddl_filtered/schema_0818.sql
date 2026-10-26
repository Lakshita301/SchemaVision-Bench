-- Source: https://github.com/sbaldwin1/BaldwinSandy_CIS12_48075/blob/f299098d616f1ac1f7e6b8e9e7bae85d04336f18/Proj/V6/Business/sql.sql?raw=true
-- Tables detected: 18 | FK/REFERENCES mentions: 6

CREATE TABLE users (
user_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
email VARCHAR(60) NOT NULL,
pass CHAR(40) NOT NULL,
registration_date DATETIME NOT NULL,
PRIMARY KEY (user_id)
);

CREATE TABLE forums (
forum_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(60) NOT NULL,
PRIMARY KEY (forum_id),
UNIQUE (name)
) ENGINE = INNODB;

CREATE TABLE messages (
message_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
parent_id INT UNSIGNED NOT NULL DEFAULT 0,
forum_id TINYINT UNSIGNED NOT NULL,
user_id MEDIUMINT UNSIGNED NOT NULL,
subject VARCHAR(100) NOT NULL,
body LONGTEXT NOT NULL,
date_entered DATETIME NOT NULL,
PRIMARY KEY (message_id),
INDEX (parent_id),
INDEX (forum_id),
INDEX (user_id),
INDEX (date_entered)
) ENGINE = MYISAM;

CREATE TABLE users (
user_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
pass CHAR(40) NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
email VARCHAR(60) NOT NULL,
PRIMARY KEY (user_id),
UNIQUE (username),
UNIQUE (email),
INDEX login (pass, email)
) ENGINE = INNODB;

CREATE TABLE customers (
customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
PRIMARY KEY (customer_id),
INDEX full_name (last_name, first_name)
) ENGINE = INNODB;

CREATE TABLE accounts (
account_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
customer_id INT UNSIGNED NOT NULL,
type ENUM('Checking', 'Savings') NOT NULL,
balance DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
PRIMARY KEY (account_id),
INDEX (customer_id),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = INNODB;

CREATE TABLE transactions (
transaction_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
to_account_id INT UNSIGNED NOT NULL,
from_account_id INT UNSIGNED NOT NULL,
amount DECIMAL(5,2) UNSIGNED NOT NULL,
date_entered TIMESTAMP NOT NULL,
PRIMARY KEY (transaction_id),
INDEX (to_account_id),
INDEX (from_account_id),
INDEX (date_entered),
FOREIGN KEY (to_account_id) REFERENCES accounts (account_id)
ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (from_account_id) REFERENCES accounts (account_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = INNODB;

CREATE TABLE languages (
lang_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
lang VARCHAR(60) NOT NULL,
lang_eng VARCHAR(20) NOT NULL,
PRIMARY KEY (lang_id),
UNIQUE (lang)
);

CREATE TABLE threads (
thread_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
lang_id TINYINT(3) UNSIGNED NOT NULL,
user_id INT UNSIGNED NOT NULL,
subject VARCHAR(150) NOT NULL,
PRIMARY KEY  (thread_id),
INDEX (lang_id),
INDEX (user_id)
);

CREATE TABLE posts (
post_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
thread_id INT UNSIGNED NOT NULL,
user_id INT UNSIGNED NOT NULL,
message TEXT NOT NULL,
posted_on DATETIME NOT NULL,
PRIMARY KEY (post_id),
INDEX (thread_id),
INDEX (user_id)
);

CREATE TABLE users (
user_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
lang_id TINYINT UNSIGNED NOT NULL,
time_zone VARCHAR(30) NOT NULL,
username VARCHAR(30) NOT NULL,
pass CHAR(40) NOT NULL,
email VARCHAR(60) NOT NULL,
PRIMARY KEY (user_id),
UNIQUE (username),
UNIQUE (email),
INDEX login (username, pass)
);

CREATE TABLE words (
word_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
lang_id TINYINT UNSIGNED NOT NULL,
title VARCHAR(80) NOT NULL,
intro TINYTEXT NOT NULL,
home VARCHAR(30) NOT NULL,
forum_home VARCHAR(40) NOT NULL,
`language` VARCHAR(40) NOT NULL,
register VARCHAR(30) NOT NULL,
login VARCHAR(30) NOT NULL,
logout VARCHAR(30) NOT NULL,
new_thread VARCHAR(40) NOT NULL,
subject VARCHAR(30) NOT NULL,
body VARCHAR(30) NOT NULL,
submit VARCHAR(30) NOT NULL,
posted_on VARCHAR(30) NOT NULL,
posted_by VARCHAR(30) NOT NULL,
replies VARCHAR(30) NOT NULL,
latest_reply VARCHAR(40) NOT NULL,
post_a_reply VARCHAR(40) NOT NULL,
PRIMARY KEY (word_id),
UNIQUE (lang_id)
);

CREATE TABLE users (
user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
email VARCHAR(80) NOT NULL,
pass CHAR(40) NOT NULL,
user_level TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
active CHAR(32),
registration_date DATETIME NOT NULL,
PRIMARY KEY (user_id),
UNIQUE KEY (email),
INDEX login (email, pass)
);

CREATE TABLE artists (
artist_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) DEFAULT NULL,
middle_name VARCHAR(20) DEFAULT NULL,
last_name VARCHAR(40) NOT NULL,
PRIMARY KEY (artist_id),
UNIQUE full_name (last_name, first_name, middle_name)
) ENGINE=MyISAM;

CREATE TABLE prints (
print_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
artist_id INT UNSIGNED NOT NULL,
print_name VARCHAR(60) NOT NULL,
price DECIMAL(6,2) UNSIGNED NOT NULL,
size VARCHAR(60) DEFAULT NULL,
description VARCHAR(255) DEFAULT NULL,
image_name VARCHAR(60) NOT NULL,
PRIMARY KEY (print_id),
INDEX (artist_id),
INDEX (print_name),
INDEX (price)
) ENGINE=MyISAM;

CREATE TABLE customers (
customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
email VARCHAR(60) NOT NULL,
pass CHAR(40) NOT NULL,
PRIMARY KEY (customer_id),
UNIQUE (email),
INDEX login (email, pass)
) ENGINE=MyISAM;

CREATE TABLE orders (
order_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
customer_id INT UNSIGNED NOT NULL,
total DECIMAL(10,2) UNSIGNED NOT NULL,
order_date TIMESTAMP,
PRIMARY KEY (order_id),
INDEX (customer_id),
INDEX (order_date)
) ENGINE=InnoDB;

CREATE TABLE order_contents (
oc_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
order_id INT UNSIGNED NOT NULL,
print_id INT UNSIGNED NOT NULL,
quantity TINYINT UNSIGNED NOT NULL DEFAULT 1,
price DECIMAL(6,2) UNSIGNED NOT NULL,
ship_date DATETIME default NULL,
PRIMARY KEY (oc_id),
INDEX (order_id),
INDEX (print_id),
INDEX (ship_date)
) ENGINE=InnoDB;

