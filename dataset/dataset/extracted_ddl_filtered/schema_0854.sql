-- Source: https://github.com/MihaylovBoyan/SoftUni/blob/dfe2a55ebf728f0e53be8928dbd79c7d284c716e/MY-SQL/Table-Relations-Exercise.sql?raw=true
-- Tables detected: 19 | FK/REFERENCES mentions: 28

create table passports
(
passport_id int primary key auto_increment,
passport_number varchar(20) unique
);

create table people
(
person_id int primary key auto_increment,
first_name varchar(30),
salary decimal(10,2),
passport_id int unique,
constraint fk_people_passports
foreign key (passport_id)
references passports(passport_id)
);

create table manufacturers
(
manufacturer_id int AUTO_INCREMENT primary key,
`name` varchar(20),
established_on date
);

create table models
(
model_id int primary key auto_increment,
`name` varchar(20),
manufacturer_id int 
);

create table students
(
student_id int primary key auto_increment,
`name` varchar(20)
);

create table exams
(
 exam_id int auto_increment primary key,
`name` varchar(20)
)auto_increment = 101;

create table students_exams
(
student_id int,
exam_id int,
constraint pk_students_exams
primary key (student_id, exam_id),
constraint fk_students_exams_students
foreign key (student_id)
references students(student_id),
constraint fk_students_exams_exams
foreign key (exam_id)
references exams(exam_id)
);

create table teachers
(
teacher_id int primary key auto_increment,
`name` varchar (20),
manager_id int
);

create table cities
(
city_id int primary key auto_increment,
`name` varchar(50)
);

create table customers
(
customer_id int primary key auto_increment,
`name` varchar(50),
birthday DATE,
city_id int,
CONSTRAINT fk_customers_cities
foreign key (city_id)
references cities(city_id)
);

create table orders
(
order_id int primary key auto_increment,
customer_id int,
constraint fk_orders_customers
foreign key (customer_id)
references customers(customer_id)
);

create table item_types
(
item_type_id int primary key auto_increment,
`name` varchar(50)
);

create table items
(
item_id int primary key auto_increment,
`name` varchar(50),
item_type_id int,
constraint fk_items_item_types
foreign key (item_type_id)
references item_types(item_type_id)
);

create table order_items
(
order_id int,
item_id int,
constraint pk_order_item
primary key (order_id, item_id),
constraint fk_order_items_orders
foreign key (order_id)
references orders(order_id),
constraint fk_order_items_items
foreign key (item_id) 
references items(item_id)
);

create table majors
(
major_id int primary key auto_increment,
`name` varchar(50)
);

create table students
(
student_id int primary key auto_increment,
student_number varchar(12),
student_name varchar(50),
major_id int,
constraint fk_students_majors
foreign key (major_id)
references majors(major_id)
);

create table payments
(
payment_id int primary key auto_increment,
payment_date date,
payment_amount decimal(8,2),
student_id int,
constraint fk_payments_students
foreign key (student_id)
references students(student_id)
);

create table subjects
(
subject_id int primary key auto_increment,
subject_name varchar(50)
);

create table agenda
(
student_id int,
subject_id int,
constraint pk_student_subject
primary key (student_id,subject_id),
constraint fk_student_students
foreign key (student_id)
references students(student_id),
constraint fk_subject_subjects
foreign key (subject_id)
references subjects(subject_id)
);

-- Foreign keys added via ALTER TABLE:
alter table models
add constraint `fk_models_manufacturers`
foreign key (`manufacturer_id`)
references manufacturers(manufacturer_id);

alter table teachers
add constraint `fk_teachers_managers`
foreign key (manager_id)
references teachers(teacher_id);

