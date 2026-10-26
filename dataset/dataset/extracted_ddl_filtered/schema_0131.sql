-- Source: https://github.com/TCL90/Acme-Conference/blob/6a2bb6e7b11ab1cea8b3f4c738bbc83f15288a90/Despliegues%20conference/Item%20prepo/Create-Acme-Conference-Initialise.sql?raw=true
-- Tables detected: 43 | FK/REFERENCES mentions: 47

CREATE TABLE `activity_attachments` (
  `activity` int(11) NOT NULL,
  `attachments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `activity_speakers` (
  `activity` int(11) NOT NULL,
  `speakers` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `actor_boxes` (
  `actor` int(11) NOT NULL,
  `boxes` int(11) NOT NULL,
  UNIQUE KEY `UK_6n6psqivvjho155qcf9kjvv1h` (`boxes`),
  CONSTRAINT `FK_6n6psqivvjho155qcf9kjvv1h` FOREIGN KEY (`boxes`) REFERENCES `box` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_7ohwsa2usmvu0yxb44je2lge` (`user_account`),
  CONSTRAINT `FK_7ohwsa2usmvu0yxb44je2lge` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `author` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  `score` double DEFAULT NULL,
  `finder` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ng8tt0uu0j791w837h00d4owq` (`finder`),
  KEY `FK_rjptsoy3q9dcfysbnmy1g0g31` (`user_account`),
  CONSTRAINT `FK_rjptsoy3q9dcfysbnmy1g0g31` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`),
  CONSTRAINT `FK_ng8tt0uu0j791w837h00d4owq` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `author_conferences` (
  `author` int(11) NOT NULL,
  `conferences` int(11) NOT NULL,
  KEY `FK_q0t68by5l74o0y5yd6cdi2685` (`conferences`),
  KEY `FK_a0ai128gay07gphsxw8pg77q3` (`author`),
  CONSTRAINT `FK_a0ai128gay07gphsxw8pg77q3` FOREIGN KEY (`author`) REFERENCES `author` (`id`),
  CONSTRAINT `FK_q0t68by5l74o0y5yd6cdi2685` FOREIGN KEY (`conferences`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `box` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `box_messages` (
  `box` int(11) NOT NULL,
  `messages` int(11) NOT NULL,
  KEY `FK_acfjrqu1jeixjmv14c0386o0s` (`messages`),
  KEY `FK_e6boieojekgfg919on0dci4na` (`box`),
  CONSTRAINT `FK_e6boieojekgfg919on0dci4na` FOREIGN KEY (`box`) REFERENCES `box` (`id`),
  CONSTRAINT `FK_acfjrqu1jeixjmv14c0386o0s` FOREIGN KEY (`messages`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `camera_ready_paper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `submission` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_c65sk86p20xnwvstgolqeq8h2` (`submission`),
  CONSTRAINT `FK_c65sk86p20xnwvstgolqeq8h2` FOREIGN KEY (`submission`) REFERENCES `submission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `camera_ready_paper_authors` (
  `camera_ready_paper` int(11) NOT NULL,
  `authors` varchar(255) DEFAULT NULL,
  KEY `FK_nwy8nwxpu84h34qttyhjfmy7` (`camera_ready_paper`),
  CONSTRAINT `FK_nwy8nwxpu84h34qttyhjfmy7` FOREIGN KEY (`camera_ready_paper`) REFERENCES `camera_ready_paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `title_esp` varchar(255) DEFAULT NULL,
  `title_ing` varchar(255) DEFAULT NULL,
  `parent` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_d285hl23ejq8efmum8hbvqrt2` (`parent`),
  CONSTRAINT `FK_d285hl23ejq8efmum8hbvqrt2` FOREIGN KEY (`parent`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` int(11) DEFAULT NULL,
  `commentable` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `conference` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `acronym` varchar(255) DEFAULT NULL,
  `camera_ready_deadline` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `fee` int(11) NOT NULL,
  `final_mode` bit(1) NOT NULL,
  `notification_deadline` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `submission_deadline` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ldxxtwdsnf262yu1ctl1awe02` (`category`),
  CONSTRAINT `FK_ldxxtwdsnf262yu1ctl1awe02` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customisation` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `phone_number_code` varchar(255) DEFAULT NULL,
  `system_name` varchar(255) DEFAULT NULL,
  `welcome_message_eng` varchar(255) DEFAULT NULL,
  `welcome_message_esp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customisation_buzz_words_esp` (
  `customisation` int(11) NOT NULL,
  `buzz_words_esp` varchar(255) DEFAULT NULL,
  KEY `FK_b3sdyik16m1p0ft5pub2r9h1s` (`customisation`),
  CONSTRAINT `FK_b3sdyik16m1p0ft5pub2r9h1s` FOREIGN KEY (`customisation`) REFERENCES `customisation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customisation_buzz_words_ing` (
  `customisation` int(11) NOT NULL,
  `buzz_words_ing` varchar(255) DEFAULT NULL,
  KEY `FK_r98hm5j2vh91c6nsnppoirgll` (`customisation`),
  CONSTRAINT `FK_r98hm5j2vh91c6nsnppoirgll` FOREIGN KEY (`customisation`) REFERENCES `customisation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customisation_credit_card_makes` (
  `customisation` int(11) NOT NULL,
  `credit_card_makes` varchar(255) DEFAULT NULL,
  KEY `FK_my1ddakb8b5rim2xvdvl6sxit` (`customisation`),
  CONSTRAINT `FK_my1ddakb8b5rim2xvdvl6sxit` FOREIGN KEY (`customisation`) REFERENCES `customisation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customisation_topics_esp` (
  `customisation` int(11) NOT NULL,
  `topics_esp` varchar(255) DEFAULT NULL,
  KEY `FK_kvedu4wbfiyb2e17pg22uk0oa` (`customisation`),
  CONSTRAINT `FK_kvedu4wbfiyb2e17pg22uk0oa` FOREIGN KEY (`customisation`) REFERENCES `customisation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `customisation_topics_ing` (
  `customisation` int(11) NOT NULL,
  `topics_ing` varchar(255) DEFAULT NULL,
  KEY `FK_fh2phf9s1fhcfttew0kk1c900` (`customisation`),
  CONSTRAINT `FK_fh2phf9s1fhcfttew0kk1c900` FOREIGN KEY (`customisation`) REFERENCES `customisation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `finder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `end_date` datetime DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `maximum_fee` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_n9t1ayk0x7h5vrsfuhygo043j` (`category`),
  CONSTRAINT `FK_n9t1ayk0x7h5vrsfuhygo043j` FOREIGN KEY (`category`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `finder_conferences` (
  `finder` int(11) NOT NULL,
  `conferences` int(11) NOT NULL,
  KEY `FK_nfuvovuvbk05r9vbyg5mbstxx` (`conferences`),
  KEY `FK_k666b9rxu2vqkol7uc9ostni9` (`finder`),
  CONSTRAINT `FK_k666b9rxu2vqkol7uc9ostni9` FOREIGN KEY (`finder`) REFERENCES `finder` (`id`),
  CONSTRAINT `FK_nfuvovuvbk05r9vbyg5mbstxx` FOREIGN KEY (`conferences`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `message` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `broadcast` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `topic` varchar(255) DEFAULT NULL,
  `sender` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `message_recipients` (
  `message` int(11) NOT NULL,
  `recipients` int(11) NOT NULL,
  KEY `FK_1odmg2n3n487tvhuxx5oyyya2` (`message`),
  CONSTRAINT `FK_1odmg2n3n487tvhuxx5oyyya2` FOREIGN KEY (`message`) REFERENCES `message` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `panel` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `start_moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_g9jn8oaylcvixfdbmtesav3c3` (`conference`),
  CONSTRAINT `FK_g9jn8oaylcvixfdbmtesav3c3` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `paper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `paper_authors` (
  `paper` int(11) NOT NULL,
  `authors` varchar(255) DEFAULT NULL,
  KEY `FK_ae9a28ln0ji506i8uoqhv563h` (`paper`),
  CONSTRAINT `FK_ae9a28ln0ji506i8uoqhv563h` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `presentation` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `start_moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference` int(11) NOT NULL,
  `camera_ready_paper` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sgmmubx8ftlft0yxjdvnft0m8` (`camera_ready_paper`),
  KEY `FK_fu56gussuaw8r8865h3x4cvq0` (`conference`),
  CONSTRAINT `FK_fu56gussuaw8r8865h3x4cvq0` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`),
  CONSTRAINT `FK_sgmmubx8ftlft0yxjdvnft0m8` FOREIGN KEY (`camera_ready_paper`) REFERENCES `camera_ready_paper` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `registration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `cvv` int(11) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make_name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `conference` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_jpwxbrhvii9ekt338bmrdatfg` (`author`),
  KEY `FK_lc3odbpd5lgo7qc3w33ugwafj` (`conference`),
  CONSTRAINT `FK_lc3odbpd5lgo7qc3w33ugwafj` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`),
  CONSTRAINT `FK_jpwxbrhvii9ekt338bmrdatfg` FOREIGN KEY (`author`) REFERENCES `author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `decision` varchar(255) DEFAULT NULL,
  `originality_score` int(11) NOT NULL,
  `quality_score` int(11) NOT NULL,
  `readability_score` int(11) NOT NULL,
  `reviewer` int(11) NOT NULL,
  `submission` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_26pbnwfa1gklnebnnsotvqt88` (`reviewer`),
  KEY `FK_a0lt5jqh9b7s1gw3q77nywxxn` (`submission`),
  CONSTRAINT `FK_a0lt5jqh9b7s1gw3q77nywxxn` FOREIGN KEY (`submission`) REFERENCES `submission` (`id`),
  CONSTRAINT `FK_26pbnwfa1gklnebnnsotvqt88` FOREIGN KEY (`reviewer`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `reviewer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ite8gbxlfjyy7g7wqqiyjhkmn` (`user_account`),
  CONSTRAINT `FK_ite8gbxlfjyy7g7wqqiyjhkmn` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `reviewer_expertise` (
  `reviewer` int(11) NOT NULL,
  `expertise` varchar(255) DEFAULT NULL,
  KEY `FK_5jghl4veyunssejabmkb34iy4` (`reviewer`),
  CONSTRAINT `FK_5jghl4veyunssejabmkb34iy4` FOREIGN KEY (`reviewer`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `section` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `tutorial` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6tcpk427cxiaiglbxvybc9fjh` (`tutorial`),
  CONSTRAINT `FK_6tcpk427cxiaiglbxvybc9fjh` FOREIGN KEY (`tutorial`) REFERENCES `tutorial` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `section_pictures` (
  `section` int(11) NOT NULL,
  `pictures` varchar(255) DEFAULT NULL,
  KEY `FK_fpgvw49vb6tytfbfcghj3o8sv` (`section`),
  CONSTRAINT `FK_fpgvw49vb6tytfbfcghj3o8sv` FOREIGN KEY (`section`) REFERENCES `section` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sponsor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `middle_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `user_account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_du2w5ldt8rvlvxvtr7vyxk7g3` (`user_account`),
  CONSTRAINT `FK_du2w5ldt8rvlvxvtr7vyxk7g3` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `sponsorship` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `cvv` int(11) DEFAULT NULL,
  `expiration_month` int(11) DEFAULT NULL,
  `expiration_year` int(11) DEFAULT NULL,
  `holder_name` varchar(255) DEFAULT NULL,
  `make_name` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `target_url` varchar(255) DEFAULT NULL,
  `sponsor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_huglhkud0ihqdljyou4eshra6` (`sponsor`),
  CONSTRAINT `FK_huglhkud0ihqdljyou4eshra6` FOREIGN KEY (`sponsor`) REFERENCES `sponsor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `submission` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `conference` int(11) NOT NULL,
  `paper` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3osm3qjvt3r41xau9xwf5nkdt` (`paper`),
  UNIQUE KEY `UK_9ayhftkow8judgm0cblwdb9mi` (`ticker`),
  KEY `FK_ssk77t9sokwi9utdru9hvodul` (`author`),
  KEY `FK_1vynnfw6cw1l40c8e342st672` (`conference`),
  CONSTRAINT `FK_3osm3qjvt3r41xau9xwf5nkdt` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`),
  CONSTRAINT `FK_1vynnfw6cw1l40c8e342st672` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`),
  CONSTRAINT `FK_ssk77t9sokwi9utdru9hvodul` FOREIGN KEY (`author`) REFERENCES `author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `submission_form` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `document` varchar(255) DEFAULT NULL,
  `moment` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `ticker` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `camera_ready_paper` int(11) DEFAULT NULL,
  `conference` int(11) NOT NULL,
  `paper` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_760u2bubhhx01nxr7eylknwib` (`paper`),
  UNIQUE KEY `UK_nr1md7ognnsjuje1nriiy6cyv` (`ticker`),
  KEY `FK_3fnjmfprbovi710kqli73xku9` (`author`),
  KEY `FK_7yfmvo3s30c8qdojp2oew4rlh` (`camera_ready_paper`),
  KEY `FK_jcaas9u9rvyhdj9ba31sb3lph` (`conference`),
  CONSTRAINT `FK_760u2bubhhx01nxr7eylknwib` FOREIGN KEY (`paper`) REFERENCES `paper` (`id`),
  CONSTRAINT `FK_3fnjmfprbovi710kqli73xku9` FOREIGN KEY (`author`) REFERENCES `author` (`id`),
  CONSTRAINT `FK_7yfmvo3s30c8qdojp2oew4rlh` FOREIGN KEY (`camera_ready_paper`) REFERENCES `camera_ready_paper` (`id`),
  CONSTRAINT `FK_jcaas9u9rvyhdj9ba31sb3lph` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `submission_form_authors` (
  `submission_form` int(11) NOT NULL,
  `authors` varchar(255) DEFAULT NULL,
  KEY `FK_rtaj4jml3bru5db7yg8jygk8w` (`submission_form`),
  CONSTRAINT `FK_rtaj4jml3bru5db7yg8jygk8w` FOREIGN KEY (`submission_form`) REFERENCES `submission_form` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `submission_reviewers` (
  `submission` int(11) NOT NULL,
  `reviewers` int(11) NOT NULL,
  KEY `FK_rx31lgg0k67efoplhxv8len0c` (`reviewers`),
  KEY `FK_iwsj2ioiue7vmn5bnhxb2oatb` (`submission`),
  CONSTRAINT `FK_iwsj2ioiue7vmn5bnhxb2oatb` FOREIGN KEY (`submission`) REFERENCES `submission` (`id`),
  CONSTRAINT `FK_rx31lgg0k67efoplhxv8len0c` FOREIGN KEY (`reviewers`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tutorial` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `schedule` datetime DEFAULT NULL,
  `start_moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `conference` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_gd8wor872gtoqt1siaw2k4din` (`conference`),
  CONSTRAINT `FK_gd8wor872gtoqt1siaw2k4din` FOREIGN KEY (`conference`) REFERENCES `conference` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_account` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_castjbvpeeus0r8lbpehiu0e4` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_account_authorities` (
  `user_account` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_pao8cwh93fpccb0bx6ilq6gsl` (`user_account`),
  CONSTRAINT `FK_pao8cwh93fpccb0bx6ilq6gsl` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

