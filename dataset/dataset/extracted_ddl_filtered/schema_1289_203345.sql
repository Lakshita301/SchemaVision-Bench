-- Source: https://github.com/BackupTheBerlios/v-q-svn/blob/c8f787e77272d5da15ef5d91a596b64ce1cf4d36/tags/8/base/oracle/tables.sql?raw=true
-- Tables detected: 8 | FK constraints: 4

CREATE TABLE vq_info (
    key varchar2(1024) NOT NULL,
    value varchar2(1024)
);

CREATE TABLE vq_domains (
    id_domain INTEGER NOT NULL,
    domain varchar2(512) NOT NULL,
    qt_user_bytes_def integer DEFAULT 0 NOT NULL,
    qt_user_files_def integer DEFAULT 0 NOT NULL
);

CREATE TABLE vq_emails_banned (
    re_domain varchar2(512) NOT NULL,
    re_login varchar2(512) NOT NULL
);

CREATE TABLE vq_users (
    id_domain integer NOT NULL,
    login varchar2(512) NOT NULL,
    pass varchar2(512) NOT NULL,
    dir long,
    flags integer DEFAULT 0 NOT NULL,
    qt_bytes_max integer DEFAULT 0 NOT NULL,
    qt_files_max integer DEFAULT 0 NOT NULL,
    CONSTRAINT vq_users_flags CHECK ((flags >= 0)),
    CONSTRAINT vq_users_qtb_max CHECK ((qt_bytes_max >= 0)),
    CONSTRAINT vq_users_qtf_max CHECK ((qt_files_max >= 0))
);

CREATE TABLE vq_domains_aliases (
    id_domain integer NOT NULL,
    alias varchar2(512)
);

CREATE TABLE vq_domains_ips (
    id_domain integer NOT NULL,
    ip varchar2(100) NOT NULL
);

CREATE TABLE vq_users_conf (
    id_conf INTEGER NOT NULL,
    id_domain integer NOT NULL,
    login varchar2(512) NOT NULL,
    ext varchar2(512),
    type integer NOT NULL,
    val long
);

CREATE TABLE vq_log (
    id_log INTEGER NOT NULL,
    time timestamp WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
    ip varchar2(100),
    service integer DEFAULT 0 NOT NULL,
    domain varchar2(512),
    login varchar2(512),
    result integer DEFAULT 0 NOT NULL,
    msg long
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE vq_users
    ADD CONSTRAINT vq_users_id_domain_fkey FOREIGN KEY (id_domain) REFERENCES vq_domains(id_domain) ON DELETE CASCADE;

ALTER TABLE vq_domains_aliases
    ADD CONSTRAINT vq_domains_aliases_id_dom_fkey FOREIGN KEY (id_domain) REFERENCES vq_domains(id_domain) ON DELETE CASCADE;

ALTER TABLE vq_domains_ips
    ADD CONSTRAINT vq_domains_ips_id_dom_fkey FOREIGN KEY (id_domain) REFERENCES vq_domains(id_domain) ON DELETE CASCADE;

ALTER TABLE vq_users_conf
   ADD CONSTRAINT vq_users_conf_id_dom_log_fkey FOREIGN KEY (id_domain, login) REFERENCES vq_users(id_domain, login) ON DELETE CASCADE;

