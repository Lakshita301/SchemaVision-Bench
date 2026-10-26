-- Source: https://github.com/michelnguyen567/Sakai_12_3_Hutech/blob/91186460f12410017aabf342502d82909339116a/gradebook/app/business/src/sql/oracle/sakai_gradebook_2.1.x_to_2.2.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

create table GB_PROPERTY_T (
   ID number(19,0) not null,
   VERSION number(10,0) not null,
   NAME varchar2(255) not null unique,
   VALUE varchar2(255),
   primary key (ID)
);

create table GB_GRADING_SCALE_GRADES_T (
   GRADING_SCALE_ID number(19,0) not null,
   LETTER_GRADE varchar2(255),
   GRADE_IDX number(10,0) not null,
   primary key (GRADING_SCALE_ID, GRADE_IDX)
);

create table GB_GRADING_SCALE_T (
   ID number(19,0) not null,
   OBJECT_TYPE_ID number(10,0) not null,
   VERSION number(10,0) not null,
   SCALE_UID varchar2(255) not null unique,
   NAME varchar2(255) not null,
   UNAVAILABLE number(1,0),
   primary key (ID)
);

create table GB_GRADING_SCALE_PERCENTS_T (
   GRADING_SCALE_ID number(19,0) not null,
   PERCENT double precision,
   LETTER_GRADE varchar2(255) not null,
   primary key (GRADING_SCALE_ID, LETTER_GRADE)
);

-- Foreign keys added via ALTER TABLE:
alter table GB_GRADING_SCALE_GRADES_T add constraint FK5D3F0C955A72817B foreign key (GRADING_SCALE_ID) references GB_GRADING_SCALE_T;

alter table GB_GRADE_MAP_T add constraint FKADE11225108F4490 foreign key (GB_GRADING_SCALE_T) references GB_GRADING_SCALE_T;

alter table GB_GRADING_SCALE_PERCENTS_T add constraint FKC98BE4675A72817B foreign key (GRADING_SCALE_ID) references GB_GRADING_SCALE_T;

