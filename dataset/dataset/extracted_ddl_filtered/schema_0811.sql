-- Source: https://github.com/FirebirdSQL/firebird/blob/799bca3ca5f9eb604433addc0f2b7cb3b6c07275/examples/empbuild/intlddl.sql?raw=true
-- Tables detected: 10 | FK/REFERENCES mentions: 29

CREATE TABLE country
(
    country         COUNTRYNAME NOT NULL PRIMARY KEY,
    currency        VARCHAR(10) NOT NULL
);

CREATE TABLE job
(
    job_code            JOBCODE NOT NULL,
    job_grade           JOBGRADE NOT NULL,
    job_country         COUNTRYNAME NOT NULL,
    job_title           VARCHAR(25) NOT NULL,
    min_salary          SALARY NOT NULL,
    max_salary          SALARY NOT NULL,
    job_requirement     BLOB(400,1),
    language_req        VARCHAR(15) [5],

    PRIMARY KEY (job_code, job_grade, job_country),
    FOREIGN KEY (job_country) REFERENCES country (country),

    CHECK (min_salary < max_salary)
);

CREATE TABLE department
(
    dept_no         DEPTNO NOT NULL,
    department      VARCHAR(25) NOT NULL UNIQUE,
    head_dept       DEPTNO,
    mngr_no         EMPNO,
    budget          BUDGET,
    location        VARCHAR(15),
    phone_no        PHONENUMBER DEFAULT '555-1234',

    PRIMARY KEY (dept_no),
    FOREIGN KEY (head_dept) REFERENCES department (dept_no)
);

CREATE TABLE employee
(
    emp_no          EMPNO NOT NULL,
    first_name      FIRSTNAME NOT NULL,
    last_name       LASTNAME NOT NULL,
    phone_ext       VARCHAR(4),
    hire_date       TIMESTAMP DEFAULT 'NOW' NOT NULL,
    dept_no         DEPTNO NOT NULL,
    job_code        JOBCODE NOT NULL,
    job_grade       JOBGRADE NOT NULL,
    job_country     COUNTRYNAME NOT NULL,
    salary          SALARY NOT NULL,
    full_name       COMPUTED BY (last_name || ', ' || first_name),

    PRIMARY KEY (emp_no),
    FOREIGN KEY (dept_no) REFERENCES
            department (dept_no),
    FOREIGN KEY (job_code, job_grade, job_country) REFERENCES
            job (job_code, job_grade, job_country),

    CHECK ( salary >= (SELECT min_salary FROM job WHERE
                        job.job_code = employee.job_code AND
                        job.job_grade = employee.job_grade AND
                        job.job_country = employee.job_country) AND
            salary <= (SELECT max_salary FROM job WHERE
                        job.job_code = employee.job_code AND
                        job.job_grade = employee.job_grade AND
                        job.job_country = employee.job_country))
);

CREATE TABLE project
(
    proj_id         PROJNO NOT NULL,
    proj_name       VARCHAR(20) NOT NULL UNIQUE,
    proj_desc       BLOB(800,1),
    team_leader     EMPNO,
    product         PRODTYPE,

    PRIMARY KEY (proj_id),
    FOREIGN KEY (team_leader) REFERENCES employee (emp_no)
);

CREATE TABLE employee_project
(
    emp_no          EMPNO NOT NULL,
    proj_id         PROJNO NOT NULL,

    PRIMARY KEY (emp_no, proj_id),
    FOREIGN KEY (emp_no) REFERENCES employee (emp_no),
    FOREIGN KEY (proj_id) REFERENCES project (proj_id)
);

CREATE TABLE proj_dept_budget
(
    fiscal_year         INTEGER NOT NULL CHECK (FISCAL_YEAR >= 1993),
    proj_id             PROJNO NOT NULL,
    dept_no             DEPTNO NOT NULL,
    quart_head_cnt      INTEGER [4],
    projected_budget    BUDGET,

    PRIMARY KEY (fiscal_year, proj_id, dept_no),
    FOREIGN KEY (dept_no) REFERENCES department (dept_no),
    FOREIGN KEY (proj_id) REFERENCES project (proj_id)
);

