-- Source: https://github.com/noname1007/vulhub/blob/7e68da1895304aaa171e97cf42cf58dbd992a184/zabbix/CVE-2020-11800/database/001_schema.sql?raw=true
-- Tables detected: 113 | FK constraints: 155
-- Foreign keys added via ALTER TABLE:
CREATE TABLE "maintenances" (
    "maintenanceid" bigint unsigned                           NOT NULL,
    "name" varchar(128)    DEFAULT ''                NOT NULL,
    "maintenance_type" integer         DEFAULT '0'               NOT NULL,
    "description" text                                      NOT NULL,
    "active_since" integer         DEFAULT '0'               NOT NULL,
    "active_till" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (maintenanceid)
);

CREATE TABLE "hosts" (
    "hostid" bigint unsigned                           NOT NULL,
    "proxy_hostid" bigint unsigned                           NULL,
    "host" varchar(128)    DEFAULT ''                NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "disable_until" integer         DEFAULT '0'               NOT NULL,
    "error" varchar(2048)   DEFAULT ''                NOT NULL,
    "available" integer         DEFAULT '0'               NOT NULL,
    "errors_from" integer         DEFAULT '0'               NOT NULL,
    "lastaccess" integer         DEFAULT '0'               NOT NULL,
    "ipmi_authtype" integer         DEFAULT '0'               NOT NULL,
    "ipmi_privilege" integer         DEFAULT '2'               NOT NULL,
    "ipmi_username" varchar(16)     DEFAULT ''                NOT NULL,
    "ipmi_password" varchar(20)     DEFAULT ''                NOT NULL,
    "ipmi_disable_until" integer         DEFAULT '0'               NOT NULL,
    "ipmi_available" integer         DEFAULT '0'               NOT NULL,
    "snmp_disable_until" integer         DEFAULT '0'               NOT NULL,
    "snmp_available" integer         DEFAULT '0'               NOT NULL,
    "maintenanceid" bigint unsigned                           NULL,
    "maintenance_status" integer         DEFAULT '0'               NOT NULL,
    "maintenance_type" integer         DEFAULT '0'               NOT NULL,
    "maintenance_from" integer         DEFAULT '0'               NOT NULL,
    "ipmi_errors_from" integer         DEFAULT '0'               NOT NULL,
    "snmp_errors_from" integer         DEFAULT '0'               NOT NULL,
    "ipmi_error" varchar(2048)   DEFAULT ''                NOT NULL,
    "snmp_error" varchar(2048)   DEFAULT ''                NOT NULL,
    "jmx_disable_until" integer         DEFAULT '0'               NOT NULL,
    "jmx_available" integer         DEFAULT '0'               NOT NULL,
    "jmx_errors_from" integer         DEFAULT '0'               NOT NULL,
    "jmx_error" varchar(2048)   DEFAULT ''                NOT NULL,
    "name" varchar(128)    DEFAULT ''                NOT NULL,
    "flags" integer         DEFAULT '0'               NOT NULL,
    "templateid" bigint unsigned                           NULL,
    "description" text                                      NOT NULL,
    "tls_connect" integer         DEFAULT '1'               NOT NULL,
    "tls_accept" integer         DEFAULT '1'               NOT NULL,
    "tls_issuer" varchar(1024)   DEFAULT ''                NOT NULL,
    "tls_subject" varchar(1024)   DEFAULT ''                NOT NULL,
    "tls_psk_identity" varchar(128)    DEFAULT ''                NOT NULL,
    "tls_psk" varchar(512)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (hostid)
);

CREATE TABLE "groups" (
    "groupid" bigint unsigned                           NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    "internal" integer         DEFAULT '0'               NOT NULL,
    "flags" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (groupid)
);

CREATE TABLE "group_prototype" (
    "group_prototypeid" bigint unsigned                           NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    "groupid" bigint unsigned                           NULL,
    "templateid" bigint unsigned                           NULL,
    PRIMARY KEY (group_prototypeid)
);

CREATE TABLE "group_discovery" (
    "groupid" bigint unsigned                           NOT NULL,
    "parent_group_prototypeid" bigint unsigned                           NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    "lastcheck" integer         DEFAULT '0'               NOT NULL,
    "ts_delete" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (groupid)
);

CREATE TABLE "screens" (
    "screenid" bigint unsigned                           NOT NULL,
    "name" varchar(255)                              NOT NULL,
    "hsize" integer         DEFAULT '1'               NOT NULL,
    "vsize" integer         DEFAULT '1'               NOT NULL,
    "templateid" bigint unsigned                           NULL,
    "userid" bigint unsigned                           NULL,
    "private" integer         DEFAULT '1'               NOT NULL,
    PRIMARY KEY (screenid)
);

CREATE TABLE "screens_items" (
    "screenitemid" bigint unsigned                           NOT NULL,
    "screenid" bigint unsigned                           NOT NULL,
    "resourcetype" integer         DEFAULT '0'               NOT NULL,
    "resourceid" bigint unsigned DEFAULT '0'               NOT NULL,
    "width" integer         DEFAULT '320'             NOT NULL,
    "height" integer         DEFAULT '200'             NOT NULL,
    "x" integer         DEFAULT '0'               NOT NULL,
    "y" integer         DEFAULT '0'               NOT NULL,
    "colspan" integer         DEFAULT '1'               NOT NULL,
    "rowspan" integer         DEFAULT '1'               NOT NULL,
    "elements" integer         DEFAULT '25'              NOT NULL,
    "valign" integer         DEFAULT '0'               NOT NULL,
    "halign" integer         DEFAULT '0'               NOT NULL,
    "style" integer         DEFAULT '0'               NOT NULL,
    "url" varchar(255)    DEFAULT ''                NOT NULL,
    "dynamic" integer         DEFAULT '0'               NOT NULL,
    "sort_triggers" integer         DEFAULT '0'               NOT NULL,
    "application" varchar(255)    DEFAULT ''                NOT NULL,
    "max_columns" integer         DEFAULT '3'               NOT NULL,
    PRIMARY KEY (screenitemid)
);

CREATE TABLE "screen_user" (
    "screenuserid" bigint unsigned                           NOT NULL,
    "screenid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "permission" integer         DEFAULT '2'               NOT NULL,
    PRIMARY KEY (screenuserid)
);

CREATE TABLE "screen_usrgrp" (
    "screenusrgrpid" bigint unsigned                           NOT NULL,
    "screenid" bigint unsigned                           NOT NULL,
    "usrgrpid" bigint unsigned                           NOT NULL,
    "permission" integer         DEFAULT '2'               NOT NULL,
    PRIMARY KEY (screenusrgrpid)
);

CREATE TABLE "slideshows" (
    "slideshowid" bigint unsigned                           NOT NULL,
    "name" varchar(255)    DEFAULT ''                NOT NULL,
    "delay" integer         DEFAULT '0'               NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "private" integer         DEFAULT '1'               NOT NULL,
    PRIMARY KEY (slideshowid)
);

CREATE TABLE "slideshow_user" (
    "slideshowuserid" bigint unsigned                           NOT NULL,
    "slideshowid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "permission" integer         DEFAULT '2'               NOT NULL,
    PRIMARY KEY (slideshowuserid)
);

CREATE TABLE "slideshow_usrgrp" (
    "slideshowusrgrpid" bigint unsigned                           NOT NULL,
    "slideshowid" bigint unsigned                           NOT NULL,
    "usrgrpid" bigint unsigned                           NOT NULL,
    "permission" integer         DEFAULT '2'               NOT NULL,
    PRIMARY KEY (slideshowusrgrpid)
);

CREATE TABLE "slides" (
    "slideid" bigint unsigned                           NOT NULL,
    "slideshowid" bigint unsigned                           NOT NULL,
    "screenid" bigint unsigned                           NOT NULL,
    "step" integer         DEFAULT '0'               NOT NULL,
    "delay" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (slideid)
);

CREATE TABLE "drules" (
    "druleid" bigint unsigned                           NOT NULL,
    "proxy_hostid" bigint unsigned                           NULL,
    "name" varchar(255)    DEFAULT ''                NOT NULL,
    "iprange" varchar(2048)   DEFAULT ''                NOT NULL,
    "delay" integer         DEFAULT '3600'            NOT NULL,
    "nextcheck" integer         DEFAULT '0'               NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (druleid)
);

CREATE TABLE "dchecks" (
    "dcheckid" bigint unsigned                           NOT NULL,
    "druleid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "key_" varchar(255)    DEFAULT ''                NOT NULL,
    "snmp_community" varchar(255)    DEFAULT ''                NOT NULL,
    "ports" varchar(255)    DEFAULT '0'               NOT NULL,
    "snmpv3_securityname" varchar(64)     DEFAULT ''                NOT NULL,
    "snmpv3_securitylevel" integer         DEFAULT '0'               NOT NULL,
    "snmpv3_authpassphrase" varchar(64)     DEFAULT ''                NOT NULL,
    "snmpv3_privpassphrase" varchar(64)     DEFAULT ''                NOT NULL,
    "uniq" integer         DEFAULT '0'               NOT NULL,
    "snmpv3_authprotocol" integer         DEFAULT '0'               NOT NULL,
    "snmpv3_privprotocol" integer         DEFAULT '0'               NOT NULL,
    "snmpv3_contextname" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (dcheckid)
);

CREATE TABLE "applications" (
    "applicationid" bigint unsigned                           NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    "name" varchar(255)    DEFAULT ''                NOT NULL,
    "flags" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (applicationid)
);

CREATE TABLE "httptest" (
    "httptestid" bigint unsigned                           NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    "applicationid" bigint unsigned                           NULL,
    "nextcheck" integer         DEFAULT '0'               NOT NULL,
    "delay" integer         DEFAULT '60'              NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "variables" text                                      NOT NULL,
    "agent" varchar(255)    DEFAULT 'Zabbix'          NOT NULL,
    "authentication" integer         DEFAULT '0'               NOT NULL,
    "http_user" varchar(64)     DEFAULT ''                NOT NULL,
    "http_password" varchar(64)     DEFAULT ''                NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    "templateid" bigint unsigned                           NULL,
    "http_proxy" varchar(255)    DEFAULT ''                NOT NULL,
    "retries" integer         DEFAULT '1'               NOT NULL,
    "ssl_cert_file" varchar(255)    DEFAULT ''                NOT NULL,
    "ssl_key_file" varchar(255)    DEFAULT ''                NOT NULL,
    "ssl_key_password" varchar(64)     DEFAULT ''                NOT NULL,
    "verify_peer" integer         DEFAULT '0'               NOT NULL,
    "verify_host" integer         DEFAULT '0'               NOT NULL,
    "headers" text                                      NOT NULL,
    PRIMARY KEY (httptestid)
);

