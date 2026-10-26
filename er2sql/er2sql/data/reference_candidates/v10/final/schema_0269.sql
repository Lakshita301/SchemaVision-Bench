-- Source: https://github.com/srahim12/Java/blob/b5d35ebc209cbd956a3185b07987621328bcef85/Java_Web_Applications/Hotel_Reservation/Hulton_Create_Statements.sql?raw=true
-- Tables detected: 15 | FK/REFERENCES mentions: 46

create table HOTEL(HotelID int not null,Street varchar(100) not null,Country varchar(30) not null,State varchar(40),ZIP varchar(10),primary key(HotelID));

create table ROOM(HotelID int not null,RoomNo int not null,Rtype varchar(30) not null,Price int not null,Description varchar(300),Floor int not null,Capacity int not null,primary key(HotelID,RoomNo), foreign key(HotelID) references HOTEL(HotelID) on delete cascade on update cascade);

create table DISCOUNTED_ROOM(HotelID int not null,RoomNo int not null,Discount int not null,StartDate date not null,EndDate date not null,primary key(HotelID,RoomNo),foreign key(HotelID,RoomNo) references ROOM(HotelID,RoomNo)on delete cascade on update cascade);

create table SERVICE(HotelID int not null,Stype varchar(40) not null,Sprice int not null,primary key(HotelID,Stype), foreign key(HotelID) references HOTEL(HotelID)on delete cascade on update cascade);

create table BREAKFAST(HotelID int not null,Btype varchar(40) not null,Bprice int not null,Description varchar(300),primary key(HotelID,Btype),foreign key(HotelID) references HOTEL(HotelID)on delete cascade on update cascade);

create table CUSTOMER(CID int not null,Name varchar(30) not null,Address varchar(100),Phone_No varchar(15) not null,Email varchar(30) not null,primary key(CID));

create table CREDIT_CARD(Cnumber varchar(20) not null,Ctype varchar(20) not null,Baddress varchar(100) not null,Code varchar(5) not null,ExpDate date not null,Name varchar(30) not null,primary key(Cnumber));

create table RESERVATION(InvoiceNo int not null,CID int not null,Cnumber varchar(20) not null,Rdate date not null,primary key(InvoiceNo),foreign key(CID) references CUSTOMER(CID) on delete cascade on update cascade,foreign key(Cnumber) references CREDIT_CARD(Cnumber) on delete cascade on update cascade);

create table ROOM_RESERVATION(InvoiceNo int not null,HotelID int not null,RoomNo int not null,CheckInDate date not null,CheckOutDate date not null,primary key(HotelID,RoomNo,CheckInDate),foreign key(HotelID,RoomNo) references ROOM(HotelID,RoomNo) on delete cascade on update cascade, foreign key(InvoiceNo) references RESERVATION(InvoiceNo) on delete cascade on update cascade);

create table BREAKFAST_RESERVATION(Btype varchar(40) not null, HotelID int not null,RoomNo int not null,CheckInDate date not null,NoOfOrders int not null,primary key (Btype,HotelID,RoomNo,CheckInDate),foreign key(HotelID,Btype) references BREAKFAST(HotelID,Btype) on delete cascade on update cascade,foreign key(HotelID,RoomNo,CheckInDate) references ROOM_RESERVATION(HotelID,RoomNo,CheckInDate)on delete cascade on update cascade);

create table SERVICE_RESERVATION(Stype varchar(40) not null, HotelID int not null,RoomNo int not null,CheckInDate date not null,primary key (Stype,HotelID,RoomNo,CheckInDate),foreign key(HotelID,Stype) references SERVICE(HotelID,Stype) on delete cascade on update cascade,foreign key(HotelID,RoomNo,CheckInDate)references ROOM_RESERVATION(HotelID,RoomNo,CheckInDate)on delete cascade on update cascade);

create table ROOM_REVIEW(RID int not null,HotelID int not null,RoomNo int not null,CheckInDate date not null,CID int not null,Rating int not null check(Rating>=1 AND Rating <=10),Text varchar(500),primary key(RID),foreign key(CID) references CUSTOMER(CID)on delete cascade on update cascade,foreign key(HotelID,RoomNo) references ROOM(HotelID,RoomNo)on delete cascade on update cascade,foreign key (HotelID,RoomNo,CheckInDate) references ROOM_RESERVATION(HotelID,RoomNo,CheckInDate)on delete cascade on update cascade);

create table SERVICE_REVIEW(RID int not null,HotelID int not null,RoomNo int not null,CheckInDate date not null,Stype varchar(40) not null,CID int not null,Rating int not null check(Rating >= 1 AND Rating <=10),Text varchar(500),primary key(RID),foreign key(CID) references CUSTOMER(CID)on delete cascade on update cascade,foreign key(HotelID,Stype) references SERVICE(HotelID,Stype)on delete cascade on update cascade,foreign key(HotelID,RoomNo,CheckInDate) references SERVICE_RESERVATION(HotelID,RoomNo,CheckInDate)on delete cascade on update cascade);

create table BREAKFAST_REVIEW(RID int not null,HotelID int not null,RoomNo int not null,CheckInDate date not null,Btype varchar(40) not null,CID int not null,Rating int not null check(Rating >= 1 AND Rating <=10),Text varchar(500),primary key(RID),foreign key(CID) references CUSTOMER(CID)on delete cascade on update cascade,foreign key(HotelID,Btype) references BREAKFAST(HotelID,Btype)on delete cascade on update cascade,foreign key (HotelID,RoomNo,CheckInDate) references BREAKFAST_RESERVATION(HotelID,RoomNo,CheckInDate)on delete cascade on update cascade);

create table TOTAL_SPENT(CID int not null, InvoiceNo int not null, MoneySpent int not null, RDate date not null, primary key(CID,InvoiceNo), foreign key(CID) references CUSTOMER(CID) on delete cascade on update cascade, foreign key(InvoiceNo) references RESERVATION(InvoiceNo) on delete cascade on update cascade);

