-- Source: https://github.com/raymondyou97/NEU_Coursework/blob/2595a059c6f44829a7fea093223469265f77dadc/CS3200/hw2/create_databases(1).sql?raw=true
-- Tables detected: 22 | FK/REFERENCES mentions: 18

CREATE TABLE general_ledger_accounts
(
  account_number        INT            PRIMARY KEY,
  account_description   VARCHAR(50)    UNIQUE
);

CREATE TABLE terms
(
  terms_id              INT            PRIMARY KEY   AUTO_INCREMENT,
  terms_description     VARCHAR(50)    NOT NULL,
  terms_due_days        INT            NOT NULL
);

CREATE TABLE vendors
(
  vendor_id                     INT            PRIMARY KEY   AUTO_INCREMENT,
  vendor_name                   VARCHAR(50)    NOT NULL      UNIQUE,
  vendor_address1               VARCHAR(50),
  vendor_address2               VARCHAR(50),
  vendor_city                   VARCHAR(50)    NOT NULL,
  vendor_state                  CHAR(2)        NOT NULL,
  vendor_zip_code               VARCHAR(20)    NOT NULL,
  vendor_phone                  VARCHAR(50),
  vendor_contact_last_name      VARCHAR(50),
  vendor_contact_first_name     VARCHAR(50),
  default_terms_id              INT            NOT NULL,
  default_account_number        INT            NOT NULL,
  CONSTRAINT vendors_fk_terms
    FOREIGN KEY (default_terms_id)
    REFERENCES terms (terms_id),
  CONSTRAINT vendors_fk_accounts
    FOREIGN KEY (default_account_number)
    REFERENCES general_ledger_accounts (account_number)
);

CREATE TABLE invoices
(
  invoice_id            INT            PRIMARY KEY   AUTO_INCREMENT,
  vendor_id             INT            NOT NULL,
  invoice_number        VARCHAR(50)    NOT NULL,
  invoice_date          DATE           NOT NULL,
  invoice_total         DECIMAL(9,2)   NOT NULL,
  payment_total         DECIMAL(9,2)   NOT NULL      DEFAULT 0,
  credit_total          DECIMAL(9,2)   NOT NULL      DEFAULT 0,
  terms_id              INT            NOT NULL,
  invoice_due_date      DATE           NOT NULL,
  payment_date          DATE,
  CONSTRAINT invoices_fk_vendors
    FOREIGN KEY (vendor_id)
    REFERENCES vendors (vendor_id),
  CONSTRAINT invoices_fk_terms
    FOREIGN KEY (terms_id)
    REFERENCES terms (terms_id)
);

CREATE TABLE invoice_line_items
(
  invoice_id              INT            NOT NULL,
  invoice_sequence        INT            NOT NULL,
  account_number          INT            NOT NULL,
  line_item_amount        DECIMAL(9,2)   NOT NULL,
  line_item_description   VARCHAR(100)   NOT NULL,
  CONSTRAINT line_items_pk
    PRIMARY KEY (invoice_id, invoice_sequence),
  CONSTRAINT line_items_fk_invoices
    FOREIGN KEY (invoice_id)
    REFERENCES invoices (invoice_id),
  CONSTRAINT line_items_fk_acounts
    FOREIGN KEY (account_number)
    REFERENCES general_ledger_accounts (account_number)
);

CREATE TABLE vendor_contacts
(
  vendor_id       INT          PRIMARY KEY,
  last_name       VARCHAR(50)  NOT NULL,
  first_name      VARCHAR(50)  NOT NULL
);

CREATE TABLE invoice_archive
(
  invoice_id          INT          NOT NULL,
  vendor_id           INT          NOT NULL,
  invoice_number      VARCHAR(50)  NOT NULL,
  invoice_date        DATE         NOT NULL,
  invoice_total       DECIMAL(9,2) NOT NULL,
  payment_total       DECIMAL(9,2) NOT NULL,
  credit_total        DECIMAL(9,2) NOT NULL,
  terms_id            INT          NOT NULL,
  invoice_due_date    DATE         NOT NULL,
  payment_date        DATE
);

CREATE TABLE null_sample
(
  invoice_id      INT               NOT NULL,
  invoice_total   DECIMAL(9,2),
  CONSTRAINT invoice_id_uq 
    UNIQUE (invoice_id)
);

CREATE TABLE departments
(
  department_number   INT           NOT NULL,
  department_name     VARCHAR(50)   NOT NULL,
  CONSTRAINT department_number_unq  
    UNIQUE (department_number)
);

