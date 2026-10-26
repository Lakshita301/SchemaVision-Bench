-- Source: https://github.com/mawanjin/mobile-cms/blob/55d23d725dde3e3dbfa57b51904345d724f3d4f7/script/weixin_cms_2014-10-28.sql?raw=true
-- Tables detected: 34 | FK constraints: 31
CREATE TABLE "notify_notification" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "title" varchar(255) NOT NULL,
    "create_time" TIMESTAMP NOT NULL,
    "read_time" TIMESTAMP NOT NULL,
    "type" SMALLINT DEFAULT NULL,
    "status" SMALLINT DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "notify_task" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "progress" int NOT NULL,
    "start_time" TIMESTAMP NOT NULL,
    "end_time" TIMESTAMP NOT NULL,
    "status" SMALLINT DEFAULT NULL,
    "command" varchar(255) DEFAULT NULL,
    "message" text,
    "title" varchar(255) NOT NULL,
    "user_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_notify_task_user_idx" ("user_id"),
    CONSTRAINT "fk_notify_task_user" FOREIGN KEY ("user_id") REFERENCES "sec_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "sec_menu_item" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "title" varchar(255) NOT NULL,
    "url" varchar(255) DEFAULT NULL,
    "css_class" varchar(100) DEFAULT NULL,
    "parent_id" bigint DEFAULT NULL,
    "role_id" bigint DEFAULT NULL,
    "order_id" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_menu_item_parent_idx" ("parent_id"),
    KEY "fk_menu_item_role_idx" ("parent_id"),
    KEY "fk_menu_item_role" ("role_id"),
    CONSTRAINT "fk_menu_item_parent" FOREIGN KEY ("parent_id") REFERENCES "sec_menu_item" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "fk_menu_item_role" FOREIGN KEY ("role_id") REFERENCES "sec_role" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "sec_role" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "name" varchar(255) DEFAULT NULL,
    "permissions" text,
    "cn_name" varchar(255) DEFAULT NULL,
    "internal" SMALLINT DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "sec_user" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "login_name" varchar(255) DEFAULT NULL,
    "password" varchar(255) DEFAULT NULL,
    "name" varchar(255) DEFAULT NULL,
    "avatar" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "login_name_UNIQUE" ("login_name")
);

CREATE TABLE "sec_user_role" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "user_id" bigint NOT NULL,
    "role_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_user_role_idx" ("role_id"),
    KEY "fk_user_role_user_idx" ("user_id"),
    CONSTRAINT "fk_user_role_role" FOREIGN KEY ("role_id") REFERENCES "sec_role" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "fk_user_role_user" FOREIGN KEY ("user_id") REFERENCES "sec_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_action" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "action_name" varchar(255) NOT NULL,
    "cn_name" varchar(255) NOT NULL,
    "min_value" int NOT NULL DEFAULT '0',
    "cycle" SMALLINT NOT NULL,
    "count" int DEFAULT NULL,
    "max_value" int DEFAULT NULL,
    "value_type" SMALLINT NOT NULL DEFAULT '0',
    "is_valid" SMALLINT NOT NULL DEFAULT '0',
    PRIMARY KEY ("id"),
    UNIQUE KEY "action_name_UNIQUE" ("action_name")
);

CREATE TABLE "tb_action_log" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "log_time" TIMESTAMP NOT NULL,
    "value" int NOT NULL,
    "action" varchar(255) NOT NULL,
    "cn_name" varchar(255) NOT NULL,
    "user_id" bigint DEFAULT NULL,
    "resource" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_action_log_user_idx" ("user_id"),
    CONSTRAINT "fk_action_log_user" FOREIGN KEY ("user_id") REFERENCES "sec_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_ad" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "title" varchar(255) NOT NULL,
    "pic" varchar(255) DEFAULT NULL,
    "description" text,
    "create_time" TIMESTAMP NOT NULL,
    "pic_url" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "tb_ad_stats" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "visit_count" bigint DEFAULT '0',
    "ref_count" bigint DEFAULT '0',
    "ad_id" bigint DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "ad_id" ("ad_id"),
    CONSTRAINT "tb_ad_stats_ibfk_1" FOREIGN KEY ("ad_id") REFERENCES "tb_ad" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_agent" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "agent_name" varchar(255) NOT NULL,
    "fax" varchar(255) DEFAULT NULL,
    "telephone" varchar(255) DEFAULT NULL,
    "addr" varchar(255) DEFAULT NULL,
    "header" varchar(255) DEFAULT NULL,
    "post" varchar(255) DEFAULT NULL,
    "state" int DEFAULT NULL,
    "oper" varchar(255) DEFAULT NULL,
    "oper_time" TIMESTAMP DEFAULT NULL,
    "section_id" int DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_agent_secid" ("section_id"),
    CONSTRAINT "fk_agent_secid" FOREIGN KEY ("section_id") REFERENCES "tb_section_agent" ("id")
);

