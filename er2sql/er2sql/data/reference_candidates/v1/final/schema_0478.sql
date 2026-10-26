-- Source: https://github.com/AceOfHeart5/financialapp/blob/0d12c5d599e54b75c3d6bef3bc830788df6d5299/Setup%20Database%20Query.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 16

CREATE TABLE transaction (
	customer integer NOT NULL,
	id serial NOT NULL,
	date DATE NOT NULL,
	CONSTRAINT transaction_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE customer (
	id serial NOT NULL,
	name VARCHAR(255) NOT NULL,
	CONSTRAINT customer_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE product (
	id serial NOT NULL,
	name VARCHAR(255) NOT NULL,
	notes TEXT NOT NULL,
	cost DECIMAL NOT NULL,
	CONSTRAINT product_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE product_transaction (
	id serial NOT NULL,
	transaction integer NOT NULL,
	product integer NOT NULL,
	quantity DECIMAL NOT NULL,
	CONSTRAINT product_transaction_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE credit_card (
	id serial NOT NULL,
	number integer NOT NULL,
	security_code integer NOT NULL,
	name_on_card VARCHAR(255) NOT NULL,
	customer integer NOT NULL,
	CONSTRAINT credit_card_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE payment (
	id serial NOT NULL,
	amount DECIMAL NOT NULL,
	transaction integer NOT NULL,
	date DATE NOT NULL,
	CONSTRAINT payment_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

CREATE TABLE payment_credit_card (
	credit_card integer NOT NULL,
	payment integer NOT NULL,
	CONSTRAINT payment_credit_card_pk PRIMARY KEY (credit_card, payment)
) WITH (
  OIDS=FALSE
);

CREATE TABLE cash_payment (
	id serial NOT NULL,
	payment integer NOT NULL UNIQUE,
	CONSTRAINT cash_payment_pk PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE transaction ADD CONSTRAINT transaction_fk0 FOREIGN KEY (customer) REFERENCES customer(id);

ALTER TABLE product_transaction ADD CONSTRAINT product_transaction_fk0 FOREIGN KEY (transaction) REFERENCES transaction(id);

ALTER TABLE product_transaction ADD CONSTRAINT product_transaction_fk1 FOREIGN KEY (product) REFERENCES product(id);

ALTER TABLE credit_card ADD CONSTRAINT credit_card_fk0 FOREIGN KEY (customer) REFERENCES customer(id);

ALTER TABLE payment ADD CONSTRAINT payment_fk0 FOREIGN KEY (transaction) REFERENCES transaction(id);

ALTER TABLE payment_credit_card ADD CONSTRAINT payment_credit_card_fk0 FOREIGN KEY (credit_card) REFERENCES credit_card(id);

ALTER TABLE payment_credit_card ADD CONSTRAINT payment_credit_card_fk1 FOREIGN KEY (payment) REFERENCES payment(id);

ALTER TABLE cash_payment ADD CONSTRAINT cash_payment_fk0 FOREIGN KEY (payment) REFERENCES payment(id);

