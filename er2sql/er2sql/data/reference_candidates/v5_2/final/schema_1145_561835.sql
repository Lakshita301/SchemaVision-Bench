-- Source: https://github.com/farnulfo/castor/blob/974f853be5680427a195a6b8ae3ce63a65a309b6/castor/tags/castor-1.3.3-rc1/trunk/cpactf/src/test/ddl/org/castor/cpa/test/test29/progress-create.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

create table test29_depend1 (
  id          int not null primary key
);

create table test29_depend_master (
  id          int not null primary key,
  depend1_id  int,
    index test29_master_depend ( depend1_id ),
  foreign key ( depend1_id ) references test29_depend1 ( id )
);

create table test29_depend2 (
  id          int not null primary key,
  master_id   int,
    index test29_depend_master ( master_id ),
  foreign key ( master_id ) references test29_depend_master ( id )
);

