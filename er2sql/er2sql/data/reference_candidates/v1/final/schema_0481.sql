-- Source: https://github.com/King-git404/AAA/blob/ea5eb7f9074549311d553c8dc539134c76b3ecc9/sql/d.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

create table s
(
    sno char(10) primary key,
    sname char(10) not null,
    age int ,
    sex char(2),
    dept varchar(50)
);

create table c
(
    cno char(10) primary key,
    cname char(20) not null,
    credit float,
    pcno varchar(20),
    describe varchar(100)
);

create table sc
(
    sno char(10) ,
    cno char(10),
    grade float,
    primary key(sno,cno),
    foreign key(sno)references s(sno),
    foreign key(cno)references c(cno)
);

