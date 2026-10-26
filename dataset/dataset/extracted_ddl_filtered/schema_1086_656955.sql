-- Source: https://github.com/williamtellme123/repos/blob/fe823dd1ef5b2264d7cc40cc13881b29058791f8/sql-certification-student-files/CHAPTER%20%202%20STUDENTS/Hold/Chapter%202%20Homework.sql?raw=true
-- Tables detected: 3 | FK constraints: 2

create table movies_2 
(movie_id integer primary key,
 movie_name varchar2(50));

create table actors_2 
(actor_id integer primary key,
actor_fname varchar2(50),
actor_lname varchar2(50));

create table roles_2
(
    role_id integer primary key
  , mid integer
  , aid integer
  , role_type varchar2(15)
    , constraint mid_fk2 foreign key(mid) references movies_2(movie_id)
    , constraint aid_fk2 foreign key(aid) references actors_2(actor_id)
    , constraint role_ck2 check (role_type in ('Lead','Supporting', 'Cameo'))
);