CREATE TABLE "httpstep" (
    "httpstepid" bigint unsigned                           NOT NULL,
    "httptestid" bigint unsigned                           NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    "no" integer         DEFAULT '0'               NOT NULL,
    "url" varchar(2048)   DEFAULT ''                NOT NULL,
    "timeout" integer         DEFAULT '15'              NOT NULL,
    "posts" text                                      NOT NULL,
    "required" varchar(255)    DEFAULT ''                NOT NULL,
    "status_codes" varchar(255)    DEFAULT ''                NOT NULL,
    "variables" text                                      NOT NULL,
    "follow_redirects" integer         DEFAULT '1'               NOT NULL,
    "retrieve_mode" integer         DEFAULT '0'               NOT NULL,
    "headers" text                                      NOT NULL,
    PRIMARY KEY (httpstepid)
);

CREATE TABLE "interface" (
    "interfaceid" bigint unsigned                           NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    "main" integer         DEFAULT '0'               NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "useip" integer         DEFAULT '1'               NOT NULL,
    "ip" varchar(64)     DEFAULT '127.0.0.1'       NOT NULL,
    "dns" varchar(64)     DEFAULT ''                NOT NULL,
    "port" varchar(64)     DEFAULT '10050'           NOT NULL,
    "bulk" integer         DEFAULT '1'               NOT NULL,
    PRIMARY KEY (interfaceid)
);

CREATE TABLE "valuemaps" (
    "valuemapid" bigint unsigned                           NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    PRIMARY KEY (valuemapid)
);

CREATE TABLE "items" (
    "itemid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "snmp_community" varchar(64)     DEFAULT ''                NOT NULL,
    "snmp_oid" varchar(255)    DEFAULT ''                NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    "name" varchar(255)    DEFAULT ''                NOT NULL,
    "key_" varchar(255)    DEFAULT ''                NOT NULL,
    "delay" integer         DEFAULT '0'               NOT NULL,
    "history" integer         DEFAULT '90'              NOT NULL,
    "trends" integer         DEFAULT '365'             NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "value_type" integer         DEFAULT '0'               NOT NULL,
    "trapper_hosts" varchar(255)    DEFAULT ''                NOT NULL,
    "units" varchar(255)    DEFAULT ''                NOT NULL,
    "multiplier" integer         DEFAULT '0'               NOT NULL,
    "delta" integer         DEFAULT '0'               NOT NULL,
    "snmpv3_securityname" varchar(64)     DEFAULT ''                NOT NULL,
    "snmpv3_securitylevel" integer         DEFAULT '0'               NOT NULL,
    "snmpv3_authpassphrase" varchar(64)     DEFAULT ''                NOT NULL,
    "snmpv3_privpassphrase" varchar(64)     DEFAULT ''                NOT NULL,
    "formula" varchar(255)    DEFAULT ''                NOT NULL,
    "error" varchar(2048)   DEFAULT ''                NOT NULL,
    "lastlogsize" bigint unsigned DEFAULT '0'               NOT NULL,
    "logtimefmt" varchar(64)     DEFAULT ''                NOT NULL,
    "templateid" bigint unsigned                           NULL,
    "valuemapid" bigint unsigned                           NULL,
    "delay_flex" varchar(255)    DEFAULT ''                NOT NULL,
    "params" text                                      NOT NULL,
    "ipmi_sensor" varchar(128)    DEFAULT ''                NOT NULL,
    "data_type" integer         DEFAULT '0'               NOT NULL,
    "authtype" integer         DEFAULT '0'               NOT NULL,
    "username" varchar(64)     DEFAULT ''                NOT NULL,
    "password" varchar(64)     DEFAULT ''                NOT NULL,
    "publickey" varchar(64)     DEFAULT ''                NOT NULL,
    "privatekey" varchar(64)     DEFAULT ''                NOT NULL,
    "mtime" integer         DEFAULT '0'               NOT NULL,
    "flags" integer         DEFAULT '0'               NOT NULL,
    "interfaceid" bigint unsigned                           NULL,
    "port" varchar(64)     DEFAULT ''                NOT NULL,
    "description" text                                      NOT NULL,
    "inventory_link" integer         DEFAULT '0'               NOT NULL,
    "lifetime" varchar(64)     DEFAULT '30'              NOT NULL,
    "snmpv3_authprotocol" integer         DEFAULT '0'               NOT NULL,
    "snmpv3_privprotocol" integer         DEFAULT '0'               NOT NULL,
    "state" integer         DEFAULT '0'               NOT NULL,
    "snmpv3_contextname" varchar(255)    DEFAULT ''                NOT NULL,
    "evaltype" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (itemid)
);

CREATE TABLE "httpstepitem" (
    "httpstepitemid" bigint unsigned                           NOT NULL,
    "httpstepid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (httpstepitemid)
);

CREATE TABLE "httptestitem" (
    "httptestitemid" bigint unsigned                           NOT NULL,
    "httptestid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (httptestitemid)
);

CREATE TABLE "media_type" (
    "mediatypeid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "description" varchar(100)    DEFAULT ''                NOT NULL,
    "smtp_server" varchar(255)    DEFAULT ''                NOT NULL,
    "smtp_helo" varchar(255)    DEFAULT ''                NOT NULL,
    "smtp_email" varchar(255)    DEFAULT ''                NOT NULL,
    "exec_path" varchar(255)    DEFAULT ''                NOT NULL,
    "gsm_modem" varchar(255)    DEFAULT ''                NOT NULL,
    "username" varchar(255)    DEFAULT ''                NOT NULL,
    "passwd" varchar(255)    DEFAULT ''                NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "smtp_port" integer         DEFAULT '25'              NOT NULL,
    "smtp_security" integer         DEFAULT '0'               NOT NULL,
    "smtp_verify_peer" integer         DEFAULT '0'               NOT NULL,
    "smtp_verify_host" integer         DEFAULT '0'               NOT NULL,
    "smtp_authentication" integer         DEFAULT '0'               NOT NULL,
    "exec_params" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (mediatypeid)
);

CREATE TABLE "users" (
    "userid" bigint unsigned                           NOT NULL,
    "alias" varchar(100)    DEFAULT ''                NOT NULL,
    "name" varchar(100)    DEFAULT ''                NOT NULL,
    "surname" varchar(100)    DEFAULT ''                NOT NULL,
    "passwd" char(32)        DEFAULT ''                NOT NULL,
    "url" varchar(255)    DEFAULT ''                NOT NULL,
    "autologin" integer         DEFAULT '0'               NOT NULL,
    "autologout" integer         DEFAULT '900'             NOT NULL,
    "lang" varchar(5)      DEFAULT 'en_GB'           NOT NULL,
    "refresh" integer         DEFAULT '30'              NOT NULL,
    "type" integer         DEFAULT '1'               NOT NULL,
    "theme" varchar(128)    DEFAULT 'default'         NOT NULL,
    "attempt_failed" integer         DEFAULT 0                 NOT NULL,
    "attempt_ip" varchar(39)     DEFAULT ''                NOT NULL,
    "attempt_clock" integer         DEFAULT 0                 NOT NULL,
    "rows_per_page" integer         DEFAULT 50                NOT NULL,
    PRIMARY KEY (userid)
);

CREATE TABLE "usrgrp" (
    "usrgrpid" bigint unsigned                           NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    "gui_access" integer         DEFAULT '0'               NOT NULL,
    "users_status" integer         DEFAULT '0'               NOT NULL,
    "debug_mode" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (usrgrpid)
);

CREATE TABLE "users_groups" (
    "id" bigint unsigned                           NOT NULL,
    "usrgrpid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE "scripts" (
    "scriptid" bigint unsigned                           NOT NULL,
    "name" varchar(255)    DEFAULT ''                NOT NULL,
    "command" varchar(255)    DEFAULT ''                NOT NULL,
    "host_access" integer         DEFAULT '2'               NOT NULL,
    "usrgrpid" bigint unsigned                           NULL,
    "groupid" bigint unsigned                           NULL,
    "description" text                                      NOT NULL,
    "confirmation" varchar(255)    DEFAULT ''                NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "execute_on" integer         DEFAULT '1'               NOT NULL,
    PRIMARY KEY (scriptid)
);

CREATE TABLE "actions" (
    "actionid" bigint unsigned                           NOT NULL,
    "name" varchar(255)    DEFAULT ''                NOT NULL,
    "eventsource" integer         DEFAULT '0'               NOT NULL,
    "evaltype" integer         DEFAULT '0'               NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "esc_period" integer         DEFAULT '0'               NOT NULL,
    "def_shortdata" varchar(255)    DEFAULT ''                NOT NULL,
    "def_longdata" text                                      NOT NULL,
    "recovery_msg" integer         DEFAULT '0'               NOT NULL,
    "r_shortdata" varchar(255)    DEFAULT ''                NOT NULL,
    "r_longdata" text                                      NOT NULL,
    "formula" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (actionid)
);

CREATE TABLE "operations" (
    "operationid" bigint unsigned                           NOT NULL,
    "actionid" bigint unsigned                           NOT NULL,
    "operationtype" integer         DEFAULT '0'               NOT NULL,
    "esc_period" integer         DEFAULT '0'               NOT NULL,
    "esc_step_from" integer         DEFAULT '1'               NOT NULL,
    "esc_step_to" integer         DEFAULT '1'               NOT NULL,
    "evaltype" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (operationid)
);

CREATE TABLE "opmessage" (
    "operationid" bigint unsigned                           NOT NULL,
    "default_msg" integer         DEFAULT '0'               NOT NULL,
    "subject" varchar(255)    DEFAULT ''                NOT NULL,
    "message" text                                      NOT NULL,
    "mediatypeid" bigint unsigned                           NULL,
    PRIMARY KEY (operationid)
);

CREATE TABLE "opmessage_grp" (
    "opmessage_grpid" bigint unsigned                           NOT NULL,
    "operationid" bigint unsigned                           NOT NULL,
    "usrgrpid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (opmessage_grpid)
);

CREATE TABLE "opmessage_usr" (
    "opmessage_usrid" bigint unsigned                           NOT NULL,
    "operationid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (opmessage_usrid)
);

CREATE TABLE "opcommand" (
    "operationid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "scriptid" bigint unsigned                           NULL,
    "execute_on" integer         DEFAULT '0'               NOT NULL,
    "port" varchar(64)     DEFAULT ''                NOT NULL,
    "authtype" integer         DEFAULT '0'               NOT NULL,
    "username" varchar(64)     DEFAULT ''                NOT NULL,
    "password" varchar(64)     DEFAULT ''                NOT NULL,
    "publickey" varchar(64)     DEFAULT ''                NOT NULL,
    "privatekey" varchar(64)     DEFAULT ''                NOT NULL,
    "command" text                                      NOT NULL,
    PRIMARY KEY (operationid)
);

CREATE TABLE "opcommand_hst" (
    "opcommand_hstid" bigint unsigned                           NOT NULL,
    "operationid" bigint unsigned                           NOT NULL,
    "hostid" bigint unsigned                           NULL,
    PRIMARY KEY (opcommand_hstid)
);

