-- Source: https://github.com/georgegrace1987/Hue_Practice/blob/f4a317fff38438a81dfa1ba3827479991729f018/desktop/core/src/desktop/test_data/hue_5_9_mysql.sql?raw=true
-- Tables detected: 84 | FK constraints: 95
CREATE TABLE "auth_group" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(80) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name" ("name")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "auth_group_permissions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "group_id" int NOT NULL,
    "permission_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "group_id" ("group_id","permission_id"),
    KEY "auth_group_permissions_5f412f9a" ("group_id"),
    KEY "auth_group_permissions_83d7f98b" ("permission_id"),
    CONSTRAINT "group_id_refs_id_f4b32aac" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id"),
    CONSTRAINT "permission_id_refs_id_6ba0f519" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id")
);

CREATE TABLE "auth_permission" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(50) NOT NULL,
    "content_type_id" int NOT NULL,
    "codename" varchar(100) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "content_type_id" ("content_type_id","codename"),
    KEY "auth_permission_37ef4eb4" ("content_type_id"),
    CONSTRAINT "content_type_id_refs_id_d043b34a" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=utf8;

CREATE TABLE "auth_user" (
    "id" int NOT NULL AUTO_INCREMENT,
    "password" varchar(128) NOT NULL,
    "last_login" TIMESTAMP NOT NULL,
    "is_superuser" SMALLINT NOT NULL,
    "username" varchar(30) NOT NULL,
    "first_name" varchar(30) NOT NULL,
    "last_name" varchar(30) NOT NULL,
    "email" varchar(75) NOT NULL,
    "is_staff" SMALLINT NOT NULL,
    "is_active" SMALLINT NOT NULL,
    "date_joined" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "username" ("username")
) ENGINE=InnoDB AUTO_INCREMENT=1100714 DEFAULT CHARSET=utf8;

