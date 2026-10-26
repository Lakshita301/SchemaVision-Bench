-- Source: https://github.com/raychorn/svn_rackspace/blob/c87323446f2820d165edab7f8c7a7436b7bee19e/python/maintcal/maintcal/model/model.sql?raw=true
-- Tables detected: 13 | FK constraints: 9

create table scheduled_maintenance (
  id                        serial not null,
  master_ticket             text,	-- This references the ticket number.
  account_id                integer,	-- The account number (AccountNumber) of the associated account.
  account_name              text,
  state_id                  integer default 1,	-- Foreign key to the "state" table.
  date_assigned             timestamp with time zone default now(),
  additional_duration       interval,
  expedite                  boolean default false,
  general_description       text,
  service_type_id           integer,
  contact_id                integer,
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Scheduled_maintenance primary key (id)
) ;

create table maintenance_category (
  id                        serial not null,
  name                      text,
  description               text,
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Maintenance_category primary key (id)
) ;

create table calendar_selector (
  id                        serial not null,
  calendar_id               integer,	-- Implicit reference to 'calendar' table.
  segment                   text,	-- stringified value of the account segment. Valid values are outputs from the 'segment' value from the CORE XMLRPC/Computer/getDetailsByComputer method.
  category                  integer,	-- implicit reference to the "maintenance_category" table
  server_os                 text,	-- Operating system
  datacenter                text,	-- Datacenter symbol
  has_managed_storage       boolean,	-- Set if managed storage is a factor. Null will mean that it does not matter.
  service_type_id           integer,	-- Implicit reference to the "service_type" table.
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Calendar_selector primary key (id)
) ;

create table service_category (
  id                        serial not null,
  name                      text,
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Service_category primary key (id)
) ;

create table service_type (
  id                        serial not null,
  name                      text,
  description               text,
  active                    boolean default false,
  length                    interval,
  lead_time                 interval,
  service_category_id       integer,
  maintenance_category_id   integer,	-- Foreign key to the maintenance_category table.
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Service_type primary key (id)
) ;

create table calendar (
  id                        serial not null,
  name                      text,
  description               text,
  tckt_queue_id             integer,
  tckt_subcategory_id       integer,
  active                    boolean default true,
  bookings                  integer default 1,	-- Default value for bookings.
  timezone                  text default 'UTC',
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Calendar primary key (id)
) ;

create table scheduled_service (
  id                        serial not null,
  description               text,
  ticket_number             text,
  start_time                timestamp with time zone,
  end_time                  timestamp with time zone,
  calendar_id               integer,
  scheduled_maintenance_id  integer,	-- Foreign key reference to the "UPGD_ScheduledMaintenance" table.
  state_id                  integer default 1,
  date_assigned             timestamp with time zone default now(),
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Scheduled_service primary key (id)
) ;

create table xref_scheduled_service_server_list (
  id                        serial not null,
  scheduled_service_id      integer,
  computer_number           integer,
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Xref_scheduled_service_server_list primary key (id)
) ;

create table times_available (
  id                        serial not null,
  calendar_id               integer,
  bookings                  integer,
  start_time                timestamp with time zone,
  end_time                  timestamp with time zone,
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Times_available primary key (id)
) ;

create table user_cache (
  id                        integer not null,
  username                  text,
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_User_cache primary key (id)
) ;

create table blocked_time (
  id                        serial not null,
  recurrence_id             integer,
  description               text,
  contact_id                integer,
  start_time                timestamp with time zone,
  end_time                  timestamp with time zone,
  bookings                  integer,
  date_assigned             timestamp with time zone default now(),
  calendar_id               integer,
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Blocked_time primary key (id)
) ;

create table server_cache (
  id                        integer not null,
  name                      text,
  os_type                   text,
  datacenter_symbol         text,
  has_managed_storage       boolean default false,
  segment                   text,
  icon                      text,	-- The url of the icon in CORE for the device.
  creation_date             timestamp default now(),
  modification_date         timestamp default now(),
  constraint pk_Server_cache primary key (id)
) ;

create table change_log (
  id                        serial not null,
  table_id                  char(1),	-- Single character ID indicating the table reference. 't' : service_type;

-- Foreign keys added via ALTER TABLE:
alter table service_type add constraint service_type_fk_Maintenance_category_id
  foreign key (maintenance_category_id)
  references maintenance_category (id)  ;

alter table scheduled_maintenance add constraint scheduled_maintenance_fk_Service_type_id
  foreign key (service_type_id)
  references service_type (id)  ;

alter table service_type add constraint service_type_fk_Service_category_id
  foreign key (service_category_id)
  references service_category (id)  ;

alter table scheduled_service add constraint scheduled_service_fk_Calendar_id
  foreign key (calendar_id)
  references calendar (id)  ;

alter table scheduled_service add constraint scheduled_service_fk_Scheduled_maintenance_id
  foreign key (scheduled_maintenance_id)
  references scheduled_maintenance (id)  ;

alter table xref_scheduled_service_server_list add constraint xref_scheduled_service_server_list_fk_Scheduled_service_id
  foreign key (scheduled_service_id)
  references scheduled_service (id)  ;

alter table times_available add constraint times_available_fk_Calendar_id
  foreign key (calendar_id)
  references calendar (id)  ;

alter table xref_scheduled_service_server_list add constraint xref_scheduled_service_server_list_fk_Computer_number
  foreign key (computer_number)
  references server_cache (id)  ;

alter table blocked_time add constraint blocked_time_fk_Calendar_id
  foreign key (calendar_id)
  references calendar (id)  ;