CREATE TABLE "opcommand_grp" (
    "opcommand_grpid" bigint unsigned                           NOT NULL,
    "operationid" bigint unsigned                           NOT NULL,
    "groupid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (opcommand_grpid)
);

CREATE TABLE "opgroup" (
    "opgroupid" bigint unsigned                           NOT NULL,
    "operationid" bigint unsigned                           NOT NULL,
    "groupid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (opgroupid)
);

CREATE TABLE "optemplate" (
    "optemplateid" bigint unsigned                           NOT NULL,
    "operationid" bigint unsigned                           NOT NULL,
    "templateid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (optemplateid)
);

CREATE TABLE "opconditions" (
    "opconditionid" bigint unsigned                           NOT NULL,
    "operationid" bigint unsigned                           NOT NULL,
    "conditiontype" integer         DEFAULT '0'               NOT NULL,
    "operator" integer         DEFAULT '0'               NOT NULL,
    "value" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (opconditionid)
);

CREATE TABLE "conditions" (
    "conditionid" bigint unsigned                           NOT NULL,
    "actionid" bigint unsigned                           NOT NULL,
    "conditiontype" integer         DEFAULT '0'               NOT NULL,
    "operator" integer         DEFAULT '0'               NOT NULL,
    "value" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (conditionid)
);

CREATE TABLE "config" (
    "configid" bigint unsigned                           NOT NULL,
    "refresh_unsupported" integer         DEFAULT '0'               NOT NULL,
    "work_period" varchar(100)    DEFAULT '1-5,00:00-24:00' NOT NULL,
    "alert_usrgrpid" bigint unsigned                           NULL,
    "event_ack_enable" integer         DEFAULT '1'               NOT NULL,
    "event_expire" integer         DEFAULT '7'               NOT NULL,
    "event_show_max" integer         DEFAULT '100'             NOT NULL,
    "default_theme" varchar(128)    DEFAULT 'blue-theme'      NOT NULL,
    "authentication_type" integer         DEFAULT '0'               NOT NULL,
    "ldap_host" varchar(255)    DEFAULT ''                NOT NULL,
    "ldap_port" integer         DEFAULT 389               NOT NULL,
    "ldap_base_dn" varchar(255)    DEFAULT ''                NOT NULL,
    "ldap_bind_dn" varchar(255)    DEFAULT ''                NOT NULL,
    "ldap_bind_password" varchar(128)    DEFAULT ''                NOT NULL,
    "ldap_search_attribute" varchar(128)    DEFAULT ''                NOT NULL,
    "dropdown_first_entry" integer         DEFAULT '1'               NOT NULL,
    "dropdown_first_remember" integer         DEFAULT '1'               NOT NULL,
    "discovery_groupid" bigint unsigned                           NOT NULL,
    "max_in_table" integer         DEFAULT '50'              NOT NULL,
    "search_limit" integer         DEFAULT '1000'            NOT NULL,
    "severity_color_0" varchar(6)      DEFAULT '97AAB3'          NOT NULL,
    "severity_color_1" varchar(6)      DEFAULT '7499FF'          NOT NULL,
    "severity_color_2" varchar(6)      DEFAULT 'FFC859'          NOT NULL,
    "severity_color_3" varchar(6)      DEFAULT 'FFA059'          NOT NULL,
    "severity_color_4" varchar(6)      DEFAULT 'E97659'          NOT NULL,
    "severity_color_5" varchar(6)      DEFAULT 'E45959'          NOT NULL,
    "severity_name_0" varchar(32)     DEFAULT 'Not classified'  NOT NULL,
    "severity_name_1" varchar(32)     DEFAULT 'Information'     NOT NULL,
    "severity_name_2" varchar(32)     DEFAULT 'Warning'         NOT NULL,
    "severity_name_3" varchar(32)     DEFAULT 'Average'         NOT NULL,
    "severity_name_4" varchar(32)     DEFAULT 'High'            NOT NULL,
    "severity_name_5" varchar(32)     DEFAULT 'Disaster'        NOT NULL,
    "ok_period" integer         DEFAULT '1800'            NOT NULL,
    "blink_period" integer         DEFAULT '1800'            NOT NULL,
    "problem_unack_color" varchar(6)      DEFAULT 'DC0000'          NOT NULL,
    "problem_ack_color" varchar(6)      DEFAULT 'DC0000'          NOT NULL,
    "ok_unack_color" varchar(6)      DEFAULT '00AA00'          NOT NULL,
    "ok_ack_color" varchar(6)      DEFAULT '00AA00'          NOT NULL,
    "problem_unack_style" integer         DEFAULT '1'               NOT NULL,
    "problem_ack_style" integer         DEFAULT '1'               NOT NULL,
    "ok_unack_style" integer         DEFAULT '1'               NOT NULL,
    "ok_ack_style" integer         DEFAULT '1'               NOT NULL,
    "snmptrap_logging" integer         DEFAULT '1'               NOT NULL,
    "server_check_interval" integer         DEFAULT '10'              NOT NULL,
    "hk_events_mode" integer         DEFAULT '1'               NOT NULL,
    "hk_events_trigger" integer         DEFAULT '365'             NOT NULL,
    "hk_events_internal" integer         DEFAULT '365'             NOT NULL,
    "hk_events_discovery" integer         DEFAULT '365'             NOT NULL,
    "hk_events_autoreg" integer         DEFAULT '365'             NOT NULL,
    "hk_services_mode" integer         DEFAULT '1'               NOT NULL,
    "hk_services" integer         DEFAULT '365'             NOT NULL,
    "hk_audit_mode" integer         DEFAULT '1'               NOT NULL,
    "hk_audit" integer         DEFAULT '365'             NOT NULL,
    "hk_sessions_mode" integer         DEFAULT '1'               NOT NULL,
    "hk_sessions" integer         DEFAULT '365'             NOT NULL,
    "hk_history_mode" integer         DEFAULT '1'               NOT NULL,
    "hk_history_global" integer         DEFAULT '0'               NOT NULL,
    "hk_history" integer         DEFAULT '90'              NOT NULL,
    "hk_trends_mode" integer         DEFAULT '1'               NOT NULL,
    "hk_trends_global" integer         DEFAULT '0'               NOT NULL,
    "hk_trends" integer         DEFAULT '365'             NOT NULL,
    "default_inventory_mode" integer         DEFAULT '-1'              NOT NULL,
    PRIMARY KEY (configid)
);

CREATE TABLE "triggers" (
    "triggerid" bigint unsigned                           NOT NULL,
    "expression" varchar(2048)   DEFAULT ''                NOT NULL,
    "description" varchar(255)    DEFAULT ''                NOT NULL,
    "url" varchar(255)    DEFAULT ''                NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "value" integer         DEFAULT '0'               NOT NULL,
    "priority" integer         DEFAULT '0'               NOT NULL,
    "lastchange" integer         DEFAULT '0'               NOT NULL,
    "comments" text                                      NOT NULL,
    "error" varchar(128)    DEFAULT ''                NOT NULL,
    "templateid" bigint unsigned                           NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "state" integer         DEFAULT '0'               NOT NULL,
    "flags" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (triggerid)
);

CREATE TABLE "trigger_depends" (
    "triggerdepid" bigint unsigned                           NOT NULL,
    "triggerid_down" bigint unsigned                           NOT NULL,
    "triggerid_up" bigint unsigned                           NOT NULL,
    PRIMARY KEY (triggerdepid)
);

CREATE TABLE "functions" (
    "functionid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "triggerid" bigint unsigned                           NOT NULL,
    "function" varchar(12)     DEFAULT ''                NOT NULL,
    "parameter" varchar(255)    DEFAULT '0'               NOT NULL,
    PRIMARY KEY (functionid)
);

CREATE TABLE "graphs" (
    "graphid" bigint unsigned                           NOT NULL,
    "name" varchar(128)    DEFAULT ''                NOT NULL,
    "width" integer         DEFAULT '900'             NOT NULL,
    "height" integer         DEFAULT '200'             NOT NULL,
    "yaxismin" double(16,4)    DEFAULT '0'               NOT NULL,
    "yaxismax" double(16,4)    DEFAULT '100'             NOT NULL,
    "templateid" bigint unsigned                           NULL,
    "show_work_period" integer         DEFAULT '1'               NOT NULL,
    "show_triggers" integer         DEFAULT '1'               NOT NULL,
    "graphtype" integer         DEFAULT '0'               NOT NULL,
    "show_legend" integer         DEFAULT '1'               NOT NULL,
    "show_3d" integer         DEFAULT '0'               NOT NULL,
    "percent_left" double(16,4)    DEFAULT '0'               NOT NULL,
    "percent_right" double(16,4)    DEFAULT '0'               NOT NULL,
    "ymin_type" integer         DEFAULT '0'               NOT NULL,
    "ymax_type" integer         DEFAULT '0'               NOT NULL,
    "ymin_itemid" bigint unsigned                           NULL,
    "ymax_itemid" bigint unsigned                           NULL,
    "flags" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (graphid)
);

CREATE TABLE "graphs_items" (
    "gitemid" bigint unsigned                           NOT NULL,
    "graphid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "drawtype" integer         DEFAULT '0'               NOT NULL,
    "sortorder" integer         DEFAULT '0'               NOT NULL,
    "color" varchar(6)      DEFAULT '009600'          NOT NULL,
    "yaxisside" integer         DEFAULT '0'               NOT NULL,
    "calc_fnc" integer         DEFAULT '2'               NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (gitemid)
);

CREATE TABLE "graph_theme" (
    "graphthemeid" bigint unsigned                           NOT NULL,
    "theme" varchar(64)     DEFAULT ''                NOT NULL,
    "backgroundcolor" varchar(6)      DEFAULT ''                NOT NULL,
    "graphcolor" varchar(6)      DEFAULT ''                NOT NULL,
    "gridcolor" varchar(6)      DEFAULT ''                NOT NULL,
    "maingridcolor" varchar(6)      DEFAULT ''                NOT NULL,
    "gridbordercolor" varchar(6)      DEFAULT ''                NOT NULL,
    "textcolor" varchar(6)      DEFAULT ''                NOT NULL,
    "highlightcolor" varchar(6)      DEFAULT ''                NOT NULL,
    "leftpercentilecolor" varchar(6)      DEFAULT ''                NOT NULL,
    "rightpercentilecolor" varchar(6)      DEFAULT ''                NOT NULL,
    "nonworktimecolor" varchar(6)      DEFAULT ''                NOT NULL,
    PRIMARY KEY (graphthemeid)
);

CREATE TABLE "globalmacro" (
    "globalmacroid" bigint unsigned                           NOT NULL,
    "macro" varchar(255)    DEFAULT ''                NOT NULL,
    "value" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (globalmacroid)
);

