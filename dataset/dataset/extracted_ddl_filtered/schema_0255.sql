-- Source: https://github.com/talk2bk/School/blob/b7b228876128a79f739f0d89a3f5d51ded7faf8d/Fall2015/CS157A/mydb/mydb2.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2

CREATE TABLE `authorisbn` (
  `authorID` int(11) NOT NULL COMMENT 'The integer ID in this field must appear also in the authors table',
  `isbn` char(10) NOT NULL COMMENT 'the ISBN number for a book',
  KEY `isbn_idx` (`isbn`),
  KEY `authorID_idx` (`authorID`),
  CONSTRAINT `authorID` FOREIGN KEY (`authorID`) REFERENCES `authors` (`authorID`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `authors` (
  `authorID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` char(20) NOT NULL COMMENT 'Author''s first name.',
  `lastName` char(20) NOT NULL COMMENT 'Author''s last name',
  PRIMARY KEY (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

CREATE TABLE `publishers` (
  `publisherID` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Publisher’s ID number. This autoincremented inte-ger is the table’s primary-key field.',
  `publisher-Name` char(100) NOT NULL COMMENT 'The name of the publisher.',
  PRIMARY KEY (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

CREATE TABLE `titles` (
  `isbn` char(10) NOT NULL COMMENT 'ISBN number of the book',
  `title` varchar(500) NOT NULL COMMENT 'Title of the book',
  `editionNumber` int(11) NOT NULL COMMENT 'Edition number of the book',
  `copyright` char(4) NOT NULL COMMENT 'Copyright year of the book',
  `publisherID` int(11) NOT NULL COMMENT 'Publisher’s ID number. This value corresponds to an ID number in the publishers table.',
  `price` float NOT NULL COMMENT 'Suggested retail price of the book',
  PRIMARY KEY (`isbn`),
  KEY `publisherID_idx` (`publisherID`),
  CONSTRAINT `publisherID` FOREIGN KEY (`publisherID`) REFERENCES `publishers` (`publisherID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

