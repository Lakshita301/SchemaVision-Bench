-- Source: https://github.com/BodleyAlton/TRS/blob/ef972b107d540470d7fcd500444a3a4aca649b25/schema1.sql?raw=true
-- Tables detected: 10 | FK constraints: 10
-- cemail varchar(17),
-- cpassword varchar (20),
-- demail varchar (15),
-- dpassword varchar(20),
create table client(
    userCID varchar(20) Not Null,
    cfname varchar(20),
    clname varchar(20),
    ccontact int,
    cadd1 varchar (30),
    cadd2 varchar(30),
    city varchar(25),
    parish varchar(12),
    primary key(userCID)
);

create table driver(
    userDID varchar(20),
    cstatus varchar(20),
    primary key(userDID)
);

create table driver(
    userDID varchar(20) Not Null,
    dtrn int,
    dfname varchar(20),
    dlname varchar(20),
    dcontact varchar(10),
    daddr1 varchar(20),
    daddr2 varchar(20),
    dcity varchar(20),
    dparish varchar(12),
    dstatus varchar(11),
    primary key(userDID)
);

create table operator(
    userOID varchar(20) Not Null,
    ofname varchar(20),
    olname varchar(20),
    otrn int,
    oadd1 varchar(20),
    oadd2 varchar(20),
    ocity varchar(20),
    oparish varchar(12),
    primary key(userOID)
);

create table vehicle(
    plateNum varchar(8),
    vmodel varchar(10),
    vmake varchar(15),
    vcolour varchar(10),
    seat_cap int,
    class varchar(10),
    primary key(plateNum)
);

create table job_view(
    userDID varchar(20),
    userCID varchar(20),
    userOID varchar(20),
    plateNum varchar(6),
    job_date date,
    job_time time,
    job_status varchar(9),
    primary key(userDID,userCID,plateNum),
    foreign key (userDID) references driver(userDID) on update cascade on delete cascade,
    foreign key (userCID) references client(userCID) on update cascade on delete cascade,
    foreign key (userOID) references operator(userOID) on update cascade on delete cascade,
    foreign key (plateNum) references vehicle(plateNum) on update cascade on delete cascade
);

create table carry(
    userCID varchar(20),
    userDID varchar(20),
    plateNum varchar(6),
    primary key(userDID,userCID,plateNum),
    foreign key (userDID) references driver(userDID) on update cascade on delete cascade,
    foreign key (userCID) references client(userCID) on update cascade on delete cascade,
    foreign key (plateNum) references vehicle(plateNum) on update cascade on delete cascade
);

create table operates(
    userDID varchar(20),
    plateNum varchar(6),
    primary key(userDID,plateNum),
    foreign key (userDID) references driver(userDID) on update cascade on delete cascade,
    foreign key (plateNum) references vehicle(plateNum) on update cascade on delete cascade
);

create table users(
    id varchar(20),
    email varchar(17),
    password varchar(20),
    utype varchar(15),
    primary key(id)
);

create table driver_location(
    userDID varchar(20),
    lat decimal(3),
    longi decimal(3),
    pos decimal(3),
    primary key(userDID),
    foreign key (userDID) references driver(userDID) on update cascade on delete cascade
);

create table idvalue(
    idV int AUTO_INCREMENT NOT NULL,
    cValue int,
    dValue int,
    oValue int,
    primary key(idV)
);
