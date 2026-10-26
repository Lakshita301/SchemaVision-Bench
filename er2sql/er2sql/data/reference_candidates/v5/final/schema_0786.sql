-- Source: https://github.com/Nigil1999/Technical-Training/blob/61309d8b628604d532dd06072c9a13e1fd7565f8/MySQL%20and%20NoSQL/nigil_mysql_day2.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 20

create table regions(
   region_id int unsigned not null primary key, 
   region_name varchar(50)
);

create table countries(
    country_id int unsigned not null primary key, 
    country_name varchar(50), 
    region_id int unsigned not null
);

create table locations(
    location_id int unsigned not null auto_increment primary key, 
    street_address varchar(100), 
    postal_code varchar(6), 
    city varchar(20) not null, 
    state_province varchar(20), 
    country_id int not null
);

create table departments(
    department_id int unsigned not null primary key, 
    department_name varchar(50) not null, 
    manager_id int unsigned, 
    location_id int unsigned
);

create table jobs(
	job_id varchar(5) not null primary key, 
    job_title varchar(50) not null, 
    min_salary decimal unsigned, 
    max_salary decimal unsigned
);

create table employees(
    employee_id int unsigned not null primary key, 
    first_name varchar(50) not null, 
    last_name varchar(50) not null, 
    email varchar(50) not null, 
    phone_number varchar(20), 
    hire_date varchar(10) not null, 
    job_id varchar(5) not null, 
    salary decimal not null, 
    commission_pct decimal, 
    manager_id int unsigned, 
	department_id int unsigned
);

create table job_history(
    employee_id int unsigned not null, 
    start_date date not null primary key, 
    end_date date not null, 
    job_id varchar(5) not null, 
    department_id int unsigned not null
);

-- Foreign keys added via ALTER TABLE:
alter table countries add foreign key(region_id) references regions(region_id);

alter table locations add foreign key(country_id) references countries(country_id);

alter table departments add foreign key(location_id) references locations(location_id);

alter table employees add foreign key(job_id) references jobs(job_id), add foreign key(department_id) references departments(department_id), add foreign key(manager_id) references employees(employee_id);

alter table departments add foreign key(manager_id) references employees(employee_id);

alter table job_history add foreign key(employee_id) references employees(employee_id), add foreign key(job_id) references jobs(job_id), add foreign key(department_id) references departments(department_id);

