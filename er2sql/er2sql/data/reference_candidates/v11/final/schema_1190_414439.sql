-- Source: https://github.com/vyfuk/dokuwiki-web-vyfuk/blob/ae0bc4debc086a63002ac0c4c8e7f7e5ad247f20/lib/plugins/authpdo/_test/pgsql/django.sql?raw=true
-- Tables detected: 14 | FK constraints: 15
CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);
CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
CREATE TABLE timetracker_billingperiod (
    id integer NOT NULL,
    time_from timestamp with time zone NOT NULL,
    time_until timestamp with time zone NOT NULL,
    closed boolean NOT NULL,
    identifier character varying(10),
    project_id integer NOT NULL
);
CREATE TABLE timetracker_project (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    billing_id character varying(50) NOT NULL,
    active boolean NOT NULL,
    time_created timestamp with time zone NOT NULL,
    last_modified timestamp with time zone NOT NULL
);
CREATE TABLE timetracker_project_members (
    id integer NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL
);
CREATE TABLE timetracker_worklog (
    id integer NOT NULL,
    time_from timestamp with time zone NOT NULL,
    time_until timestamp with time zone NOT NULL,
    description text NOT NULL,
    office_hour_rate boolean NOT NULL,
    project_id integer NOT NULL,
    user_id integer NOT NULL,
    billing_period_id integer
);
ALTER TABLE auth_group_permissions ADD CONSTRAINT auth_group_permiss_permission_id_84c5c92e_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_group_permissions ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_permission ADD CONSTRAINT auth_permiss_content_type_id_2f476e4b_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_user_groups ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_user_groups ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_user_user_permissions ADD CONSTRAINT auth_user_user_per_permission_id_1fbb5f2c_fk_auth_permission_id FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_user_user_permissions ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE django_admin_log ADD CONSTRAINT django_admin_content_type_id_c4bce8eb_fk_django_content_type_id FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE django_admin_log ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE timetracker_billingperiod ADD CONSTRAINT timetracker_billi_project_id_8dd7b2e2_fk_timetracker_project_id FOREIGN KEY (project_id) REFERENCES timetracker_project(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE timetracker_project_members ADD CONSTRAINT timetracker_proje_project_id_85632ed8_fk_timetracker_project_id FOREIGN KEY (project_id) REFERENCES timetracker_project(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE timetracker_project_members ADD CONSTRAINT timetracker_project_members_user_id_62b48c3e_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE timetracker_worklog ADD CONSTRAINT time_billing_period_id_c4b944d1_fk_timetracker_billingperiod_id FOREIGN KEY (billing_period_id) REFERENCES timetracker_billingperiod(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE timetracker_worklog ADD CONSTRAINT timetracker_workl_project_id_69fa76d5_fk_timetracker_project_id FOREIGN KEY (project_id) REFERENCES timetracker_project(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE timetracker_worklog ADD CONSTRAINT timetracker_worklog_user_id_c74c8c68_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
