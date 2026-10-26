-- Source: https://github.com/farnulfo/castor/blob/974f853be5680427a195a6b8ae3ce63a65a309b6/castor/branches/castor-ase-09/cpactf/src/test/ddl/org/castor/cpa/test/test77/mysql-create.sql?raw=true
-- Tables detected: 3 | FK constraints: 2
create table test77_depend1(
    id int not null,
    constraint test77_depend1_pk primary key (id)
);
create table test77_master(
    id int not null,
    depend1_id int,
    constraint test77_master_pk primary key (id),
    constraint test77_master_depend1_fk
    foreign key (depend1_id) references test77_depend1 (id)
);
create table test77_depend2(
    id int not null,
    master_id int,
    constraint test77_depend2_pk primary key (id),
    constraint test77_depend2_master_fk
    foreign key (master_id) references test77_master(id)
);
