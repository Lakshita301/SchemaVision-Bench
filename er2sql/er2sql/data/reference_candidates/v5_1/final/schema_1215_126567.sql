-- Source: https://github.com/carlosbelen/Project_wk4_Car-Dealership-ERD---Database-Creation-Project--Group-project/blob/454717626e7c34c489f3b06e4128a43079df58b0/sql_car_deal_db.sql?raw=true
-- Tables detected: 8 | FK constraints: 8

CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	billing_info VARCHAR(150)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE part(
	upc SERIAL PRIMARY KEY, 
	upc_name VARCHAR(100)
);

CREATE TABLE history(
	trans_id SERIAL PRIMARY KEY, 
	service_type VARCHAR(100),
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE service(
	ticket_id SERIAL PRIMARY KEY, 
	car_id INTEGER,
	mechanic_id INTEGER NOT NULL,
	upc INTEGER NOT NULL,
	customer_id INTEGER NOT NULL,
	trans_id INTEGER NOT NULL,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(upc) REFERENCES part(upc),
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),	
	FOREIGN KEY(trans_id) REFERENCES history(trans_id)
);

CREATE TABLE sale(
	sale_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE invoice(
	invoice_num SERIAL PRIMARY KEY,
	sale_id INTEGER NOT NULL,
	FOREIGN KEY (sale_id) REFERENCES sale(sale_id)
);

CREATE TABLE car(
	vin_number SERIAL PRIMARY KEY,
	make VARCHAR(100),
	model VARCHAR(100),
	car_year INTEGER, 
	customer_id INTEGER NOT NULL,
	sale_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY (sale_id) REFERENCES sale(sale_id)
);