CREATE TABLE "auth_user_groups" (
    "id" int NOT NULL AUTO_INCREMENT,
    "user_id" int NOT NULL,
    "group_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "user_id" ("user_id","group_id"),
    KEY "auth_user_groups_6340c63c" ("user_id"),
    KEY "auth_user_groups_5f412f9a" ("group_id"),
    CONSTRAINT "user_id_refs_id_40c41112" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id"),
    CONSTRAINT "group_id_refs_id_274b862c" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE "auth_user_user_permissions" (
    "id" int NOT NULL AUTO_INCREMENT,
    "user_id" int NOT NULL,
    "permission_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "user_id" ("user_id","permission_id"),
    KEY "auth_user_user_permissions_6340c63c" ("user_id"),
    KEY "auth_user_user_permissions_83d7f98b" ("permission_id"),
    CONSTRAINT "user_id_refs_id_4dc23c39" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id"),
    CONSTRAINT "permission_id_refs_id_35d9ac25" FOREIGN KEY ("permission_id") REFERENCES "auth_permission" ("id")
);

CREATE TABLE "axes_accessattempt" (
    "id" int NOT NULL AUTO_INCREMENT,
    "user_agent" varchar(255) NOT NULL,
    "ip_address" char(39) DEFAULT NULL,
    "username" varchar(255) DEFAULT NULL,
    "trusted" SMALLINT NOT NULL,
    "http_accept" varchar(1025) NOT NULL,
    "path_info" varchar(255) NOT NULL,
    "attempt_time" TIMESTAMP NOT NULL,
    "get_data" TEXT NOT NULL,
    "post_data" TEXT NOT NULL,
    "failures_since_start" int unsigned NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE "axes_accesslog" (
    "id" int NOT NULL AUTO_INCREMENT,
    "user_agent" varchar(255) NOT NULL,
    "ip_address" char(39) DEFAULT NULL,
    "username" varchar(255) DEFAULT NULL,
    "trusted" SMALLINT NOT NULL,
    "http_accept" varchar(1025) NOT NULL,
    "path_info" varchar(255) NOT NULL,
    "attempt_time" TIMESTAMP NOT NULL,
    "logout_time" TIMESTAMP DEFAULT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE "beeswax_metainstall" (
    "installed_example" SMALLINT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id")
);

CREATE TABLE "beeswax_queryhistory" (
    "submission_date" TIMESTAMP NOT NULL,
    "last_state" int NOT NULL,
    "server_id" varchar(1024) DEFAULT NULL,
    "log_context" varchar(1024) DEFAULT NULL,
    "design_id" int DEFAULT NULL,
    "owner_id" int NOT NULL,
    "query" TEXT NOT NULL,
    "has_results" SMALLINT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "notify" SMALLINT NOT NULL,
    "server_name" varchar(128) NOT NULL,
    "server_host" varchar(128) NOT NULL,
    "server_port" int unsigned NOT NULL,
    "server_type" varchar(128) NOT NULL,
    "server_guid" varchar(1024) DEFAULT NULL,
    "operation_type" smallint,
    "modified_row_count" DOUBLE PRECISION,
    "statement_number" smallint NOT NULL,
    "query_type" smallint NOT NULL,
    "is_redacted" SMALLINT NOT NULL,
    "extra" TEXT NOT NULL,
    "is_cleared" SMALLINT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "beeswax_queryhistory_bfe02e93" ("last_state"),
    KEY "beeswax_queryhistory_38ebade8" ("design_id"),
    KEY "beeswax_queryhistory_cb902d83" ("owner_id"),
    CONSTRAINT "design_id_refs_id_f8250ba5" FOREIGN KEY ("design_id") REFERENCES "beeswax_savedquery" ("id"),
    CONSTRAINT "owner_id_refs_id_d5c13755" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "beeswax_savedquery" (
    "name" varchar(80) NOT NULL,
    "type" int NOT NULL,
    "is_auto" SMALLINT NOT NULL,
    "mtime" TIMESTAMP NOT NULL,
    "owner_id" int NOT NULL,
    "data" TEXT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "desc" TEXT NOT NULL,
    "is_trashed" SMALLINT NOT NULL,
    "is_redacted" SMALLINT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "beeswax_savedquery_db558b3c" ("is_auto"),
    KEY "beeswax_savedquery_cb902d83" ("owner_id"),
    KEY "beeswax_savedquery_863b5435" ("is_trashed"),
    CONSTRAINT "owner_id_refs_id_9ecea72d" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE "beeswax_session" (
    "last_used" TIMESTAMP NOT NULL,
    "status_code" smallint unsigned NOT NULL,
    "server_protocol_version" smallint NOT NULL,
    "secret" TEXT NOT NULL,
    "owner_id" int NOT NULL,
    "guid" TEXT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "application" varchar(128) NOT NULL,
    "properties" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "beeswax_session_cdfd3889" ("last_used"),
    KEY "beeswax_session_cb902d83" ("owner_id"),
    CONSTRAINT "owner_id_refs_id_0417c1ac" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

CREATE TABLE "defaultconfiguration_groups" (
    "id" int NOT NULL AUTO_INCREMENT,
    "defaultconfiguration_id" int NOT NULL,
    "group_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "defaultconfigurati_defaultconfiguration_id_13559ffa29a523a_uniq" ("defaultconfiguration_id","group_id"),
    KEY "defaultconfiguration_groups_3c818360" ("defaultconfiguration_id"),
    KEY "defaultconfiguration_groups_5f412f9a" ("group_id"),
    CONSTRAINT "group_id_refs_id_cbed91a7" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id"),
    CONSTRAINT "defaultconfiguration_id_refs_id_b639c3b2" FOREIGN KEY ("defaultconfiguration_id") REFERENCES "desktop_defaultconfiguration" ("id")
);

CREATE TABLE "desktop_defaultconfiguration" (
    "id" int NOT NULL AUTO_INCREMENT,
    "app" varchar(32) NOT NULL,
    "properties" TEXT NOT NULL,
    "is_default" SMALLINT NOT NULL,
    "user_id" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "desktop_defaultconfiguration_60fc113e" ("app"),
    KEY "desktop_defaultconfiguration_d2c4b3f2" ("is_default"),
    KEY "desktop_defaultconfiguration_6340c63c" ("user_id"),
    CONSTRAINT "user_id_refs_id_5d426dc2" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "desktop_document" (
    "description" TEXT NOT NULL,
    "extra" TEXT NOT NULL,
    "object_id" int unsigned NOT NULL,
    "last_modified" TIMESTAMP NOT NULL,
    "content_type_id" int NOT NULL,
    "version" smallint NOT NULL,
    "owner_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "desktop_document_content_type_id_24066d293ce4f1bf_uniq" ("content_type_id","object_id"),
    KEY "desktop_document_5ccb38e5" ("last_modified"),
    KEY "desktop_document_37ef4eb4" ("content_type_id"),
    KEY "desktop_document_cb902d83" ("owner_id"),
    CONSTRAINT "content_type_id_refs_id_800664c4" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id"),
    CONSTRAINT "owner_id_refs_id_6062a036" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

CREATE TABLE "desktop_document2" (
    "id" int NOT NULL AUTO_INCREMENT,
    "owner_id" int NOT NULL,
    "name" varchar(255) NOT NULL,
    "description" TEXT NOT NULL,
    "uuid" varchar(36) NOT NULL,
    "type" varchar(32) NOT NULL,
    "data" TEXT NOT NULL,
    "extra" TEXT NOT NULL,
    "last_modified" TIMESTAMP NOT NULL,
    "version" smallint NOT NULL,
    "is_history" SMALLINT NOT NULL,
    "parent_directory_id" int,
    "search" TEXT,
    "is_managed" SMALLINT NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "desktop_document2_uuid_71ec93c81d6e68e7_uniq" ("uuid","version","is_history"),
    KEY "desktop_document2_cb902d83" ("owner_id"),
    KEY "desktop_document2_6f6e1b62" ("uuid"),
    KEY "desktop_document2_403d8ff3" ("type"),
    KEY "desktop_document2_5ccb38e5" ("last_modified"),
    KEY "desktop_document2_f516c2b3" ("version"),
    KEY "desktop_document2_dd08191e" ("is_history"),
    KEY "desktop_document2_9ffde453" ("parent_directory_id"),
    KEY "desktop_document2_0f116c0b" ("is_managed"),
    CONSTRAINT "owner_id_refs_id_04b63201" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id"),
    CONSTRAINT "parent_directory_id_refs_id_4fe2babf" FOREIGN KEY ("parent_directory_id") REFERENCES "desktop_document2" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=50008 DEFAULT CHARSET=utf8;

CREATE TABLE "desktop_document2_dependencies" (
    "id" int NOT NULL AUTO_INCREMENT,
    "from_document2_id" int NOT NULL,
    "to_document2_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "desktop_document2_depen_from_document2_id_180cf2c525720117_uniq" ("from_document2_id","to_document2_id"),
    KEY "desktop_document2_dependencies_5248ab40" ("from_document2_id"),
    KEY "desktop_document2_dependencies_19db1b82" ("to_document2_id"),
    CONSTRAINT "to_document2_id_refs_id_a2dfdbb8" FOREIGN KEY ("to_document2_id") REFERENCES "desktop_document2" ("id"),
    CONSTRAINT "from_document2_id_refs_id_a2dfdbb8" FOREIGN KEY ("from_document2_id") REFERENCES "desktop_document2" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE "desktop_document2permission" (
    "id" int NOT NULL AUTO_INCREMENT,
    "doc_id" int NOT NULL,
    "perms" varchar(10) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "desktop_document2permission_doc_id_103d6b15a9f268ba_uniq" ("doc_id","perms"),
    KEY "desktop_document2permission_fbbb6049" ("doc_id"),
    KEY "desktop_document2permission_148edb5b" ("perms"),
    CONSTRAINT "doc_id_refs_id_8784c160" FOREIGN KEY ("doc_id") REFERENCES "desktop_document2" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

CREATE TABLE "desktop_document_tags" (
    "id" int NOT NULL AUTO_INCREMENT,
    "document_id" int NOT NULL,
    "documenttag_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "desktop_document_tags_document_id_22435f97005dd9b0_uniq" ("document_id","documenttag_id"),
    KEY "desktop_document_tags_b7398729" ("document_id"),
    KEY "desktop_document_tags_21e9f328" ("documenttag_id"),
    CONSTRAINT "documenttag_id_refs_id_f5f1db6f" FOREIGN KEY ("documenttag_id") REFERENCES "desktop_documenttag" ("id"),
    CONSTRAINT "document_id_refs_id_599007de" FOREIGN KEY ("document_id") REFERENCES "desktop_document" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

CREATE TABLE "desktop_documentpermission" (
    "perms" varchar(10) NOT NULL,
    "doc_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id"),
    UNIQUE KEY "desktop_documentpermission_doc_id_60b132dd84ab9469_uniq" ("doc_id","perms"),
    KEY "desktop_documentpermission_fbbb6049" ("doc_id"),
    CONSTRAINT "doc_id_refs_id_6e61f686" FOREIGN KEY ("doc_id") REFERENCES "desktop_document" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

CREATE TABLE "desktop_documenttag" (
    "owner_id" int NOT NULL,
    "tag" varchar(50) NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id"),
    UNIQUE KEY "desktop_documenttag_owner_id_1d5f76680ee9998b_uniq" ("owner_id","tag"),
    KEY "desktop_documenttag_cb902d83" ("owner_id"),
    KEY "desktop_documenttag_5659cca2" ("tag"),
    CONSTRAINT "owner_id_refs_id_a0e6eebe" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE "desktop_settings" (
    "collect_usage" SMALLINT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "tours_and_tutorials" SMALLINT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "desktop_settings_02d738b3" ("collect_usage"),
    KEY "desktop_settings_73ca4b20" ("tours_and_tutorials")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "desktop_userpreferences" (
    "value" TEXT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "key" varchar(20) NOT NULL,
    "user_id" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "desktop_userpreferences_6340c63c" ("user_id"),
    CONSTRAINT "user_id_refs_id_6de51743" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "django_admin_log" (
    "id" int NOT NULL AUTO_INCREMENT,
    "action_time" TIMESTAMP NOT NULL,
    "user_id" int NOT NULL,
    "content_type_id" int DEFAULT NULL,
    "object_id" TEXT,
    "object_repr" varchar(200) NOT NULL,
    "action_flag" smallint unsigned NOT NULL,
    "change_message" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "django_admin_log_6340c63c" ("user_id"),
    KEY "django_admin_log_37ef4eb4" ("content_type_id"),
    CONSTRAINT "content_type_id_refs_id_93d2d1f8" FOREIGN KEY ("content_type_id") REFERENCES "django_content_type" ("id"),
    CONSTRAINT "user_id_refs_id_c0d12874" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "django_content_type" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(100) NOT NULL,
    "app_label" varchar(100) NOT NULL,
    "model" varchar(100) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "app_label" ("app_label","model")
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

CREATE TABLE "django_openid_auth_association" (
    "id" int NOT NULL AUTO_INCREMENT,
    "server_url" TEXT NOT NULL,
    "handle" varchar(255) NOT NULL,
    "secret" TEXT NOT NULL,
    "issued" int NOT NULL,
    "lifetime" int NOT NULL,
    "assoc_type" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "django_openid_auth_nonce" (
    "id" int NOT NULL AUTO_INCREMENT,
    "server_url" varchar(1000) NOT NULL,
    "timestamp" int NOT NULL,
    "salt" varchar(40) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "django_openid_auth_useropenid" (
    "id" int NOT NULL AUTO_INCREMENT,
    "user_id" int NOT NULL,
    "claimed_id" varchar(255) NOT NULL,
    "display_id" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "claimed_id" ("claimed_id"),
    KEY "django_openid_auth_useropenid_6340c63c" ("user_id"),
    CONSTRAINT "user_id_refs_id_8f018ae0" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "django_session" (
    "session_key" varchar(40) NOT NULL,
    "session_data" TEXT NOT NULL,
    "expire_date" TIMESTAMP NOT NULL,
    PRIMARY KEY ("session_key"),
    KEY "django_session_b7b81f0c" ("expire_date")
);

CREATE TABLE "django_site" (
    "id" int NOT NULL AUTO_INCREMENT,
    "domain" varchar(100) NOT NULL,
    "name" varchar(50) NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "documentpermission2_groups" (
    "id" int NOT NULL AUTO_INCREMENT,
    "document2permission_id" int NOT NULL,
    "group_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "documentpermission_document2permission_id_153e37c3da5a9480_uniq" ("document2permission_id","group_id"),
    KEY "documentpermission2_groups_7a114f0f" ("document2permission_id"),
    KEY "documentpermission2_groups_5f412f9a" ("group_id"),
    CONSTRAINT "group_id_refs_id_cae4462f" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id"),
    CONSTRAINT "document2permission_id_refs_id_1ab9731a" FOREIGN KEY ("document2permission_id") REFERENCES "desktop_document2permission" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

CREATE TABLE "documentpermission2_users" (
    "id" int NOT NULL AUTO_INCREMENT,
    "document2permission_id" int NOT NULL,
    "user_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "documentpermission_document2permission_id_68f73063f13e5b46_uniq" ("document2permission_id","user_id"),
    KEY "documentpermission2_users_7a114f0f" ("document2permission_id"),
    KEY "documentpermission2_users_6340c63c" ("user_id"),
    CONSTRAINT "user_id_refs_id_ca751e07" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id"),
    CONSTRAINT "document2permission_id_refs_id_9e0e3849" FOREIGN KEY ("document2permission_id") REFERENCES "desktop_document2permission" ("id")
);

CREATE TABLE "documentpermission_groups" (
    "id" int NOT NULL AUTO_INCREMENT,
    "documentpermission_id" int NOT NULL,
    "group_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "documentpermission__documentpermission_id_69436afd449228fe_uniq" ("documentpermission_id","group_id"),
    KEY "documentpermission_groups_35c59db1" ("documentpermission_id"),
    KEY "documentpermission_groups_5f412f9a" ("group_id"),
    CONSTRAINT "group_id_refs_id_dcacd481" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id"),
    CONSTRAINT "documentpermission_id_refs_id_b50c1f1d" FOREIGN KEY ("documentpermission_id") REFERENCES "desktop_documentpermission" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE "documentpermission_users" (
    "id" int NOT NULL AUTO_INCREMENT,
    "documentpermission_id" int NOT NULL,
    "user_id" int NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "documentpermission__documentpermission_id_6577517b9e586968_uniq" ("documentpermission_id","user_id"),
    KEY "documentpermission_users_35c59db1" ("documentpermission_id"),
    KEY "documentpermission_users_6340c63c" ("user_id"),
    CONSTRAINT "user_id_refs_id_70816365" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id"),
    CONSTRAINT "documentpermission_id_refs_id_b8222d7f" FOREIGN KEY ("documentpermission_id") REFERENCES "desktop_documentpermission" ("id")
);

CREATE TABLE "jobsub_checkforsetup" (
    "setup_run" SMALLINT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "setup_level" int NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "jobsub_jobdesign" (
    "description" varchar(1024) NOT NULL,
    "data" TEXT NOT NULL,
    "last_modified" TIMESTAMP NOT NULL,
    "owner_id" int NOT NULL,
    "type" varchar(128) NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(40) NOT NULL,
    PRIMARY KEY ("id"),
    KEY "jobsub_jobdesign_cb902d83" ("owner_id"),
    CONSTRAINT "owner_id_refs_id_753082e9" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "jobsub_jobhistory" (
    "owner_id" int NOT NULL,
    "submission_date" TIMESTAMP NOT NULL,
    "design_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "job_id" varchar(128) NOT NULL,
    PRIMARY KEY ("id"),
    KEY "jobsub_jobhistory_cb902d83" ("owner_id"),
    KEY "jobsub_jobhistory_38ebade8" ("design_id"),
    CONSTRAINT "design_id_refs_id_5e12bb2f" FOREIGN KEY ("design_id") REFERENCES "jobsub_ooziedesign" ("id"),
    CONSTRAINT "owner_id_refs_id_58370e7c" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "jobsub_oozieaction" (
    "id" int NOT NULL AUTO_INCREMENT,
    "action_type" varchar(64) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "jobsub_ooziedesign" (
    "description" varchar(1024) NOT NULL,
    "last_modified" TIMESTAMP NOT NULL,
    "owner_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "root_action_id" int NOT NULL,
    "name" varchar(64) NOT NULL,
    PRIMARY KEY ("id"),
    KEY "jobsub_ooziedesign_cb902d83" ("owner_id"),
    KEY "jobsub_ooziedesign_ce106e64" ("root_action_id"),
    CONSTRAINT "root_action_id_refs_id_26319073" FOREIGN KEY ("root_action_id") REFERENCES "jobsub_oozieaction" ("id"),
    CONSTRAINT "owner_id_refs_id_55551230" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "jobsub_ooziejavaaction" (
    "oozieaction_ptr_id" int NOT NULL,
    "files" varchar(512) NOT NULL,
    "jar_path" varchar(512) NOT NULL,
    "java_opts" varchar(256) NOT NULL,
    "args" TEXT NOT NULL,
    "job_properties" TEXT NOT NULL,
    "archives" varchar(512) NOT NULL,
    "main_class" varchar(256) NOT NULL,
    PRIMARY KEY ("oozieaction_ptr_id"),
    CONSTRAINT "oozieaction_ptr_id_refs_id_890da3c3" FOREIGN KEY ("oozieaction_ptr_id") REFERENCES "jobsub_oozieaction" ("id")
);

CREATE TABLE "jobsub_ooziemapreduceaction" (
    "oozieaction_ptr_id" int NOT NULL,
    "files" varchar(512) NOT NULL,
    "jar_path" varchar(512) NOT NULL,
    "archives" varchar(512) NOT NULL,
    "job_properties" TEXT NOT NULL,
    PRIMARY KEY ("oozieaction_ptr_id"),
    CONSTRAINT "oozieaction_ptr_id_refs_id_85f71d45" FOREIGN KEY ("oozieaction_ptr_id") REFERENCES "jobsub_oozieaction" ("id")
);

CREATE TABLE "jobsub_ooziestreamingaction" (
    "oozieaction_ptr_id" int NOT NULL,
    "files" varchar(512) NOT NULL,
    "mapper" varchar(512) NOT NULL,
    "reducer" varchar(512) NOT NULL,
    "job_properties" TEXT NOT NULL,
    "archives" varchar(512) NOT NULL,
    PRIMARY KEY ("oozieaction_ptr_id"),
    CONSTRAINT "oozieaction_ptr_id_refs_id_6dad0be7" FOREIGN KEY ("oozieaction_ptr_id") REFERENCES "jobsub_oozieaction" ("id")
);

CREATE TABLE "oozie_bundle" (
    "kick_off_time" TIMESTAMP NOT NULL,
    "job_ptr_id" int NOT NULL,
    PRIMARY KEY ("job_ptr_id"),
    CONSTRAINT "job_ptr_id_refs_id_dfe854cc" FOREIGN KEY ("job_ptr_id") REFERENCES "oozie_job" ("id")
);

CREATE TABLE "oozie_bundledcoordinator" (
    "coordinator_id" int NOT NULL,
    "parameters" TEXT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "bundle_id" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "oozie_bundledcoordinator_a376e044" ("coordinator_id"),
    KEY "oozie_bundledcoordinator_2243b87b" ("bundle_id"),
    CONSTRAINT "bundle_id_refs_job_ptr_id_49f6b676" FOREIGN KEY ("bundle_id") REFERENCES "oozie_bundle" ("job_ptr_id"),
    CONSTRAINT "coordinator_id_refs_job_ptr_id_4b9a476a" FOREIGN KEY ("coordinator_id") REFERENCES "oozie_coordinator" ("job_ptr_id")
);

CREATE TABLE "oozie_coordinator" (
    "end" TIMESTAMP NOT NULL,
    "concurrency" smallint unsigned DEFAULT NULL,
    "frequency_number" smallint NOT NULL,
    "workflow_id" int DEFAULT NULL,
    "job_ptr_id" int NOT NULL,
    "frequency_unit" varchar(20) NOT NULL,
    "start" TIMESTAMP NOT NULL,
    "timeout" smallint DEFAULT NULL,
    "timezone" varchar(24) NOT NULL,
    "throttle" smallint unsigned DEFAULT NULL,
    "execution" varchar(10) DEFAULT NULL,
    "job_properties" TEXT NOT NULL,
    PRIMARY KEY ("job_ptr_id"),
    KEY "oozie_coordinator_17b2fdb1" ("workflow_id"),
    CONSTRAINT "job_ptr_id_refs_id_02836103" FOREIGN KEY ("job_ptr_id") REFERENCES "oozie_job" ("id"),
    CONSTRAINT "workflow_id_refs_job_ptr_id_eff253f3" FOREIGN KEY ("workflow_id") REFERENCES "oozie_workflow" ("job_ptr_id")
);

CREATE TABLE "oozie_datainput" (
    "coordinator_id" int NOT NULL,
    "dataset_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(40) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "dataset_id" ("dataset_id"),
    KEY "oozie_datainput_a376e044" ("coordinator_id"),
    CONSTRAINT "dataset_id_refs_id_6d9c387e" FOREIGN KEY ("dataset_id") REFERENCES "oozie_dataset" ("id"),
    CONSTRAINT "coordinator_id_refs_job_ptr_id_a7f5bae4" FOREIGN KEY ("coordinator_id") REFERENCES "oozie_coordinator" ("job_ptr_id")
);

CREATE TABLE "oozie_dataoutput" (
    "coordinator_id" int NOT NULL,
    "dataset_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(40) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "dataset_id" ("dataset_id"),
    KEY "oozie_dataoutput_a376e044" ("coordinator_id"),
    CONSTRAINT "dataset_id_refs_id_c25267c2" FOREIGN KEY ("dataset_id") REFERENCES "oozie_dataset" ("id"),
    CONSTRAINT "coordinator_id_refs_job_ptr_id_35e76a9d" FOREIGN KEY ("coordinator_id") REFERENCES "oozie_coordinator" ("job_ptr_id")
);

CREATE TABLE "oozie_dataset" (
    "description" varchar(1024) NOT NULL,
    "frequency_number" smallint NOT NULL,
    "coordinator_id" int NOT NULL,
    "frequency_unit" varchar(20) NOT NULL,
    "uri" varchar(1024) NOT NULL,
    "start" TIMESTAMP NOT NULL,
    "timezone" varchar(24) NOT NULL,
    "done_flag" varchar(64) NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(40) NOT NULL,
    "advanced_start_instance" varchar(128) NOT NULL,
    "instance_choice" varchar(10) NOT NULL,
    "advanced_end_instance" varchar(128) NOT NULL,
    PRIMARY KEY ("id"),
    KEY "oozie_dataset_a376e044" ("coordinator_id"),
    CONSTRAINT "coordinator_id_refs_job_ptr_id_c1a45b56" FOREIGN KEY ("coordinator_id") REFERENCES "oozie_coordinator" ("job_ptr_id")
);

CREATE TABLE "oozie_decision" (
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_67bc250e" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_decisionend" (
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_31e174a0" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_distcp" (
    "prepares" TEXT NOT NULL,
    "job_xml" varchar(512) NOT NULL,
    "params" TEXT NOT NULL,
    "job_properties" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_94a882fe" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_email" (
    "cc" TEXT NOT NULL,
    "to" TEXT NOT NULL,
    "subject" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_a770716b" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_end" (
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_d2ab2ce2" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_fork" (
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_08311288" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_fs" (
    "mkdirs" TEXT NOT NULL,
    "touchzs" TEXT NOT NULL,
    "chmods" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    "moves" TEXT NOT NULL,
    "deletes" TEXT NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_f2c6c820" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_generic" (
    "xml" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_52bde32b" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_history" (
    "submission_date" TIMESTAMP NOT NULL,
    "job_id" int NOT NULL,
    "properties" TEXT NOT NULL,
    "oozie_job_id" varchar(128) NOT NULL,
    "submitter_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id"),
    KEY "oozie_history_0ebd36f3" ("submission_date"),
    KEY "oozie_history_218f3960" ("job_id"),
    KEY "oozie_history_5f7282ee" ("submitter_id"),
    CONSTRAINT "submitter_id_refs_id_be4aca60" FOREIGN KEY ("submitter_id") REFERENCES "auth_user" ("id"),
    CONSTRAINT "job_id_refs_id_aca84a0b" FOREIGN KEY ("job_id") REFERENCES "oozie_job" ("id")
);

CREATE TABLE "oozie_hive" (
    "files" TEXT NOT NULL,
    "job_xml" varchar(512) NOT NULL,
    "job_properties" TEXT NOT NULL,
    "params" TEXT NOT NULL,
    "archives" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    "prepares" TEXT NOT NULL,
    "script_path" varchar(256) NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_7061d230" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_java" (
    "files" TEXT NOT NULL,
    "job_xml" varchar(512) NOT NULL,
    "jar_path" varchar(512) NOT NULL,
    "java_opts" varchar(256) NOT NULL,
    "args" TEXT NOT NULL,
    "job_properties" TEXT NOT NULL,
    "prepares" TEXT NOT NULL,
    "archives" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    "main_class" varchar(256) NOT NULL,
    "capture_output" SMALLINT NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_c5504fe4" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_job" (
    "is_shared" SMALLINT NOT NULL,
    "description" varchar(1024) NOT NULL,
    "parameters" TEXT NOT NULL,
    "deployment_dir" varchar(1024) NOT NULL,
    "schema_version" varchar(128) NOT NULL,
    "last_modified" TIMESTAMP NOT NULL,
    "owner_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL,
    "is_trashed" SMALLINT NOT NULL,
    "data" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "oozie_job_b91b90da" ("is_shared"),
    KEY "oozie_job_5ccb38e5" ("last_modified"),
    KEY "oozie_job_cb902d83" ("owner_id"),
    KEY "oozie_job_863b5435" ("is_trashed"),
    CONSTRAINT "owner_id_refs_id_b9eb9598" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

CREATE TABLE "oozie_join" (
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_5fe5ad59" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_kill" (
    "message" varchar(256) NOT NULL,
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_6a5609f4" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_link" (
    "comment" varchar(1024) NOT NULL,
    "name" varchar(40) NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "parent_id" int NOT NULL,
    "child_id" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "oozie_link_410d0aac" ("parent_id"),
    KEY "oozie_link_0b25fb00" ("child_id"),
    CONSTRAINT "child_id_refs_id_4c5f8d9b" FOREIGN KEY ("child_id") REFERENCES "oozie_node" ("id"),
    CONSTRAINT "parent_id_refs_id_4c5f8d9b" FOREIGN KEY ("parent_id") REFERENCES "oozie_node" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

CREATE TABLE "oozie_mapreduce" (
    "files" TEXT NOT NULL,
    "job_xml" varchar(512) NOT NULL,
    "jar_path" varchar(512) NOT NULL,
    "job_properties" TEXT NOT NULL,
    "archives" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    "prepares" TEXT NOT NULL,
    UNIQUE KEY "node_ptr_id" ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_faafd42d" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_node" (
    "description" varchar(1024) NOT NULL,
    "workflow_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "node_type" varchar(64) NOT NULL,
    "name" varchar(255) NOT NULL,
    "data" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "oozie_node_17b2fdb1" ("workflow_id"),
    CONSTRAINT "workflow_id_refs_job_ptr_id_61733cb8" FOREIGN KEY ("workflow_id") REFERENCES "oozie_workflow" ("job_ptr_id")
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

CREATE TABLE "oozie_pig" (
    "files" TEXT NOT NULL,
    "job_xml" varchar(512) NOT NULL,
    "job_properties" TEXT NOT NULL,
    "params" TEXT NOT NULL,
    "archives" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    "prepares" TEXT NOT NULL,
    "script_path" varchar(256) NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_3a145eb2" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_shell" (
    "files" TEXT NOT NULL,
    "job_xml" varchar(512) NOT NULL,
    "job_properties" TEXT NOT NULL,
    "capture_output" SMALLINT NOT NULL,
    "params" TEXT NOT NULL,
    "archives" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    "prepares" TEXT NOT NULL,
    "command" varchar(256) NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_6a9f9c63" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_sqoop" (
    "files" TEXT NOT NULL,
    "job_xml" varchar(512) NOT NULL,
    "job_properties" TEXT NOT NULL,
    "params" TEXT NOT NULL,
    "archives" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    "prepares" TEXT NOT NULL,
    "script_path" TEXT NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_51abc83b" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_ssh" (
    "capture_output" SMALLINT NOT NULL,
    "host" varchar(256) NOT NULL,
    "params" TEXT NOT NULL,
    "user" varchar(64) NOT NULL,
    "node_ptr_id" int NOT NULL,
    "command" varchar(256) NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_e6a21afc" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_start" (
    "node_ptr_id" int NOT NULL,
    UNIQUE KEY "node_ptr_id" ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_ed4928be" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_streaming" (
    "files" TEXT NOT NULL,
    "mapper" varchar(512) NOT NULL,
    "reducer" varchar(512) NOT NULL,
    "job_properties" TEXT NOT NULL,
    "archives" TEXT NOT NULL,
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_5857900b" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_subworkflow" (
    "propagate_configuration" SMALLINT NOT NULL,
    "job_properties" TEXT NOT NULL,
    "sub_workflow_id" int,
    "node_ptr_id" int NOT NULL,
    PRIMARY KEY ("node_ptr_id"),
    KEY "oozie_subworkflow_7c14fdc3" ("sub_workflow_id"),
    CONSTRAINT "sub_workflow_id_refs_job_ptr_id_b9cfb611" FOREIGN KEY ("sub_workflow_id") REFERENCES "oozie_workflow" ("job_ptr_id"),
    CONSTRAINT "node_ptr_id_refs_id_9a2f74e6" FOREIGN KEY ("node_ptr_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "oozie_workflow" (
    "job_xml" varchar(512) NOT NULL,
    "end_id" int DEFAULT NULL,
    "is_single" SMALLINT NOT NULL,
    "job_ptr_id" int NOT NULL,
    "job_properties" TEXT NOT NULL,
    "start_id" int DEFAULT NULL,
    "managed" SMALLINT NOT NULL,
    PRIMARY KEY ("job_ptr_id"),
    KEY "oozie_workflow_536e023f" ("end_id"),
    KEY "oozie_workflow_6f89268d" ("start_id"),
    CONSTRAINT "end_id_refs_id_92f16762" FOREIGN KEY ("end_id") REFERENCES "oozie_node" ("id"),
    CONSTRAINT "job_ptr_id_refs_id_8bb519fb" FOREIGN KEY ("job_ptr_id") REFERENCES "oozie_job" ("id"),
    CONSTRAINT "start_id_refs_id_92f16762" FOREIGN KEY ("start_id") REFERENCES "oozie_node" ("id")
);

CREATE TABLE "pig_document" (
    "owner_id" int NOT NULL,
    "is_design" SMALLINT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id"),
    KEY "pig_document_cb902d83" ("owner_id"),
    KEY "pig_document_63cbf1fe" ("is_design"),
    CONSTRAINT "owner_id_refs_id_8d390f80" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id")
);

CREATE TABLE "pig_pigscript" (
    "document_ptr_id" int NOT NULL,
    "data" TEXT NOT NULL,
    PRIMARY KEY ("document_ptr_id"),
    CONSTRAINT "document_ptr_id_refs_id_17b4e137" FOREIGN KEY ("document_ptr_id") REFERENCES "pig_document" ("id")
);

CREATE TABLE "search_collection" (
    "properties" TEXT NOT NULL,
    "sorting_id" int NOT NULL,
    "name" varchar(40) NOT NULL,
    "facets_id" int NOT NULL,
    "enabled" SMALLINT NOT NULL,
    "label" varchar(100) NOT NULL,
    "is_core_only" SMALLINT NOT NULL,
    "result_id" int NOT NULL,
    "cores" TEXT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "owner_id" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "search_collection_1ee0a855" ("sorting_id"),
    KEY "search_collection_be9133f8" ("facets_id"),
    KEY "search_collection_f41c4334" ("result_id"),
    KEY "search_collection_cb902d83" ("owner_id"),
    CONSTRAINT "owner_id_refs_id_fb75896c" FOREIGN KEY ("owner_id") REFERENCES "auth_user" ("id"),
    CONSTRAINT "facets_id_refs_id_109f7b9d" FOREIGN KEY ("facets_id") REFERENCES "search_facet" ("id"),
    CONSTRAINT "result_id_refs_id_cef2c4d1" FOREIGN KEY ("result_id") REFERENCES "search_result" ("id"),
    CONSTRAINT "sorting_id_refs_id_63666e75" FOREIGN KEY ("sorting_id") REFERENCES "search_sorting" ("id")
);

CREATE TABLE "search_facet" (
    "data" TEXT NOT NULL,
    "enabled" SMALLINT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id")
);

CREATE TABLE "search_result" (
    "data" TEXT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id")
);

CREATE TABLE "search_sorting" (
    "data" TEXT NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id")
);

CREATE TABLE "south_migrationhistory" (
    "id" int NOT NULL AUTO_INCREMENT,
    "app_name" varchar(255) NOT NULL,
    "migration" varchar(255) NOT NULL,
    "applied" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

CREATE TABLE "useradmin_grouppermission" (
    "hue_permission_id" int NOT NULL,
    "group_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id"),
    KEY "useradmin_grouppermission_9dd0e7a9" ("hue_permission_id"),
    KEY "useradmin_grouppermission_5f412f9a" ("group_id"),
    CONSTRAINT "group_id_refs_id_d2a5bba4" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id"),
    CONSTRAINT "hue_permission_id_refs_id_53ff8024" FOREIGN KEY ("hue_permission_id") REFERENCES "useradmin_huepermission" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

CREATE TABLE "useradmin_huepermission" (
    "action" varchar(100) NOT NULL,
    "app" varchar(30) NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "description" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

CREATE TABLE "useradmin_ldapgroup" (
    "group_id" int NOT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    PRIMARY KEY ("id"),
    KEY "useradmin_ldapgroup_5f412f9a" ("group_id"),
    CONSTRAINT "group_id_refs_id_23c2c967" FOREIGN KEY ("group_id") REFERENCES "auth_group" ("id")
);

CREATE TABLE "useradmin_userprofile" (
    "home_directory" varchar(1024) DEFAULT NULL,
    "id" int NOT NULL AUTO_INCREMENT,
    "user_id" int NOT NULL,
    "creation_method" varchar(64) NOT NULL,
    "first_login" SMALLINT NOT NULL,
    "last_activity" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "user_id" ("user_id"),
    KEY "useradmin_userprofile_9cf27b62" ("last_activity"),
    CONSTRAINT "user_id_refs_id_e66f296b" FOREIGN KEY ("user_id") REFERENCES "auth_user" ("id")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
