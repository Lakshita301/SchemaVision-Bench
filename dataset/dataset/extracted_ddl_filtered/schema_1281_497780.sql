-- Source: https://github.com/DreamAfar-JM/zhtframees/blob/d7050102471826615b0b47bf9396a6e232bf8b3b/database/zframework-mysql.sql?raw=true
-- Tables detected: 24 | FK constraints: 30

CREATE TABLE `demo_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `description` varchar(30) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `full_time` datetime DEFAULT NULL,
  `loginname` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `time_only` time DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_t9ehegotddnmogclyd5ch25xr` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `demo_user_2` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `description` varchar(30) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `full_time` datetime DEFAULT NULL,
  `loginname` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `time_only` time DEFAULT NULL,
  `time_stamp` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5r2h5l2lmx0p2mpaa8n8nbd0o` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `info_personinfo` (
  `personId` bigint(20) NOT NULL,
  `cardTypeCode` varchar(3) DEFAULT NULL,
  `EMAIL` varchar(50) DEFAULT NULL,
  `famPostcalCode` varchar(6) DEFAULT NULL,
  `famTelephone` varchar(15) DEFAULT NULL,
  `famillyAddress` varchar(50) DEFAULT NULL,
  `genderCode` varchar(5) NOT NULL,
  `isMarried` int(11) DEFAULT NULL,
  `mobilePhone` varchar(15) DEFAULT NULL,
  `MSN` varchar(50) DEFAULT NULL,
  `nameSpell` varchar(60) DEFAULT NULL,
  `nationId` bigint(20) DEFAULT NULL,
  `nativeCity` varchar(30) DEFAULT NULL,
  `nativeCounty` varchar(30) DEFAULT NULL,
  `nativeProvince` varchar(20) DEFAULT NULL,
  `peopleId` bigint(20) DEFAULT NULL,
  `perAddress` varchar(50) DEFAULT NULL,
  `perBirthday` date DEFAULT NULL,
  `perEnglishName` varchar(60) DEFAULT NULL,
  `perIdCard` varchar(18) DEFAULT NULL,
  `perName` varchar(50) NOT NULL,
  `perNum` varchar(20) NOT NULL,
  `perPostalCode` varchar(6) DEFAULT NULL,
  `perTelephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`personId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `briefname` varchar(30) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(30) NOT NULL,
  `creater` varchar(30) DEFAULT NULL,
  `rbac_group_id` bigint(20) DEFAULT NULL,
  `rbac_role_id` bigint(20) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_kwgco1fnx3ufdttlfaxyb67o3` (`rbac_group_id`),
  KEY `FK_r6qungqkes8wu8b9cx5l3rvcn` (`rbac_role_id`),
  KEY `FK_n6ua1pidq1wl6rnvh4g66y43t` (`parent_id`),
  CONSTRAINT `FK_kwgco1fnx3ufdttlfaxyb67o3` FOREIGN KEY (`rbac_group_id`) REFERENCES `rbac_group` (`id`),
  CONSTRAINT `FK_n6ua1pidq1wl6rnvh4g66y43t` FOREIGN KEY (`parent_id`) REFERENCES `rbac_group` (`id`),
  CONSTRAINT `FK_r6qungqkes8wu8b9cx5l3rvcn` FOREIGN KEY (`rbac_role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_group_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rbac_group_id` bigint(20) DEFAULT NULL,
  `rbac_role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4vjgjkn2be1qo20gu3wiwl1it` (`rbac_group_id`),
  KEY `FK_70ok1ehn84gavlujb11svnx0n` (`rbac_role_id`),
  CONSTRAINT `FK_4vjgjkn2be1qo20gu3wiwl1it` FOREIGN KEY (`rbac_group_id`) REFERENCES `rbac_group` (`id`),
  CONSTRAINT `FK_70ok1ehn84gavlujb11svnx0n` FOREIGN KEY (`rbac_role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_group_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rbac_group_id` bigint(20) DEFAULT NULL,
  `rbac_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_67ks4n9atg55gn76yef48u84p` (`rbac_group_id`),
  KEY `FK_5ut3lud8anq3fj19cbkwe8mj` (`rbac_user_id`),
  CONSTRAINT `FK_5ut3lud8anq3fj19cbkwe8mj` FOREIGN KEY (`rbac_user_id`) REFERENCES `rbac_user` (`id`),
  CONSTRAINT `FK_67ks4n9atg55gn76yef48u84p` FOREIGN KEY (`rbac_group_id`) REFERENCES `rbac_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(60) DEFAULT NULL,
  `dis_index` int(11) DEFAULT NULL,
  `display` varchar(40) NOT NULL,
  `iconCls` varchar(40) NOT NULL,
  `tab_title` varchar(40) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `module_id` bigint(20) DEFAULT NULL,
  `permission_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ju6jky12gr1by7l33ovxjsq9v` (`parent_id`),
  KEY `FK_1rnf48c8w233wo383tap4tk65` (`module_id`),
  KEY `FK_byhoy18k197a1p7pietbfkdb4` (`permission_id`),
  CONSTRAINT `FK_1rnf48c8w233wo383tap4tk65` FOREIGN KEY (`module_id`) REFERENCES `rbac_module` (`id`),
  CONSTRAINT `FK_byhoy18k197a1p7pietbfkdb4` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permission` (`id`),
  CONSTRAINT `FK_ju6jky12gr1by7l33ovxjsq9v` FOREIGN KEY (`parent_id`) REFERENCES `rbac_menu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_module` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dis_index` int(11) NOT NULL,
  `display` varchar(32) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `icon` varchar(20) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_module_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rbac_menu_id` bigint(20) DEFAULT NULL,
  `rbac_module_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_lnmh36m9o9o3fkjltvck7bim8` (`rbac_menu_id`),
  KEY `FK_65qssxay1k00rjngexjdt09f5` (`rbac_module_id`),
  CONSTRAINT `FK_65qssxay1k00rjngexjdt09f5` FOREIGN KEY (`rbac_module_id`) REFERENCES `rbac_module` (`id`),
  CONSTRAINT `FK_lnmh36m9o9o3fkjltvck7bim8` FOREIGN KEY (`rbac_menu_id`) REFERENCES `rbac_menu` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(128) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(40) NOT NULL,
  `type` varchar(1) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_3v94kwepfosn7jqeo9hluid6f` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(40) NOT NULL,
  `description` varchar(60) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(40) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i1vjocjdvpqum2aihn4e7g9f0` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='角色';

CREATE TABLE `rbac_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_plmmpet3fn54pbdvqxdi46pjn` (`permission_id`),
  KEY `FK_4u42et26qiarjienjpr2fxark` (`role_id`),
  CONSTRAINT `FK_4u42et26qiarjienjpr2fxark` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`),
  CONSTRAINT `FK_plmmpet3fn54pbdvqxdi46pjn` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accountNonExpired` bit(1) NOT NULL,
  `accountNonLocked` bit(1) NOT NULL,
  `alias` varchar(30) DEFAULT NULL,
  `credentialsNonExpired` bit(1) NOT NULL,
  `description` varchar(30) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(36) DEFAULT NULL,
  `salt` varchar(70) DEFAULT NULL,
  `defaultRoleId` bigint(20) DEFAULT NULL,
  `userName` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_by5js5d3ceusq6w4xth38hck2` (`userName`),
  KEY `FK_eob4je1x1u4dxljrmxpb5ob6t` (`defaultRoleId`),
  CONSTRAINT `FK_eob4je1x1u4dxljrmxpb5ob6t` FOREIGN KEY (`defaultRoleId`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='用户';

CREATE TABLE `rbac_user_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rbac_rbacPermission_id` bigint(20) DEFAULT NULL,
  `rbac_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_q4h1nse4qsyxgusi9ne1v173w` (`rbac_rbacPermission_id`),
  KEY `FK_6vwcup29h9982xq2uux8g7g35` (`rbac_user_id`),
  CONSTRAINT `FK_6vwcup29h9982xq2uux8g7g35` FOREIGN KEY (`rbac_user_id`) REFERENCES `rbac_user` (`id`),
  CONSTRAINT `FK_q4h1nse4qsyxgusi9ne1v173w` FOREIGN KEY (`rbac_rbacPermission_id`) REFERENCES `rbac_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_user_permission_reject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rbac_rbacPermission_id` bigint(20) DEFAULT NULL,
  `rbac_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_1q1w7amolu1eyibmpni2wk60u` (`rbac_rbacPermission_id`),
  KEY `FK_9aa640a758snmr0l0u6lot1wt` (`rbac_user_id`),
  CONSTRAINT `FK_1q1w7amolu1eyibmpni2wk60u` FOREIGN KEY (`rbac_rbacPermission_id`) REFERENCES `rbac_permission` (`id`),
  CONSTRAINT `FK_9aa640a758snmr0l0u6lot1wt` FOREIGN KEY (`rbac_user_id`) REFERENCES `rbac_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rbac_role_id` bigint(20) DEFAULT NULL,
  `rbac_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_9qxtkrj9nmr62hbtctm59dnyb` (`rbac_role_id`),
  KEY `FK_mbg62g47x0agpnj6yx80knkow` (`rbac_user_id`),
  CONSTRAINT `FK_mbg62g47x0agpnj6yx80knkow` FOREIGN KEY (`rbac_user_id`) REFERENCES `rbac_user` (`id`),
  CONSTRAINT `FK_9qxtkrj9nmr62hbtctm59dnyb` FOREIGN KEY (`rbac_role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `rbac_user_role_reject` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rbac_role_id` bigint(20) DEFAULT NULL,
  `rbac_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_nkq0sogimaefmruvfxlo4lvsu` (`rbac_role_id`),
  KEY `FK_4mow4hknv27f583d32cyayy5c` (`rbac_user_id`),
  CONSTRAINT `FK_4mow4hknv27f583d32cyayy5c` FOREIGN KEY (`rbac_user_id`) REFERENCES `rbac_user` (`id`),
  CONSTRAINT `FK_nkq0sogimaefmruvfxlo4lvsu` FOREIGN KEY (`rbac_role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `creater` varchar(30) DEFAULT NULL,
  `description` varchar(60) DEFAULT NULL,
  `enabled` bit(1) NOT NULL,
  `name` varchar(30) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bsv9wlrnmw7p10eor0h6brdb` (`parent_id`),
  CONSTRAINT `FK_bsv9wlrnmw7p10eor0h6brdb` FOREIGN KEY (`parent_id`) REFERENCES `sys_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_department_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rbac_role_id` bigint(20) DEFAULT NULL,
  `sys_department_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_25dylyw4dqxaoauabfbu7l6r7` (`rbac_role_id`),
  KEY `FK_9hbq0p0a7mf8x7hq5r99i2rhy` (`sys_department_id`),
  CONSTRAINT `FK_25dylyw4dqxaoauabfbu7l6r7` FOREIGN KEY (`rbac_role_id`) REFERENCES `rbac_role` (`id`),
  CONSTRAINT `FK_9hbq0p0a7mf8x7hq5r99i2rhy` FOREIGN KEY (`sys_department_id`) REFERENCES `sys_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_department_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_department_id` bigint(20) DEFAULT NULL,
  `rbac_user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p5erns42mww82w9u9t498rwcy` (`sys_department_id`),
  KEY `FK_6qll1xgf8uyv6buuv81w026o2` (`rbac_user_id`),
  CONSTRAINT `FK_6qll1xgf8uyv6buuv81w026o2` FOREIGN KEY (`rbac_user_id`) REFERENCES `rbac_user` (`id`),
  CONSTRAINT `FK_p5erns42mww82w9u9t498rwcy` FOREIGN KEY (`sys_department_id`) REFERENCES `sys_department` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(32) DEFAULT 'xxxx',
  `enabled` bit(1) NOT NULL,
  `full_time` datetime DEFAULT NULL,
  `loginname` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `start_date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i3rcdsc1j905jadocmdj4ikyq` (`loginname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `zht_entity_detail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `M2O_O2O_DisplayField` varchar(60) DEFAULT NULL,
  `column_definition` varchar(30) DEFAULT NULL,
  `columnName` varchar(60) DEFAULT NULL,
  `condtionDisplay` varchar(30) DEFAULT NULL,
  `display_z` varchar(30) DEFAULT NULL,
  `editType` varchar(30) DEFAULT NULL,
  `isList` bit(1) DEFAULT NULL,
  `isLookUpDisplay` bit(1) DEFAULT NULL,
  `isQueryCondtion` bit(1) DEFAULT NULL,
  `isSorter` bit(1) DEFAULT NULL,
  `isTreeProperty` bit(1) DEFAULT NULL,
  `length_z` int(11) DEFAULT NULL,
  `lookUpType` varchar(30) DEFAULT NULL,
  `nullable_z` bit(1) DEFAULT NULL,
  `precision_z` int(11) DEFAULT NULL,
  `propertyName` varchar(100) DEFAULT NULL,
  `propertyType` varchar(100) DEFAULT NULL,
  `queryType` varchar(30) DEFAULT NULL,
  `relationType` varchar(30) DEFAULT NULL,
  `scale_z` int(11) DEFAULT NULL,
  `simpleFormat` varchar(100) DEFAULT NULL,
  `table_name` varchar(30) DEFAULT NULL,
  `unique_z` bit(1) DEFAULT NULL,
  `validateContent` varchar(30) DEFAULT NULL,
  `genEntity_id` bigint(20) DEFAULT NULL,
  `lineWidth` int(11) DEFAULT NULL,
  `columnWidth` int(11) DEFAULT NULL,
  `editContent` varchar(100) DEFAULT NULL,
  `editFinalContentStr` longtext,
  `validateType` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8jd92sxjd2jmutxlsu5yei1np` (`genEntity_id`),
  CONSTRAINT `FK_8jd92sxjd2jmutxlsu5yei1np` FOREIGN KEY (`genEntity_id`) REFERENCES `zht_gen_entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf8;

CREATE TABLE `zht_entity_property` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `columnName` varchar(60) DEFAULT NULL,
  `columnWidth` int(11) DEFAULT NULL,
  `condtionDisplay` varchar(30) DEFAULT NULL,
  `display_z` varchar(30) DEFAULT NULL,
  `editContent` varchar(100) DEFAULT NULL,
  `editFinalContentStr` longtext,
  `editType` varchar(30) DEFAULT NULL,
  `isList` bit(1) DEFAULT NULL,
  `isLookUpDisplay` bit(1) DEFAULT NULL,
  `isQueryCondtion` bit(1) DEFAULT NULL,
  `isSorter` bit(1) DEFAULT NULL,
  `isTreeProperty` bit(1) DEFAULT NULL,
  `length_z` int(11) DEFAULT NULL,
  `lookUpType` varchar(30) DEFAULT NULL,
  `M2O_O2O_DisplayField` varchar(60) DEFAULT NULL,
  `nullable_z` bit(1) DEFAULT NULL,
  `precision_z` int(11) DEFAULT NULL,
  `propertyName` varchar(40) DEFAULT NULL,
  `propertyType` varchar(200) DEFAULT NULL,
  `queryType` varchar(30) DEFAULT NULL,
  `relationType` varchar(30) DEFAULT NULL,
  `scale_z` int(11) DEFAULT NULL,
  `simpleFormat` varchar(1000) DEFAULT NULL,
  `unique_z` bit(1) DEFAULT NULL,
  `validateContent` varchar(30) DEFAULT NULL,
  `validateType` varchar(30) DEFAULT NULL,
  `genEntity_id` bigint(20) DEFAULT NULL,
  `generatedEditOfPropertyStr` varchar(1000) DEFAULT NULL,
  `generatedHibernateModelOfPropertyStr` varchar(1000) DEFAULT NULL,
  `generatedListDisplayOfPropertyStr` varchar(1000) DEFAULT NULL,
  `generatedQueryOfPropertyStr` varchar(1000) DEFAULT NULL,
  `maxLength` int(11) DEFAULT NULL,
  `minLength` int(11) DEFAULT NULL,
  `max_length` int(11) DEFAULT NULL,
  `max_value` bigint(20) DEFAULT NULL,
  `min_length` int(11) DEFAULT NULL,
  `min_value` bigint(20) DEFAULT NULL,
  `isDateFutrue` bit(1) DEFAULT NULL,
  `isDatePost` bit(1) DEFAULT NULL,
  `manyToOneDisplayField` varchar(255) DEFAULT NULL,
  `oneTomanyMappedBy` varchar(255) DEFAULT NULL,
  `isManytomanyMasterControl` bit(1) DEFAULT NULL,
  `manytomanyJoinColumnPpposite` varchar(255) DEFAULT NULL,
  `manytomanyJoinColumnSelf` varchar(255) DEFAULT NULL,
  `manytomanyJoinTable` varchar(255) DEFAULT NULL,
  `manytomanyJoinColumnOpposite` varchar(255) DEFAULT NULL,
  `manytomanyMappedBy` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bce2jtqan06c72s1bh1gco97b` (`genEntity_id`),
  CONSTRAINT `FK_bce2jtqan06c72s1bh1gco97b` FOREIGN KEY (`genEntity_id`) REFERENCES `zht_gen_entity` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=519 DEFAULT CHARSET=utf8;

CREATE TABLE `zht_gen_entity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `controllerNameSpace` varchar(60) DEFAULT NULL,
  `gen_info` varchar(60) DEFAULT NULL,
  `isTree` bit(1) DEFAULT NULL,
  `last_modify_time` datetime DEFAULT NULL,
  `module_name` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `remark` varchar(60) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `entityDisName` varchar(60) DEFAULT NULL,
  `tableName` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

