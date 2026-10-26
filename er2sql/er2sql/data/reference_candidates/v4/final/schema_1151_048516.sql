-- Source: https://github.com/wangminli/jeesite/blob/3d967fb83583fd6f05f19091d01fbc74435c18ee/db/jeesite_mysql.sql?raw=true
-- Tables detected: 53 | FK constraints: 21
CREATE TABLE "ACT_GE_BYTEARRAY" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "REV_" int DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "DEPLOYMENT_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "BYTES_" BYTEA,
    "GENERATED_" SMALLINT DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_GE_PROPERTY" (
    "NAME_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "VALUE_" varchar(300) COLLATE utf8_bin DEFAULT NULL,
    "REV_" int DEFAULT NULL,
    PRIMARY KEY ("NAME_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_HI_ATTACHMENT" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "REV_" int DEFAULT NULL,
    "USER_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "DESCRIPTION_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "URL_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "CONTENT_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_HI_COMMENT" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TIME_" TIMESTAMP NOT NULL,
    "USER_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "ACTION_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "MESSAGE_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "FULL_MSG_" BYTEA,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_HI_TASKINST" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "PROC_DEF_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "TASK_DEF_KEY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "EXECUTION_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "PARENT_TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "DESCRIPTION_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "OWNER_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "ASSIGNEE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "START_TIME_" TIMESTAMP NOT NULL,
    "CLAIM_TIME_" TIMESTAMP DEFAULT NULL,
    "END_TIME_" TIMESTAMP DEFAULT NULL,
    "DURATION_" bigint DEFAULT NULL,
    "DELETE_REASON_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "PRIORITY_" int DEFAULT NULL,
    "DUE_DATE_" TIMESTAMP DEFAULT NULL,
    "FORM_KEY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "CATEGORY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_ID_GROUP" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "REV_" int DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_ID_INFO" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "REV_" int DEFAULT NULL,
    "USER_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "TYPE_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "KEY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "VALUE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "PASSWORD_" BYTEA,
    "PARENT_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_ID_MEMBERSHIP" (
    "USER_ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "GROUP_ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    PRIMARY KEY ("USER_ID_","GROUP_ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_ID_USER" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "REV_" int DEFAULT NULL,
    "FIRST_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "LAST_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "EMAIL_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "PWD_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "PICTURE_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RE_DEPLOYMENT" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "CATEGORY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    "DEPLOY_TIME_" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RE_MODEL" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "REV_" int DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "KEY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "CATEGORY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "CREATE_TIME_" timestamp NULL DEFAULT NULL,
    "LAST_UPDATE_TIME_" timestamp NULL DEFAULT NULL,
    "VERSION_" int DEFAULT NULL,
    "META_INFO_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "DEPLOYMENT_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "EDITOR_SOURCE_VALUE_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "EDITOR_SOURCE_EXTRA_VALUE_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RE_PROCDEF" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "REV_" int DEFAULT NULL,
    "CATEGORY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "KEY_" varchar(255) COLLATE utf8_bin NOT NULL,
    "VERSION_" int NOT NULL,
    "DEPLOYMENT_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "RESOURCE_NAME_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "DGRM_RESOURCE_NAME_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "DESCRIPTION_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "HAS_START_FORM_KEY_" SMALLINT DEFAULT NULL,
    "SUSPENSION_STATE_" int DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_"),
    CONSTRAINT "ACT_UNIQ_PROCDEF" UNIQUE ("KEY_","VERSION_","TENANT_ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RU_EVENT_SUBSCR" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "REV_" int DEFAULT NULL,
    "EVENT_TYPE_" varchar(255) COLLATE utf8_bin NOT NULL,
    "EVENT_NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "EXECUTION_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "ACTIVITY_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "CONFIGURATION_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "CREATED_" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "PROC_DEF_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RU_EXECUTION" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "REV_" int DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "BUSINESS_KEY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "PARENT_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_DEF_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "SUPER_EXEC_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "ACT_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "IS_ACTIVE_" SMALLINT DEFAULT NULL,
    "IS_CONCURRENT_" SMALLINT DEFAULT NULL,
    "IS_SCOPE_" SMALLINT DEFAULT NULL,
    "IS_EVENT_SCOPE_" SMALLINT DEFAULT NULL,
    "SUSPENSION_STATE_" int DEFAULT NULL,
    "CACHED_ENT_STATE_" int DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RU_IDENTITYLINK" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "REV_" int DEFAULT NULL,
    "GROUP_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "USER_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_DEF_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RU_JOB" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "REV_" int DEFAULT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin NOT NULL,
    "LOCK_EXP_TIME_" timestamp NULL DEFAULT NULL,
    "LOCK_OWNER_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "EXCLUSIVE_" SMALLINT DEFAULT NULL,
    "EXECUTION_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROCESS_INSTANCE_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_DEF_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "RETRIES_" int DEFAULT NULL,
    "EXCEPTION_STACK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "EXCEPTION_MSG_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "DUEDATE_" timestamp NULL DEFAULT NULL,
    "REPEAT_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "HANDLER_TYPE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "HANDLER_CFG_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RU_TASK" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "REV_" int DEFAULT NULL,
    "EXECUTION_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_DEF_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "PARENT_TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "DESCRIPTION_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "TASK_DEF_KEY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "OWNER_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "ASSIGNEE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "DELEGATION_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PRIORITY_" int DEFAULT NULL,
    "CREATE_TIME_" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    "DUE_DATE_" TIMESTAMP DEFAULT NULL,
    "CATEGORY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "SUSPENSION_STATE_" int DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "ACT_RU_VARIABLE" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "REV_" int DEFAULT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin NOT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin NOT NULL,
    "EXECUTION_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "BYTEARRAY_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "DOUBLE_" DOUBLE PRECISION DEFAULT NULL,
    "LONG_" bigint DEFAULT NULL,
    "TEXT_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "TEXT2_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "act_hi_actinst" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "PROC_DEF_ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "EXECUTION_ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "ACT_ID_" varchar(255) COLLATE utf8_bin NOT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "CALL_PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "ACT_NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "ACT_TYPE_" varchar(255) COLLATE utf8_bin NOT NULL,
    "ASSIGNEE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "START_TIME_" TIMESTAMP NOT NULL,
    "END_TIME_" TIMESTAMP DEFAULT NULL,
    "DURATION_" bigint DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "act_hi_detail" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin NOT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "EXECUTION_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "ACT_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin NOT NULL,
    "VAR_TYPE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "REV_" int DEFAULT NULL,
    "TIME_" TIMESTAMP NOT NULL,
    "BYTEARRAY_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "DOUBLE_" DOUBLE PRECISION DEFAULT NULL,
    "LONG_" bigint DEFAULT NULL,
    "TEXT_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "TEXT2_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "act_hi_identitylink" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "GROUP_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "USER_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "act_hi_procinst" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "BUSINESS_KEY_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "PROC_DEF_ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "START_TIME_" TIMESTAMP NOT NULL,
    "END_TIME_" TIMESTAMP DEFAULT NULL,
    "DURATION_" bigint DEFAULT NULL,
    "START_USER_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "START_ACT_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "END_ACT_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "SUPER_PROCESS_INSTANCE_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "DELETE_REASON_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "TENANT_ID_" varchar(255) COLLATE utf8_bin DEFAULT '',
    PRIMARY KEY ("ID_"),
    CONSTRAINT "PROC_INST_ID_" UNIQUE ("PROC_INST_ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "act_hi_varinst" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "EXECUTION_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin NOT NULL,
    "VAR_TYPE_" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "REV_" int DEFAULT NULL,
    "BYTEARRAY_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "DOUBLE_" DOUBLE PRECISION DEFAULT NULL,
    "LONG_" bigint DEFAULT NULL,
    "TEXT_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "TEXT2_" varchar(4000) COLLATE utf8_bin DEFAULT NULL,
    "CREATE_TIME_" TIMESTAMP DEFAULT NULL,
    "LAST_UPDATED_TIME_" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "cms_article" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "category_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "title" varchar(255) COLLATE utf8_bin NOT NULL,
    "link" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "color" varchar(50) COLLATE utf8_bin DEFAULT NULL,
    "image" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "keywords" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "description" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "weight" int DEFAULT '0',
    "weight_date" TIMESTAMP DEFAULT NULL,
    "hits" int DEFAULT '0',
    "posid" varchar(10) COLLATE utf8_bin DEFAULT NULL,
    "custom_content_view" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "view_config" text COLLATE utf8_bin,
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "update_date" TIMESTAMP DEFAULT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "cms_article_data" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "content" text COLLATE utf8_bin,
    "copyfrom" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "relation" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "allow_comment" char(1) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "cms_category" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL,
    "site_id" varchar(64) COLLATE utf8_bin DEFAULT '1',
    "office_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "module" varchar(20) COLLATE utf8_bin DEFAULT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "image" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "href" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "target" varchar(20) COLLATE utf8_bin DEFAULT NULL,
    "description" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "keywords" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "sort" int DEFAULT '30',
    "in_menu" char(1) COLLATE utf8_bin DEFAULT '1',
    "in_list" char(1) COLLATE utf8_bin DEFAULT '1',
    "show_modes" char(1) COLLATE utf8_bin DEFAULT '0',
    "allow_comment" char(1) COLLATE utf8_bin DEFAULT NULL,
    "is_audit" char(1) COLLATE utf8_bin DEFAULT NULL,
    "custom_list_view" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "custom_content_view" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "view_config" text COLLATE utf8_bin,
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "update_date" TIMESTAMP DEFAULT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "cms_comment" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "category_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "content_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "title" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "content" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "name" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "ip" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "audit_user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "audit_date" TIMESTAMP DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "cms_guestbook" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "type" char(1) COLLATE utf8_bin NOT NULL,
    "content" varchar(255) COLLATE utf8_bin NOT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "email" varchar(100) COLLATE utf8_bin NOT NULL,
    "phone" varchar(100) COLLATE utf8_bin NOT NULL,
    "workunit" varchar(100) COLLATE utf8_bin NOT NULL,
    "ip" varchar(100) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "re_user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "re_date" TIMESTAMP DEFAULT NULL,
    "re_content" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "cms_link" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "category_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "title" varchar(255) COLLATE utf8_bin NOT NULL,
    "color" varchar(50) COLLATE utf8_bin DEFAULT NULL,
    "image" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "href" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "weight" int DEFAULT '0',
    "weight_date" TIMESTAMP DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "update_date" TIMESTAMP DEFAULT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "cms_site" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "title" varchar(100) COLLATE utf8_bin NOT NULL,
    "logo" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "domain" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "description" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "keywords" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "theme" varchar(255) COLLATE utf8_bin DEFAULT 'default',
    "copyright" text COLLATE utf8_bin,
    "custom_index_view" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "update_date" TIMESTAMP DEFAULT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "gen_scheme" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "name" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "category" varchar(2000) COLLATE utf8_bin DEFAULT NULL,
    "package_name" varchar(500) COLLATE utf8_bin DEFAULT NULL,
    "module_name" varchar(30) COLLATE utf8_bin DEFAULT NULL,
    "sub_module_name" varchar(30) COLLATE utf8_bin DEFAULT NULL,
    "function_name" varchar(500) COLLATE utf8_bin DEFAULT NULL,
    "function_name_simple" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "function_author" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "gen_table_id" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "update_date" TIMESTAMP DEFAULT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "gen_table" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "name" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "comments" varchar(500) COLLATE utf8_bin DEFAULT NULL,
    "class_name" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "parent_table" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "parent_table_fk" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "update_date" TIMESTAMP DEFAULT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "gen_table_column" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "gen_table_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "name" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "comments" varchar(500) COLLATE utf8_bin DEFAULT NULL,
    "jdbc_type" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "java_type" varchar(500) COLLATE utf8_bin DEFAULT NULL,
    "java_field" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "is_pk" char(1) COLLATE utf8_bin DEFAULT NULL,
    "is_null" char(1) COLLATE utf8_bin DEFAULT NULL,
    "is_insert" char(1) COLLATE utf8_bin DEFAULT NULL,
    "is_edit" char(1) COLLATE utf8_bin DEFAULT NULL,
    "is_list" char(1) COLLATE utf8_bin DEFAULT NULL,
    "is_query" char(1) COLLATE utf8_bin DEFAULT NULL,
    "query_type" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "show_type" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "dict_type" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "settings" varchar(2000) COLLATE utf8_bin DEFAULT NULL,
    "sort" decimal(10,0) DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "update_date" TIMESTAMP DEFAULT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "gen_template" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "name" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "category" varchar(2000) COLLATE utf8_bin DEFAULT NULL,
    "file_path" varchar(500) COLLATE utf8_bin DEFAULT NULL,
    "file_name" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "content" text COLLATE utf8_bin,
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "update_date" TIMESTAMP DEFAULT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "oa_leave" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "process_instance_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "start_time" TIMESTAMP DEFAULT NULL,
    "end_time" TIMESTAMP DEFAULT NULL,
    "leave_type" varchar(20) COLLATE utf8_bin DEFAULT NULL,
    "reason" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "apply_time" TIMESTAMP DEFAULT NULL,
    "reality_start_time" TIMESTAMP DEFAULT NULL,
    "reality_end_time" TIMESTAMP DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "oa_notify" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "type" char(1) COLLATE utf8_bin DEFAULT NULL,
    "title" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "content" varchar(2000) COLLATE utf8_bin DEFAULT NULL,
    "files" varchar(2000) COLLATE utf8_bin DEFAULT NULL,
    "status" char(1) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "oa_notify_record" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "oa_notify_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "read_flag" char(1) COLLATE utf8_bin DEFAULT '0',
    "read_date" date DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "oa_test_audit" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "PROC_INS_ID" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "USER_ID" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "OFFICE_ID" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "POST" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "AGE" char(1) COLLATE utf8_bin DEFAULT NULL,
    "EDU" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "CONTENT" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "OLDA" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "OLDB" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "OLDC" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "NEWA" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "NEWB" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "NEWC" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "ADD_NUM" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "EXE_DATE" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "HR_TEXT" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "LEAD_TEXT" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "MAIN_LEAD_TEXT" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_area" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "sort" decimal(10,0) NOT NULL,
    "code" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "type" char(1) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_dict" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "value" varchar(100) COLLATE utf8_bin NOT NULL,
    "label" varchar(100) COLLATE utf8_bin NOT NULL,
    "type" varchar(100) COLLATE utf8_bin NOT NULL,
    "description" varchar(100) COLLATE utf8_bin NOT NULL,
    "sort" decimal(10,0) NOT NULL,
    "parent_id" varchar(64) COLLATE utf8_bin DEFAULT '0',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_log" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "type" char(1) COLLATE utf8_bin DEFAULT '1',
    "title" varchar(255) COLLATE utf8_bin DEFAULT '',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_date" TIMESTAMP DEFAULT NULL,
    "remote_addr" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "user_agent" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "request_uri" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "method" varchar(5) COLLATE utf8_bin DEFAULT NULL,
    "params" text COLLATE utf8_bin,
    "exception" text COLLATE utf8_bin,
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_mdict" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "sort" decimal(10,0) NOT NULL,
    "description" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_menu" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "sort" decimal(10,0) NOT NULL,
    "href" varchar(2000) COLLATE utf8_bin DEFAULT NULL,
    "target" varchar(20) COLLATE utf8_bin DEFAULT NULL,
    "icon" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "is_show" char(1) COLLATE utf8_bin NOT NULL,
    "permission" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_office" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "sort" decimal(10,0) NOT NULL,
    "area_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "code" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "type" char(1) COLLATE utf8_bin NOT NULL,
    "grade" char(1) COLLATE utf8_bin NOT NULL,
    "address" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "zip_code" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "master" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "phone" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "fax" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "email" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "USEABLE" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PRIMARY_PERSON" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "DEPUTY_PERSON" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_role" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "office_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "enname" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "role_type" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "data_scope" char(1) COLLATE utf8_bin DEFAULT NULL,
    "is_sys" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "useable" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_role_menu" (
    "role_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "menu_id" varchar(64) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY ("role_id","menu_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_role_office" (
    "role_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "office_id" varchar(64) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY ("role_id","office_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_user" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "company_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "office_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "login_name" varchar(100) COLLATE utf8_bin NOT NULL,
    "password" varchar(100) COLLATE utf8_bin NOT NULL,
    "no" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "email" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "phone" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "mobile" varchar(200) COLLATE utf8_bin DEFAULT NULL,
    "user_type" char(1) COLLATE utf8_bin DEFAULT NULL,
    "photo" varchar(1000) COLLATE utf8_bin DEFAULT NULL,
    "login_ip" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "login_date" TIMESTAMP DEFAULT NULL,
    "login_flag" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "sys_user_role" (
    "user_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "role_id" varchar(64) COLLATE utf8_bin NOT NULL,
    PRIMARY KEY ("user_id","role_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "test_data" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "office_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "area_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "name" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "sex" char(1) COLLATE utf8_bin DEFAULT NULL,
    "in_date" date DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "test_data_child" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "test_data_main_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "name" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "test_data_main" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "office_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "area_id" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "name" varchar(100) COLLATE utf8_bin DEFAULT NULL,
    "sex" char(1) COLLATE utf8_bin DEFAULT NULL,
    "in_date" date DEFAULT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE "test_tree" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL,
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL,
    "name" varchar(100) COLLATE utf8_bin NOT NULL,
    "sort" decimal(10,0) NOT NULL,
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "create_date" TIMESTAMP NOT NULL,
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL,
    "update_date" TIMESTAMP NOT NULL,
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;
ALTER TABLE "ACT_GE_BYTEARRAY" ADD CONSTRAINT "ACT_FK_BYTEARR_DEPL" FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "ACT_RE_DEPLOYMENT" ("ID_");
ALTER TABLE "ACT_ID_MEMBERSHIP" ADD CONSTRAINT "ACT_FK_MEMB_USER" FOREIGN KEY ("USER_ID_") REFERENCES "ACT_ID_USER" ("ID_");
ALTER TABLE "ACT_ID_MEMBERSHIP" ADD CONSTRAINT "ACT_FK_MEMB_GROUP" FOREIGN KEY ("GROUP_ID_") REFERENCES "ACT_ID_GROUP" ("ID_");
ALTER TABLE "ACT_RE_MODEL" ADD CONSTRAINT "ACT_FK_MODEL_DEPLOYMENT" FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "ACT_RE_DEPLOYMENT" ("ID_");
ALTER TABLE "ACT_RE_MODEL" ADD CONSTRAINT "ACT_FK_MODEL_SOURCE" FOREIGN KEY ("EDITOR_SOURCE_VALUE_ID_") REFERENCES "ACT_GE_BYTEARRAY" ("ID_");
ALTER TABLE "ACT_RE_MODEL" ADD CONSTRAINT "ACT_FK_MODEL_SOURCE_EXTRA" FOREIGN KEY ("EDITOR_SOURCE_EXTRA_VALUE_ID_") REFERENCES "ACT_GE_BYTEARRAY" ("ID_");
ALTER TABLE "ACT_RU_EVENT_SUBSCR" ADD CONSTRAINT "ACT_FK_EVENT_EXEC" FOREIGN KEY ("EXECUTION_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "ACT_RU_EXECUTION" ADD CONSTRAINT "ACT_FK_EXE_PROCDEF" FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "ACT_RE_PROCDEF" ("ID_");
ALTER TABLE "ACT_RU_EXECUTION" ADD CONSTRAINT "ACT_FK_EXE_PARENT" FOREIGN KEY ("PARENT_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "ACT_RU_EXECUTION" ADD CONSTRAINT "ACT_FK_EXE_PROCINST" FOREIGN KEY ("PROC_INST_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "ACT_RU_EXECUTION" ADD CONSTRAINT "ACT_FK_EXE_SUPER" FOREIGN KEY ("SUPER_EXEC_") REFERENCES "ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "ACT_RU_IDENTITYLINK" ADD CONSTRAINT "ACT_FK_IDL_PROCINST" FOREIGN KEY ("PROC_INST_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "ACT_RU_IDENTITYLINK" ADD CONSTRAINT "ACT_FK_ATHRZ_PROCEDEF" FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "ACT_RE_PROCDEF" ("ID_");
ALTER TABLE "ACT_RU_IDENTITYLINK" ADD CONSTRAINT "ACT_FK_TSKASS_TASK" FOREIGN KEY ("TASK_ID_") REFERENCES "ACT_RU_TASK" ("ID_");
ALTER TABLE "ACT_RU_JOB" ADD CONSTRAINT "ACT_FK_JOB_EXCEPTION" FOREIGN KEY ("EXCEPTION_STACK_ID_") REFERENCES "ACT_GE_BYTEARRAY" ("ID_");
ALTER TABLE "ACT_RU_TASK" ADD CONSTRAINT "ACT_FK_TASK_PROCDEF" FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "ACT_RE_PROCDEF" ("ID_");
ALTER TABLE "ACT_RU_TASK" ADD CONSTRAINT "ACT_FK_TASK_EXE" FOREIGN KEY ("EXECUTION_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "ACT_RU_TASK" ADD CONSTRAINT "ACT_FK_TASK_PROCINST" FOREIGN KEY ("PROC_INST_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "ACT_RU_VARIABLE" ADD CONSTRAINT "ACT_FK_VAR_BYTEARRAY" FOREIGN KEY ("BYTEARRAY_ID_") REFERENCES "ACT_GE_BYTEARRAY" ("ID_");
ALTER TABLE "ACT_RU_VARIABLE" ADD CONSTRAINT "ACT_FK_VAR_EXE" FOREIGN KEY ("EXECUTION_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_");
ALTER TABLE "ACT_RU_VARIABLE" ADD CONSTRAINT "ACT_FK_VAR_PROCINST" FOREIGN KEY ("PROC_INST_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_");
CREATE INDEX ON "ACT_GE_BYTEARRAY" ("DEPLOYMENT_ID_");
CREATE INDEX ON "ACT_ID_MEMBERSHIP" ("GROUP_ID_");
CREATE INDEX ON "ACT_RE_MODEL" ("EDITOR_SOURCE_VALUE_ID_");
CREATE INDEX ON "ACT_RE_MODEL" ("EDITOR_SOURCE_EXTRA_VALUE_ID_");
CREATE INDEX ON "ACT_RE_MODEL" ("DEPLOYMENT_ID_");
CREATE INDEX ON "ACT_RU_EVENT_SUBSCR" ("CONFIGURATION_");
CREATE INDEX ON "ACT_RU_EVENT_SUBSCR" ("EXECUTION_ID_");
CREATE INDEX ON "ACT_RU_EXECUTION" ("BUSINESS_KEY_");
CREATE INDEX ON "ACT_RU_EXECUTION" ("PROC_INST_ID_");
CREATE INDEX ON "ACT_RU_EXECUTION" ("PARENT_ID_");
CREATE INDEX ON "ACT_RU_EXECUTION" ("SUPER_EXEC_");
CREATE INDEX ON "ACT_RU_EXECUTION" ("PROC_DEF_ID_");
CREATE INDEX ON "ACT_RU_IDENTITYLINK" ("USER_ID_");
CREATE INDEX ON "ACT_RU_IDENTITYLINK" ("GROUP_ID_");
CREATE INDEX ON "ACT_RU_IDENTITYLINK" ("PROC_DEF_ID_");
CREATE INDEX ON "ACT_RU_IDENTITYLINK" ("TASK_ID_");
CREATE INDEX ON "ACT_RU_IDENTITYLINK" ("PROC_INST_ID_");
CREATE INDEX ON "ACT_RU_JOB" ("EXCEPTION_STACK_ID_");
CREATE INDEX ON "ACT_RU_TASK" ("CREATE_TIME_");
CREATE INDEX ON "ACT_RU_TASK" ("EXECUTION_ID_");
CREATE INDEX ON "ACT_RU_TASK" ("PROC_INST_ID_");
CREATE INDEX ON "ACT_RU_TASK" ("PROC_DEF_ID_");
CREATE INDEX ON "ACT_RU_VARIABLE" ("TASK_ID_");
CREATE INDEX ON "ACT_RU_VARIABLE" ("EXECUTION_ID_");
CREATE INDEX ON "ACT_RU_VARIABLE" ("PROC_INST_ID_");
CREATE INDEX ON "ACT_RU_VARIABLE" ("BYTEARRAY_ID_");
CREATE INDEX ON "act_hi_actinst" ("START_TIME_");
CREATE INDEX ON "act_hi_actinst" ("END_TIME_");
CREATE INDEX ON "act_hi_actinst" ("PROC_INST_ID_","ACT_ID_");
CREATE INDEX ON "act_hi_actinst" ("EXECUTION_ID_","ACT_ID_");
CREATE INDEX ON "act_hi_detail" ("PROC_INST_ID_");
CREATE INDEX ON "act_hi_detail" ("ACT_INST_ID_");
CREATE INDEX ON "act_hi_detail" ("TIME_");
CREATE INDEX ON "act_hi_detail" ("NAME_");
CREATE INDEX ON "act_hi_detail" ("TASK_ID_");
CREATE INDEX ON "act_hi_identitylink" ("USER_ID_");
CREATE INDEX ON "act_hi_identitylink" ("TASK_ID_");
CREATE INDEX ON "act_hi_identitylink" ("PROC_INST_ID_");
CREATE INDEX ON "act_hi_procinst" ("END_TIME_");
CREATE INDEX ON "act_hi_procinst" ("BUSINESS_KEY_");
CREATE INDEX ON "act_hi_varinst" ("PROC_INST_ID_");
CREATE INDEX ON "act_hi_varinst" ("NAME_","VAR_TYPE_");
CREATE INDEX ON "cms_article" ("create_by");
CREATE INDEX ON "cms_article" ("title");
CREATE INDEX ON "cms_article" ("keywords");
CREATE INDEX ON "cms_article" ("del_flag");
CREATE INDEX ON "cms_article" ("weight");
CREATE INDEX ON "cms_article" ("update_date");
CREATE INDEX ON "cms_article" ("category_id");
CREATE INDEX ON "cms_category" ("parent_id");
CREATE INDEX ON "cms_category" ("module");
CREATE INDEX ON "cms_category" ("name");
CREATE INDEX ON "cms_category" ("sort");
CREATE INDEX ON "cms_category" ("del_flag");
CREATE INDEX ON "cms_category" ("office_id");
CREATE INDEX ON "cms_category" ("site_id");
CREATE INDEX ON "cms_comment" ("category_id");
CREATE INDEX ON "cms_comment" ("content_id");
CREATE INDEX ON "cms_comment" ("del_flag");
CREATE INDEX ON "cms_guestbook" ("del_flag");
CREATE INDEX ON "cms_link" ("category_id");
CREATE INDEX ON "cms_link" ("title");
CREATE INDEX ON "cms_link" ("del_flag");
CREATE INDEX ON "cms_link" ("weight");
CREATE INDEX ON "cms_link" ("create_by");
CREATE INDEX ON "cms_link" ("update_date");
CREATE INDEX ON "cms_site" ("del_flag");
CREATE INDEX ON "gen_scheme" ("del_flag");
CREATE INDEX ON "gen_table" ("name");
CREATE INDEX ON "gen_table" ("del_flag");
CREATE INDEX ON "gen_table_column" ("gen_table_id");
CREATE INDEX ON "gen_table_column" ("name");
CREATE INDEX ON "gen_table_column" ("sort");
CREATE INDEX ON "gen_table_column" ("del_flag");
CREATE INDEX ON "gen_template" ("del_flag");
CREATE INDEX ON "oa_leave" ("create_by");
CREATE INDEX ON "oa_leave" ("process_instance_id");
CREATE INDEX ON "oa_leave" ("del_flag");
CREATE INDEX ON "oa_notify" ("del_flag");
CREATE INDEX ON "oa_notify_record" ("oa_notify_id");
CREATE INDEX ON "oa_notify_record" ("user_id");
CREATE INDEX ON "oa_notify_record" ("read_flag");
CREATE INDEX ON "oa_test_audit" ("del_flag");
CREATE INDEX ON "sys_area" ("parent_id");
CREATE INDEX ON "sys_area" ("del_flag");
CREATE INDEX ON "sys_dict" ("value");
CREATE INDEX ON "sys_dict" ("label");
CREATE INDEX ON "sys_dict" ("del_flag");
CREATE INDEX ON "sys_log" ("create_by");
CREATE INDEX ON "sys_log" ("request_uri");
CREATE INDEX ON "sys_log" ("type");
CREATE INDEX ON "sys_log" ("create_date");
CREATE INDEX ON "sys_mdict" ("parent_id");
CREATE INDEX ON "sys_mdict" ("del_flag");
CREATE INDEX ON "sys_menu" ("parent_id");
CREATE INDEX ON "sys_menu" ("del_flag");
CREATE INDEX ON "sys_office" ("parent_id");
CREATE INDEX ON "sys_office" ("del_flag");
CREATE INDEX ON "sys_office" ("type");
CREATE INDEX ON "sys_role" ("del_flag");
CREATE INDEX ON "sys_role" ("enname");
CREATE INDEX ON "sys_user" ("office_id");
CREATE INDEX ON "sys_user" ("login_name");
CREATE INDEX ON "sys_user" ("company_id");
CREATE INDEX ON "sys_user" ("update_date");
CREATE INDEX ON "sys_user" ("del_flag");
CREATE INDEX ON "test_data" ("del_flag");
CREATE INDEX ON "test_data_child" ("del_flag");
CREATE INDEX ON "test_data_main" ("del_flag");
CREATE INDEX ON "test_tree" ("del_flag");
CREATE INDEX ON "test_tree" ("parent_id");
COMMENT ON COLUMN "cms_article"."id" IS '编号';
COMMENT ON COLUMN "cms_article"."category_id" IS '栏目编号';
COMMENT ON COLUMN "cms_article"."title" IS '标题';
COMMENT ON COLUMN "cms_article"."link" IS '文章链接';
COMMENT ON COLUMN "cms_article"."color" IS '标题颜色';
COMMENT ON COLUMN "cms_article"."image" IS '文章图片';
COMMENT ON COLUMN "cms_article"."keywords" IS '关键字';
COMMENT ON COLUMN "cms_article"."description" IS '描述、摘要';
COMMENT ON COLUMN "cms_article"."weight" IS '权重，越大越靠前';
COMMENT ON COLUMN "cms_article"."weight_date" IS '权重期限';
COMMENT ON COLUMN "cms_article"."hits" IS '点击数';
COMMENT ON COLUMN "cms_article"."posid" IS '推荐位，多选';
COMMENT ON COLUMN "cms_article"."custom_content_view" IS '自定义内容视图';
COMMENT ON COLUMN "cms_article"."view_config" IS '视图配置';
COMMENT ON COLUMN "cms_article"."create_by" IS '创建者';
COMMENT ON COLUMN "cms_article"."create_date" IS '创建时间';
COMMENT ON COLUMN "cms_article"."update_by" IS '更新者';
COMMENT ON COLUMN "cms_article"."update_date" IS '更新时间';
COMMENT ON COLUMN "cms_article"."remarks" IS '备注信息';
COMMENT ON COLUMN "cms_article"."del_flag" IS '删除标记';
COMMENT ON COLUMN "cms_article_data"."id" IS '编号';
COMMENT ON COLUMN "cms_article_data"."content" IS '文章内容';
COMMENT ON COLUMN "cms_article_data"."copyfrom" IS '文章来源';
COMMENT ON COLUMN "cms_article_data"."relation" IS '相关文章';
COMMENT ON COLUMN "cms_article_data"."allow_comment" IS '是否允许评论';
COMMENT ON COLUMN "cms_category"."id" IS '编号';
COMMENT ON COLUMN "cms_category"."parent_id" IS '父级编号';
COMMENT ON COLUMN "cms_category"."parent_ids" IS '所有父级编号';
COMMENT ON COLUMN "cms_category"."site_id" IS '站点编号';
COMMENT ON COLUMN "cms_category"."office_id" IS '归属机构';
COMMENT ON COLUMN "cms_category"."module" IS '栏目模块';
COMMENT ON COLUMN "cms_category"."name" IS '栏目名称';
COMMENT ON COLUMN "cms_category"."image" IS '栏目图片';
COMMENT ON COLUMN "cms_category"."href" IS '链接';
COMMENT ON COLUMN "cms_category"."target" IS '目标';
COMMENT ON COLUMN "cms_category"."description" IS '描述';
COMMENT ON COLUMN "cms_category"."keywords" IS '关键字';
COMMENT ON COLUMN "cms_category"."sort" IS '排序（升序）';
COMMENT ON COLUMN "cms_category"."in_menu" IS '是否在导航中显示';
COMMENT ON COLUMN "cms_category"."in_list" IS '是否在分类页中显示列表';
COMMENT ON COLUMN "cms_category"."show_modes" IS '展现方式';
COMMENT ON COLUMN "cms_category"."allow_comment" IS '是否允许评论';
COMMENT ON COLUMN "cms_category"."is_audit" IS '是否需要审核';
COMMENT ON COLUMN "cms_category"."custom_list_view" IS '自定义列表视图';
COMMENT ON COLUMN "cms_category"."custom_content_view" IS '自定义内容视图';
COMMENT ON COLUMN "cms_category"."view_config" IS '视图配置';
COMMENT ON COLUMN "cms_category"."create_by" IS '创建者';
COMMENT ON COLUMN "cms_category"."create_date" IS '创建时间';
COMMENT ON COLUMN "cms_category"."update_by" IS '更新者';
COMMENT ON COLUMN "cms_category"."update_date" IS '更新时间';
COMMENT ON COLUMN "cms_category"."remarks" IS '备注信息';
COMMENT ON COLUMN "cms_category"."del_flag" IS '删除标记';
COMMENT ON COLUMN "cms_comment"."id" IS '编号';
COMMENT ON COLUMN "cms_comment"."category_id" IS '栏目编号';
COMMENT ON COLUMN "cms_comment"."content_id" IS '栏目内容的编号';
COMMENT ON COLUMN "cms_comment"."title" IS '栏目内容的标题';
COMMENT ON COLUMN "cms_comment"."content" IS '评论内容';
COMMENT ON COLUMN "cms_comment"."name" IS '评论姓名';
COMMENT ON COLUMN "cms_comment"."ip" IS '评论IP';
COMMENT ON COLUMN "cms_comment"."create_date" IS '评论时间';
COMMENT ON COLUMN "cms_comment"."audit_user_id" IS '审核人';
COMMENT ON COLUMN "cms_comment"."audit_date" IS '审核时间';
COMMENT ON COLUMN "cms_comment"."del_flag" IS '删除标记';
COMMENT ON COLUMN "cms_guestbook"."id" IS '编号';
COMMENT ON COLUMN "cms_guestbook"."type" IS '留言分类';
COMMENT ON COLUMN "cms_guestbook"."content" IS '留言内容';
COMMENT ON COLUMN "cms_guestbook"."name" IS '姓名';
COMMENT ON COLUMN "cms_guestbook"."email" IS '邮箱';
COMMENT ON COLUMN "cms_guestbook"."phone" IS '电话';
COMMENT ON COLUMN "cms_guestbook"."workunit" IS '单位';
COMMENT ON COLUMN "cms_guestbook"."ip" IS 'IP';
COMMENT ON COLUMN "cms_guestbook"."create_date" IS '留言时间';
COMMENT ON COLUMN "cms_guestbook"."re_user_id" IS '回复人';
COMMENT ON COLUMN "cms_guestbook"."re_date" IS '回复时间';
COMMENT ON COLUMN "cms_guestbook"."re_content" IS '回复内容';
COMMENT ON COLUMN "cms_guestbook"."del_flag" IS '删除标记';
COMMENT ON COLUMN "cms_link"."id" IS '编号';
COMMENT ON COLUMN "cms_link"."category_id" IS '栏目编号';
COMMENT ON COLUMN "cms_link"."title" IS '链接名称';
COMMENT ON COLUMN "cms_link"."color" IS '标题颜色';
COMMENT ON COLUMN "cms_link"."image" IS '链接图片';
COMMENT ON COLUMN "cms_link"."href" IS '链接地址';
COMMENT ON COLUMN "cms_link"."weight" IS '权重，越大越靠前';
COMMENT ON COLUMN "cms_link"."weight_date" IS '权重期限';
COMMENT ON COLUMN "cms_link"."create_by" IS '创建者';
COMMENT ON COLUMN "cms_link"."create_date" IS '创建时间';
COMMENT ON COLUMN "cms_link"."update_by" IS '更新者';
COMMENT ON COLUMN "cms_link"."update_date" IS '更新时间';
COMMENT ON COLUMN "cms_link"."remarks" IS '备注信息';
COMMENT ON COLUMN "cms_link"."del_flag" IS '删除标记';
COMMENT ON COLUMN "cms_site"."id" IS '编号';
COMMENT ON COLUMN "cms_site"."name" IS '站点名称';
COMMENT ON COLUMN "cms_site"."title" IS '站点标题';
COMMENT ON COLUMN "cms_site"."logo" IS '站点Logo';
COMMENT ON COLUMN "cms_site"."domain" IS '站点域名';
COMMENT ON COLUMN "cms_site"."description" IS '描述';
COMMENT ON COLUMN "cms_site"."keywords" IS '关键字';
COMMENT ON COLUMN "cms_site"."theme" IS '主题';
COMMENT ON COLUMN "cms_site"."copyright" IS '版权信息';
COMMENT ON COLUMN "cms_site"."custom_index_view" IS '自定义站点首页视图';
COMMENT ON COLUMN "cms_site"."create_by" IS '创建者';
COMMENT ON COLUMN "cms_site"."create_date" IS '创建时间';
COMMENT ON COLUMN "cms_site"."update_by" IS '更新者';
COMMENT ON COLUMN "cms_site"."update_date" IS '更新时间';
COMMENT ON COLUMN "cms_site"."remarks" IS '备注信息';
COMMENT ON COLUMN "cms_site"."del_flag" IS '删除标记';
COMMENT ON COLUMN "gen_scheme"."id" IS '编号';
COMMENT ON COLUMN "gen_scheme"."name" IS '名称';
COMMENT ON COLUMN "gen_scheme"."category" IS '分类';
COMMENT ON COLUMN "gen_scheme"."package_name" IS '生成包路径';
COMMENT ON COLUMN "gen_scheme"."module_name" IS '生成模块名';
COMMENT ON COLUMN "gen_scheme"."sub_module_name" IS '生成子模块名';
COMMENT ON COLUMN "gen_scheme"."function_name" IS '生成功能名';
COMMENT ON COLUMN "gen_scheme"."function_name_simple" IS '生成功能名（简写）';
COMMENT ON COLUMN "gen_scheme"."function_author" IS '生成功能作者';
COMMENT ON COLUMN "gen_scheme"."gen_table_id" IS '生成表编号';
COMMENT ON COLUMN "gen_scheme"."create_by" IS '创建者';
COMMENT ON COLUMN "gen_scheme"."create_date" IS '创建时间';
COMMENT ON COLUMN "gen_scheme"."update_by" IS '更新者';
COMMENT ON COLUMN "gen_scheme"."update_date" IS '更新时间';
COMMENT ON COLUMN "gen_scheme"."remarks" IS '备注信息';
COMMENT ON COLUMN "gen_scheme"."del_flag" IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN "gen_table"."id" IS '编号';
COMMENT ON COLUMN "gen_table"."name" IS '名称';
COMMENT ON COLUMN "gen_table"."comments" IS '描述';
COMMENT ON COLUMN "gen_table"."class_name" IS '实体类名称';
COMMENT ON COLUMN "gen_table"."parent_table" IS '关联父表';
COMMENT ON COLUMN "gen_table"."parent_table_fk" IS '关联父表外键';
COMMENT ON COLUMN "gen_table"."create_by" IS '创建者';
COMMENT ON COLUMN "gen_table"."create_date" IS '创建时间';
COMMENT ON COLUMN "gen_table"."update_by" IS '更新者';
COMMENT ON COLUMN "gen_table"."update_date" IS '更新时间';
COMMENT ON COLUMN "gen_table"."remarks" IS '备注信息';
COMMENT ON COLUMN "gen_table"."del_flag" IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN "gen_table_column"."id" IS '编号';
COMMENT ON COLUMN "gen_table_column"."gen_table_id" IS '归属表编号';
COMMENT ON COLUMN "gen_table_column"."name" IS '名称';
COMMENT ON COLUMN "gen_table_column"."comments" IS '描述';
COMMENT ON COLUMN "gen_table_column"."jdbc_type" IS '列的数据类型的字节长度';
COMMENT ON COLUMN "gen_table_column"."java_type" IS 'JAVA类型';
COMMENT ON COLUMN "gen_table_column"."java_field" IS 'JAVA字段名';
COMMENT ON COLUMN "gen_table_column"."is_pk" IS '是否主键';
COMMENT ON COLUMN "gen_table_column"."is_null" IS '是否可为空';
COMMENT ON COLUMN "gen_table_column"."is_insert" IS '是否为插入字段';
COMMENT ON COLUMN "gen_table_column"."is_edit" IS '是否编辑字段';
COMMENT ON COLUMN "gen_table_column"."is_list" IS '是否列表字段';
COMMENT ON COLUMN "gen_table_column"."is_query" IS '是否查询字段';
COMMENT ON COLUMN "gen_table_column"."query_type" IS '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）';
COMMENT ON COLUMN "gen_table_column"."show_type" IS '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）';
COMMENT ON COLUMN "gen_table_column"."dict_type" IS '字典类型';
COMMENT ON COLUMN "gen_table_column"."settings" IS '其它设置（扩展字段JSON）';
COMMENT ON COLUMN "gen_table_column"."sort" IS '排序（升序）';
COMMENT ON COLUMN "gen_table_column"."create_by" IS '创建者';
COMMENT ON COLUMN "gen_table_column"."create_date" IS '创建时间';
COMMENT ON COLUMN "gen_table_column"."update_by" IS '更新者';
COMMENT ON COLUMN "gen_table_column"."update_date" IS '更新时间';
COMMENT ON COLUMN "gen_table_column"."remarks" IS '备注信息';
COMMENT ON COLUMN "gen_table_column"."del_flag" IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN "gen_template"."id" IS '编号';
COMMENT ON COLUMN "gen_template"."name" IS '名称';
COMMENT ON COLUMN "gen_template"."category" IS '分类';
COMMENT ON COLUMN "gen_template"."file_path" IS '生成文件路径';
COMMENT ON COLUMN "gen_template"."file_name" IS '生成文件名';
COMMENT ON COLUMN "gen_template"."content" IS '内容';
COMMENT ON COLUMN "gen_template"."create_by" IS '创建者';
COMMENT ON COLUMN "gen_template"."create_date" IS '创建时间';
COMMENT ON COLUMN "gen_template"."update_by" IS '更新者';
COMMENT ON COLUMN "gen_template"."update_date" IS '更新时间';
COMMENT ON COLUMN "gen_template"."remarks" IS '备注信息';
COMMENT ON COLUMN "gen_template"."del_flag" IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN "oa_leave"."id" IS '编号';
COMMENT ON COLUMN "oa_leave"."process_instance_id" IS '流程实例编号';
COMMENT ON COLUMN "oa_leave"."start_time" IS '开始时间';
COMMENT ON COLUMN "oa_leave"."end_time" IS '结束时间';
COMMENT ON COLUMN "oa_leave"."leave_type" IS '请假类型';
COMMENT ON COLUMN "oa_leave"."reason" IS '请假理由';
COMMENT ON COLUMN "oa_leave"."apply_time" IS '申请时间';
COMMENT ON COLUMN "oa_leave"."reality_start_time" IS '实际开始时间';
COMMENT ON COLUMN "oa_leave"."reality_end_time" IS '实际结束时间';
COMMENT ON COLUMN "oa_leave"."create_by" IS '创建者';
COMMENT ON COLUMN "oa_leave"."create_date" IS '创建时间';
COMMENT ON COLUMN "oa_leave"."update_by" IS '更新者';
COMMENT ON COLUMN "oa_leave"."update_date" IS '更新时间';
COMMENT ON COLUMN "oa_leave"."remarks" IS '备注信息';
COMMENT ON COLUMN "oa_leave"."del_flag" IS '删除标记';
COMMENT ON COLUMN "oa_notify"."id" IS '编号';
COMMENT ON COLUMN "oa_notify"."type" IS '类型';
COMMENT ON COLUMN "oa_notify"."title" IS '标题';
COMMENT ON COLUMN "oa_notify"."content" IS '内容';
COMMENT ON COLUMN "oa_notify"."files" IS '附件';
COMMENT ON COLUMN "oa_notify"."status" IS '状态';
COMMENT ON COLUMN "oa_notify"."create_by" IS '创建者';
COMMENT ON COLUMN "oa_notify"."create_date" IS '创建时间';
COMMENT ON COLUMN "oa_notify"."update_by" IS '更新者';
COMMENT ON COLUMN "oa_notify"."update_date" IS '更新时间';
COMMENT ON COLUMN "oa_notify"."remarks" IS '备注信息';
COMMENT ON COLUMN "oa_notify"."del_flag" IS '删除标记';
COMMENT ON COLUMN "oa_notify_record"."id" IS '编号';
COMMENT ON COLUMN "oa_notify_record"."oa_notify_id" IS '通知通告ID';
COMMENT ON COLUMN "oa_notify_record"."user_id" IS '接受人';
COMMENT ON COLUMN "oa_notify_record"."read_flag" IS '阅读标记';
COMMENT ON COLUMN "oa_notify_record"."read_date" IS '阅读时间';
COMMENT ON COLUMN "oa_test_audit"."id" IS '编号';
COMMENT ON COLUMN "oa_test_audit"."PROC_INS_ID" IS '流程实例ID';
COMMENT ON COLUMN "oa_test_audit"."USER_ID" IS '变动用户';
COMMENT ON COLUMN "oa_test_audit"."OFFICE_ID" IS '归属部门';
COMMENT ON COLUMN "oa_test_audit"."POST" IS '岗位';
COMMENT ON COLUMN "oa_test_audit"."AGE" IS '性别';
COMMENT ON COLUMN "oa_test_audit"."EDU" IS '学历';
COMMENT ON COLUMN "oa_test_audit"."CONTENT" IS '调整原因';
COMMENT ON COLUMN "oa_test_audit"."OLDA" IS '现行标准 薪酬档级';
COMMENT ON COLUMN "oa_test_audit"."OLDB" IS '现行标准 月工资额';
COMMENT ON COLUMN "oa_test_audit"."OLDC" IS '现行标准 年薪总额';
COMMENT ON COLUMN "oa_test_audit"."NEWA" IS '调整后标准 薪酬档级';
COMMENT ON COLUMN "oa_test_audit"."NEWB" IS '调整后标准 月工资额';
COMMENT ON COLUMN "oa_test_audit"."NEWC" IS '调整后标准 年薪总额';
COMMENT ON COLUMN "oa_test_audit"."ADD_NUM" IS '月增资';
COMMENT ON COLUMN "oa_test_audit"."EXE_DATE" IS '执行时间';
COMMENT ON COLUMN "oa_test_audit"."HR_TEXT" IS '人力资源部门意见';
COMMENT ON COLUMN "oa_test_audit"."LEAD_TEXT" IS '分管领导意见';
COMMENT ON COLUMN "oa_test_audit"."MAIN_LEAD_TEXT" IS '集团主要领导意见';
COMMENT ON COLUMN "oa_test_audit"."create_by" IS '创建者';
COMMENT ON COLUMN "oa_test_audit"."create_date" IS '创建时间';
COMMENT ON COLUMN "oa_test_audit"."update_by" IS '更新者';
COMMENT ON COLUMN "oa_test_audit"."update_date" IS '更新时间';
COMMENT ON COLUMN "oa_test_audit"."remarks" IS '备注信息';
COMMENT ON COLUMN "oa_test_audit"."del_flag" IS '删除标记';
COMMENT ON COLUMN "sys_area"."id" IS '编号';
COMMENT ON COLUMN "sys_area"."parent_id" IS '父级编号';
COMMENT ON COLUMN "sys_area"."parent_ids" IS '所有父级编号';
COMMENT ON COLUMN "sys_area"."name" IS '名称';
COMMENT ON COLUMN "sys_area"."sort" IS '排序';
COMMENT ON COLUMN "sys_area"."code" IS '区域编码';
COMMENT ON COLUMN "sys_area"."type" IS '区域类型';
COMMENT ON COLUMN "sys_area"."create_by" IS '创建者';
COMMENT ON COLUMN "sys_area"."create_date" IS '创建时间';
COMMENT ON COLUMN "sys_area"."update_by" IS '更新者';
COMMENT ON COLUMN "sys_area"."update_date" IS '更新时间';
COMMENT ON COLUMN "sys_area"."remarks" IS '备注信息';
COMMENT ON COLUMN "sys_area"."del_flag" IS '删除标记';
COMMENT ON COLUMN "sys_dict"."id" IS '编号';
COMMENT ON COLUMN "sys_dict"."value" IS '数据值';
COMMENT ON COLUMN "sys_dict"."label" IS '标签名';
COMMENT ON COLUMN "sys_dict"."type" IS '类型';
COMMENT ON COLUMN "sys_dict"."description" IS '描述';
COMMENT ON COLUMN "sys_dict"."sort" IS '排序（升序）';
COMMENT ON COLUMN "sys_dict"."parent_id" IS '父级编号';
COMMENT ON COLUMN "sys_dict"."create_by" IS '创建者';
COMMENT ON COLUMN "sys_dict"."create_date" IS '创建时间';
COMMENT ON COLUMN "sys_dict"."update_by" IS '更新者';
COMMENT ON COLUMN "sys_dict"."update_date" IS '更新时间';
COMMENT ON COLUMN "sys_dict"."remarks" IS '备注信息';
COMMENT ON COLUMN "sys_dict"."del_flag" IS '删除标记';
COMMENT ON COLUMN "sys_log"."id" IS '编号';
COMMENT ON COLUMN "sys_log"."type" IS '日志类型';
COMMENT ON COLUMN "sys_log"."title" IS '日志标题';
COMMENT ON COLUMN "sys_log"."create_by" IS '创建者';
COMMENT ON COLUMN "sys_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "sys_log"."remote_addr" IS '操作IP地址';
COMMENT ON COLUMN "sys_log"."user_agent" IS '用户代理';
COMMENT ON COLUMN "sys_log"."request_uri" IS '请求URI';
COMMENT ON COLUMN "sys_log"."method" IS '操作方式';
COMMENT ON COLUMN "sys_log"."params" IS '操作提交的数据';
COMMENT ON COLUMN "sys_log"."exception" IS '异常信息';
COMMENT ON COLUMN "sys_mdict"."id" IS '编号';
COMMENT ON COLUMN "sys_mdict"."parent_id" IS '父级编号';
COMMENT ON COLUMN "sys_mdict"."parent_ids" IS '所有父级编号';
COMMENT ON COLUMN "sys_mdict"."name" IS '名称';
COMMENT ON COLUMN "sys_mdict"."sort" IS '排序';
COMMENT ON COLUMN "sys_mdict"."description" IS '描述';
COMMENT ON COLUMN "sys_mdict"."create_by" IS '创建者';
COMMENT ON COLUMN "sys_mdict"."create_date" IS '创建时间';
COMMENT ON COLUMN "sys_mdict"."update_by" IS '更新者';
COMMENT ON COLUMN "sys_mdict"."update_date" IS '更新时间';
COMMENT ON COLUMN "sys_mdict"."remarks" IS '备注信息';
COMMENT ON COLUMN "sys_mdict"."del_flag" IS '删除标记';
COMMENT ON COLUMN "sys_menu"."id" IS '编号';
COMMENT ON COLUMN "sys_menu"."parent_id" IS '父级编号';
COMMENT ON COLUMN "sys_menu"."parent_ids" IS '所有父级编号';
COMMENT ON COLUMN "sys_menu"."name" IS '名称';
COMMENT ON COLUMN "sys_menu"."sort" IS '排序';
COMMENT ON COLUMN "sys_menu"."href" IS '链接';
COMMENT ON COLUMN "sys_menu"."target" IS '目标';
COMMENT ON COLUMN "sys_menu"."icon" IS '图标';
COMMENT ON COLUMN "sys_menu"."is_show" IS '是否在菜单中显示';
COMMENT ON COLUMN "sys_menu"."permission" IS '权限标识';
COMMENT ON COLUMN "sys_menu"."create_by" IS '创建者';
COMMENT ON COLUMN "sys_menu"."create_date" IS '创建时间';
COMMENT ON COLUMN "sys_menu"."update_by" IS '更新者';
COMMENT ON COLUMN "sys_menu"."update_date" IS '更新时间';
COMMENT ON COLUMN "sys_menu"."remarks" IS '备注信息';
COMMENT ON COLUMN "sys_menu"."del_flag" IS '删除标记';
COMMENT ON COLUMN "sys_office"."id" IS '编号';
COMMENT ON COLUMN "sys_office"."parent_id" IS '父级编号';
COMMENT ON COLUMN "sys_office"."parent_ids" IS '所有父级编号';
COMMENT ON COLUMN "sys_office"."name" IS '名称';
COMMENT ON COLUMN "sys_office"."sort" IS '排序';
COMMENT ON COLUMN "sys_office"."area_id" IS '归属区域';
COMMENT ON COLUMN "sys_office"."code" IS '区域编码';
COMMENT ON COLUMN "sys_office"."type" IS '机构类型';
COMMENT ON COLUMN "sys_office"."grade" IS '机构等级';
COMMENT ON COLUMN "sys_office"."address" IS '联系地址';
COMMENT ON COLUMN "sys_office"."zip_code" IS '邮政编码';
COMMENT ON COLUMN "sys_office"."master" IS '负责人';
COMMENT ON COLUMN "sys_office"."phone" IS '电话';
COMMENT ON COLUMN "sys_office"."fax" IS '传真';
COMMENT ON COLUMN "sys_office"."email" IS '邮箱';
COMMENT ON COLUMN "sys_office"."USEABLE" IS '是否启用';
COMMENT ON COLUMN "sys_office"."PRIMARY_PERSON" IS '主负责人';
COMMENT ON COLUMN "sys_office"."DEPUTY_PERSON" IS '副负责人';
COMMENT ON COLUMN "sys_office"."create_by" IS '创建者';
COMMENT ON COLUMN "sys_office"."create_date" IS '创建时间';
COMMENT ON COLUMN "sys_office"."update_by" IS '更新者';
COMMENT ON COLUMN "sys_office"."update_date" IS '更新时间';
COMMENT ON COLUMN "sys_office"."remarks" IS '备注信息';
COMMENT ON COLUMN "sys_office"."del_flag" IS '删除标记';
COMMENT ON COLUMN "sys_role"."id" IS '编号';
COMMENT ON COLUMN "sys_role"."office_id" IS '归属机构';
COMMENT ON COLUMN "sys_role"."name" IS '角色名称';
COMMENT ON COLUMN "sys_role"."enname" IS '英文名称';
COMMENT ON COLUMN "sys_role"."role_type" IS '角色类型';
COMMENT ON COLUMN "sys_role"."data_scope" IS '数据范围';
COMMENT ON COLUMN "sys_role"."is_sys" IS '是否系统数据';
COMMENT ON COLUMN "sys_role"."useable" IS '是否可用';
COMMENT ON COLUMN "sys_role"."create_by" IS '创建者';
COMMENT ON COLUMN "sys_role"."create_date" IS '创建时间';
COMMENT ON COLUMN "sys_role"."update_by" IS '更新者';
COMMENT ON COLUMN "sys_role"."update_date" IS '更新时间';
COMMENT ON COLUMN "sys_role"."remarks" IS '备注信息';
COMMENT ON COLUMN "sys_role"."del_flag" IS '删除标记';
COMMENT ON COLUMN "sys_role_menu"."role_id" IS '角色编号';
COMMENT ON COLUMN "sys_role_menu"."menu_id" IS '菜单编号';
COMMENT ON COLUMN "sys_role_office"."role_id" IS '角色编号';
COMMENT ON COLUMN "sys_role_office"."office_id" IS '机构编号';
COMMENT ON COLUMN "sys_user"."id" IS '编号';
COMMENT ON COLUMN "sys_user"."company_id" IS '归属公司';
COMMENT ON COLUMN "sys_user"."office_id" IS '归属部门';
COMMENT ON COLUMN "sys_user"."login_name" IS '登录名';
COMMENT ON COLUMN "sys_user"."password" IS '密码';
COMMENT ON COLUMN "sys_user"."no" IS '工号';
COMMENT ON COLUMN "sys_user"."name" IS '姓名';
COMMENT ON COLUMN "sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "sys_user"."phone" IS '电话';
COMMENT ON COLUMN "sys_user"."mobile" IS '手机';
COMMENT ON COLUMN "sys_user"."user_type" IS '用户类型';
COMMENT ON COLUMN "sys_user"."photo" IS '用户头像';
COMMENT ON COLUMN "sys_user"."login_ip" IS '最后登陆IP';
COMMENT ON COLUMN "sys_user"."login_date" IS '最后登陆时间';
COMMENT ON COLUMN "sys_user"."login_flag" IS '是否可登录';
COMMENT ON COLUMN "sys_user"."create_by" IS '创建者';
COMMENT ON COLUMN "sys_user"."create_date" IS '创建时间';
COMMENT ON COLUMN "sys_user"."update_by" IS '更新者';
COMMENT ON COLUMN "sys_user"."update_date" IS '更新时间';
COMMENT ON COLUMN "sys_user"."remarks" IS '备注信息';
COMMENT ON COLUMN "sys_user"."del_flag" IS '删除标记';
COMMENT ON COLUMN "sys_user_role"."user_id" IS '用户编号';
COMMENT ON COLUMN "sys_user_role"."role_id" IS '角色编号';
COMMENT ON COLUMN "test_data"."id" IS '编号';
COMMENT ON COLUMN "test_data"."user_id" IS '归属用户';
COMMENT ON COLUMN "test_data"."office_id" IS '归属部门';
COMMENT ON COLUMN "test_data"."area_id" IS '归属区域';
COMMENT ON COLUMN "test_data"."name" IS '名称';
COMMENT ON COLUMN "test_data"."sex" IS '性别';
COMMENT ON COLUMN "test_data"."in_date" IS '加入日期';
COMMENT ON COLUMN "test_data"."create_by" IS '创建者';
COMMENT ON COLUMN "test_data"."create_date" IS '创建时间';
COMMENT ON COLUMN "test_data"."update_by" IS '更新者';
COMMENT ON COLUMN "test_data"."update_date" IS '更新时间';
COMMENT ON COLUMN "test_data"."remarks" IS '备注信息';
COMMENT ON COLUMN "test_data"."del_flag" IS '删除标记';
COMMENT ON COLUMN "test_data_child"."id" IS '编号';
COMMENT ON COLUMN "test_data_child"."test_data_main_id" IS '业务主表ID';
COMMENT ON COLUMN "test_data_child"."name" IS '名称';
COMMENT ON COLUMN "test_data_child"."create_by" IS '创建者';
COMMENT ON COLUMN "test_data_child"."create_date" IS '创建时间';
COMMENT ON COLUMN "test_data_child"."update_by" IS '更新者';
COMMENT ON COLUMN "test_data_child"."update_date" IS '更新时间';
COMMENT ON COLUMN "test_data_child"."remarks" IS '备注信息';
COMMENT ON COLUMN "test_data_child"."del_flag" IS '删除标记';
COMMENT ON COLUMN "test_data_main"."id" IS '编号';
COMMENT ON COLUMN "test_data_main"."user_id" IS '归属用户';
COMMENT ON COLUMN "test_data_main"."office_id" IS '归属部门';
COMMENT ON COLUMN "test_data_main"."area_id" IS '归属区域';
COMMENT ON COLUMN "test_data_main"."name" IS '名称';
COMMENT ON COLUMN "test_data_main"."sex" IS '性别';
COMMENT ON COLUMN "test_data_main"."in_date" IS '加入日期';
COMMENT ON COLUMN "test_data_main"."create_by" IS '创建者';
COMMENT ON COLUMN "test_data_main"."create_date" IS '创建时间';
COMMENT ON COLUMN "test_data_main"."update_by" IS '更新者';
COMMENT ON COLUMN "test_data_main"."update_date" IS '更新时间';
COMMENT ON COLUMN "test_data_main"."remarks" IS '备注信息';
COMMENT ON COLUMN "test_data_main"."del_flag" IS '删除标记';
COMMENT ON COLUMN "test_tree"."id" IS '编号';
COMMENT ON COLUMN "test_tree"."parent_id" IS '父级编号';
COMMENT ON COLUMN "test_tree"."parent_ids" IS '所有父级编号';
COMMENT ON COLUMN "test_tree"."name" IS '名称';
COMMENT ON COLUMN "test_tree"."sort" IS '排序';
COMMENT ON COLUMN "test_tree"."create_by" IS '创建者';
COMMENT ON COLUMN "test_tree"."create_date" IS '创建时间';
COMMENT ON COLUMN "test_tree"."update_by" IS '更新者';
COMMENT ON COLUMN "test_tree"."update_date" IS '更新时间';
COMMENT ON COLUMN "test_tree"."remarks" IS '备注信息';
COMMENT ON COLUMN "test_tree"."del_flag" IS '删除标记';
COMMENT ON TABLE "test_tree" IS '树结构表';
COMMENT ON TABLE "test_data_main" IS '业务数据表';
COMMENT ON TABLE "test_data_child" IS '业务数据子表';
COMMENT ON TABLE "test_data" IS '业务数据表';
COMMENT ON TABLE "sys_user_role" IS '用户-角色';
COMMENT ON TABLE "sys_user" IS '用户表';
COMMENT ON TABLE "sys_role_office" IS '角色-机构';
COMMENT ON TABLE "sys_role_menu" IS '角色-菜单';
COMMENT ON TABLE "sys_role" IS '角色表';
COMMENT ON TABLE "sys_office" IS '机构表';
COMMENT ON TABLE "sys_menu" IS '菜单表';
COMMENT ON TABLE "sys_mdict" IS '多级字典表';
COMMENT ON TABLE "sys_log" IS '日志表';
COMMENT ON TABLE "sys_dict" IS '字典表';
COMMENT ON TABLE "sys_area" IS '区域表';
COMMENT ON TABLE "oa_test_audit" IS '审批流程测试表';
COMMENT ON TABLE "oa_notify_record" IS '通知通告发送记录';
COMMENT ON TABLE "oa_notify" IS '通知通告';
COMMENT ON TABLE "oa_leave" IS '请假流程表';
COMMENT ON TABLE "gen_template" IS '代码模板表';
COMMENT ON TABLE "gen_table_column" IS '业务表字段';
COMMENT ON TABLE "gen_table" IS '业务表';
COMMENT ON TABLE "gen_scheme" IS '生成方案';
COMMENT ON TABLE "cms_site" IS '站点表';
COMMENT ON TABLE "cms_link" IS '友情链接';
COMMENT ON TABLE "cms_guestbook" IS '留言板';
COMMENT ON TABLE "cms_comment" IS '评论表';
COMMENT ON TABLE "cms_category" IS '栏目表';
COMMENT ON TABLE "cms_article_data" IS '文章详表';
COMMENT ON TABLE "cms_article" IS '文章表';
