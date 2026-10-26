-- Source: https://github.com/linxinmingit/yrERP-9-17-master/blob/15e5b0a8a5243748d1fc10ac54d42e412e2043fa/src/main/java/com/yr/sql/yrerp.sql?raw=true
-- Tables detected: 18 | FK constraints: 4

CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `createEmpno` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sup_code` varchar(255) NOT NULL,
  `updateEmpno` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `createEmp` varchar(255) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `depot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `createEmpno` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `job_num` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `updateEmpno` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_53qb7yd3gvorv3hvohotxs6hx` (`code`),
  UNIQUE KEY `UK_aqchf57lxyp9d8w3hohbvpwvm` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `icon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fontClass` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `unicode` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i2ui5ceebv3lg0x5l98ex0je8` (`fontClass`),
  UNIQUE KEY `UK_fffogi1b9bhcwih8x0aer9kql` (`unicode`)
) ENGINE=InnoDB AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `createEmp` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `fieldNewValue` varchar(255) DEFAULT NULL,
  `fieldOldValue` varchar(255) DEFAULT NULL,
  `modular` varchar(255) NOT NULL,
  `table` varchar(255) NOT NULL,
  `type` int(11) NOT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createEmp` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `method` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `pic` varchar(255) DEFAULT NULL,
  `pid` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fva1u374y516dwyfua3c56ogi` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

CREATE TABLE `requisition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approver` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `createEmp` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `depa_code` varchar(255) DEFAULT NULL,
  `depot_code` varchar(255) DEFAULT NULL,
  `job_num` varchar(255) DEFAULT NULL,
  `purc_ware_name` varchar(255) DEFAULT NULL,
  `purc_ware_num` bigint(20) DEFAULT NULL,
  `purc_ware_type` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `supp_code` varchar(255) DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `unit_price` double DEFAULT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE `sale_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `approver` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `consignee` varchar(255) DEFAULT NULL,
  `customer_buy` varchar(255) NOT NULL,
  `depot_code` varchar(255) DEFAULT NULL,
  `money` double NOT NULL,
  `number` bigint(20) NOT NULL,
  `r_phoneNumber` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `requ_name` varchar(255) DEFAULT NULL,
  `s_phoneNumber` varchar(255) NOT NULL,
  `salesperson` varchar(255) NOT NULL,
  `states` int(11) NOT NULL,
  `ware_code` varchar(255) NOT NULL,
  `createEmp` varchar(255) DEFAULT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ru47mtcbthg6ivad6ojw1ehru` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createEmp` varchar(255) NOT NULL,
  `createTime` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `rank` varchar(255) NOT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_u0lh6hby20ok7au7646wrewl` (`code`),
  UNIQUE KEY `UK_c3fclhmodftxk4d0judiafwi3` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `suppwaretype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `createEmp` varchar(255) NOT NULL,
  `createTime` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `sup_code` varchar(255) NOT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_kncah8go572cl969orjidhhxd` (`code`),
  UNIQUE KEY `UK_ctjc94vrf3xl652nolcxe485r` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `supp_wares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createEmp` varchar(255) NOT NULL,
  `createTime` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `supp_code` varchar(255) NOT NULL,
  `total_inventory` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `unit_price` double NOT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ra2cupmtjyomkmpgkqnened7g` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `u_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `method` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `supId` int(11) NOT NULL,
  `createEmp` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE `u_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createEmp` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jc07o365i9t5w7r587ea9hrs` (`code`),
  UNIQUE KEY `UK_q1gss8a045n528eqx9jtd46sa` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `u_role_permission` (
  `rid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  PRIMARY KEY (`rid`,`pid`),
  KEY `FKxu4pb7kvc4q7arfox8gfnxv6` (`pid`),
  CONSTRAINT `FK6dtd4u4es5aquyd09tf7h4scn` FOREIGN KEY (`rid`) REFERENCES `u_permission` (`id`),
  CONSTRAINT `FKxu4pb7kvc4q7arfox8gfnxv6` FOREIGN KEY (`pid`) REFERENCES `u_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `u_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createEmp` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `addr` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phoneNumber` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `states` int(11) NOT NULL,
  `depa_code` varchar(255) DEFAULT NULL,
  `job_num` varchar(255) NOT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_73oe4d5wpupis8knom5yi2n79` (`name`),
  UNIQUE KEY `UK_aqar42tfxxxeu7ww7r2prjfsj` (`job_num`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

CREATE TABLE `u_user_role` (
  `uid` int(11) NOT NULL,
  `rid` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`rid`),
  KEY `FKaspn9chwigpxbhqpakvvampum` (`rid`),
  CONSTRAINT `FKaspn9chwigpxbhqpakvvampum` FOREIGN KEY (`rid`) REFERENCES `u_user` (`id`),
  CONSTRAINT `FKli836kk3lyxwt2q3shsh0jlg` FOREIGN KEY (`uid`) REFERENCES `u_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ware` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) NOT NULL,
  `bar_code` varchar(255) DEFAULT NULL,
  `brand` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createEmp` varchar(255) NOT NULL,
  `createTime` date NOT NULL,
  `In_unit_price` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `out_unit_price` double NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `total_inventory` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `updateEmp` varchar(255) DEFAULT NULL,
  `updateTime` date DEFAULT NULL,
  `ware_photo` varchar(255) NOT NULL,
  `ware_type_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_7qqd73qbmuh1aawl9wlqmkhxq` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `wares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addr` varchar(255) NOT NULL,
  `bar_code` varchar(255) DEFAULT NULL,
  `brand` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `createEmp` varchar(255) NOT NULL,
  `createTime` date NOT NULL,
  `In_unit_price` double NOT NULL,
  `name` varchar(255) NOT NULL,
  `out_unit_price` double NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `total_inventory` bigint(20) NOT NULL,
  `type` varchar(255) NOT NULL,
  `updateEmp` varchar(255) NOT NULL,
  `updateTime` date NOT NULL,
  `ware_photo` varchar(255) NOT NULL,
  `ware_type_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_smh2hw7jvf2uplma9aeypucef` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ware_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `createEmp` varchar(255) NOT NULL,
  `createTime` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `sup_code` varchar(255) NOT NULL,
  `updateEmp` varchar(255) NOT NULL,
  `updateTime` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_l3h1vyobuwqjdfos0bn0w8u5e` (`code`),
  UNIQUE KEY `UK_c3roobrs879bdch9igel927ip` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