CREATE TABLE "tb_article" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "node_id" bigint NOT NULL,
    "content" text,
    "source_url" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "meta_id_UNIQUE" ("node_id"),
    KEY "fk_article_content_idx" ("node_id"),
    CONSTRAINT "fk_article_content" FOREIGN KEY ("node_id") REFERENCES "tb_node" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_article_group" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "content_node_id" bigint NOT NULL,
    "node_id" bigint NOT NULL,
    "order_index" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("id"),
    KEY "fk_multi_article_idx" ("content_node_id"),
    KEY "fk_multi_meta_idx" ("node_id"),
    CONSTRAINT "fk_article_group_content_node_id" FOREIGN KEY ("content_node_id") REFERENCES "tb_node" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_auto_reply_config" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "event_key" varchar(255) DEFAULT NULL,
    "about_node_id" bigint DEFAULT NULL,
    "type" SMALLINT NOT NULL DEFAULT '0',
    "key_word" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "about_node_id" ("about_node_id"),
    CONSTRAINT "tb_auto_reply_config_ibfk_1" FOREIGN KEY ("about_node_id") REFERENCES "tb_node" ("id") ON DELETE SET NULL ON UPDATE SET NULL
);

CREATE TABLE "tb_cache" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "cache_key" varchar(255) NOT NULL,
    "cache_value" text NOT NULL,
    "expires_time" int NOT NULL,
    "cache_time" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "key_UNIQUE" ("cache_key")
);

CREATE TABLE "tb_config" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL,
    "val" varchar(255) DEFAULT NULL,
    "cn_name" varchar(255) DEFAULT NULL,
    "is_show" SMALLINT NOT NULL DEFAULT '0',
    "action_id" bigint DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "FK_tb_config" ("action_id"),
    CONSTRAINT "FK_tb_config" FOREIGN KEY ("action_id") REFERENCES "tb_action" ("id")
);

CREATE TABLE "tb_m_menu" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL,
    "value" varchar(255) DEFAULT NULL,
    "type" SMALLINT DEFAULT '0',
    "parent_id" bigint DEFAULT NULL,
    "node_id" bigint DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_tb_m_menu_parent_idx" ("parent_id"),
    KEY "fk_tb_m_menu_node_idx" ("node_id"),
    CONSTRAINT "fk_tb_m_menu_node" FOREIGN KEY ("node_id") REFERENCES "tb_node" ("id") ON DELETE SET NULL ON UPDATE SET NULL,
    CONSTRAINT "fk_tb_m_menu_parent" FOREIGN KEY ("parent_id") REFERENCES "tb_m_menu" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_node" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "title" varchar(255) NOT NULL,
    "user_id" bigint NOT NULL,
    "last_modified" TIMESTAMP NOT NULL,
    "type" varchar(50) NOT NULL,
    "type_description" varchar(50) NOT NULL,
    "author_name" varchar(255) DEFAULT NULL,
    "create_time" TIMESTAMP NOT NULL,
    "summary" varchar(255) DEFAULT NULL,
    "pic_path" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "author" ("user_id") USING BTREE,
    CONSTRAINT "tb_node_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "sec_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_order" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "user_id" bigint NOT NULL,
    "order_num" varchar(255) NOT NULL,
    "total_price" DOUBLE PRECISION NOT NULL,
    "create_time" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_order_user_id_idx" ("user_id"),
    CONSTRAINT "fk_order_user_id" FOREIGN KEY ("user_id") REFERENCES "sec_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_order_item" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "order_id" bigint NOT NULL,
    "product_id" bigint NOT NULL,
    "count" int NOT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_order_item_order_idx" ("order_id"),
    KEY "fk_order_item_product_idx" ("product_id"),
    CONSTRAINT "FK_tb_order_item" FOREIGN KEY ("order_id") REFERENCES "tb_order" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "fk_order_item_product" FOREIGN KEY ("product_id") REFERENCES "tb_product" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_point_detail" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "user_id" bigint NOT NULL,
    "action" varchar(255) DEFAULT NULL,
    "cn_name" varchar(255) DEFAULT NULL,
    "create_time" TIMESTAMP DEFAULT NULL,
    "point" DOUBLE PRECISION NOT NULL DEFAULT '0',
    "user_name" varchar(255) DEFAULT NULL,
    "login_name" varchar(255) NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "tb_poll" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "type" SMALLINT NOT NULL DEFAULT '0',
    "start_time" TIMESTAMP NOT NULL,
    "end_time" TIMESTAMP NOT NULL,
    "status" SMALLINT NOT NULL DEFAULT '0',
    "node_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_poll_node_idx" ("node_id") USING BTREE,
    CONSTRAINT "tb_poll_ibfk_1" FOREIGN KEY ("node_id") REFERENCES "tb_node" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_poll_option" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "poll_id" bigint NOT NULL,
    "type" SMALLINT NOT NULL,
    "title" varchar(255) NOT NULL,
    "score" float DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_poll_option_poll_idx" ("poll_id") USING BTREE,
    CONSTRAINT "tb_poll_option_ibfk_1" FOREIGN KEY ("poll_id") REFERENCES "tb_poll" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_poll_option_record" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "poll_record_id" bigint NOT NULL,
    "poll_option_id" bigint NOT NULL,
    "correct" char(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY ("id"),
    KEY "fk_poll_option_record_poll_record_idx" ("poll_record_id") USING BTREE,
    KEY "fk_poll_option_record_poll_option_idx" ("poll_option_id") USING BTREE,
    CONSTRAINT "tb_poll_option_record_ibfk_1" FOREIGN KEY ("poll_record_id") REFERENCES "tb_poll_record" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "tb_poll_option_record_ibfk_2" FOREIGN KEY ("poll_option_id") REFERENCES "tb_poll_option" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_poll_option_value" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "poll_option_id" bigint NOT NULL,
    "value" varchar(255) NOT NULL,
    "answer" char(1) NOT NULL DEFAULT 'N',
    "type" SMALLINT NOT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_poll_option_value_poll_option_idx" ("poll_option_id") USING BTREE,
    CONSTRAINT "tb_poll_option_value_ibfk_1" FOREIGN KEY ("poll_option_id") REFERENCES "tb_poll_option" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_poll_option_value_record" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "poll_option_record_id" bigint DEFAULT NULL,
    "poll_option_value_id" bigint DEFAULT NULL,
    "text_value" varchar(1024) DEFAULT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_value_record_option_value_idx" ("poll_option_value_id") USING BTREE,
    KEY "fk_value_record_poll_option_record_idx" ("poll_option_record_id") USING BTREE,
    CONSTRAINT "tb_poll_option_value_record_ibfk_1" FOREIGN KEY ("poll_option_record_id") REFERENCES "tb_poll_option_record" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "tb_poll_option_value_record_ibfk_2" FOREIGN KEY ("poll_option_value_id") REFERENCES "tb_poll_option_value" ("id") ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE "tb_poll_record" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "poll_id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    "score" float DEFAULT NULL,
    "reward" char(1) NOT NULL DEFAULT 'N',
    PRIMARY KEY ("id"),
    KEY "fk_poll_record_poll_idx" ("poll_id") USING BTREE,
    KEY "fk_poll_record_user_idx" ("user_id") USING BTREE,
    CONSTRAINT "tb_poll_record_ibfk_1" FOREIGN KEY ("poll_id") REFERENCES "tb_poll" ("id") ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT "tb_poll_record_ibfk_2" FOREIGN KEY ("user_id") REFERENCES "sec_user" ("id") ON DELETE NO ACTION ON UPDATE CASCADE
);

