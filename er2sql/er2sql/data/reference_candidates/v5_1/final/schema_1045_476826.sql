-- Source: https://github.com/YEmreAk/IstanbulUniversityCerrahpasa-CE/blob/a0e7d8ab527ea35782c4e5eb4945bec25e604024/donem5/veritabani-yonetim-sistemleri/ders-icerigi/odevler/odev4/database.sql?raw=true
-- Tables detected: 6 | FK constraints: 7
create table Department(
    did int not null,
    name varchar(30) not null,
    noOfStudents int DEFAULT 0,
    primary key(did)
);

create table Student(
    sid int not null,
    name varchar(30) not null,
    did int,
    noOfCourses int DEFAULT 0,
    GPA int DEFAULT 0,
    foreign key (did) references Department(did),
    primary key(sid)
);

create table Course(
    cid int not null,
    title varchar(30) not null,
    credits numeric(2) DEFAULT 0,
    did int,
    noOfStudents int DEFAULT 0,
    foreign key (did) references Department(did),
    primary key(cid)
);

create table Teacher(
    tid int not null,
    name varchar(30) not null,
    placeOfBirth varchar(15),
    did int,
    foreign key (did) references Department(did),
    primary key(tid)
);

create table Take(
    sid int not null,
    cid int not null,
    grade REAL,
    foreign key (sid) references Student(sid),
    foreign key (cid) references Course(cid),
    primary key (sid,cid)
);

create table Teach(
    tid int not null,
    cid int not null,
    foreign key (tid) references Teacher(tid),
    foreign key (cid) references Course(cid),
    primary key (tid,cid)
);
