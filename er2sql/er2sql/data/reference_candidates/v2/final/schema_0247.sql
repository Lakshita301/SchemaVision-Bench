-- Source: https://github.com/BG-IT-Edu/School-Programming/blob/71ceb36ded941ce84bfde6c6b54d62ee476f574f/Courses/Applied-Programmer/Databases-and-SQL/2.%D0%9C%D0%BE%D0%B4%D0%B5%D0%BB%D0%B8%D1%80%D0%B0%D0%BD%D0%B5-%D0%BD%D0%B0-%D1%80%D0%B5%D0%BB%D0%B0%D1%86%D0%B8%D0%BE%D0%BD%D0%BD%D0%B8-%D0%B1%D0%B0%D0%B7%D0%B8-%D0%BE%D1%82-%D0%B4%D0%B0%D0%BD%D0%BD%D0%B8/06.%20DB-Basics-MySQL-Table-Relations-Exercises.sql?raw=true
-- Tables detected: 19 | FK/REFERENCES mentions: 29

CREATE TABLE passports(
passport_id INT PRIMARY KEY,
passport_number VARCHAR(50)
);

CREATE TABLE persons(
person_id INT PRIMARY KEY,
first_name VARCHAR(50),
salary DECIMAL(8,2),
passport_id INT UNIQUE,
CONSTRAINT fk_persons_passports FOREIGN KEY(passport_id) REFERENCES passports(passport_id)
);

CREATE TABLE manufacturers(
manufacturer_id INT PRIMARY KEY,
name VARCHAR(50),
established_on DATE);

CREATE TABLE models(
model_id INT PRIMARY KEY,
name VARCHAR(50),
manufacturer_id INT,
CONSTRAINT fk_models_manufacturer FOREIGN KEY(manufacturer_id) REFERENCES manufacturers(manufacturer_id)
);

CREATE TABLE students(
student_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE exams(
exam_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE students_exams(
student_id INT,
exam_id INT,
CONSTRAINT pk_students_exams PRIMARY KEY(student_id, exam_id),
CONSTRAINT fk_students_exams_students FOREIGN KEY(student_id) REFERENCES students(student_id),
CONSTRAINT fk_students_exams_exams FOREIGN KEY(exam_id) REFERENCES exams(exam_id)
);

CREATE TABLE teachers(
teacher_id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT);

CREATE TABLE cities(
	city_id int,
	name varchar(50),
 CONSTRAINT pk_cities PRIMARY KEY (city_id)
 );

CREATE TABLE customers(
	customer_id int,
	name varchar(50),
	birthday date,
	city_id int,
 CONSTRAINT pk_customers PRIMARY KEY(customer_id)
 );

CREATE TABLE items(
	item_id int,
	name varchar(50),
	item_type_id int,
 CONSTRAINT pk_items PRIMARY KEY (item_id)
);

CREATE TABLE item_types(
	item_type_id int,
	name varchar(50),
 CONSTRAINT pk_item_types PRIMARY KEY (item_type_id)
 );

CREATE TABLE order_items(
	order_id int,
	item_id int,
 CONSTRAINT pk_order_items PRIMARY KEY (order_id,item_id)
 );

CREATE TABLE orders(
	order_id int,
	customer_id int,
 CONSTRAINT pk_orders PRIMARY KEY (order_id)
 );

CREATE TABLE majors(
major_id INT PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE students(
student_id INT PRIMARY KEY,
student_number VARCHAR(12),
student_name VARCHAR(50),
major_id INT,
CONSTRAINT fk_students_majors FOREIGN KEY(major_id) REFERENCES majors(major_id)
);

CREATE TABLE payments(
payment_id INT PRIMARY KEY, 
payment_date DATE,
payment_amount DECIMAL(8,2),
student_id INT,
CONSTRAINT fk_payments_students FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE subjects(
subject_id INT PRIMARY KEY,
subject_name VARCHAR(50)
);

CREATE TABLE agenda(
student_id INT,
subject_id INT,
CONSTRAINT pk_agenda PRIMARY KEY(student_id, subject_id),
CONSTRAINT fk_agenda_subjects FOREIGN KEY(subject_id) REFERENCES subjects(subject_id),
CONSTRAINT fk_agenda_students FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE teachers
ADD CONSTRAINT fk_teachers_teachers FOREIGN KEY(manager_id) REFERENCES teachers(teacher_id);

ALTER TABLE customers ADD CONSTRAINT fk_customers_cities FOREIGN KEY(city_id)
REFERENCES cities (city_id);

ALTER TABLE items ADD CONSTRAINT fk_items_item_types FOREIGN KEY(item_type_id)
REFERENCES item_types (item_type_id);

ALTER TABLE order_items ADD CONSTRAINT fk_order_items_items FOREIGN KEY(item_id)
REFERENCES items (item_id);

ALTER TABLE order_items  ADD CONSTRAINT fk_order_items_orders FOREIGN KEY(order_id)
REFERENCES orders (order_id);

ALTER TABLE orders ADD CONSTRAINT fk_orders_customers FOREIGN KEY(customer_id)
REFERENCES customers (customer_id);

