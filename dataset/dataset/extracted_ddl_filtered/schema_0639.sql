-- Source: https://github.com/Quan2812/HighLand/blob/dc2213ab7b982a0cd3d13a36b12e3014f3797a0f/HighLand.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 14

create table Staffs(
	staff_id int auto_increment primary key,
    user_account varchar(100) not null unique,
    user_password varchar(200) not null,
    staff_name varchar(100) not null,
    staff_address varchar(200),
    staff_age int,
    staff_phone int,
    role int,
    is_active bit default 1
);

create table Cards(
	card_id int auto_increment primary key,
    stat int
);

create table Orders(
	order_id int auto_increment primary key,
    order_date datetime,
    stat int,
    total_price float,
    staff_id int,
    card_id int, 
    
    constraint fk_staff 
    foreign key (staff_id) 
    references Staffs(staff_id),
    
    constraint fk_card
    foreign key (card_id)
    references Cards(card_id)
);

create table Drinks(
	drink_id int auto_increment primary key,
    drink_name nvarchar(200) not null,
    is_active bool
);

create table Sizes(
	size_id int auto_increment primary key,
    size_name nvarchar(50) not null
);

create table Drink_Sizes(
	drink_id int not null,
    size_id int not null,
	price float not null,
    primary key (drink_id,size_id),
    constraint fk_DrinkSizes_Sizes 
    foreign key(size_id) 
    references Sizes(size_id),
    
    constraint fk_DrinkSizes_Drinks 
    foreign key(drink_id) 
    references Drinks(drink_id) 
);

create table Order_details(
	order_id int,
    drink_id int,
    size_id int,
    quantity int,
    primary key (order_id,size_id,drink_id),
    constraint fk_Orderdetails_Orders
    foreign key (order_id)
    references Orders(order_id),
    
    constraint fk_Orderdetails_Drinks
    foreign key (drink_id)
    references Drinks(drink_id),
    
    constraint fk_Orderdetails_Sizes
    foreign key (size_id)
    references Sizes(size_id)
);

