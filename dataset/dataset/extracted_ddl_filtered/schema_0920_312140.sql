-- Source: https://github.com/akinpelu746/geostore/blob/66ff52290076c6873aec3fb5993b8dd2a8425f0e/doc/sql/geofence-geostoreUsersIntegration_scripts/postgres/003_create_schema_geofence_postgres.sql?raw=true
-- Tables detected: 8 | FK constraints: 6

create table gf_gfuser (
        id int8 not null,
        dateCreation timestamp,
        emailAddress varchar(255),
        enabled bool not null,
        extId varchar(255) unique,
        fullName varchar(255),
        name varchar(255) not null unique,
        password varchar(255),
        primary key (id)
    );

create table gf_gsinstance (
        id int8 not null,
        baseURL varchar(255) not null,
        dateCreation timestamp,
        description varchar(255),
        name varchar(255) not null,
        password varchar(255) not null,
        username varchar(255) not null,
        primary key (id)
    );

create table gf_layer_attributes (
        details_id int8 not null,
        access_type varchar(255),
        data_type varchar(255),
        name varchar(255) not null,
        primary key (details_id, name),
        unique (details_id, name)
    );

create table gf_layer_custom_props (
        details_id int8 not null,
        propvalue varchar(255),
        propkey varchar(255),
        primary key (details_id, propkey)
    );

create table gf_layer_details (
        id int8 not null,
        area public.geometry,
        cqlFilterRead varchar(4000),
        cqlFilterWrite varchar(4000),
        defaultStyle varchar(255),
        catalog_mode varchar(255),
		type varchar(255),
        rule_id int8 not null,
        primary key (id),
        unique (rule_id)
    );

create table gf_layer_styles (
        details_id int8 not null,
        styleName varchar(255)
    );

create table gf_rule (
        id int8 not null,
        grant_type varchar(255) not null,
		ip_high bigint,
		ip_low bigint,
		ip_size integer,
        layer varchar(255),
        priority int8 not null,
        request varchar(255),
        service varchar(255),
        workspace varchar(255),
        gsuser_id int8,
        instance_id int8,
        userGroup_id int8,
        primary key (id),
        unique (gsuser_id, userGroup_id, instance_id, service, request, workspace, layer)
    );

create table gf_rule_limits (
        id int8 not null,
        area public.geometry,
		catalog_mode varchar(255),
        rule_id int8 not null,
        primary key (id),
        unique (rule_id)
    );

-- Foreign keys added via ALTER TABLE:
alter table gf_layer_attributes
        add constraint fk_attribute_layer
        foreign key (details_id)
        references gf_layer_details;

alter table gf_layer_custom_props
        add constraint fk_custom_layer
        foreign key (details_id)
        references gf_layer_details;

alter table gf_layer_details
        add constraint fk_details_rule
        foreign key (rule_id)
        references gf_rule;

alter table gf_layer_styles
        add constraint fk_styles_layer
        foreign key (details_id)
        references gf_layer_details;

alter table gf_rule
        add constraint fk_rule_instance
        foreign key (instance_id)
        references gf_gsinstance;

alter table gf_rule_limits
        add constraint fk_limits_rule
        foreign key (rule_id)
        references gf_rule;

