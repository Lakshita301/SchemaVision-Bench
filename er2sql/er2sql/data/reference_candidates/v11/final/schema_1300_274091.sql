-- Source: https://github.com/sophiekobelja/researchmeng2/blob/75bef7272143e1f16a7dcac76432a2565df64072/derby/512019_DERBY-2371/from/altertable.sql?raw=true
-- Tables detected: 53 | FK constraints: 5
create table t0(
    c1 int not null constraint p1 primary key
);
create table t0_1(
    c1 int
);
create table t0_2(
    c1 int
);
create table t0_3(
    c1 int
);
create table t1(
    c1 int
);
create table t1_1(
    c1 int
);
create table t2(
    c1 int
);
create table t3(
    c1 int
);
create table t4(
    c1 int not null
);
create table tab1 (
    c1 int,
    c2 int not null constraint tab1pk primary key,
    c3 DOUBLE PRECISION,
    c4 int
);
create table tab2 (
    c1 int not null unique,
    c2 DOUBLE PRECISION,
    c3 int,
    c4 int not null constraint c4_PK primary key,
    c5 int,
    constraint t2ck check (c2+c3<100.0)
);
create table tab3 (
    c1 int,
    c2 int,
    c3 int,
    c4 int,
    constraint t3ck check (c2-c3<80)
);
create table tab4 (
    c1 int,
    c2 int,
    c3 int,
    c4 int
);
create table tab5 (
    c1 int
);
create table tt1(
    a int,
    b int not null constraint tt1uc unique
);
create table reftt1(
    a int
);
create table xxx(
    c1 int,
    c2 int
);
create table b793 (
    pn1 int not null constraint named_primary primary key,
    pn2 int constraint named_pn2 check (pn2 > 3)
);
create table reft1(
    a int
);
create table x (
    x int not null,
    y int not null
);
create table LOGGED(
    c11 int
);
create table atmcn_1 (
    a integer,
    b integer not null
);
create table atmcn_2 (
    a integer not null primary key,
    b integer not null
);
create table atmcn_3 (
    a integer not null,
    b integer not null
);
create table atmcn_4 (
    a integer not null,
    b integer
);
create table atmcn_5 (
    a integer not null,
    b integer not null unique
);
create table atmod_1 (
    a integer,
    b varchar(10)
);
create table renc_1 (
    a int,
    b varchar(10),
    c timestamp,
    d DOUBLE PRECISION
);
create table renc_2(
    c1 int not null constraint renc_2_p1 primary key
);
create table renc_3 (
    a integer not null,
    b integer not null,
    c int,
    constraint renc_3_pk primary key(a, b)
);
create table renc_4 (
    c1 int not null unique,
    c2 DOUBLE PRECISION,
    c3 int,
    c4 int not null constraint renc_4_c4_PK primary key,
    c5 int,
    c6 int,
    constraint renc_4_t2ck check (c2+c3<100.0)
);
create table renc_5 (
    c1 int,
    c2 int,
    c3 int,
    c4 int,
    c5 int not null,
    c6 int,
    constraint renc_5_unq unique(c5),
    constraint renc_5_t3ck check (c2-c3<80)
);
create table renc_6 (
    a int,
    b int,
    c int
);
create table renc_7 (
    c1 varchar(50),
    c2 int
);
create table renc_8 (
    a int,
    b int,
    c int
);
create table atdc_0 (
    a integer
);
create table atdc_1 (
    a integer,
    b integer
);
create table atdc_1_01 (
    a int,
    b int,
    c int not null primary key
);
create table atdc_1_02 (
    a int not null primary key,
    b int
);
create table atdc_1_03 (
    a03 int
);
create table atdc_1_constraints (
    a int not null primary key,
    b int not null,
    c int constraint atdc_1_c_chk check (c is not null),
    d int not null unique,
    e int,
    f int
);
create table atdc_2 (
    a integer
);
create table atdc_3 (
    a integer
);
create table atdc_4 (
    a int,
    b int,
    c int,
    d int,
    e int
);
create table atdc_5 (
    a int,
    b int
);
create table atdc_5a (
    a int,
    b int,
    c int
);
create table atdc_6 (
    a integer,
    b integer
);
create table atdc_7 (
    a int,
    b int,
    c int,
    primary key (a)
);
create table atdc_8 (
    a int,
    b int,
    c int,
    primary key (b, c)
);
create table atdc_9 (
    a int not null,
    b int
);
create table atdc_10 (
    a int,
    b int,
    c int
);
create table d1909 (
    a int,
    b int,
    c int
);
create table xxx(
    c1 int
);
create table t0_1 (
    c1 int,
    c2 int not null constraint p2 primary key
);
create table t1(
    a int not null constraint t1_pri primary key
);
create table x (
    x int not null,
    y int not null
);
create table t1(
    c1 int,
    c2 int not null primary key
);
create table logged(
    logged int
);
ALTER TABLE t4 ADD constraint t4fk foreign key ("c1") references t0;
ALTER TABLE tab3 ADD constraint t3fk foreign key (c2) references tab2(c1);
ALTER TABLE reftt1 ADD constraint reftt1rc FOREIGN KEY (a) references tt1(b);
ALTER TABLE reft1 ADD constraint t1_ref FOREIGN KEY (a) references t1(a);
ALTER TABLE renc_5 ADD constraint renc_5_t3fk foreign key (c2) references renc_4(c4);
ALTER TABLE atdc_1_03 ADD constraint a03_fk foreign key (a03) references atdc_1_02(a);
ALTER TABLE atdc_1_constraints ADD constraint atdc_1_e_fk foreign key (e) references atdc_1_constraints(a);
