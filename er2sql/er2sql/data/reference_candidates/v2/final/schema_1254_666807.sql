-- Source: https://github.com/knaevKMK/DATA_BASE/blob/86a181e32fc201915410d94ca0963325015f6ff3/MY%20SQL/New%20folder/SoftUni-DatabaseBasics-MySQL/11.%20Exam%20Preparation%203/Bank%20Skeleton.sql?raw=true
-- Tables detected: 8 | FK constraints: 9

CREATE TABLE cities(
city_id INT,
city_name VARCHAR(50) NOT NULL,
CONSTRAINT pk_cities PRIMARY KEY(city_id)
);

CREATE TABLE customers(
customer_id INT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR(30) NOT NULL,
gender CHAR(1) NOT NULL,
date_of_birth DATE NOT NULL,
height FLOAT,
city_id INT,
CONSTRAINT pk_customers PRIMARY KEY(customer_id),
CONSTRAINT fk_customers_cities FOREIGN KEY(city_id) REFERENCES cities(city_id)
);

CREATE TABLE accounts( 
account_id INT,
account_number CHAR(12) NOT NULL,
start_date DATE NOT NULL,
customer_id INT NOT NULL,
CONSTRAINT pk_accounts PRIMARY KEY(account_id),
CONSTRAINT fk_accounts_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE loans( 
loan_id INT AUTO_INCREMENT,
start_date DATE NOT NULL,
amount DECIMAL (18,2) NOT NULL,
interest DECIMAL(4,2) NOT NULL,
expiration_date DATE NULL,
customer_id INT NOT NULL,
CONSTRAINT pk_Loan PRIMARY KEY(loan_id),
CONSTRAINT fk_loans_customers FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE branches(
branch_id INT,
name VARCHAR(50),
city_id INT NOT NULL,
CONSTRAINT pk_branches PRIMARY KEY(branch_id),
CONSTRAINT fk_branches_cities FOREIGN KEY(city_id) REFERENCES cities(city_id)
);

CREATE TABLE employees(
employee_id INT,
first_name VARCHAR(50) NOT NULL,
hire_date DATE NOT NULL,
salary DECIMAL(8,2),
branch_id INT,
CONSTRAINT pk_employees PRIMARY KEY(employee_id),
CONSTRAINT fk_employees_branches FOREIGN KEY(branch_id) REFERENCES branches(branch_id)
);

CREATE TABLE employees_loans(
employee_id INT,
loan_id INT,
CONSTRAINT pk_employees_loans PRIMARY KEY(employee_id, loan_id),
CONSTRAINT fk_employees_loans_customers_employees FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
CONSTRAINT fk_employees_loans_loans FOREIGN KEY(loan_id) REFERENCES loans(loan_id)
);

CREATE TABLE employees_accounts(
employee_id INT,
account_id INT,
CONSTRAINT pk_employees_accounts PRIMARY KEY(employee_id, account_id),
CONSTRAINT fk_employees_accounts_employees FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
CONSTRAINT fk_employees_accounts_Account FOREIGN KEY(account_id) REFERENCES accounts(account_id)
);

