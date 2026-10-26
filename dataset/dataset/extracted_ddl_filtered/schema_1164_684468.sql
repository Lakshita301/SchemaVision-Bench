-- Source: https://github.com/BwizLabs/DBST670_GroupProject/blob/faa996977fd3cbdc39ae1b23db6ff678c219be4d/10TableData/DBST670_User_Tablespace_DDLs_v3.sql?raw=true
-- Tables detected: 10 | FK constraints: 10

CREATE TABLE zip (
    zipcode   CHAR(10) NOT NULL,
    city      CHAR(25),
    state     CHAR(2),
    CONSTRAINT pk_zip PRIMARY KEY ( zipcode )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 1000 K NEXT 120 K )
)
    PARTITION BY RANGE (
        state
    )
    ( PARTITION zip_part1
        VALUES LESS THAN ( 'N' )
    PCTFREE 5 PCTUSED 90 TABLESPACE user_data1
        STORAGE ( INITIAL 1240 k NEXT 200 k MAXEXTENTS UNLIMITED PCTINCREASE 0 ),
    PARTITION zip_part2
        VALUES LESS THAN ( MAXVALUE )
    PCTFREE 5 PCTUSED 90 TABLESPACE user_data2
        STORAGE ( INITIAL 1240 k NEXT 200 k MAXEXTENTS UNLIMITED PCTINCREASE 0 )
    );

CREATE TABLE customer (
    customerid   NUMBER(10) NOT NULL,
    firstname    VARCHAR2(15),
    lastname     VARCHAR2(15),
    phoneno      CHAR(15),
    address      VARCHAR2(35),
    zipcode      CHAR(10),
    CONSTRAINT pk_customer_id PRIMARY KEY ( customerid )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K ),
    CONSTRAINT fk_zip FOREIGN KEY ( zipcode )
        REFERENCES zip
)
PCTFREE 20 PCTUSED 40 TABLESPACE user_data1
    STORAGE ( INITIAL 120 k NEXT 10 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

CREATE TABLE product (
    productid         NUMBER(10),
    prod_unit_price   NUMBER(10),
    description       VARCHAR2(150),
    CONSTRAINT pk_productid PRIMARY KEY ( productid )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K )
)
PCTFREE 5 PCTUSED 90 TABLESPACE user_data2
    STORAGE ( INITIAL 168 k NEXT 20 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

CREATE TABLE region (
    regionid      NUMBER(10) NOT NULL,
    regionname    VARCHAR(25),
    description   VARCHAR(150),
    CONSTRAINT pk_region PRIMARY KEY ( regionid )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K )
)
PCTFREE 5 PCTUSED 90 TABLESPACE user_data1
    STORAGE ( INITIAL 192 k NEXT 20 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

CREATE TABLE stores (
    storeid     NUMBER(10) NOT NULL,
    regionid    NUMBER(10),
    storename   VARCHAR2(15),
    address     VARCHAR2(35),
    phoneno     CHAR(15),
    zipcode     CHAR(10),
    CONSTRAINT pk_stores PRIMARY KEY ( storeid )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K ),
    CONSTRAINT fk_store_region FOREIGN KEY ( regionid )
        REFERENCES region,
    CONSTRAINT fk_store_zip FOREIGN KEY ( zipcode )
        REFERENCES zip
)
PCTFREE 5 PCTUSED 90 TABLESPACE user_data1
    STORAGE ( INITIAL 96 k NEXT 10 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

CREATE TABLE employee (
    sales_emp_ssn   NUMBER(9) NOT NULL,
    storeid         NUMBER(10),
    firstname       VARCHAR2(15),
    lastname        VARCHAR2(15),
    address         VARCHAR2(35),
    phoneno         CHAR(15),
    zipcode         CHAR(10),
    CONSTRAINT pk_sales_emp_ssn PRIMARY KEY ( sales_emp_ssn )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K ),
    CONSTRAINT fk_emp_storeid FOREIGN KEY ( storeid )
        REFERENCES stores,
    CONSTRAINT fk_emp_zip FOREIGN KEY ( zipcode )
        REFERENCES zip
)
PCTFREE 20 PCTUSED 40 TABLESPACE user_data1
    STORAGE ( INITIAL 120 k NEXT 10 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

CREATE TABLE orders (
    orderid         NUMBER(10) NOT NULL,
    customerid      NUMBER(10) NOT NULL,
    sales_emp_ssn   NUMBER(9) NOT NULL,
    order_method    CHAR(10),
    CONSTRAINT pk_orderid PRIMARY KEY ( orderid )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K ),
    CONSTRAINT fk_customerid FOREIGN KEY ( customerid )
        REFERENCES customer,
    CONSTRAINT fk_emp_ssn FOREIGN KEY ( sales_emp_ssn )
        REFERENCES employee
)
PCTFREE 5 PCTUSED 60 TABLESPACE user_data1
    STORAGE ( INITIAL 24 k NEXT 10 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

CREATE TABLE order_item (
    orderid     NUMBER(10) NOT NULL,
    productid   NUMBER(10),
    quantity    NUMBER(10),
    CONSTRAINT pk_order_item PRIMARY KEY ( orderid,
                                           productid )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K ),
    CONSTRAINT fk_order_id1 FOREIGN KEY ( orderid )
        REFERENCES orders,
    CONSTRAINT fk_product_id FOREIGN KEY ( productid )
        REFERENCES product
)
PCTFREE 5 PCTUSED 90 TABLESPACE user_data2
    STORAGE ( INITIAL 16 k NEXT 20 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

CREATE TABLE payment (
    paymentid        NUMBER(10),
    orderid          NUMBER(10),
    card_exp_date    DATE,
    card_number      NUMBER(30),
    payment_amount   NUMBER(20,2),
    payment_method   VARCHAR2(5),
    CONSTRAINT pk_paymentid PRIMARY KEY ( paymentid )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K ),
    CONSTRAINT fk_order_id2 FOREIGN KEY ( orderid )
        REFERENCES orders
)
PCTFREE 20 PCTUSED 40 TABLESPACE user_data2
    STORAGE ( INITIAL 40 k NEXT 10 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

CREATE TABLE product_cat (
    prodcatid     NUMBER(10) NOT NULL,
    prodcattype   VARCHAR(25),
    description   VARCHAR(150),
    CONSTRAINT pk_prodcat PRIMARY KEY ( prodcatid )
        USING INDEX TABLESPACE user_indx1
            STORAGE ( INITIAL 50 K NEXT 10 K )
)
PCTFREE 5 PCTUSED 90 TABLESPACE user_data1
    STORAGE ( INITIAL 192 k NEXT 20 k MAXEXTENTS UNLIMITED PCTINCREASE 0 );

