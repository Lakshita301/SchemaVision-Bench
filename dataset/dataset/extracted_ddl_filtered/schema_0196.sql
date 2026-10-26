-- Source: https://github.com/Ferzen/cmdb/blob/df36032846152d78c1f50c82c26560c8025596ef/doc/cmdb.sql?raw=true
-- Tables detected: 47 | FK/REFERENCES mentions: 38

CREATE TABLE `AuthNode` (
  `uuid` char(32) NOT NULL,
  `auth` tinyint(1) NOT NULL,
  `datetime` datetime NOT NULL,
  `node_id` char(32) DEFAULT NULL,
  `user_name_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `AuthNode_c693ebc8` (`node_id`),
  KEY `AuthNode_f10400a0` (`user_name_id`),
  CONSTRAINT `AuthNode_node_id_1f87fa44f6684140_fk_assets_host_uuid` FOREIGN KEY (`node_id`) REFERENCES `assets_host` (`uuid`),
  CONSTRAINT `AuthNode_user_name_id_2f11b0adc9c83a00_fk_users_customuser_id` FOREIGN KEY (`user_name_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `AuthSudo` (
  `uuid` char(32) NOT NULL,
  `groupname` varchar(64) NOT NULL,
  `shell` longtext NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_conftemplate` (
  `uuid` char(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  `init_file` longtext NOT NULL,
  `template_file` longtext NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_host` (
  `uuid` char(32) NOT NULL,
  `node_name` varchar(100) DEFAULT NULL,
  `eth1` char(15) DEFAULT NULL,
  `eth2` char(15) DEFAULT NULL,
  `mac` varchar(20) DEFAULT NULL,
  `internal_ip` char(15) DEFAULT NULL,
  `brand` varchar(64) DEFAULT NULL,
  `cpu` varchar(64) DEFAULT NULL,
  `hard_disk` varchar(128) DEFAULT NULL,
  `memory` varchar(128) DEFAULT NULL,
  `system` varchar(32) DEFAULT NULL,
  `system_cpuarch` varchar(32) DEFAULT NULL,
  `system_version` varchar(8) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `guarantee_date` date DEFAULT NULL,
  `cabinet` varchar(32) DEFAULT NULL,
  `server_cabinet_id` int(11) DEFAULT NULL,
  `number` varchar(32) DEFAULT NULL,
  `editor` longtext,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `Services_Code` varchar(16) DEFAULT NULL,
  `env` varchar(32) DEFAULT NULL,
  `room_number` varchar(32) DEFAULT NULL,
  `server_sn` varchar(32) DEFAULT NULL,
  `switch_port` varchar(12) DEFAULT NULL,
  `idle` tinyint(1) NOT NULL,
  `idc_id` char(32),
  `vm_id` char(32),
  PRIMARY KEY (`uuid`),
  KEY `assets_host_0869e37a` (`idc_id`),
  KEY `assets_host_0e0cecb8` (`vm_id`),
  CONSTRAINT `assets_host_idc_id_fc02f1e2acbbcc_fk_assets_idc_uuid` FOREIGN KEY (`idc_id`) REFERENCES `assets_idc` (`uuid`),
  CONSTRAINT `assets_host_vm_id_75080968af94dfe0_fk_assets_host_uuid` FOREIGN KEY (`vm_id`) REFERENCES `assets_host` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_host_business` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` char(32) NOT NULL,
  `project_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host_id` (`host_id`,`project_id`),
  KEY `assets_host_business_8396f175` (`host_id`),
  KEY `assets_host_business_b098ad43` (`project_id`),
  CONSTRAINT `assets_host_b_project_id_7e1fdf33706676c3_fk_assets_project_uuid` FOREIGN KEY (`project_id`) REFERENCES `assets_project` (`uuid`),
  CONSTRAINT `assets_host_busines_host_id_185b5e5decf9451d_fk_assets_host_uuid` FOREIGN KEY (`host_id`) REFERENCES `assets_host` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_host_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` char(32) NOT NULL,
  `service_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `host_id` (`host_id`,`service_id`),
  KEY `assets_host_service_8396f175` (`host_id`),
  KEY `assets_host_service_b0dc1e29` (`service_id`),
  CONSTRAINT `assets_host_s_service_id_1f5ce3d13bb0764b_fk_assets_service_uuid` FOREIGN KEY (`service_id`) REFERENCES `assets_service` (`uuid`),
  CONSTRAINT `assets_host_service_host_id_660cc79feac0eb15_fk_assets_host_uuid` FOREIGN KEY (`host_id`) REFERENCES `assets_host` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_hostrecord` (
  `uuid` char(32) NOT NULL,
  `user` varchar(30) DEFAULT NULL,
  `time` datetime NOT NULL,
  `content` longtext,
  `comment` longtext,
  `host_id` char(32) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `assets_hostrecord_8396f175` (`host_id`),
  CONSTRAINT `assets_hostrecord_host_id_3b740786ef5f690a_fk_assets_host_uuid` FOREIGN KEY (`host_id`) REFERENCES `assets_host` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_idc` (
  `uuid` char(32) NOT NULL,
  `name` varchar(64) NOT NULL,
  `bandwidth` varchar(64) DEFAULT NULL,
  `phone` varchar(32) NOT NULL,
  `linkman` varchar(32) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `network` longtext,
  `create_time` date NOT NULL,
  `operator` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `comment` longtext,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_iplist` (
  `uuid` char(32) NOT NULL,
  `network` varchar(32) DEFAULT NULL,
  `ip` varchar(16) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `idc_id` char(32) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `assets_iplist_0869e37a` (`idc_id`),
  CONSTRAINT `assets_iplist_idc_id_4118d0827945673f_fk_assets_idc_uuid` FOREIGN KEY (`idc_id`) REFERENCES `assets_idc` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_line` (
  `uuid` char(32) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_project` (
  `uuid` char(32) NOT NULL,
  `service_name` varchar(60) DEFAULT NULL,
  `aliases_name` varchar(60) DEFAULT NULL,
  `description` longtext,
  `project_doc` longtext,
  `project_user_group` longtext,
  `sort` int(11) DEFAULT NULL,
  `line_id` char(32) DEFAULT NULL,
  `project_contact_id` int(11) NOT NULL,
  `project_contact_backup_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `assets_project_line_id_3271c84b6deb8f1f_fk_assets_line_uuid` (`line_id`),
  KEY `assets_project_087d62fc` (`project_contact_id`),
  KEY `assets_project_227d338f` (`project_contact_backup_id`),
  CONSTRAINT `asset_project_contact_id_55a9a08f4b924c8c_fk_users_customuser_id` FOREIGN KEY (`project_contact_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `assets_project_line_id_3271c84b6deb8f1f_fk_assets_line_uuid` FOREIGN KEY (`line_id`) REFERENCES `assets_line` (`uuid`),
  CONSTRAINT `d46f719c8dcde971d1e0990f038ba85a` FOREIGN KEY (`project_contact_backup_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_projectuser` (
  `uuid` char(32) NOT NULL,
  `data_created` datetime NOT NULL,
  `env` varchar(100) DEFAULT NULL,
  `project_id` char(32) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `assets_projec_project_id_298fad6d989e9c44_fk_assets_project_uuid` (`project_id`),
  KEY `assets_projectuser_e8701ad4` (`user_id`),
  CONSTRAINT `assets_projec_project_id_298fad6d989e9c44_fk_assets_project_uuid` FOREIGN KEY (`project_id`) REFERENCES `assets_project` (`uuid`),
  CONSTRAINT `assets_projectus_user_id_53f8464903c02003_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_service` (
  `uuid` char(32) NOT NULL,
  `name` varchar(30) NOT NULL,
  `port` int(11) DEFAULT NULL,
  `remark` longtext,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `assets_zabbixrecord` (
  `uuid` char(32) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `type` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `info` longtext,
  `time` datetime NOT NULL,
  `comment` longtext,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `audit_ssh_audit` (
  `uuid` char(32) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `bash_shell` longtext NOT NULL,
  `audit_data_time` datetime NOT NULL,
  `server_ip` char(15) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_0e939a4f` (`group_id`),
  KEY `auth_group_permissions_8373b171` (`permission_id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_417f1b1c` (`content_type_id`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

CREATE TABLE `cmdb_auth_auth_group` (
  `uuid` char(32) NOT NULL,
  `group_name` varchar(100) NOT NULL,
  `enable` tinyint(1) NOT NULL,
  `explanation` longtext NOT NULL,
  `date_time` datetime NOT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `group_name` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cmdb_auth_auth_group_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_group_id` char(32) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_id` (`auth_group_id`,`customuser_id`),
  KEY `cmdb_auth_auth_group_group_user_af3f5f04` (`auth_group_id`),
  KEY `cmdb_auth_auth_group_group_user_721e74b0` (`customuser_id`),
  CONSTRAINT `cmdb_auth__customuser_id_33ec160b6f4a2e93_fk_users_customuser_id` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `cmdb_auth_group_id_19c331db012ad2d9_fk_cmdb_auth_auth_group_uuid` FOREIGN KEY (`auth_group_id`) REFERENCES `cmdb_auth_auth_group` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `cmdb_auth_user_auth_cmdb` (
  `uuid` char(32) NOT NULL,
  `select_host` tinyint(1) NOT NULL,
  `edit_host` tinyint(1) NOT NULL,
  `update_host` tinyint(1) NOT NULL,
  `add_host` tinyint(1) NOT NULL,
  `bat_add_host` tinyint(1) NOT NULL,
  `delete_host` tinyint(1) NOT NULL,
  `add_line_auth` tinyint(1) NOT NULL,
  `auth_project` tinyint(1) NOT NULL,
  `auth_highstate` tinyint(1) NOT NULL,
  `add_user` tinyint(1) NOT NULL,
  `edit_user` tinyint(1) NOT NULL,
  `edit_pass` tinyint(1) NOT NULL,
  `delete_user` tinyint(1) NOT NULL,
  `add_department` tinyint(1) NOT NULL,
  `select_idc` tinyint(1) NOT NULL,
  `add_idc` tinyint(1) NOT NULL,
  `edit_idc` tinyint(1) NOT NULL,
  `del_idc` tinyint(1) NOT NULL,
  `setup_system` tinyint(1) NOT NULL,
  `upload_system` tinyint(1) NOT NULL,
  `salt_keys` tinyint(1) NOT NULL,
  `project_auth` tinyint(1) NOT NULL,
  `add_project` tinyint(1) NOT NULL,
  `edit_project` tinyint(1) NOT NULL,
  `delete_project` tinyint(1) NOT NULL,
  `auth_log` tinyint(1) NOT NULL,
  `cmdb_log` tinyint(1) NOT NULL,
  `server_audit` tinyint(1) NOT NULL,
  `group_name_id` char(32) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `cmdb_auth_user_auth_cmdb_e074f38c` (`group_name_id`),
  CONSTRAINT `cmdb_group_name_id_40e2c7660ed38540_fk_cmdb_auth_auth_group_uuid` FOREIGN KEY (`group_name_id`) REFERENCES `cmdb_auth_auth_group` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_417f1b1c` (`content_type_id`),
  KEY `django_admin_log_e8701ad4` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `gitCode` (
  `uuid` char(32) NOT NULL,
  `codePath` varchar(64) NOT NULL,
  `codeserver` varchar(64) NOT NULL,
  `codeFqdn` varchar(64) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `incident` (
  `uuid` char(32) NOT NULL,
  `title` varchar(256) NOT NULL,
  `ip` char(15) DEFAULT NULL,
  `url` longtext,
  `projectuser` varchar(32) NOT NULL,
  `closeuser` varchar(32) DEFAULT NULL,
  `source` int(11) NOT NULL,
  `starttime` datetime NOT NULL,
  `scantime` datetime DEFAULT NULL,
  `stoptime` datetime DEFAULT NULL,
  `mailcomment` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `classical` tinyint(1) NOT NULL,
  `grade` int(11) DEFAULT NULL,
  `comment` longtext NOT NULL,
  `project_principal` varchar(32) DEFAULT NULL,
  `incident_user` varchar(32) DEFAULT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `monitor_monitorhttp` (
  `uuid` char(32) NOT NULL,
  `title` varchar(120) NOT NULL,
  `url` longtext NOT NULL,
  `monitor_type` tinyint(1) NOT NULL,
  `monitor_ip` longtext NOT NULL,
  `mail_status` tinyint(1) NOT NULL,
  `mail` longtext NOT NULL,
  `weixin_status` tinyint(1) NOT NULL,
  `weixin` longtext NOT NULL,
  `payload` longtext,
  `status` tinyint(1) NOT NULL,
  `result_code` tinyint(1) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `monitor_monitorhttplog` (
  `uuid` char(32) NOT NULL,
  `monitorId` varchar(120) NOT NULL,
  `monitor_title` varchar(120) NOT NULL,
  `content` longtext,
  `code` int(11) NOT NULL,
  `job_id` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `monitor_monitormysql` (
  `uuid` char(32) NOT NULL,
  `name` varchar(120) NOT NULL,
  `monitor_ip` longtext NOT NULL,
  `monitor_user` varchar(32) NOT NULL,
  `monitor_pass` varchar(128) NOT NULL,
  `monitor_port` int(11) NOT NULL,
  `mail` longtext NOT NULL,
  `weixin` longtext NOT NULL,
  `slave` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `createtime` datetime NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project_swan` (
  `uuid` char(32) NOT NULL,
  `swan_name` varchar(100) NOT NULL,
  `code_name` varchar(100) NOT NULL,
  `choose` varchar(10) NOT NULL,
  `check_port_status` tinyint(1) NOT NULL,
  `check_port` varchar(30) DEFAULT NULL,
  `bat_push` int(11) NOT NULL,
  `tgt` longtext,
  `argall_str` varchar(20) DEFAULT NULL,
  `tomcat_init` varchar(128) DEFAULT NULL,
  `cache` longtext,
  `git_code_user` varchar(12) DEFAULT NULL,
  `code_path` varchar(128) DEFAULT NULL,
  `git_user` varchar(12) DEFAULT NULL,
  `git_pass` varchar(64) DEFAULT NULL,
  `shell` varchar(128) DEFAULT NULL,
  `shell_status` tinyint(1) NOT NULL,
  `CheckUrl` varchar(200) DEFAULT NULL,
  `datetime` datetime NOT NULL,
  `git_code_id` char(32) DEFAULT NULL,
  `project_name_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `project_swan_5890d2d4` (`git_code_id`),
  KEY `project_swan_6fa54945` (`project_name_id`),
  CONSTRAINT `project__project_name_id_7f50db0e92eba344_fk_assets_project_uuid` FOREIGN KEY (`project_name_id`) REFERENCES `assets_project` (`uuid`),
  CONSTRAINT `project_swan_git_code_id_108333599249714f_fk_gitCode_uuid` FOREIGN KEY (`git_code_id`) REFERENCES `gitCode` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project_swan_node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_swan_id` char(32) NOT NULL,
  `host_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_swan_id` (`project_swan_id`,`host_id`),
  KEY `project_swan_node_a3e2b54e` (`project_swan_id`),
  KEY `project_swan_node_8396f175` (`host_id`),
  CONSTRAINT `project_sw_project_swan_id_4814a3a6ff88c636_fk_project_swan_uuid` FOREIGN KEY (`project_swan_id`) REFERENCES `project_swan` (`uuid`),
  CONSTRAINT `project_swan_node_host_id_633f2c729f485d77_fk_assets_host_uuid` FOREIGN KEY (`host_id`) REFERENCES `assets_host` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project_swan_push_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_swan_id` char(32) NOT NULL,
  `customuser_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_swan_id` (`project_swan_id`,`customuser_id`),
  KEY `project_swan_push_user_a3e2b54e` (`project_swan_id`),
  KEY `project_swan_push_user_721e74b0` (`customuser_id`),
  CONSTRAINT `project_sw_customuser_id_3822f6570ff53a30_fk_users_customuser_id` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `project_swa_project_swan_id_79291c907c649f9_fk_project_swan_uuid` FOREIGN KEY (`project_swan_id`) REFERENCES `project_swan` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `push_system` (
  `uuid` char(32) NOT NULL,
  `project_name` int(11) NOT NULL,
  `push_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salt_ui_operationlog` (
  `uuid` char(32) NOT NULL,
  `content` longtext NOT NULL,
  `mail_list` longtext,
  `mail_title` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL,
  `mail_status` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `salt_ui_operationlog_e8701ad4` (`user_id`),
  CONSTRAINT `salt_ui_operatio_user_id_69db0895519a6008_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salt_ui_salt_api_log` (
  `uuid` char(32) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `minions` varchar(2048) NOT NULL,
  `jobs_id` varchar(40) DEFAULT NULL,
  `stalt_type` varchar(20) NOT NULL,
  `salt_len_node` int(11) NOT NULL,
  `stalt_input` varchar(100) DEFAULT NULL,
  `api_return` longtext NOT NULL,
  `log_time` datetime NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salt_ui_salt_conf` (
  `uuid` char(32) NOT NULL,
  `server_name` varchar(20) NOT NULL,
  `prod_name` varchar(20) NOT NULL,
  `file_name` varchar(20) NOT NULL,
  `server_code` longtext NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salt_ui_salt_mode_name` (
  `uuid` char(32) NOT NULL,
  `sls_name` varchar(20) NOT NULL,
  `sls_description` longtext,
  `sls_conf` int(11) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `salt_ui_setuplog` (
  `uuid` char(32) NOT NULL,
  `content` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `approve_time` datetime DEFAULT NULL,
  `reject_reason` longtext,
  `date_created` datetime NOT NULL,
  `run_time` datetime DEFAULT NULL,
  `approve_user_id` int(11) DEFAULT NULL,
  `business_id` char(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `salt_ui_setuplog_549dea8c` (`approve_user_id`),
  KEY `salt_ui_setuplog_2f4e4ac4` (`business_id`),
  KEY `salt_ui_setuplog_e8701ad4` (`user_id`),
  CONSTRAINT `salt_ui__approve_user_id_6c1570f72dd3c666_fk_users_customuser_id` FOREIGN KEY (`approve_user_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `salt_ui_setu_business_id_3f48417490749bc5_fk_assets_project_uuid` FOREIGN KEY (`business_id`) REFERENCES `assets_project` (`uuid`),
  CONSTRAINT `salt_ui_setuplog_user_id_23d803f7d2e28ce0_fk_users_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `swan_apply` (
  `uuid` char(32) NOT NULL,
  `applyer` varchar(32) DEFAULT NULL,
  `project_name` varchar(20) DEFAULT NULL,
  `module_name` varchar(200) DEFAULT NULL,
  `module_type` int(10) unsigned DEFAULT NULL,
  `module_tgt` varchar(50) DEFAULT NULL,
  `qa` varchar(20) DEFAULT NULL,
  `op` varchar(20) DEFAULT NULL,
  `comment` longtext,
  `status` int(10) unsigned DEFAULT NULL,
  `date_added` datetime,
  `date_one` datetime DEFAULT NULL,
  `date_ended` datetime DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `swan_swanlog` (
  `uuid` char(32) NOT NULL,
  `username` varchar(32) DEFAULT NULL,
  `userID` varchar(128) DEFAULT NULL,
  `project_name` varchar(20) DEFAULT NULL,
  `project_uuid` varchar(64) DEFAULT NULL,
  `module_name` varchar(200) DEFAULT NULL,
  `module_args` varchar(32) DEFAULT NULL,
  `swan_datetime` datetime,
  `status` tinyint(1) NOT NULL,
  `message` longtext,
  `swan_name` varchar(64),
  `update_log` longtext,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_customuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `email` varchar(254) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `mobile` varchar(30) NOT NULL,
  `session_key` varchar(60) DEFAULT NULL,
  `user_key` longtext,
  `menu_status` tinyint(1) NOT NULL,
  `user_active` tinyint(1) NOT NULL,
  `uuid` varchar(64) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `department_id` int(11),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `users_customuser_bf691be4` (`department_id`),
  CONSTRAINT `users_department_id_7ef5db15268629e1_fk_users_department_mode_id` FOREIGN KEY (`department_id`) REFERENCES `users_department_mode` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `users_customuser_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customuser_id` (`customuser_id`,`group_id`),
  KEY `users_customuser_groups_721e74b0` (`customuser_id`),
  KEY `users_customuser_groups_0e939a4f` (`group_id`),
  CONSTRAINT `users_cust_customuser_id_3ff7151cd75e2907_fk_users_customuser_id` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`),
  CONSTRAINT `users_customuser_grou_group_id_7bd979d963ceefdb_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_customuser_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customuser_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `customuser_id` (`customuser_id`,`permission_id`),
  KEY `users_customuser_user_permissions_721e74b0` (`customuser_id`),
  KEY `users_customuser_user_permissions_8373b171` (`permission_id`),
  CONSTRAINT `users_custo_permission_id_26c8d8c42be54c0a_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_custom_customuser_id_cd602244af3539_fk_users_customuser_id` FOREIGN KEY (`customuser_id`) REFERENCES `users_customuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_department_mode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_name` varchar(64) DEFAULT NULL,
  `description` longtext,
  `desc_gid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_departmentgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_groups_name` varchar(64) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users_server_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_ip` char(15) DEFAULT NULL,
  `user_name` varchar(20) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `auth_weights` tinyint(1) NOT NULL,
  `datetime` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

