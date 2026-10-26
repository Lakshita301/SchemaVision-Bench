-- Source: https://github.com/albertotorr3s/tecnofuego/blob/65040617e5c17857cf31af6517d2fd0837e531b9/bd/tecnofuego_20200316.sql?raw=true
-- Tables detected: 28 | FK constraints: 44

CREATE TABLE `tec_activ_comp` (
  `idcomp` int(10) unsigned NOT NULL,
  `idactiv` int(10) unsigned NOT NULL,
  `observ` text,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tec_activ_part_serv` (
  `idactiv` int(10) unsigned NOT NULL,
  `idpartserv` int(10) unsigned NOT NULL,
  `vunit` float unsigned NOT NULL,
  `cant` float unsigned NOT NULL,
  `vtotal` float unsigned NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tec_activ_techs` (
  `idtech` int(10) unsigned NOT NULL,
  `idactiv` int(10) unsigned NOT NULL,
  `parper` float unsigned NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  KEY `fk_tec_activ_techs_techs_idx` (`idtech`),
  KEY `fk_tec_activ_techs_activs_idx` (`idactiv`),
  CONSTRAINT `fk_tec_activ_techs_activs` FOREIGN KEY (`idactiv`) REFERENCES `tec_activities` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_activ_techs_techs` FOREIGN KEY (`idtech`) REFERENCES `tec_techs` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tec_activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEquip` int(10) unsigned NOT NULL,
  `idLocation` int(10) unsigned NOT NULL,
  `idTypeAct` int(10) unsigned NOT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `startHour` time NOT NULL,
  `endHour` time DEFAULT NULL,
  `horometerIni` int(10) unsigned NOT NULL,
  `horometerEnd` varchar(45) DEFAULT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_activities_types_idx` (`idTypeAct`),
  CONSTRAINT `fk_tec_activities_types` FOREIGN KEY (`idTypeAct`) REFERENCES `tec_typeactivity` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_ciudades` (
  `idciudad` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id de la ciudad',
  `ciudad` varchar(255) NOT NULL COMMENT 'Nombre de la ciudad',
  `iddpto` int(10) unsigned NOT NULL COMMENT 'Id del departamento al que pertenece dicha ciudad',
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`idciudad`),
  KEY `fk_ciudades_dptos_idx` (`iddpto`),
  KEY `fk_qaj_ciudades_usucrea_idx` (`usu_crea`),
  KEY `fk_qaj_ciudades_usumod_idx` (`usu_mod`),
  CONSTRAINT `fk_ciudades_dptos` FOREIGN KEY (`iddpto`) REFERENCES `tec_dptos` (`iddpto`) ON UPDATE CASCADE,
  CONSTRAINT `fk_qaj_ciudades_usucrea` FOREIGN KEY (`usu_crea`) REFERENCES `tec_userspers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_qaj_ciudades_usumod` FOREIGN KEY (`usu_mod`) REFERENCES `tec_userspers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(45) NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_compo_vals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idComponent` int(10) unsigned NOT NULL,
  `idField` int(10) unsigned NOT NULL,
  `valField` varchar(255) NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_compo_vals_component_idx` (`idComponent`),
  KEY `fk_tec_compo_vals_fields_idx` (`idField`),
  CONSTRAINT `fk_tec_compo_vals_component` FOREIGN KEY (`idComponent`) REFERENCES `tec_components` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_compo_vals_fields` FOREIGN KEY (`idField`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteId` int(10) unsigned NOT NULL,
  `idComponent` int(10) unsigned NOT NULL,
  `idTySys` int(10) unsigned NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro (0 desmontado, 1, activo, 2 asignado)',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_components_sites_idx` (`siteId`),
  KEY `fk_tec_components_component_idx` (`idComponent`),
  KEY `fk_tec_components_type_sys_idx` (`idTySys`),
  CONSTRAINT `fk_tec_components_component` FOREIGN KEY (`idComponent`) REFERENCES `tec_components` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_components_sites` FOREIGN KEY (`siteId`) REFERENCES `tec_sites` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_components_type_sys` FOREIGN KEY (`idTySys`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_dptos` (
  `iddpto` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id del departamento',
  `dpto` varchar(255) NOT NULL COMMENT 'Nombre del departamento',
  `idpais` int(10) unsigned NOT NULL COMMENT 'Id del país al que pertenece dicho departamento',
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`iddpto`),
  KEY `fk_dptos_paises_idx` (`idpais`),
  KEY `fk_qaj_dptos_usucrea_idx` (`usu_crea`),
  KEY `fk_qaj_dptos_usumod_idx` (`usu_mod`),
  CONSTRAINT `fk_dptos_paises` FOREIGN KEY (`idpais`) REFERENCES `tec_paises` (`idpais`) ON UPDATE CASCADE,
  CONSTRAINT `fk_qaj_dptos_usucrea` FOREIGN KEY (`usu_crea`) REFERENCES `tec_userspers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_qaj_dptos_usumod` FOREIGN KEY (`usu_mod`) REFERENCES `tec_userspers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_entidades` (
  `identidad` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id de la entidad a la que pertenecen los usuarios',
  `tpdoc` int(10) unsigned NOT NULL COMMENT 'Tipo de documento de la entidad 1 NIT, 2 Cédula',
  `documento` varchar(45) NOT NULL COMMENT 'Número de documento que identifica a la entidad',
  `entidad` varchar(255) NOT NULL COMMENT 'Nombre de la entidad',
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`identidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_equip_compos` (
  `idEquip` int(10) unsigned NOT NULL,
  `idCompo` int(10) unsigned NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro (0 desmontado, 1, activo, 2 asignado)',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creaci¢n del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificaci¢n del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el art¡culo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  KEY `fk_tec_equip_compos_equips_idx` (`idEquip`),
  KEY `fk_tec_equip_compos_compos_idx` (`idCompo`),
  CONSTRAINT `fk_tec_equip_compos_compos` FOREIGN KEY (`idCompo`) REFERENCES `tec_components` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_equip_compos_equips` FOREIGN KEY (`idEquip`) REFERENCES `tec_equipment` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tec_equip_repos` (
  `idEqRep` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idEquip` int(10) unsigned NOT NULL,
  `idRepo` int(10) unsigned NOT NULL,
  `repvalues` text NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro (0 desmontado, 1, activo, 2 asignado)',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creaci¢n del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificaci¢n del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el art¡culo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`idEqRep`),
  KEY `fk_tec_equip_repos_equips_idx` (`idEquip`),
  KEY `fk_tec_equip_repos_repos_idx` (`idRepo`),
  CONSTRAINT `fk_tec_equip_repos_equips` FOREIGN KEY (`idEquip`) REFERENCES `tec_equipment` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_equip_repos_repos` FOREIGN KEY (`idRepo`) REFERENCES `tec_parts` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_equipment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteId` int(10) unsigned NOT NULL,
  `typeEquipamentId` int(10) unsigned NOT NULL,
  `idModel` int(10) unsigned NOT NULL,
  `extinctionSystem` enum('S','N') NOT NULL,
  `detectionSystem` enum('S','N') NOT NULL,
  `internalNumber` varchar(45) NOT NULL,
  `serial` varchar(45) DEFAULT NULL,
  `horometer` float DEFAULT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_equipment_sites_idx` (`siteId`),
  KEY `fk_tec_equipment_fleets` (`typeEquipamentId`),
  KEY `fk_tec_equipment_models` (`idModel`),
  CONSTRAINT `fk_tec_equipment_fleets` FOREIGN KEY (`typeEquipamentId`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_equipment_models` FOREIGN KEY (`idModel`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_equipment_sites` FOREIGN KEY (`siteId`) REFERENCES `tec_sites` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1027 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lstfather` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `son` enum('S','N') NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteId` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_locations_sites_idx` (`siteId`),
  CONSTRAINT `fk_tec_locations_sites` FOREIGN KEY (`siteId`) REFERENCES `tec_sites` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id de la opción',
  `option` varchar(100) NOT NULL COMMENT 'Título de la opción',
  `file` text NOT NULL COMMENT 'Archivo que ejecuta la opción, normalmente es una vista.',
  `father` int(10) unsigned NOT NULL COMMENT 'Padre de esta opción, si tiene valor 0 es el nivel más alto',
  `order` int(10) unsigned NOT NULL COMMENT 'Estado de la opción',
  `icon` varchar(45) NOT NULL COMMENT 'Icono que identifica la opción',
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha en la que se crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip del equipo donde se crea el registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifca el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip del equipo donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_qaj_opciones_usucrea_idx` (`usu_crea`),
  KEY `fk_qaj_opciones_usumod_idx` (`usu_mod`),
  CONSTRAINT `fk_qaj_opciones_usucrea` FOREIGN KEY (`usu_crea`) REFERENCES `tec_userspers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_qaj_opciones_usumod` FOREIGN KEY (`usu_mod`) REFERENCES `tec_userspers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='Opciones del Software';

CREATE TABLE `tec_paises` (
  `idpais` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id del país',
  `pais` varchar(45) NOT NULL COMMENT 'Nombre del país',
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`idpais`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_parts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idFamily` int(10) unsigned NOT NULL,
  `idCategory` int(10) unsigned NOT NULL,
  `partserv` enum('S','P','R') NOT NULL COMMENT '(S)ervicio, (P)arte, (R)epuesto',
  `partNum` varchar(45) NOT NULL,
  `value` double(10,2) unsigned NOT NULL,
  `description` varchar(255) NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_parts_lstcats_idx` (`idCategory`),
  KEY `fk_tec_parts_lstype_idx` (`idFamily`),
  CONSTRAINT `fk_tec_parts_lstcats` FOREIGN KEY (`idCategory`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_parts_lstfam` FOREIGN KEY (`idFamily`) REFERENCES `tec_valists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_parts_flds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPart` int(10) unsigned NOT NULL,
  `idField` int(10) unsigned NOT NULL,
  `idType` int(10) unsigned NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_parts_flds_parts_idx` (`idPart`),
  KEY `fk_tec_parts_flds_lstflds_idx` (`idField`),
  KEY `fk_tec_parts_flds_lsttyps_idx` (`idType`),
  CONSTRAINT `fk_tec_parts_flds_lstflds` FOREIGN KEY (`idField`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_parts_flds_lsttyps` FOREIGN KEY (`idType`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_parts_flds_parts` FOREIGN KEY (`idPart`) REFERENCES `tec_parts` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_parts_vals` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idPart` int(10) unsigned NOT NULL,
  `idProject` int(10) unsigned NOT NULL,
  `value` double(10,2) unsigned NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_parts_vals_parts_idx` (`idPart`),
  KEY `fk_tec_parts_vals_projs_idx` (`idProject`),
  CONSTRAINT `fk_tec_parts_vals_parts` FOREIGN KEY (`idPart`) REFERENCES `tec_parts` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_parts_vals_projs` FOREIGN KEY (`idProject`) REFERENCES `tec_sites` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_perfs_opts` (
  `idrole` int(10) unsigned NOT NULL COMMENT 'Cógido del cargo que tiene esta opción',
  `idoption` int(10) unsigned NOT NULL COMMENT 'Código de la opción ligada a este cargo',
  `perm_add` enum('0','1') NOT NULL COMMENT 'Indica 0 si no tiene permiso y 1 si lo tiene (Ingresar registro)',
  `perm_upd` enum('0','1') NOT NULL COMMENT 'Indica 0 si no tiene permiso y 1 si lo tiene (Actualizar registro)',
  `perm_del` enum('0','1') NOT NULL COMMENT 'Indica 0 si no tiene permiso y 1 si lo tiene (Borrar registro)',
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que creó el registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha en la que se crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`idrole`,`idoption`),
  KEY `fk_qaj_perfs_opcs_opcion_idx` (`idoption`),
  KEY `fk_qaj_perfs_opcs_usucrea_idx` (`usu_crea`),
  KEY `fk_qaj_perfs_opcs_usumod_idx` (`usu_mod`),
  CONSTRAINT `fk_qaj_perfs_opcs_opcion` FOREIGN KEY (`idoption`) REFERENCES `tec_options` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_qaj_perfs_opcs_perfil` FOREIGN KEY (`idrole`) REFERENCES `tec_roles` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_qaj_perfs_opcs_usucrea` FOREIGN KEY (`usu_crea`) REFERENCES `tec_userspers` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_qaj_perfs_opcs_usumod` FOREIGN KEY (`usu_mod`) REFERENCES `tec_userspers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relaciona los perfiles con las opciones y permisos de acción';

CREATE TABLE `tec_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id del perfil',
  `role` varchar(100) NOT NULL COMMENT 'Descripción del perfil',
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Indica 1 si el registro está activo y 0 sino lo está',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Id del usuario que crea el registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Id del usuario que modifica el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Perfiles del software';

CREATE TABLE `tec_sites` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `companyId` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `lat` double(10,8) DEFAULT NULL,
  `long` double(10,8) DEFAULT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_sites_company_idx` (`companyId`),
  CONSTRAINT `fk_tec_sites_company` FOREIGN KEY (`companyId`) REFERENCES `tec_company` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_techs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteId` int(10) unsigned NOT NULL,
  `idGroup` int(10) unsigned NOT NULL,
  `document` varchar(45) NOT NULL,
  `name` varchar(255) NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro 0 inactivo 1 activo',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `fec_crea` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en la que se crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip del equipo donde se crea el registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifca el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip del equipo donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_techs_sites_idx` (`siteId`),
  KEY `fk_tec_techs_groups_idx` (`idGroup`),
  CONSTRAINT `fk_tec_techs_groups` FOREIGN KEY (`idGroup`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_techs_sites` FOREIGN KEY (`siteId`) REFERENCES `tec_sites` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_typeactivity` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

CREATE TABLE `tec_userspers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Id del usuario',
  `positionId` int(10) unsigned NOT NULL COMMENT 'Empresa o entidad a la que pertenece el usuario',
  `roleId` int(10) unsigned NOT NULL,
  `siteId` int(10) unsigned NOT NULL,
  `dolog` enum('S','N') NOT NULL,
  `user` varchar(255) NOT NULL COMMENT 'Identificador del usuario',
  `pass` varchar(255) NOT NULL COMMENT 'Contraseña del usuario',
  `idenum` int(10) unsigned NOT NULL COMMENT 'Número de cédula del usuario',
  `names` varchar(255) NOT NULL COMMENT 'Nombre del usuario',
  `lastname` varchar(255) NOT NULL COMMENT 'Apellidos del usuario',
  `email` varchar(255) DEFAULT NULL COMMENT 'Email del usuario',
  `foto` text NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro 0 inactivo 1 activo',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `fec_crea` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Fecha en la que se crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip del equipo donde se crea el registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifca el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha en la que se modifica el registro',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip del equipo donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_userspers_roles_idx` (`roleId`),
  KEY `fk_tec_userspers_positions_idx` (`positionId`),
  KEY `fk_tec_userspers_sites_idx` (`siteId`),
  CONSTRAINT `fk_tec_userspers_positions` FOREIGN KEY (`positionId`) REFERENCES `tec_valists` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_userspers_roles` FOREIGN KEY (`roleId`) REFERENCES `tec_roles` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_userspers_sites` FOREIGN KEY (`siteId`) REFERENCES `tec_sites` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Usuarios del Software';

CREATE TABLE `tec_usrproj` (
  `userId` int(10) unsigned NOT NULL,
  `projectId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`userId`,`projectId`),
  KEY `fk_tec_usrproj_projs_idx` (`projectId`),
  CONSTRAINT `fk_tec_usrproj_projs` FOREIGN KEY (`projectId`) REFERENCES `tec_sites` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_tec_usrproj_usrs` FOREIGN KEY (`userId`) REFERENCES `tec_userspers` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `tec_valists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idlist` int(10) unsigned NOT NULL,
  `valfather` int(10) unsigned NOT NULL,
  `label` varchar(255) NOT NULL,
  `edo_reg` int(10) unsigned NOT NULL COMMENT 'Estado del registro',
  `fec_crea` datetime NOT NULL COMMENT 'Fecha de creación del registro',
  `usu_crea` int(10) unsigned NOT NULL COMMENT 'Usuario que crea el registro',
  `ip_crea` varchar(15) NOT NULL COMMENT 'Ip de donde se crea el registro',
  `fec_mod` datetime DEFAULT NULL COMMENT 'Fecha de modificación del registro',
  `usu_mod` int(10) unsigned DEFAULT NULL COMMENT 'Usuario que modifica el artículo',
  `ip_mod` varchar(15) DEFAULT NULL COMMENT 'Ip de donde se modifica el registro',
  PRIMARY KEY (`id`),
  KEY `fk_tec_valists_lists_idx` (`idlist`),
  CONSTRAINT `fk_tec_valists_lists` FOREIGN KEY (`idlist`) REFERENCES `tec_lists` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=latin1;

