-- Source: https://github.com/NikitaParasToliya/NIKITA-PARAS-TOLIYA-DBMS-LAB/blob/f386bbcdc7818d9cf32cedaed28b48b021163ce8/DBMS-LAB2/DBMS-LAB2-BOOK%20DEALER.sql?raw=true
-- Tables detected: 5 | FK constraints: 2

CREATE TABLE AUTHOR(authorid int, aname varchar(15), city varchar(15), country varchar(15), primary key(authorid));

CREATE TABLE PUBLISHER(publisherid int, name varchar(15), city varchar(15), country varchar(15), primary key(publisherid));

CREATE TABLE CATEGORY(categoryid int, bdescription varchar(50), primary key(categoryid));

CREATE TABLE CATALOG(bookid int, title varchar(20), authorid int, publisherid int, categoryid int, cyear int, price int,
 primary key(authorid , publisherid,bookid), foreign key(authorid) references AUTHOR(authorid) on delete cascade,
 foreign key(publisherid) references PUBLISHER(publisherid) on delete cascade);

CREATE TABLE ORDERDETAILS(orderno int, bookid int, quantity int , primary key(orderno,bookid));

