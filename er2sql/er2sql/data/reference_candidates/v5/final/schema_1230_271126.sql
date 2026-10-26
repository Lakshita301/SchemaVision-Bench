-- Source: https://github.com/cohenyitz/te-repo/blob/5b3e6fe3dfef7d6d42c413296b159cdceaaaed06/yitzhakcohen-java/Cohort-Refresh/module-2/05_Database_Design/exercise-final/postgres/animal-health-invoice.sql?raw=true
-- Tables detected: 4 | FK constraints: 3

CREATE TABLE invoice
(
	invoice_no serial,
	invoice_date timestamp not null,
	customer_no int,

	primary key (invoice_no)
);

CREATE TABLE invoice_pet
(
	invoice_no int,
	pet_id int,
	pet_procedure varchar(200) not null,
	amount money not null,

	primary key (invoice_no, pet_id)
);

CREATE TABLE pet
(
	pet_id serial,
	pet_name varchar(200) not null,

	primary key (pet_id)
);

CREATE TABLE customer
(
	customer_no serial,
	customer_name varchar(200) not null,
	customer_street varchar(200) not null,
	customer_city varchar(200) not null,
	customer_postalcode char(10) not null,

	primary key (customer_no)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE invoice 
ADD FOREIGN KEY (customer_no) REFERENCES customer (customer_no);

ALTER TABLE invoice_pet
ADD FOREIGN KEY (invoice_no) REFERENCES invoice(invoice_no);

ALTER TABLE invoice_pet
ADD FOREIGN KEY (pet_id) REFERENCES pet(pet_id);

