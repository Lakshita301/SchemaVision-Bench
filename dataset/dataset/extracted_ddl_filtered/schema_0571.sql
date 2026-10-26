-- Source: https://github.com/osamede/social_listen/blob/3fc4f8cc7eecb8cf6c23f16439f18bc6841b7508/oa-parent/oa-installer/src/main/resources/schema.sql?raw=true
-- Tables detected: 31 | FK/REFERENCES mentions: 67

CREATE TABLE `account_creation_token` (
  `id` bigint(20) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `contact_email` varchar(255) DEFAULT NULL,
  `contact_name` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `zip_code` varchar(255) DEFAULT NULL,
  `company` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK98EF4CEBF8A52930` (`company`),
  KEY `FK98EF4CEB2899FC56` (`id`),
  CONSTRAINT `FK98EF4CEB2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FK98EF4CEBF8A52930` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attachment_indexable` (
  `attachment_id` bigint(20) NOT NULL,
  `string_content` longtext,
  PRIMARY KEY (`attachment_id`),
  FULLTEXT KEY `idx_attachment_fulltext` (`string_content`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `candidate` (
  `id` bigint(20) NOT NULL,
  `address` text,
  `email` varchar(255) DEFAULT NULL,
  `last_active_status` int(11) DEFAULT NULL,
  `match_score` decimal(19,2) DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `company` bigint(20) NOT NULL,
  `cover_letter` bigint(20) DEFAULT NULL,
  `last_sitting` bigint(20) DEFAULT NULL,
  `resume` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`,`company`),
  KEY `FK1E519583A3E4D525` (`last_sitting`),
  KEY `FK1E519583CC9CA5A1` (`cover_letter`),
  KEY `FK1E519583F8A52930` (`company`),
  KEY `FK1E5195837C330164` (`resume`),
  KEY `FK1E5195832899FC56` (`id`),
  CONSTRAINT `FK1E5195832899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FK1E5195837C330164` FOREIGN KEY (`resume`) REFERENCES `file_attachment` (`id`),
  CONSTRAINT `FK1E519583A3E4D525` FOREIGN KEY (`last_sitting`) REFERENCES `sitting` (`id`),
  CONSTRAINT `FK1E519583CC9CA5A1` FOREIGN KEY (`cover_letter`) REFERENCES `file_attachment` (`id`),
  CONSTRAINT `FK1E519583F8A52930` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `candidate_note` (
  `candidate` bigint(20) NOT NULL,
  `note_id` bigint(20) NOT NULL,
  UNIQUE KEY `note_id` (`note_id`),
  KEY `FK535CCD2E490EA5BC` (`candidate`),
  KEY `FK535CCD2E97114004` (`note_id`),
  CONSTRAINT `FK535CCD2E97114004` FOREIGN KEY (`note_id`) REFERENCES `note` (`id`),
  CONSTRAINT `FK535CCD2E490EA5BC` FOREIGN KEY (`candidate`) REFERENCES `candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `candidate_phone_numbers` (
  `candidate` bigint(20) NOT NULL,
  `number` varchar(255) NOT NULL,
  `mapkey` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`candidate`,`mapkey`),
  KEY `FK52862ABD490EA5BC` (`candidate`),
  CONSTRAINT `FK52862ABD490EA5BC` FOREIGN KEY (`candidate`) REFERENCES `candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `candidate_search` (
  `type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `search_string` varchar(255) DEFAULT NULL,
  `dates_string` varchar(255) DEFAULT NULL,
  `name_string` varchar(255) DEFAULT NULL,
  `skills_string` varchar(255) DEFAULT NULL,
  `user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF75123E418620320` (`user`),
  KEY `FKF75123E42899FC56` (`id`),
  CONSTRAINT `FKF75123E42899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FKF75123E418620320` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `candidate_work_flow_event` (
  `type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `sitting_score` decimal(19,2) DEFAULT NULL,
  `candidate` bigint(20) DEFAULT NULL,
  `user` bigint(20) DEFAULT NULL,
  `exam_link` bigint(20) DEFAULT NULL,
  `note` bigint(20) DEFAULT NULL,
  `cover_letter` bigint(20) DEFAULT NULL,
  `resume` bigint(20) DEFAULT NULL,
  `sitting` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC4E26B7B18620320` (`user`),
  KEY `FKC4E26B7B490EA5BC` (`candidate`),
  KEY `FKC4E26B7B81BB91CE` (`sitting`),
  KEY `FKC4E26B7BCC9CA5A1` (`cover_letter`),
  KEY `FKC4E26B7BD9421F4C` (`exam_link`),
  KEY `FKC4E26B7B6368A03D` (`exam_link`),
  KEY `FKC4E26B7B185B8B6E` (`note`),
  KEY `FKC4E26B7B7C330164` (`resume`),
  KEY `FKC4E26B7B2899FC56` (`id`),
  CONSTRAINT `FKC4E26B7B2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FKC4E26B7B185B8B6E` FOREIGN KEY (`note`) REFERENCES `note` (`id`),
  CONSTRAINT `FKC4E26B7B18620320` FOREIGN KEY (`user`) REFERENCES `user` (`id`),
  CONSTRAINT `FKC4E26B7B490EA5BC` FOREIGN KEY (`candidate`) REFERENCES `candidate` (`id`),
  CONSTRAINT `FKC4E26B7B6368A03D` FOREIGN KEY (`exam_link`) REFERENCES `exam_link` (`id`),
  CONSTRAINT `FKC4E26B7B7C330164` FOREIGN KEY (`resume`) REFERENCES `file_attachment` (`id`),
  CONSTRAINT `FKC4E26B7B81BB91CE` FOREIGN KEY (`sitting`) REFERENCES `sitting` (`id`),
  CONSTRAINT `FKC4E26B7BCC9CA5A1` FOREIGN KEY (`cover_letter`) REFERENCES `file_attachment` (`id`),
  CONSTRAINT `FKC4E26B7BD9421F4C` FOREIGN KEY (`exam_link`) REFERENCES `exam_link` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `company` (
  `id` bigint(20) NOT NULL,
  `completion_text` longtext NOT NULL,
  `email_alias` varchar(255) NOT NULL,
  `host_name` varchar(255) NOT NULL,
  `host_port` int(11) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `proxy_name` varchar(255) NOT NULL,
  `proxy_port` int(11) NOT NULL,
  `welcome_text` longtext NOT NULL,
  `auto_invite_email_template` bigint(20) NOT NULL,
  `exam_invite_email_template` bigint(20) NOT NULL,
  `link_to_all_exams` bigint(20) NOT NULL,
  `profile` bigint(20) NOT NULL,
  `reject_candidate_email_template` bigint(20) NOT NULL,
  `request_resume_email_template` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_alias` (`email_alias`),
  UNIQUE KEY `host_name` (`host_name`),
  UNIQUE KEY `proxy_name` (`proxy_name`),
  UNIQUE KEY `auto_invite_email_template` (`auto_invite_email_template`),
  UNIQUE KEY `exam_invite_email_template` (`exam_invite_email_template`),
  UNIQUE KEY `reject_candidate_email_template` (`reject_candidate_email_template`),
  UNIQUE KEY `link_to_all_exams` (`link_to_all_exams`),
  UNIQUE KEY `request_resume_email_template` (`request_resume_email_template`),
  UNIQUE KEY `profile` (`profile`),
  KEY `FK38A73C7DEF6CA9A7` (`reject_candidate_email_template`),
  KEY `FK38A73C7DBE910A75` (`request_resume_email_template`),
  KEY `FK38A73C7D2824CB9A` (`link_to_all_exams`),
  KEY `FK38A73C7D6273C388` (`profile`),
  KEY `FK38A73C7D64BC8C05` (`auto_invite_email_template`),
  KEY `FK38A73C7DADEBA205` (`exam_invite_email_template`),
  KEY `FK38A73C7D2899FC56` (`id`),
  CONSTRAINT `FK38A73C7D2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FK38A73C7D2824CB9A` FOREIGN KEY (`link_to_all_exams`) REFERENCES `exam_link` (`id`),
  CONSTRAINT `FK38A73C7D6273C388` FOREIGN KEY (`profile`) REFERENCES `profile` (`id`),
  CONSTRAINT `FK38A73C7D64BC8C05` FOREIGN KEY (`auto_invite_email_template`) REFERENCES `email_template` (`id`),
  CONSTRAINT `FK38A73C7DADEBA205` FOREIGN KEY (`exam_invite_email_template`) REFERENCES `email_template` (`id`),
  CONSTRAINT `FK38A73C7DBE910A75` FOREIGN KEY (`request_resume_email_template`) REFERENCES `email_template` (`id`),
  CONSTRAINT `FK38A73C7DEF6CA9A7` FOREIGN KEY (`reject_candidate_email_template`) REFERENCES `email_template` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `email_template` (
  `type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `body` longtext,
  `from_address` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6C0301BD2899FC56` (`id`),
  CONSTRAINT `FK6C0301BD2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `entity_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `guid` varchar(36) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

CREATE TABLE `exam` (
  `id` bigint(20) NOT NULL,
  `active` bit(1) NOT NULL DEFAULT '',
  `artifact_id` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `facilitate_email` bit(1) NOT NULL DEFAULT '\0',
  `frozen` bit(1) NOT NULL,
  `genre` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `company` bigint(20) NOT NULL,
  `next_version` bigint(20) DEFAULT NULL,
  `previous_version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2FB81FF8A52930` (`company`),
  KEY `FK2FB81F71697B39` (`previous_version`),
  KEY `FK2FB81F77A78F35` (`next_version`),
  KEY `FK2FB81F2899FC56` (`id`),
  CONSTRAINT `FK2FB81F2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FK2FB81F71697B39` FOREIGN KEY (`previous_version`) REFERENCES `exam` (`id`),
  CONSTRAINT `FK2FB81F77A78F35` FOREIGN KEY (`next_version`) REFERENCES `exam` (`id`),
  CONSTRAINT `FK2FB81FF8A52930` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `exam_link` (
  `kind` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `multi_use` bit(1) NOT NULL DEFAULT '\0',
  `used` bit(1) NOT NULL DEFAULT '\0',
  `company` bigint(20) DEFAULT NULL,
  `exams_strategy` bigint(20) NOT NULL,
  `candidate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `exams_strategy` (`exams_strategy`),
  KEY `FKFB36EC1A490EA5BC` (`candidate`),
  KEY `FKFB36EC1AD0FDF5BB` (`exams_strategy`),
  KEY `FKFB36EC1AF8A52930` (`company`),
  KEY `FKFB36EC1A2899FC56` (`id`),
  CONSTRAINT `FKFB36EC1A2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FKFB36EC1A490EA5BC` FOREIGN KEY (`candidate`) REFERENCES `candidate` (`id`),
  CONSTRAINT `FKFB36EC1AD0FDF5BB` FOREIGN KEY (`exams_strategy`) REFERENCES `exams_strategy` (`id`),
  CONSTRAINT `FKFB36EC1AF8A52930` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `exam_questions` (
  `exam` bigint(20) NOT NULL,
  `questions` bigint(20) NOT NULL,
  `ordinal` int(11) NOT NULL,
  PRIMARY KEY (`exam`,`ordinal`),
  KEY `FK76A1992DE36DBF31` (`questions`),
  KEY `FK76A1992D18539BC8` (`exam`),
  CONSTRAINT `FK76A1992D18539BC8` FOREIGN KEY (`exam`) REFERENCES `exam` (`id`),
  CONSTRAINT `FK76A1992DE36DBF31` FOREIGN KEY (`questions`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `exams_strategy` (
  `kind` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK668E031E2899FC56` (`id`),
  CONSTRAINT `FK668E031E2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `exams_strategy_exams` (
  `exams_strategy` bigint(20) NOT NULL,
  `exam_id` bigint(20) NOT NULL,
  KEY `FK519E63D37E1AC16D` (`exams_strategy`),
  KEY `FK519E63D3C948B4E4` (`exam_id`),
  CONSTRAINT `FK519E63D3C948B4E4` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `FK519E63D37E1AC16D` FOREIGN KEY (`exams_strategy`) REFERENCES `exams_strategy` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `file_attachment` (
  `type` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `content` longblob NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `string_content` longtext NOT NULL,
  `screening_score` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE596B3C62899FC56` (`id`),
  CONSTRAINT `FKE596B3C62899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `grade` (
  `id` bigint(20) NOT NULL,
  `score` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5E0BFD72899FC56` (`id`),
  CONSTRAINT `FK5E0BFD72899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `grade_scores` (
  `grade` bigint(20) NOT NULL,
  `score` decimal(19,2) NOT NULL,
  `mapkey` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`grade`,`mapkey`),
  KEY `FK480BA189F252C564` (`grade`),
  CONSTRAINT `FK480BA189F252C564` FOREIGN KEY (`grade`) REFERENCES `grade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `login_events` (
  `user` bigint(20) DEFAULT NULL,
  `login_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `note` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `author` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33AFF2C45838E0` (`author`),
  KEY `FK33AFF22899FC56` (`id`),
  CONSTRAINT `FK33AFF22899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FK33AFF2C45838E0` FOREIGN KEY (`author`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `password_recovery_token` (
  `id` bigint(20) NOT NULL,
  `user` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK973FA2F318620320` (`user`),
  KEY `FK973FA2F32899FC56` (`id`),
  CONSTRAINT `FK973FA2F32899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FK973FA2F318620320` FOREIGN KEY (`user`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `profile` (
  `id` bigint(20) NOT NULL,
  `accept_resumes_by_email` bit(1) NOT NULL DEFAULT '\0',
  `candidate_emails_recipient` varchar(255) DEFAULT NULL,
  `daily_reports_recipient` varchar(255) DEFAULT NULL,
  `forward_candidate_emails` bit(1) NOT NULL DEFAULT '\0',
  `forward_daily_reports` bit(1) NOT NULL DEFAULT '\0',
  `forward_job_board_emails` bit(1) NOT NULL DEFAULT '\0',
  `job_board_emails_recipient` varchar(255) DEFAULT NULL,
  `max_reject_score` int(11) DEFAULT NULL,
  `min_invite_score` int(11) DEFAULT NULL,
  `solicit_resumes` bit(1) NOT NULL DEFAULT '\0',
  PRIMARY KEY (`id`),
  KEY `FKED8E89A92899FC56` (`id`),
  CONSTRAINT `FKED8E89A92899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `profile_job_boards` (
  `profile` bigint(20) NOT NULL,
  `element` varchar(255) DEFAULT NULL,
  KEY `FK979369656273C388` (`profile`),
  CONSTRAINT `FK979369656273C388` FOREIGN KEY (`profile`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `profile_keywords` (
  `profile` bigint(20) NOT NULL,
  `element` int(11) DEFAULT NULL,
  `mapkey` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`profile`,`mapkey`),
  KEY `FK28CB15806273C388` (`profile`),
  CONSTRAINT `FK28CB15806273C388` FOREIGN KEY (`profile`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `question` (
  `kind` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `artifact_id` varchar(255) NOT NULL,
  `frozen` bit(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `prompt` longtext NOT NULL,
  `time_allowed` int(11) DEFAULT NULL,
  `answer` longtext,
  `answer_index` int(11) DEFAULT NULL,
  `next_version` bigint(20) DEFAULT NULL,
  `previous_version` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBA823BE6A6EE1574` (`previous_version`),
  KEY `FKBA823BE6AD2C2970` (`next_version`),
  KEY `FKBA823BE62899FC56` (`id`),
  CONSTRAINT `FKBA823BE62899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FKBA823BE6A6EE1574` FOREIGN KEY (`previous_version`) REFERENCES `question` (`id`),
  CONSTRAINT `FKBA823BE6AD2C2970` FOREIGN KEY (`next_version`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `question_and_response` (
  `id` bigint(20) NOT NULL,
  `question` bigint(20) NOT NULL,
  `response` bigint(20) DEFAULT NULL,
  `sitting` bigint(20) NOT NULL,
  `ordinal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB879216281BB91CE` (`sitting`),
  KEY `FKB879216282AB9CA` (`question`),
  KEY `FKB87921623AED7F0C` (`response`),
  KEY `FKB87921622899FC56` (`id`),
  CONSTRAINT `FKB87921622899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FKB87921623AED7F0C` FOREIGN KEY (`response`) REFERENCES `response` (`id`),
  CONSTRAINT `FKB879216281BB91CE` FOREIGN KEY (`sitting`) REFERENCES `sitting` (`id`),
  CONSTRAINT `FKB879216282AB9CA` FOREIGN KEY (`question`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `question_choices` (
  `question` bigint(20) NOT NULL,
  `element` varchar(255) DEFAULT NULL,
  KEY `FKCCF0F3994A488C3B` (`question`),
  CONSTRAINT `FKCCF0F3994A488C3B` FOREIGN KEY (`question`) REFERENCES `question` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `response` (
  `id` bigint(20) NOT NULL,
  `away_time` bigint(20) NOT NULL,
  `browser_type` varchar(255) NOT NULL,
  `browser_version` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `cut_copy` bit(1) NOT NULL,
  `erase_chars` bigint(20) NOT NULL,
  `erase_presses` bigint(20) NOT NULL,
  `focus_changes` bigint(20) NOT NULL,
  `focus_events` text NOT NULL,
  `focus_time` bigint(20) NOT NULL,
  `hesitation_time` bigint(20) NOT NULL,
  `key_chars` bigint(20) NOT NULL,
  `key_presses` bigint(20) NOT NULL,
  `keypress_events` longtext NOT NULL,
  `line_count` bigint(20) NOT NULL,
  `lines_per_hour` double NOT NULL,
  `load_timestamp` bigint(20) NOT NULL,
  `paste_chars` bigint(20) NOT NULL,
  `paste_events` text NOT NULL,
  `paste_presses` bigint(20) NOT NULL,
  `reviewing_time` bigint(20) NOT NULL,
  `total_time` bigint(20) NOT NULL,
  `typing_time` bigint(20) NOT NULL,
  `word_count` bigint(20) NOT NULL,
  `words_per_minute` double NOT NULL,
  `grade` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade` (`grade`),
  KEY `FKEBB71441F252C564` (`grade`),
  KEY `FKEBB714412899FC56` (`id`),
  CONSTRAINT `FKEBB714412899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FKEBB71441F252C564` FOREIGN KEY (`grade`) REFERENCES `grade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sitting` (
  `id` bigint(20) NOT NULL,
  `next_question_index` int(11) NOT NULL,
  `away_time` bigint(20) NOT NULL DEFAULT '0',
  `browser_change` bit(1) NOT NULL,
  `browser_type` varchar(255) DEFAULT NULL,
  `browser_version` varchar(255) DEFAULT NULL,
  `erase_chars` bigint(20) NOT NULL DEFAULT '0',
  `erase_presses` bigint(20) NOT NULL DEFAULT '0',
  `focus_changes` bigint(20) NOT NULL DEFAULT '0',
  `focus_time` bigint(20) NOT NULL DEFAULT '0',
  `hesitation_time` bigint(20) NOT NULL DEFAULT '0',
  `key_chars` bigint(20) NOT NULL DEFAULT '0',
  `key_presses` bigint(20) NOT NULL DEFAULT '0',
  `line_count` bigint(20) NOT NULL DEFAULT '0',
  `lines_per_hour` double NOT NULL DEFAULT '0',
  `load_timestamp` bigint(20) NOT NULL,
  `paste_chars` bigint(20) NOT NULL DEFAULT '0',
  `paste_presses` bigint(20) NOT NULL DEFAULT '0',
  `reviewing_time` bigint(20) NOT NULL DEFAULT '0',
  `total_time` bigint(20) NOT NULL DEFAULT '0',
  `typing_time` bigint(20) NOT NULL DEFAULT '0',
  `word_count` bigint(20) NOT NULL DEFAULT '0',
  `words_per_minute` double NOT NULL DEFAULT '0',
  `score` decimal(19,2) NOT NULL,
  `candidate` bigint(20) NOT NULL,
  `exam` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK7D3270CC490EA5BC` (`candidate`),
  KEY `FK7D3270CC18539BC8` (`exam`),
  KEY `FK7D3270CC2899FC56` (`id`),
  CONSTRAINT `FK7D3270CC2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FK7D3270CC18539BC8` FOREIGN KEY (`exam`) REFERENCES `exam` (`id`),
  CONSTRAINT `FK7D3270CC490EA5BC` FOREIGN KEY (`candidate`) REFERENCES `candidate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL DEFAULT '',
  `hashed_password` varchar(255) NOT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `firstname` varchar(255) NOT NULL,
  `lastname` varchar(255) NOT NULL,
  `middlename` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `company` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `FK36EBCBF8A52930` (`company`),
  KEY `FK36EBCB2899FC56` (`id`),
  CONSTRAINT `FK36EBCB2899FC56` FOREIGN KEY (`id`) REFERENCES `entity_info` (`id`),
  CONSTRAINT `FK36EBCBF8A52930` FOREIGN KEY (`company`) REFERENCES `company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `v_question_candidate_stats` (
  `question` bigint(20),
  `response` bigint(20),
  `sitting_id` bigint(20),
  `candidate_id` bigint(20),
  `status` varchar(11),
  `away_time` bigint(20),
  `cut_copy` bit(1),
  `erase_chars` bigint(20),
  `erase_presses` bigint(20),
  `focus_changes` bigint(20),
  `focus_time` bigint(20),
  `hesitation_time` bigint(20),
  `key_chars` bigint(20),
  `key_presses` bigint(20),
  `line_count` bigint(20),
  `load_timestamp` bigint(20),
  `paste_chars` bigint(20),
  `paste_presses` bigint(20),
  `reviewing_time` bigint(20),
  `total_time` bigint(20),
  `typing_time` bigint(20),
  `word_count` bigint(20),
  `score` decimal(19,2),
  `style` decimal(19,2),
  `correctness` decimal(19,2)
) ENGINE=MyISAM */;

