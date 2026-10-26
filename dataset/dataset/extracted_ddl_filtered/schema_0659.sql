-- Source: https://github.com/ttran9/smartcar-api-test/blob/ec973b4dca3dbe9d6e7ebd447313246ed415e0d3/src/main/scripts/schemacreate_prod.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6

create table application_user_role (application_user_id bigint not null, role_id bigint not null, primary key (application_user_id, role_id)) engine=InnoDB;

create table application_user (id bigint not null auto_increment, password varchar(255), username varchar(255), custom_token_id bigint, primary key (id)) engine=InnoDB;

create table custom_token (id bigint not null auto_increment, access_token varchar(255), expiration datetime(6), refresh_expiration datetime(6), refresh_token varchar(255), primary key (id)) engine=InnoDB;

create table role (id bigint not null auto_increment, authority varchar(255), primary key (id)) engine=InnoDB;

-- Foreign keys added via ALTER TABLE:
alter table application_user_role add constraint FKm59gb8kwom8xe0dvk5gip1iom foreign key (role_id) references role (id);

alter table application_user_role add constraint FKq4o1k0ux3pyp1x1vsv94yy7iw foreign key (application_user_id) references application_user (id);

alter table application_user add constraint FK3kevdfk6s1hvnerss4rxd7ye7 foreign key (custom_token_id) references custom_token (id);

