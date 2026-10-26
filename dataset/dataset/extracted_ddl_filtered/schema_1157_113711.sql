-- Source: https://github.com/PeterNguyen-BK/assignment2/blob/6c798ab29d031c82ab9cf542040914d25f84ba42/bk_cleanly.sql?raw=true
-- Tables detected: 5 | FK constraints: 4

CREATE TABLE `payment` (
  `UID` int(11) NOT NULL,
  `service` varchar(26) NOT NULL,
  `money` int(9) NOT NULL,
  `package` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `price` (
  `SID` int(11) NOT NULL,
  `package_in_time` int(9) NOT NULL,
  `package_in_month` int(9) NOT NULL,
  `package_in_year` int(9) NOT NULL,
  `unit` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rating` (
  `RID` int(11) NOT NULL,
  `star_rating` int(1) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `time` varchar(20) NOT NULL,
  `SID` int(11) NOT NULL,
  `UID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `service` (
  `SID` int(11) NOT NULL,
  `name` varchar(26) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `image` varchar(100) NOT NULL,
  `task` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `UID` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `active` int(1) NOT NULL,
  `image` varchar(10000) DEFAULT NULL,
  `admin` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`);

ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `service` (`SID`);

ALTER TABLE `rating`
  ADD CONSTRAINT `rating_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `service` (`SID`),
  ADD CONSTRAINT `rating_ibfk_2` FOREIGN KEY (`UID`) REFERENCES `user` (`UID`);

