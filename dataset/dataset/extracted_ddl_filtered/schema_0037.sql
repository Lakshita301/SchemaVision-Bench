-- Source: https://github.com/Arturo0911/AndroidFlaskLinearRegression/blob/b95b0bddd1061379c68e5002a6da7bfb955f095a/FlaskMicroservice/mysql/index.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 4

CREATE TABLE Employee(
    id int(11) PRIMARY KEY auto_increment,
    credentials varchar(50) not null,
    names varchar(50) not null,
    last_names varchar(50) not null,
    phone_number varchar(50) not null,
    email_address varchar(50) not null,
    username varchar(50) not null,
    password varchar(100) not null
);

CREATE TABLE Department(
    id int(11) PRIMARY KEY auto_increment,
    department_name varchar(50) not null,
    id_boss_department int not null,
    boss_name varchar(50) not null,
    FOREIGN KEY (id_boss_department) REFERENCES Employee(id)
);

CREATE TABLE Product(
    product_id int(11) PRIMARY KEY auto_increment,
    product_name nvarchar(50) not null,
);

CREATE TABLE Sales(
    sales_id int(11) PRIMARY KEY auto_increment,
    product_id int not null,
    product_name varchar(50) not null,
    time_start datetime not null,
    time_end datetime not null,
    profit Decimal(13,4) not null,
    losses Decimal(13,4) not null,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)

);

