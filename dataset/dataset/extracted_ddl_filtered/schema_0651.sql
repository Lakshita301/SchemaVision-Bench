-- Source: https://github.com/gdqysoft/fcsapp/blob/397e073b3f8b068fb27bc739891748bdb2855b48/%E7%AC%AC%E4%B8%83%E7%BB%84/fcsapp.sql?raw=true
-- Tables detected: 21 | FK/REFERENCES mentions: 35

CREATE TABLE `tb_brandclothesinfo` (
  `clothes_id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) NOT NULL,
  `clothes_num` int(11) NOT NULL,
  `clothes_name` varchar(50) DEFAULT NULL,
  `clothes_des` varchar(255) DEFAULT NULL,
  `clothes_category` int(11) NOT NULL,
  `clothes_design` int(11) DEFAULT NULL,
  `clothes_style` int(11) DEFAULT NULL,
  `clothes_brand` int(11) DEFAULT NULL,
  `clothes_elements` int(11) DEFAULT NULL,
  `clothes_weave` int(11) DEFAULT NULL,
  `clothes_color` varchar(10) NOT NULL,
  `clothes_year` varchar(10) NOT NULL,
  `clothes_season` varchar(10) NOT NULL,
  `clothes_imgOne` varchar(50) NOT NULL,
  `clothes_imgTwo` varchar(50) NOT NULL,
  `clothes_imgThree` varchar(50) NOT NULL,
  `clothes_imgFour` varchar(50) NOT NULL,
  `clothes_imgFive` varchar(50) NOT NULL,
  `clothes_likeNum` int(11) NOT NULL,
  `clothes_saveNum` int(11) NOT NULL,
  `clothes_addTime` varchar(50) NOT NULL,
  `clothes_updateTime` varchar(50) NOT NULL,
  `clothes_status` int(11) NOT NULL,
  PRIMARY KEY (`clothes_id`),
  KEY `brandClothesInfo_enterpriseInfo_fk` (`enterprise_id`),
  KEY `brandClothesInfo_clothCategory_fk` (`clothes_category`),
  KEY `brandClothesInfo_dictionaryData_design_fk` (`clothes_design`),
  KEY `brandClothesInfo_dictionaryData_style_fk` (`clothes_style`),
  KEY `brandClothesInfo_clothesBrandInfo_fk` (`clothes_brand`),
  KEY `brandClothesInfo_fabricComposition_fk` (`clothes_elements`),
  KEY `brandClothesInfo_weave_fk` (`clothes_weave`),
  CONSTRAINT `brandClothesInfo_clothCategory_fk` FOREIGN KEY (`clothes_category`) REFERENCES `tb_clothcategory` (`clothCategory_id`),
  CONSTRAINT `brandClothesInfo_clothesBrandInfo_fk` FOREIGN KEY (`clothes_brand`) REFERENCES `tb_clothesbrandinfo` (`clothesBrand_id`),
  CONSTRAINT `brandClothesInfo_dictionaryData_design_fk` FOREIGN KEY (`clothes_design`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `brandClothesInfo_dictionaryData_style_fk` FOREIGN KEY (`clothes_style`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `brandClothesInfo_enterpriseInfo_fk` FOREIGN KEY (`enterprise_id`) REFERENCES `tb_enterpriseinfo` (`enterprise_id`),
  CONSTRAINT `brandClothesInfo_fabricComposition_fk` FOREIGN KEY (`clothes_elements`) REFERENCES `tb_fabriccomposition` (`fabricComposition_id`),
  CONSTRAINT `brandClothesInfo_weave_fk` FOREIGN KEY (`clothes_weave`) REFERENCES `tb_weave` (`weave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_buyneed` (
  `buyneed_id` int(11) NOT NULL,
  `designerWorks_id` int(11) DEFAULT NULL,
  `designer_id` int(11) DEFAULT NULL,
  `dictionaryCategory_id` int(11) DEFAULT NULL,
  `Buyneed_name` varchar(50) DEFAULT NULL,
  `Buyneed_phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`buyneed_id`),
  KEY `tb_buyneed_tb_designerWorks_fk` (`designerWorks_id`),
  KEY `tb_buyneed_tb_designerInfo_fk` (`designer_id`),
  KEY `tb_buyneed_tb_dictionaryCategory_fk` (`dictionaryCategory_id`),
  CONSTRAINT `tb_buyneed_tb_designerInfo_fk` FOREIGN KEY (`designer_id`) REFERENCES `tb_designerinfo` (`designer_id`),
  CONSTRAINT `tb_buyneed_tb_designerWorks_fk` FOREIGN KEY (`designerWorks_id`) REFERENCES `tb_designerworks` (`designerWorks_id`),
  CONSTRAINT `tb_buyneed_tb_dictionaryCategory_fk` FOREIGN KEY (`dictionaryCategory_id`) REFERENCES `tb_dictionarycategory` (`dictionaryCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_clothcategory` (
  `clothCategory_id` int(11) NOT NULL,
  `clothCategory_number` int(11) NOT NULL,
  `clothCategory_supCategory` varchar(50) DEFAULT NULL,
  `clothCategory_categoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`clothCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_clothesbrandinfo` (
  `clothesBrand_id` int(11) NOT NULL AUTO_INCREMENT,
  `clothesBrand_name` varchar(50) NOT NULL,
  `clothesBrand_des` varchar(255) NOT NULL,
  `enterprise_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`clothesBrand_id`),
  KEY `clothesBrandInfo_enterpriseInfo_fk` (`enterprise_id`),
  CONSTRAINT `clothesBrandInfo_enterpriseInfo_fk` FOREIGN KEY (`enterprise_id`) REFERENCES `tb_enterpriseinfo` (`enterprise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_collection` (
  `collection_id` int(11) NOT NULL,
  `collection_userId` int(11) DEFAULT NULL,
  `collection_objectId` int(11) DEFAULT NULL,
  `collection_type` int(11) NOT NULL,
  `collection_datetime` varchar(50) NOT NULL,
  PRIMARY KEY (`collection_id`),
  KEY `tb_collection_tb_userAccount_fk` (`collection_userId`),
  CONSTRAINT `tb_collection_tb_userAccount_fk` FOREIGN KEY (`collection_userId`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_comment` (
  `comment_id` int(11) NOT NULL,
  `comment_content` longtext NOT NULL,
  `commentn_objectId` int(11) DEFAULT NULL,
  `comment_type` varchar(100) NOT NULL,
  `comment_objectId` int(11) DEFAULT NULL,
  `comment_datetime` varchar(50) NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `tb_comment_tb_userAccount_1_fk` (`commentn_objectId`),
  KEY `tb_comment_tb_userAccount_2_fk` (`comment_objectId`),
  CONSTRAINT `tb_comment_tb_userAccount_1_fk` FOREIGN KEY (`commentn_objectId`) REFERENCES `tb_useraccount` (`user_id`),
  CONSTRAINT `tb_comment_tb_userAccount_2_fk` FOREIGN KEY (`comment_objectId`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_designerflag` (
  `designerFlag_id` int(11) NOT NULL AUTO_INCREMENT,
  `designerFlag_designerId` int(11) NOT NULL,
  `designerFlag` int(11) NOT NULL,
  `designerFlag_likeCount` int(11) NOT NULL,
  PRIMARY KEY (`designerFlag_id`),
  KEY `designerFlag_designerInfo_fk` (`designerFlag_designerId`),
  KEY `designerFlag_dictionaryData_fk` (`designerFlag`),
  CONSTRAINT `designerFlag_designerInfo_fk` FOREIGN KEY (`designerFlag_designerId`) REFERENCES `tb_designerinfo` (`designer_id`),
  CONSTRAINT `designerFlag_dictionaryData_fk` FOREIGN KEY (`designerFlag`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_designerinfo` (
  `designer_id` int(11) NOT NULL AUTO_INCREMENT,
  `designer_accountId` int(11) NOT NULL,
  `designer_imgUrl` varchar(255) NOT NULL,
  `designer_name` varchar(50) DEFAULT NULL,
  `designer_gender` int(11) DEFAULT NULL,
  `designer_birthday` varchar(50) DEFAULT NULL,
  `designer_phone` varchar(50) NOT NULL,
  `designer_education` varchar(10) DEFAULT NULL,
  `designer_experience` longtext,
  `designer_profession` varchar(255) DEFAULT NULL,
  `designer_school` varchar(255) NOT NULL,
  `designer_changeTime` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`designer_id`),
  KEY `designerInfo_userAccount_fk` (`designer_accountId`),
  CONSTRAINT `designerInfo_userAccount_fk` FOREIGN KEY (`designer_accountId`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_designerworks` (
  `designerWorks_id` int(11) NOT NULL AUTO_INCREMENT,
  `designerWorks_designerid` int(11) NOT NULL,
  `designerWorks_effectImgUrl` varchar(255) NOT NULL,
  `designerWorks_styleImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_technologyImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_fabricImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_finishImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_othersImgUrl` varchar(255) DEFAULT NULL,
  `designerWorks_workName` varchar(255) NOT NULL,
  `designerWorks_type` int(11) DEFAULT NULL,
  `designerWorks_style` int(11) DEFAULT NULL,
  `designerWorks_album` int(11) DEFAULT NULL,
  `designerWorks_fabric` int(11) DEFAULT NULL,
  `designerWorks_model` int(11) DEFAULT NULL,
  `designerWorks_colors` varchar(255) NOT NULL,
  `designerWorks_desc` varchar(255) NOT NULL,
  `designerWorks_likeCount` int(11) NOT NULL,
  `designerWorks_collection` int(11) NOT NULL,
  `designerWorks_publishTime` varchar(255) NOT NULL,
  `designerWorks_changeTime` varchar(255) DEFAULT NULL,
  `designerWorks_status` int(11) NOT NULL,
  PRIMARY KEY (`designerWorks_id`),
  KEY `designerWorks_designerInfo_fk` (`designerWorks_designerid`),
  KEY `designerWorks_dictionaryData_type_fk` (`designerWorks_type`),
  KEY `designerWorks_dictionaryData_style_fk` (`designerWorks_style`),
  KEY `designerWorks_special_fk` (`designerWorks_album`),
  KEY `designerWorks_dictionaryData_fabric_fk` (`designerWorks_fabric`),
  KEY `designerWorks_dictionaryData_model_fk` (`designerWorks_model`),
  CONSTRAINT `designerWorks_designerInfo_fk` FOREIGN KEY (`designerWorks_designerid`) REFERENCES `tb_designerinfo` (`designer_id`),
  CONSTRAINT `designerWorks_dictionaryData_fabric_fk` FOREIGN KEY (`designerWorks_fabric`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `designerWorks_dictionaryData_model_fk` FOREIGN KEY (`designerWorks_model`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `designerWorks_dictionaryData_style_fk` FOREIGN KEY (`designerWorks_style`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `designerWorks_dictionaryData_type_fk` FOREIGN KEY (`designerWorks_type`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `designerWorks_special_fk` FOREIGN KEY (`designerWorks_album`) REFERENCES `tb_special` (`special_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_dictionarycategory` (
  `dictionaryCategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `dictionaryCategory_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dictionaryCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_dictionarydata` (
  `dictionaryData_id` int(11) NOT NULL AUTO_INCREMENT,
  `dictionaryData_categoryId` int(11) NOT NULL,
  `dictionaryData_valueNumber` int(11) NOT NULL,
  PRIMARY KEY (`dictionaryData_id`),
  KEY `dictionaryData_dictionaryCategory_fk` (`dictionaryData_categoryId`),
  CONSTRAINT `dictionaryData_dictionaryCategory_fk` FOREIGN KEY (`dictionaryData_categoryId`) REFERENCES `tb_dictionarycategory` (`dictionaryCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_enterprise_clothescategory` (
  `ec_id` int(11) NOT NULL AUTO_INCREMENT,
  `enterprise_id` int(11) DEFAULT NULL,
  `clothesCategory_num` int(11) NOT NULL,
  PRIMARY KEY (`ec_id`),
  KEY `enterprise_clothesCategory_fk` (`clothesCategory_num`),
  CONSTRAINT `enterprise_clothesCategory_fk` FOREIGN KEY (`clothesCategory_num`) REFERENCES `tb_clothcategory` (`clothCategory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_enterpriseinfo` (
  `enterprise_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `enterprise_name` varchar(50) NOT NULL,
  `enterprise_des` varchar(50) NOT NULL,
  `enterprise_addr` int(11) NOT NULL,
  `enterprise_phone` datetime NOT NULL,
  `enterprise_fax` int(11) NOT NULL,
  `enterprise_contacts` varchar(50) NOT NULL,
  `enterprise_contactsphone` varchar(50) NOT NULL,
  `enterprise_net` varchar(50) NOT NULL,
  `enterprise_logo` varchar(50) DEFAULT NULL,
  `enterprise_popularity` int(11) DEFAULT NULL,
  `enterprise_updateTime` varchar(50) NOT NULL,
  PRIMARY KEY (`enterprise_id`),
  KEY `tb_enterpriseInfo_userAccount_fk` (`user_id`),
  CONSTRAINT `tb_enterpriseInfo_userAccount_fk` FOREIGN KEY (`user_id`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_fabriccomposition` (
  `fabricComposition_id` int(11) NOT NULL AUTO_INCREMENT,
  `fabricComposition_number` int(11) NOT NULL,
  `fabricComposition_supCategory` varchar(50) DEFAULT NULL,
  `fabricComposition_categoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`fabricComposition_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_fabricinfo` (
  `fabric_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) DEFAULT NULL,
  `fabricName` varchar(50) NOT NULL,
  `fabric_number` varchar(50) NOT NULL,
  `fabric_orderNum` int(11) NOT NULL,
  `fabric_haveSpot` int(11) NOT NULL,
  `fabric_quantityNum` int(11) NOT NULL,
  `fabric_price` float NOT NULL,
  `fabric_imgNoe` varchar(50) DEFAULT NULL,
  `fabric_imgTwo` varchar(50) DEFAULT NULL,
  `fabric_imgTree` varchar(50) DEFAULT NULL,
  `fabric_imgFour` varchar(50) DEFAULT NULL,
  `fabric_imgFive` varchar(50) DEFAULT NULL,
  `fabric_Composition_id` int(11) DEFAULT NULL,
  `weave_id` int(11) DEFAULT NULL,
  `dictionaryData_id` int(11) DEFAULT NULL,
  `makeProcess` int(11) DEFAULT NULL,
  `fabric_haveEasticity` int(11) NOT NULL,
  `fabric_tcxColor` varchar(50) NOT NULL,
  `fabric_tpxColor` varchar(50) NOT NULL,
  `fabric_like` int(11) NOT NULL,
  `fabric_collection` int(11) NOT NULL,
  `fabric_addTime` varchar(50) NOT NULL,
  `fabric_updateTime` varchar(50) NOT NULL,
  `fabric_status` int(11) NOT NULL,
  PRIMARY KEY (`fabric_id`),
  KEY `fabricInfo_providerInfo_fk` (`provider_id`),
  KEY `fabricInfo_fabricComposition_fk` (`fabric_Composition_id`),
  KEY `fabricInfo_weave_fk` (`weave_id`),
  KEY `fabricInfo_dictionaryData_fk` (`dictionaryData_id`),
  KEY `fabricInfo_dictionaryData_process_fk` (`makeProcess`),
  CONSTRAINT `fabricInfo_dictionaryData_fk` FOREIGN KEY (`dictionaryData_id`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `fabricInfo_dictionaryData_process_fk` FOREIGN KEY (`makeProcess`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `fabricInfo_fabricComposition_fk` FOREIGN KEY (`fabric_Composition_id`) REFERENCES `tb_fabriccomposition` (`fabricComposition_id`),
  CONSTRAINT `fabricInfo_providerInfo_fk` FOREIGN KEY (`provider_id`) REFERENCES `tb_providerinfo` (`provider_id`),
  CONSTRAINT `fabricInfo_weave_fk` FOREIGN KEY (`weave_id`) REFERENCES `tb_weave` (`weave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_information` (
  `information_id` int(11) NOT NULL,
  `information_title` varchar(50) NOT NULL,
  `Information_issueDatetime` varchar(50) NOT NULL,
  `information_source` varchar(50) NOT NULL,
  `information_type` int(11) DEFAULT NULL,
  `information_content` longtext NOT NULL,
  `information_authorId` int(11) DEFAULT NULL,
  `information_modifyDatetime` varchar(50) NOT NULL,
  `information_readNumber` int(11) NOT NULL,
  `information_status` varchar(50) NOT NULL,
  PRIMARY KEY (`information_id`),
  KEY `information_dictionaryData_fk` (`information_type`),
  KEY `information_userAccount_fk` (`information_authorId`),
  CONSTRAINT `information_dictionaryData_fk` FOREIGN KEY (`information_type`) REFERENCES `tb_dictionarydata` (`dictionaryData_id`),
  CONSTRAINT `information_userAccount_fk` FOREIGN KEY (`information_authorId`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_providerinfo` (
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  `userAccount_id` int(11) NOT NULL,
  `provider_name` varchar(50) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `annualProduction` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `fax` varchar(20) NOT NULL,
  `contactsName` varchar(50) NOT NULL,
  `contactsPhone` varchar(50) NOT NULL,
  `storePhotos` varchar(255) NOT NULL,
  `popularity` int(11) NOT NULL,
  `modifyDatetime` datetime NOT NULL,
  PRIMARY KEY (`provider_id`),
  KEY `providerInfo_userAccount_fk` (`userAccount_id`),
  CONSTRAINT `providerInfo_userAccount_fk` FOREIGN KEY (`userAccount_id`) REFERENCES `tb_useraccount` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_provideroperate` (
  `proOper_id` int(11) NOT NULL AUTO_INCREMENT,
  `provider_id` int(11) NOT NULL,
  `fabricProperty` int(11) NOT NULL,
  `propertyValue` int(11) NOT NULL,
  PRIMARY KEY (`proOper_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_special` (
  `special_id` int(11) NOT NULL,
  `special_name` varchar(50) NOT NULL,
  `designer_id` int(11) DEFAULT NULL,
  `special_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`special_id`),
  KEY `special_designerInfo_fk` (`designer_id`),
  CONSTRAINT `special_designerInfo_fk` FOREIGN KEY (`designer_id`) REFERENCES `tb_designerinfo` (`designer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_useraccount` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(50) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_password` varchar(50) NOT NULL,
  `user_actor` int(11) NOT NULL,
  `user_regDatetime` varchar(50) NOT NULL,
  `user_status` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tb_weave` (
  `weave_id` int(11) NOT NULL AUTO_INCREMENT,
  `weave_number` int(11) NOT NULL,
  `weave_supCategory` varchar(50) DEFAULT NULL,
  `weave_categoryName` varchar(50) NOT NULL,
  PRIMARY KEY (`weave_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