CREATE TABLE salary_history
(
    emp_no              EMPNO NOT NULL,
    change_date         TIMESTAMP DEFAULT 'NOW' NOT NULL,
    updater_id          VARCHAR(20) NOT NULL,
    old_salary          SALARY NOT NULL,
    percent_change      DOUBLE PRECISION
                            DEFAULT 0
                            NOT NULL
                            CHECK (percent_change between -50 and 50),
    new_salary          COMPUTED BY
                            (old_salary + old_salary * percent_change / 100),

    PRIMARY KEY (emp_no, change_date, updater_id),
    FOREIGN KEY (emp_no) REFERENCES employee (emp_no)
);

CREATE TABLE customer
(
    cust_no             CUSTNO NOT NULL,
    customer            VARCHAR(35) NOT NULL COLLATE FR_FR,
    contact_first       FIRSTNAME,
    contact_last        LASTNAME,
    phone_no            PHONENUMBER,
    address_line1       ADDRESSLINE,
    address_line2       ADDRESSLINE,
    city                VARCHAR(25),
    state_province      VARCHAR(15),
    country             COUNTRYNAME,
    postal_code         VARCHAR(12),
    on_hold             CHAR
                            DEFAULT NULL
                            CHECK (on_hold IS NULL OR on_hold = '*'),
    PRIMARY KEY (cust_no),
    FOREIGN KEY (country) REFERENCES country (country)
);

CREATE TABLE sales
(
    po_number       PONUMBER NOT NULL,
    cust_no         CUSTNO NOT NULL,
    sales_rep       EMPNO,
    order_status    VARCHAR(7)
                        DEFAULT 'new'
                        NOT NULL
                        CHECK (order_status in
                            ('new', 'open', 'shipped', 'waiting')),
    order_date      TIMESTAMP
			DEFAULT 'NOW'
                        NOT NULL,
    ship_date       TIMESTAMP
                        CHECK (ship_date >= order_date OR ship_date IS NULL),
    date_needed     TIMESTAMP
                        CHECK (date_needed > order_date OR date_needed IS NULL),
    paid            CHAR
                        DEFAULT 'n'
                        CHECK (paid in ('y', 'n')),
    qty_ordered     INTEGER
                        DEFAULT 1
                        NOT NULL
                        CHECK (qty_ordered >= 1),
    total_value     DECIMAL(9,2)
                        NOT NULL
                        CHECK (total_value >= 0),
    discount        FLOAT
                        DEFAULT 0
                        NOT NULL
                        CHECK (discount >= 0 AND discount <= 1),
    item_type       PRODTYPE,
    aged            COMPUTED BY
                        (ship_date - order_date),

    PRIMARY KEY (po_number),
    FOREIGN KEY (cust_no) REFERENCES customer (cust_no),
    FOREIGN KEY (sales_rep) REFERENCES employee (emp_no),

    CHECK (NOT (order_status = 'shipped' AND ship_date IS NULL)),

    CHECK (NOT (order_status = 'shipped' AND
            EXISTS (SELECT on_hold FROM customer
                    WHERE customer.cust_no = sales.cust_no
                    AND customer.on_hold = '*')))
);

-- Foreign keys added via ALTER TABLE:
alter table'.
 */
CREATE TABLE department
(
    dept_no         DEPTNO NOT NULL,
    department      VARCHAR(25) NOT NULL UNIQUE,
    head_dept       DEPTNO,
    mngr_no         EMPNO,
    budget          BUDGET,
    location        VARCHAR(15),
    phone_no        PHONENUMBER DEFAULT '555-1234',

    PRIMARY KEY (dept_no),
    FOREIGN KEY (head_dept) REFERENCES department (dept_no)
);

ALTER TABLE department ADD FOREIGN KEY (mngr_no) REFERENCES employee (emp_no);

