-- Source: https://github.com/tanlei945/MyProject/blob/fba90c2e1db30027b51ca043a43b617d3f797683/docs/db/jeecg-boot_1.1.0-20190415.sql?raw=true
-- Tables detected: 35 | FK/REFERENCES mentions: 5

CREATE TABLE `demo` (
  `id` varchar(50) NOT NULL COMMENT '主键ID',
  `name` varchar(30) default NULL COMMENT '姓名',
  `key_word` varchar(255) default NULL COMMENT '关键词',
  `punch_time` datetime default NULL COMMENT '打卡时间',
  `salary_money` decimal(10,3) default NULL COMMENT '工资',
  `bonus_money` double(10,2) default NULL COMMENT '奖金',
  `sex` varchar(2) default NULL COMMENT '性别 {男:1,女:2}',
  `age` int(11) default NULL COMMENT '年龄',
  `birthday` date default NULL COMMENT '生日',
  `email` varchar(50) default NULL COMMENT '邮箱',
  `content` varchar(1000) default NULL COMMENT '个人简介',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '修改人',
  `update_time` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `jeecg_order_customer` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '客户名',
  `sex` varchar(4) default NULL COMMENT '性别',
  `idcard` varchar(18) default NULL COMMENT '身份证号码',
  `idcard_pic` varchar(500) default NULL COMMENT '身份证扫描件',
  `telphone` varchar(32) default NULL COMMENT '电话1',
  `order_id` varchar(32) NOT NULL COMMENT '外键',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '修改人',
  `update_time` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `jeecg_order_main` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `order_code` varchar(50) default NULL COMMENT '订单号',
  `ctype` varchar(500) default NULL COMMENT '订单类型',
  `order_date` datetime default NULL COMMENT '订单日期',
  `order_money` double(10,3) default NULL COMMENT '订单金额',
  `content` varchar(500) default NULL COMMENT '订单备注',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '修改人',
  `update_time` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `jeecg_order_ticket` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `ticket_code` varchar(100) NOT NULL COMMENT '航班号',
  `tickect_date` datetime default NULL COMMENT '航班时间',
  `order_id` varchar(32) NOT NULL COMMENT '外键',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '修改人',
  `update_time` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `onl_cgreport_head` (
  `id` varchar(36) NOT NULL,
  `code` varchar(100) NOT NULL COMMENT '报表编码',
  `name` varchar(100) NOT NULL COMMENT '报表名字',
  `cgr_sql` varchar(1000) NOT NULL COMMENT '报表SQL',
  `return_val_field` varchar(100) default NULL COMMENT '返回值字段',
  `return_txt_field` varchar(100) default NULL COMMENT '返回文本字段',
  `return_type` varchar(2) default '1' COMMENT '返回类型，单选或多选',
  `db_source` varchar(100) default NULL COMMENT '动态数据源',
  `content` varchar(1000) default NULL COMMENT '描述',
  `update_time` datetime default NULL COMMENT '修改时间',
  `update_by` varchar(32) default NULL COMMENT '修改人id',
  `create_time` datetime default NULL COMMENT '创建时间',
  `create_by` varchar(32) default NULL COMMENT '创建人id',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_onlinereport_code` USING BTREE (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `onl_cgreport_item` (
  `id` varchar(36) NOT NULL,
  `cgrhead_id` varchar(36) NOT NULL COMMENT '报表ID',
  `field_name` varchar(36) NOT NULL COMMENT '字段名字',
  `field_txt` varchar(300) default NULL COMMENT '字段文本',
  `field_width` int(3) default NULL,
  `field_type` varchar(10) default NULL COMMENT '字段类型',
  `search_mode` varchar(10) default NULL COMMENT '查询模式',
  `is_order` int(2) default '0' COMMENT '是否排序  0否,1是',
  `is_search` int(2) default '0' COMMENT '是否查询  0否,1是',
  `dict_code` varchar(36) default NULL COMMENT '字典CODE',
  `field_href` varchar(120) default NULL COMMENT '字段跳转URL',
  `is_show` int(2) default '1' COMMENT '是否显示  0否,1显示',
  `order_num` int(11) default NULL COMMENT '排序',
  `replace_val` varchar(200) default NULL COMMENT '取值表达式',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '修改人',
  `update_time` datetime default NULL COMMENT '修改时间',
  PRIMARY KEY  (`id`),
  KEY `index_CGRHEAD_ID` USING BTREE (`cgrhead_id`),
  KEY `index_isshow` USING BTREE (`is_show`),
  KEY `index_order_num` USING BTREE (`order_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `onl_cgreport_param` (
  `id` varchar(36) NOT NULL,
  `cgrhead_id` varchar(36) NOT NULL COMMENT '动态报表ID',
  `param_name` varchar(32) NOT NULL COMMENT '参数字段',
  `param_txt` varchar(32) default NULL COMMENT '参数文本',
  `param_value` varchar(32) default NULL COMMENT '参数默认值',
  `order_num` int(11) default NULL COMMENT '排序',
  `create_by` varchar(50) default NULL COMMENT '创建人登录名称',
  `create_time` datetime default NULL COMMENT '创建日期',
  `update_by` varchar(50) default NULL COMMENT '更新人登录名称',
  `update_time` datetime default NULL COMMENT '更新日期',
  PRIMARY KEY  (`id`),
  KEY `idx_cgrheadid` USING BTREE (`cgrhead_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB;

CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB;

CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) default NULL,
  `JOB_GROUP` varchar(200) default NULL,
  `IS_NONCONCURRENT` varchar(1) default NULL,
  `REQUESTS_RECOVERY` varchar(1) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB;

CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) default NULL,
  `STR_PROP_2` varchar(512) default NULL,
  `STR_PROP_3` varchar(512) default NULL,
  `INT_PROP_1` int(11) default NULL,
  `INT_PROP_2` int(11) default NULL,
  `LONG_PROP_1` bigint(20) default NULL,
  `LONG_PROP_2` bigint(20) default NULL,
  `DEC_PROP_1` decimal(13,4) default NULL,
  `DEC_PROP_2` decimal(13,4) default NULL,
  `BOOL_PROP_1` varchar(1) default NULL,
  `BOOL_PROP_2` varchar(1) default NULL,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB;

CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) default NULL,
  `NEXT_FIRE_TIME` bigint(13) default NULL,
  `PREV_FIRE_TIME` bigint(13) default NULL,
  `PRIORITY` int(11) default NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) default NULL,
  `CALENDAR_NAME` varchar(200) default NULL,
  `MISFIRE_INSTR` smallint(2) default NULL,
  `JOB_DATA` blob,
  PRIMARY KEY  (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` USING BTREE (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='InnoDB free: 504832 kB;

CREATE TABLE `sys_announcement` (
  `id` varchar(32) NOT NULL,
  `titile` varchar(100) default NULL COMMENT '标题',
  `msg_content` text COMMENT '内容',
  `start_time` datetime default NULL COMMENT '开始时间',
  `end_time` datetime default NULL COMMENT '结束时间',
  `sender` varchar(100) default NULL COMMENT '发布人',
  `priority` varchar(255) default NULL COMMENT '优先级（L低，M中，H高）',
  `msg_type` varchar(10) default NULL COMMENT '通告对象类型（USER:指定用户，ALL:全体用户）',
  `send_status` varchar(10) default NULL COMMENT '发布状态（0未发布，1已发布，2已撤销）',
  `send_time` datetime default NULL COMMENT '发布时间',
  `cancel_time` datetime default NULL COMMENT '撤销时间',
  `del_flag` varchar(1) default NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '更新人',
  `update_time` datetime default NULL COMMENT '更新时间',
  `user_ids` text COMMENT '指定用户',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统通告表';

CREATE TABLE `sys_announcement_send` (
  `id` varchar(32) default NULL,
  `annt_id` varchar(32) default NULL COMMENT '通告ID',
  `user_id` varchar(32) default NULL COMMENT '用户id',
  `read_flag` varchar(10) default NULL COMMENT '阅读状态（0未读，1已读）',
  `read_time` datetime default NULL COMMENT '阅读时间',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '更新人',
  `update_time` datetime default NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户通告阅读标记表';

CREATE TABLE `sys_data_log` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `create_by` varchar(32) default NULL COMMENT '创建人登录名称',
  `create_time` datetime default NULL COMMENT '创建日期',
  `update_by` varchar(32) default NULL COMMENT '更新人登录名称',
  `update_time` datetime default NULL COMMENT '更新日期',
  `data_table` varchar(32) default NULL COMMENT '表名',
  `data_id` varchar(32) default NULL COMMENT '数据ID',
  `data_content` text COMMENT '数据内容',
  `data_version` int(11) default NULL COMMENT '版本号',
  PRIMARY KEY  (`id`),
  KEY `sindex` USING BTREE (`data_table`,`data_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_depart` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `parent_id` varchar(32) default NULL COMMENT '父机构ID',
  `depart_name` varchar(100) NOT NULL COMMENT '机构/部门名称',
  `depart_name_en` varchar(500) default NULL COMMENT '英文名',
  `depart_name_abbr` varchar(500) default NULL COMMENT '缩写',
  `depart_order` int(11) default '0' COMMENT '排序',
  `description` text COMMENT '描述',
  `org_type` varchar(10) default NULL COMMENT '机构类型',
  `org_code` varchar(64) NOT NULL COMMENT '机构编码',
  `mobile` varchar(32) default NULL COMMENT '手机号',
  `fax` varchar(32) default NULL COMMENT '传真',
  `address` varchar(100) default NULL COMMENT '地址',
  `memo` varchar(500) default NULL COMMENT '备注',
  `status` varchar(1) default NULL COMMENT '状态（1启用，0不启用）',
  `del_flag` varchar(1) default NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建日期',
  `update_by` varchar(32) default NULL COMMENT '更新人',
  `update_time` datetime default NULL COMMENT '更新日期',
  PRIMARY KEY  (`id`),
  KEY `index_depart_parent_id` USING BTREE (`parent_id`),
  KEY `index_depart_depart_order` USING BTREE (`depart_order`),
  KEY `index_depart_org_code` USING BTREE (`org_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组织机构表';

CREATE TABLE `sys_dict` (
  `id` varchar(32) NOT NULL,
  `dict_name` varchar(100) default NULL COMMENT '字典名称',
  `dict_code` varchar(100) default NULL COMMENT '字典编码',
  `description` varchar(255) default NULL COMMENT '描述',
  `del_flag` int(1) default NULL COMMENT '删除状态',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '更新人',
  `update_time` datetime default NULL COMMENT '更新时间',
  `type` int(1) unsigned zerofill default '0' COMMENT '字典类型0为string,1为number',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `indextable_dict_code` USING BTREE (`dict_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_dict_item` (
  `id` varchar(32) NOT NULL,
  `dict_id` varchar(32) default NULL COMMENT '字典id',
  `item_text` varchar(100) default NULL COMMENT '字典项文本',
  `item_value` varchar(100) default NULL COMMENT '字典项值',
  `description` varchar(255) default NULL COMMENT '描述',
  `sort_order` int(10) default NULL COMMENT '排序',
  `status` int(11) default NULL COMMENT '状态（1启用 0不启用）',
  `create_by` varchar(32) default NULL,
  `create_time` datetime default NULL,
  `update_by` varchar(32) default NULL,
  `update_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_table_dict_id` USING BTREE (`dict_id`),
  KEY `index_table_sort_order` USING BTREE (`sort_order`),
  KEY `index_table_dict_status` USING BTREE (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_log` (
  `id` varchar(32) NOT NULL,
  `log_type` int(2) default NULL COMMENT '日志类型（1登录日志，2操作日志）',
  `log_content` varchar(1000) default NULL COMMENT '日志内容',
  `operate_type` int(2) default NULL COMMENT '操作类型',
  `userid` varchar(32) default NULL COMMENT '操作用户账号',
  `username` varchar(100) default NULL COMMENT '操作用户名称',
  `ip` varchar(100) default NULL COMMENT 'IP',
  `method` varchar(500) default NULL COMMENT '请求java方法',
  `request_url` varchar(255) default NULL COMMENT '请求路径',
  `request_param` varchar(255) default NULL COMMENT '请求参数',
  `request_type` varchar(10) default NULL COMMENT '请求类型',
  `cost_time` bigint(20) default NULL COMMENT '耗时',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '更新人',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`),
  KEY `index_table_userid` USING BTREE (`userid`),
  KEY `index_logt_ype` USING BTREE (`log_type`),
  KEY `index_operate_type` USING BTREE (`operate_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统日志表';

CREATE TABLE `sys_permission` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `parent_id` varchar(32) default NULL COMMENT '父id',
  `name` varchar(100) default NULL COMMENT '菜单标题',
  `url` varchar(255) default NULL COMMENT '路径',
  `component` varchar(255) default NULL COMMENT '组件',
  `component_name` varchar(100) default NULL COMMENT '组件名字',
  `redirect` varchar(255) default NULL COMMENT '一级菜单跳转地址',
  `menu_type` int(11) default NULL COMMENT '菜单类型(0:一级菜单;

CREATE TABLE `sys_permission_data_rule` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `permission_id` varchar(32) default NULL COMMENT '菜单ID',
  `rule_name` varchar(50) default NULL COMMENT '规则名称',
  `rule_column` varchar(50) default NULL COMMENT '字段',
  `rule_conditions` varchar(50) default NULL COMMENT '条件',
  `rule_value` varchar(300) default NULL COMMENT '规则值',
  `create_time` datetime default NULL COMMENT '创建时间',
  `create_by` varchar(32) default NULL,
  `update_time` datetime default NULL COMMENT '修改时间',
  `update_by` varchar(32) default NULL COMMENT '修改人',
  PRIMARY KEY  (`id`),
  KEY `index_fucntionid` USING BTREE (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_quartz_job` (
  `id` varchar(32) NOT NULL,
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `del_flag` int(1) default NULL COMMENT '删除状态',
  `update_by` varchar(32) default NULL COMMENT '修改人',
  `update_time` datetime default NULL COMMENT '修改时间',
  `job_class_name` varchar(255) default NULL COMMENT '任务类名',
  `cron_expression` varchar(255) default NULL COMMENT 'cron表达式',
  `parameter` varchar(255) default NULL COMMENT '参数',
  `description` varchar(255) default NULL COMMENT '描述',
  `status` int(1) default NULL COMMENT '状态 0正常 -1停止',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `sys_role` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `role_name` varchar(200) default NULL COMMENT '角色名称',
  `role_code` varchar(100) default NULL COMMENT '角色编码',
  `description` varchar(255) default NULL COMMENT '描述',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '更新人',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_role_code` USING BTREE (`role_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

CREATE TABLE `sys_role_permission` (
  `id` varchar(32) NOT NULL,
  `role_id` varchar(32) default NULL COMMENT '角色id',
  `permission_id` varchar(32) default NULL COMMENT '权限id',
  `data_rule_ids` varchar(1000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_group_role_per_id` USING BTREE (`role_id`,`permission_id`),
  KEY `index_group_role_id` USING BTREE (`role_id`),
  KEY `index_group_per_id` USING BTREE (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限表';

CREATE TABLE `sys_sms` (
  `id` varchar(32) NOT NULL COMMENT 'ID',
  `es_title` varchar(100) default NULL COMMENT '消息标题',
  `es_type` varchar(1) default NULL COMMENT '发送方式：1短信 2邮件 3微信',
  `es_receiver` varchar(50) default NULL COMMENT '接收人',
  `es_param` varchar(1000) default NULL COMMENT '发送所需参数Json格式',
  `es_content` longtext COMMENT '推送内容',
  `es_send_time` datetime default NULL COMMENT '推送时间',
  `es_send_status` varchar(1) default NULL COMMENT '推送状态 0未推送 1推送成功 2推送失败 -1失败不再发送',
  `es_send_num` int(11) default NULL COMMENT '发送次数 超过5次不再发送',
  `es_result` varchar(255) default NULL COMMENT '推送失败原因',
  `remark` varchar(500) default NULL COMMENT '备注',
  `create_by` varchar(32) default NULL COMMENT '创建人登录名称',
  `create_time` datetime default NULL COMMENT '创建日期',
  `update_by` varchar(32) default NULL COMMENT '更新人登录名称',
  `update_time` datetime default NULL COMMENT '更新日期',
  PRIMARY KEY  (`id`),
  KEY `index_type` USING BTREE (`es_type`),
  KEY `index_receiver` USING BTREE (`es_receiver`),
  KEY `index_sendtime` USING BTREE (`es_send_time`),
  KEY `index_status` USING BTREE (`es_send_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_sms_template` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `template_name` varchar(50) default NULL COMMENT '模板标题',
  `template_code` varchar(32) NOT NULL COMMENT '模板CODE',
  `template_type` varchar(1) NOT NULL COMMENT '模板类型：1短信 2邮件 3微信',
  `template_content` varchar(1000) NOT NULL COMMENT '模板内容',
  `template_test_json` varchar(1000) default NULL COMMENT '模板测试json',
  `create_time` datetime default NULL COMMENT '创建日期',
  `create_by` varchar(32) default NULL COMMENT '创建人登录名称',
  `update_time` datetime default NULL COMMENT '更新日期',
  `update_by` varchar(32) default NULL COMMENT '更新人登录名称',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `uniq_templatecode` USING BTREE (`template_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_user` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `username` varchar(100) default NULL COMMENT '登录账号',
  `realname` varchar(100) default NULL COMMENT '真实姓名',
  `password` varchar(255) default NULL COMMENT '密码',
  `salt` varchar(45) default NULL COMMENT 'md5密码盐',
  `avatar` varchar(255) default NULL COMMENT '头像',
  `birthday` datetime default NULL COMMENT '生日',
  `sex` int(11) default NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) default NULL COMMENT '电子邮件',
  `phone` varchar(45) default NULL COMMENT '电话',
  `status` int(2) default NULL COMMENT '状态(1：正常  2：冻结 ）',
  `del_flag` varchar(1) default NULL COMMENT '删除状态（0，正常，1已删除）',
  `create_by` varchar(32) default NULL COMMENT '创建人',
  `create_time` datetime default NULL COMMENT '创建时间',
  `update_by` varchar(32) default NULL COMMENT '更新人',
  `update_time` datetime default NULL COMMENT '更新时间',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_user_name` USING BTREE (`username`),
  KEY `index_user_status` USING BTREE (`status`),
  KEY `index_user_del_flag` USING BTREE (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE `sys_user_depart` (
  `ID` varchar(32) NOT NULL COMMENT 'id',
  `user_id` varchar(32) default NULL COMMENT '用户id',
  `dep_id` varchar(32) default NULL COMMENT '部门id',
  PRIMARY KEY  (`ID`),
  KEY `index_depart_groupk_userid` USING BTREE (`user_id`),
  KEY `index_depart_groupkorgid` USING BTREE (`dep_id`),
  KEY `index_depart_groupk_uidanddid` USING BTREE (`user_id`,`dep_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `sys_user_role` (
  `id` varchar(32) NOT NULL COMMENT '主键id',
  `user_id` varchar(32) default NULL COMMENT '用户id',
  `role_id` varchar(32) default NULL COMMENT '角色id',
  PRIMARY KEY  (`id`),
  KEY `index2_groupuu_user_id` USING BTREE (`user_id`),
  KEY `index2_groupuu_ole_id` USING BTREE (`role_id`),
  KEY `index2_groupuu_useridandroleid` USING BTREE (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色表';

