-- Source: https://github.com/leeshandsouza/libmate/blob/acb8c9cb920e8cbcdc8735717a311d5c8e03d522/sql_old/old%20sql%20library.sql?raw=true
-- Tables detected: 4 | FK constraints: 4

CREATE TABLE `book` (
  `bookid` int(11) NOT NULL,
  `bookname` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `year` year(4) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `borrow` (
  `serialid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `date` date NOT NULL,
  `duedate` date NOT NULL,
  `returned` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `libuser` (
  `userid` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` bigint(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `returns` (
  `serialid` int(11) NOT NULL,
  `bid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `returndate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `book` (`bookid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `libuser` (`userid`) ON UPDATE CASCADE;

ALTER TABLE `returns`
  ADD CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`bid`) REFERENCES `book` (`bookid`) ON UPDATE CASCADE,
  ADD CONSTRAINT `returns_ibfk_2` FOREIGN KEY (`uid`) REFERENCES `libuser` (`userid`) ON UPDATE CASCADE;

