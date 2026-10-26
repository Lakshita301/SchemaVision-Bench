-- Source: https://github.com/hxvvxh/springboot--/blob/7f1c177d8dac1a466beb0a81dccb32d8b68d5bde/23-my-hibernatemtm/hibernatemtm/src/main/resources/manytomany.sql?raw=true
-- Tables detected: 3 | FK constraints: 2
create table project
(
    proid int primary key,
    proname varchar(20) not null
);
create table employee
(
    empid int primary key,
    empname varchar(20)
);
create table proemp
(
    rproid int,
    rempid int,
    constraint fk_rproid 
	foreign key (rproid) references project(proid),
    constraint fk_rempid
	foreign key (rempid) references employee(empid)
);
