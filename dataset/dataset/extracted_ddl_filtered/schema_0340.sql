-- Source: https://github.com/Watson-ljf/spring-boot-web/blob/ab0894f6e587e8fad1c7270c67af9dbcf3e3002b/src/main/resources/sql/watson20180530.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 5

CREATE TABLE `sys_dictionary` (
  `dict_code` varchar(8) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(50) NOT NULL COMMENT '字典名称',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='字典';

CREATE TABLE `sys_dictionarydata` (
  `dictdata_code` varchar(8) NOT NULL COMMENT '字典项主键',
  `dict_code` varchar(8) NOT NULL COMMENT '字典主键',
  `dictdata_name` varchar(50) NOT NULL COMMENT '字典项值',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `sort_number` int(11) NOT NULL COMMENT '排序',
  `description` varchar(200) DEFAULT NULL COMMENT '描述',
  PRIMARY KEY (`dictdata_code`),
  KEY `FK_Reference_36` (`dict_code`),
  CONSTRAINT `FK_Reference_36` FOREIGN KEY (`dict_code`) REFERENCES `sys_dictionary` (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='字典项';

CREATE TABLE `sys_login_record` (
  `id` varchar(8) NOT NULL COMMENT '主键',
  `user_id` varchar(8) NOT NULL COMMENT '用户id',
  `os_name` varchar(200) DEFAULT NULL COMMENT '操作系统',
  `device` varchar(200) DEFAULT NULL COMMENT '设备名',
  `browser_type` varchar(200) DEFAULT NULL COMMENT '浏览器类型',
  `ip_address` varchar(200) DEFAULT NULL COMMENT 'ip地址',
  `create_time` datetime NOT NULL COMMENT '登录时间',
  PRIMARY KEY (`id`),
  KEY `FK_sys_login_record_user` (`user_id`),
  CONSTRAINT `FK_sys_login_record_user` FOREIGN KEY (`user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `sys_permission` (
  `permission_id` varchar(8) NOT NULL COMMENT '主键id',
  `parent_id` varchar(8) DEFAULT NULL COMMENT '上级权限',
  `permission_name` varchar(20) NOT NULL COMMENT '权限名',
  `permission_value` varchar(20) DEFAULT NULL COMMENT '权限值',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除：0否,1是',
  `permission_icon` varchar(20) DEFAULT NULL COMMENT '图标',
  `order_number` int(11) NOT NULL DEFAULT '0' COMMENT '菜单排序编号',
  `permission_type` int(11) NOT NULL DEFAULT '0' COMMENT '权限类型：0菜单，1按钮',
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `sys_role` (
  `role_id` varchar(8) NOT NULL,
  `role_name` varchar(100) NOT NULL,
  `comments` varchar(200) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `is_delete` int(11) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `sys_role_permission` (
  `id` varchar(8) NOT NULL,
  `role_id` varchar(8) NOT NULL,
  `permission_id` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_sys_role_permission_pm` (`permission_id`),
  KEY `FK_sys_role_permission_role` (`role_id`),
  CONSTRAINT `FK_sys_role_permission_pm` FOREIGN KEY (`permission_id`) REFERENCES `sys_permission` (`permission_id`),
  CONSTRAINT `FK_sys_role_permission_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

CREATE TABLE `sys_user` (
  `user_id` varchar(8) NOT NULL COMMENT '主键id',
  `user_account` varchar(20) NOT NULL COMMENT '账号',
  `user_password` varchar(32) NOT NULL COMMENT '密码',
  `user_nickname` varchar(20) NOT NULL COMMENT '用户名',
  `mobile_phone` varchar(12) DEFAULT NULL COMMENT '手机号',
  `sex` varchar(1) NOT NULL DEFAULT '男' COMMENT '性别',
  `user_status` int(1) NOT NULL DEFAULT '0' COMMENT '状态，0正常，1冻结',
  `create_time` datetime NOT NULL COMMENT '注册时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `role_id` varchar(8) NOT NULL COMMENT '角色ID',
  `token` varchar(200) DEFAULT NULL COMMENT '设备id',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_account` (`user_account`),
  KEY `FK_sys_user_role` (`role_id`),
  CONSTRAINT `FK_sys_user_role` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

