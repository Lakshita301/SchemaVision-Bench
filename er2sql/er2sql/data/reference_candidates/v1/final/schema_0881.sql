-- Source: https://github.com/wochnas07/Tech-Elevator-assignments/blob/d4046fad2f0fbd446a68220f8f68ab65cc85e1f3/module-2/15_Module_2_API_Review-Sammi/student-lecture/java/database/apireview.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 7

CREATE TABLE employee (
	employee_id integer NOT NULL DEFAULT nextval('seq_employee_id'),
	department_id integer,
	first_name varchar(20) NOT NULL,
	last_name varchar(30) NOT NULL,
	birth_date date NOT NULL,
	gender char(1) NOT NULL,
	hire_date date NOT NULL,
	CONSTRAINT pk_employee_employee_id PRIMARY KEY (employee_id),
	CONSTRAINT ck_gender CHECK (gender IN ('M', 'F'))
);

CREATE TABLE department (
	department_id integer NOT NULL DEFAULT nextval('seq_department_id'),
	name varchar(40) UNIQUE NOT NULL,
	CONSTRAINT pk_department_department_id PRIMARY KEY (department_id)
);

CREATE TABLE project (
	project_id integer NOT NULL DEFAULT nextval('seq_project_id'),
	name varchar(40) UNIQUE NOT NULL,
	from_date date,
	to_date date,
	CONSTRAINT pk_project_project_id PRIMARY KEY (project_id)
);

CREATE TABLE project_employee (
	project_id integer NOT NULL,
	employee_id integer NOT NULL,
	CONSTRAINT pk_project_employee_project_project_id_employee_id PRIMARY KEY (project_id, employee_id)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE employee ADD FOREIGN KEY (department_id) REFERENCES department(department_id);

ALTER TABLE project_employee ADD FOREIGN KEY (project_id) REFERENCES project(project_id);

ALTER TABLE project_employee ADD FOREIGN KEY (employee_id) REFERENCES employee(employee_id);

