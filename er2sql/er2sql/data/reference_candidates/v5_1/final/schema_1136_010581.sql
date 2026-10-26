-- Source: https://github.com/codehaus/castor/blob/974f853be5680427a195a6b8ae3ce63a65a309b6/castor/trunk/cpactf/src/test/ddl/org/castor/cpa/test/test78/hsql-create.sql?raw=true
-- Tables detected: 4 | FK constraints: 2
create table test78_table (
    id int           not null,
    value1 varchar(200)  not null,
    value2 varchar(200)
);
create table test78_depend1(
    id int not null,
    constraint test78_depend1_pk primary key (id)
);
create table test78_master(
    id int not null,
    depend1_id int,
    constraint test78_master_pk primary key (id),
    constraint test78_master_depend1_fk
    foreign key (depend1_id) references test78_depend1 (id)
);
create table test78_depend2(
    id int not null,
    master_id int,
    constraint test78_depend2_pk primary key (id),
    constraint test78_depend2_master_fk
    foreign key (master_id) references test78_master(id)
);
