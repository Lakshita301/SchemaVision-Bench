-- Source: https://github.com/animeshhparashar/lin-crm/blob/b7ba2151ecdb1c28cfa584f53936c76bf869c092/server/LIN_DB.sql?raw=true
-- Tables detected: 14 | FK/REFERENCES mentions: 62
create table "user"
(
    id BYTEA not null,
    created_on TIMESTAMP,
    date_of_birth TIMESTAMP,
    department varchar(255),
    email varchar(255),
    firstname varchar(255),
    gender varchar(255),
    job_title varchar(255),
    last_modified_on TIMESTAMP,
    lastname varchar(255),
    password varchar(255),
    phone_number varchar(255),
    status bit,
    version integer,
    created_by BYTEA,
    last_modified_by BYTEA,
    supervisor BYTEA,
    primary key (id),
    foreign key (created_by) references "user" (id),
    foreign key (last_modified_by) references "user" (id),
    foreign key (supervisor) references "user" (id)
);

create table role
(
    id BYTEA not null,
    description varchar(255),
    name varchar(255),
    primary key (id)
);

create table user_roles
(
    user_id BYTEA not null,
    role BYTEA not null,
    foreign key (user_id) references "user" (id),
    foreign key (role) references role (id)
);

create table activity_trail
(
    id BYTEA   not null,
    description varchar(255) not null,
    done_at TIMESTAMP     not null,
    identifier BYTEA   not null,
    type varchar(255) not null,
    done_by BYTEA   not null,
    primary key (id),
    foreign key (done_by) references "user" (id)
);

create table address
(
    id BYTEA not null,
    city varchar(255),
    country varchar(255),
    linea varchar(255),
    lineb varchar(255),
    postal_code varchar(255),
    state varchar(255),
    version integer,
    primary key (id)
);

create table account
(
    id BYTEA not null,
    created_on TIMESTAMP,
    domain varchar(255),
    last_modified_on TIMESTAMP,
    name varchar(255),
    version integer,
    assigned_to_id BYTEA,
    billing_address_id BYTEA,
    created_by BYTEA,
    last_modified_by BYTEA,
    shipping_address_id BYTEA,
    primary key (id),
    foreign key (assigned_to_id) references "user" (id),
    foreign key (billing_address_id) references address (id),
    foreign key (shipping_address_id) references address (id),
    foreign key (created_by) references "user" (id),
    foreign key (last_modified_by) references "user" (id)
);

create table contact
(
    id BYTEA not null,
    created_on TIMESTAMP,
    department varchar(255),
    firstname varchar(255),
    last_modified_on TIMESTAMP,
    lastname varchar(255),
    source varchar(255),
    title varchar(255),
    version integer,
    account_id BYTEA,
    address BYTEA,
    assigned_to_id BYTEA,
    created_by BYTEA,
    last_modified_by BYTEA,
    primary key (id),
    foreign key (account_id) references account (id),
    foreign key (address) references address (id),
    foreign key (assigned_to_id) references "user" (id),
    foreign key (created_by) references "user" (id),
    foreign key (last_modified_by) references "user" (id)
);

create table contact_email
(
    contact_id BYTEA not null,
    email varchar(255),
    foreign key (contact_id) references contact (id)
);

create table contact_phone
(
    contact_id BYTEA not null,
    phone varchar(255),
    foreign key (contact_id) references contact (id)
);

create table leads
(
    id BYTEA not null,
    created_on TIMESTAMP,
    department varchar(255),
    firstname varchar(255),
    last_modified_on TIMESTAMP,
    lastname varchar(255),
    referred_by varchar(255),
    source varchar(255),
    source_description varchar(255),
    status varchar(255),
    title varchar(255),
    account_id BYTEA,
    address BYTEA,
    assigned_to_id BYTEA,
    created_by BYTEA,
    last_modified_by BYTEA,
    primary key (id),
    foreign key (account_id) references account (id),
    foreign key (address) references address (id),
    foreign key (assigned_to_id) references "user" (id),
    foreign key (created_by) references "user" (id),
    foreign key (last_modified_by) references "user" (id)
);

create table status_description
(
    lead_id BYTEA   not null,
    description varchar(255),
    status varchar(255) not null,
    primary key (lead_id, status),
    foreign key (lead_id) references leads (id)
);

create table lead_email
(
    lead_id BYTEA not null,
    email varchar(255),
    foreign key (lead_id) references leads (id)
);

create table lead_phone
(
    lead_id BYTEA not null,
    phone varchar(255),
    foreign key (lead_id) references leads (id)
);

create table opportunity
(
    id BYTEA not null,
    amount DOUBLE PRECISION,
    created_on TIMESTAMP,
    description varchar(255),
    last_modified_on TIMESTAMP,
    name varchar(255),
    probability DOUBLE PRECISION,
    source varchar(255),
    stage varchar(255),
    type varchar(255),
    version integer,
    account_id BYTEA,
    assigned_to_id BYTEA,
    created_by BYTEA,
    last_modified_by BYTEA,
    lead_id BYTEA,
    primary key (id),
    foreign key (account_id) references account (id),
    foreign key (assigned_to_id) references "user" (id),
    foreign key (created_by) references "user" (id),
    foreign key (last_modified_by) references "user" (id),
    foreign key (lead_id) references leads (id)
);
