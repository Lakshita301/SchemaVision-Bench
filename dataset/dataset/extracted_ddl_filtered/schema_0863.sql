-- Source: https://github.com/duongdaiphuoc0501/duongdaiphuoc-A0321I1-module3/blob/f5756a55e55a23621d0ef58ee523510ece7d615c/casestudy/furama.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 7

create table position (
position_id int not null,
position_name varchar(45),
primary key(position_id)
)
insert into `furama`.`position`(`position_id`,`position_name`) values
(1, 'nhan vien'),
(2, 'le tan');

create table education_degree(
education_degree_id int not null,
education_degree_name varchar(45),
primary key(education_degree_id)
)
insert into `furama`.`education_degree`(`education_degree_id`,`education_degree_name`) values
(11, 'pho thong'),
(22, 'dai hoc');

create table division(
division_id int not null,
division_name varchar(45),
primary key(division_id)
)
insert into `furama`.`division`(`division_id`,`division_name`) values
(55, 'phuc vu'),
(66, 'quan ly');

create table role(
role_id int not null,
role_name varchar(45),
primary key(role_id)
)
insert into `furama`.`role`(`role_id`,`role_name`) values
(111, 'thuong'),
(112, 'vip');

create table user(
username varchar(255),
passwords varchar(255),
primary key(username)
)
insert into `furama`.`user`(`username`,`passwords`) values
('phuoc', '123456'),
('pro', '123456');

create table user_role(
role_id int not null,
username varchar(255),
foreign key(`role_id`) references `role`(`role_id`),
foreign key(`username`) references `user`(`username`)
)
insert into `furama`.`user_role`(`role_id`,`username`) values
(112, 'phuoc'),
(111, 'pro');

create table employee(
employee_id int not null,
employee_name varchar(45),
employee_birthday date,
employee_id_card varchar(45),
employee_salary double,
employee_phone varchar(45),
employee_email varchar(45),
employee_address varchar(45),
position_id int,
education_degree_id int,
division_id int,
username varchar(255),
foreign key(`position_id`) references `position`(`position_id`),
foreign key(`education_degree_id`) references `education_degree`(`education_degree_id`),
foreign key(`division_id`) references `division`(`division_id`),
foreign key(`username`) references `user_role`(`username`)
)
insert into `furama`.`employee`(`employee_id`,`employee_name`,`employee_birthday`,`employee_id_card`,`employee_salary`,`employee_phone`,`employee_email`,`employee_address`,`position_id`,`education_degree_id`,`division_id`,`username`) values
(1111, 'dai phuoc', '2001-01-05', '123412313', 20000, '081239123', 'a@gmail.com', 'quang nam', 1, 11, 55, 'phuoc')
create table customer_type(
customer_type_id int not null,
customer_type_name varchar(45),
primary key(customer_type_id)
)
insert into `furama`.`customer_type`(`customer_type_id`,`customer_type_name`) values
(2221, 'Gold'),
(2222, 'Diamond');

create table customer(
customer_id int not null,
customer_type_id int,
customer_name varchar(45),
customer_birthday date,
customer_gender bit,
customer_id_card varchar(45),
customer_phone varchar(45),
customer_email varchar(45),
customer_address varchar(45),
foreign key(`customer_type_id`) references `customer_type`(`customer_type_id`)
)
insert into `furama`.`customer`(`customer_id`,`customer_type_id`,`customer_name`,`customer_birthday`,`customer_gender`,`customer_id_card`,`customer_phone`,`customer_email`,`customer_address`) values
(3331, 2221, 'Nguyen Van A', '1999-02-10', true, '48371231', '0128472711', 'ac@gmail.com', 'Da Nang'),
(3332, 2222, 'Nguyen Thi B', '2000-03-21', false, '34812912', '0127712111', 'bc@gmail.com', 'Da Nang');