CREATE TABLE employees
(
  employee_id         INT               NOT NULL,
  last_name           VARCHAR(35)       NOT NULL,
  first_name          VARCHAR(35)       NOT NULL,
  department_number   INT               NOT NULL,
  manager_id          INT
);

CREATE TABLE projects
(
  project_number    VARCHAR(5)    NOT NULL,
  employee_id       INT           NOT NULL
);

CREATE TABLE customers
(
  customer_id          INT               NOT NULL,
  customer_last_name   VARCHAR(30),
  customer_first_name  VARCHAR(30),
  customer_address     VARCHAR(60),
  customer_city        VARCHAR(15),
  customer_state       VARCHAR(15),
  customer_zip         VARCHAR(10),
  customer_phone       VARCHAR(24)
);

CREATE TABLE color_sample
(
  color_id         INT           NOT NULL     AUTO_INCREMENT,
  color_number     INT           NOT NULL     DEFAULT 0,
  color_name       VARCHAR(50),
  CONSTRAINT color_sample_pk
    PRIMARY KEY (color_id)
);

CREATE TABLE string_sample
(
  emp_id        VARCHAR(3),
  emp_name      VARCHAR(25)
);

CREATE TABLE float_sample
(
  float_id       INT,
  float_value    DOUBLE
);

CREATE TABLE date_sample
(
  date_id       INT       NOT NULL,
  start_date    DATETIME
);

CREATE TABLE active_invoices
(
  invoice_id        INT           NOT NULL,
  vendor_id         INT           NOT NULL,
  invoice_number    VARCHAR(50)   NOT NULL,
  invoice_date      DATE          NOT NULL,
  invoice_total     DECIMAL(9,2)  NOT NULL,
  payment_total     DECIMAL(9,2)  NOT NULL,
  credit_total      DECIMAL(9,2)  NOT NULL,
  terms_id          INT           NOT NULL,
  invoice_due_date  DATE          NOT NULL,
  payment_date      DATE
);

CREATE TABLE paid_invoices
(
  invoice_id        INT           NOT NULL,
  vendor_id         INT           NOT NULL,
  invoice_number    VARCHAR(50)   NOT NULL,
  invoice_date      DATE          NOT NULL,
  invoice_total     DECIMAL(9,2)  NOT NULL,
  payment_total     DECIMAL(9,2)  NOT NULL,
  credit_total      DECIMAL(9,2)  NOT NULL,
  terms_id          INT           NOT NULL,
  invoice_due_date  DATE          NOT NULL,
  payment_date      DATE
);

CREATE TABLE customers
(
  customer_id           INT             NOT NULL,
  customer_first_name   VARCHAR(50),
  customer_last_name    VARCHAR(50)     NOT NULL,
  customer_address      VARCHAR(255)    NOT NULL,
  customer_city         VARCHAR(50)     NOT NULL,
  customer_state        CHAR(2)         NOT NULL,
  customer_zip          VARCHAR(20)     NOT NULL,
  customer_phone        VARCHAR(30)     NOT NULL,
  customer_fax          VARCHAR(30),
  CONSTRAINT customers_pk 
    PRIMARY KEY (customer_id)
);

CREATE TABLE items
(
  item_id       INT             NOT NULL,
  title         VARCHAR(50)     NOT NULL,
  artist        VARCHAR(50)     NOT NULL,
  unit_price    DECIMAL(9,2)    NOT NULL,
  CONSTRAINT items_pk 
    PRIMARY KEY (item_id),
  CONSTRAINT title_artist_unq
    UNIQUE (title, artist)
);

CREATE TABLE orders
(
  order_id          INT         NOT NULL,
  customer_id       INT         NOT NULL,
  order_date        DATE        NOT NULL,
  shipped_date      DATE,
  CONSTRAINT orders_pk
    PRIMARY KEY (order_id),
  CONSTRAINT orders_fk_customers
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);

CREATE TABLE order_details
(
  order_id      INT           NOT NULL,
  item_id       INT           NOT NULL,
  order_qty     INT           NOT NULL,
  CONSTRAINT order_details_pk 
    PRIMARY KEY (order_id, item_id),
  CONSTRAINT order_details_fk_orders
    FOREIGN KEY (order_id)
    REFERENCES orders (order_id),
  CONSTRAINT order_details_fk_items
    FOREIGN KEY (item_id)
    REFERENCES items (item_id)
);

