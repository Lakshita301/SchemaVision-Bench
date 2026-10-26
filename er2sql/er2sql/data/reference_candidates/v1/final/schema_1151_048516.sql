-- Source: https://github.com/wangminli/jeesite/blob/3d967fb83583fd6f05f19091d01fbc74435c18ee/db/jeesite_mysql.sql?raw=true
-- Tables detected: 53 | FK constraints: 21
CREATE TABLE "ACT_GE_BYTEARRAY" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "REV_" int DEFAULT NULL,
    "NAME_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "DEPLOYMENT_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "BYTES_" BYTEA,
    "GENERATED_" SMALLINT DEFAULT NULL,
    PRIMARY KEY ("ID_"),
    KEY "ACT_FK_BYTEARR_DEPL" ("DEPLOYMENT_ID_"),
    CONSTRAINT "ACT_FK_BYTEARR_DEPL" FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "ACT_RE_DEPLOYMENT" ("ID_")
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
    PRIMARY KEY ("USER_ID_","GROUP_ID_"),
    KEY "ACT_FK_MEMB_GROUP" ("GROUP_ID_"),
    CONSTRAINT "ACT_FK_MEMB_USER" FOREIGN KEY ("USER_ID_") REFERENCES "ACT_ID_USER" ("ID_"),
    CONSTRAINT "ACT_FK_MEMB_GROUP" FOREIGN KEY ("GROUP_ID_") REFERENCES "ACT_ID_GROUP" ("ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_FK_MODEL_SOURCE" ("EDITOR_SOURCE_VALUE_ID_"),
    KEY "ACT_FK_MODEL_SOURCE_EXTRA" ("EDITOR_SOURCE_EXTRA_VALUE_ID_"),
    KEY "ACT_FK_MODEL_DEPLOYMENT" ("DEPLOYMENT_ID_"),
    CONSTRAINT "ACT_FK_MODEL_DEPLOYMENT" FOREIGN KEY ("DEPLOYMENT_ID_") REFERENCES "ACT_RE_DEPLOYMENT" ("ID_"),
    CONSTRAINT "ACT_FK_MODEL_SOURCE" FOREIGN KEY ("EDITOR_SOURCE_VALUE_ID_") REFERENCES "ACT_GE_BYTEARRAY" ("ID_"),
    CONSTRAINT "ACT_FK_MODEL_SOURCE_EXTRA" FOREIGN KEY ("EDITOR_SOURCE_EXTRA_VALUE_ID_") REFERENCES "ACT_GE_BYTEARRAY" ("ID_")
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
    UNIQUE KEY "ACT_UNIQ_PROCDEF" ("KEY_","VERSION_","TENANT_ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_EVENT_SUBSCR_CONFIG_" ("CONFIGURATION_"),
    KEY "ACT_FK_EVENT_EXEC" ("EXECUTION_ID_"),
    CONSTRAINT "ACT_FK_EVENT_EXEC" FOREIGN KEY ("EXECUTION_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_EXEC_BUSKEY" ("BUSINESS_KEY_"),
    KEY "ACT_FK_EXE_PROCINST" ("PROC_INST_ID_"),
    KEY "ACT_FK_EXE_PARENT" ("PARENT_ID_"),
    KEY "ACT_FK_EXE_SUPER" ("SUPER_EXEC_"),
    KEY "ACT_FK_EXE_PROCDEF" ("PROC_DEF_ID_"),
    CONSTRAINT "ACT_FK_EXE_PROCDEF" FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "ACT_RE_PROCDEF" ("ID_"),
    CONSTRAINT "ACT_FK_EXE_PARENT" FOREIGN KEY ("PARENT_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_"),
    CONSTRAINT "ACT_FK_EXE_PROCINST" FOREIGN KEY ("PROC_INST_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "ACT_FK_EXE_SUPER" FOREIGN KEY ("SUPER_EXEC_") REFERENCES "ACT_RU_EXECUTION" ("ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_IDENT_LNK_USER" ("USER_ID_"),
    KEY "ACT_IDX_IDENT_LNK_GROUP" ("GROUP_ID_"),
    KEY "ACT_IDX_ATHRZ_PROCEDEF" ("PROC_DEF_ID_"),
    KEY "ACT_FK_TSKASS_TASK" ("TASK_ID_"),
    KEY "ACT_FK_IDL_PROCINST" ("PROC_INST_ID_"),
    CONSTRAINT "ACT_FK_IDL_PROCINST" FOREIGN KEY ("PROC_INST_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_"),
    CONSTRAINT "ACT_FK_ATHRZ_PROCEDEF" FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "ACT_RE_PROCDEF" ("ID_"),
    CONSTRAINT "ACT_FK_TSKASS_TASK" FOREIGN KEY ("TASK_ID_") REFERENCES "ACT_RU_TASK" ("ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_FK_JOB_EXCEPTION" ("EXCEPTION_STACK_ID_"),
    CONSTRAINT "ACT_FK_JOB_EXCEPTION" FOREIGN KEY ("EXCEPTION_STACK_ID_") REFERENCES "ACT_GE_BYTEARRAY" ("ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_TASK_CREATE" ("CREATE_TIME_"),
    KEY "ACT_FK_TASK_EXE" ("EXECUTION_ID_"),
    KEY "ACT_FK_TASK_PROCINST" ("PROC_INST_ID_"),
    KEY "ACT_FK_TASK_PROCDEF" ("PROC_DEF_ID_"),
    CONSTRAINT "ACT_FK_TASK_PROCDEF" FOREIGN KEY ("PROC_DEF_ID_") REFERENCES "ACT_RE_PROCDEF" ("ID_"),
    CONSTRAINT "ACT_FK_TASK_EXE" FOREIGN KEY ("EXECUTION_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_"),
    CONSTRAINT "ACT_FK_TASK_PROCINST" FOREIGN KEY ("PROC_INST_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_VARIABLE_TASK_ID" ("TASK_ID_"),
    KEY "ACT_FK_VAR_EXE" ("EXECUTION_ID_"),
    KEY "ACT_FK_VAR_PROCINST" ("PROC_INST_ID_"),
    KEY "ACT_FK_VAR_BYTEARRAY" ("BYTEARRAY_ID_"),
    CONSTRAINT "ACT_FK_VAR_BYTEARRAY" FOREIGN KEY ("BYTEARRAY_ID_") REFERENCES "ACT_GE_BYTEARRAY" ("ID_"),
    CONSTRAINT "ACT_FK_VAR_EXE" FOREIGN KEY ("EXECUTION_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_"),
    CONSTRAINT "ACT_FK_VAR_PROCINST" FOREIGN KEY ("PROC_INST_ID_") REFERENCES "ACT_RU_EXECUTION" ("ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_HI_ACT_INST_START" ("START_TIME_"),
    KEY "ACT_IDX_HI_ACT_INST_END" ("END_TIME_"),
    KEY "ACT_IDX_HI_ACT_INST_PROCINST" ("PROC_INST_ID_","ACT_ID_"),
    KEY "ACT_IDX_HI_ACT_INST_EXEC" ("EXECUTION_ID_","ACT_ID_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_HI_DETAIL_PROC_INST" ("PROC_INST_ID_"),
    KEY "ACT_IDX_HI_DETAIL_ACT_INST" ("ACT_INST_ID_"),
    KEY "ACT_IDX_HI_DETAIL_TIME" ("TIME_"),
    KEY "ACT_IDX_HI_DETAIL_NAME" ("NAME_"),
    KEY "ACT_IDX_HI_DETAIL_TASK_ID" ("TASK_ID_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "act_hi_identitylink" (
    "ID_" varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
    "GROUP_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TYPE_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "USER_ID_" varchar(255) COLLATE utf8_bin DEFAULT NULL,
    "TASK_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    "PROC_INST_ID_" varchar(64) COLLATE utf8_bin DEFAULT NULL,
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_HI_IDENT_LNK_USER" ("USER_ID_"),
    KEY "ACT_IDX_HI_IDENT_LNK_TASK" ("TASK_ID_"),
    KEY "ACT_IDX_HI_IDENT_LNK_PROCINST" ("PROC_INST_ID_")
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
    UNIQUE KEY "PROC_INST_ID_" ("PROC_INST_ID_"),
    KEY "ACT_IDX_HI_PRO_INST_END" ("END_TIME_"),
    KEY "ACT_IDX_HI_PRO_I_BUSKEY" ("BUSINESS_KEY_")
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
    PRIMARY KEY ("ID_"),
    KEY "ACT_IDX_HI_PROCVAR_PROC_INST" ("PROC_INST_ID_"),
    KEY "ACT_IDX_HI_PROCVAR_NAME_TYPE" ("NAME_","VAR_TYPE_")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE "cms_article" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "category_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
    "title" varchar(255) COLLATE utf8_bin NOT NULL COMMENT '标题',
    "link" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章链接',
    "color" varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
    "image" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章图片',
    "keywords" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
    "description" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述、摘要',
    "weight" int DEFAULT '0' COMMENT '权重，越大越靠前',
    "weight_date" TIMESTAMP DEFAULT NULL COMMENT '权重期限',
    "hits" int DEFAULT '0' COMMENT '点击数',
    "posid" varchar(10) COLLATE utf8_bin DEFAULT NULL COMMENT '推荐位，多选',
    "custom_content_view" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
    "view_config" text COLLATE utf8_bin COMMENT '视图配置',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
    "update_date" TIMESTAMP DEFAULT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "cms_article_create_by" ("create_by"),
    KEY "cms_article_title" ("title"),
    KEY "cms_article_keywords" ("keywords"),
    KEY "cms_article_del_flag" ("del_flag"),
    KEY "cms_article_weight" ("weight"),
    KEY "cms_article_update_date" ("update_date"),
    KEY "cms_article_category_id" ("category_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章表';

CREATE TABLE "cms_article_data" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "content" text COLLATE utf8_bin COMMENT '文章内容',
    "copyfrom" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '文章来源',
    "relation" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '相关文章',
    "allow_comment" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
    PRIMARY KEY ("id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='文章详表';

CREATE TABLE "cms_category" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
    "site_id" varchar(64) COLLATE utf8_bin DEFAULT '1' COMMENT '站点编号',
    "office_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
    "module" varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目模块',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '栏目名称',
    "image" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目图片',
    "href" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
    "target" varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
    "description" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
    "keywords" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
    "sort" int DEFAULT '30' COMMENT '排序（升序）',
    "in_menu" char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在导航中显示',
    "in_list" char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否在分类页中显示列表',
    "show_modes" char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '展现方式',
    "allow_comment" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否允许评论',
    "is_audit" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否需要审核',
    "custom_list_view" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义列表视图',
    "custom_content_view" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义内容视图',
    "view_config" text COLLATE utf8_bin COMMENT '视图配置',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
    "update_date" TIMESTAMP DEFAULT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "cms_category_parent_id" ("parent_id"),
    KEY "cms_category_module" ("module"),
    KEY "cms_category_name" ("name"),
    KEY "cms_category_sort" ("sort"),
    KEY "cms_category_del_flag" ("del_flag"),
    KEY "cms_category_office_id" ("office_id"),
    KEY "cms_category_site_id" ("site_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='栏目表';

CREATE TABLE "cms_comment" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "category_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
    "content_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目内容的编号',
    "title" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '栏目内容的标题',
    "content" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '评论内容',
    "name" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论姓名',
    "ip" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '评论IP',
    "create_date" TIMESTAMP NOT NULL COMMENT '评论时间',
    "audit_user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '审核人',
    "audit_date" TIMESTAMP DEFAULT NULL COMMENT '审核时间',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "cms_comment_category_id" ("category_id"),
    KEY "cms_comment_content_id" ("content_id"),
    KEY "cms_comment_status" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='评论表';

CREATE TABLE "cms_guestbook" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "type" char(1) COLLATE utf8_bin NOT NULL COMMENT '留言分类',
    "content" varchar(255) COLLATE utf8_bin NOT NULL COMMENT '留言内容',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
    "email" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '邮箱',
    "phone" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '电话',
    "workunit" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '单位',
    "ip" varchar(100) COLLATE utf8_bin NOT NULL COMMENT 'IP',
    "create_date" TIMESTAMP NOT NULL COMMENT '留言时间',
    "re_user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '回复人',
    "re_date" TIMESTAMP DEFAULT NULL COMMENT '回复时间',
    "re_content" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '回复内容',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "cms_guestbook_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='留言板';

CREATE TABLE "cms_link" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "category_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '栏目编号',
    "title" varchar(255) COLLATE utf8_bin NOT NULL COMMENT '链接名称',
    "color" varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '标题颜色',
    "image" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接图片',
    "href" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '链接地址',
    "weight" int DEFAULT '0' COMMENT '权重，越大越靠前',
    "weight_date" TIMESTAMP DEFAULT NULL COMMENT '权重期限',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
    "update_date" TIMESTAMP DEFAULT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "cms_link_category_id" ("category_id"),
    KEY "cms_link_title" ("title"),
    KEY "cms_link_del_flag" ("del_flag"),
    KEY "cms_link_weight" ("weight"),
    KEY "cms_link_create_by" ("create_by"),
    KEY "cms_link_update_date" ("update_date")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='友情链接';

CREATE TABLE "cms_site" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点名称',
    "title" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '站点标题',
    "logo" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点Logo',
    "domain" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '站点域名',
    "description" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
    "keywords" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '关键字',
    "theme" varchar(255) COLLATE utf8_bin DEFAULT 'default' COMMENT '主题',
    "copyright" text COLLATE utf8_bin COMMENT '版权信息',
    "custom_index_view" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '自定义站点首页视图',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
    "update_date" TIMESTAMP DEFAULT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "cms_site_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='站点表';

CREATE TABLE "gen_scheme" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "name" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
    "category" varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
    "package_name" varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
    "module_name" varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
    "sub_module_name" varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成子模块名',
    "function_name" varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
    "function_name_simple" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名（简写）',
    "function_author" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
    "gen_table_id" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成表编号',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
    "update_date" TIMESTAMP DEFAULT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
    PRIMARY KEY ("id"),
    KEY "gen_scheme_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='生成方案';

CREATE TABLE "gen_table" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "name" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
    "comments" varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
    "class_name" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '实体类名称',
    "parent_table" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表',
    "parent_table_fk" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '关联父表外键',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
    "update_date" TIMESTAMP DEFAULT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
    PRIMARY KEY ("id"),
    KEY "gen_table_name" ("name"),
    KEY "gen_table_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表';

CREATE TABLE "gen_table_column" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "gen_table_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
    "name" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
    "comments" varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
    "jdbc_type" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列的数据类型的字节长度',
    "java_type" varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
    "java_field" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
    "is_pk" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键',
    "is_null" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可为空',
    "is_insert" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段',
    "is_edit" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段',
    "is_list" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段',
    "is_query" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段',
    "query_type" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
    "show_type" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
    "dict_type" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '字典类型',
    "settings" varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
    "sort" decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
    "update_date" TIMESTAMP DEFAULT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
    PRIMARY KEY ("id"),
    KEY "gen_table_column_table_id" ("gen_table_id"),
    KEY "gen_table_column_name" ("name"),
    KEY "gen_table_column_sort" ("sort"),
    KEY "gen_table_column_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务表字段';

CREATE TABLE "gen_template" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "name" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
    "category" varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '分类',
    "file_path" varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件路径',
    "file_name" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '生成文件名',
    "content" text COLLATE utf8_bin COMMENT '内容',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '更新者',
    "update_date" TIMESTAMP DEFAULT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
    PRIMARY KEY ("id"),
    KEY "gen_template_del_falg" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码模板表';

CREATE TABLE "oa_leave" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "process_instance_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例编号',
    "start_time" TIMESTAMP DEFAULT NULL COMMENT '开始时间',
    "end_time" TIMESTAMP DEFAULT NULL COMMENT '结束时间',
    "leave_type" varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '请假类型',
    "reason" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请假理由',
    "apply_time" TIMESTAMP DEFAULT NULL COMMENT '申请时间',
    "reality_start_time" TIMESTAMP DEFAULT NULL COMMENT '实际开始时间',
    "reality_end_time" TIMESTAMP DEFAULT NULL COMMENT '实际结束时间',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "oa_leave_create_by" ("create_by"),
    KEY "oa_leave_process_instance_id" ("process_instance_id"),
    KEY "oa_leave_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='请假流程表';

CREATE TABLE "oa_notify" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "type" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '类型',
    "title" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '标题',
    "content" varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '内容',
    "files" varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '附件',
    "status" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '状态',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "oa_notify_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告';

CREATE TABLE "oa_notify_record" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "oa_notify_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '通知通告ID',
    "user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '接受人',
    "read_flag" char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '阅读标记',
    "read_date" date DEFAULT NULL COMMENT '阅读时间',
    PRIMARY KEY ("id"),
    KEY "oa_notify_record_notify_id" ("oa_notify_id"),
    KEY "oa_notify_record_user_id" ("user_id"),
    KEY "oa_notify_record_read_flag" ("read_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知通告发送记录';

CREATE TABLE "oa_test_audit" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "PROC_INS_ID" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '流程实例ID',
    "USER_ID" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '变动用户',
    "OFFICE_ID" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
    "POST" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '岗位',
    "AGE" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
    "EDU" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '学历',
    "CONTENT" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整原因',
    "OLDA" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 薪酬档级',
    "OLDB" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 月工资额',
    "OLDC" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '现行标准 年薪总额',
    "NEWA" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 薪酬档级',
    "NEWB" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 月工资额',
    "NEWC" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '调整后标准 年薪总额',
    "ADD_NUM" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '月增资',
    "EXE_DATE" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '执行时间',
    "HR_TEXT" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '人力资源部门意见',
    "LEAD_TEXT" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '分管领导意见',
    "MAIN_LEAD_TEXT" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '集团主要领导意见',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "OA_TEST_AUDIT_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='审批流程测试表';

CREATE TABLE "sys_area" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
    "sort" decimal(10,0) NOT NULL COMMENT '排序',
    "code" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
    "type" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '区域类型',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "sys_area_parent_id" ("parent_id"),
    KEY "sys_area_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='区域表';

CREATE TABLE "sys_dict" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "value" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '数据值',
    "label" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '标签名',
    "type" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '类型',
    "description" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '描述',
    "sort" decimal(10,0) NOT NULL COMMENT '排序（升序）',
    "parent_id" varchar(64) COLLATE utf8_bin DEFAULT '0' COMMENT '父级编号',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "sys_dict_value" ("value"),
    KEY "sys_dict_label" ("label"),
    KEY "sys_dict_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典表';

CREATE TABLE "sys_log" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "type" char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '日志类型',
    "title" varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '日志标题',
    "create_by" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '创建者',
    "create_date" TIMESTAMP DEFAULT NULL COMMENT '创建时间',
    "remote_addr" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '操作IP地址',
    "user_agent" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '用户代理',
    "request_uri" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '请求URI',
    "method" varchar(5) COLLATE utf8_bin DEFAULT NULL COMMENT '操作方式',
    "params" text COLLATE utf8_bin COMMENT '操作提交的数据',
    "exception" text COLLATE utf8_bin COMMENT '异常信息',
    PRIMARY KEY ("id"),
    KEY "sys_log_create_by" ("create_by"),
    KEY "sys_log_request_uri" ("request_uri"),
    KEY "sys_log_type" ("type"),
    KEY "sys_log_create_date" ("create_date")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日志表';

CREATE TABLE "sys_mdict" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
    "sort" decimal(10,0) NOT NULL COMMENT '排序',
    "description" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '描述',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "sys_mdict_parent_id" ("parent_id"),
    KEY "sys_mdict_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='多级字典表';

CREATE TABLE "sys_menu" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
    "sort" decimal(10,0) NOT NULL COMMENT '排序',
    "href" varchar(2000) COLLATE utf8_bin DEFAULT NULL COMMENT '链接',
    "target" varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '目标',
    "icon" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '图标',
    "is_show" char(1) COLLATE utf8_bin NOT NULL COMMENT '是否在菜单中显示',
    "permission" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "sys_menu_parent_id" ("parent_id"),
    KEY "sys_menu_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

CREATE TABLE "sys_office" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
    "sort" decimal(10,0) NOT NULL COMMENT '排序',
    "area_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属区域',
    "code" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '区域编码',
    "type" char(1) COLLATE utf8_bin NOT NULL COMMENT '机构类型',
    "grade" char(1) COLLATE utf8_bin NOT NULL COMMENT '机构等级',
    "address" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '联系地址',
    "zip_code" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '邮政编码',
    "master" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
    "phone" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
    "fax" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '传真',
    "email" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
    "USEABLE" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否启用',
    "PRIMARY_PERSON" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '主负责人',
    "DEPUTY_PERSON" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '副负责人',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "sys_office_parent_id" ("parent_id"),
    KEY "sys_office_del_flag" ("del_flag"),
    KEY "sys_office_type" ("type")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='机构表';

CREATE TABLE "sys_role" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "office_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属机构',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
    "enname" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '英文名称',
    "role_type" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '角色类型',
    "data_scope" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '数据范围',
    "is_sys" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否系统数据',
    "useable" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可用',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "sys_role_del_flag" ("del_flag"),
    KEY "sys_role_enname" ("enname")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

CREATE TABLE "sys_role_menu" (
    "role_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
    "menu_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '菜单编号',
    PRIMARY KEY ("role_id","menu_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-菜单';

CREATE TABLE "sys_role_office" (
    "role_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
    "office_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '机构编号',
    PRIMARY KEY ("role_id","office_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色-机构';

CREATE TABLE "sys_user" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "company_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属公司',
    "office_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '归属部门',
    "login_name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '登录名',
    "password" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '密码',
    "no" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '工号',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '姓名',
    "email" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
    "phone" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '电话',
    "mobile" varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '手机',
    "user_type" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '用户类型',
    "photo" varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '用户头像',
    "login_ip" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '最后登陆IP',
    "login_date" TIMESTAMP DEFAULT NULL COMMENT '最后登陆时间',
    "login_flag" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '是否可登录',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "sys_user_office_id" ("office_id"),
    KEY "sys_user_login_name" ("login_name"),
    KEY "sys_user_company_id" ("company_id"),
    KEY "sys_user_update_date" ("update_date"),
    KEY "sys_user_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户表';

CREATE TABLE "sys_user_role" (
    "user_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '用户编号',
    "role_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '角色编号',
    PRIMARY KEY ("user_id","role_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户-角色';

CREATE TABLE "test_data" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
    "office_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
    "area_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
    "name" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
    "sex" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
    "in_date" date DEFAULT NULL COMMENT '加入日期',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "test_data_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

CREATE TABLE "test_data_child" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "test_data_main_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '业务主表ID',
    "name" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "test_data_child_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据子表';

CREATE TABLE "test_data_main" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "user_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属用户',
    "office_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属部门',
    "area_id" varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属区域',
    "name" varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '名称',
    "sex" char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '性别',
    "in_date" date DEFAULT NULL COMMENT '加入日期',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "test_data_main_del_flag" ("del_flag")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='业务数据表';

CREATE TABLE "test_tree" (
    "id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '编号',
    "parent_id" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '父级编号',
    "parent_ids" varchar(2000) COLLATE utf8_bin NOT NULL COMMENT '所有父级编号',
    "name" varchar(100) COLLATE utf8_bin NOT NULL COMMENT '名称',
    "sort" decimal(10,0) NOT NULL COMMENT '排序',
    "create_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '创建者',
    "create_date" TIMESTAMP NOT NULL COMMENT '创建时间',
    "update_by" varchar(64) COLLATE utf8_bin NOT NULL COMMENT '更新者',
    "update_date" TIMESTAMP NOT NULL COMMENT '更新时间',
    "remarks" varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注信息',
    "del_flag" char(1) COLLATE utf8_bin NOT NULL DEFAULT '0' COMMENT '删除标记',
    PRIMARY KEY ("id"),
    KEY "test_tree_del_flag" ("del_flag"),
    KEY "test_data_parent_id" ("parent_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='树结构表';
