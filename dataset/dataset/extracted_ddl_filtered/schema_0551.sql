-- Source: https://github.com/animeshhparashar/lin-crm/blob/b7ba2151ecdb1c28cfa584f53936c76bf869c092/server/LIN_DB.sql?raw=true
-- Tables detected: 14 | FK/REFERENCES mentions: 62

create table user
(
    id               BINARY(16) not null,
    created_on       datetime,
    date_of_birth    datetime,
    department       varchar(255),
    email            varchar(255),
    firstname        varchar(255),
    gender           varchar(255),
    job_title        varchar(255),
    last_modified_on datetime,
    lastname         varchar(255),
    password         varchar(255),
    phone_number     varchar(255),
    status           bit,
    version          integer,
    created_by       BINARY(16),
    last_modified_by BINARY(16),
    supervisor       BINARY(16),
    primary key (id),
    foreign key (created_by) references user (id),
    foreign key (last_modified_by) references user (id),
    foreign key (supervisor) references user (id)
) engine = InnoDB;

create table role
(
    id          BINARY(16) not null,
    description varchar(255),
    name        varchar(255),
    primary key (id)
) engine = InnoDB;

create table user_roles
(
    user_id BINARY(16) not null,
    role    BINARY(16) not null,
    foreign key (user_id) references user (id),
    foreign key (role) references role (id)
) engine = InnoDB;

create table activity_trail
(
    id          BINARY(16)   not null,
    description varchar(255) not null,
    done_at     datetime     not null,
    identifier  BINARY(16)   not null,
    type        varchar(255) not null,
    done_by     BINARY(16)   not null,
    primary key (id),
    foreign key (done_by) references user (id)
) engine = InnoDB;

create table address
(
    id          BINARY(16) not null,
    city        varchar(255),
    country     varchar(255),
    linea       varchar(255),
    lineb       varchar(255),
    postal_code varchar(255),
    state       varchar(255),
    version     integer,
    primary key (id)
) engine = InnoDB;

create table account
(
    id                  BINARY(16) not null,
    created_on          datetime,
    domain              varchar(255),
    last_modified_on    datetime,
    name                varchar(255),
    version             integer,
    assigned_to_id      BINARY(16),
    billing_address_id  BINARY(16),
    created_by          BINARY(16),
    last_modified_by    BINARY(16),
    shipping_address_id BINARY(16),
    primary key (id),
    foreign key (assigned_to_id) references user (id),
    foreign key (billing_address_id) references address (id),
    foreign key (shipping_address_id) references address (id),
    foreign key (created_by) references user (id),
    foreign key (last_modified_by) references user (id)
) engine = InnoDB;

create table contact
(
    id               BINARY(16) not null,
    created_on       datetime,
    department       varchar(255),
    firstname        varchar(255),
    last_modified_on datetime,
    lastname         varchar(255),
    source           varchar(255),
    title            varchar(255),
    version          integer,
    account_id       BINARY(16),
    address          BINARY(16),
    assigned_to_id   BINARY(16),
    created_by       BINARY(16),
    last_modified_by BINARY(16),
    primary key (id),
    foreign key (account_id) references account (id),
    foreign key (address) references address (id),
    foreign key (assigned_to_id) references user (id),
    foreign key (created_by) references user (id),
    foreign key (last_modified_by) references user (id)
) engine = InnoDB;

create table contact_email
(
    contact_id BINARY(16) not null,
    email      varchar(255),
    foreign key (contact_id) references contact (id)
) engine = InnoDB;

create table contact_phone
(
    contact_id BINARY(16) not null,
    phone      varchar(255),
    foreign key (contact_id) references contact (id)
) engine = InnoDB;

create table leads
(
    id                 BINARY(16) not null,
    created_on         datetime,
    department         varchar(255),
    firstname          varchar(255),
    last_modified_on   datetime,
    lastname           varchar(255),
    referred_by        varchar(255),
    source             varchar(255),
    source_description varchar(255),
    status             varchar(255),
    title              varchar(255),
    account_id         BINARY(16),
    address            BINARY(16),
    assigned_to_id     BINARY(16),
    created_by         BINARY(16),
    last_modified_by   BINARY(16),
    primary key (id),
    foreign key (account_id) references account (id),
    foreign key (address) references address (id),
    foreign key (assigned_to_id) references user (id),
    foreign key (created_by) references user (id),
    foreign key (last_modified_by) references user (id)
) engine = InnoDB;

create table status_description
(
    lead_id     BINARY(16)   not null,
    description varchar(255),
    status      varchar(255) not null,
    primary key (lead_id, status),
    foreign key (lead_id) references leads (id)
) engine = InnoDB;

create table lead_email
(
    lead_id BINARY(16) not null,
    email   varchar(255),
    foreign key (lead_id) references leads (id)
) engine = InnoDB;

create table lead_phone
(
    lead_id BINARY(16) not null,
    phone   varchar(255),
    foreign key (lead_id) references leads (id)
) engine = InnoDB;

create table opportunity
(
    id               binary(255) not null,
    amount           double precision,
    created_on       datetime,
    description      varchar(255),
    last_modified_on datetime,
    name             varchar(255),
    probability      double precision,
    source           varchar(255),
    stage            varchar(255),
    type             varchar(255),
    version          integer,
    account_id       BINARY(16),
    assigned_to_id   BINARY(16),
    created_by       BINARY(16),
    last_modified_by BINARY(16),
    lead_id          BINARY(16),
    primary key (id),
    foreign key (account_id) references account (id),
    foreign key (assigned_to_id) references user (id),
    foreign key (created_by) references user (id),
    foreign key (last_modified_by) references user (id),
    foreign key (lead_id) references leads (id)
) engine = InnoDB;

