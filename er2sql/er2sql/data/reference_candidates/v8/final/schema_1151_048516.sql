-- Source: https://github.com/wangminli/jeesite/blob/3d967fb83583fd6f05f19091d01fbc74435c18ee/db/jeesite_mysql.sql?raw=true
-- Tables detected: 53 | FK constraints: 21
CREATE TABLE act_ge_bytearray (
    id_ varchar(64) NOT NULL DEFAULT '',
    rev_ int DEFAULT NULL,
    name_ varchar(255) DEFAULT NULL,
    deployment_id_ varchar(64) DEFAULT NULL,
    bytes_ BYTEA,
    generated_ SMALLINT DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_ge_property (
    name_ varchar(64) NOT NULL DEFAULT '',
    value_ varchar(300) DEFAULT NULL,
    rev_ int DEFAULT NULL,
    PRIMARY KEY (name_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_hi_attachment (
    id_ varchar(64) NOT NULL,
    rev_ int DEFAULT NULL,
    user_id_ varchar(255) DEFAULT NULL,
    name_ varchar(255) DEFAULT NULL,
    description_ varchar(4000) DEFAULT NULL,
    type_ varchar(255) DEFAULT NULL,
    task_id_ varchar(64) DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    url_ varchar(4000) DEFAULT NULL,
    content_id_ varchar(64) DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_hi_comment (
    id_ varchar(64) NOT NULL,
    type_ varchar(255) DEFAULT NULL,
    time_ TIMESTAMP NOT NULL,
    user_id_ varchar(255) DEFAULT NULL,
    task_id_ varchar(64) DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    action_ varchar(255) DEFAULT NULL,
    message_ varchar(4000) DEFAULT NULL,
    full_msg_ BYTEA,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_hi_taskinst (
    id_ varchar(64) NOT NULL,
    proc_def_id_ varchar(64) DEFAULT NULL,
    task_def_key_ varchar(255) DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    execution_id_ varchar(64) DEFAULT NULL,
    name_ varchar(255) DEFAULT NULL,
    parent_task_id_ varchar(64) DEFAULT NULL,
    description_ varchar(4000) DEFAULT NULL,
    owner_ varchar(255) DEFAULT NULL,
    assignee_ varchar(255) DEFAULT NULL,
    start_time_ TIMESTAMP NOT NULL,
    claim_time_ TIMESTAMP DEFAULT NULL,
    end_time_ TIMESTAMP DEFAULT NULL,
    duration_ bigint DEFAULT NULL,
    delete_reason_ varchar(4000) DEFAULT NULL,
    priority_ int DEFAULT NULL,
    due_date_ TIMESTAMP DEFAULT NULL,
    form_key_ varchar(255) DEFAULT NULL,
    category_ varchar(255) DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_id_group (
    id_ varchar(64) NOT NULL DEFAULT '',
    rev_ int DEFAULT NULL,
    name_ varchar(255) DEFAULT NULL,
    type_ varchar(255) DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_id_info (
    id_ varchar(64) NOT NULL DEFAULT '',
    rev_ int DEFAULT NULL,
    user_id_ varchar(64) DEFAULT NULL,
    type_ varchar(64) DEFAULT NULL,
    key_ varchar(255) DEFAULT NULL,
    value_ varchar(255) DEFAULT NULL,
    password_ BYTEA,
    parent_id_ varchar(255) DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_id_membership (
    user_id_ varchar(64) NOT NULL DEFAULT '',
    group_id_ varchar(64) NOT NULL DEFAULT '',
    PRIMARY KEY (user_id_,group_id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_id_user (
    id_ varchar(64) NOT NULL DEFAULT '',
    rev_ int DEFAULT NULL,
    first_ varchar(255) DEFAULT NULL,
    last_ varchar(255) DEFAULT NULL,
    email_ varchar(255) DEFAULT NULL,
    pwd_ varchar(255) DEFAULT NULL,
    picture_id_ varchar(64) DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_re_deployment (
    id_ varchar(64) NOT NULL DEFAULT '',
    name_ varchar(255) DEFAULT NULL,
    category_ varchar(255) DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    deploy_time_ timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_re_model (
    id_ varchar(64) NOT NULL,
    rev_ int DEFAULT NULL,
    name_ varchar(255) DEFAULT NULL,
    key_ varchar(255) DEFAULT NULL,
    category_ varchar(255) DEFAULT NULL,
    create_time_ timestamp NULL DEFAULT NULL,
    last_update_time_ timestamp NULL DEFAULT NULL,
    version_ int DEFAULT NULL,
    meta_info_ varchar(4000) DEFAULT NULL,
    deployment_id_ varchar(64) DEFAULT NULL,
    editor_source_value_id_ varchar(64) DEFAULT NULL,
    editor_source_extra_value_id_ varchar(64) DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_re_procdef (
    id_ varchar(64) NOT NULL,
    rev_ int DEFAULT NULL,
    category_ varchar(255) DEFAULT NULL,
    name_ varchar(255) DEFAULT NULL,
    key_ varchar(255) NOT NULL,
    version_ int NOT NULL,
    deployment_id_ varchar(64) DEFAULT NULL,
    resource_name_ varchar(4000) DEFAULT NULL,
    dgrm_resource_name_ varchar(4000) DEFAULT NULL,
    description_ varchar(4000) DEFAULT NULL,
    has_start_form_key_ SMALLINT DEFAULT NULL,
    suspension_state_ int DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_),
    CONSTRAINT act_uniq_procdef UNIQUE (key_,version_,tenant_id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_ru_event_subscr (
    id_ varchar(64) NOT NULL,
    rev_ int DEFAULT NULL,
    event_type_ varchar(255) NOT NULL,
    event_name_ varchar(255) DEFAULT NULL,
    execution_id_ varchar(64) DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    activity_id_ varchar(64) DEFAULT NULL,
    configuration_ varchar(255) DEFAULT NULL,
    created_ timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    proc_def_id_ varchar(64) DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_ru_execution (
    id_ varchar(64) NOT NULL DEFAULT '',
    rev_ int DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    business_key_ varchar(255) DEFAULT NULL,
    parent_id_ varchar(64) DEFAULT NULL,
    proc_def_id_ varchar(64) DEFAULT NULL,
    super_exec_ varchar(64) DEFAULT NULL,
    act_id_ varchar(255) DEFAULT NULL,
    is_active_ SMALLINT DEFAULT NULL,
    is_concurrent_ SMALLINT DEFAULT NULL,
    is_scope_ SMALLINT DEFAULT NULL,
    is_event_scope_ SMALLINT DEFAULT NULL,
    suspension_state_ int DEFAULT NULL,
    cached_ent_state_ int DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_ru_identitylink (
    id_ varchar(64) NOT NULL DEFAULT '',
    rev_ int DEFAULT NULL,
    group_id_ varchar(255) DEFAULT NULL,
    type_ varchar(255) DEFAULT NULL,
    user_id_ varchar(255) DEFAULT NULL,
    task_id_ varchar(64) DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    proc_def_id_ varchar(64) DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_ru_job (
    id_ varchar(64) NOT NULL,
    rev_ int DEFAULT NULL,
    type_ varchar(255) NOT NULL,
    lock_exp_time_ timestamp NULL DEFAULT NULL,
    lock_owner_ varchar(255) DEFAULT NULL,
    exclusive_ SMALLINT DEFAULT NULL,
    execution_id_ varchar(64) DEFAULT NULL,
    process_instance_id_ varchar(64) DEFAULT NULL,
    proc_def_id_ varchar(64) DEFAULT NULL,
    retries_ int DEFAULT NULL,
    exception_stack_id_ varchar(64) DEFAULT NULL,
    exception_msg_ varchar(4000) DEFAULT NULL,
    duedate_ timestamp NULL DEFAULT NULL,
    repeat_ varchar(255) DEFAULT NULL,
    handler_type_ varchar(255) DEFAULT NULL,
    handler_cfg_ varchar(4000) DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_ru_task (
    id_ varchar(64) NOT NULL DEFAULT '',
    rev_ int DEFAULT NULL,
    execution_id_ varchar(64) DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    proc_def_id_ varchar(64) DEFAULT NULL,
    name_ varchar(255) DEFAULT NULL,
    parent_task_id_ varchar(64) DEFAULT NULL,
    description_ varchar(4000) DEFAULT NULL,
    task_def_key_ varchar(255) DEFAULT NULL,
    owner_ varchar(255) DEFAULT NULL,
    assignee_ varchar(255) DEFAULT NULL,
    delegation_ varchar(64) DEFAULT NULL,
    priority_ int DEFAULT NULL,
    create_time_ timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    due_date_ TIMESTAMP DEFAULT NULL,
    category_ varchar(255) DEFAULT NULL,
    suspension_state_ int DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_ru_variable (
    id_ varchar(64) NOT NULL,
    rev_ int DEFAULT NULL,
    type_ varchar(255) NOT NULL,
    name_ varchar(255) NOT NULL,
    execution_id_ varchar(64) DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    task_id_ varchar(64) DEFAULT NULL,
    bytearray_id_ varchar(64) DEFAULT NULL,
    double_ DOUBLE PRECISION DEFAULT NULL,
    long_ bigint DEFAULT NULL,
    text_ varchar(4000) DEFAULT NULL,
    text2_ varchar(4000) DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_hi_actinst (
    id_ varchar(64) NOT NULL,
    proc_def_id_ varchar(64) NOT NULL,
    proc_inst_id_ varchar(64) NOT NULL,
    execution_id_ varchar(64) NOT NULL,
    act_id_ varchar(255) NOT NULL,
    task_id_ varchar(64) DEFAULT NULL,
    call_proc_inst_id_ varchar(64) DEFAULT NULL,
    act_name_ varchar(255) DEFAULT NULL,
    act_type_ varchar(255) NOT NULL,
    assignee_ varchar(255) DEFAULT NULL,
    start_time_ TIMESTAMP NOT NULL,
    end_time_ TIMESTAMP DEFAULT NULL,
    duration_ bigint DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_hi_detail (
    id_ varchar(64) NOT NULL,
    type_ varchar(255) NOT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    execution_id_ varchar(64) DEFAULT NULL,
    task_id_ varchar(64) DEFAULT NULL,
    act_inst_id_ varchar(64) DEFAULT NULL,
    name_ varchar(255) NOT NULL,
    var_type_ varchar(255) DEFAULT NULL,
    rev_ int DEFAULT NULL,
    time_ TIMESTAMP NOT NULL,
    bytearray_id_ varchar(64) DEFAULT NULL,
    double_ DOUBLE PRECISION DEFAULT NULL,
    long_ bigint DEFAULT NULL,
    text_ varchar(4000) DEFAULT NULL,
    text2_ varchar(4000) DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_hi_identitylink (
    id_ varchar(64) NOT NULL DEFAULT '',
    group_id_ varchar(255) DEFAULT NULL,
    type_ varchar(255) DEFAULT NULL,
    user_id_ varchar(255) DEFAULT NULL,
    task_id_ varchar(64) DEFAULT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_hi_procinst (
    id_ varchar(64) NOT NULL,
    proc_inst_id_ varchar(64) NOT NULL,
    business_key_ varchar(255) DEFAULT NULL,
    proc_def_id_ varchar(64) NOT NULL,
    start_time_ TIMESTAMP NOT NULL,
    end_time_ TIMESTAMP DEFAULT NULL,
    duration_ bigint DEFAULT NULL,
    start_user_id_ varchar(255) DEFAULT NULL,
    start_act_id_ varchar(255) DEFAULT NULL,
    end_act_id_ varchar(255) DEFAULT NULL,
    super_process_instance_id_ varchar(64) DEFAULT NULL,
    delete_reason_ varchar(4000) DEFAULT NULL,
    tenant_id_ varchar(255) DEFAULT '',
    PRIMARY KEY (id_),
    CONSTRAINT proc_inst_id_ UNIQUE (proc_inst_id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE act_hi_varinst (
    id_ varchar(64) NOT NULL,
    proc_inst_id_ varchar(64) DEFAULT NULL,
    execution_id_ varchar(64) DEFAULT NULL,
    task_id_ varchar(64) DEFAULT NULL,
    name_ varchar(255) NOT NULL,
    var_type_ varchar(100) DEFAULT NULL,
    rev_ int DEFAULT NULL,
    bytearray_id_ varchar(64) DEFAULT NULL,
    double_ DOUBLE PRECISION DEFAULT NULL,
    long_ bigint DEFAULT NULL,
    text_ varchar(4000) DEFAULT NULL,
    text2_ varchar(4000) DEFAULT NULL,
    create_time_ TIMESTAMP DEFAULT NULL,
    last_updated_time_ TIMESTAMP DEFAULT NULL,
    PRIMARY KEY (id_)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

CREATE TABLE cms_article (
    id varchar(64) NOT NULL,
    category_id varchar(64) NOT NULL,
    title varchar(255) NOT NULL,
    link varchar(255) DEFAULT NULL,
    color varchar(50) DEFAULT NULL,
    image varchar(255) DEFAULT NULL,
    keywords varchar(255) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    weight int DEFAULT '0',
    weight_date TIMESTAMP DEFAULT NULL,
    hits int DEFAULT '0',
    posid varchar(10) DEFAULT NULL,
    custom_content_view varchar(255) DEFAULT NULL,
    view_config text,
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    update_by varchar(64) DEFAULT NULL,
    update_date TIMESTAMP DEFAULT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE cms_article_data (
    id varchar(64) NOT NULL,
    "content" text,
    copyfrom varchar(255) DEFAULT NULL,
    relation varchar(255) DEFAULT NULL,
    allow_comment char(1) DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE cms_category (
    id varchar(64) NOT NULL,
    parent_id varchar(64) NOT NULL,
    parent_ids varchar(2000) NOT NULL,
    site_id varchar(64) DEFAULT '1',
    "office_id" varchar(64) DEFAULT NULL,
    module varchar(20) DEFAULT NULL,
    name varchar(100) NOT NULL,
    image varchar(255) DEFAULT NULL,
    href varchar(255) DEFAULT NULL,
    target varchar(20) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    keywords varchar(255) DEFAULT NULL,
    sort int DEFAULT '30',
    in_menu char(1) DEFAULT '1',
    in_list char(1) DEFAULT '1',
    show_modes char(1) DEFAULT '0',
    allow_comment char(1) DEFAULT NULL,
    is_audit char(1) DEFAULT NULL,
    custom_list_view varchar(255) DEFAULT NULL,
    custom_content_view varchar(255) DEFAULT NULL,
    view_config text,
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    update_by varchar(64) DEFAULT NULL,
    update_date TIMESTAMP DEFAULT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE cms_comment (
    id varchar(64) NOT NULL,
    category_id varchar(64) NOT NULL,
    content_id varchar(64) NOT NULL,
    title varchar(255) DEFAULT NULL,
    "content" varchar(255) DEFAULT NULL,
    name varchar(100) DEFAULT NULL,
    ip varchar(100) DEFAULT NULL,
    create_date TIMESTAMP NOT NULL,
    audit_user_id varchar(64) DEFAULT NULL,
    audit_date TIMESTAMP DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE cms_guestbook (
    id varchar(64) NOT NULL,
    type char(1) NOT NULL,
    "content" varchar(255) NOT NULL,
    name varchar(100) NOT NULL,
    email varchar(100) NOT NULL,
    phone varchar(100) NOT NULL,
    workunit varchar(100) NOT NULL,
    ip varchar(100) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    re_user_id varchar(64) DEFAULT NULL,
    re_date TIMESTAMP DEFAULT NULL,
    re_content varchar(100) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE cms_link (
    id varchar(64) NOT NULL,
    category_id varchar(64) NOT NULL,
    title varchar(255) NOT NULL,
    color varchar(50) DEFAULT NULL,
    image varchar(255) DEFAULT NULL,
    href varchar(255) DEFAULT NULL,
    weight int DEFAULT '0',
    weight_date TIMESTAMP DEFAULT NULL,
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    update_by varchar(64) DEFAULT NULL,
    update_date TIMESTAMP DEFAULT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE cms_site (
    id varchar(64) NOT NULL,
    name varchar(100) NOT NULL,
    title varchar(100) NOT NULL,
    logo varchar(255) DEFAULT NULL,
    domain varchar(255) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    keywords varchar(255) DEFAULT NULL,
    theme varchar(255) DEFAULT 'default',
    copyright text,
    custom_index_view varchar(255) DEFAULT NULL,
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    update_by varchar(64) DEFAULT NULL,
    update_date TIMESTAMP DEFAULT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE gen_scheme (
    id varchar(64) NOT NULL,
    name varchar(200) DEFAULT NULL,
    category varchar(2000) DEFAULT NULL,
    package_name varchar(500) DEFAULT NULL,
    module_name varchar(30) DEFAULT NULL,
    sub_module_name varchar(30) DEFAULT NULL,
    function_name varchar(500) DEFAULT NULL,
    function_name_simple varchar(100) DEFAULT NULL,
    function_author varchar(100) DEFAULT NULL,
    gen_table_id varchar(200) DEFAULT NULL,
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    update_by varchar(64) DEFAULT NULL,
    update_date TIMESTAMP DEFAULT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE gen_table (
    id varchar(64) NOT NULL,
    name varchar(200) DEFAULT NULL,
    comments varchar(500) DEFAULT NULL,
    class_name varchar(100) DEFAULT NULL,
    parent_table varchar(200) DEFAULT NULL,
    parent_table_fk varchar(100) DEFAULT NULL,
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    update_by varchar(64) DEFAULT NULL,
    update_date TIMESTAMP DEFAULT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE gen_table_column (
    id varchar(64) NOT NULL,
    gen_table_id varchar(64) DEFAULT NULL,
    name varchar(200) DEFAULT NULL,
    comments varchar(500) DEFAULT NULL,
    jdbc_type varchar(100) DEFAULT NULL,
    java_type varchar(500) DEFAULT NULL,
    java_field varchar(200) DEFAULT NULL,
    is_pk char(1) DEFAULT NULL,
    is_null char(1) DEFAULT NULL,
    is_insert char(1) DEFAULT NULL,
    is_edit char(1) DEFAULT NULL,
    is_list char(1) DEFAULT NULL,
    is_query char(1) DEFAULT NULL,
    query_type varchar(200) DEFAULT NULL,
    show_type varchar(200) DEFAULT NULL,
    dict_type varchar(200) DEFAULT NULL,
    settings varchar(2000) DEFAULT NULL,
    sort decimal(10,0) DEFAULT NULL,
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    update_by varchar(64) DEFAULT NULL,
    update_date TIMESTAMP DEFAULT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE gen_template (
    id varchar(64) NOT NULL,
    name varchar(200) DEFAULT NULL,
    category varchar(2000) DEFAULT NULL,
    file_path varchar(500) DEFAULT NULL,
    file_name varchar(200) DEFAULT NULL,
    "content" text,
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    update_by varchar(64) DEFAULT NULL,
    update_date TIMESTAMP DEFAULT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE oa_leave (
    id varchar(64) NOT NULL,
    process_instance_id varchar(64) DEFAULT NULL,
    start_time TIMESTAMP DEFAULT NULL,
    end_time TIMESTAMP DEFAULT NULL,
    leave_type varchar(20) DEFAULT NULL,
    reason varchar(255) DEFAULT NULL,
    apply_time TIMESTAMP DEFAULT NULL,
    reality_start_time TIMESTAMP DEFAULT NULL,
    reality_end_time TIMESTAMP DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE oa_notify (
    id varchar(64) NOT NULL,
    type char(1) DEFAULT NULL,
    title varchar(200) DEFAULT NULL,
    "content" varchar(2000) DEFAULT NULL,
    files varchar(2000) DEFAULT NULL,
    status char(1) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE oa_notify_record (
    id varchar(64) NOT NULL,
    oa_notify_id varchar(64) DEFAULT NULL,
    "user_id" varchar(64) DEFAULT NULL,
    read_flag char(1) DEFAULT '0',
    read_date date DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE oa_test_audit (
    id varchar(64) NOT NULL,
    proc_ins_id varchar(64) DEFAULT NULL,
    "USER_ID" varchar(64) DEFAULT NULL,
    "OFFICE_ID" varchar(64) DEFAULT NULL,
    post varchar(255) DEFAULT NULL,
    age char(1) DEFAULT NULL,
    edu varchar(255) DEFAULT NULL,
    "CONTENT" varchar(255) DEFAULT NULL,
    olda varchar(255) DEFAULT NULL,
    oldb varchar(255) DEFAULT NULL,
    oldc varchar(255) DEFAULT NULL,
    newa varchar(255) DEFAULT NULL,
    newb varchar(255) DEFAULT NULL,
    newc varchar(255) DEFAULT NULL,
    add_num varchar(255) DEFAULT NULL,
    exe_date varchar(255) DEFAULT NULL,
    hr_text varchar(255) DEFAULT NULL,
    lead_text varchar(255) DEFAULT NULL,
    main_lead_text varchar(255) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_area (
    id varchar(64) NOT NULL,
    parent_id varchar(64) NOT NULL,
    parent_ids varchar(2000) NOT NULL,
    name varchar(100) NOT NULL,
    sort decimal(10,0) NOT NULL,
    code varchar(100) DEFAULT NULL,
    type char(1) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_dict (
    id varchar(64) NOT NULL,
    value varchar(100) NOT NULL,
    label varchar(100) NOT NULL,
    type varchar(100) NOT NULL,
    description varchar(100) NOT NULL,
    sort decimal(10,0) NOT NULL,
    parent_id varchar(64) DEFAULT '0',
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_log (
    id varchar(64) NOT NULL,
    type char(1) DEFAULT '1',
    title varchar(255) DEFAULT '',
    create_by varchar(64) DEFAULT NULL,
    create_date TIMESTAMP DEFAULT NULL,
    remote_addr varchar(255) DEFAULT NULL,
    user_agent varchar(255) DEFAULT NULL,
    request_uri varchar(255) DEFAULT NULL,
    method varchar(5) DEFAULT NULL,
    params text,
    exception text,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_mdict (
    id varchar(64) NOT NULL,
    parent_id varchar(64) NOT NULL,
    parent_ids varchar(2000) NOT NULL,
    name varchar(100) NOT NULL,
    sort decimal(10,0) NOT NULL,
    description varchar(100) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_menu (
    id varchar(64) NOT NULL,
    parent_id varchar(64) NOT NULL,
    parent_ids varchar(2000) NOT NULL,
    name varchar(100) NOT NULL,
    sort decimal(10,0) NOT NULL,
    href varchar(2000) DEFAULT NULL,
    target varchar(20) DEFAULT NULL,
    icon varchar(100) DEFAULT NULL,
    is_show char(1) NOT NULL,
    permission varchar(200) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_office (
    id varchar(64) NOT NULL,
    parent_id varchar(64) NOT NULL,
    parent_ids varchar(2000) NOT NULL,
    name varchar(100) NOT NULL,
    sort decimal(10,0) NOT NULL,
    area_id varchar(64) NOT NULL,
    code varchar(100) DEFAULT NULL,
    type char(1) NOT NULL,
    grade char(1) NOT NULL,
    address varchar(255) DEFAULT NULL,
    zip_code varchar(100) DEFAULT NULL,
    master varchar(100) DEFAULT NULL,
    phone varchar(200) DEFAULT NULL,
    fax varchar(200) DEFAULT NULL,
    email varchar(200) DEFAULT NULL,
    "USEABLE" varchar(64) DEFAULT NULL,
    primary_person varchar(64) DEFAULT NULL,
    deputy_person varchar(64) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_role (
    id varchar(64) NOT NULL,
    "office_id" varchar(64) DEFAULT NULL,
    name varchar(100) NOT NULL,
    enname varchar(255) DEFAULT NULL,
    role_type varchar(255) DEFAULT NULL,
    data_scope char(1) DEFAULT NULL,
    is_sys varchar(64) DEFAULT NULL,
    "useable" varchar(64) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_role_menu (
    role_id varchar(64) NOT NULL,
    menu_id varchar(64) NOT NULL,
    PRIMARY KEY (role_id,menu_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_role_office (
    role_id varchar(64) NOT NULL,
    "office_id" varchar(64) NOT NULL,
    PRIMARY KEY (role_id,"office_id")
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_user (
    id varchar(64) NOT NULL,
    company_id varchar(64) NOT NULL,
    "office_id" varchar(64) NOT NULL,
    login_name varchar(100) NOT NULL,
    password varchar(100) NOT NULL,
    no varchar(100) DEFAULT NULL,
    name varchar(100) NOT NULL,
    email varchar(200) DEFAULT NULL,
    phone varchar(200) DEFAULT NULL,
    mobile varchar(200) DEFAULT NULL,
    user_type char(1) DEFAULT NULL,
    photo varchar(1000) DEFAULT NULL,
    login_ip varchar(100) DEFAULT NULL,
    login_date TIMESTAMP DEFAULT NULL,
    login_flag varchar(64) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE sys_user_role (
    "user_id" varchar(64) NOT NULL,
    role_id varchar(64) NOT NULL,
    PRIMARY KEY ("user_id",role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE test_data (
    id varchar(64) NOT NULL,
    "user_id" varchar(64) DEFAULT NULL,
    "office_id" varchar(64) DEFAULT NULL,
    area_id varchar(64) DEFAULT NULL,
    name varchar(100) DEFAULT NULL,
    sex char(1) DEFAULT NULL,
    in_date date DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE test_data_child (
    id varchar(64) NOT NULL,
    test_data_main_id varchar(64) DEFAULT NULL,
    name varchar(100) DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE test_data_main (
    id varchar(64) NOT NULL,
    "user_id" varchar(64) DEFAULT NULL,
    "office_id" varchar(64) DEFAULT NULL,
    area_id varchar(64) DEFAULT NULL,
    name varchar(100) DEFAULT NULL,
    sex char(1) DEFAULT NULL,
    in_date date DEFAULT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;

CREATE TABLE test_tree (
    id varchar(64) NOT NULL,
    parent_id varchar(64) NOT NULL,
    parent_ids varchar(2000) NOT NULL,
    name varchar(100) NOT NULL,
    sort decimal(10,0) NOT NULL,
    create_by varchar(64) NOT NULL,
    create_date TIMESTAMP NOT NULL,
    update_by varchar(64) NOT NULL,
    update_date TIMESTAMP NOT NULL,
    remarks varchar(255) DEFAULT NULL,
    del_flag char(1) NOT NULL DEFAULT '0',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ;
ALTER TABLE act_ge_bytearray ADD CONSTRAINT act_fk_bytearr_depl FOREIGN KEY (deployment_id_) REFERENCES act_re_deployment (id_);
ALTER TABLE act_id_membership ADD CONSTRAINT act_fk_memb_user FOREIGN KEY (user_id_) REFERENCES act_id_user (id_);
ALTER TABLE act_id_membership ADD CONSTRAINT act_fk_memb_group FOREIGN KEY (group_id_) REFERENCES act_id_group (id_);
ALTER TABLE act_re_model ADD CONSTRAINT act_fk_model_deployment FOREIGN KEY (deployment_id_) REFERENCES act_re_deployment (id_);
ALTER TABLE act_re_model ADD CONSTRAINT act_fk_model_source FOREIGN KEY (editor_source_value_id_) REFERENCES act_ge_bytearray (id_);
ALTER TABLE act_re_model ADD CONSTRAINT act_fk_model_source_extra FOREIGN KEY (editor_source_extra_value_id_) REFERENCES act_ge_bytearray (id_);
ALTER TABLE act_ru_event_subscr ADD CONSTRAINT act_fk_event_exec FOREIGN KEY (execution_id_) REFERENCES act_ru_execution (id_);
ALTER TABLE act_ru_execution ADD CONSTRAINT act_fk_exe_procdef FOREIGN KEY (proc_def_id_) REFERENCES act_re_procdef (id_);
ALTER TABLE act_ru_execution ADD CONSTRAINT act_fk_exe_parent FOREIGN KEY (parent_id_) REFERENCES act_ru_execution (id_);
ALTER TABLE act_ru_execution ADD CONSTRAINT act_fk_exe_procinst FOREIGN KEY (proc_inst_id_) REFERENCES act_ru_execution (id_) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE act_ru_execution ADD CONSTRAINT act_fk_exe_super FOREIGN KEY (super_exec_) REFERENCES act_ru_execution (id_);
ALTER TABLE act_ru_identitylink ADD CONSTRAINT act_fk_idl_procinst FOREIGN KEY (proc_inst_id_) REFERENCES act_ru_execution (id_);
ALTER TABLE act_ru_identitylink ADD CONSTRAINT act_fk_athrz_procedef FOREIGN KEY (proc_def_id_) REFERENCES act_re_procdef (id_);
ALTER TABLE act_ru_identitylink ADD CONSTRAINT act_fk_tskass_task FOREIGN KEY (task_id_) REFERENCES act_ru_task (id_);
ALTER TABLE act_ru_job ADD CONSTRAINT act_fk_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES act_ge_bytearray (id_);
ALTER TABLE act_ru_task ADD CONSTRAINT act_fk_task_procdef FOREIGN KEY (proc_def_id_) REFERENCES act_re_procdef (id_);
ALTER TABLE act_ru_task ADD CONSTRAINT act_fk_task_exe FOREIGN KEY (execution_id_) REFERENCES act_ru_execution (id_);
ALTER TABLE act_ru_task ADD CONSTRAINT act_fk_task_procinst FOREIGN KEY (proc_inst_id_) REFERENCES act_ru_execution (id_);
ALTER TABLE act_ru_variable ADD CONSTRAINT act_fk_var_bytearray FOREIGN KEY (bytearray_id_) REFERENCES act_ge_bytearray (id_);
ALTER TABLE act_ru_variable ADD CONSTRAINT act_fk_var_exe FOREIGN KEY (execution_id_) REFERENCES act_ru_execution (id_);
ALTER TABLE act_ru_variable ADD CONSTRAINT act_fk_var_procinst FOREIGN KEY (proc_inst_id_) REFERENCES act_ru_execution (id_);
CREATE INDEX ON act_ge_bytearray (deployment_id_);
CREATE INDEX ON act_id_membership (group_id_);
CREATE INDEX ON act_re_model (editor_source_value_id_);
CREATE INDEX ON act_re_model (editor_source_extra_value_id_);
CREATE INDEX ON act_re_model (deployment_id_);
CREATE INDEX ON act_ru_event_subscr (configuration_);
CREATE INDEX ON act_ru_event_subscr (execution_id_);
CREATE INDEX ON act_ru_execution (business_key_);
CREATE INDEX ON act_ru_execution (proc_inst_id_);
CREATE INDEX ON act_ru_execution (parent_id_);
CREATE INDEX ON act_ru_execution (super_exec_);
CREATE INDEX ON act_ru_execution (proc_def_id_);
CREATE INDEX ON act_ru_identitylink (user_id_);
CREATE INDEX ON act_ru_identitylink (group_id_);
CREATE INDEX ON act_ru_identitylink (proc_def_id_);
CREATE INDEX ON act_ru_identitylink (task_id_);
CREATE INDEX ON act_ru_identitylink (proc_inst_id_);
CREATE INDEX ON act_ru_job (exception_stack_id_);
CREATE INDEX ON act_ru_task (create_time_);
CREATE INDEX ON act_ru_task (execution_id_);
CREATE INDEX ON act_ru_task (proc_inst_id_);
CREATE INDEX ON act_ru_task (proc_def_id_);
CREATE INDEX ON act_ru_variable (task_id_);
CREATE INDEX ON act_ru_variable (execution_id_);
CREATE INDEX ON act_ru_variable (proc_inst_id_);
CREATE INDEX ON act_ru_variable (bytearray_id_);
CREATE INDEX ON act_hi_actinst (start_time_);
CREATE INDEX ON act_hi_actinst (end_time_);
CREATE INDEX ON act_hi_actinst (proc_inst_id_,act_id_);
CREATE INDEX ON act_hi_actinst (execution_id_,act_id_);
CREATE INDEX ON act_hi_detail (proc_inst_id_);
CREATE INDEX ON act_hi_detail (act_inst_id_);
CREATE INDEX ON act_hi_detail (time_);
CREATE INDEX ON act_hi_detail (name_);
CREATE INDEX ON act_hi_detail (task_id_);
CREATE INDEX ON act_hi_identitylink (user_id_);
CREATE INDEX ON act_hi_identitylink (task_id_);
CREATE INDEX ON act_hi_identitylink (proc_inst_id_);
CREATE INDEX ON act_hi_procinst (end_time_);
CREATE INDEX ON act_hi_procinst (business_key_);
CREATE INDEX ON act_hi_varinst (proc_inst_id_);
CREATE INDEX ON act_hi_varinst (name_,var_type_);
CREATE INDEX ON cms_article (create_by);
CREATE INDEX ON cms_article (title);
CREATE INDEX ON cms_article (keywords);
CREATE INDEX ON cms_article (del_flag);
CREATE INDEX ON cms_article (weight);
CREATE INDEX ON cms_article (update_date);
CREATE INDEX ON cms_article (category_id);
CREATE INDEX ON cms_category (parent_id);
CREATE INDEX ON cms_category (module);
CREATE INDEX ON cms_category (name);
CREATE INDEX ON cms_category (sort);
CREATE INDEX ON cms_category (del_flag);
CREATE INDEX ON cms_category ("office_id");
CREATE INDEX ON cms_category (site_id);
CREATE INDEX ON cms_comment (category_id);
CREATE INDEX ON cms_comment (content_id);
CREATE INDEX ON cms_comment (del_flag);
CREATE INDEX ON cms_guestbook (del_flag);
CREATE INDEX ON cms_link (category_id);
CREATE INDEX ON cms_link (title);
CREATE INDEX ON cms_link (del_flag);
CREATE INDEX ON cms_link (weight);
CREATE INDEX ON cms_link (create_by);
CREATE INDEX ON cms_link (update_date);
CREATE INDEX ON cms_site (del_flag);
CREATE INDEX ON gen_scheme (del_flag);
CREATE INDEX ON gen_table (name);
CREATE INDEX ON gen_table (del_flag);
CREATE INDEX ON gen_table_column (gen_table_id);
CREATE INDEX ON gen_table_column (name);
CREATE INDEX ON gen_table_column (sort);
CREATE INDEX ON gen_table_column (del_flag);
CREATE INDEX ON gen_template (del_flag);
CREATE INDEX ON oa_leave (create_by);
CREATE INDEX ON oa_leave (process_instance_id);
CREATE INDEX ON oa_leave (del_flag);
CREATE INDEX ON oa_notify (del_flag);
CREATE INDEX ON oa_notify_record (oa_notify_id);
CREATE INDEX ON oa_notify_record ("user_id");
CREATE INDEX ON oa_notify_record (read_flag);
CREATE INDEX ON oa_test_audit (del_flag);
CREATE INDEX ON sys_area (parent_id);
CREATE INDEX ON sys_area (del_flag);
CREATE INDEX ON sys_dict (value);
CREATE INDEX ON sys_dict (label);
CREATE INDEX ON sys_dict (del_flag);
CREATE INDEX ON sys_log (create_by);
CREATE INDEX ON sys_log (request_uri);
CREATE INDEX ON sys_log (type);
CREATE INDEX ON sys_log (create_date);
CREATE INDEX ON sys_mdict (parent_id);
CREATE INDEX ON sys_mdict (del_flag);
CREATE INDEX ON sys_menu (parent_id);
CREATE INDEX ON sys_menu (del_flag);
CREATE INDEX ON sys_office (parent_id);
CREATE INDEX ON sys_office (del_flag);
CREATE INDEX ON sys_office (type);
CREATE INDEX ON sys_role (del_flag);
CREATE INDEX ON sys_role (enname);
CREATE INDEX ON sys_user ("office_id");
CREATE INDEX ON sys_user (login_name);
CREATE INDEX ON sys_user (company_id);
CREATE INDEX ON sys_user (update_date);
CREATE INDEX ON sys_user (del_flag);
CREATE INDEX ON test_data (del_flag);
CREATE INDEX ON test_data_child (del_flag);
CREATE INDEX ON test_data_main (del_flag);
CREATE INDEX ON test_tree (del_flag);
CREATE INDEX ON test_tree (parent_id);
COMMENT ON COLUMN cms_article.id IS '编号';
COMMENT ON COLUMN cms_article.category_id IS '栏目编号';
COMMENT ON COLUMN cms_article.title IS '标题';
COMMENT ON COLUMN cms_article.link IS '文章链接';
COMMENT ON COLUMN cms_article.color IS '标题颜色';
COMMENT ON COLUMN cms_article.image IS '文章图片';
COMMENT ON COLUMN cms_article.keywords IS '关键字';
COMMENT ON COLUMN cms_article.description IS '描述、摘要';
COMMENT ON COLUMN cms_article.weight IS '权重，越大越靠前';
COMMENT ON COLUMN cms_article.weight_date IS '权重期限';
COMMENT ON COLUMN cms_article.hits IS '点击数';
COMMENT ON COLUMN cms_article.posid IS '推荐位，多选';
COMMENT ON COLUMN cms_article.custom_content_view IS '自定义内容视图';
COMMENT ON COLUMN cms_article.view_config IS '视图配置';
COMMENT ON COLUMN cms_article.create_by IS '创建者';
COMMENT ON COLUMN cms_article.create_date IS '创建时间';
COMMENT ON COLUMN cms_article.update_by IS '更新者';
COMMENT ON COLUMN cms_article.update_date IS '更新时间';
COMMENT ON COLUMN cms_article.remarks IS '备注信息';
COMMENT ON COLUMN cms_article.del_flag IS '删除标记';
COMMENT ON COLUMN cms_article_data.id IS '编号';
COMMENT ON COLUMN cms_article_data."content" IS '文章内容';
COMMENT ON COLUMN cms_article_data.copyfrom IS '文章来源';
COMMENT ON COLUMN cms_article_data.relation IS '相关文章';
COMMENT ON COLUMN cms_article_data.allow_comment IS '是否允许评论';
COMMENT ON COLUMN cms_category.id IS '编号';
COMMENT ON COLUMN cms_category.parent_id IS '父级编号';
COMMENT ON COLUMN cms_category.parent_ids IS '所有父级编号';
COMMENT ON COLUMN cms_category.site_id IS '站点编号';
COMMENT ON COLUMN cms_category."office_id" IS '归属机构';
COMMENT ON COLUMN cms_category.module IS '栏目模块';
COMMENT ON COLUMN cms_category.name IS '栏目名称';
COMMENT ON COLUMN cms_category.image IS '栏目图片';
COMMENT ON COLUMN cms_category.href IS '链接';
COMMENT ON COLUMN cms_category.target IS '目标';
COMMENT ON COLUMN cms_category.description IS '描述';
COMMENT ON COLUMN cms_category.keywords IS '关键字';
COMMENT ON COLUMN cms_category.sort IS '排序（升序）';
COMMENT ON COLUMN cms_category.in_menu IS '是否在导航中显示';
COMMENT ON COLUMN cms_category.in_list IS '是否在分类页中显示列表';
COMMENT ON COLUMN cms_category.show_modes IS '展现方式';
COMMENT ON COLUMN cms_category.allow_comment IS '是否允许评论';
COMMENT ON COLUMN cms_category.is_audit IS '是否需要审核';
COMMENT ON COLUMN cms_category.custom_list_view IS '自定义列表视图';
COMMENT ON COLUMN cms_category.custom_content_view IS '自定义内容视图';
COMMENT ON COLUMN cms_category.view_config IS '视图配置';
COMMENT ON COLUMN cms_category.create_by IS '创建者';
COMMENT ON COLUMN cms_category.create_date IS '创建时间';
COMMENT ON COLUMN cms_category.update_by IS '更新者';
COMMENT ON COLUMN cms_category.update_date IS '更新时间';
COMMENT ON COLUMN cms_category.remarks IS '备注信息';
COMMENT ON COLUMN cms_category.del_flag IS '删除标记';
COMMENT ON COLUMN cms_comment.id IS '编号';
COMMENT ON COLUMN cms_comment.category_id IS '栏目编号';
COMMENT ON COLUMN cms_comment.content_id IS '栏目内容的编号';
COMMENT ON COLUMN cms_comment.title IS '栏目内容的标题';
COMMENT ON COLUMN cms_comment."content" IS '评论内容';
COMMENT ON COLUMN cms_comment.name IS '评论姓名';
COMMENT ON COLUMN cms_comment.ip IS '评论IP';
COMMENT ON COLUMN cms_comment.create_date IS '评论时间';
COMMENT ON COLUMN cms_comment.audit_user_id IS '审核人';
COMMENT ON COLUMN cms_comment.audit_date IS '审核时间';
COMMENT ON COLUMN cms_comment.del_flag IS '删除标记';
COMMENT ON COLUMN cms_guestbook.id IS '编号';
COMMENT ON COLUMN cms_guestbook.type IS '留言分类';
COMMENT ON COLUMN cms_guestbook."content" IS '留言内容';
COMMENT ON COLUMN cms_guestbook.name IS '姓名';
COMMENT ON COLUMN cms_guestbook.email IS '邮箱';
COMMENT ON COLUMN cms_guestbook.phone IS '电话';
COMMENT ON COLUMN cms_guestbook.workunit IS '单位';
COMMENT ON COLUMN cms_guestbook.ip IS 'IP';
COMMENT ON COLUMN cms_guestbook.create_date IS '留言时间';
COMMENT ON COLUMN cms_guestbook.re_user_id IS '回复人';
COMMENT ON COLUMN cms_guestbook.re_date IS '回复时间';
COMMENT ON COLUMN cms_guestbook.re_content IS '回复内容';
COMMENT ON COLUMN cms_guestbook.del_flag IS '删除标记';
COMMENT ON COLUMN cms_link.id IS '编号';
COMMENT ON COLUMN cms_link.category_id IS '栏目编号';
COMMENT ON COLUMN cms_link.title IS '链接名称';
COMMENT ON COLUMN cms_link.color IS '标题颜色';
COMMENT ON COLUMN cms_link.image IS '链接图片';
COMMENT ON COLUMN cms_link.href IS '链接地址';
COMMENT ON COLUMN cms_link.weight IS '权重，越大越靠前';
COMMENT ON COLUMN cms_link.weight_date IS '权重期限';
COMMENT ON COLUMN cms_link.create_by IS '创建者';
COMMENT ON COLUMN cms_link.create_date IS '创建时间';
COMMENT ON COLUMN cms_link.update_by IS '更新者';
COMMENT ON COLUMN cms_link.update_date IS '更新时间';
COMMENT ON COLUMN cms_link.remarks IS '备注信息';
COMMENT ON COLUMN cms_link.del_flag IS '删除标记';
COMMENT ON COLUMN cms_site.id IS '编号';
COMMENT ON COLUMN cms_site.name IS '站点名称';
COMMENT ON COLUMN cms_site.title IS '站点标题';
COMMENT ON COLUMN cms_site.logo IS '站点Logo';
COMMENT ON COLUMN cms_site.domain IS '站点域名';
COMMENT ON COLUMN cms_site.description IS '描述';
COMMENT ON COLUMN cms_site.keywords IS '关键字';
COMMENT ON COLUMN cms_site.theme IS '主题';
COMMENT ON COLUMN cms_site.copyright IS '版权信息';
COMMENT ON COLUMN cms_site.custom_index_view IS '自定义站点首页视图';
COMMENT ON COLUMN cms_site.create_by IS '创建者';
COMMENT ON COLUMN cms_site.create_date IS '创建时间';
COMMENT ON COLUMN cms_site.update_by IS '更新者';
COMMENT ON COLUMN cms_site.update_date IS '更新时间';
COMMENT ON COLUMN cms_site.remarks IS '备注信息';
COMMENT ON COLUMN cms_site.del_flag IS '删除标记';
COMMENT ON COLUMN gen_scheme.id IS '编号';
COMMENT ON COLUMN gen_scheme.name IS '名称';
COMMENT ON COLUMN gen_scheme.category IS '分类';
COMMENT ON COLUMN gen_scheme.package_name IS '生成包路径';
COMMENT ON COLUMN gen_scheme.module_name IS '生成模块名';
COMMENT ON COLUMN gen_scheme.sub_module_name IS '生成子模块名';
COMMENT ON COLUMN gen_scheme.function_name IS '生成功能名';
COMMENT ON COLUMN gen_scheme.function_name_simple IS '生成功能名（简写）';
COMMENT ON COLUMN gen_scheme.function_author IS '生成功能作者';
COMMENT ON COLUMN gen_scheme.gen_table_id IS '生成表编号';
COMMENT ON COLUMN gen_scheme.create_by IS '创建者';
COMMENT ON COLUMN gen_scheme.create_date IS '创建时间';
COMMENT ON COLUMN gen_scheme.update_by IS '更新者';
COMMENT ON COLUMN gen_scheme.update_date IS '更新时间';
COMMENT ON COLUMN gen_scheme.remarks IS '备注信息';
COMMENT ON COLUMN gen_scheme.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN gen_table.id IS '编号';
COMMENT ON COLUMN gen_table.name IS '名称';
COMMENT ON COLUMN gen_table.comments IS '描述';
COMMENT ON COLUMN gen_table.class_name IS '实体类名称';
COMMENT ON COLUMN gen_table.parent_table IS '关联父表';
COMMENT ON COLUMN gen_table.parent_table_fk IS '关联父表外键';
COMMENT ON COLUMN gen_table.create_by IS '创建者';
COMMENT ON COLUMN gen_table.create_date IS '创建时间';
COMMENT ON COLUMN gen_table.update_by IS '更新者';
COMMENT ON COLUMN gen_table.update_date IS '更新时间';
COMMENT ON COLUMN gen_table.remarks IS '备注信息';
COMMENT ON COLUMN gen_table.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN gen_table_column.id IS '编号';
COMMENT ON COLUMN gen_table_column.gen_table_id IS '归属表编号';
COMMENT ON COLUMN gen_table_column.name IS '名称';
COMMENT ON COLUMN gen_table_column.comments IS '描述';
COMMENT ON COLUMN gen_table_column.jdbc_type IS '列的数据类型的字节长度';
COMMENT ON COLUMN gen_table_column.java_type IS 'JAVA类型';
COMMENT ON COLUMN gen_table_column.java_field IS 'JAVA字段名';
COMMENT ON COLUMN gen_table_column.is_pk IS '是否主键';
COMMENT ON COLUMN gen_table_column.is_null IS '是否可为空';
COMMENT ON COLUMN gen_table_column.is_insert IS '是否为插入字段';
COMMENT ON COLUMN gen_table_column.is_edit IS '是否编辑字段';
COMMENT ON COLUMN gen_table_column.is_list IS '是否列表字段';
COMMENT ON COLUMN gen_table_column.is_query IS '是否查询字段';
COMMENT ON COLUMN gen_table_column.query_type IS '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）';
COMMENT ON COLUMN gen_table_column.show_type IS '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）';
COMMENT ON COLUMN gen_table_column.dict_type IS '字典类型';
COMMENT ON COLUMN gen_table_column.settings IS '其它设置（扩展字段JSON）';
COMMENT ON COLUMN gen_table_column.sort IS '排序（升序）';
COMMENT ON COLUMN gen_table_column.create_by IS '创建者';
COMMENT ON COLUMN gen_table_column.create_date IS '创建时间';
COMMENT ON COLUMN gen_table_column.update_by IS '更新者';
COMMENT ON COLUMN gen_table_column.update_date IS '更新时间';
COMMENT ON COLUMN gen_table_column.remarks IS '备注信息';
COMMENT ON COLUMN gen_table_column.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN gen_template.id IS '编号';
COMMENT ON COLUMN gen_template.name IS '名称';
COMMENT ON COLUMN gen_template.category IS '分类';
COMMENT ON COLUMN gen_template.file_path IS '生成文件路径';
COMMENT ON COLUMN gen_template.file_name IS '生成文件名';
COMMENT ON COLUMN gen_template."content" IS '内容';
COMMENT ON COLUMN gen_template.create_by IS '创建者';
COMMENT ON COLUMN gen_template.create_date IS '创建时间';
COMMENT ON COLUMN gen_template.update_by IS '更新者';
COMMENT ON COLUMN gen_template.update_date IS '更新时间';
COMMENT ON COLUMN gen_template.remarks IS '备注信息';
COMMENT ON COLUMN gen_template.del_flag IS '删除标记（0：正常；1：删除）';
COMMENT ON COLUMN oa_leave.id IS '编号';
COMMENT ON COLUMN oa_leave.process_instance_id IS '流程实例编号';
COMMENT ON COLUMN oa_leave.start_time IS '开始时间';
COMMENT ON COLUMN oa_leave.end_time IS '结束时间';
COMMENT ON COLUMN oa_leave.leave_type IS '请假类型';
COMMENT ON COLUMN oa_leave.reason IS '请假理由';
COMMENT ON COLUMN oa_leave.apply_time IS '申请时间';
COMMENT ON COLUMN oa_leave.reality_start_time IS '实际开始时间';
COMMENT ON COLUMN oa_leave.reality_end_time IS '实际结束时间';
COMMENT ON COLUMN oa_leave.create_by IS '创建者';
COMMENT ON COLUMN oa_leave.create_date IS '创建时间';
COMMENT ON COLUMN oa_leave.update_by IS '更新者';
COMMENT ON COLUMN oa_leave.update_date IS '更新时间';
COMMENT ON COLUMN oa_leave.remarks IS '备注信息';
COMMENT ON COLUMN oa_leave.del_flag IS '删除标记';
COMMENT ON COLUMN oa_notify.id IS '编号';
COMMENT ON COLUMN oa_notify.type IS '类型';
COMMENT ON COLUMN oa_notify.title IS '标题';
COMMENT ON COLUMN oa_notify."content" IS '内容';
COMMENT ON COLUMN oa_notify.files IS '附件';
COMMENT ON COLUMN oa_notify.status IS '状态';
COMMENT ON COLUMN oa_notify.create_by IS '创建者';
COMMENT ON COLUMN oa_notify.create_date IS '创建时间';
COMMENT ON COLUMN oa_notify.update_by IS '更新者';
COMMENT ON COLUMN oa_notify.update_date IS '更新时间';
COMMENT ON COLUMN oa_notify.remarks IS '备注信息';
COMMENT ON COLUMN oa_notify.del_flag IS '删除标记';
COMMENT ON COLUMN oa_notify_record.id IS '编号';
COMMENT ON COLUMN oa_notify_record.oa_notify_id IS '通知通告ID';
COMMENT ON COLUMN oa_notify_record."user_id" IS '接受人';
COMMENT ON COLUMN oa_notify_record.read_flag IS '阅读标记';
COMMENT ON COLUMN oa_notify_record.read_date IS '阅读时间';
COMMENT ON COLUMN oa_test_audit.id IS '编号';
COMMENT ON COLUMN oa_test_audit.proc_ins_id IS '流程实例ID';
COMMENT ON COLUMN oa_test_audit."USER_ID" IS '变动用户';
COMMENT ON COLUMN oa_test_audit."OFFICE_ID" IS '归属部门';
COMMENT ON COLUMN oa_test_audit.post IS '岗位';
COMMENT ON COLUMN oa_test_audit.age IS '性别';
COMMENT ON COLUMN oa_test_audit.edu IS '学历';
COMMENT ON COLUMN oa_test_audit."CONTENT" IS '调整原因';
COMMENT ON COLUMN oa_test_audit.olda IS '现行标准 薪酬档级';
COMMENT ON COLUMN oa_test_audit.oldb IS '现行标准 月工资额';
COMMENT ON COLUMN oa_test_audit.oldc IS '现行标准 年薪总额';
COMMENT ON COLUMN oa_test_audit.newa IS '调整后标准 薪酬档级';
COMMENT ON COLUMN oa_test_audit.newb IS '调整后标准 月工资额';
COMMENT ON COLUMN oa_test_audit.newc IS '调整后标准 年薪总额';
COMMENT ON COLUMN oa_test_audit.add_num IS '月增资';
COMMENT ON COLUMN oa_test_audit.exe_date IS '执行时间';
COMMENT ON COLUMN oa_test_audit.hr_text IS '人力资源部门意见';
COMMENT ON COLUMN oa_test_audit.lead_text IS '分管领导意见';
COMMENT ON COLUMN oa_test_audit.main_lead_text IS '集团主要领导意见';
COMMENT ON COLUMN oa_test_audit.create_by IS '创建者';
COMMENT ON COLUMN oa_test_audit.create_date IS '创建时间';
COMMENT ON COLUMN oa_test_audit.update_by IS '更新者';
COMMENT ON COLUMN oa_test_audit.update_date IS '更新时间';
COMMENT ON COLUMN oa_test_audit.remarks IS '备注信息';
COMMENT ON COLUMN oa_test_audit.del_flag IS '删除标记';
COMMENT ON COLUMN sys_area.id IS '编号';
COMMENT ON COLUMN sys_area.parent_id IS '父级编号';
COMMENT ON COLUMN sys_area.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_area.name IS '名称';
COMMENT ON COLUMN sys_area.sort IS '排序';
COMMENT ON COLUMN sys_area.code IS '区域编码';
COMMENT ON COLUMN sys_area.type IS '区域类型';
COMMENT ON COLUMN sys_area.create_by IS '创建者';
COMMENT ON COLUMN sys_area.create_date IS '创建时间';
COMMENT ON COLUMN sys_area.update_by IS '更新者';
COMMENT ON COLUMN sys_area.update_date IS '更新时间';
COMMENT ON COLUMN sys_area.remarks IS '备注信息';
COMMENT ON COLUMN sys_area.del_flag IS '删除标记';
COMMENT ON COLUMN sys_dict.id IS '编号';
COMMENT ON COLUMN sys_dict.value IS '数据值';
COMMENT ON COLUMN sys_dict.label IS '标签名';
COMMENT ON COLUMN sys_dict.type IS '类型';
COMMENT ON COLUMN sys_dict.description IS '描述';
COMMENT ON COLUMN sys_dict.sort IS '排序（升序）';
COMMENT ON COLUMN sys_dict.parent_id IS '父级编号';
COMMENT ON COLUMN sys_dict.create_by IS '创建者';
COMMENT ON COLUMN sys_dict.create_date IS '创建时间';
COMMENT ON COLUMN sys_dict.update_by IS '更新者';
COMMENT ON COLUMN sys_dict.update_date IS '更新时间';
COMMENT ON COLUMN sys_dict.remarks IS '备注信息';
COMMENT ON COLUMN sys_dict.del_flag IS '删除标记';
COMMENT ON COLUMN sys_log.id IS '编号';
COMMENT ON COLUMN sys_log.type IS '日志类型';
COMMENT ON COLUMN sys_log.title IS '日志标题';
COMMENT ON COLUMN sys_log.create_by IS '创建者';
COMMENT ON COLUMN sys_log.create_date IS '创建时间';
COMMENT ON COLUMN sys_log.remote_addr IS '操作IP地址';
COMMENT ON COLUMN sys_log.user_agent IS '用户代理';
COMMENT ON COLUMN sys_log.request_uri IS '请求URI';
COMMENT ON COLUMN sys_log.method IS '操作方式';
COMMENT ON COLUMN sys_log.params IS '操作提交的数据';
COMMENT ON COLUMN sys_log.exception IS '异常信息';
COMMENT ON COLUMN sys_mdict.id IS '编号';
COMMENT ON COLUMN sys_mdict.parent_id IS '父级编号';
COMMENT ON COLUMN sys_mdict.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_mdict.name IS '名称';
COMMENT ON COLUMN sys_mdict.sort IS '排序';
COMMENT ON COLUMN sys_mdict.description IS '描述';
COMMENT ON COLUMN sys_mdict.create_by IS '创建者';
COMMENT ON COLUMN sys_mdict.create_date IS '创建时间';
COMMENT ON COLUMN sys_mdict.update_by IS '更新者';
COMMENT ON COLUMN sys_mdict.update_date IS '更新时间';
COMMENT ON COLUMN sys_mdict.remarks IS '备注信息';
COMMENT ON COLUMN sys_mdict.del_flag IS '删除标记';
COMMENT ON COLUMN sys_menu.id IS '编号';
COMMENT ON COLUMN sys_menu.parent_id IS '父级编号';
COMMENT ON COLUMN sys_menu.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_menu.name IS '名称';
COMMENT ON COLUMN sys_menu.sort IS '排序';
COMMENT ON COLUMN sys_menu.href IS '链接';
COMMENT ON COLUMN sys_menu.target IS '目标';
COMMENT ON COLUMN sys_menu.icon IS '图标';
COMMENT ON COLUMN sys_menu.is_show IS '是否在菜单中显示';
COMMENT ON COLUMN sys_menu.permission IS '权限标识';
COMMENT ON COLUMN sys_menu.create_by IS '创建者';
COMMENT ON COLUMN sys_menu.create_date IS '创建时间';
COMMENT ON COLUMN sys_menu.update_by IS '更新者';
COMMENT ON COLUMN sys_menu.update_date IS '更新时间';
COMMENT ON COLUMN sys_menu.remarks IS '备注信息';
COMMENT ON COLUMN sys_menu.del_flag IS '删除标记';
COMMENT ON COLUMN sys_office.id IS '编号';
COMMENT ON COLUMN sys_office.parent_id IS '父级编号';
COMMENT ON COLUMN sys_office.parent_ids IS '所有父级编号';
COMMENT ON COLUMN sys_office.name IS '名称';
COMMENT ON COLUMN sys_office.sort IS '排序';
COMMENT ON COLUMN sys_office.area_id IS '归属区域';
COMMENT ON COLUMN sys_office.code IS '区域编码';
COMMENT ON COLUMN sys_office.type IS '机构类型';
COMMENT ON COLUMN sys_office.grade IS '机构等级';
COMMENT ON COLUMN sys_office.address IS '联系地址';
COMMENT ON COLUMN sys_office.zip_code IS '邮政编码';
COMMENT ON COLUMN sys_office.master IS '负责人';
COMMENT ON COLUMN sys_office.phone IS '电话';
COMMENT ON COLUMN sys_office.fax IS '传真';
COMMENT ON COLUMN sys_office.email IS '邮箱';
COMMENT ON COLUMN sys_office."USEABLE" IS '是否启用';
COMMENT ON COLUMN sys_office.primary_person IS '主负责人';
COMMENT ON COLUMN sys_office.deputy_person IS '副负责人';
COMMENT ON COLUMN sys_office.create_by IS '创建者';
COMMENT ON COLUMN sys_office.create_date IS '创建时间';
COMMENT ON COLUMN sys_office.update_by IS '更新者';
COMMENT ON COLUMN sys_office.update_date IS '更新时间';
COMMENT ON COLUMN sys_office.remarks IS '备注信息';
COMMENT ON COLUMN sys_office.del_flag IS '删除标记';
COMMENT ON COLUMN sys_role.id IS '编号';
COMMENT ON COLUMN sys_role."office_id" IS '归属机构';
COMMENT ON COLUMN sys_role.name IS '角色名称';
COMMENT ON COLUMN sys_role.enname IS '英文名称';
COMMENT ON COLUMN sys_role.role_type IS '角色类型';
COMMENT ON COLUMN sys_role.data_scope IS '数据范围';
COMMENT ON COLUMN sys_role.is_sys IS '是否系统数据';
COMMENT ON COLUMN sys_role."useable" IS '是否可用';
COMMENT ON COLUMN sys_role.create_by IS '创建者';
COMMENT ON COLUMN sys_role.create_date IS '创建时间';
COMMENT ON COLUMN sys_role.update_by IS '更新者';
COMMENT ON COLUMN sys_role.update_date IS '更新时间';
COMMENT ON COLUMN sys_role.remarks IS '备注信息';
COMMENT ON COLUMN sys_role.del_flag IS '删除标记';
COMMENT ON COLUMN sys_role_menu.role_id IS '角色编号';
COMMENT ON COLUMN sys_role_menu.menu_id IS '菜单编号';
COMMENT ON COLUMN sys_role_office.role_id IS '角色编号';
COMMENT ON COLUMN sys_role_office."office_id" IS '机构编号';
COMMENT ON COLUMN sys_user.id IS '编号';
COMMENT ON COLUMN sys_user.company_id IS '归属公司';
COMMENT ON COLUMN sys_user."office_id" IS '归属部门';
COMMENT ON COLUMN sys_user.login_name IS '登录名';
COMMENT ON COLUMN sys_user.password IS '密码';
COMMENT ON COLUMN sys_user.no IS '工号';
COMMENT ON COLUMN sys_user.name IS '姓名';
COMMENT ON COLUMN sys_user.email IS '邮箱';
COMMENT ON COLUMN sys_user.phone IS '电话';
COMMENT ON COLUMN sys_user.mobile IS '手机';
COMMENT ON COLUMN sys_user.user_type IS '用户类型';
COMMENT ON COLUMN sys_user.photo IS '用户头像';
COMMENT ON COLUMN sys_user.login_ip IS '最后登陆IP';
COMMENT ON COLUMN sys_user.login_date IS '最后登陆时间';
COMMENT ON COLUMN sys_user.login_flag IS '是否可登录';
COMMENT ON COLUMN sys_user.create_by IS '创建者';
COMMENT ON COLUMN sys_user.create_date IS '创建时间';
COMMENT ON COLUMN sys_user.update_by IS '更新者';
COMMENT ON COLUMN sys_user.update_date IS '更新时间';
COMMENT ON COLUMN sys_user.remarks IS '备注信息';
COMMENT ON COLUMN sys_user.del_flag IS '删除标记';
COMMENT ON COLUMN sys_user_role."user_id" IS '用户编号';
COMMENT ON COLUMN sys_user_role.role_id IS '角色编号';
COMMENT ON COLUMN test_data.id IS '编号';
COMMENT ON COLUMN test_data."user_id" IS '归属用户';
COMMENT ON COLUMN test_data."office_id" IS '归属部门';
COMMENT ON COLUMN test_data.area_id IS '归属区域';
COMMENT ON COLUMN test_data.name IS '名称';
COMMENT ON COLUMN test_data.sex IS '性别';
COMMENT ON COLUMN test_data.in_date IS '加入日期';
COMMENT ON COLUMN test_data.create_by IS '创建者';
COMMENT ON COLUMN test_data.create_date IS '创建时间';
COMMENT ON COLUMN test_data.update_by IS '更新者';
COMMENT ON COLUMN test_data.update_date IS '更新时间';
COMMENT ON COLUMN test_data.remarks IS '备注信息';
COMMENT ON COLUMN test_data.del_flag IS '删除标记';
COMMENT ON COLUMN test_data_child.id IS '编号';
COMMENT ON COLUMN test_data_child.test_data_main_id IS '业务主表ID';
COMMENT ON COLUMN test_data_child.name IS '名称';
COMMENT ON COLUMN test_data_child.create_by IS '创建者';
COMMENT ON COLUMN test_data_child.create_date IS '创建时间';
COMMENT ON COLUMN test_data_child.update_by IS '更新者';
COMMENT ON COLUMN test_data_child.update_date IS '更新时间';
COMMENT ON COLUMN test_data_child.remarks IS '备注信息';
COMMENT ON COLUMN test_data_child.del_flag IS '删除标记';
COMMENT ON COLUMN test_data_main.id IS '编号';
COMMENT ON COLUMN test_data_main."user_id" IS '归属用户';
COMMENT ON COLUMN test_data_main."office_id" IS '归属部门';
COMMENT ON COLUMN test_data_main.area_id IS '归属区域';
COMMENT ON COLUMN test_data_main.name IS '名称';
COMMENT ON COLUMN test_data_main.sex IS '性别';
COMMENT ON COLUMN test_data_main.in_date IS '加入日期';
COMMENT ON COLUMN test_data_main.create_by IS '创建者';
COMMENT ON COLUMN test_data_main.create_date IS '创建时间';
COMMENT ON COLUMN test_data_main.update_by IS '更新者';
COMMENT ON COLUMN test_data_main.update_date IS '更新时间';
COMMENT ON COLUMN test_data_main.remarks IS '备注信息';
COMMENT ON COLUMN test_data_main.del_flag IS '删除标记';
COMMENT ON COLUMN test_tree.id IS '编号';
COMMENT ON COLUMN test_tree.parent_id IS '父级编号';
COMMENT ON COLUMN test_tree.parent_ids IS '所有父级编号';
COMMENT ON COLUMN test_tree.name IS '名称';
COMMENT ON COLUMN test_tree.sort IS '排序';
COMMENT ON COLUMN test_tree.create_by IS '创建者';
COMMENT ON COLUMN test_tree.create_date IS '创建时间';
COMMENT ON COLUMN test_tree.update_by IS '更新者';
COMMENT ON COLUMN test_tree.update_date IS '更新时间';
COMMENT ON COLUMN test_tree.remarks IS '备注信息';
COMMENT ON COLUMN test_tree.del_flag IS '删除标记';
COMMENT ON TABLE test_tree IS '树结构表';
COMMENT ON TABLE test_data_main IS '业务数据表';
COMMENT ON TABLE test_data_child IS '业务数据子表';
COMMENT ON TABLE test_data IS '业务数据表';
COMMENT ON TABLE sys_user_role IS '用户-角色';
COMMENT ON TABLE sys_user IS '用户表';
COMMENT ON TABLE sys_role_office IS '角色-机构';
COMMENT ON TABLE sys_role_menu IS '角色-菜单';
COMMENT ON TABLE sys_role IS '角色表';
COMMENT ON TABLE sys_office IS '机构表';
COMMENT ON TABLE sys_menu IS '菜单表';
COMMENT ON TABLE sys_mdict IS '多级字典表';
COMMENT ON TABLE sys_log IS '日志表';
COMMENT ON TABLE sys_dict IS '字典表';
COMMENT ON TABLE sys_area IS '区域表';
COMMENT ON TABLE oa_test_audit IS '审批流程测试表';
COMMENT ON TABLE oa_notify_record IS '通知通告发送记录';
COMMENT ON TABLE oa_notify IS '通知通告';
COMMENT ON TABLE oa_leave IS '请假流程表';
COMMENT ON TABLE gen_template IS '代码模板表';
COMMENT ON TABLE gen_table_column IS '业务表字段';
COMMENT ON TABLE gen_table IS '业务表';
COMMENT ON TABLE gen_scheme IS '生成方案';
COMMENT ON TABLE cms_site IS '站点表';
COMMENT ON TABLE cms_link IS '友情链接';
COMMENT ON TABLE cms_guestbook IS '留言板';
COMMENT ON TABLE cms_comment IS '评论表';
COMMENT ON TABLE cms_category IS '栏目表';
COMMENT ON TABLE cms_article_data IS '文章详表';
COMMENT ON TABLE cms_article IS '文章表';
