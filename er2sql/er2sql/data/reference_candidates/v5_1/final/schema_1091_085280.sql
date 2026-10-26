-- Source: https://github.com/UnisaProject/myExams/blob/dd46368f9791727c947839ebeb44983064c39573/melete/components/src/sql/mysql/melete261.sql?raw=true
-- Tables detected: 11 | FK constraints: 5
CREATE TABLE melete_cc_license (
    req_attr SMALLINT NOT NULL default '0',
    allow_cmrcl SMALLINT NOT NULL default '0',
    allow_mod int NOT NULL default '0',
    url varchar(100) NOT NULL default '',
    name varchar(50) NOT NULL default '',
    PRIMARY KEY  (req_attr,allow_cmrcl,allow_mod,url,name)
);

CREATE TABLE melete_license (
    code int NOT NULL default '0',
    description varchar(40) default NULL,
    PRIMARY KEY  (code)
);

CREATE TABLE melete_module (
    module_id int NOT NULL default '0',
    version int NOT NULL default '0',
    title varchar(255) NOT NULL default '',
    learn_obj text,
    description text,
    keywords varchar(250) NOT NULL default '',
    created_by_fname varchar(50) NOT NULL default '',
    created_by_lname varchar(50) NOT NULL default '',
    user_id varchar(99) NOT NULL default '',
    modified_by_fname varchar(50) default NULL,
    modified_by_lname varchar(50) default NULL,
    institute varchar(50) default NULL,
    whats_next text,
    creation_date TIMESTAMP NOT NULL ,
    modification_date TIMESTAMP default NULL,
    seq_xml text,
    PRIMARY KEY  (module_id)
);

CREATE TABLE melete_course_module (
    module_id int NOT NULL default '0',
    course_id varchar(99) default NULL,
    seq_no int NOT NULL default '0',
    archv_flag SMALLINT default '0',
    date_archived TIMESTAMP default NULL,
    delete_flag SMALLINT default '0',
    PRIMARY KEY  (module_id),
    CONSTRAINT fk_cmm_mm FOREIGN KEY(module_id) REFERENCES melete_module(module_id)
);

CREATE TABLE melete_module_shdates (
    module_id int NOT NULL default '0',
    version int NOT NULL default '0',
    start_date TIMESTAMP default NULL,
    end_date TIMESTAMP default NULL,
    PRIMARY KEY  (module_id),
    CONSTRAINT fk_mmsh_mm FOREIGN KEY(module_id) REFERENCES melete_module(module_id)
);

CREATE TABLE melete_resource (
    resource_id varchar(255) NOT NULL default '',
    version int NOT NULL default '0',
    license_code int default NULL,
    cc_license_url varchar(70) default NULL,
    req_attr SMALLINT default NULL,
    allow_cmrcl SMALLINT default NULL,
    allow_mod int default NULL,
    copyright_owner varchar(55) default NULL,
    copyright_year varchar(25) default NULL,
    PRIMARY KEY  (resource_id)
);

CREATE TABLE melete_section (
    section_id int NOT NULL default '0',
    version int NOT NULL default '0',
    module_id int NOT NULL default '0',
    title varchar(255) NOT NULL default '',
    created_by_fname varchar(50) NOT NULL default '',
    created_by_lname varchar(50) NOT NULL default '',
    modified_by_fname varchar(50) default NULL,
    modified_by_lname varchar(50) default NULL,
    instr varchar(250) default NULL,
    content_type varchar(10) NOT NULL default '',
    audio_content SMALLINT default NULL,
    video_content SMALLINT default NULL,
    textual_content SMALLINT default NULL,
    open_window SMALLINT default '1',
    delete_flag SMALLINT default '0',
    creation_date TIMESTAMP NOT NULL ,
    modification_date TIMESTAMP NOT NULL ,
    PRIMARY KEY(section_id),
    CONSTRAINT fk_ms_mm FOREIGN KEY(module_id) REFERENCES melete_module(module_id)
);

CREATE TABLE melete_section_resource (
    section_id int NOT NULL default '0',
    resource_id varchar(255) default NULL,
    PRIMARY KEY (section_id),
    CONSTRAINT fk_msr_mr FOREIGN KEY(resource_id) REFERENCES melete_resource(resource_id),
    CONSTRAINT fk_msr_ms FOREIGN KEY(section_id) REFERENCES melete_section(section_id)
);

CREATE TABLE melete_user_preference (
    pref_id int NOT NULL default '0',
    user_id varchar(99) default NULL,
    editor_choice varchar(255) default NULL,
    exp_choice SMALLINT default NULL,
    lti_choice SMALLINT default NULL,
    license_code int default NULL,
    cc_license_url varchar(70) default NULL,
    req_attr SMALLINT default NULL,
    allow_cmrcl SMALLINT default NULL,
    allow_mod int default NULL,
    copyright_owner varchar(55) default NULL,
    copyright_year varchar(25) default NULL,
    PRIMARY KEY  (pref_id)
);

CREATE TABLE melete_migrate_status (
    START_FLAG SMALLINT,
    COMPLETE_FLAG SMALLINT
);

CREATE TABLE melete_site_preference (
    pref_site_id varchar(99) NOT NULL default '',
    printable SMALLINT default NULL,
    autonumber SMALLINT default '0',
    PRIMARY KEY (pref_site_id)
);
