-- Source: https://github.com/jazzqi/Briup_JD1205/blob/a19e2bcb9ff2682be111b485b0aa8e0e41664ae6/BRIUP_ORACLE/note/oracle1.sql?raw=true
-- Tables detected: 12 | FK/REFERENCES mentions: 32

CREATE TABLE s_customer
(id                         NUMBER(7)
   CONSTRAINT s_customer_id_nn NOT NULL,
 name                       VARCHAR2(50)
   CONSTRAINT s_customer_name_nn NOT NULL,
 phone                      VARCHAR2(25),
 address                    VARCHAR2(400),
 city                       VARCHAR2(30),
 state                      VARCHAR2(20),
 country                    VARCHAR2(30),
 zip_code                   VARCHAR2(75),
 credit_rating              VARCHAR2(9),
 sales_rep_id               NUMBER(7),
 region_id                  NUMBER(7),
 comments                   VARCHAR2(255),
     CONSTRAINT s_customer_id_pk PRIMARY KEY (id),
     CONSTRAINT s_customer_credit_rating_ck
        CHECK (credit_rating IN ('EXCELLENT', 'GOOD', 'POOR')));

CREATE TABLE s_dept
(id                         NUMBER(7)
   CONSTRAINT s_dept_id_nn NOT NULL,
 name                       VARCHAR2(25)
   CONSTRAINT s_dept_name_nn NOT NULL,
 region_id                  NUMBER(7),
     CONSTRAINT s_dept_id_pk PRIMARY KEY (id),
     CONSTRAINT s_dept_name_region_id_uk UNIQUE (name, region_id));

CREATE TABLE s_emp
(id                         NUMBER(7)
   CONSTRAINT s_emp_id_nn NOT NULL,
 last_name                  VARCHAR2(25)
   CONSTRAINT s_emp_last_name_nn NOT NULL,
 first_name                 VARCHAR2(25),
 userid                     VARCHAR2(8),
 start_date                 DATE,
 comments                   VARCHAR2(255),
 manager_id                 NUMBER(7),
 title                      VARCHAR2(25),
 dept_id                    NUMBER(7),
 salary                     NUMBER(11, 2),
 commission_pct             NUMBER(4, 2),
     CONSTRAINT s_emp_id_pk PRIMARY KEY (id),
     CONSTRAINT s_emp_userid_uk UNIQUE (userid),
     CONSTRAINT s_emp_commission_pct_ck
        CHECK (commission_pct IN (10, 12.5, 15, 17.5, 20)));

CREATE TABLE s_image
(id                         NUMBER(7)
   CONSTRAINT s_image_id_nn NOT NULL,
 format                     VARCHAR2(25),
 use_filename               VARCHAR2(1),
 filename                   VARCHAR2(255),
 image                      LONG RAW,
     CONSTRAINT s_image_id_pk
        PRIMARY KEY (id),
     CONSTRAINT s_image_format_ck
        CHECK (format in ('JFIFF', 'JTIFF')),
     CONSTRAINT s_image_use_filename_ck
        CHECK (use_filename in ('Y', 'N')));

CREATE TABLE s_inventory
(product_id                 NUMBER(7)
   CONSTRAINT s_inventory_product_id_nn NOT NULL,
 warehouse_id               NUMBER(7)
   CONSTRAINT s_inventory_warehouse_id_nn NOT NULL,
 amount_in_stock            NUMBER(9),
 reorder_point              NUMBER(9),
 max_in_stock               NUMBER(9),
 out_of_stock_explanation   VARCHAR2(255),
 restock_date               DATE,
     CONSTRAINT s_inventory_prodid_warid_pk
        PRIMARY KEY (product_id, warehouse_id));

CREATE TABLE s_item
(ord_id                     NUMBER(7)
   CONSTRAINT s_item_ord_id_nn NOT NULL,
 item_id                    NUMBER(7)
   CONSTRAINT s_item_item_id_nn NOT NULL,
 product_id                 NUMBER(7)
   CONSTRAINT s_item_product_id_nn NOT NULL,
 price                      NUMBER(11, 2),
 quantity                   NUMBER(9),
 quantity_shipped           NUMBER(9),
     CONSTRAINT s_item_ordid_itemid_pk PRIMARY KEY (ord_id, item_id),
     CONSTRAINT s_item_ordid_prodid_uk UNIQUE (ord_id, product_id));

CREATE TABLE s_longtext
(id                         NUMBER(7)
   CONSTRAINT s_longtext_id_nn NOT NULL,
 use_filename               VARCHAR2(1),
 filename                   VARCHAR2(255),
 text                       VARCHAR2(2000),
     CONSTRAINT s_longtext_id_pk PRIMARY KEY (id),
     CONSTRAINT s_longtext_use_filename_ck
        CHECK (use_filename in ('Y', 'N')));

