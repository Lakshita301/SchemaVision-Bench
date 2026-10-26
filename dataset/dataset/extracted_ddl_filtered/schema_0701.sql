-- Source: https://github.com/chase3718/sql/blob/318a278a3c4d95d16441e9e35433b86801c111f0/prs/prs.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 8

create table user (
	ID 					int 			primary key 	auto_increment,
    userName 			varchar(20) 	not null,
    password 			varchar(10) 	not null,
    firstName 			varChar(20) 	not null,
    lastName 			varChar(20) 	not null,
    phoneNumber 		varchar(12) 	not null,
    email 				varchar(75) 	not null,
    isReviewer 			tinyint(1) 		not null,
    isAdmin 			tinyint(1) 		not null,
    isActive 			tinyint(1) 		not null		default 1,
    dateCreated 		datetime 		not null		default current_timestamp,
    dateUpdated 		datetime 		not null		default current_timestamp,
    updatedByUser 		int 			not null		default 1,
    constraint uname unique (userName)
);

create table vendor (
	ID 					int 			primary key 	auto_increment,
    code 				varchar(10) 	not null,
    name 				varchar(255) 	not null,
    address 			varchar(255) 	not null,
    city 				varchar(255) 	not null,
    state	 			varchar(2) 		not null,
    zip 				varchar(5) 		not null,
    phoneNumber 		varchar(12) 	not null,
    email 				varchar(100) 	not null,
    isPreApproved 		tinyint(1) 		not null 		default 1,
    isActive 			tinyint(1) 		not null 		default 1,
    dateCreated 		datetime 		not null 		default current_timestamp,
    dateUpdated 		datetime 		not null 		default current_timestamp,
    updatedByUser 		int 			not null		default 1,
    constraint vcode unique (code)
);

create table purchaseRequest (
	ID 					int 			primary key 	auto_increment,
    userID 				int 			not null,
    description 		varchar(100) 	not null,
    justification 		varchar(255) 	not null,
    dateNeeded 			date 			not null,
    deliveryMode 		varchar(25) 	not null,
    status 				varchar(20) 	not null,
    total 				decimal(10,2) 	not null,
    submittedDate 		datetime 		not null 		default current_timestamp,
    reasonForRejection 	varchar(100),
    isActive 			tinyInt(1) 		not null		default 1,
    dateCreated 		datetime 		not null 		default current_timestamp,
    dateUpdated 		datetime 		not null 		default current_timestamp,
    updatedByUser 		int 			not null		default 1,
    foreign key (userID) references user(ID)
);

create table product (
	ID 					int 			primary key 	auto_increment,
    vendorID 			int 			not null,
    partNumber 			varchar(50) 	not null,
    name 				varchar(150) 	not null,
    price 				decimal(10,2) 	not null,
    unit 				varchar(255),
    photoPath 			varchar(255),
    isActive 			tinyint(1) 		not null		default 1,
    dateCreated 		datetime 		not null 		default current_timestamp,
    dateUpdated 		datetime 		not null 		default current_timestamp,
    updatedByUser 		int 			not null		default 1,
    foreign key (vendorID) references vendor(ID),
    constraint vendor unique (vendorID, partNumber)
);

create table purchaseRequestLineItem (
	ID 					int 			primary key 	auto_increment,
    purchaseRequestID 	int 			not null,
    productID 			int 			not null,
    quantity 			int 			not null,
    isActive 			tinyint(1)		not null 		default 1,
    dateCreated 		datetime 		not null 		default current_timestamp,
    dateUpdated 		datetime 		not null 		default current_timestamp,
    updatedByUser 		int 			not null		default 1,
    foreign key (purchaseRequestID) references purchaseRequest(ID),
    foreign key (productID) references product(ID),
    constraint purchaserequestlineitem unique (purchaseRequestID, productID)
);

