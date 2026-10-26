-- Source: https://github.com/FaraonDaniel/University/blob/d70806668264e8b323c06b35f3bd49ef8000ef31/SQL/practica3/01-creaTablas.sql?raw=true
-- Tables detected: 7 | FK constraints: 10

CREATE TABLE pr3_regions
    ( region_id      NUMBER 
       CONSTRAINT  pr3_region_id_nn NOT NULL 
    , region_name    VARCHAR2(25) 
    );

CREATE TABLE pr3_countries 
    ( country_id      CHAR(2) 
       CONSTRAINT  pr3_country_id_nn NOT NULL 
    , country_name    VARCHAR2(40) 
    , region_id       NUMBER 
    , CONSTRAINT     pr3_country_c_id_pk 
        	     PRIMARY KEY (country_id) 
    ) 
    ORGANIZATION INDEX;

CREATE TABLE pr3_locations
    ( location_id    NUMBER(4)
    , street_address VARCHAR2(40)
    , postal_code    VARCHAR2(12)
    , city       VARCHAR2(30)
	CONSTRAINT     pr3_loc_city_nn  NOT NULL
    , state_province VARCHAR2(25)
    , country_id     CHAR(2)
    ) ;

CREATE TABLE pr3_departments
    ( department_id    NUMBER(4)
    , department_name  VARCHAR2(30)
	CONSTRAINT  pr3_dept_name_nn  NOT NULL
    , manager_id       NUMBER(6)
    , location_id      NUMBER(4)
    ) ;

CREATE TABLE pr3_jobs
    ( job_id         VARCHAR2(10)
    , job_title      VARCHAR2(35)
	CONSTRAINT     pr3_job_title_nn  NOT NULL
    , min_salary     NUMBER(6)
    , max_salary     NUMBER(6)
    ) ;

CREATE TABLE pr3_employees
    ( employee_id    NUMBER(6)
    , first_name     VARCHAR2(20)
    , last_name      VARCHAR2(25)
	 CONSTRAINT     pr3_emp_last_name_nn  NOT NULL
    , email          VARCHAR2(25)
	CONSTRAINT     pr3_emp_email_nn  NOT NULL
    , phone_number   VARCHAR2(20)
    , hire_date      DATE
	CONSTRAINT     pr3_emp_hire_date_nn  NOT NULL
    , job_id         VARCHAR2(10)
	CONSTRAINT     pr3_emp_job_nn  NOT NULL
    , salary         NUMBER(8,2)
    , commission_pct NUMBER(2,2)
    , manager_id     NUMBER(6)
    , department_id  NUMBER(4)
    , CONSTRAINT     pr3_emp_salary_min
                     CHECK (salary > 0) 
    , CONSTRAINT     pr3_emp_email_uk
                     UNIQUE (email)
    ) ;

CREATE TABLE pr3_job_history
    ( employee_id   NUMBER(6)
	 CONSTRAINT    pr3_jhist_employee_nn  NOT NULL
    , start_date    DATE
	CONSTRAINT    pr3_jhist_start_date_nn  NOT NULL
    , end_date      DATE
	CONSTRAINT    pr3_jhist_end_date_nn  NOT NULL
    , job_id        VARCHAR2(10)
	CONSTRAINT    pr3_jhist_job_nn  NOT NULL
    , department_id NUMBER(4)
    , CONSTRAINT    pr3_jhist_date_interval
                    CHECK (end_date > start_date)
    ) ;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE pr3_countries
ADD ( CONSTRAINT pr3_countr_reg_fk
        	 FOREIGN KEY (region_id)
          	  REFERENCES pr3_regions(region_id) 
    ) ;

ALTER TABLE pr3_locations
ADD ( CONSTRAINT pr3_loc_id_pk
       		 PRIMARY KEY (location_id)
    , CONSTRAINT pr3_loc_c_id_fk
       		 FOREIGN KEY (country_id)
        	  REFERENCES pr3_countries(country_id) 
    ) ;

ALTER TABLE pr3_departments
ADD ( CONSTRAINT pr3_dept_id_pk
       		 PRIMARY KEY (department_id)
    , CONSTRAINT pr3_dept_loc_fk
       		 FOREIGN KEY (location_id)
        	  REFERENCES pr3_locations (location_id)
     ) ;

ALTER TABLE pr3_employees
ADD ( CONSTRAINT     pr3_emp_emp_id_pk
                     PRIMARY KEY (employee_id)
    , CONSTRAINT     pr3_emp_dept_fk
                     FOREIGN KEY (department_id)
                      REFERENCES pr3_departments
    , CONSTRAINT     pr3_emp_job_fk
                     FOREIGN KEY (job_id)
                      REFERENCES pr3_jobs (job_id)
    , CONSTRAINT     pr3_emp_manager_fk
                     FOREIGN KEY (manager_id)
                      REFERENCES pr3_employees
    ) ;

ALTER TABLE pr3_departments
ADD ( CONSTRAINT pr3_dept_mgr_fk
      		 FOREIGN KEY (manager_id)
      		  REFERENCES pr3_employees (employee_id)
    ) ;

ALTER TABLE pr3_job_history
ADD ( CONSTRAINT pr3_jhist_emp_id_st_date_pk
      PRIMARY KEY (employee_id, start_date)
    , CONSTRAINT     pr3_jhist_job_fk
                     FOREIGN KEY (job_id)
                     REFERENCES pr3_jobs
    , CONSTRAINT     pr3_jhist_emp_fk
                     FOREIGN KEY (employee_id)
                     REFERENCES pr3_employees
    , CONSTRAINT     pr3_jhist_dept_fk
                     FOREIGN KEY (department_id)
                     REFERENCES pr3_departments
    ) ;

