-- Source: https://github.com/cspark0/jpetstore/blob/e0dee1131ef68b5300f8399995266461fd4e21c1/src/main/resources/db/oracle/jpetstore-oracle-schema-xa2.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

create table orders (
      orderid int not null,
      userid varchar(80) not null,
      orderdate date not null,
      shipaddr1 varchar(80) not null,
      shipaddr2 varchar(80) null,
      shipcity varchar(80) not null,
      shipstate varchar(80) not null,
      shipzip varchar(20) not null,
      shipcountry varchar(20) not null,
      billaddr1 varchar(80) not null,
      billaddr2 varchar(80)  null,
      billcity varchar(80) not null,
      billstate varchar(80) not null,
      billzip varchar(20) not null,
      billcountry varchar(20) not null,
      courier varchar(80) not null,
      totalprice number(10,2) not null,
      billtofirstname varchar(80) not null,
      billtolastname varchar(80) not null,
      shiptofirstname varchar(80) not null,
      shiptolastname varchar(80) not null,
      creditcard varchar(80) not null,
      exprdate varchar(7) not null,
      cardtype varchar(80) not null,
      locale varchar(80) not null,
      constraint pk_orders primary key (orderid)
);

create table orderstatus (
      orderid int not null,
      linenum int not null,
      timestamp date not null,
      status varchar(2) not null,
      constraint pk_orderstatus primary key (orderid, linenum),
      constraint fk_orderstatus_1 foreign key (orderid)
	references orders (orderid)
);

create table lineitem (
      orderid int not null,
      linenum int not null,
      itemid varchar(10) not null,
      quantity int not null,
      unitprice number(10,2) not null,
      constraint pk_lineitem primary key (orderid, linenum),
      constraint fk_lineitem_1 foreign key (orderid)
	references orders (orderid)
);

