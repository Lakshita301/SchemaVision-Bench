-- Source: https://github.com/shreyaspadhye3011/Leetcode/blob/e48704c9766846210bfe863a3195c93d15456080/databases/createdb.sql?raw=true
-- Tables detected: 19 | FK/REFERENCES mentions: 48

create table MOVIE (
    MID varchar2(5) not null constraint movie_pk primary key,
    NAME varchar2(50),
    YEAR number,
    DIRECTOR varchar2(50),
    LANGUAGE varchar2(20),
    COST number,
    COUNTRY varchar2(25)
);

create table MOVIE_ACTOR_LIST (
    MID varchar2(5),
    ACTOR varchar2(5),
    FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE
);

create table MOVIE_GENRE_LIST (
    MID varchar2(5),
    GENRE varchar2(15),
    FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE
);

create table PERSON (
    PID varchar2(5) not null constraint person_pk primary key,
    Name varchar2(50),
    Birthdate date,
    Gender varchar2(1),
    birthplace varchar2(25),
    Attribute varchar2(15),
    state varchar2(25),
    nation varchar2(25)
);

create table IMDB_USER (
    ID varchar2(5) PRIMARY KEY,
    EMAIL varchar2(80),
    FNAME varchar2(30),
    LNAME varchar2(30),
    DOB DATE,
    BIRTHPLACE varchar2(50),
    GENDER varchar2(1)
);

create table REVIEWS (
    MOVIE varchar2(5),
    AUTHOR varchar2(5),
    RATING number,
    VOTES number,
    PUBLISH_DATE TIMESTAMP,
    FOREIGN KEY (MOVIE) REFERENCES MOVIE(MID) ON DELETE CASCADE,
    FOREIGN KEY (AUTHOR) REFERENCES IMDB_USER(ID) ON DELETE CASCADE
);

create table ROLES (
    MOVIE varchar2(5),
    PERSON varchar2(5),
    ROLE varchar(25),
    FOREIGN KEY (MOVIE) REFERENCES MOVIE(MID) ON DELETE CASCADE,
    FOREIGN KEY (PERSON) REFERENCES PERSON(PID) ON DELETE CASCADE
);

create table SHOW (
    NAME varchar2(25),
    NETWORK varchar2(25),
    CATEGORY varchar2(10),
    PRIMARY KEY (NAME, NETWORK)
);

create table TV_SHOW_TEAM (
    NAME varchar2(25),
    NETWORK varchar2(25),
    ACTOR varchar2(5),
    PRODUCER varchar2(5),
    DIRECTOR varchar2(5),
    FOREIGN KEY (NAME, NETWORK) REFERENCES SHOW(NAME, NETWORK) ON DELETE CASCADE,
    FOREIGN KEY (ACTOR) REFERENCES PERSON(PID) ON DELETE CASCADE,
    FOREIGN KEY (DIRECTOR) REFERENCES PERSON(PID) ON DELETE CASCADE
);

create table FAVORITE_MOVIE_LIST (
    MID varchar2(5),
    ID varchar2(5),
    FOREIGN KEY (ID) REFERENCES IMDB_USER(ID) ON DELETE CASCADE,
    FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE
);

create table FAVORITE_SHOW_LIST (
    NAME varchar2(5),
    NETWORK varchar2(25),
    ID varchar2(5),
    FOREIGN KEY (NAME, NETWORK) REFERENCES SHOW(NAME, NETWORK) ON DELETE CASCADE,
    FOREIGN KEY (ID) REFERENCES IMDB_USER(ID) ON DELETE CASCADE
);

create table REVIEWED_MOVIE_LIST (
    MID varchar2(5),
    ID varchar2(5),
    FOREIGN KEY (ID) REFERENCES IMDB_USER(ID) ON DELETE CASCADE,
    FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE
);

create table TOWATCH_MOVIE_LIST (
    MID varchar2(5),
    ID varchar2(5),
    FOREIGN KEY (ID) REFERENCES IMDB_USER(ID) ON DELETE CASCADE,
    FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE
);

create table REVIEWED_SHOW_LIST (
    NAME varchar2(5),
    NETWORK varchar2(25),
    ID varchar2(5),
    FOREIGN KEY (NAME, NETWORK) REFERENCES SHOW(NAME, NETWORK) ON DELETE CASCADE,
    FOREIGN KEY (ID) REFERENCES IMDB_USER(ID) ON DELETE CASCADE
);

create table TOWATCH_SHOW_LIST (
    NAME varchar2(5),
    NETWORK varchar2(25),
    ID varchar2(5),
    FOREIGN KEY (NAME, NETWORK) REFERENCES SHOW(NAME, NETWORK) ON DELETE CASCADE,
    FOREIGN KEY (ID) REFERENCES IMDB_USER(ID) ON DELETE CASCADE
);

create table SEASONS (
    NAME varchar2(5),
    NETWORK varchar2(25),
    SEASON_NUMBER NUMBER,
    SDATE DATE,
    EDATE DATE,
    FOREIGN KEY (NAME, NETWORK) REFERENCES SHOW(NAME, NETWORK) ON DELETE CASCADE
);

create table EPISODES (
    NAME varchar2(5),
    NETWORK varchar2(25),
    EP_NUMBER NUMBER,
    TTILE varchar2(25),
    SEASON_NUMBER NUMBER,
    LENGTH varchar2(25),
    FOREIGN KEY (NAME, NETWORK) REFERENCES SHOW(NAME, NETWORK) ON DELETE CASCADE
);

create table SCENES (
    MID varchar2(5),
    Location varchar2(25),
    Scene_No number,
    FOREIGN KEY (MID) REFERENCES MOVIE(MID) ON DELETE CASCADE
);

create table AWARDS (
    INSTITUTION varchar2(50),
    YEAR NUMBER(5),
    CATEGORY varchar2(50),
    PRIMARY KEY (INSTITUTION, YEAR, CATEGORY)
);

