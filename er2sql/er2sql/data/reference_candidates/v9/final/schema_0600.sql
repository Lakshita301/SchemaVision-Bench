-- Source: https://github.com/quentintheastronaut/HCMUT_DBS-Lab-s-Exercises/blob/91b0102c63788e4cce607c4597edf739ab42cc97/COMPANY_DEMO.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 14
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);
CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE
);
CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(40),
    branch_id INT
);
CREATE TABLE works_with (
    emp_id INT,
    client_id INT,
    total_sales INT,
    PRIMARY KEY(emp_id, client_id)
);
CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(40),
    supply_type VARCHAR(40),
    PRIMARY KEY(branch_id, supplier_name)
);
CREATE TABLE trigger_test (
    message VARCHAR(100)
);
ALTER TABLE employee ADD FOREIGN KEY(branch_id)
REFERENCES branch(branch_id)
ON DELETE NO ACTION;
ALTER TABLE employee ADD FOREIGN KEY(super_id)
REFERENCES employee(emp_id)
ON DELETE NO ACTION;
ALTER TABLE branch ADD FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL;
ALTER TABLE client ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;
ALTER TABLE works_with ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE;
ALTER TABLE works_with ADD FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE;
ALTER TABLE branch_supplier ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE;
