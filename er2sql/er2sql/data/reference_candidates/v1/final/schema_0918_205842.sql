-- Source: https://github.com/uzura8/flockbird/blob/b0bfd9664fbb30c267d22d420bf641e8b9d5febd/data/sql/test/test_setup.sql?raw=true
-- Tables detected: 36 | FK constraints: 27
CREATE TABLE "admin_user" (
    "id" int NOT NULL AUTO_INCREMENT,
    "username" varchar(50) NOT NULL,
    "password" varchar(255) NOT NULL,
    "group" int NOT NULL,
    "email" varchar(255) NOT NULL,
    "last_login" TIMESTAMP NOT NULL,
    "login_hash" varchar(255) NOT NULL,
    "profile_fields" text NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "username_UNIQUE_idx" ("username"),
    UNIQUE KEY "email_UNIQUE_idx" ("email")
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE "album" (
    "id" int NOT NULL AUTO_INCREMENT,
    "member_id" int NOT NULL,
    "name" text NOT NULL,
    "body" text,
    "public_flag" SMALLINT NOT NULL DEFAULT '0',
    "cover_album_image_id" int DEFAULT NULL,
    "foreign_table" varchar(20) DEFAULT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "created_at_idx" ("created_at"),
    KEY "member_id_created_at_idx" ("member_id","created_at"),
    KEY "public_flag_craeted_at_idx" ("public_flag","created_at"),
    KEY "member_id_foreign_table_idx" ("member_id","foreign_table"),
    KEY "member_id_idx" ("member_id")
);

CREATE TABLE "album_image" (
    "id" int NOT NULL AUTO_INCREMENT,
    "album_id" int NOT NULL,
    "file_id" varchar(255) NOT NULL,
    "name" text,
    "public_flag" SMALLINT NOT NULL DEFAULT '0',
    "comment_count" int NOT NULL DEFAULT '0',
    "shot_at" TIMESTAMP NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    "sort_datetime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "album_id_public_flag_id" ("album_id","public_flag","id"),
    KEY "album_id_public_flag_shot_at" ("album_id","public_flag","shot_at"),
    KEY "sort_datetime_idx" ("sort_datetime"),
    KEY "file_id_idx" ("file_id"),
    CONSTRAINT "album_image_album_id_album_id" FOREIGN KEY ("album_id") REFERENCES "album" ("id") ON DELETE CASCADE
);

CREATE TABLE "album_image_comment" (
    "id" int NOT NULL AUTO_INCREMENT,
    "album_image_id" int NOT NULL,
    "member_id" int DEFAULT NULL,
    "body" text NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "album_image_id_created_at" ("album_image_id","created_at"),
    KEY "album_image_id_idx" ("album_image_id"),
    CONSTRAINT "album_image_comment_album_image_id_album_image_id" FOREIGN KEY ("album_image_id") REFERENCES "album_image" ("id") ON DELETE CASCADE
);

CREATE TABLE "contacts" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(50) NOT NULL,
    "email" varchar(255) NOT NULL,
    "subject" varchar(255) NOT NULL DEFAULT '',
    "body" text NOT NULL,
    "ip" varchar(255) DEFAULT NULL,
    "ua" varchar(255) DEFAULT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "file" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "name" varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'File name',
    "path" varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'File path',
    "type" varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of this file',
    "filesize" int NOT NULL DEFAULT '0' COMMENT 'File size',
    "original_filename" text COLLATE utf8_unicode_ci COMMENT 'Original filename',
    "member_id" int DEFAULT NULL,
    "exif" text COLLATE utf8_unicode_ci,
    "shot_at" TIMESTAMP DEFAULT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name_UNIQUE_idx" ("name"),
    KEY "member_id_idx" ("member_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of files uploaded';

CREATE TABLE "file_tmp" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "name" varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'File name',
    "path" varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'File path',
    "type" varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of this file',
    "filesize" int NOT NULL DEFAULT '0' COMMENT 'File size',
    "original_filename" text COLLATE utf8_unicode_ci COMMENT 'Original filename',
    "member_id" int DEFAULT NULL,
    "user_type" SMALLINT NOT NULL DEFAULT '0' COMMENT '0: site member, 1:admin_user',
    "description" text COLLATE utf8_unicode_ci,
    "exif" text COLLATE utf8_unicode_ci,
    "shot_at" TIMESTAMP DEFAULT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name_UNIQUE_idx" ("name"),
    KEY "name_user_type_member_id_idx" ("name","user_type","member_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves informations of temporary files uploaded';

CREATE TABLE "file_tmp_config" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "file_tmp_id" int NOT NULL COMMENT 'file_tmp id',
    "name" varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
    "value" text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Configuration value',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "file_tmp_id_name_UNIQUE_idx" ("file_tmp_id","name"),
    KEY "file_tmp_id_idx" ("file_tmp_id"),
    CONSTRAINT "file_tmp_config_file_tmp_id_file_tmp_id" FOREIGN KEY ("file_tmp_id") REFERENCES "file_tmp" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of each temporary files';

CREATE TABLE "member" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(255) NOT NULL DEFAULT '',
    "last_login" TIMESTAMP DEFAULT NULL,
    "login_hash" varchar(255) DEFAULT NULL,
    "file_id" varchar(255) DEFAULT NULL,
    "filesize_total" int NOT NULL DEFAULT '0' COMMENT 'Total file size',
    "register_type" SMALLINT NOT NULL DEFAULT '0' COMMENT '0: normal, 1:facebook, 2:twitter, 3:google',
    "sex" varchar(16) DEFAULT NULL,
    "sex_public_flag" SMALLINT NOT NULL DEFAULT '0',
    "birthyear" int DEFAULT NULL,
    "birthyear_public_flag" SMALLINT NOT NULL DEFAULT '0',
    "birthday" varchar(5) DEFAULT NULL,
    "birthday_public_flag" SMALLINT NOT NULL DEFAULT '0',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "birthday_id" ("birthday","id")
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE "member_auth" (
    "id" int NOT NULL AUTO_INCREMENT,
    "member_id" int NOT NULL,
    "email" varchar(255) NOT NULL,
    "password" varchar(255) DEFAULT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "member_id_UNIQUE_idx" ("member_id"),
    UNIQUE KEY "email_UNIQUE_idx" ("email"),
    CONSTRAINT "member_auth_member_id_member_id" FOREIGN KEY ("member_id") REFERENCES "member" ("id") ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

CREATE TABLE "member_config" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "member_id" int NOT NULL COMMENT 'Member id',
    "name" varchar(64) NOT NULL DEFAULT '' COMMENT 'Configuration name',
    "value" text NOT NULL COMMENT 'Configuration value',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "member_id_name_UNIQUE_idx" ("member_id","name"),
    KEY "member_id_idx" ("member_id"),
    CONSTRAINT "member_config_member_id_member_id" FOREIGN KEY ("member_id") REFERENCES "member" ("id") ON DELETE CASCADE
);

CREATE TABLE "member_email_pre" (
    "id" int NOT NULL AUTO_INCREMENT,
    "member_id" int NOT NULL,
    "email" varchar(255) NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "member_id_UNIQUE_idx" ("member_id"),
    UNIQUE KEY "token_UNIQUE_idx" ("token"),
    KEY "email_idx" ("email"),
    CONSTRAINT "member_email_pre_member_id_member_id" FOREIGN KEY ("member_id") REFERENCES "member" ("id") ON DELETE CASCADE
);

CREATE TABLE "member_follow_timeline" (
    "id" int NOT NULL AUTO_INCREMENT,
    "member_id" int NOT NULL,
    "timeline_id" int NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "member_id_timeline_id_UNIQUE_idx" ("member_id","timeline_id"),
    KEY "member_follow_timeline_timeline_id_timeline_id" ("timeline_id"),
    CONSTRAINT "member_follow_timeline_member_id_timeline_id" FOREIGN KEY ("member_id") REFERENCES "member" ("id") ON DELETE CASCADE,
    CONSTRAINT "member_follow_timeline_timeline_id_timeline_id" FOREIGN KEY ("timeline_id") REFERENCES "timeline" ("id") ON DELETE CASCADE
);

CREATE TABLE "member_oauth" (
    "id" int NOT NULL AUTO_INCREMENT,
    "member_id" int NOT NULL,
    "oauth_provider_id" SMALLINT NOT NULL,
    "uid" varchar(50) NOT NULL,
    "token" varchar(255) NOT NULL,
    "secret" varchar(255) DEFAULT NULL,
    "expires" int DEFAULT NULL,
    "service_name" varchar(255) DEFAULT NULL,
    "service_url" varchar(255) DEFAULT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "oauth_provider_id_uid_idx" ("oauth_provider_id","uid"),
    KEY "oauth_provider_id_uid_member_idx" ("oauth_provider_id","uid","member_id"),
    KEY "member_oauth_member_id_member_id" ("member_id"),
    CONSTRAINT "member_oauth_member_id_member_id" FOREIGN KEY ("member_id") REFERENCES "member" ("id") ON DELETE CASCADE,
    CONSTRAINT "oauth_provider_id_oauth_provider_id" FOREIGN KEY ("oauth_provider_id") REFERENCES "oauth_provider" ("id") ON DELETE CASCADE
);

CREATE TABLE "member_password_pre" (
    "id" int NOT NULL AUTO_INCREMENT,
    "member_id" int NOT NULL,
    "email" varchar(255) NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "member_id_UNIQUE_idx" ("member_id"),
    UNIQUE KEY "token_UNIQUE_idx" ("token"),
    CONSTRAINT "member_password_pre_member_id_member_id" FOREIGN KEY ("member_id") REFERENCES "member" ("id") ON DELETE CASCADE
);

CREATE TABLE "member_pre" (
    "id" int NOT NULL AUTO_INCREMENT,
    "name" varchar(255) DEFAULT NULL,
    "email" varchar(255) NOT NULL,
    "password" varchar(255) NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "token_UNIQUE_idx" ("token")
);

CREATE TABLE "member_profile" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "member_id" int NOT NULL COMMENT 'Member id',
    "profile_id" int NOT NULL COMMENT 'Profile id',
    "profile_option_id" int DEFAULT NULL COMMENT 'Profile option id',
    "value" text NOT NULL COMMENT 'Text content for this profile item',
    "public_flag" SMALLINT DEFAULT NULL COMMENT 'Public flag',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "member_id_idx" ("member_id"),
    KEY "profile_id_idx" ("profile_id"),
    KEY "profile_option_id_idx" ("profile_option_id"),
    CONSTRAINT "member_profile_member_id_member_id" FOREIGN KEY ("member_id") REFERENCES "member" ("id") ON DELETE CASCADE,
    CONSTRAINT "member_profile_profile_id_profile_id" FOREIGN KEY ("profile_id") REFERENCES "profile" ("id") ON DELETE CASCADE,
    CONSTRAINT "member_profile_profile_option_id_profile_option_id" FOREIGN KEY ("profile_option_id") REFERENCES "profile_option" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Saves informations of every member''''s profile';

CREATE TABLE "member_relation" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "member_id_to" int NOT NULL COMMENT 'Target member id',
    "member_id_from" int NOT NULL COMMENT 'Subject member id',
    "is_follow" SMALLINT DEFAULT NULL COMMENT 'The subject member is followed the target',
    "is_friend" SMALLINT DEFAULT NULL COMMENT 'The members are friends',
    "is_friend_pre" SMALLINT DEFAULT NULL COMMENT 'The members are going to be friends',
    "is_access_block" SMALLINT DEFAULT NULL COMMENT 'The subject member is blocked the target',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "member_id_to_from_UNIQUE_idx" ("member_id_to","member_id_from"),
    UNIQUE KEY "member_id_from_to_UNIQUE_idx" ("member_id_from","member_id_to"),
    KEY "member_id_to_idx" ("member_id_to"),
    KEY "member_id_from_idx" ("member_id_from"),
    CONSTRAINT "member_relationship_member_id_from_member_id" FOREIGN KEY ("member_id_from") REFERENCES "member" ("id") ON DELETE CASCADE,
    CONSTRAINT "member_relationship_member_id_to_member_id" FOREIGN KEY ("member_id_to") REFERENCES "member" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Saves ralationships of each members';

CREATE TABLE "migration" (
    "name" varchar(50) NOT NULL,
    "type" varchar(25) NOT NULL,
    "version" int NOT NULL DEFAULT '0'
);

CREATE TABLE "news" (
    "id" int NOT NULL AUTO_INCREMENT,
    "news_category_id" int DEFAULT NULL COMMENT 'News category id',
    "slug" varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Identified news (ASCII)',
    "title" text NOT NULL,
    "body" text NOT NULL,
    "importance_level" SMALLINT NOT NULL DEFAULT '0',
    "is_published" SMALLINT NOT NULL DEFAULT '0',
    "published_at" TIMESTAMP DEFAULT NULL,
    "users_id" int NOT NULL,
    "token" varchar(255) NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "slug_UNIQUE_idx" ("slug"),
    KEY "created_at_idx" ("created_at"),
    KEY "published_at_idx" ("published_at"),
    KEY "is_published_published_at_idx" ("is_published","published_at")
);

CREATE TABLE "news_category" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "name" varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Identified news category name (ASCII)',
    "label" text NOT NULL,
    "sort_order" int DEFAULT NULL COMMENT 'Order to sort',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name_UNIQUE_idx" ("name"),
    KEY "sort_order_idx" ("sort_order")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Saves categories of news';

CREATE TABLE "news_file" (
    "id" int NOT NULL AUTO_INCREMENT,
    "news_id" int NOT NULL,
    "file_id" varchar(255) NOT NULL,
    "name" text,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "news_id_created_at" ("news_id","created_at"),
    KEY "news_id_idx" ("news_id"),
    KEY "file_id_idx" ("file_id"),
    CONSTRAINT "news_file_news_id_news_id" FOREIGN KEY ("news_id") REFERENCES "news" ("id") ON DELETE CASCADE
);

CREATE TABLE "news_image" (
    "id" int NOT NULL AUTO_INCREMENT,
    "news_id" int NOT NULL,
    "file_id" varchar(255) NOT NULL,
    "name" text,
    "shot_at" TIMESTAMP NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "news_id_created_at" ("news_id","created_at"),
    KEY "news_id_idx" ("news_id"),
    KEY "file_id_idx" ("file_id"),
    CONSTRAINT "news_image_news_id_news_id" FOREIGN KEY ("news_id") REFERENCES "news" ("id") ON DELETE CASCADE
);

CREATE TABLE "news_link" (
    "id" int NOT NULL AUTO_INCREMENT,
    "news_id" int NOT NULL,
    "uri" text NOT NULL,
    "label" text,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "news_id_idx" ("news_id"),
    CONSTRAINT "news_link_news_id_news_id" FOREIGN KEY ("news_id") REFERENCES "news" ("id") ON DELETE CASCADE
);

CREATE TABLE "note" (
    "id" int NOT NULL AUTO_INCREMENT,
    "member_id" int NOT NULL,
    "title" text NOT NULL,
    "body" text NOT NULL,
    "public_flag" SMALLINT NOT NULL DEFAULT '0',
    "is_published" SMALLINT NOT NULL DEFAULT '0',
    "published_at" TIMESTAMP DEFAULT NULL,
    "comment_count" int NOT NULL DEFAULT '0',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    "sort_datetime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "published_at_idx" ("published_at"),
    KEY "member_id_is_published_published_at_public_flag_idx" ("member_id","is_published","published_at","public_flag"),
    KEY "member_id_created_at_idx" ("member_id","created_at"),
    KEY "public_flag_craeted_at_idx" ("public_flag","created_at"),
    KEY "is_published_published_at_public_flag_idx" ("is_published","published_at","public_flag")
);

CREATE TABLE "note_album_image" (
    "id" int NOT NULL AUTO_INCREMENT,
    "note_id" int NOT NULL,
    "album_image_id" int NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "note_id_idx" ("note_id"),
    KEY "note_album_image_album_image_id_album_image_id" ("album_image_id"),
    CONSTRAINT "note_album_image_note_id_note_id" FOREIGN KEY ("note_id") REFERENCES "note" ("id") ON DELETE CASCADE,
    CONSTRAINT "note_album_image_album_image_id_album_image_id" FOREIGN KEY ("album_image_id") REFERENCES "album_image" ("id") ON DELETE CASCADE
);

CREATE TABLE "note_comment" (
    "id" int NOT NULL AUTO_INCREMENT,
    "note_id" int NOT NULL,
    "member_id" int DEFAULT NULL,
    "body" text NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "note_id_created_at" ("note_id","created_at"),
    KEY "note_id_idx" ("note_id"),
    KEY "member_id_idx" ("member_id"),
    CONSTRAINT "note_comment_note_id_note_id" FOREIGN KEY ("note_id") REFERENCES "note" ("id") ON DELETE CASCADE
);

CREATE TABLE "oauth_provider" (
    "id" SMALLINT NOT NULL AUTO_INCREMENT,
    "name" varchar(50) NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name_UNIQUE_idx" ("name")
);

CREATE TABLE "posts" (
    "id" int NOT NULL AUTO_INCREMENT,
    "title" varchar(255) NOT NULL,
    "slug" varchar(255) NOT NULL,
    "summary" text NOT NULL,
    "body" text NOT NULL,
    "user_id" int NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "profile" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "name" varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Identified profile name (ASCII)',
    "caption" text NOT NULL,
    "display_type" SMALLINT NOT NULL DEFAULT '0' COMMENT '0: display at detail, 2:display at summary, 3:always',
    "information" text,
    "placeholder" text,
    "is_required" SMALLINT NOT NULL DEFAULT '0' COMMENT 'This is a required',
    "is_unique" SMALLINT NOT NULL DEFAULT '0' COMMENT 'Cannot select duplicate item',
    "is_edit_public_flag" SMALLINT NOT NULL DEFAULT '0' COMMENT 'Settable public flag',
    "default_public_flag" SMALLINT NOT NULL DEFAULT '1' COMMENT 'Default of public flag',
    "is_disp_regist" SMALLINT NOT NULL DEFAULT '0' COMMENT 'Shows when registeration',
    "is_disp_config" SMALLINT NOT NULL DEFAULT '0' COMMENT 'Shows when edit',
    "is_disp_search" SMALLINT NOT NULL DEFAULT '0' COMMENT 'Shows when searching',
    "form_type" varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Form type to input/select',
    "value_type" varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Type of input value',
    "value_regexp" text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT 'Regular expression',
    "value_min" varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Minimum value',
    "value_max" varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Maximum value',
    "sort_order" int DEFAULT NULL COMMENT 'Order to sort',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    UNIQUE KEY "name_UNIQUE_idx" ("name"),
    KEY "display_type_id" ("display_type","id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Saves input/select items for the member profile';

CREATE TABLE "profile_option" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "label" text NOT NULL COMMENT 'Choice',
    "profile_id" int NOT NULL COMMENT 'Profile id',
    "sort_order" int DEFAULT NULL COMMENT 'Order to sort',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "profile_id_idx" ("profile_id"),
    CONSTRAINT "profile_option_profile_id_profile_id" FOREIGN KEY ("profile_id") REFERENCES "profile" ("id") ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Saves options of profile items';

CREATE TABLE "site_config" (
    "id" int NOT NULL AUTO_INCREMENT COMMENT 'Serial number',
    "name" varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'Configuration name',
    "value" text COLLATE utf8_unicode_ci COMMENT 'Configuration value',
    PRIMARY KEY ("id"),
    UNIQUE KEY "name_UNIQUE_idx" ("name")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Saves configurations of this site';

CREATE TABLE "timeline" (
    "id" int NOT NULL AUTO_INCREMENT,
    "member_id" int DEFAULT NULL,
    "member_id_to" int DEFAULT NULL,
    "group_id" int DEFAULT NULL,
    "page_id" int DEFAULT NULL,
    "type" SMALLINT NOT NULL DEFAULT '0',
    "body" text,
    "foreign_table" varchar(20) DEFAULT NULL COMMENT 'Reference table name',
    "foreign_id" int DEFAULT NULL COMMENT 'The id of reference table',
    "source" varchar(64) DEFAULT NULL COMMENT 'The source caption',
    "source_uri" text COMMENT 'The source URI',
    "public_flag" SMALLINT NOT NULL DEFAULT '0',
    "comment_count" int NOT NULL DEFAULT '0',
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    "sort_datetime" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "member_id_idx" ("member_id"),
    KEY "group_id_idx" ("group_id"),
    KEY "page_id_idx" ("page_id"),
    KEY "foreign_table_foreign_id_type_idx" ("foreign_table","foreign_id","type"),
    CONSTRAINT "timeline_member_id_member_id" FOREIGN KEY ("member_id") REFERENCES "member" ("id") ON DELETE CASCADE
);

CREATE TABLE "timeline_cache" (
    "id" int NOT NULL AUTO_INCREMENT,
    "timeline_id" int NOT NULL,
    "member_id" int DEFAULT NULL,
    "member_id_to" int DEFAULT NULL,
    "group_id" int DEFAULT NULL,
    "page_id" int DEFAULT NULL,
    "is_follow" SMALLINT NOT NULL DEFAULT '0',
    "public_flag" SMALLINT NOT NULL DEFAULT '0',
    "type" SMALLINT NOT NULL DEFAULT '0',
    "comment_count" int NOT NULL DEFAULT '0',
    PRIMARY KEY ("id"),
    UNIQUE KEY "timeline_id_is_follow_UNIQUE_idx" ("timeline_id","is_follow"),
    KEY "timeline_id_idx" ("timeline_id"),
    CONSTRAINT "timeline_cache_timeline_id_timeline_id" FOREIGN KEY ("timeline_id") REFERENCES "timeline" ("id") ON DELETE CASCADE
);

CREATE TABLE "timeline_child_data" (
    "id" int NOT NULL AUTO_INCREMENT,
    "timeline_id" int NOT NULL,
    "foreign_table" varchar(20) DEFAULT NULL COMMENT 'Reference table name',
    "foreign_id" int DEFAULT NULL COMMENT 'The id of reference table',
    PRIMARY KEY ("id"),
    KEY "timeline_id_idx" ("timeline_id"),
    KEY "foreign_table_foreign_id_timeline_id_idx" ("foreign_table","foreign_id","timeline_id"),
    CONSTRAINT "timeline_child_data_timeline_id_timeline_id" FOREIGN KEY ("timeline_id") REFERENCES "timeline" ("id") ON DELETE CASCADE
);

CREATE TABLE "timeline_comment" (
    "id" int NOT NULL AUTO_INCREMENT,
    "timeline_id" int NOT NULL,
    "member_id" int DEFAULT NULL,
    "body" text NOT NULL,
    "created_at" TIMESTAMP NOT NULL,
    "updated_at" TIMESTAMP NOT NULL,
    PRIMARY KEY ("id"),
    KEY "timeline_id_created_at" ("timeline_id","created_at"),
    CONSTRAINT "timeline_comment_timeline_id_timeline_id" FOREIGN KEY ("timeline_id") REFERENCES "timeline" ("id") ON DELETE CASCADE
);
