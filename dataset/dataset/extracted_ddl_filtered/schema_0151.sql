-- Source: https://github.com/softwareengineerhub/Projects/blob/d3fcbaa03f7ab31bdd950c07afa860f33538d69e/Terminator_Diary/DB/terminator%20backup.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 6

CREATE TABLE `exercises` (
  `ID` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `usr` int(11) NOT NULL,
  PRIMARY KEY  (`ID`,`usr`),
  UNIQUE KEY `uni_name` (`name`,`usr`),
  KEY `fk_exercises_users1` (`usr`),
  CONSTRAINT `fk_exercises_users1` FOREIGN KEY (`usr`) REFERENCES `users` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `exercises_details` (
  `ID` int(11) NOT NULL auto_increment,
  `rest` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY  (`ID`),
  KEY `fk_exercises_details_exercises1` (`ID`),
  CONSTRAINT `fk_exercises_details_exercises1` FOREIGN KEY (`ID`) REFERENCES `exercises` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sets` (
  `ID` int(11) NOT NULL auto_increment,
  `number` int(11) NOT NULL,
  `weight` double default NULL,
  `repeats` int(11) default NULL,
  `exercise` int(11) NOT NULL,
  PRIMARY KEY  (`ID`,`exercise`),
  KEY `fk_sets_exercises1` (`exercise`),
  CONSTRAINT `fk_sets_exercises1` FOREIGN KEY (`exercise`) REFERENCES `exercises` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `ID` int(11) NOT NULL auto_increment,
  `login` varchar(45) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `role` varchar(45) NOT NULL default 'arny',
  `email` varchar(45) NOT NULL,
  PRIMARY KEY  (`ID`),
  UNIQUE KEY `uni_login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `workouts` (
  `ID` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `number` int(11) NOT NULL,
  `usr` int(11) NOT NULL,
  PRIMARY KEY  (`ID`,`usr`),
  UNIQUE KEY `name_uni` (`name`,`usr`),
  UNIQUE KEY `num_uni` (`number`,`usr`),
  KEY `fk_workouts_users` (`usr`),
  CONSTRAINT `fk_workouts_users` FOREIGN KEY (`usr`) REFERENCES `users` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `workouts_exercises` (
  `ID` int(11) NOT NULL auto_increment,
  `workout` int(11) NOT NULL,
  `exercise` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY  (`ID`,`workout`,`exercise`),
  UNIQUE KEY `uni_exercise` (`workout`,`exercise`,`number`),
  KEY `fk_workouts_exercises_workouts1` (`workout`),
  KEY `fk_workouts_exercises_exercises1` (`exercise`),
  CONSTRAINT `fk_workouts_exercises_workouts1` FOREIGN KEY (`workout`) REFERENCES `workouts` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_workouts_exercises_exercises1` FOREIGN KEY (`exercise`) REFERENCES `exercises` (`ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

