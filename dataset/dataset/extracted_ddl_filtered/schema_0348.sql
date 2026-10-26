-- Source: https://github.com/satyantech/2015-01-358-01/blob/e352622412e11e4b71371530119cf51b2b5786cb/gotasku.sql?raw=true
-- Tables detected: 38 | FK/REFERENCES mentions: 37

CREATE TABLE `application_view` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `viewed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `application_id` (`application_id`,`usr_id`,`viewed_on`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `applications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `wrkr_id` int(11) NOT NULL,
  `appl_dt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_selected` tinyint(1) DEFAULT '0',
  `wrkr_comments` text,
  `emplyr_comments` text,
  PRIMARY KEY (`id`),
  KEY `fk_job_id_idx` (`job_id`),
  KEY `fk_wrkr_id_idx` (`wrkr_id`),
  CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`wrkr_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `business_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_nm` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `cities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stt_id` int(11) DEFAULT NULL,
  `ct_nm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stt_id_idx` (`stt_id`),
  CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`stt_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_nm` varchar(100) DEFAULT NULL,
  `iso2` varchar(2) DEFAULT NULL,
  `iso3` varchar(3) DEFAULT NULL,
  `isd_prefix` varchar(3) DEFAULT NULL,
  `localization_code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `cv` (
  `id` int(11) NOT NULL,
  `wrkr_id` int(11) NOT NULL,
  `cv_path` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wrkr_id_idx` (`wrkr_id`),
  CONSTRAINT `cv_ibfk_1` FOREIGN KEY (`wrkr_id`) REFERENCES `worker_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `education` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wrkr_id` int(11) DEFAULT NULL,
  `edctn_type_id` int(11) DEFAULT NULL,
  `degree` varchar(200) DEFAULT NULL,
  `university` varchar(100) DEFAULT NULL,
  `institution` varchar(100) DEFAULT NULL,
  `from_yr` int(11) DEFAULT NULL,
  `to_yr` int(11) DEFAULT NULL,
  `result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wrkr_id_idx` (`wrkr_id`),
  KEY `fk_edctn_id_idx` (`edctn_type_id`),
  CONSTRAINT `fk_edctn_id` FOREIGN KEY (`edctn_type_id`) REFERENCES `education_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_wrkr_id` FOREIGN KEY (`wrkr_id`) REFERENCES `worker_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `education_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_nm` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `employer_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) NOT NULL,
  `bsnss_nm` varchar(200) DEFAULT NULL,
  `profile_pic` text NOT NULL,
  `business_type` int(11) NOT NULL,
  `cntct_addr` text,
  `cntr_id` int(11) DEFAULT NULL,
  `stt_id` int(11) DEFAULT NULL,
  `ct_id` int(11) DEFAULT NULL,
  `pstl_cd` varchar(15) DEFAULT NULL,
  `web_site` varchar(200) NOT NULL,
  `cntct_prsn_lnm` varchar(100) DEFAULT NULL,
  `cntct_prsn_fnm` varchar(100) NOT NULL,
  `role` int(11) NOT NULL,
  `cntct_num1` varchar(20) NOT NULL,
  `cntct_num2` varchar(20) DEFAULT NULL,
  `email1` varchar(100) NOT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `comp_desc` text NOT NULL,
  `same_billing_addr` tinyint(1) NOT NULL DEFAULT '0',
  `billing_addr` varchar(255) NOT NULL,
  `billing_name` varchar(255) NOT NULL,
  `billing_pstl_cd` varchar(15) NOT NULL,
  `billing_email` varchar(255) NOT NULL,
  `org_logo` varchar(200) NOT NULL,
  `bill_by_email` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_usr_id_idx` (`usr_id`),
  KEY `fk_cntry_id_idx` (`cntr_id`),
  KEY `fk_stt_id_idx` (`stt_id`),
  KEY `fk_ct_id_idx` (`ct_id`),
  KEY `business_type` (`business_type`),
  KEY `web_site` (`web_site`),
  KEY `role` (`role`),
  KEY `billing_email` (`billing_email`),
  KEY `bill_by_email` (`bill_by_email`),
  CONSTRAINT `employer_details_ibfk_1` FOREIGN KEY (`usr_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employer_details_ibfk_2` FOREIGN KEY (`cntr_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employer_details_ibfk_3` FOREIGN KEY (`stt_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employer_details_ibfk_4` FOREIGN KEY (`ct_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `employer_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `emplyr_id` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `comment` text,
  `dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `emplyr_id_idx` (`emplyr_id`),
  KEY `fk_usr_id_idx` (`usr_id`),
  CONSTRAINT `employer_ratings_ibfk_1` FOREIGN KEY (`emplyr_id`) REFERENCES `employer_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `employer_ratings_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `job_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `comment` text,
  `dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_job_id_idx` (`job_id`),
  KEY `fk_usr_id_idx` (`usr_id`),
  CONSTRAINT `job_ratings_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `job_ratings_ibfk_2` FOREIGN KEY (`usr_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `job_skill_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) DEFAULT NULL,
  `skill_tag_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_job_id_idx` (`job_id`),
  KEY `fk_skill_id_idx` (`skill_tag_id`),
  CONSTRAINT `fk_job_id` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_skill_id` FOREIGN KEY (`skill_tag_id`) REFERENCES `skill_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `job_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `skill` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `skill` (`skill`),
  FULLTEXT KEY `skill_2` (`skill`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE `job_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_nm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_type_id` int(11) DEFAULT NULL,
  `emplyr_id` int(11) DEFAULT NULL,
  `pay_mode_id` int(11) DEFAULT NULL,
  `job_ttl` varchar(100) DEFAULT NULL,
  `resp` text NOT NULL COMMENT 'responsibilities field from the form',
  `job_desc_sort` varchar(255) DEFAULT NULL,
  `job_desc_long` text,
  `strt_dt` date DEFAULT NULL,
  `end_dt` date DEFAULT NULL,
  `min_pay` decimal(6,2) DEFAULT NULL COMMENT 'this column is used to store the amount employee supposed to get',
  `max_pay` decimal(6,2) DEFAULT NULL COMMENT 'this column is used to store the amount the employer supposed to give including all the charges and taxes ',
  `shift_charges` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `last_dt_appl` date DEFAULT NULL,
  `job_st_time` varchar(20) DEFAULT NULL,
  `job_end_time` varchar(20) DEFAULT NULL,
  `othr_org_nm` varchar(200) DEFAULT NULL,
  `othr_org_bsnss` int(11) DEFAULT NULL,
  `othr_org_addr` text,
  `othr_org_pstl_cd` varchar(10) DEFAULT NULL,
  `othr_org_phone` varchar(25) DEFAULT NULL,
  `othr_org_website` varchar(200) DEFAULT NULL,
  `is_othr_org` tinyint(1) NOT NULL DEFAULT '0',
  `posted_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `background_img` text,
  PRIMARY KEY (`id`),
  KEY `fk_job_type_id_idx` (`job_type_id`),
  KEY `fk_emplr_id_idx` (`emplyr_id`),
  KEY `fk_pay_mode_id_idx` (`pay_mode_id`),
  KEY `posted_on` (`posted_on`),
  KEY `is_deleted` (`is_deleted`),
  CONSTRAINT `fk_emplr_id` FOREIGN KEY (`emplyr_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_job_type_id` FOREIGN KEY (`job_type_id`) REFERENCES `job_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_pay_mode_id` FOREIGN KEY (`pay_mode_id`) REFERENCES `pay_modes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

CREATE TABLE `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `redirect_uri` varchar(2000) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `oauth_clients` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` varchar(2000) NOT NULL,
  `grant_types` varchar(80) DEFAULT NULL,
  `scope` varchar(100) DEFAULT NULL,
  `user_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `oauth_jwt` (
  `client_id` varchar(80) NOT NULL,
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `scope` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `oauth_scopes` (
  `scope` text,
  `is_default` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `oauth_users` (
  `username` varchar(255) NOT NULL,
  `password` varchar(2000) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `organizations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bsnss_nm` varchar(100) NOT NULL,
  `pstl_addr` text NOT NULL,
  `cntr_id` int(11) NOT NULL,
  `stt_id` int(11) NOT NULL,
  `ct_id` int(11) NOT NULL,
  `pstl_cd` varchar(15) NOT NULL,
  `cntct_prsn` varchar(45) NOT NULL,
  `cntct_num_1` varchar(10) NOT NULL,
  `cntct_num_2` varchar(10) DEFAULT NULL,
  `cntct_email_1` varchar(100) NOT NULL,
  `cntct_email_2` varchar(100) DEFAULT NULL,
  `stts` tinyint(1) DEFAULT '0',
  `webaddress` varchar(200) NOT NULL,
  `key` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cntry_id_idx` (`cntr_id`),
  KEY `fk_stt_id_idx` (`stt_id`),
  KEY `fk_ct_id_idx` (`ct_id`),
  KEY `webaddress` (`webaddress`,`key`),
  CONSTRAINT `fk_cntry_id` FOREIGN KEY (`cntr_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ct_id` FOREIGN KEY (`ct_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stt_id` FOREIGN KEY (`stt_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `pay_modes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mode` varchar(45) DEFAULT NULL COMMENT 'hourly, daily, monthly, weekly, end of period',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `skill_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_tag` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `skill_tag` (`skill_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

CREATE TABLE `social_auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_type_nm` varchar(45) NOT NULL,
  `auth_key` varchar(45) NOT NULL,
  `auth_url` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contry_id` int(11) DEFAULT NULL,
  `stt_nm` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cntry_id_idx` (`contry_id`),
  CONSTRAINT `states_ibfk_1` FOREIGN KEY (`contry_id`) REFERENCES `countries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `user_social_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) DEFAULT NULL,
  `gndr` varchar(10) DEFAULT NULL,
  `f_nm` varchar(45) DEFAULT NULL,
  `l_nm` varchar(45) DEFAULT NULL,
  `m_nm` varchar(45) DEFAULT NULL,
  `cntct_num1` varchar(20) DEFAULT NULL,
  `cntct_num2` varchar(20) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `edctn` varchar(100) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `ct` varchar(100) DEFAULT NULL,
  `stt` varchar(100) DEFAULT NULL,
  `cntry` varchar(100) DEFAULT NULL,
  `is_single` tinyint(1) DEFAULT NULL,
  `auth_key` varchar(255) DEFAULT NULL,
  `profile_pic` text,
  `key_expiry` datetime DEFAULT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  `raw_data` text,
  `social_auth_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usr_id_idx` (`usr_id`),
  KEY `fk_scl_auth_id_idx` (`social_auth_id`),
  CONSTRAINT `fk_scl_auth_id` FOREIGN KEY (`social_auth_id`) REFERENCES `social_auths` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usr_id` FOREIGN KEY (`usr_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `user_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT '0',
  `usr_type_nm` varchar(45) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  `stts` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_org_id_idx` (`org_id`),
  CONSTRAINT `fk_org_id` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `usr_type_id` int(11) DEFAULT NULL,
  `prnt_usr_id` int(11) DEFAULT '0',
  `usr_nm` varchar(25) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `salt` varchar(200) NOT NULL,
  `stts` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `usr_nm` (`usr_nm`),
  KEY `fk_org_id_idx` (`org_id`),
  KEY `fk_usr_type_id_idx` (`usr_type_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `organizations` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`usr_type_id`) REFERENCES `user_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

CREATE TABLE `worker_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) DEFAULT NULL,
  `gndr` tinyint(1) DEFAULT NULL,
  `fnm` varchar(50) DEFAULT NULL,
  `mnm` varchar(50) DEFAULT NULL,
  `lnm` varchar(50) DEFAULT NULL,
  `cntct_addr` text,
  `cntr_id` int(11) DEFAULT NULL,
  `st_id` int(11) DEFAULT NULL,
  `ct_id` int(11) DEFAULT NULL,
  `pstl_cd` varchar(10) DEFAULT NULL,
  `cntct_num1` varchar(100) DEFAULT NULL,
  `cntct_num2` varchar(10) DEFAULT NULL,
  `email1` varchar(100) DEFAULT NULL,
  `email2` varchar(100) DEFAULT NULL,
  `prfrd_cntct_time` varchar(45) DEFAULT NULL,
  `profile_pic` text,
  `account_number_iban` varchar(50) NOT NULL,
  `dscrptn` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usr_id_idx` (`usr_id`),
  KEY `fk_cntry_id_idx` (`cntr_id`),
  KEY `fk_stt_id_idx` (`st_id`),
  KEY `fk_city_id_idx` (`ct_id`),
  CONSTRAINT `worker_details_ibfk_1` FOREIGN KEY (`cntr_id`) REFERENCES `countries` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `worker_details_ibfk_2` FOREIGN KEY (`st_id`) REFERENCES `states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `worker_details_ibfk_3` FOREIGN KEY (`ct_id`) REFERENCES `cities` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `worker_details_ibfk_4` FOREIGN KEY (`usr_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `worker_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) NOT NULL,
  `doc_type_id` varchar(3) NOT NULL COMMENT 'DLC,HPT,OTH',
  `doc_path` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usr_id` (`usr_id`),
  KEY `doc_type_id` (`doc_type_id`),
  CONSTRAINT `worker_docs_ibfk_1` FOREIGN KEY (`usr_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `worker_education_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) NOT NULL,
  `edu_type_id` int(11) NOT NULL,
  `institution` varchar(200) NOT NULL,
  `subject` varchar(200) NOT NULL,
  `year` int(11) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `experties` text,
  PRIMARY KEY (`id`),
  KEY `usr_id` (`usr_id`),
  CONSTRAINT `worker_education_details_ibfk_1` FOREIGN KEY (`usr_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

CREATE TABLE `worker_experiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) NOT NULL,
  `dsgntn` varchar(100) NOT NULL,
  `org_nm` varchar(200) NOT NULL,
  `from` date NOT NULL,
  `to` date NOT NULL,
  `skills` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usr_id` (`usr_id`),
  CONSTRAINT `worker_experiences_ibfk_1` FOREIGN KEY (`usr_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `worker_preferences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) NOT NULL,
  `setting` varchar(50) NOT NULL,
  `value` varchar(100) NOT NULL,
  `description` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usr_id` (`usr_id`,`setting`,`value`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `worker_ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` int(11) DEFAULT NULL,
  `usr_id` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `comment` text,
  `dt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_wrkr_id_idx` (`worker_id`),
  KEY `fk_usr_id_idx` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `worker_skill_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wrkr_id` int(11) NOT NULL,
  `skill_tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_wrkr_id_idx` (`wrkr_id`),
  KEY `fk_skill_tag_id_idx` (`skill_tag_id`),
  CONSTRAINT `worker_skill_tags_ibfk_1` FOREIGN KEY (`wrkr_id`) REFERENCES `worker_details` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `worker_skill_tags_ibfk_2` FOREIGN KEY (`skill_tag_id`) REFERENCES `skill_tags` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `worker_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wrkr_id` int(11) NOT NULL,
  `skill` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wrkr_id` (`wrkr_id`,`skill`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