CREATE TABLE "hostmacro" (
    "hostmacroid" bigint unsigned                           NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    "macro" varchar(255)    DEFAULT ''                NOT NULL,
    "value" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (hostmacroid)
);

CREATE TABLE "hosts_groups" (
    "hostgroupid" bigint unsigned                           NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    "groupid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (hostgroupid)
);

CREATE TABLE "hosts_templates" (
    "hosttemplateid" bigint unsigned                           NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    "templateid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (hosttemplateid)
);

CREATE TABLE "items_applications" (
    "itemappid" bigint unsigned                           NOT NULL,
    "applicationid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (itemappid)
);

CREATE TABLE "mappings" (
    "mappingid" bigint unsigned                           NOT NULL,
    "valuemapid" bigint unsigned                           NOT NULL,
    "value" varchar(64)     DEFAULT ''                NOT NULL,
    "newvalue" varchar(64)     DEFAULT ''                NOT NULL,
    PRIMARY KEY (mappingid)
);

CREATE TABLE "media" (
    "mediaid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "mediatypeid" bigint unsigned                           NOT NULL,
    "sendto" varchar(100)    DEFAULT ''                NOT NULL,
    "active" integer         DEFAULT '0'               NOT NULL,
    "severity" integer         DEFAULT '63'              NOT NULL,
    "period" varchar(100)    DEFAULT '1-7,00:00-24:00' NOT NULL,
    PRIMARY KEY (mediaid)
);

CREATE TABLE "rights" (
    "rightid" bigint unsigned                           NOT NULL,
    "groupid" bigint unsigned                           NOT NULL,
    "permission" integer         DEFAULT '0'               NOT NULL,
    "id" bigint unsigned                           NOT NULL,
    PRIMARY KEY (rightid)
);

CREATE TABLE "services" (
    "serviceid" bigint unsigned                           NOT NULL,
    "name" varchar(128)    DEFAULT ''                NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "algorithm" integer         DEFAULT '0'               NOT NULL,
    "triggerid" bigint unsigned                           NULL,
    "showsla" integer         DEFAULT '0'               NOT NULL,
    "goodsla" double(16,4)    DEFAULT '99.9'            NOT NULL,
    "sortorder" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (serviceid)
);

CREATE TABLE "services_links" (
    "linkid" bigint unsigned                           NOT NULL,
    "serviceupid" bigint unsigned                           NOT NULL,
    "servicedownid" bigint unsigned                           NOT NULL,
    "soft" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (linkid)
);

CREATE TABLE "services_times" (
    "timeid" bigint unsigned                           NOT NULL,
    "serviceid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "ts_from" integer         DEFAULT '0'               NOT NULL,
    "ts_to" integer         DEFAULT '0'               NOT NULL,
    "note" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (timeid)
);

CREATE TABLE "icon_map" (
    "iconmapid" bigint unsigned                           NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    "default_iconid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (iconmapid)
);

CREATE TABLE "icon_mapping" (
    "iconmappingid" bigint unsigned                           NOT NULL,
    "iconmapid" bigint unsigned                           NOT NULL,
    "iconid" bigint unsigned                           NOT NULL,
    "inventory_link" integer         DEFAULT '0'               NOT NULL,
    "expression" varchar(64)     DEFAULT ''                NOT NULL,
    "sortorder" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (iconmappingid)
);

CREATE TABLE "sysmaps" (
    "sysmapid" bigint unsigned                           NOT NULL,
    "name" varchar(128)    DEFAULT ''                NOT NULL,
    "width" integer         DEFAULT '600'             NOT NULL,
    "height" integer         DEFAULT '400'             NOT NULL,
    "backgroundid" bigint unsigned                           NULL,
    "label_type" integer         DEFAULT '2'               NOT NULL,
    "label_location" integer         DEFAULT '0'               NOT NULL,
    "highlight" integer         DEFAULT '1'               NOT NULL,
    "expandproblem" integer         DEFAULT '1'               NOT NULL,
    "markelements" integer         DEFAULT '0'               NOT NULL,
    "show_unack" integer         DEFAULT '0'               NOT NULL,
    "grid_size" integer         DEFAULT '50'              NOT NULL,
    "grid_show" integer         DEFAULT '1'               NOT NULL,
    "grid_align" integer         DEFAULT '1'               NOT NULL,
    "label_format" integer         DEFAULT '0'               NOT NULL,
    "label_type_host" integer         DEFAULT '2'               NOT NULL,
    "label_type_hostgroup" integer         DEFAULT '2'               NOT NULL,
    "label_type_trigger" integer         DEFAULT '2'               NOT NULL,
    "label_type_map" integer         DEFAULT '2'               NOT NULL,
    "label_type_image" integer         DEFAULT '2'               NOT NULL,
    "label_string_host" varchar(255)    DEFAULT ''                NOT NULL,
    "label_string_hostgroup" varchar(255)    DEFAULT ''                NOT NULL,
    "label_string_trigger" varchar(255)    DEFAULT ''                NOT NULL,
    "label_string_map" varchar(255)    DEFAULT ''                NOT NULL,
    "label_string_image" varchar(255)    DEFAULT ''                NOT NULL,
    "iconmapid" bigint unsigned                           NULL,
    "expand_macros" integer         DEFAULT '0'               NOT NULL,
    "severity_min" integer         DEFAULT '0'               NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "private" integer         DEFAULT '1'               NOT NULL,
    PRIMARY KEY (sysmapid)
);

CREATE TABLE "sysmaps_elements" (
    "selementid" bigint unsigned                           NOT NULL,
    "sysmapid" bigint unsigned                           NOT NULL,
    "elementid" bigint unsigned DEFAULT '0'               NOT NULL,
    "elementtype" integer         DEFAULT '0'               NOT NULL,
    "iconid_off" bigint unsigned                           NULL,
    "iconid_on" bigint unsigned                           NULL,
    "label" varchar(2048)   DEFAULT ''                NOT NULL,
    "label_location" integer         DEFAULT '-1'              NOT NULL,
    "x" integer         DEFAULT '0'               NOT NULL,
    "y" integer         DEFAULT '0'               NOT NULL,
    "iconid_disabled" bigint unsigned                           NULL,
    "iconid_maintenance" bigint unsigned                           NULL,
    "elementsubtype" integer         DEFAULT '0'               NOT NULL,
    "areatype" integer         DEFAULT '0'               NOT NULL,
    "width" integer         DEFAULT '200'             NOT NULL,
    "height" integer         DEFAULT '200'             NOT NULL,
    "viewtype" integer         DEFAULT '0'               NOT NULL,
    "use_iconmap" integer         DEFAULT '1'               NOT NULL,
    "application" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (selementid)
);

CREATE TABLE "sysmaps_links" (
    "linkid" bigint unsigned                           NOT NULL,
    "sysmapid" bigint unsigned                           NOT NULL,
    "selementid1" bigint unsigned                           NOT NULL,
    "selementid2" bigint unsigned                           NOT NULL,
    "drawtype" integer         DEFAULT '0'               NOT NULL,
    "color" varchar(6)      DEFAULT '000000'          NOT NULL,
    "label" varchar(2048)   DEFAULT ''                NOT NULL,
    PRIMARY KEY (linkid)
);

CREATE TABLE "sysmaps_link_triggers" (
    "linktriggerid" bigint unsigned                           NOT NULL,
    "linkid" bigint unsigned                           NOT NULL,
    "triggerid" bigint unsigned                           NOT NULL,
    "drawtype" integer         DEFAULT '0'               NOT NULL,
    "color" varchar(6)      DEFAULT '000000'          NOT NULL,
    PRIMARY KEY (linktriggerid)
);

CREATE TABLE "sysmap_element_url" (
    "sysmapelementurlid" bigint unsigned                           NOT NULL,
    "selementid" bigint unsigned                           NOT NULL,
    "name" varchar(255)                              NOT NULL,
    "url" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (sysmapelementurlid)
);

CREATE TABLE "sysmap_url" (
    "sysmapurlid" bigint unsigned                           NOT NULL,
    "sysmapid" bigint unsigned                           NOT NULL,
    "name" varchar(255)                              NOT NULL,
    "url" varchar(255)    DEFAULT ''                NOT NULL,
    "elementtype" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (sysmapurlid)
);

CREATE TABLE "sysmap_user" (
    "sysmapuserid" bigint unsigned                           NOT NULL,
    "sysmapid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "permission" integer         DEFAULT '2'               NOT NULL,
    PRIMARY KEY (sysmapuserid)
);

CREATE TABLE "sysmap_usrgrp" (
    "sysmapusrgrpid" bigint unsigned                           NOT NULL,
    "sysmapid" bigint unsigned                           NOT NULL,
    "usrgrpid" bigint unsigned                           NOT NULL,
    "permission" integer         DEFAULT '2'               NOT NULL,
    PRIMARY KEY (sysmapusrgrpid)
);

CREATE TABLE "maintenances_hosts" (
    "maintenance_hostid" bigint unsigned                           NOT NULL,
    "maintenanceid" bigint unsigned                           NOT NULL,
    "hostid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (maintenance_hostid)
);

CREATE TABLE "maintenances_groups" (
    "maintenance_groupid" bigint unsigned                           NOT NULL,
    "maintenanceid" bigint unsigned                           NOT NULL,
    "groupid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (maintenance_groupid)
);

CREATE TABLE "timeperiods" (
    "timeperiodid" bigint unsigned                           NOT NULL,
    "timeperiod_type" integer         DEFAULT '0'               NOT NULL,
    "every" integer         DEFAULT '1'               NOT NULL,
    "month" integer         DEFAULT '0'               NOT NULL,
    "dayofweek" integer         DEFAULT '0'               NOT NULL,
    "day" integer         DEFAULT '0'               NOT NULL,
    "start_time" integer         DEFAULT '0'               NOT NULL,
    "period" integer         DEFAULT '0'               NOT NULL,
    "start_date" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (timeperiodid)
);

CREATE TABLE "maintenances_windows" (
    "maintenance_timeperiodid" bigint unsigned                           NOT NULL,
    "maintenanceid" bigint unsigned                           NOT NULL,
    "timeperiodid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (maintenance_timeperiodid)
);

CREATE TABLE "regexps" (
    "regexpid" bigint unsigned                           NOT NULL,
    "name" varchar(128)    DEFAULT ''                NOT NULL,
    "test_string" text                                      NOT NULL,
    PRIMARY KEY (regexpid)
);

CREATE TABLE "expressions" (
    "expressionid" bigint unsigned                           NOT NULL,
    "regexpid" bigint unsigned                           NOT NULL,
    "expression" varchar(255)    DEFAULT ''                NOT NULL,
    "expression_type" integer         DEFAULT '0'               NOT NULL,
    "exp_delimiter" varchar(1)      DEFAULT ''                NOT NULL,
    "case_sensitive" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (expressionid)
);

CREATE TABLE "ids" (
    "table_name" varchar(64)     DEFAULT ''                NOT NULL,
    "field_name" varchar(64)     DEFAULT ''                NOT NULL,
    "nextid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (table_name,field_name)
);