CREATE TABLE "tb_poll_visibility" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "poll_id" bigint NOT NULL,
    "user_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    KEY "fk_poll_visibility_poll_idx" ("poll_id") USING BTREE,
    KEY "fk_poll_visibility_author_idx" ("user_id") USING BTREE,
    CONSTRAINT "tb_poll_visibility_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "sec_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "tb_poll_visibility_ibfk_2" FOREIGN KEY ("poll_id") REFERENCES "tb_poll" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_product" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "title" varchar(255) NOT NULL,
    "pic" varchar(255) DEFAULT NULL,
    "description" text NOT NULL,
    "status" SMALLINT NOT NULL,
    "price" DOUBLE PRECISION DEFAULT NULL,
    "last_modified" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "tb_section_agent" (
    "id" int NOT NULL AUTO_INCREMENT,
    "section_name" varchar(255) DEFAULT NULL,
    "oper_time" date DEFAULT NULL,
    "oper" varchar(255) DEFAULT NULL,
    "state" int DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "tb_text" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "content" text NOT NULL,
    "node_id" bigint NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "meta" ("node_id"),
    CONSTRAINT "fk_content_meta" FOREIGN KEY ("node_id") REFERENCES "tb_node" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_traffic_detail" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "user_id" bigint NOT NULL,
    "action" varchar(255) DEFAULT NULL,
    "cn_name" varchar(255) DEFAULT NULL,
    "create_time" TIMESTAMP NOT NULL,
    "effect_time" TIMESTAMP DEFAULT NULL,
    "traffic" DOUBLE PRECISION NOT NULL DEFAULT '0',
    "user_name" varchar(255) DEFAULT NULL,
    "login_name" varchar(255) NOT NULL,
    "status" SMALLINT NOT NULL DEFAULT '0',
    "job_number" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "tb_user_profile" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "user_id" bigint NOT NULL,
    "mobile" varchar(255) DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "user_id_UNIQUE" ("user_id"),
    UNIQUE KEY "open_id" ("mobile"),
    KEY "user_id" ("user_id"),
    CONSTRAINT "tb_user_profile_ibfk_1" FOREIGN KEY ("user_id") REFERENCES "sec_user" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE "tb_wifi_code" (
    "id" bigint NOT NULL AUTO_INCREMENT,
    "code" varchar(255) NOT NULL,
    "feed_user_id" bigint DEFAULT NULL,
    "feed_user_name" varchar(255) DEFAULT NULL,
    "status" SMALLINT NOT NULL DEFAULT '0',
    "create_time" TIMESTAMP NOT NULL,
    "feed_time" TIMESTAMP DEFAULT NULL,
    "order_item_id" bigint DEFAULT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "code" ("code"),
    UNIQUE KEY "order_item_id" ("order_item_id")
);
