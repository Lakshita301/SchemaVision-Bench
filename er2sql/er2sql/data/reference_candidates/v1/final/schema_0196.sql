-- Source: https://github.com/Ferzen/cmdb/blob/df36032846152d78c1f50c82c26560c8025596ef/doc/cmdb.sql?raw=true
-- Tables detected: 47 | FK/REFERENCES mentions: 38
CREATE TABLE "AuthNode" (
    "uuid" char(32) NOT NULL,
    "auth" SMALLINT NOT NULL,
    "datetime" TIMESTAMP NOT NULL,
    "node_id" char(32) DEFAULT NULL,
    "user_name_id" int NOT NULL,
    PRIMARY KEY ("uuid"),
    KEY "AuthNode_c693ebc8" ("node_id"),
    KEY "AuthNode_f10400a0" ("user_name_id"),
    CONSTRAINT "AuthNode_node_id_1f87fa44f6684140_fk_assets_host_uuid" FOREIGN KEY ("node_id") REFERENCES "assets_host" ("uuid"),
    CONSTRAINT "AuthNode_user_name_id_2f11b0adc9c83a00_fk_users_customuser_id" FOREIGN KEY ("user_name_id") REFERENCES "users_customuser" ("id")
);

CREATE TABLE "AuthSudo" (
    "uuid" char(32) NOT NULL,
    "groupname" varchar(64) NOT NULL,
    "shell" TEXT NOT NULL,
    "datetime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "assets_conftemplate" (
    "uuid" char(32) NOT NULL,
    "name" varchar(30) NOT NULL,
    "init_file" TEXT NOT NULL,
    "template_file" TEXT NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "assets_host" (
    "uuid" char(32) NOT NULL,
    "node_name" varchar(100) DEFAULT NULL,
    "eth1" char(15) DEFAULT NULL,
    "eth2" char(15) DEFAULT NULL,
    "mac" varchar(20) DEFAULT NULL,
    "internal_ip" char(15) DEFAULT NULL,
    "brand" varchar(64) DEFAULT NULL,
    "cpu" varchar(64) DEFAULT NULL,
    "hard_disk" varchar(128) DEFAULT NULL,
    "memory" varchar(128) DEFAULT NULL,
    "system" varchar(32) DEFAULT NULL,
    "system_cpuarch" varchar(32) DEFAULT NULL,
    "system_version" varchar(8) DEFAULT NULL,
    "create_time" TIMESTAMP NOT NULL,
    "guarantee_date" date DEFAULT NULL,
    "cabinet" varchar(32) DEFAULT NULL,
    "server_cabinet_id" int DEFAULT NULL,
    "number" varchar(32) DEFAULT NULL,
    "editor" TEXT,
    "status" int NOT NULL,
    "type" int NOT NULL,
    "Services_Code" varchar(16) DEFAULT NULL,
    "env" varchar(32) DEFAULT NULL,
    "room_number" varchar(32) DEFAULT NULL,
    "server_sn" varchar(32) DEFAULT NULL,
    "switch_port" varchar(12) DEFAULT NULL,
    "idle" SMALLINT NOT NULL,
    "idc_id" char(32),
    "vm_id" char(32),
    PRIMARY KEY ("uuid"),
    KEY "assets_host_0869e37a" ("idc_id"),
    KEY "assets_host_0e0cecb8" ("vm_id"),
    CONSTRAINT "assets_host_idc_id_fc02f1e2acbbcc_fk_assets_idc_uuid" FOREIGN KEY ("idc_id") REFERENCES "assets_idc" ("uuid"),
    CONSTRAINT "assets_host_vm_id_75080968af94dfe0_fk_assets_host_uuid" FOREIGN KEY ("vm_id") REFERENCES "assets_host" ("uuid")
);

CREATE TABLE "assets_host_business" (
    "id" int NOT NULL AUTO_INCREMENT,
    "host_id" char(32) NOT NULL,
    "project_id" char(32) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "host_id" ("host_id","project_id"),
    KEY "assets_host_business_8396f175" ("host_id"),
    KEY "assets_host_business_b098ad43" ("project_id"),
    CONSTRAINT "assets_host_b_project_id_7e1fdf33706676c3_fk_assets_project_uuid" FOREIGN KEY ("project_id") REFERENCES "assets_project" ("uuid"),
    CONSTRAINT "assets_host_busines_host_id_185b5e5decf9451d_fk_assets_host_uuid" FOREIGN KEY ("host_id") REFERENCES "assets_host" ("uuid")
);

CREATE TABLE "assets_host_service" (
    "id" int NOT NULL AUTO_INCREMENT,
    "host_id" char(32) NOT NULL,
    "service_id" char(32) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "host_id" ("host_id","service_id"),
    KEY "assets_host_service_8396f175" ("host_id"),
    KEY "assets_host_service_b0dc1e29" ("service_id"),
    CONSTRAINT "assets_host_s_service_id_1f5ce3d13bb0764b_fk_assets_service_uuid" FOREIGN KEY ("service_id") REFERENCES "assets_service" ("uuid"),
    CONSTRAINT "assets_host_service_host_id_660cc79feac0eb15_fk_assets_host_uuid" FOREIGN KEY ("host_id") REFERENCES "assets_host" ("uuid")
);

CREATE TABLE "assets_hostrecord" (
    "uuid" char(32) NOT NULL,
    "user" varchar(30) DEFAULT NULL,
    "time" TIMESTAMP NOT NULL,
    "content" TEXT,
    "comment" TEXT,
    "host_id" char(32) NOT NULL,
    PRIMARY KEY ("uuid"),
    KEY "assets_hostrecord_8396f175" ("host_id"),
    CONSTRAINT "assets_hostrecord_host_id_3b740786ef5f690a_fk_assets_host_uuid" FOREIGN KEY ("host_id") REFERENCES "assets_host" ("uuid")
);

CREATE TABLE "assets_idc" (
    "uuid" char(32) NOT NULL,
    "name" varchar(64) NOT NULL,
    "bandwidth" varchar(64) DEFAULT NULL,
    "phone" varchar(32) NOT NULL,
    "linkman" varchar(32) DEFAULT NULL,
    "address" varchar(128) DEFAULT NULL,
    "network" TEXT,
    "create_time" date NOT NULL,
    "operator" int DEFAULT NULL,
    "type" int DEFAULT NULL,
    "comment" TEXT,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "assets_iplist" (
    "uuid" char(32) NOT NULL,
    "network" varchar(32) DEFAULT NULL,
    "ip" varchar(16) DEFAULT NULL,
    "status" int DEFAULT NULL,
    "idc_id" char(32) NOT NULL,
    PRIMARY KEY ("uuid"),
    KEY "assets_iplist_0869e37a" ("idc_id"),
    CONSTRAINT "assets_iplist_idc_id_4118d0827945673f_fk_assets_idc_uuid" FOREIGN KEY ("idc_id") REFERENCES "assets_idc" ("uuid")
);

CREATE TABLE "assets_line" (
    "uuid" char(32) NOT NULL,
    "name" varchar(100) NOT NULL,
    "slug" varchar(100) DEFAULT NULL,
    "sort" int DEFAULT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "assets_project" (
    "uuid" char(32) NOT NULL,
    "service_name" varchar(60) DEFAULT NULL,
    "aliases_name" varchar(60) DEFAULT NULL,
    "description" TEXT,
    "project_doc" TEXT,
    "project_user_group" TEXT,
    "sort" int DEFAULT NULL,
    "line_id" char(32) DEFAULT NULL,
    "project_contact_id" int NOT NULL,
    "project_contact_backup_id" int NOT NULL,
    PRIMARY KEY ("uuid"),
    KEY "assets_project_line_id_3271c84b6deb8f1f_fk_assets_line_uuid" ("line_id"),
    KEY "assets_project_087d62fc" ("project_contact_id"),
    KEY "assets_project_227d338f" ("project_contact_backup_id"),
    CONSTRAINT "asset_project_contact_id_55a9a08f4b924c8c_fk_users_customuser_id" FOREIGN KEY ("project_contact_id") REFERENCES "users_customuser" ("id"),
    CONSTRAINT "assets_project_line_id_3271c84b6deb8f1f_fk_assets_line_uuid" FOREIGN KEY ("line_id") REFERENCES "assets_line" ("uuid"),
    CONSTRAINT "d46f719c8dcde971d1e0990f038ba85a" FOREIGN KEY ("project_contact_backup_id") REFERENCES "users_customuser" ("id")
);

CREATE TABLE "assets_projectuser" (
    "uuid" char(32) NOT NULL,
    "data_created" TIMESTAMP NOT NULL,
    "env" varchar(100) DEFAULT NULL,
    "project_id" char(32) NOT NULL,
    "user_id" int DEFAULT NULL,
    PRIMARY KEY ("uuid"),
    KEY "assets_projec_project_id_298fad6d989e9c44_fk_assets_project_uuid" ("project_id"),
    KEY "assets_projectuser_e8701ad4" ("user_id"),
    CONSTRAINT "assets_projec_project_id_298fad6d989e9c44_fk_assets_project_uuid" FOREIGN KEY ("project_id") REFERENCES "assets_project" ("uuid"),
    CONSTRAINT "assets_projectus_user_id_53f8464903c02003_fk_users_customuser_id" FOREIGN KEY ("user_id") REFERENCES "users_customuser" ("id")
);

CREATE TABLE "assets_service" (
    "uuid" char(32) NOT NULL,
    "name" varchar(30) NOT NULL,
    "port" int DEFAULT NULL,
    "remark" TEXT,
    PRIMARY KEY ("uuid"),
    UNIQUE KEY "name" ("name")
);

CREATE TABLE "assets_zabbixrecord" (
    "uuid" char(32) NOT NULL,
    "name" varchar(30) DEFAULT NULL,
    "type" varchar(30) DEFAULT NULL,
    "status" int DEFAULT NULL,
    "info" TEXT,
    "time" TIMESTAMP NOT NULL,
    "comment" TEXT,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "audit_ssh_audit" (
    "uuid" char(32) NOT NULL,
    "user_name" varchar(20) NOT NULL,
    "bash_shell" TEXT NOT NULL,
    "audit_data_time" TIMESTAMP NOT NULL,
    "server_ip" char(15) NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "auth_group" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(80) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name" ("name")
);

CREATE TABLE "auth_group_permissions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "group_id" int NOT NULL,
    "permission_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "group_id" ("group_id","permission_id"),
    KEY "auth_group_permissions_0e939a4f" ("group_id"),
    KEY "auth_group_permissions_8373b171" ("permission_id"),
    CONSTRAINT "auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id"),
    CONSTRAINT "auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id")
);

CREATE TABLE "auth_permission" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(50) NOT NULL,
    "content_type_id" int NOT NULL,
    "codename" varchar(100) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "content_type_id" ("content_type_id","codename"),
    KEY "auth_permission_417f1b1c" ("content_type_id"),
    CONSTRAINT "auth__content_type_id_508cf46651277a81_fk_django_content_type_id" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

CREATE TABLE "cmdb_auth_auth_group" (
    "uuid" char(32) NOT NULL,
    "group_name" varchar(100) NOT NULL,
    "enable" SMALLINT NOT NULL,
    "explanation" TEXT NOT NULL,
    "date_time" TIMESTAMP NOT NULL,
    PRIMARY KEY ("uuid"),
    UNIQUE KEY "group_name" ("group_name")
);

CREATE TABLE "cmdb_auth_auth_group_group_user" (
    "id" int NOT NULL AUTO_INCREMENT,
    "auth_group_id" char(32) NOT NULL,
    "customuser_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "auth_group_id" ("auth_group_id","customuser_id"),
    KEY "cmdb_auth_auth_group_group_user_af3f5f04" ("auth_group_id"),
    KEY "cmdb_auth_auth_group_group_user_721e74b0" ("customuser_id"),
    CONSTRAINT "cmdb_auth__customuser_id_33ec160b6f4a2e93_fk_users_customuser_id" FOREIGN KEY ("customuser_id") REFERENCES "users_customuser" ("id"),
    CONSTRAINT "cmdb_auth_group_id_19c331db012ad2d9_fk_cmdb_auth_auth_group_uuid" FOREIGN KEY ("auth_group_id") REFERENCES "cmdb_auth_auth_group" ("uuid")
);

CREATE TABLE "cmdb_auth_user_auth_cmdb" (
    "uuid" char(32) NOT NULL,
    "select_host" SMALLINT NOT NULL,
    "edit_host" SMALLINT NOT NULL,
    "update_host" SMALLINT NOT NULL,
    "add_host" SMALLINT NOT NULL,
    "bat_add_host" SMALLINT NOT NULL,
    "delete_host" SMALLINT NOT NULL,
    "add_line_auth" SMALLINT NOT NULL,
    "auth_project" SMALLINT NOT NULL,
    "auth_highstate" SMALLINT NOT NULL,
    "add_user" SMALLINT NOT NULL,
    "edit_user" SMALLINT NOT NULL,
    "edit_pass" SMALLINT NOT NULL,
    "delete_user" SMALLINT NOT NULL,
    "add_department" SMALLINT NOT NULL,
    "select_idc" SMALLINT NOT NULL,
    "add_idc" SMALLINT NOT NULL,
    "edit_idc" SMALLINT NOT NULL,
    "del_idc" SMALLINT NOT NULL,
    "setup_system" SMALLINT NOT NULL,
    "upload_system" SMALLINT NOT NULL,
    "salt_keys" SMALLINT NOT NULL,
    "project_auth" SMALLINT NOT NULL,
    "add_project" SMALLINT NOT NULL,
    "edit_project" SMALLINT NOT NULL,
    "delete_project" SMALLINT NOT NULL,
    "auth_log" SMALLINT NOT NULL,
    "cmdb_log" SMALLINT NOT NULL,
    "server_audit" SMALLINT NOT NULL,
    "group_name_id" char(32) NOT NULL,
    PRIMARY KEY ("uuid"),
    KEY "cmdb_auth_user_auth_cmdb_e074f38c" ("group_name_id"),
    CONSTRAINT "cmdb_group_name_id_40e2c7660ed38540_fk_cmdb_auth_auth_group_uuid" FOREIGN KEY ("group_name_id") REFERENCES "cmdb_auth_auth_group" ("uuid")
);

CREATE TABLE "django_admin_log" (
    "id" int NOT NULL AUTO_INCREMENT,
    "action_time" TIMESTAMP NOT NULL,
    "object_id" TEXT,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" TEXT NOT NULL,
    "content_type_id" int DEFAULT NULL,
    "user_id" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "django_admin_log_417f1b1c" ("content_type_id"),
    KEY "django_admin_log_e8701ad4" ("user_id"),
    CONSTRAINT "djang_content_type_id_697914295151027a_fk_django_content_type_id" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id"),
    CONSTRAINT "django_admin_log_user_id_52fdd58701c5f563_fk_users_customuser_id" FOREIGN KEY ("user_id") REFERENCES "users_customuser" ("id")
);

CREATE TABLE "django_content_type" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "django_content_type_app_label_45f3b1d93ec8c61c_uniq" ("app_label","model")
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

CREATE TABLE "django_migrations" (
    "id" int NOT NULL AUTO_INCREMENT,
    "app" varchar(255) NOT NULL,
    "name" varchar(255) NOT NULL,
    "applied" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL,
    "session_data" TEXT NOT NULL,
    "expire_date" TIMESTAMP NOT NULL,
    PRIMARY KEY ("session_key"),
    KEY "django_session_de54fa62" ("expire_date")
);

CREATE TABLE "gitCode" (
    "uuid" char(32) NOT NULL,
    "codePath" varchar(64) NOT NULL,
    "codeserver" varchar(64) NOT NULL,
    "codeFqdn" varchar(64) NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "incident" (
    "uuid" char(32) NOT NULL,
    "title" varchar(256) NOT NULL,
    "ip" char(15) DEFAULT NULL,
    "url" TEXT,
    "projectuser" varchar(32) NOT NULL,
    "closeuser" varchar(32) DEFAULT NULL,
    "source" int NOT NULL,
    "starttime" TIMESTAMP NOT NULL,
    "scantime" TIMESTAMP DEFAULT NULL,
    "stoptime" TIMESTAMP DEFAULT NULL,
    "mailcomment" TEXT NOT NULL,
    "status" int NOT NULL,
    "classical" SMALLINT NOT NULL,
    "grade" int DEFAULT NULL,
    "comment" TEXT NOT NULL,
    "project_principal" varchar(32) DEFAULT NULL,
    "incident_user" varchar(32) DEFAULT NULL,
    "createtime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "monitor_monitorhttp" (
    "uuid" char(32) NOT NULL,
    "title" varchar(120) NOT NULL,
    "url" TEXT NOT NULL,
    "monitor_type" SMALLINT NOT NULL,
    "monitor_ip" TEXT NOT NULL,
    "mail_status" SMALLINT NOT NULL,
    "mail" TEXT NOT NULL,
    "weixin_status" SMALLINT NOT NULL,
    "weixin" TEXT NOT NULL,
    "payload" TEXT,
    "status" SMALLINT NOT NULL,
    "result_code" SMALLINT NOT NULL,
    "createtime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "monitor_monitorhttplog" (
    "uuid" char(32) NOT NULL,
    "monitorId" varchar(120) NOT NULL,
    "monitor_title" varchar(120) NOT NULL,
    "content" TEXT,
    "code" int NOT NULL,
    "job_id" varchar(32) NOT NULL,
    "status" SMALLINT NOT NULL,
    "createtime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "monitor_monitormysql" (
    "uuid" char(32) NOT NULL,
    "name" varchar(120) NOT NULL,
    "monitor_ip" TEXT NOT NULL,
    "monitor_user" varchar(32) NOT NULL,
    "monitor_pass" varchar(128) NOT NULL,
    "monitor_port" int NOT NULL,
    "mail" TEXT NOT NULL,
    "weixin" TEXT NOT NULL,
    "slave" SMALLINT NOT NULL,
    "status" SMALLINT NOT NULL,
    "createtime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "project_swan" (
    "uuid" char(32) NOT NULL,
    "swan_name" varchar(100) NOT NULL,
    "code_name" varchar(100) NOT NULL,
    "choose" varchar(10) NOT NULL,
    "check_port_status" SMALLINT NOT NULL,
    "check_port" varchar(30) DEFAULT NULL,
    "bat_push" int NOT NULL,
    "tgt" TEXT,
    "argall_str" varchar(20) DEFAULT NULL,
    "tomcat_init" varchar(128) DEFAULT NULL,
    "cache" TEXT,
    "git_code_user" varchar(12) DEFAULT NULL,
    "code_path" varchar(128) DEFAULT NULL,
    "git_user" varchar(12) DEFAULT NULL,
    "git_pass" varchar(64) DEFAULT NULL,
    "shell" varchar(128) DEFAULT NULL,
    "shell_status" SMALLINT NOT NULL,
    "CheckUrl" varchar(200) DEFAULT NULL,
    "datetime" TIMESTAMP NOT NULL,
    "git_code_id" char(32) DEFAULT NULL,
    "project_name_id" char(32) DEFAULT NULL,
    PRIMARY KEY ("uuid"),
    KEY "project_swan_5890d2d4" ("git_code_id"),
    KEY "project_swan_6fa54945" ("project_name_id"),
    CONSTRAINT "project__project_name_id_7f50db0e92eba344_fk_assets_project_uuid" FOREIGN KEY ("project_name_id") REFERENCES "assets_project" ("uuid"),
    CONSTRAINT "project_swan_git_code_id_108333599249714f_fk_gitCode_uuid" FOREIGN KEY ("git_code_id") REFERENCES "gitCode" ("uuid")
);

CREATE TABLE "project_swan_node" (
    "id" int NOT NULL AUTO_INCREMENT,
    "project_swan_id" char(32) NOT NULL,
    "host_id" char(32) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "project_swan_id" ("project_swan_id","host_id"),
    KEY "project_swan_node_a3e2b54e" ("project_swan_id"),
    KEY "project_swan_node_8396f175" ("host_id"),
    CONSTRAINT "project_sw_project_swan_id_4814a3a6ff88c636_fk_project_swan_uuid" FOREIGN KEY ("project_swan_id") REFERENCES "project_swan" ("uuid"),
    CONSTRAINT "project_swan_node_host_id_633f2c729f485d77_fk_assets_host_uuid" FOREIGN KEY ("host_id") REFERENCES "assets_host" ("uuid")
);

CREATE TABLE "project_swan_push_user" (
    "id" int NOT NULL AUTO_INCREMENT,
    "project_swan_id" char(32) NOT NULL,
    "customuser_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "project_swan_id" ("project_swan_id","customuser_id"),
    KEY "project_swan_push_user_a3e2b54e" ("project_swan_id"),
    KEY "project_swan_push_user_721e74b0" ("customuser_id"),
    CONSTRAINT "project_sw_customuser_id_3822f6570ff53a30_fk_users_customuser_id" FOREIGN KEY ("customuser_id") REFERENCES "users_customuser" ("id"),
    CONSTRAINT "project_swa_project_swan_id_79291c907c649f9_fk_project_swan_uuid" FOREIGN KEY ("project_swan_id") REFERENCES "project_swan" ("uuid")
);

CREATE TABLE "push_system" (
    "uuid" char(32) NOT NULL,
    "project_name" int NOT NULL,
    "push_url" varchar(100) DEFAULT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "salt_ui_operationlog" (
    "uuid" char(32) NOT NULL,
    "content" TEXT NOT NULL,
    "mail_list" TEXT,
    "mail_title" varchar(100) NOT NULL,
    "date_created" TIMESTAMP NOT NULL,
    "mail_status" SMALLINT NOT NULL,
    "user_id" int NOT NULL,
    PRIMARY KEY ("uuid"),
    KEY "salt_ui_operationlog_e8701ad4" ("user_id"),
    CONSTRAINT "salt_ui_operatio_user_id_69db0895519a6008_fk_users_customuser_id" FOREIGN KEY ("user_id") REFERENCES "users_customuser" ("id")
);

CREATE TABLE "salt_ui_salt_api_log" (
    "uuid" char(32) NOT NULL,
    "user_name" varchar(20) NOT NULL,
    "minions" varchar(2048) NOT NULL,
    "jobs_id" varchar(40) DEFAULT NULL,
    "stalt_type" varchar(20) NOT NULL,
    "salt_len_node" int NOT NULL,
    "stalt_input" varchar(100) DEFAULT NULL,
    "api_return" TEXT NOT NULL,
    "log_time" TIMESTAMP NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "salt_ui_salt_conf" (
    "uuid" char(32) NOT NULL,
    "server_name" varchar(20) NOT NULL,
    "prod_name" varchar(20) NOT NULL,
    "file_name" varchar(20) NOT NULL,
    "server_code" TEXT NOT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "salt_ui_salt_mode_name" (
    "uuid" char(32) NOT NULL,
    "sls_name" varchar(20) NOT NULL,
    "sls_description" TEXT,
    "sls_conf" int DEFAULT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "salt_ui_setuplog" (
    "uuid" char(32) NOT NULL,
    "content" TEXT NOT NULL,
    "status" int NOT NULL,
    "approve_time" TIMESTAMP DEFAULT NULL,
    "reject_reason" TEXT,
    "date_created" TIMESTAMP NOT NULL,
    "run_time" TIMESTAMP DEFAULT NULL,
    "approve_user_id" int DEFAULT NULL,
    "business_id" char(32) NOT NULL,
    "user_id" int NOT NULL,
    PRIMARY KEY ("uuid"),
    KEY "salt_ui_setuplog_549dea8c" ("approve_user_id"),
    KEY "salt_ui_setuplog_2f4e4ac4" ("business_id"),
    KEY "salt_ui_setuplog_e8701ad4" ("user_id"),
    CONSTRAINT "salt_ui__approve_user_id_6c1570f72dd3c666_fk_users_customuser_id" FOREIGN KEY ("approve_user_id") REFERENCES "users_customuser" ("id"),
    CONSTRAINT "salt_ui_setu_business_id_3f48417490749bc5_fk_assets_project_uuid" FOREIGN KEY ("business_id") REFERENCES "assets_project" ("uuid"),
    CONSTRAINT "salt_ui_setuplog_user_id_23d803f7d2e28ce0_fk_users_customuser_id" FOREIGN KEY ("user_id") REFERENCES "users_customuser" ("id")
);

CREATE TABLE "swan_apply" (
    "uuid" char(32) NOT NULL,
    "applyer" varchar(32) DEFAULT NULL,
    "project_name" varchar(20) DEFAULT NULL,
    "module_name" varchar(200) DEFAULT NULL,
    "module_type" int unsigned DEFAULT NULL,
    "module_tgt" varchar(50) DEFAULT NULL,
    "qa" varchar(20) DEFAULT NULL,
    "op" varchar(20) DEFAULT NULL,
    "comment" TEXT,
    "status" int unsigned DEFAULT NULL,
    "date_added" TIMESTAMP,
    "date_one" TIMESTAMP DEFAULT NULL,
    "date_ended" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "swan_swanlog" (
    "uuid" char(32) NOT NULL,
    "username" varchar(32) DEFAULT NULL,
    "userID" varchar(128) DEFAULT NULL,
    "project_name" varchar(20) DEFAULT NULL,
    "project_uuid" varchar(64) DEFAULT NULL,
    "module_name" varchar(200) DEFAULT NULL,
    "module_args" varchar(32) DEFAULT NULL,
    "swan_datetime" TIMESTAMP,
    "status" SMALLINT NOT NULL,
    "message" TEXT,
    "swan_name" varchar(64),
    "update_log" TEXT,
    PRIMARY KEY ("uuid")
);

CREATE TABLE "users_customuser" (
    "id" int NOT NULL AUTO_INCREMENT,
    "password" varchar(128) NOT NULL,
    "last_login" TIMESTAMP NOT NULL,
    "is_superuser" SMALLINT NOT NULL,
    "email" varchar(254) NOT NULL,
    "username" varchar(30) NOT NULL,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "mobile" varchar(30) NOT NULL,
    "session_key" varchar(60) DEFAULT NULL,
    "user_key" TEXT,
    "menu_status" SMALLINT NOT NULL,
    "user_active" SMALLINT NOT NULL,
    "uuid" varchar(64) NOT NULL,
    "is_staff" SMALLINT NOT NULL,
    "is_active" SMALLINT NOT NULL,
    "date_joined" TIMESTAMP NOT NULL,
    "department_id" int,
    PRIMARY KEY ("id"),
    UNIQUE KEY "email" ("email"),
    UNIQUE KEY "username" ("username"),
    UNIQUE KEY "uuid" ("uuid"),
    KEY "users_customuser_bf691be4" ("department_id"),
    CONSTRAINT "users_department_id_7ef5db15268629e1_fk_users_department_mode_id" FOREIGN KEY ("department_id") REFERENCES "users_department_mode" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "users_customuser_groups" (
    "id" int NOT NULL AUTO_INCREMENT,
    "customuser_id" int NOT NULL,
    "group_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "customuser_id" ("customuser_id","group_id"),
    KEY "users_customuser_groups_721e74b0" ("customuser_id"),
    KEY "users_customuser_groups_0e939a4f" ("group_id"),
    CONSTRAINT "users_cust_customuser_id_3ff7151cd75e2907_fk_users_customuser_id" FOREIGN KEY ("customuser_id") REFERENCES "users_customuser" ("id"),
    CONSTRAINT "users_customuser_grou_group_id_7bd979d963ceefdb_fk_auth_group_id" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id")
);

CREATE TABLE "users_customuser_user_permissions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "customuser_id" int NOT NULL,
    "permission_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "customuser_id" ("customuser_id","permission_id"),
    KEY "users_customuser_user_permissions_721e74b0" ("customuser_id"),
    KEY "users_customuser_user_permissions_8373b171" ("permission_id"),
    CONSTRAINT "users_custo_permission_id_26c8d8c42be54c0a_fk_auth_permission_id" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id"),
    CONSTRAINT "users_custom_customuser_id_cd602244af3539_fk_users_customuser_id" FOREIGN KEY ("customuser_id") REFERENCES "users_customuser" ("id")
);

CREATE TABLE "users_department_mode" (
    "id" int NOT NULL AUTO_INCREMENT,
    "department_name" varchar(64) DEFAULT NULL,
    "description" TEXT,
    "desc_gid" int DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "users_departmentgroup" (
    "id" int NOT NULL AUTO_INCREMENT,
    "department_groups_name" varchar(64) DEFAULT NULL,
    "description" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE "users_server_auth" (
    "id" int NOT NULL AUTO_INCREMENT,
    "server_ip" char(15) DEFAULT NULL,
    "user_name" varchar(20) DEFAULT NULL,
    "first_name" varchar(20) DEFAULT NULL,
    "auth_weights" SMALLINT NOT NULL,
    "datetime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id")
);
