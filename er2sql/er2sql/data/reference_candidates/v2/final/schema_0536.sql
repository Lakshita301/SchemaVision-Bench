-- Source: https://github.com/upadhyatejas/Database-Lab-Finals/blob/394bea25e660225894bb1fdd8496db9ecd3beac4/9a.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 8

Create table CUSTOMER(
Cno INT,
Cname VARCHAR(50),
Ccity VARCHAR(50),
Primary key(Cno)
);

Create table ORDER1(
Ono INT,
Odate DATE,
Ocno INT,
Oamt INT, 
Primary key(Ono),
Foreign Key(Ocno) references CUSTOMER(Cno) on delete cascade
);

Create table ITEM(
Ino INT ,
Uprice INT, 
Primary key(Ino)
);

Create table ORDER_ITEM(
Iono INT,
Oino  INT,
Qty INT, 
Primary key(Iono,Oino),
Foreign Key(Iono) references ORDER1(Ono) on delete cascade, 
Foreign Key(Oino) references ITEM(Ino) on delete cascade
);

Create table SHIPMENT(
Sono INT,
Shipdate DATE,
Primary key(Sono), 
Foreign Key(Sono) references ORDER1(Ono) on delete cascade, 
);