CREATE TABLE s_ord
(id                         NUMBER(7)
   CONSTRAINT s_ord_id_nn NOT NULL,
 customer_id                NUMBER(7)
   CONSTRAINT s_ord_customer_id_nn NOT NULL,
 date_ordered               DATE,
 date_shipped               DATE,
 sales_rep_id               NUMBER(7),
 total                      NUMBER(11, 2),
 payment_type               VARCHAR2(6),
 order_filled               VARCHAR2(1),
     CONSTRAINT s_ord_id_pk PRIMARY KEY (id),
     CONSTRAINT s_ord_payment_type_ck
        CHECK (payment_type in ('CASH', 'CREDIT')),
     CONSTRAINT s_ord_order_filled_ck
        CHECK (order_filled in ('Y', 'N')));

CREATE TABLE s_product
(id                         NUMBER(7)
   CONSTRAINT s_product_id_nn NOT NULL,
 name                       VARCHAR2(50)
   CONSTRAINT s_product_name_nn NOT NULL,
 short_desc                 VARCHAR2(255),
 longtext_id                NUMBER(7),
 image_id                   NUMBER(7),
 suggested_whlsl_price      NUMBER(11, 2),
 whlsl_units                VARCHAR2(25),
     CONSTRAINT s_product_id_pk PRIMARY KEY (id),
     CONSTRAINT s_product_name_uk UNIQUE (name));

CREATE TABLE s_region
(id                         NUMBER(7)
   CONSTRAINT s_region_id_nn NOT NULL,
 name                       VARCHAR2(50)
   CONSTRAINT s_region_name_nn NOT NULL,
     CONSTRAINT s_region_id_pk PRIMARY KEY (id),
     CONSTRAINT s_region_name_uk UNIQUE (name));

CREATE TABLE s_title
(title                      VARCHAR2(25)
   CONSTRAINT s_title_title_nn NOT NULL,
        CONSTRAINT s_title_title_pk PRIMARY KEY (title));

CREATE TABLE s_warehouse
(id                         NUMBER(7)
   CONSTRAINT s_warehouse_id_nn NOT NULL,
 region_id                  NUMBER(7)
   CONSTRAINT s_warehouse_region_id_nn NOT NULL,
 address                    LONG,
 city                       VARCHAR2(30),
 state                      VARCHAR2(20),
 country                    VARCHAR2(30),
 zip_code                   VARCHAR2(75),
 phone                      VARCHAR2(25),
 manager_id                 NUMBER(7),
     CONSTRAINT s_warehouse_id_pk PRIMARY KEY (id));

-- Foreign keys added via ALTER TABLE:
ALTER TABLE s_dept
   ADD CONSTRAINT s_dept_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);

ALTER TABLE s_emp
   ADD CONSTRAINT s_emp_manager_id_fk
   FOREIGN KEY (manager_id) REFERENCES s_emp (id);

ALTER TABLE s_emp
   ADD CONSTRAINT s_emp_dept_id_fk
   FOREIGN KEY (dept_id) REFERENCES s_dept (id);

ALTER TABLE s_emp
   ADD CONSTRAINT s_emp_title_fk
   FOREIGN KEY (title) REFERENCES s_title (title);

ALTER TABLE s_customer
   ADD CONSTRAINT s_sales_rep_id_fk
   FOREIGN KEY (sales_rep_id) REFERENCES s_emp (id);

ALTER TABLE s_customer
   ADD CONSTRAINT s_customer_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);

ALTER TABLE s_ord
   ADD CONSTRAINT s_ord_customer_id_fk
   FOREIGN KEY (customer_id) REFERENCES s_customer (id);

ALTER TABLE s_ord
   ADD CONSTRAINT s_ord_sales_rep_id_fk
   FOREIGN KEY (sales_rep_id) REFERENCES s_emp (id);

ALTER TABLE s_product
   ADD CONSTRAINT s_product_image_id_fk
   FOREIGN KEY (image_id) REFERENCES s_image (id);

ALTER TABLE s_product
   ADD CONSTRAINT s_product_longtext_id_fk
   FOREIGN KEY (longtext_id) REFERENCES s_longtext (id);

ALTER TABLE s_item
   ADD CONSTRAINT s_item_ord_id_fk
   FOREIGN KEY (ord_id) REFERENCES s_ord (id);

ALTER TABLE s_item
   ADD CONSTRAINT s_item_product_id_fk
   FOREIGN KEY (product_id) REFERENCES s_product (id);

ALTER TABLE s_warehouse
   ADD CONSTRAINT s_warehouse_manager_id_fk
   FOREIGN KEY (manager_id) REFERENCES s_emp (id);

ALTER TABLE s_warehouse
   ADD CONSTRAINT s_warehouse_region_id_fk
   FOREIGN KEY (region_id) REFERENCES s_region (id);

ALTER TABLE s_inventory
   ADD CONSTRAINT s_inventory_product_id_fk
   FOREIGN KEY (product_id) REFERENCES s_product (id);

ALTER TABLE s_inventory
   ADD CONSTRAINT s_inventory_warehouse_id_fk
   FOREIGN KEY (warehouse_id) REFERENCES s_warehouse (id);

