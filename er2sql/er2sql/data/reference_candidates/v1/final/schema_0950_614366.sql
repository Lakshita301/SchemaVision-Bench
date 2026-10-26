-- Source: https://github.com/dong7385/C1120G1_NguyenNgocDong/blob/960d299124e96e09a55f0b83f88c47c030897871/module_3/test_module_3.1/test/jsp_servlet.sql?raw=true
-- Tables detected: 15 | FK constraints: 13
create table "position" (
    position_id int auto_increment primary key,
    position_name varchar(45)
);

create table education_degree(
    education_degree_id int auto_increment primary key,
    education_degree_name varchar(45)
);

create table division (
    division_id int auto_increment primary key,
    division_name varchar(45)
);

create table  "role" (
    role_id int auto_increment primary key,
    role_name varchar(45)
);

create table "user"(
    username varchar (255) primary key,
    userpassword varchar(255)
);

create table user_role (
    role_id int,
    foreign key (role_id) references "role"(role_id) on update cascade on delete cascade,
    username varchar (255),
    foreign key (username) references "user"(username) on update cascade on delete cascade
);

create table attach_service(
    attach_service_id int auto_increment primary key,
    attach_service_name varchar(45) not null,
    attach_service_cost DOUBLE PRECISION not null,
    attach_service_unit int not null,
    attach_service_status varchar(45)
);

create table customer_type(
    customer_type_id int primary key auto_increment,
    customer_type_name varchar(45)
);

create table customer(
    customer_id varchar(45)  primary key,
    customer_type_id int,
    foreign key (customer_type_id) references customer_type(customer_type_id) on update cascade on delete cascade,
    customer_name varchar (255) not null,
    customer_birthday date not null,
    customer_gender bit (1) not null,
    customer_id_card varchar (45) not null,
    customer_phone varchar(45) not null,
    customer_email varchar (45),
    customer_address varchar (45)
);

create table employee (
    employee_id int primary key auto_increment,
    employee_name varchar (45) not null,
    employee_birthday date not null,
    employee_id_card varchar (45) not null,
    employee_salary DOUBLE PRECISION not null,
    employee_phone varchar (45) not null,
    employee_email varchar(45),
    employee_address varchar(45),
    position_id int not null,
    foreign key (position_id) references"position"(position_id) on update cascade on delete cascade,
    education_degree_id int not null,
    foreign key (education_degree_id) references education_degree(education_degree_id) on update cascade on delete cascade,
    division_id int not null,
    foreign key (division_id) references division(division_id) on update cascade on delete cascade,
    username varchar(255),
    foreign key (username) references "user"(username) on update cascade on delete cascade
);

create table service_type(
    service_type_id int auto_increment primary key,
    service_type_name varchar (45)
);

create table rent_type(
    rent_type_id int auto_increment primary key,
    rent_type_name varchar(45),
    rent_type_cost DOUBLE PRECISION
);

create table service(
    service_id varchar(45) primary key,
    service_name varchar(45) not null,
    service_area int,
    service_cost DOUBLE PRECISION not null,
    service_max_people int,
    rent_type_id int not null,
    foreign key (rent_type_id) references rent_type(rent_type_id) on update cascade on delete cascade,
    service_type_id int not null,
    foreign key (service_type_id) references service_type(service_type_id) on update cascade on delete cascade,
    standard_room varchar(45),
    description_other_convenience varchar (45),
    pool_area DOUBLE PRECISION,
    number_of_floors int
);

create table contract(
    contract_id int primary key auto_increment,
    contract_start_day TIMESTAMP not null,
    contract_end_day TIMESTAMP not null,
    contract_deposit DOUBLE PRECISION not null,
    contract_total_money DOUBLE PRECISION not null,
    employee_id int not null,
    foreign key (employee_id) references employee(employee_id) on update cascade on delete cascade,
    customer_id varchar(45) not null,
    foreign key (customer_id) references customer(customer_id) on update cascade on delete cascade,
    service_id varchar(45) not null,
    foreign key (service_id) references service(service_id) on update cascade on delete cascade
);

create table contract_detail(
    contract_detail_id int auto_increment primary key,
    contract_id int,
    foreign key (contract_id) references contract(contract_id) on update cascade on delete cascade,
    attach_service_id int,
    foreign key (attach_service_id) references attach_service(attach_service_id)  on update cascade on delete cascade,
    quantity int not null
);
