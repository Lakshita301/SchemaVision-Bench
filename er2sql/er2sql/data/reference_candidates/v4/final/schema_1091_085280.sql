-- Source: https://github.com/UnisaProject/myExams/blob/dd46368f9791727c947839ebeb44983064c39573/melete/components/src/sql/mysql/melete261.sql?raw=true
-- Tables detected: 11 | FK constraints: 5
CREATE TABLE "melete_cc_license" (
    "REQ_ATTR" SMALLINT NOT NULL default '0',
    "ALLOW_CMRCL" SMALLINT NOT NULL default '0',
    "ALLOW_MOD" int NOT NULL default '0',
    "URL" varchar(100) NOT NULL default '',
    "NAME" varchar(50) NOT NULL default '',
    PRIMARY KEY  ("REQ_ATTR","ALLOW_CMRCL","ALLOW_MOD","URL","NAME")
);

CREATE TABLE "melete_license" (
    "CODE" int NOT NULL default '0',
    "DESCRIPTION" varchar(40) default NULL,
    PRIMARY KEY  ("CODE")
);

CREATE TABLE "melete_module" (
    "MODULE_ID" int NOT NULL default '0',
    "VERSION" int NOT NULL default '0',
    "TITLE" varchar(255) NOT NULL default '',
    "LEARN_OBJ" text,
    "DESCRIPTION" text,
    "KEYWORDS" varchar(250) NOT NULL default '',
    "CREATED_BY_FNAME" varchar(50) NOT NULL default '',
    "CREATED_BY_LNAME" varchar(50) NOT NULL default '',
    "USER_ID" varchar(99) NOT NULL default '',
    "MODIFIED_BY_FNAME" varchar(50) default NULL,
    "MODIFIED_BY_LNAME" varchar(50) default NULL,
    "INSTITUTE" varchar(50) default NULL,
    "WHATS_NEXT" text,
    "CREATION_DATE" TIMESTAMP NOT NULL default '0000-00-00 00:00:00',
    "MODIFICATION_DATE" TIMESTAMP default NULL,
    "SEQ_XML" text,
    PRIMARY KEY  ("MODULE_ID")
);

CREATE TABLE "melete_course_module" (
    "MODULE_ID" int NOT NULL default '0',
    "COURSE_ID" varchar(99) default NULL,
    "SEQ_NO" int NOT NULL default '0',
    "ARCHV_FLAG" SMALLINT default '0',
    "DATE_ARCHIVED" TIMESTAMP default NULL,
    "DELETE_FLAG" SMALLINT default '0',
    PRIMARY KEY  ("MODULE_ID"),
    CONSTRAINT "FK_CMM_MM" FOREIGN KEY("MODULE_ID") REFERENCES "melete_module"("MODULE_ID")
);

CREATE TABLE "melete_module_shdates" (
    "MODULE_ID" int NOT NULL default '0',
    "VERSION" int NOT NULL default '0',
    "START_DATE" TIMESTAMP default NULL,
    "END_DATE" TIMESTAMP default NULL,
    PRIMARY KEY  ("MODULE_ID"),
    CONSTRAINT "FK_MMSH_MM" FOREIGN KEY("MODULE_ID") REFERENCES "melete_module"("MODULE_ID")
);

CREATE TABLE "melete_resource" (
    "RESOURCE_ID" varchar(255) NOT NULL default '',
    "VERSION" int NOT NULL default '0',
    "LICENSE_CODE" int default NULL,
    "CC_LICENSE_URL" varchar(70) default NULL,
    "REQ_ATTR" SMALLINT default NULL,
    "ALLOW_CMRCL" SMALLINT default NULL,
    "ALLOW_MOD" int default NULL,
    "COPYRIGHT_OWNER" varchar(55) default NULL,
    "COPYRIGHT_YEAR" varchar(25) default NULL,
    PRIMARY KEY  ("RESOURCE_ID")
);

CREATE TABLE "melete_section" (
    "SECTION_ID" int NOT NULL default '0',
    "VERSION" int NOT NULL default '0',
    "MODULE_ID" int NOT NULL default '0',
    "TITLE" varchar(255) NOT NULL default '',
    "CREATED_BY_FNAME" varchar(50) NOT NULL default '',
    "CREATED_BY_LNAME" varchar(50) NOT NULL default '',
    "MODIFIED_BY_FNAME" varchar(50) default NULL,
    "MODIFIED_BY_LNAME" varchar(50) default NULL,
    "INSTR" varchar(250) default NULL,
    "CONTENT_TYPE" varchar(10) NOT NULL default '',
    "AUDIO_CONTENT" SMALLINT default NULL,
    "VIDEO_CONTENT" SMALLINT default NULL,
    "TEXTUAL_CONTENT" SMALLINT default NULL,
    "OPEN_WINDOW" SMALLINT default '1',
    "DELETE_FLAG" SMALLINT default '0',
    "CREATION_DATE" TIMESTAMP NOT NULL default '0000-00-00 00:00:00',
    "MODIFICATION_DATE" TIMESTAMP NOT NULL default '0000-00-00 00:00:00',
    PRIMARY KEY("SECTION_ID"),
    CONSTRAINT "FK_MS_MM" FOREIGN KEY("MODULE_ID") REFERENCES "melete_module"("MODULE_ID")
);

CREATE TABLE "melete_section_resource" (
    "SECTION_ID" int NOT NULL default '0',
    "RESOURCE_ID" varchar(255) default NULL,
    PRIMARY KEY ("SECTION_ID"),
    CONSTRAINT "FK_MSR_MR" FOREIGN KEY("RESOURCE_ID") REFERENCES "melete_resource"("RESOURCE_ID"),
    CONSTRAINT "FK_MSR_MS" FOREIGN KEY("SECTION_ID") REFERENCES "melete_section"("SECTION_ID")
);

CREATE TABLE "melete_user_preference" (
    "PREF_ID" int NOT NULL default '0',
    "USER_ID" varchar(99) default NULL,
    "EDITOR_CHOICE" varchar(255) default NULL,
    "EXP_CHOICE" SMALLINT default NULL,
    "LTI_CHOICE" SMALLINT default NULL,
    "LICENSE_CODE" int default NULL,
    "CC_LICENSE_URL" varchar(70) default NULL,
    "REQ_ATTR" SMALLINT default NULL,
    "ALLOW_CMRCL" SMALLINT default NULL,
    "ALLOW_MOD" int default NULL,
    "COPYRIGHT_OWNER" varchar(55) default NULL,
    "COPYRIGHT_YEAR" varchar(25) default NULL,
    PRIMARY KEY  ("PREF_ID")
);

CREATE TABLE "melete_migrate_status" (
    START_FLAG SMALLINT,
    COMPLETE_FLAG SMALLINT
);

CREATE TABLE "melete_site_preference" (
    "PREF_SITE_ID" varchar(99) NOT NULL default '',
    "PRINTABLE" SMALLINT default NULL,
    "AUTONUMBER" SMALLINT default '0',
    PRIMARY KEY ("PREF_SITE_ID")
);
