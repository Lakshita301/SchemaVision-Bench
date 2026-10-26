-- Source: https://github.com/leo-bin/bole/blob/d4c7281683f4fc62da007b33504033c5f2edebc8/bole-server/bole-api/src/main/resources/db/migration/V1__vhr.sql?raw=true
-- Tables detected: 22 | FK constraints: 20

CREATE TABLE `adjustsalary`
(
  `id`           int(11) NOT NULL AUTO_INCREMENT,
  `eid`          int(11)      DEFAULT NULL,
  `asDate`       date         DEFAULT NULL COMMENT '调薪日期',
  `beforeSalary` int(11)      DEFAULT NULL COMMENT '调前薪资',
  `afterSalary`  int(11)      DEFAULT NULL COMMENT '调后薪资',
  `reason`       varchar(255) DEFAULT NULL COMMENT '调薪原因',
  `remark`       varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `adjustsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `appraise`
(
  `id`         int(11) NOT NULL AUTO_INCREMENT,
  `eid`        int(11)      DEFAULT NULL,
  `appDate`    date         DEFAULT NULL COMMENT '考评日期',
  `appResult`  varchar(32)  DEFAULT NULL COMMENT '考评结果',
  `appContent` varchar(255) DEFAULT NULL COMMENT '考评内容',
  `remark`     varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `appraise_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `mail_send_log`
(
  `msgId`      varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `empId`      int(11)                                                       DEFAULT NULL,
  `status`     int(11)                                                       DEFAULT '0' COMMENT '0发送中，1发送成功，2发送失败',
  `routeKey`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `exchange`   varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `count`      int(11)                                                       DEFAULT 0 COMMENT '重试次数',
  `tryTime`    datetime                                                      DEFAULT NULL COMMENT '第一次重试时间',
  `createTime` datetime                                                      DEFAULT NULL,
  `updateTime` datetime                                                      DEFAULT NULL
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_general_ci;

CREATE TABLE `department`
(
  `id`       int(11) NOT NULL AUTO_INCREMENT,
  `name`     varchar(32)  DEFAULT NULL COMMENT '部门名称',
  `parentId` int(11)      DEFAULT NULL,
  `depPath`  varchar(255) DEFAULT NULL,
  `enabled`  tinyint(1)   DEFAULT '1',
  `isParent` tinyint(1)   DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  DEFAULT CHARSET = utf8;

CREATE TABLE `employee`
(
  `id`             int(11) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `name`           varchar(10)                                    DEFAULT NULL COMMENT '员工姓名',
  `gender`         char(4)                                        DEFAULT NULL COMMENT '性别',
  `birthday`       date                                           DEFAULT NULL COMMENT '出生日期',
  `idCard`         char(18)                                       DEFAULT NULL COMMENT '身份证号',
  `wedlock`        enum ('已婚','未婚','离异')                          DEFAULT NULL COMMENT '婚姻状况',
  `nationId`       int(8)                                         DEFAULT NULL COMMENT '民族',
  `nativePlace`    varchar(20)                                    DEFAULT NULL COMMENT '籍贯',
  `politicId`      int(8)                                         DEFAULT NULL COMMENT '政治面貌',
  `email`          varchar(20)                                    DEFAULT NULL COMMENT '邮箱',
  `phone`          varchar(11)                                    DEFAULT NULL COMMENT '电话号码',
  `address`        varchar(64)                                    DEFAULT NULL COMMENT '联系地址',
  `departmentId`   int(11)                                        DEFAULT NULL COMMENT '所属部门',
  `jobLevelId`     int(11)                                        DEFAULT NULL COMMENT '职称ID',
  `posId`          int(11)                                        DEFAULT NULL COMMENT '职位ID',
  `engageForm`     varchar(8)                                     DEFAULT NULL COMMENT '聘用形式',
  `tiptopDegree`   enum ('博士','硕士','本科','大专','高中','初中','小学','其他') DEFAULT NULL COMMENT '最高学历',
  `specialty`      varchar(32)                                    DEFAULT NULL COMMENT '所属专业',
  `school`         varchar(32)                                    DEFAULT NULL COMMENT '毕业院校',
  `beginDate`      date                                           DEFAULT NULL COMMENT '入职日期',
  `workState`      enum ('在职','离职')                               DEFAULT '在职' COMMENT '在职状态',
  `workID`         char(8)                                        DEFAULT NULL COMMENT '工号',
  `contractTerm`   double                                         DEFAULT NULL COMMENT '合同期限',
  `conversionTime` date                                           DEFAULT NULL COMMENT '转正日期',
  `notWorkDate`    date                                           DEFAULT NULL COMMENT '离职日期',
  `beginContract`  date                                           DEFAULT NULL COMMENT '合同起始日期',
  `endContract`    date                                           DEFAULT NULL COMMENT '合同终止日期',
  `workAge`        int(11)                                        DEFAULT NULL COMMENT '工龄',
  PRIMARY KEY (`id`),
  KEY `departmentId` (`departmentId`),
  KEY `jobId` (`jobLevelId`),
  KEY `dutyId` (`posId`),
  KEY `nationId` (`nationId`),
  KEY `politicId` (`politicId`),
  KEY `workID_key` (`workID`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`jobLevelId`) REFERENCES `joblevel` (`id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`posId`) REFERENCES `position` (`id`),
  CONSTRAINT `employee_ibfk_4` FOREIGN KEY (`nationId`) REFERENCES `nation` (`id`),
  CONSTRAINT `employee_ibfk_5` FOREIGN KEY (`politicId`) REFERENCES `politicsstatus` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1942
  DEFAULT CHARSET = utf8;

CREATE TABLE `employeeec`
(
  `id`       int(11) NOT NULL AUTO_INCREMENT,
  `eid`      int(11)      DEFAULT NULL COMMENT '员工编号',
  `ecDate`   date         DEFAULT NULL COMMENT '奖罚日期',
  `ecReason` varchar(255) DEFAULT NULL COMMENT '奖罚原因',
  `ecPoint`  int(11)      DEFAULT NULL COMMENT '奖罚分',
  `ecType`   int(11)      DEFAULT NULL COMMENT '奖罚类别，0：奖，1：罚',
  `remark`   varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeec_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `employeeremove`
(
  `id`         int(11) NOT NULL AUTO_INCREMENT,
  `eid`        int(11)      DEFAULT NULL,
  `afterDepId` int(11)      DEFAULT NULL COMMENT '调动后部门',
  `afterJobId` int(11)      DEFAULT NULL COMMENT '调动后职位',
  `removeDate` date         DEFAULT NULL COMMENT '调动日期',
  `reason`     varchar(255) DEFAULT NULL COMMENT '调动原因',
  `remark`     varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeeremove_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `employeetrain`
(
  `id`           int(11) NOT NULL AUTO_INCREMENT,
  `eid`          int(11)      DEFAULT NULL COMMENT '员工编号',
  `trainDate`    date         DEFAULT NULL COMMENT '培训日期',
  `trainContent` varchar(255) DEFAULT NULL COMMENT '培训内容',
  `remark`       varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`eid`),
  CONSTRAINT `employeetrain_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `empsalary`
(
  `id`  int(11) NOT NULL AUTO_INCREMENT,
  `eid` int(11) DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `eid` (`eid`),
  KEY `empsalary_ibfk_2` (`sid`),
  CONSTRAINT `empsalary_ibfk_1` FOREIGN KEY (`eid`) REFERENCES `employee` (`id`),
  CONSTRAINT `empsalary_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `salary` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 39
  DEFAULT CHARSET = utf8;

CREATE TABLE `hr`
(
  `id`        int(11) NOT NULL AUTO_INCREMENT COMMENT 'hrID',
  `name`      varchar(32)  DEFAULT NULL COMMENT '姓名',
  `phone`     char(11)     DEFAULT NULL COMMENT '手机号码',
  `telephone` varchar(16)  DEFAULT NULL COMMENT '住宅电话',
  `address`   varchar(64)  DEFAULT NULL COMMENT '联系地址',
  `enabled`   tinyint(1)   DEFAULT '1',
  `username`  varchar(255) DEFAULT NULL COMMENT '用户名',
  `password`  varchar(255) DEFAULT NULL COMMENT '密码',
  `userface`  varchar(255) DEFAULT NULL,
  `remark`    varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 13
  DEFAULT CHARSET = utf8;

CREATE TABLE `hr_role`
(
  `id`   int(11) NOT NULL AUTO_INCREMENT,
  `hrId` int(11) DEFAULT NULL,
  `rid`  int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rid` (`rid`),
  KEY `hr_role_ibfk_1` (`hrId`),
  CONSTRAINT `hr_role_ibfk_1` FOREIGN KEY (`hrId`) REFERENCES `hr` (`id`) ON DELETE CASCADE,
  CONSTRAINT `hr_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 75
  DEFAULT CHARSET = utf8;

CREATE TABLE `joblevel`
(
  `id`         int(11)   NOT NULL AUTO_INCREMENT,
  `name`       varchar(32)                       DEFAULT NULL COMMENT '职称名称',
  `titleLevel` enum ('正高级','副高级','中级','初级','员级') DEFAULT NULL,
  `createDate` timestamp NULL                    DEFAULT CURRENT_TIMESTAMP,
  `enabled`    tinyint(1)                        DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 18
  DEFAULT CHARSET = utf8;

CREATE TABLE `menu`
(
  `id`          int(11) NOT NULL AUTO_INCREMENT,
  `url`         varchar(64) DEFAULT NULL,
  `path`        varchar(64) DEFAULT NULL,
  `component`   varchar(64) DEFAULT NULL,
  `name`        varchar(64) DEFAULT NULL,
  `iconCls`     varchar(64) DEFAULT NULL,
  `keepAlive`   tinyint(1)  DEFAULT NULL,
  `requireAuth` tinyint(1)  DEFAULT NULL,
  `parentId`    int(11)     DEFAULT NULL,
  `enabled`     tinyint(1)  DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parentId` (`parentId`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `menu` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 29
  DEFAULT CHARSET = utf8;

CREATE TABLE `menu_role`
(
  `id`  int(11) NOT NULL AUTO_INCREMENT,
  `mid` int(11) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mid` (`mid`),
  KEY `rid` (`rid`),
  CONSTRAINT `menu_role_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `menu` (`id`),
  CONSTRAINT `menu_role_ibfk_2` FOREIGN KEY (`rid`) REFERENCES `role` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 283
  DEFAULT CHARSET = utf8;

CREATE TABLE `msgcontent`
(
  `id`         int(11)   NOT NULL AUTO_INCREMENT,
  `title`      varchar(64)        DEFAULT NULL,
  `message`    varchar(255)       DEFAULT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8;

CREATE TABLE `nation`
(
  `id`   int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 57
  DEFAULT CHARSET = utf8;

CREATE TABLE `oplog`
(
  `id`      int(11) NOT NULL AUTO_INCREMENT,
  `addDate` date         DEFAULT NULL COMMENT '添加日期',
  `operate` varchar(255) DEFAULT NULL COMMENT '操作内容',
  `hrId`    int(11)      DEFAULT NULL COMMENT '操作员ID',
  PRIMARY KEY (`id`),
  KEY `hrId` (`hrId`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`hrId`) REFERENCES `hr` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `politicsstatus`
(
  `id`   int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 14
  DEFAULT CHARSET = utf8;

CREATE TABLE `position`
(
  `id`         int(11)   NOT NULL AUTO_INCREMENT,
  `name`       varchar(32)    DEFAULT NULL COMMENT '职位',
  `createDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `enabled`    tinyint(1)     DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 37
  DEFAULT CHARSET = utf8;

CREATE TABLE `role`
(
  `id`     int(11) NOT NULL AUTO_INCREMENT,
  `name`   varchar(64) DEFAULT NULL,
  `nameZh` varchar(64) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 22
  DEFAULT CHARSET = utf8;

CREATE TABLE `salary`
(
  `id`                   int(11)   NOT NULL AUTO_INCREMENT,
  `basicSalary`          int(11)        DEFAULT NULL COMMENT '基本工资',
  `bonus`                int(11)        DEFAULT NULL COMMENT '奖金',
  `lunchSalary`          int(11)        DEFAULT NULL COMMENT '午餐补助',
  `trafficSalary`        int(11)        DEFAULT NULL COMMENT '交通补助',
  `allSalary`            int(11)        DEFAULT NULL COMMENT '应发工资',
  `pensionBase`          int(11)        DEFAULT NULL COMMENT '养老金基数',
  `pensionPer`           float          DEFAULT NULL COMMENT '养老金比率',
  `createDate`           timestamp NULL DEFAULT NULL COMMENT '启用时间',
  `medicalBase`          int(11)        DEFAULT NULL COMMENT '医疗基数',
  `medicalPer`           float          DEFAULT NULL COMMENT '医疗保险比率',
  `accumulationFundBase` int(11)        DEFAULT NULL COMMENT '公积金基数',
  `accumulationFundPer`  float          DEFAULT NULL COMMENT '公积金比率',
  `name`                 varchar(32)    DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8;

CREATE TABLE `sysmsg`
(
  `id`    int(11) NOT NULL AUTO_INCREMENT,
  `mid`   int(11) DEFAULT NULL COMMENT '消息id',
  `type`  int(11) DEFAULT '0' COMMENT '0表示群发消息',
  `hrId`  int(11) DEFAULT NULL COMMENT '这条消息是给谁的',
  `state` int(11) DEFAULT '0' COMMENT '0 未读 1 已读',
  PRIMARY KEY (`id`),
  KEY `hrId` (`hrId`),
  KEY `sysmsg_ibfk_1` (`mid`),
  CONSTRAINT `sysmsg_ibfk_1` FOREIGN KEY (`mid`) REFERENCES `msgcontent` (`id`),
  CONSTRAINT `sysmsg_ibfk_2` FOREIGN KEY (`hrId`) REFERENCES `hr` (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 82
  DEFAULT CHARSET = utf8;

