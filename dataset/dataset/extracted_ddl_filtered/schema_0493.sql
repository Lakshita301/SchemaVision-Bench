-- Source: https://github.com/RadimPesa/las-docker-edirex/blob/4c7f27e18983696c5493a4baca48a199daec7541/web/las/storage/database/script/storage0.sql?raw=true
-- Tables detected: 39 | FK/REFERENCES mentions: 37

CREATE TABLE `aliquot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genealogyID` varchar(30) NOT NULL,
  `idContainer` int(11) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `startTimestamp` datetime DEFAULT NULL,
  `endTimestamp` datetime DEFAULT NULL,
  `startOperator` int(11) DEFAULT NULL,
  `endOperator` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_aliquot_1` (`idContainer`),
  CONSTRAINT `fk_aliquot_1` FOREIGN KEY (`idContainer`) REFERENCES `container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=227032 DEFAULT CHARSET=latin1;

CREATE TABLE `aliquot_audit` (
  `id` int(11) NOT NULL,
  `genealogyID` varchar(30) NOT NULL,
  `idContainer` int(11) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `startTimestamp` datetime DEFAULT NULL,
  `endTimestamp` datetime DEFAULT NULL,
  `startOperator` int(11) DEFAULT NULL,
  `endOperator` int(11) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `_audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `_audit_timestamp` datetime NOT NULL,
  `_audit_change_type` varchar(1) NOT NULL,
  PRIMARY KEY (`_audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=228231 DEFAULT CHARSET=latin1;

CREATE TABLE `archive_member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1693 DEFAULT CHARSET=latin1;

CREATE TABLE `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idContainerType` int(11) NOT NULL,
  `idFatherContainer` int(11) DEFAULT NULL,
  `idGeometry` int(11) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `barcode` varchar(45) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `full` tinyint(1) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `present` tinyint(1) DEFAULT '1',
  `oneUse` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `barcode_UNIQUE` (`barcode`),
  KEY `fk_Container_ContainerType1` (`idContainerType`),
  KEY `fk_container_container1` (`idFatherContainer`),
  CONSTRAINT `fk_container_container1` FOREIGN KEY (`idFatherContainer`) REFERENCES `container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Container_ContainerType1` FOREIGN KEY (`idContainerType`) REFERENCES `containertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=124303 DEFAULT CHARSET=latin1;

CREATE TABLE `container_audit` (
  `id` int(11) NOT NULL,
  `idContainerType` int(11) NOT NULL,
  `idFatherContainer` int(11) DEFAULT NULL,
  `idGeometry` int(11) DEFAULT NULL,
  `position` varchar(10) DEFAULT NULL,
  `barcode` varchar(45) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `full` tinyint(1) NOT NULL,
  `owner` varchar(45) DEFAULT NULL,
  `present` tinyint(1) DEFAULT '1',
  `oneUse` tinyint(1) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `_audit_id` int(11) NOT NULL AUTO_INCREMENT,
  `_audit_timestamp` datetime NOT NULL,
  `_audit_change_type` varchar(1) NOT NULL,
  PRIMARY KEY (`_audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=340007 DEFAULT CHARSET=latin1;

CREATE TABLE `containerfeature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFeature` int(11) NOT NULL,
  `idContainer` int(11) NOT NULL,
  `value` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ContainerFeature_Container1` (`idContainer`),
  KEY `fk_ContainerFeature_Feature1` (`idFeature`),
  CONSTRAINT `fk_ContainerFeature_Container1` FOREIGN KEY (`idContainer`) REFERENCES `container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ContainerFeature_Feature1` FOREIGN KEY (`idFeature`) REFERENCES `feature` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=170546 DEFAULT CHARSET=latin1;

CREATE TABLE `containerinput` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idContainer` int(11) NOT NULL,
  `idInput` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ContainerOutput_Container1` (`idContainer`),
  KEY `fk_ContainerInput_Input1` (`idInput`),
  CONSTRAINT `fk_ContainerInput_Input1` FOREIGN KEY (`idInput`) REFERENCES `input` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ContainerOutput_Container10` FOREIGN KEY (`idContainer`) REFERENCES `container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `containeroutput` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idOutput` int(11) NOT NULL,
  `idContainer` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ContainerOutput_Container1` (`idContainer`),
  KEY `fk_ContainerOutput_Output1` (`idOutput`),
  CONSTRAINT `fk_ContainerOutput_Container1` FOREIGN KEY (`idContainer`) REFERENCES `container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ContainerOutput_Output1` FOREIGN KEY (`idOutput`) REFERENCES `output` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `containerrequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRequest` int(11) NOT NULL,
  `idContainer` int(11) NOT NULL,
  `executed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ContainerRequest_Container1` (`idContainer`),
  KEY `fk_ContainerRequest_Request1` (`idRequest`),
  CONSTRAINT `fk_ContainerRequest_Container1` FOREIGN KEY (`idContainer`) REFERENCES `container` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ContainerRequest_Request1` FOREIGN KEY (`idRequest`) REFERENCES `request` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `containertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `actualName` varchar(50) NOT NULL,
  `maxPosition` int(11) DEFAULT NULL,
  `idGenericContainerType` int(11) DEFAULT NULL,
  `idGeometry` int(11) DEFAULT NULL,
  `catalogNumber` varchar(50) DEFAULT NULL,
  `producer` varchar(50) DEFAULT NULL,
  `linkFile` varchar(100) DEFAULT NULL,
  `oneUse` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  KEY `fk_ContainerType_GenericContainerType1` (`idGenericContainerType`),
  KEY `fk_containertype_1` (`idGeometry`),
  CONSTRAINT `fk_containertype_1` FOREIGN KEY (`idGeometry`) REFERENCES `geometry` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ContainerType_GenericContainerType1` FOREIGN KEY (`idGenericContainerType`) REFERENCES `genericcontainertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

CREATE TABLE `containertypefeature` (
  `id` int(11) NOT NULL,
  `idFeature` int(11) NOT NULL,
  `idContainerType` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Feature_id_UNIQUE` (`idFeature`),
  UNIQUE KEY `ContainerType_id_UNIQUE` (`idContainerType`),
  KEY `fk_ContainerType_has_Feature_Feature1` (`idFeature`),
  KEY `fk_ContainerType_has_Feature_ContainerType1` (`idContainerType`),
  CONSTRAINT `fk_ContainerType_has_Feature_ContainerType1` FOREIGN KEY (`idContainerType`) REFERENCES `containertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ContainerType_has_Feature_Feature1` FOREIGN KEY (`idFeature`) REFERENCES `feature` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `conttypehasconttype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idContainer` int(11) DEFAULT NULL,
  `idContained` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_conttypehasconttype_containerType1` (`idContainer`),
  KEY `fk_conttypehasconttype_containerType2` (`idContained`),
  CONSTRAINT `fk_conttypehasconttype_containerType1` FOREIGN KEY (`idContainer`) REFERENCES `containertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_conttypehasconttype_containerType2` FOREIGN KEY (`idContained`) REFERENCES `containertype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

CREATE TABLE `currentaliquot` (
  `id` tinyint NOT NULL,
  `genealogyID` tinyint NOT NULL,
  `idContainer` tinyint NOT NULL,
  `position` tinyint NOT NULL,
  `startTimestamp` tinyint NOT NULL,
  `endTimestamp` tinyint NOT NULL,
  `startOperator` tinyint NOT NULL,
  `endOperator` tinyint NOT NULL
) ENGINE=MyISAM */;

CREATE TABLE `defaultvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `longName` varchar(20) NOT NULL,
  `abbreviation` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1750 DEFAULT CHARSET=latin1;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `featuredefaultvalue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idFeature` int(11) NOT NULL,
  `idDefaultValue` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_featureDefaultValue_feature1` (`idFeature`),
  KEY `fk_featureDefaultValue_defaultValue1` (`idDefaultValue`),
  CONSTRAINT `fk_featureDefaultValue_defaultValue1` FOREIGN KEY (`idDefaultValue`) REFERENCES `defaultvalue` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_featureDefaultValue_feature1` FOREIGN KEY (`idFeature`) REFERENCES `feature` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

CREATE TABLE `genericcontainertype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `abbreviation` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `geometry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `rules` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

CREATE TABLE `input` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `operator` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `las_auth_session` (
  `session_key` varchar(40) NOT NULL,
  `django_session_key` varchar(40) DEFAULT NULL,
  `login_expire_date` datetime NOT NULL,
  `next_url` longtext NOT NULL,
  `session_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_key_refs_session_key_57a5cc49` (`django_session_key`),
  CONSTRAINT `django_session_key_refs_session_key_57a5cc49` FOREIGN KEY (`django_session_key`) REFERENCES `django_session` (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `output` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idRequest` int(11) NOT NULL,
  `date` date NOT NULL,
  `operator` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Output_Request1` (`idRequest`),
  CONSTRAINT `fk_Output_Request1` FOREIGN KEY (`idRequest`) REFERENCES `request` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `piston_consumer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `key` varchar(18) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `status` varchar(16) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `piston_consumer_403f60f` (`user_id`),
  CONSTRAINT `user_id_refs_id_552cfef9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `piston_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token_key` varchar(18) NOT NULL,
  `consumer_key` varchar(18) NOT NULL,
  `key` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `piston_resource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` longtext NOT NULL,
  `is_readonly` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `piston_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(18) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `token_type` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `is_approved` tinyint(1) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `consumer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `piston_token_403f60f` (`user_id`),
  KEY `piston_token_6565fc20` (`consumer_id`),
  CONSTRAINT `consumer_id_refs_id_7a0bdcab` FOREIGN KEY (`consumer_id`) REFERENCES `piston_consumer` (`id`),
  CONSTRAINT `user_id_refs_id_103fd2e9` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `operator` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `storage_wg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `storage_wg_5d52dd10` (`owner_id`),
  CONSTRAINT `owner_id_refs_id_d6eed27b` FOREIGN KEY (`owner_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `storage_wg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WG_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `storage_wg_user_e2a12238` (`WG_id`),
  KEY `storage_wg_user_fbfc09f1` (`user_id`),
  KEY `storage_wg_user_1e014c8f` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_2fe3d2b0` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_ad0772ce` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `WG_id_refs_id_1fcabd38` FOREIGN KEY (`WG_id`) REFERENCES `storage_wg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1696 DEFAULT CHARSET=latin1;

CREATE TABLE `url` (
  `id` int(11) NOT NULL,
  `url` varchar(60) NOT NULL,
  `default` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

