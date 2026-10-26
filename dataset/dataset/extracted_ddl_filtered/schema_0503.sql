-- Source: https://github.com/VictoriaCalbet/D12-Group-7/blob/c47d1b59fed47fd90f32016d81e864fd640a6e61/Proyecto%20del%20grupo%20de%20Camila/scriptCreateBattle.sql?raw=true
-- Tables detected: 34 | FK/REFERENCES mentions: 35

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `confirmMoment` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hasConfirmedTerms` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_cgls5lrufx91ufsyh467spwa3` (`userAccount_id`),
  UNIQUE KEY `UK_6cwpy57cri0qhnc28qj0qybsn` (`nickname`),
  CONSTRAINT `FK_cgls5lrufx91ufsyh467spwa3` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `administrator` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `confirmMoment` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hasConfirmedTerms` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_idt4b4u259p6vs4pyr9lax4eg` (`userAccount_id`),
  UNIQUE KEY `UK_7pcwodeblkp8s3tyeniqcx333` (`nickname`),
  CONSTRAINT `FK_idt4b4u259p6vs4pyr9lax4eg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `banned` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `banDate` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `isValid` bit(1) DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `actor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_cwrt71g0g5637qojimrx3j036` (`isValid`),
  KEY `UK_iev03is47q8hmtailognobf6o` (`actor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `battle` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `attackerOwner` bit(1) DEFAULT NULL,
  `balance` varchar(255) DEFAULT NULL,
  `isWon` bit(1) DEFAULT NULL,
  `luckAttacker` double DEFAULT NULL,
  `luckDeffender` double DEFAULT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `attacker_id` int(11) NOT NULL,
  `deffender_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_es2fkuwxqq8msuwpdhq96e3ds` (`attacker_id`),
  KEY `FK_hmquk2ueg3x8tmhmv1wsr4n7m` (`deffender_id`),
  CONSTRAINT `FK_es2fkuwxqq8msuwpdhq96e3ds` FOREIGN KEY (`attacker_id`) REFERENCES `keybladewielder` (`id`),
  CONSTRAINT `FK_hmquk2ueg3x8tmhmv1wsr4n7m` FOREIGN KEY (`deffender_id`) REFERENCES `keybladewielder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `building` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `extraCostPerLvl` double DEFAULT NULL,
  `isFinal` bit(1) DEFAULT NULL,
  `maxLvl` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `timeToConstruct` int(11) DEFAULT NULL,
  `contentManager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_kafanifq4tl8429iw316qaiqh` (`isFinal`),
  KEY `FK_6rnrpwu52hmaj92tqtnmhbnvp` (`contentManager_id`),
  CONSTRAINT `FK_6rnrpwu52hmaj92tqtnmhbnvp` FOREIGN KEY (`contentManager_id`) REFERENCES `contentmanager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `built` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `activationDate` datetime DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `lvl` int(11) DEFAULT NULL,
  `building_id` int(11) NOT NULL,
  `gummiShip_id` int(11) DEFAULT NULL,
  `keybladeWielder_id` int(11) NOT NULL,
  `troop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_bf8c7q592fpjrnukybtm3p4no` (`lvl`),
  KEY `FK_97junl37o3m1t1nhf6g5jaky3` (`gummiShip_id`),
  KEY `FK_ra1behx93p0phfoa56jkusmqn` (`keybladeWielder_id`),
  KEY `FK_biwn31vxymhnfsx82s2d4t8pl` (`troop_id`),
  CONSTRAINT `FK_97junl37o3m1t1nhf6g5jaky3` FOREIGN KEY (`gummiShip_id`) REFERENCES `gummiship` (`id`),
  CONSTRAINT `FK_biwn31vxymhnfsx82s2d4t8pl` FOREIGN KEY (`troop_id`) REFERENCES `troop` (`id`),
  CONSTRAINT `FK_ra1behx93p0phfoa56jkusmqn` FOREIGN KEY (`keybladeWielder_id`) REFERENCES `keybladewielder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `chatty` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `invitation_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_1vxysb3m4saa2icosl029m11y` (`date`),
  KEY `FK_dran7x58nypw2v8hm2g37a9r5` (`invitation_id`),
  CONSTRAINT `FK_dran7x58nypw2v8hm2g37a9r5` FOREIGN KEY (`invitation_id`) REFERENCES `invitation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `baseGummiCoal` int(11) DEFAULT NULL,
  `baseMunny` int(11) DEFAULT NULL,
  `baseMytrhil` int(11) DEFAULT NULL,
  `dailyGummiCoal` int(11) DEFAULT NULL,
  `dailyMunny` int(11) DEFAULT NULL,
  `dailyMytrhil` int(11) DEFAULT NULL,
  `lostLvlsDeffender` int(11) DEFAULT NULL,
  `orgMessages` int(11) DEFAULT NULL,
  `percentageWinAttacker` double DEFAULT NULL,
  `percentageWinDefender` double DEFAULT NULL,
  `worldSlots` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `contentmanager` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `confirmMoment` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hasConfirmedTerms` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jkls9gyrwigpi8unmm6p6gv51` (`userAccount_id`),
  UNIQUE KEY `UK_id5ivndau3qraqav3gv1glxpm` (`nickname`),
  CONSTRAINT `FK_jkls9gyrwigpi8unmm6p6gv51` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `defense` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `extraCostPerLvl` double DEFAULT NULL,
  `isFinal` bit(1) DEFAULT NULL,
  `maxLvl` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `timeToConstruct` int(11) DEFAULT NULL,
  `contentManager_id` int(11) NOT NULL,
  `defense` int(11) DEFAULT NULL,
  `extraDefensePerLvl` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `DefenseUK_kafanifq4tl8429iw316qaiqh` (`isFinal`),
  KEY `FK_7ucegt7vmim0tht04r9ogkt2y` (`contentManager_id`),
  CONSTRAINT `FK_7ucegt7vmim0tht04r9ogkt2y` FOREIGN KEY (`contentManager_id`) REFERENCES `contentmanager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `faction` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `extraAttack` double DEFAULT NULL,
  `extraDefense` double DEFAULT NULL,
  `extraResources` double DEFAULT NULL,
  `galaxy` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `powerUpDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `gamemaster` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `confirmMoment` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hasConfirmedTerms` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_lw3n1at3slipc8cee8r9awhg` (`userAccount_id`),
  UNIQUE KEY `UK_36gfwf718ymlamy7e1io39de3` (`nickname`),
  CONSTRAINT `FK_lw3n1at3slipc8cee8r9awhg` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `gummiship` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `recruiterRequiredLvl` int(11) DEFAULT NULL,
  `slots` int(11) DEFAULT NULL,
  `timeToRecruit` int(11) DEFAULT NULL,
  `recruiter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_dcyrv2d4x2cc5owo9il8901c6` (`name`),
  KEY `UK_m0pk55jkxql6mtbqm8umak4om` (`recruiterRequiredLvl`),
  KEY `FK_bpe54i7i0udsn49gfpgqkh8qs` (`recruiter_id`),
  CONSTRAINT `FK_bpe54i7i0udsn49gfpgqkh8qs` FOREIGN KEY (`recruiter_id`) REFERENCES `recruiter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `invitation` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `invitationStatus` varchar(255) DEFAULT NULL,
  `orgRange` varchar(255) DEFAULT NULL,
  `keybladeWielder_id` int(11) NOT NULL,
  `organization_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_4ui8dt5qj8ffrh428ojgjt49w` (`date`,`invitationStatus`,`orgRange`),
  KEY `FK_mnp1cm2xsssclt44jm5j8o7wt` (`organization_id`),
  CONSTRAINT `FK_mnp1cm2xsssclt44jm5j8o7wt` FOREIGN KEY (`organization_id`) REFERENCES `organization` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `extra` double DEFAULT NULL,
  `munnyCost` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `onSell` bit(1) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `contentManager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_a5hxmfx1a4325hg0uds5ulqdp` (`name`),
  KEY `FK_rgx5h3wyhrg3fy5k4iepacrh6` (`contentManager_id`),
  CONSTRAINT `FK_rgx5h3wyhrg3fy5k4iepacrh6` FOREIGN KEY (`contentManager_id`) REFERENCES `contentmanager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `keybladewielder` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `confirmMoment` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `hasConfirmedTerms` bit(1) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  `lastConnection` datetime DEFAULT NULL,
  `loses` int(11) DEFAULT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `wins` int(11) DEFAULT NULL,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `z` int(11) DEFAULT NULL,
  `worldName` varchar(255) DEFAULT NULL,
  `faction_id` int(11) NOT NULL,
  `shield_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2p7covt8b041f18p9rky9n2a9` (`userAccount_id`),
  UNIQUE KEY `UK_mn080mjc05f31iq71yhijr4eb` (`worldName`),
  UNIQUE KEY `UK_49p0qgqd62xyulwm4lh2j9pwm` (`nickname`),
  KEY `FK_fxww30xulx45d0xlek9qbcqvd` (`faction_id`),
  KEY `FK_lq6c56d23q5dmybsgvgsmvau8` (`shield_id`),
  CONSTRAINT `FK_2p7covt8b041f18p9rky9n2a9` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`),
  CONSTRAINT `FK_fxww30xulx45d0xlek9qbcqvd` FOREIGN KEY (`faction_id`) REFERENCES `faction` (`id`),
  CONSTRAINT `FK_lq6c56d23q5dmybsgvgsmvau8` FOREIGN KEY (`shield_id`) REFERENCES `shield` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `legaltext` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` longtext,
  `codeLanguage` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `livelihood` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `extraCostPerLvl` double DEFAULT NULL,
  `isFinal` bit(1) DEFAULT NULL,
  `maxLvl` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `timeToConstruct` int(11) DEFAULT NULL,
  `contentManager_id` int(11) NOT NULL,
  `extraMaterialsPerLvl` double DEFAULT NULL,
  `lessTimePerLvl` double DEFAULT NULL,
  `collectedGummiCoal` int(11) DEFAULT NULL,
  `collectedMunny` int(11) DEFAULT NULL,
  `collectedMytrhil` int(11) DEFAULT NULL,
  `timeToRecollect` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `LivelihoodUK_kafanifq4tl8429iw316qaiqh` (`isFinal`),
  KEY `FK_ackl04e3jgv0uk6n9encdd8vc` (`contentManager_id`),
  CONSTRAINT `FK_ackl04e3jgv0uk6n9encdd8vc` FOREIGN KEY (`contentManager_id`) REFERENCES `contentmanager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `organization` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `creationDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `prize` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `keybladeWielder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_n282oaqb6gj3684c2qlsqj8on` (`date`),
  KEY `FK_2u4vbgeqtq8yo5gf5xowvpi1v` (`keybladeWielder_id`),
  CONSTRAINT `FK_2u4vbgeqtq8yo5gf5xowvpi1v` FOREIGN KEY (`keybladeWielder_id`) REFERENCES `keybladewielder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `activationDate` datetime DEFAULT NULL,
  `expirationDate` datetime DEFAULT NULL,
  `purchaseDate` date DEFAULT NULL,
  `item_id` int(11) NOT NULL,
  `player_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_m8nebt839m2w55qk0dxcrnnnw` (`item_id`),
  KEY `FK_9jmud92x8qm28js0lloqod7bc` (`player_id`),
  CONSTRAINT `FK_9jmud92x8qm28js0lloqod7bc` FOREIGN KEY (`player_id`) REFERENCES `keybladewielder` (`id`),
  CONSTRAINT `FK_m8nebt839m2w55qk0dxcrnnnw` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `recruited` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `gummiShip_id` int(11) DEFAULT NULL,
  `storageBuilding_id` int(11) NOT NULL,
  `troop_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_i943aw5urm3iegjwt7c51iuxq` (`gummiShip_id`),
  KEY `FK_aj8fktrnyfhbljlgwu53yvnoe` (`storageBuilding_id`),
  KEY `FK_363v4589sr2895tlpm6va73n5` (`troop_id`),
  CONSTRAINT `FK_363v4589sr2895tlpm6va73n5` FOREIGN KEY (`troop_id`) REFERENCES `troop` (`id`),
  CONSTRAINT `FK_aj8fktrnyfhbljlgwu53yvnoe` FOREIGN KEY (`storageBuilding_id`) REFERENCES `built` (`id`),
  CONSTRAINT `FK_i943aw5urm3iegjwt7c51iuxq` FOREIGN KEY (`gummiShip_id`) REFERENCES `gummiship` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `recruiter` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `extraCostPerLvl` double DEFAULT NULL,
  `isFinal` bit(1) DEFAULT NULL,
  `maxLvl` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `timeToConstruct` int(11) DEFAULT NULL,
  `contentManager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RecruiterUK_kafanifq4tl8429iw316qaiqh` (`isFinal`),
  KEY `FK_ev3n49ifl082qx37ap1qq4mbf` (`contentManager_id`),
  CONSTRAINT `FK_ev3n49ifl082qx37ap1qq4mbf` FOREIGN KEY (`contentManager_id`) REFERENCES `contentmanager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `isBug` bit(1) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `keybladeWielder_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_oe0r6s550sr6cmgdstosytnpv` (`keybladeWielder_id`),
  CONSTRAINT `FK_oe0r6s550sr6cmgdstosytnpv` FOREIGN KEY (`keybladeWielder_id`) REFERENCES `keybladewielder` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `report_photos` (
  `Report_id` int(11) NOT NULL,
  `photos` varchar(255) DEFAULT NULL,
  KEY `FK_fd13a90x7k7j80d8xye1x2rfx` (`Report_id`),
  CONSTRAINT `FK_fd13a90x7k7j80d8xye1x2rfx` FOREIGN KEY (`Report_id`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `report_reportupdate` (
  `Report_id` int(11) NOT NULL,
  `reportUpdates_id` int(11) NOT NULL,
  UNIQUE KEY `UK_43xicbjikgjminaei0arhats1` (`reportUpdates_id`),
  KEY `FK_srd13vb4jj76g5mjqllbug76j` (`Report_id`),
  CONSTRAINT `FK_43xicbjikgjminaei0arhats1` FOREIGN KEY (`reportUpdates_id`) REFERENCES `reportupdate` (`id`),
  CONSTRAINT `FK_srd13vb4jj76g5mjqllbug76j` FOREIGN KEY (`Report_id`) REFERENCES `report` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `reportupdate` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `isSuspicious` bit(1) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `administrator_id` int(11) DEFAULT NULL,
  `gameMaster_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_6lbvciwghn3w9px3s8e92qp6v` (`administrator_id`),
  KEY `FK_mh33ijgwkf614b636i02jqrq5` (`gameMaster_id`),
  CONSTRAINT `FK_6lbvciwghn3w9px3s8e92qp6v` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`id`),
  CONSTRAINT `FK_mh33ijgwkf614b636i02jqrq5` FOREIGN KEY (`gameMaster_id`) REFERENCES `gamemaster` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `requirement` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `lvl` int(11) DEFAULT NULL,
  `mainBuilding_id` int(11) NOT NULL,
  `requiredBuilding_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_e3n6l17s6yisxwexn5wso8l52` (`lvl`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `shield` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `troop` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `attack` int(11) DEFAULT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `defense` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `recruiterRequiredLvl` int(11) DEFAULT NULL,
  `timeToRecruit` int(11) DEFAULT NULL,
  `recruiter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_d63lj6ow3pqb1ke6npwi875fh` (`name`),
  KEY `UK_mh2ljjodpe0ncisfool5h16ey` (`recruiterRequiredLvl`),
  KEY `FK_1ry11t999tbcg2buhdgdal0m2` (`recruiter_id`),
  CONSTRAINT `FK_1ry11t999tbcg2buhdgdal0m2` FOREIGN KEY (`recruiter_id`) REFERENCES `recruiter` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `gummiCoal` int(11) DEFAULT NULL,
  `munny` int(11) DEFAULT NULL,
  `mytrhil` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `extraCostPerLvl` double DEFAULT NULL,
  `isFinal` bit(1) DEFAULT NULL,
  `maxLvl` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `timeToConstruct` int(11) DEFAULT NULL,
  `contentManager_id` int(11) NOT NULL,
  `extraSlotsPerLvl` double DEFAULT NULL,
  `gummiSlots` int(11) DEFAULT NULL,
  `gummiCoalSlots` int(11) DEFAULT NULL,
  `munnySlots` int(11) DEFAULT NULL,
  `mytrhilSlots` int(11) DEFAULT NULL,
  `troopSlots` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `WarehouseUK_kafanifq4tl8429iw316qaiqh` (`isFinal`),
  KEY `FK_mp4xkqm4jf2oxr9q7cdno2mna` (`contentManager_id`),
  CONSTRAINT `FK_mp4xkqm4jf2oxr9q7cdno2mna` FOREIGN KEY (`contentManager_id`) REFERENCES `contentmanager` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

