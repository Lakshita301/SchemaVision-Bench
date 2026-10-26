-- Source: https://github.com/milincjoshi/GAPP/blob/69cb1a2a6323b360e31a4507d5d01b22d08f7a09/src/main/scripts/gapp-create.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 22

create table AdditionalInfo (
        additionalInfoId int4 not null,
        InfoName varchar(255),
        InfoRequired boolean,
        InfoType varchar(255),
        departmentId int4,
        primary key (additionalInfoId)
    );

create table AdditionalValues (
        AdditionalValueId int4 not null,
        typeValue varchar(255),
        additionalInfoId int4,
        userId int4,
        primary key (AdditionalValueId)
    );

create table Admin (
        userId int4 not null,
        primary key (userId)
    );

create table Department (
        departmentId int4 not null,
        departmentName varchar(255),
        primary key (departmentId)
    );

create table Program (
        programId int4 not null,
        programName varchar(255),
        departmentId int4,
        primary key (programId)
    );

create table Staff (
        userId int4 not null,
        primary key (userId)
    );

create table Students (
        citizenship varchar(255),
        dateOfBirth varchar(255),
        phoneNumber int8,
        type varchar(255),
        userId int4 not null,
        primary key (userId)
    );

create table application (
        applicationId int4 not null,
        isSubmitted boolean,
        submittedDate timestamp,
        termSeason varchar(255),
        termYear varchar(255),
        transcript varchar(255),
        programId int4,
        userId int4,
        primary key (applicationId)
    );

create table applicationStatus (
        applicationStatusId int4 not null,
        applicationComment varchar(255),
        applicationStatus varchar(255),
        applicationTime varchar(255),
        applicationId int4,
        primary key (applicationStatusId)
    );

create table studentBackground (
        studentbackgroundId int4 not null,
        studentDegree varchar(255),
        studentDegreeFrom varchar(255),
        studentDegreeTo varchar(255),
        studentMajor varchar(255),
        studentUniversity varchar(255),
        userId int4,
        primary key (studentbackgroundId)
    );

create table users (
        userId int4 not null,
        userCIN varchar(255),
        userEmail varchar(255),
        userFirstName varchar(255),
        userLastName varchar(255),
        userPassword varchar(255),
        userType varchar(255),
        primary key (userId)
    );

-- Foreign keys added via ALTER TABLE:
alter table AdditionalInfo 
        add constraint FK_2bb5bpw8dgg0xl3d9rsb4ym1w 
        foreign key (departmentId) 
        references Department;

alter table AdditionalValues 
        add constraint FK_66iv8xq7a09pp01xdoosm8wx8 
        foreign key (additionalInfoId) 
        references AdditionalInfo;

alter table AdditionalValues 
        add constraint FK_9qvdlx8sp63m5citduakecgg6 
        foreign key (userId) 
        references users;

alter table Admin 
        add constraint FK_7mu18x7pio6euryjh2pq2e90e 
        foreign key (userId) 
        references users;

alter table Program 
        add constraint FK_luaxcdcts8gbj602p31w87v47 
        foreign key (departmentId) 
        references Department;

alter table Staff 
        add constraint FK_1lpdygag4jcl2utgfieljss36 
        foreign key (userId) 
        references users;

alter table Students 
        add constraint FK_tkjgq7fj8jib0eira89syqiwc 
        foreign key (userId) 
        references users;

alter table application 
        add constraint FK_7l8toxfx1ynqeh4nw52l2t4r6 
        foreign key (programId) 
        references Program;

alter table application 
        add constraint FK_slsypi7r0febmgdsceyc8kgag 
        foreign key (userId) 
        references users;

alter table applicationStatus 
        add constraint FK_f3p69u6krdf02xace11d672uq 
        foreign key (applicationId) 
        references application;

alter table studentBackground 
        add constraint FK_o6p03mbg823fmgjyubl51d8yj 
        foreign key (userId) 
        references users;

