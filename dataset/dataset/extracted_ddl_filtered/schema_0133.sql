-- Source: https://github.com/j0flintking02/final_project/blob/cce09b65353a5f6a0fea76244a4ee0c8a1f510e0/schema.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 16

create table customers(
    customerID int(11) AUTO_INCREMENT, 
    firstName varchar(255),
    lastName varchar(255), 
    cusPass varchar(255),
    primary key(customerID)
    );

create table manager(
    managerID int(11) AUTO_INCREMENT,
    firstName varchar(200),
    lastName varchar(200),
    managerEmail varchar(255),
    managerPassword varchar(255),
    primary key(managerID)
    );

create table events(
    eventID int(11) AUTO_INCREMENT,
    eventName varchar(200),
    eventDate date,
    eventDuration varchar(100),
    eventDescription varchar(250),
    venue varchar(200),
    price int(100),
    primary key(eventID)
);

create table customer_event(
    customerID int(11),
    eventID int(11),
    foreign key(customerID) references  customers(customerID) on delete cascade,
    foreign key(eventID) references events(eventID) on delete cascade
);

create table manager_event(
    managerID int(11) ,
    eventID int(11),
    foreign key(managerID) references   manager(managerID) on delete cascade,
    foreign key(eventID) references events(eventID) on delete cascade
);

create table ticket(
    ticketNO int(11) AUTO_INCREMENT,
    ticketID varchar(200) not null,
    ticketPrice varchar(200),
    primary key(ticketNO)
);

create table ticket_event(
    ticketNO int(11),
    eventID int(11),
    foreign key(ticketNO) references  ticket(ticketNO) on delete cascade,
    foreign key(eventID) references events(eventID) on delete cascade
);

CREATE TABLE ticket_customer(
    customerID int(11),
    ticketNO int(11),
    FOREIGN KEY(customerID) REFERENCES  customers(customerID) ON DELETE CASCADE,
    foreign key(ticketNO) references ticket(ticketNO) on delete cascade
);

