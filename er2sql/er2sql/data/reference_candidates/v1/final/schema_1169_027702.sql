-- Source: https://github.com/amantiwari8861/mysql-tutorial/blob/9131f8d3f8dee635b52def014585fff64eeb60f7/first.sql?raw=true
-- Tables detected: 15 | FK constraints: 7
-- constraint comp1 primary key(name,lname)
-- constraint myrule foreign key(categoryid) references categories(categoryid)
-- Foreign keys added via ALTER TABLE:
create table Students(
    roll_no int,
    name char(30)
);

create table Demo(
    col1 int,
    col2 char(20),
    col3 float,
    col4 DOUBLE PRECISION,
    col5 boolean
);

create table Demo2(
    col1 varchar(50),
    col2 SMALLINT,
    col3 INTEGER,
    col4 int,
    col5 bigint
);

create table demo3(
    col1 integer,
    col2 decimal(5,2)
);

create table demo4(
    col1 date,
    col2 time,
    col3 TIMESTAMP,
    col4 timestamp
);

create table Studentz(
    roll int,
    name varchar(50),
    abc varchar(30)
);

create table dem(
    col text
);

create table tab7(
    col1 varchar(30),
    col2 varchar(50),
    col3 varchar(60)
);

create table Users(
    empid int unique auto_increment,
    name varchar(30) not null,
    Entry timestamp default(current_timestamp())
);

create table Student(
    rollNo int not null unique auto_increment,
    name varchar(50) not null,
    mobile varchar(30) unique,
    address varchar(50),
    email varchar(30) not null unique
);

create table Student(
    rollNo int not null unique auto_increment,
    name varchar(50) not null,
    mobile varchar(30) primary key,
    address varchar(50),
    email varchar(30) not null unique
);

create table Student(
    rollNo int not null unique auto_increment,
    name varchar(50),
    mobile varchar(30),
    address varchar(50),
    email varchar(30),
    primary key(mobile)
);

create table Student(
    rollNo int not null unique auto_increment,
    name varchar(50),
    mobile varchar(30),
    address varchar(50),
    email varchar(30),
    constraint const1 primary key(mobile)
);

create table user(
    name varchar(30),
    lname varchar(30),
    fname varchar(30),
    mname varchar(30),
    num int check(num>3)
);

create table student(
    studentid varchar(30) primary key,
    name varchar(50),
    class varchar(30),
    address varchar(30)
);

create table teacher(
    teacherid varchar(30) primary key,
    studentid varchar(30),
    name varchar(40),
    subject varchar(40),
    foreign key(studentid) references Student(studentid)
);

create table categories(
    categoryid int,
    categoryname varchar(30),
    description varchar(50),
    primary key(categoryid)
);

create table products(
    categoryid int,
    productid int,
    productname varchar(30),
    description varchar(40),
    foreign key(categoryid) references categories(categoryid)
);

create table categories(
    categoryid int,
    categoryname varchar(30),
    description varchar(50),
    primary key(categoryid)
);

create table products(
    categoryid int,
    productid int,
    productname varchar(30),
    description varchar(40),
    foreign key(categoryid) references categories(categoryid)
on update restrict on delete restrict
);

create table categories(
    categoryid int,
    categoryname varchar(30),
    description varchar(50),
    primary key(categoryid)
);

create table products(
    categoryid int,
    productid int,
    productname varchar(30),
    description varchar(40),
    foreign key(categoryid) references categories(categoryid)
on update cascade on delete cascade
);

create table categories(
    categoryid int,
    categoryname varchar(30),
    description varchar(50),
    primary key(categoryid)
);

create table products(
    categoryid int,
    productid int,
    productname varchar(30),
    description varchar(40),
    foreign key(categoryid) references categories(categoryid)
on update set null on delete set null
);

create table categories(
    categoryid int,
    categoryname varchar(30),
    description varchar(50),
    primary key(categoryid)
);

create table products(
    categoryid int,
    productid int,
    productname varchar(30),
    description varchar(40),
    foreign key(categoryid) references categories(categoryid)
on update cascade on delete set null
);

create table categories(
    categoryid int,
    categoryname varchar(30),
    description varchar(50),
    primary key(categoryid)
);

create table products(
    categoryid int,
    productid int,
    productname varchar(30),
    description varchar(40),
    foreign key(categoryid) references categories(categoryid)
);

create table products;


                         

alter table products drop foreign key myrule;

alter table products drop foreign key products_ibfk_1;
