-- Source: https://github.com/airatchaplin/PJo/blob/073ab1a8a577a71b4b115f4f7a61a6b927300790/src/main/resources/db/migration/V1__create_table.sql?raw=true
-- Tables detected: 21 | FK constraints: 25

create table completed_orders
(
    id             uuid not null,
    comment        varchar(255),
    date_end       timestamp,
    date_start     timestamp,
    number_order   int4 not null,
    manager_id     uuid,
    object_name_id uuid,
    primary key (id)
);

create table completed_orders_detail_infos
(
    completed_order_id uuid not null,
    detail_infos_id    uuid not null
);

create table contragents
(
    id   uuid not null,
    name varchar(255),
    primary key (id)
);

create table detail_date_by_workbench
(
    id                uuid    not null,
    detail_date_end   timestamp,
    detail_date_start timestamp,
    is_setting        boolean not null,
    priority          int4    not null,
    work_bench_id     uuid,
    primary key (id)
);

create table detail_info
(
    id              uuid not null,
    comment         varchar(255),
    priority        int4 not null,
    time_work       varchar(255),
    work_benches_id uuid,
    primary key (id)
);

create table details
(
    id           uuid not null,
    name         varchar(255),
    time_packing varchar(255),
    material_id  uuid,
    primary key (id)
);

create table details_detail_infos
(
    detail_id       uuid not null,
    detail_infos_id uuid not null
);

create table details_order
(
    id        uuid not null,
    count     int4 not null,
    increment int4 not null,
    detail_id uuid,
    primary key (id)
);

create table details_order_detail_date_by_workbench
(
    details_order_id            uuid not null,
    detail_date_by_workbench_id uuid not null
);

create table details_order_is_calculated
(
    details_order_id uuid not null,
    is_calculated    boolean
);

create table materials
(
    id        uuid not null,
    name      varchar(255),
    thickness float8,
    primary key (id)
);

create table orders
(
    id               uuid not null,
    comment          varchar(255),
    date_end_order   timestamp,
    date_start_order timestamp,
    number_order     int4 not null,
    packing          varchar(255),
    painting         varchar(255),
    economist_id     uuid,
    manager_id       uuid,
    object_name_id   uuid,
    primary key (id)
);

create table orders_details_orders
(
    order_id          uuid not null,
    details_orders_id uuid not null
);

create table roles
(
    id   uuid not null,
    name varchar(255),
    primary key (id)
);

create table subsequence_type_operation
(
    id          uuid not null,
    description varchar(255),
    primary key (id)
);

create table subsequence_type_operation_type_operations
(
    subsequence_type_operation_id uuid not null,
    type_operations_id            uuid not null
);

create table type_operation
(
    id   uuid not null,
    name varchar(255),
    primary key (id)
);

create table type_operation_work_benches
(
    type_operation_id uuid not null,
    work_benches_id   uuid not null
);

create table users
(
    id                 uuid not null,
    filter_details     varchar(255),
    filter_workbenches varchar(255),
    fio                varchar(255),
    fio_i_o            varchar(255),
    last_name          varchar(255),
    name               varchar(255),
    password           varchar(255),
    username           varchar(255),
    primary key (id)
);

create table users_roles
(
    user_id  uuid not null,
    roles_id uuid not null
);

create table workbench
(
    id                uuid not null,
    current_thickness float8,
    date_end_detail   timestamp,
    name              varchar(255),
    type_operation_id uuid,
    primary key (id)
);

-- Foreign keys added via ALTER TABLE:
alter table if exists completed_orders
    add constraint FKlyeyp88hw379vbml5077gxae3 foreign key (manager_id) references users;

alter table if exists completed_orders
    add constraint FK66pn2bog0lt454xfy3md1h5wg foreign key (object_name_id) references contragents;

alter table if exists completed_orders_detail_infos
    add constraint FKr2xejh03xcrgce53wg26b3rt9 foreign key (detail_infos_id) references details_order;

alter table if exists completed_orders_detail_infos
    add constraint FKh5w58l9fgl79d67uen6bd7783 foreign key (completed_order_id) references completed_orders;

alter table if exists detail_date_by_workbench
    add constraint FK3ss5pmpjyrfd2xh7ep1j1ey2m foreign key (work_bench_id) references workbench;

alter table if exists detail_info
    add constraint FK3ikrqrrvu5x6revuk6untc0wb foreign key (work_benches_id) references workbench;

alter table if exists details
    add constraint FK1jpc8m60b3hyb5ns1kr3ef7bd foreign key (material_id) references materials;

alter table if exists details_detail_infos
    add constraint FKe51sqvp99rmkqx5pjhrvsaoxy foreign key (detail_infos_id) references detail_info;

alter table if exists details_detail_infos
    add constraint FKl6tnrq6xxywbrso8g677y8ws8 foreign key (detail_id) references details;

alter table if exists details_order
    add constraint FKarqo927ljstgpaglm3j18f4hp foreign key (detail_id) references details;

alter table if exists details_order_detail_date_by_workbench
    add constraint FKr7397fftcf8mnp6cvj45oo1qc foreign key (detail_date_by_workbench_id) references detail_date_by_workbench;

alter table if exists details_order_detail_date_by_workbench
    add constraint FKiywh0iw27t56ned7564au7n0o foreign key (details_order_id) references details_order;

alter table if exists details_order_is_calculated
    add constraint FKd9rgvjf45s2663bxnqltkqjh9 foreign key (details_order_id) references details_order;

alter table if exists orders
    add constraint FKq44037fqp5ci6lpmvsrtnlbur foreign key (economist_id) references users;

alter table if exists orders
    add constraint FK9qn4jar6kvccow7iyuo2mfuef foreign key (manager_id) references users;

alter table if exists orders
    add constraint FKk6on0fnwea31l3wrd9b79xp8d foreign key (object_name_id) references contragents;

alter table if exists orders_details_orders
    add constraint FKp39irdv3m0dvysq1vxxvboesc foreign key (details_orders_id) references details_order;

alter table if exists orders_details_orders
    add constraint FK2ov3ygn2ibi45wigspgjp11xs foreign key (order_id) references orders;

alter table if exists subsequence_type_operation_type_operations
    add constraint FKa2yj42k8v6xhjs70lgeooh4fw foreign key (type_operations_id) references type_operation;

alter table if exists subsequence_type_operation_type_operations
    add constraint FK7a0eostc2gb0towge7kvt6ue0 foreign key (subsequence_type_operation_id) references subsequence_type_operation;

alter table if exists type_operation_work_benches
    add constraint FKdch5g4u2qwf1m7jrbtmq2xwbu foreign key (work_benches_id) references workbench;

alter table if exists type_operation_work_benches
    add constraint FKqr8cns76k4nit8p9q5070urk6 foreign key (type_operation_id) references type_operation;

alter table if exists users_roles
    add constraint FKa62j07k5mhgifpp955h37ponj foreign key (roles_id) references roles;

alter table if exists users_roles
    add constraint FK2o0jvgh89lemvvo17cbqvdxaa foreign key (user_id) references users;

alter table if exists workbench
    add constraint FKwm0qawryp7tsjj64o66udkgo foreign key (type_operation_id) references type_operation;

