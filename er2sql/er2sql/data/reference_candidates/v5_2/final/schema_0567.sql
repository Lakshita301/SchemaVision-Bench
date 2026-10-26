-- Source: https://github.com/pawan7697/django/blob/c994725d76f6a237bf42a19ecf4690fcd8e65478/ecom.sql?raw=true
-- Tables detected: 14 | FK/REFERENCES mentions: 24
CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
CREATE TABLE auth_group_permissions (
    id bigint NOT NULL,
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
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
CREATE TABLE auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
CREATE TABLE auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
CREATE TABLE category_category (
    id bigint NOT NULL,
    category_name character varying(50) NOT NULL,
    status integer NOT NULL
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
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
CREATE TABLE products_products (
    id bigint NOT NULL,
    category_name character varying(100)[] NOT NULL,
    subcategory_name character varying(100)[] NOT NULL,
    supercategory_name character varying(100)[] NOT NULL,
    product_name character varying(100) NOT NULL,
    product_desc character varying(500) NOT NULL,
    "product_Smallimg" character varying(100) NOT NULL,
    "product_Bigimg" character varying(100) NOT NULL,
    product_code character varying(100) NOT NULL,
    product_price character varying(50) NOT NULL,
    product_sell_price character varying(50) NOT NULL,
    status integer NOT NULL,
    "product_img_nameB" character varying(100) NOT NULL,
    "product_img_nameS" character varying(100) NOT NULL
);
CREATE TABLE subcategory_subcategory (
    id bigint NOT NULL,
    subcategory_name character varying(50) NOT NULL,
    status integer NOT NULL,
    category_name_id bigint NOT NULL
);
CREATE TABLE supercategory_supercategory (
    id bigint NOT NULL,
    subcategory_name_id bigint NOT NULL,
    status integer NOT NULL,
    category_name_id bigint NOT NULL,
    supercategory_name character varying(50) NOT NULL
);
ALTER TABLE auth_group_permissions ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_group_permissions ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_permission ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_user_groups ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_user_groups ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_user_user_permissions ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE auth_user_user_permissions ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE django_admin_log ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE django_admin_log ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE subcategory_subcategory ADD CONSTRAINT subcategory_subcateg_category_name_id_47ddaf20_fk_category_ FOREIGN KEY (category_name_id) REFERENCES category_category(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE supercategory_supercategory ADD CONSTRAINT supercategory_superc_category_name_id_02682d6d_fk_category_ FOREIGN KEY (category_name_id) REFERENCES category_category(id) DEFERRABLE INITIALLY DEFERRED;
ALTER TABLE supercategory_supercategory ADD CONSTRAINT supercategory_superc_subcategory_name_id_71c72634_fk_subcatego FOREIGN KEY (subcategory_name_id) REFERENCES subcategory_subcategory(id) DEFERRABLE INITIALLY DEFERRED;
