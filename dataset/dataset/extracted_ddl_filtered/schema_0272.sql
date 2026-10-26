-- Source: https://github.com/rixonmathew/evaluator/blob/c60a6ad61dc5ef20a1dc52ec794427cad4172a97/sql/Dump20141224.sql?raw=true
-- Tables detected: 17 | FK/REFERENCES mentions: 17

CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL,
  `description` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_activity_user1_idx` (`user_id`),
  CONSTRAINT `fk_activity_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This entity will represent an activity done by user ';

CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(500) NOT NULL,
  `correct` tinyint(1) NOT NULL DEFAULT '0',
  `question_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_answers_question1_idx` (`question_id`),
  CONSTRAINT `fk_answers_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=655 DEFAULT CHARSET=utf8 COMMENT='This entity will hold all the possible answers to a given question and indicate what the correct answer is';

CREATE TABLE `certification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `degree` varchar(45) NOT NULL,
  `instituition` varchar(1000) NOT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `url` varchar(1000) DEFAULT NULL,
  `year_obtained` date DEFAULT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_education_user1_idx` (`user_id`),
  CONSTRAINT `fk_education_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This entity will hold the various educational details of the user';

CREATE TABLE `passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `description` varchar(5000) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='This entity will hold independent passaseges or other media around which questions can be asked';

CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` varchar(5000) NOT NULL,
  `number` varchar(45) DEFAULT NULL,
  `type` varchar(45) NOT NULL DEFAULT 'multiple_choice',
  `evaluating_class` varchar(45) DEFAULT NULL COMMENT 'This column holds the name of the class which will evaluate the question. For complex questions a class can be provided that will take the question, correct answers and user provided answer to evaluate the question',
  `rendering_class` varchar(45) DEFAULT NULL COMMENT 'In case a question has a special display requirement This class can be used to render the question',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8 COMMENT='This entity will hold all the question that can be part of test';

CREATE TABLE `question_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `question_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `value` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_question_attribute_question_idx` (`question_id`),
  CONSTRAINT `fk_question_attribute_question` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8 COMMENT='This entity will hold the various attributes associated with question e.g complexity or tags (like comprehension, grammar, tenses etc.). For adaptive tests this attributes will be looked to get a question in random';

CREATE TABLE `question_set` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passage_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `question_set_definition_id` int(11) NOT NULL,
  `order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_question_set_passage1_idx` (`passage_id`),
  KEY `fk_question_set_question1_idx` (`question_id`),
  KEY `fk_question_set_question_set_definition1_idx` (`question_set_definition_id`),
  CONSTRAINT `fk_question_set_passage1` FOREIGN KEY (`passage_id`) REFERENCES `passage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_set_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_question_set_question_set_definition1` FOREIGN KEY (`question_set_definition_id`) REFERENCES `question_set_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='A question_set is used to relate all the questions that run of a passage or a audio clip';

CREATE TABLE `question_set_definition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '	',
  `name` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'Type of the section. Fixed implies the questions are picked from defined set',
  `timeLimit` int(11) NOT NULL DEFAULT '300',
  `evaluatingClass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='A section is group of questions that are related logically';

CREATE TABLE `section_attribute` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute` varchar(100) NOT NULL,
  `value` varchar(500) NOT NULL,
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_section_attribute_section1_idx` (`section_id`),
  CONSTRAINT `fk_section_attribute_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This entity will hold the various attributes with regards to a section';

CREATE TABLE `section_questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `question_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `question_set_definition_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_section_questions_section1_idx` (`section_id`),
  KEY `fk_section_questions_question1_idx` (`question_id`),
  KEY `fk_section_questions_question_set_definition1_idx` (`question_set_definition_id`),
  CONSTRAINT `fk_section_questions_question1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_questions_question_set_definition1` FOREIGN KEY (`question_set_definition_id`) REFERENCES `question_set_definition` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_questions_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;

CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(5000) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='This entity will be used to define a test ';

CREATE TABLE `test_attempt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `overall_grade` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL,
  `test_id` int(11) NOT NULL,
  `communication_grade` varchar(45) DEFAULT NULL,
  `comprehension_grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_attempt_user1_idx` (`user_id`),
  KEY `fk_test_attempt_test1_idx` (`test_id`),
  CONSTRAINT `fk_test_attempt_test1` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_attempt_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='This entity will hold the attempts of a given test by the user';

CREATE TABLE `test_attempt_analytics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_attempt_id` int(11) NOT NULL,
  `test_section_id` int(11) NOT NULL,
  `attribute` varchar(100) NOT NULL,
  `value` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_attempt_analytics_test_attempt1_idx` (`test_attempt_id`),
  KEY `fk_test_attempt_analytics_test_section1_idx` (`test_section_id`),
  CONSTRAINT `fk_test_attempt_analytics_test_attempt1` FOREIGN KEY (`test_attempt_id`) REFERENCES `test_attempt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_attempt_analytics_test_section1` FOREIGN KEY (`test_section_id`) REFERENCES `test_section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This entity will hold the analysis of the test attempts in terms of questions attempted, correct answers areas of improvement etc.';

CREATE TABLE `test_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `order` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_test_has_section_section1_idx` (`section_id`),
  KEY `fk_test_has_section_test1_idx` (`test_id`),
  CONSTRAINT `fk_test_has_section_section1` FOREIGN KEY (`section_id`) REFERENCES `section` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_test_has_section_test1` FOREIGN KEY (`test_id`) REFERENCES `test` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='This entity will hold all the section for a given test';

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(500) NOT NULL,
  `first_name` varchar(500) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='This entity defines the various users in the systems';

