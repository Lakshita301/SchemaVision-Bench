-- Source: https://github.com/Zdudek/me-and-you-web-application-project/blob/2b12e3d95a514702d57a7aa4d491efbdd41ee7a3/meandyou/meandyou/create5.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 10

CREATE TABLE person (
  userName VARCHAR(50) NOT NULL PRIMARY KEY,
  password VARCHAR(30) NOT NULL,
  firstName VARCHAR(30) NOT NULL,
  lastName VARCHAR(30) NOT NULL,
  phoneNumber VARCHAR(10) NOT NULL,
  gender VARCHAR(6) NOT NULL,
  birthDate DATE NOT NULL,
  address VARCHAR(50) NOT NULL,
  city VARCHAR(15) NOT NULL,
  st VARCHAR(30) NOT NULL,
  zipCode INT(5) NOT NULL,
  dateTimeStamp TIMESTAMP
);

CREATE TABLE matches (
  userName1 VARCHAR(30) NOT NULL,
  userName2 VARCHAR(30) NOT NULL,
  matchCriteria VARCHAR(50) NOT NULL,
  dateTimeStamp TIMESTAMP,
  foreign key (userName1) references person(userName),
  foreign key (userName2) references person(userName)
);

CREATE TABLE searches (
  searchID INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  userName VARCHAR(50) NOT NULL,
  userNameSearch VARCHAR(50),
  firstName VARCHAR(30),
  lastName VARCHAR(30),
  status VARCHAR(10),
  dateTimeStamp TIMESTAMP,
  foreign key (userName) references person(userName)
);

CREATE TABLE emails (
  userName VARCHAR(50) NOT NULL,
  email VARCHAR(30) NOT NULL,
  dateTimeStamp TIMESTAMP,
  foreign key (userName) references person(userName),
  primary key (userName, email)
);

CREATE TABLE phones (
  userName VARCHAR(50) NOT NULL,
  phone INT(9) NOT NULL,
  dateTimeStamp TIMESTAMP,
  foreign key (userName) references person(userName),
  primary key (userName, phone) 
);