CREATE TABLE "alerts" (
    "alertid" bigint unsigned                           NOT NULL,
    "actionid" bigint unsigned                           NOT NULL,
    "eventid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "mediatypeid" bigint unsigned                           NULL,
    "sendto" varchar(100)    DEFAULT ''                NOT NULL,
    "subject" varchar(255)    DEFAULT ''                NOT NULL,
    "message" text                                      NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "retries" integer         DEFAULT '0'               NOT NULL,
    "error" varchar(128)    DEFAULT ''                NOT NULL,
    "esc_step" integer         DEFAULT '0'               NOT NULL,
    "alerttype" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (alertid)
);

CREATE TABLE "history" (
    "itemid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "value" double(16,4)    DEFAULT '0.0000'          NOT NULL,
    "ns" integer         DEFAULT '0'               NOT NULL
);

CREATE TABLE "history_uint" (
    "itemid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "value" bigint unsigned DEFAULT '0'               NOT NULL,
    "ns" integer         DEFAULT '0'               NOT NULL
);

CREATE TABLE "history_str" (
    "itemid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "value" varchar(255)    DEFAULT ''                NOT NULL,
    "ns" integer         DEFAULT '0'               NOT NULL
);

CREATE TABLE "history_log" (
    "id" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "timestamp" integer         DEFAULT '0'               NOT NULL,
    "source" varchar(64)     DEFAULT ''                NOT NULL,
    "severity" integer         DEFAULT '0'               NOT NULL,
    "value" text                                      NOT NULL,
    "logeventid" integer         DEFAULT '0'               NOT NULL,
    "ns" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE "history_text" (
    "id" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "value" text                                      NOT NULL,
    "ns" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE "proxy_history" (
    "id" bigint unsigned                           NOT NULL auto_increment,
    "itemid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "timestamp" integer         DEFAULT '0'               NOT NULL,
    "source" varchar(64)     DEFAULT ''                NOT NULL,
    "severity" integer         DEFAULT '0'               NOT NULL,
    "value" TEXT                                  NOT NULL,
    "logeventid" integer         DEFAULT '0'               NOT NULL,
    "ns" integer         DEFAULT '0'               NOT NULL,
    "state" integer         DEFAULT '0'               NOT NULL,
    "lastlogsize" bigint unsigned DEFAULT '0'               NOT NULL,
    "mtime" integer         DEFAULT '0'               NOT NULL,
    "flags" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE "proxy_dhistory" (
    "id" bigint unsigned                           NOT NULL auto_increment,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "druleid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "ip" varchar(39)     DEFAULT ''                NOT NULL,
    "port" integer         DEFAULT '0'               NOT NULL,
    "key_" varchar(255)    DEFAULT ''                NOT NULL,
    "value" varchar(255)    DEFAULT ''                NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "dcheckid" bigint unsigned                           NULL,
    "dns" varchar(64)     DEFAULT ''                NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE "events" (
    "eventid" bigint unsigned                           NOT NULL,
    "source" integer         DEFAULT '0'               NOT NULL,
    "object" integer         DEFAULT '0'               NOT NULL,
    "objectid" bigint unsigned DEFAULT '0'               NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "value" integer         DEFAULT '0'               NOT NULL,
    "acknowledged" integer         DEFAULT '0'               NOT NULL,
    "ns" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (eventid)
);

CREATE TABLE "trends" (
    "itemid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "num" integer         DEFAULT '0'               NOT NULL,
    "value_min" double(16,4)    DEFAULT '0.0000'          NOT NULL,
    "value_avg" double(16,4)    DEFAULT '0.0000'          NOT NULL,
    "value_max" double(16,4)    DEFAULT '0.0000'          NOT NULL,
    PRIMARY KEY (itemid,clock)
);

CREATE TABLE "trends_uint" (
    "itemid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "num" integer         DEFAULT '0'               NOT NULL,
    "value_min" bigint unsigned DEFAULT '0'               NOT NULL,
    "value_avg" bigint unsigned DEFAULT '0'               NOT NULL,
    "value_max" bigint unsigned DEFAULT '0'               NOT NULL,
    PRIMARY KEY (itemid,clock)
);

CREATE TABLE "acknowledges" (
    "acknowledgeid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "eventid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "message" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (acknowledgeid)
);

CREATE TABLE "auditlog" (
    "auditid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "action" integer         DEFAULT '0'               NOT NULL,
    "resourcetype" integer         DEFAULT '0'               NOT NULL,
    "details" varchar(128)    DEFAULT '0'               NOT NULL,
    "ip" varchar(39)     DEFAULT ''                NOT NULL,
    "resourceid" bigint unsigned DEFAULT '0'               NOT NULL,
    "resourcename" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (auditid)
);

CREATE TABLE "auditlog_details" (
    "auditdetailid" bigint unsigned                           NOT NULL,
    "auditid" bigint unsigned                           NOT NULL,
    "table_name" varchar(64)     DEFAULT ''                NOT NULL,
    "field_name" varchar(64)     DEFAULT ''                NOT NULL,
    "oldvalue" text                                      NOT NULL,
    "newvalue" text                                      NOT NULL,
    PRIMARY KEY (auditdetailid)
);

CREATE TABLE "service_alarms" (
    "servicealarmid" bigint unsigned                           NOT NULL,
    "serviceid" bigint unsigned                           NOT NULL,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "value" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (servicealarmid)
);

CREATE TABLE "autoreg_host" (
    "autoreg_hostid" bigint unsigned                           NOT NULL,
    "proxy_hostid" bigint unsigned                           NULL,
    "host" varchar(64)     DEFAULT ''                NOT NULL,
    "listen_ip" varchar(39)     DEFAULT ''                NOT NULL,
    "listen_port" integer         DEFAULT '0'               NOT NULL,
    "listen_dns" varchar(64)     DEFAULT ''                NOT NULL,
    "host_metadata" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (autoreg_hostid)
);

CREATE TABLE "proxy_autoreg_host" (
    "id" bigint unsigned                           NOT NULL auto_increment,
    "clock" integer         DEFAULT '0'               NOT NULL,
    "host" varchar(64)     DEFAULT ''                NOT NULL,
    "listen_ip" varchar(39)     DEFAULT ''                NOT NULL,
    "listen_port" integer         DEFAULT '0'               NOT NULL,
    "listen_dns" varchar(64)     DEFAULT ''                NOT NULL,
    "host_metadata" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE "dhosts" (
    "dhostid" bigint unsigned                           NOT NULL,
    "druleid" bigint unsigned                           NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "lastup" integer         DEFAULT '0'               NOT NULL,
    "lastdown" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (dhostid)
);

CREATE TABLE "dservices" (
    "dserviceid" bigint unsigned                           NOT NULL,
    "dhostid" bigint unsigned                           NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    "key_" varchar(255)    DEFAULT ''                NOT NULL,
    "value" varchar(255)    DEFAULT ''                NOT NULL,
    "port" integer         DEFAULT '0'               NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "lastup" integer         DEFAULT '0'               NOT NULL,
    "lastdown" integer         DEFAULT '0'               NOT NULL,
    "dcheckid" bigint unsigned                           NOT NULL,
    "ip" varchar(39)     DEFAULT ''                NOT NULL,
    "dns" varchar(64)     DEFAULT ''                NOT NULL,
    PRIMARY KEY (dserviceid)
);

CREATE TABLE "escalations" (
    "escalationid" bigint unsigned                           NOT NULL,
    "actionid" bigint unsigned                           NOT NULL,
    "triggerid" bigint unsigned                           NULL,
    "eventid" bigint unsigned                           NULL,
    "r_eventid" bigint unsigned                           NULL,
    "nextcheck" integer         DEFAULT '0'               NOT NULL,
    "esc_step" integer         DEFAULT '0'               NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    "itemid" bigint unsigned                           NULL,
    PRIMARY KEY (escalationid)
);

CREATE TABLE "globalvars" (
    "globalvarid" bigint unsigned                           NOT NULL,
    "snmp_lastsize" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (globalvarid)
);

CREATE TABLE "graph_discovery" (
    "graphid" bigint unsigned                           NOT NULL,
    "parent_graphid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (graphid)
);

CREATE TABLE "host_inventory" (
    "hostid" bigint unsigned                           NOT NULL,
    "inventory_mode" integer         DEFAULT '0'               NOT NULL,
    "type" varchar(64)     DEFAULT ''                NOT NULL,
    "type_full" varchar(64)     DEFAULT ''                NOT NULL,
    "name" varchar(64)     DEFAULT ''                NOT NULL,
    "alias" varchar(64)     DEFAULT ''                NOT NULL,
    "os" varchar(64)     DEFAULT ''                NOT NULL,
    "os_full" varchar(255)    DEFAULT ''                NOT NULL,
    "os_short" varchar(64)     DEFAULT ''                NOT NULL,
    "serialno_a" varchar(64)     DEFAULT ''                NOT NULL,
    "serialno_b" varchar(64)     DEFAULT ''                NOT NULL,
    "tag" varchar(64)     DEFAULT ''                NOT NULL,
    "asset_tag" varchar(64)     DEFAULT ''                NOT NULL,
    "macaddress_a" varchar(64)     DEFAULT ''                NOT NULL,
    "macaddress_b" varchar(64)     DEFAULT ''                NOT NULL,
    "hardware" varchar(255)    DEFAULT ''                NOT NULL,
    "hardware_full" text                                      NOT NULL,
    "software" varchar(255)    DEFAULT ''                NOT NULL,
    "software_full" text                                      NOT NULL,
    "software_app_a" varchar(64)     DEFAULT ''                NOT NULL,
    "software_app_b" varchar(64)     DEFAULT ''                NOT NULL,
    "software_app_c" varchar(64)     DEFAULT ''                NOT NULL,
    "software_app_d" varchar(64)     DEFAULT ''                NOT NULL,
    "software_app_e" varchar(64)     DEFAULT ''                NOT NULL,
    "contact" text                                      NOT NULL,
    "location" text                                      NOT NULL,
    "location_lat" varchar(16)     DEFAULT ''                NOT NULL,
    "location_lon" varchar(16)     DEFAULT ''                NOT NULL,
    "notes" text                                      NOT NULL,
    "chassis" varchar(64)     DEFAULT ''                NOT NULL,
    "model" varchar(64)     DEFAULT ''                NOT NULL,
    "hw_arch" varchar(32)     DEFAULT ''                NOT NULL,
    "vendor" varchar(64)     DEFAULT ''                NOT NULL,
    "contract_number" varchar(64)     DEFAULT ''                NOT NULL,
    "installer_name" varchar(64)     DEFAULT ''                NOT NULL,
    "deployment_status" varchar(64)     DEFAULT ''                NOT NULL,
    "url_a" varchar(255)    DEFAULT ''                NOT NULL,
    "url_b" varchar(255)    DEFAULT ''                NOT NULL,
    "url_c" varchar(255)    DEFAULT ''                NOT NULL,
    "host_networks" text                                      NOT NULL,
    "host_netmask" varchar(39)     DEFAULT ''                NOT NULL,
    "host_router" varchar(39)     DEFAULT ''                NOT NULL,
    "oob_ip" varchar(39)     DEFAULT ''                NOT NULL,
    "oob_netmask" varchar(39)     DEFAULT ''                NOT NULL,
    "oob_router" varchar(39)     DEFAULT ''                NOT NULL,
    "date_hw_purchase" varchar(64)     DEFAULT ''                NOT NULL,
    "date_hw_install" varchar(64)     DEFAULT ''                NOT NULL,
    "date_hw_expiry" varchar(64)     DEFAULT ''                NOT NULL,
    "date_hw_decomm" varchar(64)     DEFAULT ''                NOT NULL,
    "site_address_a" varchar(128)    DEFAULT ''                NOT NULL,
    "site_address_b" varchar(128)    DEFAULT ''                NOT NULL,
    "site_address_c" varchar(128)    DEFAULT ''                NOT NULL,
    "site_city" varchar(128)    DEFAULT ''                NOT NULL,
    "site_state" varchar(64)     DEFAULT ''                NOT NULL,
    "site_country" varchar(64)     DEFAULT ''                NOT NULL,
    "site_zip" varchar(64)     DEFAULT ''                NOT NULL,
    "site_rack" varchar(128)    DEFAULT ''                NOT NULL,
    "site_notes" text                                      NOT NULL,
    "poc_1_name" varchar(128)    DEFAULT ''                NOT NULL,
    "poc_1_email" varchar(128)    DEFAULT ''                NOT NULL,
    "poc_1_phone_a" varchar(64)     DEFAULT ''                NOT NULL,
    "poc_1_phone_b" varchar(64)     DEFAULT ''                NOT NULL,
    "poc_1_cell" varchar(64)     DEFAULT ''                NOT NULL,
    "poc_1_screen" varchar(64)     DEFAULT ''                NOT NULL,
    "poc_1_notes" text                                      NOT NULL,
    "poc_2_name" varchar(128)    DEFAULT ''                NOT NULL,
    "poc_2_email" varchar(128)    DEFAULT ''                NOT NULL,
    "poc_2_phone_a" varchar(64)     DEFAULT ''                NOT NULL,
    "poc_2_phone_b" varchar(64)     DEFAULT ''                NOT NULL,
    "poc_2_cell" varchar(64)     DEFAULT ''                NOT NULL,
    "poc_2_screen" varchar(64)     DEFAULT ''                NOT NULL,
    "poc_2_notes" text                                      NOT NULL,
    PRIMARY KEY (hostid)
);

CREATE TABLE "housekeeper" (
    "housekeeperid" bigint unsigned                           NOT NULL,
    "tablename" varchar(64)     DEFAULT ''                NOT NULL,
    "field" varchar(64)     DEFAULT ''                NOT NULL,
    "value" bigint unsigned                           NOT NULL,
    PRIMARY KEY (housekeeperid)
);

CREATE TABLE "images" (
    "imageid" bigint unsigned                           NOT NULL,
    "imagetype" integer         DEFAULT '0'               NOT NULL,
    "name" varchar(64)     DEFAULT '0'               NOT NULL,
    "image" BYTEA                                  NOT NULL,
    PRIMARY KEY (imageid)
);

CREATE TABLE "item_discovery" (
    "itemdiscoveryid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "parent_itemid" bigint unsigned                           NOT NULL,
    "key_" varchar(255)    DEFAULT ''                NOT NULL,
    "lastcheck" integer         DEFAULT '0'               NOT NULL,
    "ts_delete" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (itemdiscoveryid)
);

CREATE TABLE "host_discovery" (
    "hostid" bigint unsigned                           NOT NULL,
    "parent_hostid" bigint unsigned                           NULL,
    "parent_itemid" bigint unsigned                           NULL,
    "host" varchar(64)     DEFAULT ''                NOT NULL,
    "lastcheck" integer         DEFAULT '0'               NOT NULL,
    "ts_delete" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (hostid)
);

CREATE TABLE "interface_discovery" (
    "interfaceid" bigint unsigned                           NOT NULL,
    "parent_interfaceid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (interfaceid)
);

CREATE TABLE "profiles" (
    "profileid" bigint unsigned                           NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "idx" varchar(96)     DEFAULT ''                NOT NULL,
    "idx2" bigint unsigned DEFAULT '0'               NOT NULL,
    "value_id" bigint unsigned DEFAULT '0'               NOT NULL,
    "value_int" integer         DEFAULT '0'               NOT NULL,
    "value_str" varchar(255)    DEFAULT ''                NOT NULL,
    "source" varchar(96)     DEFAULT ''                NOT NULL,
    "type" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (profileid)
);

CREATE TABLE "sessions" (
    "sessionid" varchar(32)     DEFAULT ''                NOT NULL,
    "userid" bigint unsigned                           NOT NULL,
    "lastaccess" integer         DEFAULT '0'               NOT NULL,
    "status" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (sessionid)
);

CREATE TABLE "trigger_discovery" (
    "triggerid" bigint unsigned                           NOT NULL,
    "parent_triggerid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (triggerid)
);

CREATE TABLE "application_template" (
    "application_templateid" bigint unsigned                           NOT NULL,
    "applicationid" bigint unsigned                           NOT NULL,
    "templateid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (application_templateid)
);

CREATE TABLE "item_condition" (
    "item_conditionid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "operator" integer         DEFAULT '8'               NOT NULL,
    "macro" varchar(64)     DEFAULT ''                NOT NULL,
    "value" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (item_conditionid)
);

CREATE TABLE "application_prototype" (
    "application_prototypeid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    "templateid" bigint unsigned                           NULL,
    "name" varchar(255)    DEFAULT ''                NOT NULL,
    PRIMARY KEY (application_prototypeid)
);

CREATE TABLE "item_application_prototype" (
    "item_application_prototypeid" bigint unsigned                           NOT NULL,
    "application_prototypeid" bigint unsigned                           NOT NULL,
    "itemid" bigint unsigned                           NOT NULL,
    PRIMARY KEY (item_application_prototypeid)
);

CREATE TABLE "application_discovery" (
    "application_discoveryid" bigint unsigned                           NOT NULL,
    "applicationid" bigint unsigned                           NOT NULL,
    "application_prototypeid" bigint unsigned                           NOT NULL,
    "name" varchar(255)    DEFAULT ''                NOT NULL,
    "lastcheck" integer         DEFAULT '0'               NOT NULL,
    "ts_delete" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (application_discoveryid)
);

CREATE TABLE "opinventory" (
    "operationid" bigint unsigned                           NOT NULL,
    "inventory_mode" integer         DEFAULT '0'               NOT NULL,
    PRIMARY KEY (operationid)
);

CREATE TABLE "dbversion" (
    "mandatory" integer         DEFAULT '0'               NOT NULL,
    "optional" integer         DEFAULT '0'               NOT NULL
);


                            

ALTER TABLE "hosts" ADD CONSTRAINT "c_hosts_1" FOREIGN KEY ("proxy_hostid") REFERENCES "hosts" ("hostid");

ALTER TABLE "hosts" ADD CONSTRAINT "c_hosts_2" FOREIGN KEY ("maintenanceid") REFERENCES "maintenances" ("maintenanceid");

ALTER TABLE "hosts" ADD CONSTRAINT "c_hosts_3" FOREIGN KEY ("templateid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "group_prototype" ADD CONSTRAINT "c_group_prototype_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "group_prototype" ADD CONSTRAINT "c_group_prototype_2" FOREIGN KEY ("groupid") REFERENCES "groups" ("groupid");

ALTER TABLE "group_prototype" ADD CONSTRAINT "c_group_prototype_3" FOREIGN KEY ("templateid") REFERENCES "group_prototype" ("group_prototypeid") ON DELETE CASCADE;

ALTER TABLE "group_discovery" ADD CONSTRAINT "c_group_discovery_1" FOREIGN KEY ("groupid") REFERENCES "groups" ("groupid") ON DELETE CASCADE;

ALTER TABLE "group_discovery" ADD CONSTRAINT "c_group_discovery_2" FOREIGN KEY ("parent_group_prototypeid") REFERENCES "group_prototype" ("group_prototypeid");

ALTER TABLE "screens" ADD CONSTRAINT "c_screens_1" FOREIGN KEY ("templateid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "screens" ADD CONSTRAINT "c_screens_3" FOREIGN KEY ("userid") REFERENCES "users" ("userid");

ALTER TABLE "screens_items" ADD CONSTRAINT "c_screens_items_1" FOREIGN KEY ("screenid") REFERENCES "screens" ("screenid") ON DELETE CASCADE;

ALTER TABLE "screen_user" ADD CONSTRAINT "c_screen_user_1" FOREIGN KEY ("screenid") REFERENCES "screens" ("screenid") ON DELETE CASCADE;

ALTER TABLE "screen_user" ADD CONSTRAINT "c_screen_user_2" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "screen_usrgrp" ADD CONSTRAINT "c_screen_usrgrp_1" FOREIGN KEY ("screenid") REFERENCES "screens" ("screenid") ON DELETE CASCADE;

ALTER TABLE "screen_usrgrp" ADD CONSTRAINT "c_screen_usrgrp_2" FOREIGN KEY ("usrgrpid") REFERENCES "usrgrp" ("usrgrpid") ON DELETE CASCADE;

ALTER TABLE "slideshows" ADD CONSTRAINT "c_slideshows_3" FOREIGN KEY ("userid") REFERENCES "users" ("userid");

ALTER TABLE "slideshow_user" ADD CONSTRAINT "c_slideshow_user_1" FOREIGN KEY ("slideshowid") REFERENCES "slideshows" ("slideshowid") ON DELETE CASCADE;

ALTER TABLE "slideshow_user" ADD CONSTRAINT "c_slideshow_user_2" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "slideshow_usrgrp" ADD CONSTRAINT "c_slideshow_usrgrp_1" FOREIGN KEY ("slideshowid") REFERENCES "slideshows" ("slideshowid") ON DELETE CASCADE;

ALTER TABLE "slideshow_usrgrp" ADD CONSTRAINT "c_slideshow_usrgrp_2" FOREIGN KEY ("usrgrpid") REFERENCES "usrgrp" ("usrgrpid") ON DELETE CASCADE;

ALTER TABLE "slides" ADD CONSTRAINT "c_slides_1" FOREIGN KEY ("slideshowid") REFERENCES "slideshows" ("slideshowid") ON DELETE CASCADE;

ALTER TABLE "slides" ADD CONSTRAINT "c_slides_2" FOREIGN KEY ("screenid") REFERENCES "screens" ("screenid") ON DELETE CASCADE;

ALTER TABLE "drules" ADD CONSTRAINT "c_drules_1" FOREIGN KEY ("proxy_hostid") REFERENCES "hosts" ("hostid");

ALTER TABLE "dchecks" ADD CONSTRAINT "c_dchecks_1" FOREIGN KEY ("druleid") REFERENCES "drules" ("druleid") ON DELETE CASCADE;

ALTER TABLE "applications" ADD CONSTRAINT "c_applications_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "httptest" ADD CONSTRAINT "c_httptest_1" FOREIGN KEY ("applicationid") REFERENCES "applications" ("applicationid");

ALTER TABLE "httptest" ADD CONSTRAINT "c_httptest_2" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "httptest" ADD CONSTRAINT "c_httptest_3" FOREIGN KEY ("templateid") REFERENCES "httptest" ("httptestid") ON DELETE CASCADE;

ALTER TABLE "httpstep" ADD CONSTRAINT "c_httpstep_1" FOREIGN KEY ("httptestid") REFERENCES "httptest" ("httptestid") ON DELETE CASCADE;

ALTER TABLE "interface" ADD CONSTRAINT "c_interface_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "items" ADD CONSTRAINT "c_items_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "items" ADD CONSTRAINT "c_items_2" FOREIGN KEY ("templateid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "items" ADD CONSTRAINT "c_items_3" FOREIGN KEY ("valuemapid") REFERENCES "valuemaps" ("valuemapid");

ALTER TABLE "items" ADD CONSTRAINT "c_items_4" FOREIGN KEY ("interfaceid") REFERENCES "interface" ("interfaceid");

ALTER TABLE "httpstepitem" ADD CONSTRAINT "c_httpstepitem_1" FOREIGN KEY ("httpstepid") REFERENCES "httpstep" ("httpstepid") ON DELETE CASCADE;

ALTER TABLE "httpstepitem" ADD CONSTRAINT "c_httpstepitem_2" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "httptestitem" ADD CONSTRAINT "c_httptestitem_1" FOREIGN KEY ("httptestid") REFERENCES "httptest" ("httptestid") ON DELETE CASCADE;

ALTER TABLE "httptestitem" ADD CONSTRAINT "c_httptestitem_2" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "users_groups" ADD CONSTRAINT "c_users_groups_1" FOREIGN KEY ("usrgrpid") REFERENCES "usrgrp" ("usrgrpid") ON DELETE CASCADE;

ALTER TABLE "users_groups" ADD CONSTRAINT "c_users_groups_2" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "scripts" ADD CONSTRAINT "c_scripts_1" FOREIGN KEY ("usrgrpid") REFERENCES "usrgrp" ("usrgrpid");

ALTER TABLE "scripts" ADD CONSTRAINT "c_scripts_2" FOREIGN KEY ("groupid") REFERENCES "groups" ("groupid");

ALTER TABLE "operations" ADD CONSTRAINT "c_operations_1" FOREIGN KEY ("actionid") REFERENCES "actions" ("actionid") ON DELETE CASCADE;

ALTER TABLE "opmessage" ADD CONSTRAINT "c_opmessage_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "opmessage" ADD CONSTRAINT "c_opmessage_2" FOREIGN KEY ("mediatypeid") REFERENCES "media_type" ("mediatypeid");

ALTER TABLE "opmessage_grp" ADD CONSTRAINT "c_opmessage_grp_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "opmessage_grp" ADD CONSTRAINT "c_opmessage_grp_2" FOREIGN KEY ("usrgrpid") REFERENCES "usrgrp" ("usrgrpid");

ALTER TABLE "opmessage_usr" ADD CONSTRAINT "c_opmessage_usr_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "opmessage_usr" ADD CONSTRAINT "c_opmessage_usr_2" FOREIGN KEY ("userid") REFERENCES "users" ("userid");

ALTER TABLE "opcommand" ADD CONSTRAINT "c_opcommand_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "opcommand" ADD CONSTRAINT "c_opcommand_2" FOREIGN KEY ("scriptid") REFERENCES "scripts" ("scriptid");

ALTER TABLE "opcommand_hst" ADD CONSTRAINT "c_opcommand_hst_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "opcommand_hst" ADD CONSTRAINT "c_opcommand_hst_2" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid");

ALTER TABLE "opcommand_grp" ADD CONSTRAINT "c_opcommand_grp_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "opcommand_grp" ADD CONSTRAINT "c_opcommand_grp_2" FOREIGN KEY ("groupid") REFERENCES "groups" ("groupid");

ALTER TABLE "opgroup" ADD CONSTRAINT "c_opgroup_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "opgroup" ADD CONSTRAINT "c_opgroup_2" FOREIGN KEY ("groupid") REFERENCES "groups" ("groupid");

ALTER TABLE "optemplate" ADD CONSTRAINT "c_optemplate_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "optemplate" ADD CONSTRAINT "c_optemplate_2" FOREIGN KEY ("templateid") REFERENCES "hosts" ("hostid");

ALTER TABLE "opconditions" ADD CONSTRAINT "c_opconditions_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;

ALTER TABLE "conditions" ADD CONSTRAINT "c_conditions_1" FOREIGN KEY ("actionid") REFERENCES "actions" ("actionid") ON DELETE CASCADE;

ALTER TABLE "config" ADD CONSTRAINT "c_config_1" FOREIGN KEY ("alert_usrgrpid") REFERENCES "usrgrp" ("usrgrpid");

ALTER TABLE "config" ADD CONSTRAINT "c_config_2" FOREIGN KEY ("discovery_groupid") REFERENCES "groups" ("groupid");

ALTER TABLE "triggers" ADD CONSTRAINT "c_triggers_1" FOREIGN KEY ("templateid") REFERENCES "triggers" ("triggerid") ON DELETE CASCADE;

ALTER TABLE "trigger_depends" ADD CONSTRAINT "c_trigger_depends_1" FOREIGN KEY ("triggerid_down") REFERENCES "triggers" ("triggerid") ON DELETE CASCADE;

ALTER TABLE "trigger_depends" ADD CONSTRAINT "c_trigger_depends_2" FOREIGN KEY ("triggerid_up") REFERENCES "triggers" ("triggerid") ON DELETE CASCADE;

ALTER TABLE "functions" ADD CONSTRAINT "c_functions_1" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "functions" ADD CONSTRAINT "c_functions_2" FOREIGN KEY ("triggerid") REFERENCES "triggers" ("triggerid") ON DELETE CASCADE;

ALTER TABLE "graphs" ADD CONSTRAINT "c_graphs_1" FOREIGN KEY ("templateid") REFERENCES "graphs" ("graphid") ON DELETE CASCADE;

ALTER TABLE "graphs" ADD CONSTRAINT "c_graphs_2" FOREIGN KEY ("ymin_itemid") REFERENCES "items" ("itemid");

ALTER TABLE "graphs" ADD CONSTRAINT "c_graphs_3" FOREIGN KEY ("ymax_itemid") REFERENCES "items" ("itemid");

ALTER TABLE "graphs_items" ADD CONSTRAINT "c_graphs_items_1" FOREIGN KEY ("graphid") REFERENCES "graphs" ("graphid") ON DELETE CASCADE;

ALTER TABLE "graphs_items" ADD CONSTRAINT "c_graphs_items_2" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "hostmacro" ADD CONSTRAINT "c_hostmacro_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "hosts_groups" ADD CONSTRAINT "c_hosts_groups_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "hosts_groups" ADD CONSTRAINT "c_hosts_groups_2" FOREIGN KEY ("groupid") REFERENCES "groups" ("groupid") ON DELETE CASCADE;

ALTER TABLE "hosts_templates" ADD CONSTRAINT "c_hosts_templates_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "hosts_templates" ADD CONSTRAINT "c_hosts_templates_2" FOREIGN KEY ("templateid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "items_applications" ADD CONSTRAINT "c_items_applications_1" FOREIGN KEY ("applicationid") REFERENCES "applications" ("applicationid") ON DELETE CASCADE;

ALTER TABLE "items_applications" ADD CONSTRAINT "c_items_applications_2" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "mappings" ADD CONSTRAINT "c_mappings_1" FOREIGN KEY ("valuemapid") REFERENCES "valuemaps" ("valuemapid") ON DELETE CASCADE;

ALTER TABLE "media" ADD CONSTRAINT "c_media_1" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "media" ADD CONSTRAINT "c_media_2" FOREIGN KEY ("mediatypeid") REFERENCES "media_type" ("mediatypeid") ON DELETE CASCADE;

ALTER TABLE "rights" ADD CONSTRAINT "c_rights_1" FOREIGN KEY ("groupid") REFERENCES "usrgrp" ("usrgrpid") ON DELETE CASCADE;

ALTER TABLE "rights" ADD CONSTRAINT "c_rights_2" FOREIGN KEY ("id") REFERENCES "groups" ("groupid") ON DELETE CASCADE;

ALTER TABLE "services" ADD CONSTRAINT "c_services_1" FOREIGN KEY ("triggerid") REFERENCES "triggers" ("triggerid") ON DELETE CASCADE;

ALTER TABLE "services_links" ADD CONSTRAINT "c_services_links_1" FOREIGN KEY ("serviceupid") REFERENCES "services" ("serviceid") ON DELETE CASCADE;

ALTER TABLE "services_links" ADD CONSTRAINT "c_services_links_2" FOREIGN KEY ("servicedownid") REFERENCES "services" ("serviceid") ON DELETE CASCADE;

ALTER TABLE "services_times" ADD CONSTRAINT "c_services_times_1" FOREIGN KEY ("serviceid") REFERENCES "services" ("serviceid") ON DELETE CASCADE;

ALTER TABLE "icon_map" ADD CONSTRAINT "c_icon_map_1" FOREIGN KEY ("default_iconid") REFERENCES "images" ("imageid");

ALTER TABLE "icon_mapping" ADD CONSTRAINT "c_icon_mapping_1" FOREIGN KEY ("iconmapid") REFERENCES "icon_map" ("iconmapid") ON DELETE CASCADE;

ALTER TABLE "icon_mapping" ADD CONSTRAINT "c_icon_mapping_2" FOREIGN KEY ("iconid") REFERENCES "images" ("imageid");

ALTER TABLE "sysmaps" ADD CONSTRAINT "c_sysmaps_1" FOREIGN KEY ("backgroundid") REFERENCES "images" ("imageid");

ALTER TABLE "sysmaps" ADD CONSTRAINT "c_sysmaps_2" FOREIGN KEY ("iconmapid") REFERENCES "icon_map" ("iconmapid");

ALTER TABLE "sysmaps" ADD CONSTRAINT "c_sysmaps_3" FOREIGN KEY ("userid") REFERENCES "users" ("userid");

ALTER TABLE "sysmaps_elements" ADD CONSTRAINT "c_sysmaps_elements_1" FOREIGN KEY ("sysmapid") REFERENCES "sysmaps" ("sysmapid") ON DELETE CASCADE;

ALTER TABLE "sysmaps_elements" ADD CONSTRAINT "c_sysmaps_elements_2" FOREIGN KEY ("iconid_off") REFERENCES "images" ("imageid");

ALTER TABLE "sysmaps_elements" ADD CONSTRAINT "c_sysmaps_elements_3" FOREIGN KEY ("iconid_on") REFERENCES "images" ("imageid");

ALTER TABLE "sysmaps_elements" ADD CONSTRAINT "c_sysmaps_elements_4" FOREIGN KEY ("iconid_disabled") REFERENCES "images" ("imageid");

ALTER TABLE "sysmaps_elements" ADD CONSTRAINT "c_sysmaps_elements_5" FOREIGN KEY ("iconid_maintenance") REFERENCES "images" ("imageid");

ALTER TABLE "sysmaps_links" ADD CONSTRAINT "c_sysmaps_links_1" FOREIGN KEY ("sysmapid") REFERENCES "sysmaps" ("sysmapid") ON DELETE CASCADE;

ALTER TABLE "sysmaps_links" ADD CONSTRAINT "c_sysmaps_links_2" FOREIGN KEY ("selementid1") REFERENCES "sysmaps_elements" ("selementid") ON DELETE CASCADE;

ALTER TABLE "sysmaps_links" ADD CONSTRAINT "c_sysmaps_links_3" FOREIGN KEY ("selementid2") REFERENCES "sysmaps_elements" ("selementid") ON DELETE CASCADE;

ALTER TABLE "sysmaps_link_triggers" ADD CONSTRAINT "c_sysmaps_link_triggers_1" FOREIGN KEY ("linkid") REFERENCES "sysmaps_links" ("linkid") ON DELETE CASCADE;

ALTER TABLE "sysmaps_link_triggers" ADD CONSTRAINT "c_sysmaps_link_triggers_2" FOREIGN KEY ("triggerid") REFERENCES "triggers" ("triggerid") ON DELETE CASCADE;

ALTER TABLE "sysmap_element_url" ADD CONSTRAINT "c_sysmap_element_url_1" FOREIGN KEY ("selementid") REFERENCES "sysmaps_elements" ("selementid") ON DELETE CASCADE;

ALTER TABLE "sysmap_url" ADD CONSTRAINT "c_sysmap_url_1" FOREIGN KEY ("sysmapid") REFERENCES "sysmaps" ("sysmapid") ON DELETE CASCADE;

ALTER TABLE "sysmap_user" ADD CONSTRAINT "c_sysmap_user_1" FOREIGN KEY ("sysmapid") REFERENCES "sysmaps" ("sysmapid") ON DELETE CASCADE;

ALTER TABLE "sysmap_user" ADD CONSTRAINT "c_sysmap_user_2" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "sysmap_usrgrp" ADD CONSTRAINT "c_sysmap_usrgrp_1" FOREIGN KEY ("sysmapid") REFERENCES "sysmaps" ("sysmapid") ON DELETE CASCADE;

ALTER TABLE "sysmap_usrgrp" ADD CONSTRAINT "c_sysmap_usrgrp_2" FOREIGN KEY ("usrgrpid") REFERENCES "usrgrp" ("usrgrpid") ON DELETE CASCADE;

ALTER TABLE "maintenances_hosts" ADD CONSTRAINT "c_maintenances_hosts_1" FOREIGN KEY ("maintenanceid") REFERENCES "maintenances" ("maintenanceid") ON DELETE CASCADE;

ALTER TABLE "maintenances_hosts" ADD CONSTRAINT "c_maintenances_hosts_2" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "maintenances_groups" ADD CONSTRAINT "c_maintenances_groups_1" FOREIGN KEY ("maintenanceid") REFERENCES "maintenances" ("maintenanceid") ON DELETE CASCADE;

ALTER TABLE "maintenances_groups" ADD CONSTRAINT "c_maintenances_groups_2" FOREIGN KEY ("groupid") REFERENCES "groups" ("groupid") ON DELETE CASCADE;

ALTER TABLE "maintenances_windows" ADD CONSTRAINT "c_maintenances_windows_1" FOREIGN KEY ("maintenanceid") REFERENCES "maintenances" ("maintenanceid") ON DELETE CASCADE;

ALTER TABLE "maintenances_windows" ADD CONSTRAINT "c_maintenances_windows_2" FOREIGN KEY ("timeperiodid") REFERENCES "timeperiods" ("timeperiodid") ON DELETE CASCADE;

ALTER TABLE "expressions" ADD CONSTRAINT "c_expressions_1" FOREIGN KEY ("regexpid") REFERENCES "regexps" ("regexpid") ON DELETE CASCADE;

ALTER TABLE "alerts" ADD CONSTRAINT "c_alerts_1" FOREIGN KEY ("actionid") REFERENCES "actions" ("actionid") ON DELETE CASCADE;

ALTER TABLE "alerts" ADD CONSTRAINT "c_alerts_2" FOREIGN KEY ("eventid") REFERENCES "events" ("eventid") ON DELETE CASCADE;

ALTER TABLE "alerts" ADD CONSTRAINT "c_alerts_3" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "alerts" ADD CONSTRAINT "c_alerts_4" FOREIGN KEY ("mediatypeid") REFERENCES "media_type" ("mediatypeid") ON DELETE CASCADE;

ALTER TABLE "acknowledges" ADD CONSTRAINT "c_acknowledges_1" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "acknowledges" ADD CONSTRAINT "c_acknowledges_2" FOREIGN KEY ("eventid") REFERENCES "events" ("eventid") ON DELETE CASCADE;

ALTER TABLE "auditlog" ADD CONSTRAINT "c_auditlog_1" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "auditlog_details" ADD CONSTRAINT "c_auditlog_details_1" FOREIGN KEY ("auditid") REFERENCES "auditlog" ("auditid") ON DELETE CASCADE;

ALTER TABLE "service_alarms" ADD CONSTRAINT "c_service_alarms_1" FOREIGN KEY ("serviceid") REFERENCES "services" ("serviceid") ON DELETE CASCADE;

ALTER TABLE "autoreg_host" ADD CONSTRAINT "c_autoreg_host_1" FOREIGN KEY ("proxy_hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "dhosts" ADD CONSTRAINT "c_dhosts_1" FOREIGN KEY ("druleid") REFERENCES "drules" ("druleid") ON DELETE CASCADE;

ALTER TABLE "dservices" ADD CONSTRAINT "c_dservices_1" FOREIGN KEY ("dhostid") REFERENCES "dhosts" ("dhostid") ON DELETE CASCADE;

ALTER TABLE "dservices" ADD CONSTRAINT "c_dservices_2" FOREIGN KEY ("dcheckid") REFERENCES "dchecks" ("dcheckid") ON DELETE CASCADE;

ALTER TABLE "graph_discovery" ADD CONSTRAINT "c_graph_discovery_1" FOREIGN KEY ("graphid") REFERENCES "graphs" ("graphid") ON DELETE CASCADE;

ALTER TABLE "graph_discovery" ADD CONSTRAINT "c_graph_discovery_2" FOREIGN KEY ("parent_graphid") REFERENCES "graphs" ("graphid");

ALTER TABLE "host_inventory" ADD CONSTRAINT "c_host_inventory_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "item_discovery" ADD CONSTRAINT "c_item_discovery_1" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "item_discovery" ADD CONSTRAINT "c_item_discovery_2" FOREIGN KEY ("parent_itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "host_discovery" ADD CONSTRAINT "c_host_discovery_1" FOREIGN KEY ("hostid") REFERENCES "hosts" ("hostid") ON DELETE CASCADE;

ALTER TABLE "host_discovery" ADD CONSTRAINT "c_host_discovery_2" FOREIGN KEY ("parent_hostid") REFERENCES "hosts" ("hostid");

ALTER TABLE "host_discovery" ADD CONSTRAINT "c_host_discovery_3" FOREIGN KEY ("parent_itemid") REFERENCES "items" ("itemid");

ALTER TABLE "interface_discovery" ADD CONSTRAINT "c_interface_discovery_1" FOREIGN KEY ("interfaceid") REFERENCES "interface" ("interfaceid") ON DELETE CASCADE;

ALTER TABLE "interface_discovery" ADD CONSTRAINT "c_interface_discovery_2" FOREIGN KEY ("parent_interfaceid") REFERENCES "interface" ("interfaceid") ON DELETE CASCADE;

ALTER TABLE "profiles" ADD CONSTRAINT "c_profiles_1" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "sessions" ADD CONSTRAINT "c_sessions_1" FOREIGN KEY ("userid") REFERENCES "users" ("userid") ON DELETE CASCADE;

ALTER TABLE "trigger_discovery" ADD CONSTRAINT "c_trigger_discovery_1" FOREIGN KEY ("triggerid") REFERENCES "triggers" ("triggerid") ON DELETE CASCADE;

ALTER TABLE "trigger_discovery" ADD CONSTRAINT "c_trigger_discovery_2" FOREIGN KEY ("parent_triggerid") REFERENCES "triggers" ("triggerid");

ALTER TABLE "application_template" ADD CONSTRAINT "c_application_template_1" FOREIGN KEY ("applicationid") REFERENCES "applications" ("applicationid") ON DELETE CASCADE;

ALTER TABLE "application_template" ADD CONSTRAINT "c_application_template_2" FOREIGN KEY ("templateid") REFERENCES "applications" ("applicationid") ON DELETE CASCADE;

ALTER TABLE "item_condition" ADD CONSTRAINT "c_item_condition_1" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "application_prototype" ADD CONSTRAINT "c_application_prototype_1" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "application_prototype" ADD CONSTRAINT "c_application_prototype_2" FOREIGN KEY ("templateid") REFERENCES "application_prototype" ("application_prototypeid") ON DELETE CASCADE;

ALTER TABLE "item_application_prototype" ADD CONSTRAINT "c_item_application_prototype_1" FOREIGN KEY ("application_prototypeid") REFERENCES "application_prototype" ("application_prototypeid") ON DELETE CASCADE;

ALTER TABLE "item_application_prototype" ADD CONSTRAINT "c_item_application_prototype_2" FOREIGN KEY ("itemid") REFERENCES "items" ("itemid") ON DELETE CASCADE;

ALTER TABLE "application_discovery" ADD CONSTRAINT "c_application_discovery_1" FOREIGN KEY ("applicationid") REFERENCES "applications" ("applicationid") ON DELETE CASCADE;

ALTER TABLE "application_discovery" ADD CONSTRAINT "c_application_discovery_2" FOREIGN KEY ("application_prototypeid") REFERENCES "application_prototype" ("application_prototypeid") ON DELETE CASCADE;

ALTER TABLE "opinventory" ADD CONSTRAINT "c_opinventory_1" FOREIGN KEY ("operationid") REFERENCES "operations" ("operationid") ON DELETE CASCADE;
