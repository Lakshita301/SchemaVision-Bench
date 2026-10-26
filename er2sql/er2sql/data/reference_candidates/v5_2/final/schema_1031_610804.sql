-- Source: https://github.com/zho/Kings-POS/blob/61d4a62b3815785e499851e7b3798eec50ad6946/src/main/resources/com/openbravo/pos/scripts/MySQL-create_original.sql?raw=true
-- Tables detected: 48 | FK constraints: 43
CREATE TABLE applications (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    version varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE roles (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    permissions BYTEA,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE people (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    apppassword varchar(255) DEFAULT NULL,
    card varchar(255) DEFAULT NULL,
    role varchar(255) NOT NULL,
    visible bit(1) NOT NULL,
    image BYTEA,
    PRIMARY KEY (id),
    UNIQUE (name),
    CONSTRAINT people_fk_1 FOREIGN KEY (role) REFERENCES roles (id)
);

CREATE TABLE resources (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    restype int NOT NULL,
    content BYTEA,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE taxcustcategories (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE customers (
    id varchar(255) NOT NULL,
    searchkey varchar(255) NOT NULL,
    taxid varchar(255) DEFAULT NULL,
    name varchar(255) NOT NULL,
    taxcategory varchar(255) DEFAULT NULL,
    card varchar(255) DEFAULT NULL,
    maxdebt DOUBLE PRECISION NOT NULL DEFAULT '0',
    address varchar(255) DEFAULT NULL,
    address2 varchar(255) DEFAULT NULL,
    postal varchar(255) DEFAULT NULL,
    city varchar(255) DEFAULT NULL,
    region varchar(255) DEFAULT NULL,
    country varchar(255) DEFAULT NULL,
    firstname varchar(255) DEFAULT NULL,
    lastname varchar(255) DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    phone varchar(255) DEFAULT NULL,
    phone2 varchar(255) DEFAULT NULL,
    fax varchar(255) DEFAULT NULL,
    notes varchar(255) DEFAULT NULL,
    visible bit(1) NOT NULL DEFAULT b'1',
    curdate TIMESTAMP DEFAULT NULL,
    curdebt DOUBLE PRECISION DEFAULT '0',
    image BYTEA,
    PRIMARY KEY (id),
    UNIQUE (searchkey),
    CONSTRAINT customers_taxcat FOREIGN KEY (taxcategory) REFERENCES taxcustcategories (id)
);

CREATE TABLE taxsuppcategories (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE suppliers (
    id varchar(255) NOT NULL,
    searchkey varchar(255) NOT NULL,
    taxid varchar(255) DEFAULT NULL,
    name varchar(255) NOT NULL,
    taxcategory varchar(255) DEFAULT NULL,
    card varchar(255) DEFAULT NULL,
    maxdebt DOUBLE PRECISION NOT NULL DEFAULT '0',
    address varchar(255) DEFAULT NULL,
    address2 varchar(255) DEFAULT NULL,
    postal varchar(255) DEFAULT NULL,
    city varchar(255) DEFAULT NULL,
    region varchar(255) DEFAULT NULL,
    country varchar(255) DEFAULT NULL,
    firstname varchar(255) DEFAULT NULL,
    lastname varchar(255) DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    phone varchar(255) DEFAULT NULL,
    phone2 varchar(255) DEFAULT NULL,
    fax varchar(255) DEFAULT NULL,
    notes varchar(255) DEFAULT NULL,
    visible bit(1) NOT NULL DEFAULT b'1',
    curdate TIMESTAMP DEFAULT NULL,
    curdebt DOUBLE PRECISION DEFAULT '0',
    PRIMARY KEY (id),
    UNIQUE (searchkey),
    CONSTRAINT suppliers_taxcat FOREIGN KEY (taxcategory) REFERENCES taxsuppcategories (id)
);

CREATE TABLE categories (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    parentid varchar(255) DEFAULT NULL,
    image BYTEA,
    texttip varchar(255) DEFAULT NULL,
    catshowname smallint NOT NULL DEFAULT '1',
    catorder varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE (name),
    CONSTRAINT categories_fk_1 FOREIGN KEY (parentid) REFERENCES categories (id)
);

CREATE TABLE taxcategories (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE taxes (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    category varchar(255) NOT NULL,
    custcategory varchar(255) DEFAULT NULL,
    parentid varchar(255) DEFAULT NULL,
    rate DOUBLE PRECISION NOT NULL DEFAULT '0',
    ratecascade bit(1) NOT NULL DEFAULT b'0',
    rateorder int DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE (name),
    CONSTRAINT taxes_cat_fk FOREIGN KEY (category) REFERENCES taxcategories (id),
    CONSTRAINT taxes_custcat_fk FOREIGN KEY (custcategory) REFERENCES taxcustcategories (id),
    CONSTRAINT taxes_taxes_fk FOREIGN KEY (parentid) REFERENCES taxes (id)
);

CREATE TABLE attribute (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE attributevalue (
    id varchar(255) NOT NULL,
    attribute_id varchar(255) NOT NULL,
    value varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT attval_att FOREIGN KEY (attribute_id) REFERENCES attribute (id) ON DELETE CASCADE
);

CREATE TABLE attributeset (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE attributeuse (
    id varchar(255) NOT NULL,
    attributeset_id varchar(255) NOT NULL,
    attribute_id varchar(255) NOT NULL,
    lineno int DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE (attributeset_id,lineno),
    CONSTRAINT attuse_att FOREIGN KEY (attribute_id) REFERENCES attribute (id),
    CONSTRAINT attuse_set FOREIGN KEY (attributeset_id) REFERENCES attributeset (id) ON DELETE CASCADE
);

CREATE TABLE attributesetinstance (
    id varchar(255) NOT NULL,
    attributeset_id varchar(255) NOT NULL,
    description varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT attsetinst_set FOREIGN KEY (attributeset_id) REFERENCES attributeset (id) ON DELETE CASCADE
);

CREATE TABLE attributeinstance (
    id varchar(255) NOT NULL,
    attributesetinstance_id varchar(255) NOT NULL,
    attribute_id varchar(255) NOT NULL,
    value varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT attinst_att FOREIGN KEY (attribute_id) REFERENCES attribute (id),
    CONSTRAINT attinst_set FOREIGN KEY (attributesetinstance_id) REFERENCES attributesetinstance (id) ON DELETE CASCADE
);

CREATE TABLE products (
    id varchar(255) NOT NULL,
    reference varchar(255) NOT NULL,
    code varchar(255) NOT NULL,
    codetype varchar(255) DEFAULT NULL,
    name varchar(255) NOT NULL,
    pricebuy DOUBLE PRECISION NOT NULL DEFAULT '0',
    pricesell DOUBLE PRECISION NOT NULL DEFAULT '0',
    category varchar(255) NOT NULL,
    taxcat varchar(255) NOT NULL,
    attributeset_id varchar(255) DEFAULT NULL,
    stockcost DOUBLE PRECISION DEFAULT NULL,
    stockvolume DOUBLE PRECISION DEFAULT NULL,
    image BYTEA,
    iscom bit(1) NOT NULL DEFAULT b'0',
    isscale bit(1) NOT NULL DEFAULT b'0',
    isconstant bit(1) NOT NULL DEFAULT b'0',
    printkb bit(1) NOT NULL DEFAULT b'0',
    sendstatus bit(1) NOT NULL DEFAULT b'0',
    isservice bit(1) NOT NULL DEFAULT b'0',
    attributes BYTEA,
    display varchar(255) DEFAULT NULL,
    isvprice smallint NOT NULL DEFAULT '0',
    isverpatrib smallint NOT NULL DEFAULT '0',
    texttip varchar(255) DEFAULT NULL,
    warranty smallint NOT NULL DEFAULT '0',
    stockunits DOUBLE PRECISION NOT NULL DEFAULT '0',
    printto varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE (reference),
    UNIQUE (code),
    UNIQUE (name),
    CONSTRAINT products_attrset_fk FOREIGN KEY (attributeset_id) REFERENCES attributeset (id),
    CONSTRAINT products_fk_1 FOREIGN KEY (category) REFERENCES categories (id),
    CONSTRAINT products_taxcat_fk FOREIGN KEY (taxcat) REFERENCES taxcategories (id)
);

CREATE TABLE products_cat (
    product varchar(255) NOT NULL,
    catorder int DEFAULT NULL,
    PRIMARY KEY (product),
    CONSTRAINT products_cat_fk_1 FOREIGN KEY (product) REFERENCES products (id)
);

CREATE TABLE products_com (
    id varchar(255) NOT NULL,
    product varchar(255) NOT NULL,
    product2 varchar(255) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE (product,product2),
    CONSTRAINT products_com_fk_1 FOREIGN KEY (product) REFERENCES products (id),
    CONSTRAINT products_com_fk_2 FOREIGN KEY (product2) REFERENCES products (id)
);

CREATE TABLE locations (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    address varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE stockdiary (
    id varchar(255) NOT NULL,
    datenew TIMESTAMP NOT NULL,
    reason int NOT NULL,
    location varchar(255) NOT NULL,
    product varchar(255) NOT NULL,
    attributesetinstance_id varchar(255) DEFAULT NULL,
    units DOUBLE PRECISION NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    appuser varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT stockdiary_attsetinst FOREIGN KEY (attributesetinstance_id) REFERENCES attributesetinstance (id),
    CONSTRAINT stockdiary_fk_1 FOREIGN KEY (product) REFERENCES products (id),
    CONSTRAINT stockdiary_fk_2 FOREIGN KEY (location) REFERENCES locations (id)
);

CREATE TABLE stocklevel (
    id varchar(255) NOT NULL,
    location varchar(255) NOT NULL,
    product varchar(255) NOT NULL,
    stocksecurity DOUBLE PRECISION DEFAULT NULL,
    stockmaximum DOUBLE PRECISION DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT stocklevel_location FOREIGN KEY (location) REFERENCES locations (id),
    CONSTRAINT stocklevel_product FOREIGN KEY (product) REFERENCES products (id)
);

CREATE TABLE stockcurrent (
    location varchar(255) NOT NULL,
    product varchar(255) NOT NULL,
    attributesetinstance_id varchar(255) DEFAULT NULL,
    units DOUBLE PRECISION NOT NULL,
    UNIQUE (location,product,attributesetinstance_id),
    CONSTRAINT stockcurrent_attsetinst FOREIGN KEY (attributesetinstance_id) REFERENCES attributesetinstance (id),
    CONSTRAINT stockcurrent_fk_1 FOREIGN KEY (product) REFERENCES products (id),
    CONSTRAINT stockcurrent_fk_2 FOREIGN KEY (location) REFERENCES locations (id)
);

CREATE TABLE closedcash (
    money varchar(255) NOT NULL,
    host varchar(255) NOT NULL,
    hostsequence int NOT NULL,
    datestart TIMESTAMP NOT NULL,
    dateend TIMESTAMP DEFAULT NULL,
    nosales int NOT NULL DEFAULT '0',
    PRIMARY KEY (money),
    UNIQUE (host,hostsequence)
);

CREATE TABLE receipts (
    id varchar(255) NOT NULL,
    money varchar(255) NOT NULL,
    datenew TIMESTAMP NOT NULL,
    attributes BYTEA,
    person varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT receipts_fk_money FOREIGN KEY (money) REFERENCES closedcash (money)
);

CREATE TABLE tickets (
    id varchar(255) NOT NULL,
    tickettype int NOT NULL DEFAULT '0',
    ticketid int NOT NULL,
    person varchar(255) NOT NULL,
    customer varchar(255) DEFAULT NULL,
    status int NOT NULL DEFAULT '0',
    PRIMARY KEY (id),
    CONSTRAINT tickets_customers_fk FOREIGN KEY (customer) REFERENCES customers (id),
    CONSTRAINT tickets_fk_2 FOREIGN KEY (person) REFERENCES people (id),
    CONSTRAINT tickets_fk_id FOREIGN KEY (id) REFERENCES receipts (id)
);

CREATE TABLE ticketsnum (
    id int NOT NULL
);

CREATE TABLE ticketsnum_refund (
    id int NOT NULL
);

CREATE TABLE ticketsnum_payment (
    id int NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    PRIMARY KEY (id)
);

CREATE TABLE ticketlines (
    ticket varchar(255) NOT NULL,
    line int NOT NULL,
    product varchar(255) DEFAULT NULL,
    attributesetinstance_id varchar(255) DEFAULT NULL,
    units DOUBLE PRECISION NOT NULL,
    price DOUBLE PRECISION NOT NULL,
    taxid varchar(255) NOT NULL,
    attributes BYTEA,
    PRIMARY KEY (ticket,line),
    CONSTRAINT ticketlines_attsetinst FOREIGN KEY (attributesetinstance_id) REFERENCES attributesetinstance (id),
    CONSTRAINT ticketlines_fk_2 FOREIGN KEY (product) REFERENCES products (id),
    CONSTRAINT ticketlines_fk_3 FOREIGN KEY (taxid) REFERENCES taxes (id),
    CONSTRAINT ticketlines_fk_ticket FOREIGN KEY (ticket) REFERENCES tickets (id)
);

CREATE TABLE lineremoved (
    removeddate timestamp NOT NULL DEFAULT current_timestamp,
    name varchar(255) DEFAULT NULL,
    ticketid varchar(255) DEFAULT NULL,
    productid varchar(255) DEFAULT NULL,
    productname varchar(255) DEFAULT NULL,
    units DOUBLE PRECISION NOT NULL
);

CREATE TABLE payments (
    id varchar(255) NOT NULL,
    receipt varchar(255) NOT NULL,
    payment varchar(255) NOT NULL,
    total DOUBLE PRECISION NOT NULL DEFAULT '0',
    tip DOUBLE PRECISION DEFAULT '0',
    transid varchar(255) DEFAULT NULL,
    isprocessed bit(1) DEFAULT b'0',
    returnmsg BYTEA,
    notes varchar(255) DEFAULT NULL,
    tendered DOUBLE PRECISION DEFAULT NULL,
    cardname varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT payments_fk_receipt FOREIGN KEY (receipt) REFERENCES receipts (id)
);

CREATE TABLE taxlines (
    id varchar(255) NOT NULL,
    receipt varchar(255) NOT NULL,
    taxid varchar(255) NOT NULL,
    base DOUBLE PRECISION NOT NULL DEFAULT '0',
    amount DOUBLE PRECISION NOT NULL DEFAULT '0',
    PRIMARY KEY (id),
    CONSTRAINT taxlines_receipt FOREIGN KEY (receipt) REFERENCES receipts (id),
    CONSTRAINT taxlines_tax FOREIGN KEY (taxid) REFERENCES taxes (id)
);

CREATE TABLE floors (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    image BYTEA,
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE places (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    x int NOT NULL,
    y int NOT NULL,
    floor varchar(255) NOT NULL,
    customer varchar(255) DEFAULT NULL,
    waiter varchar(255) DEFAULT NULL,
    ticketid varchar(255) DEFAULT NULL,
    tablemoved smallint NOT NULL DEFAULT '0',
    PRIMARY KEY (id),
    UNIQUE (name)
);

CREATE TABLE reservations (
    id varchar(255) NOT NULL,
    created TIMESTAMP NOT NULL,
    datenew TIMESTAMP NOT NULL DEFAULT '2013-01-01 00:00:00',
    title varchar(255) NOT NULL,
    chairs int NOT NULL,
    isdone bit(1) NOT NULL,
    description varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE reservation_customers (
    id varchar(255) NOT NULL,
    customer varchar(255) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT res_cust_fk_1 FOREIGN KEY (id) REFERENCES reservations (id),
    CONSTRAINT res_cust_fk_2 FOREIGN KEY (customer) REFERENCES customers (id)
);

CREATE TABLE thirdparties (
    id varchar(255) NOT NULL,
    cif varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    address varchar(255) DEFAULT NULL,
    contactcomm varchar(255) DEFAULT NULL,
    contactfact varchar(255) DEFAULT NULL,
    payrule varchar(255) DEFAULT NULL,
    faxnumber varchar(255) DEFAULT NULL,
    phonenumber varchar(255) DEFAULT NULL,
    mobilenumber varchar(255) DEFAULT NULL,
    email varchar(255) DEFAULT NULL,
    webpage varchar(255) DEFAULT NULL,
    notes varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    UNIQUE (cif),
    UNIQUE (name)
);

CREATE TABLE sharedtickets (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    content BYTEA,
    appuser varchar(255) DEFAULT NULL,
    pickupid int NOT NULL DEFAULT '0',
    locked varchar(20) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE shifts (
    id varchar(255) NOT NULL,
    startshift TIMESTAMP NOT NULL,
    endshift TIMESTAMP DEFAULT NULL,
    pplid varchar(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE leaves (
    id varchar(255) NOT NULL,
    pplid varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    startdate TIMESTAMP NOT NULL,
    enddate TIMESTAMP NOT NULL,
    notes varchar(255) DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT leaves_pplid FOREIGN KEY (pplid) REFERENCES people (id)
);

CREATE TABLE breaks (
    id varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    visible SMALLINT NOT NULL DEFAULT '1',
    notes varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE shift_breaks (
    id varchar(255) NOT NULL,
    shiftid varchar(255) NOT NULL,
    breakid varchar(255) NOT NULL,
    starttime timestamp NOT NULL DEFAULT current_timestamp,
    endtime timestamp NOT NULL ,
    PRIMARY KEY (id),
    CONSTRAINT shift_breaks_breakid FOREIGN KEY (breakid) REFERENCES breaks (id),
    CONSTRAINT shift_breaks_shiftid FOREIGN KEY (shiftid) REFERENCES shifts (id)
);

CREATE TABLE moorers (
    vesselname varchar(255) DEFAULT NULL,
    size int DEFAULT NULL,
    days int DEFAULT NULL,
    power bit(1) NOT NULL DEFAULT b'0'
);

CREATE TABLE csvimport (
    id varchar(255) NOT NULL,
    rownumber varchar(255) DEFAULT NULL,
    csverror varchar(255) DEFAULT NULL,
    reference varchar(1024) DEFAULT NULL,
    code varchar(1024) DEFAULT NULL,
    name varchar(1024) DEFAULT NULL,
    pricebuy DOUBLE PRECISION DEFAULT NULL,
    pricesell DOUBLE PRECISION DEFAULT NULL,
    previousbuy DOUBLE PRECISION DEFAULT NULL,
    previoussell DOUBLE PRECISION DEFAULT NULL,
    category varchar(255) DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE pickup_number (
    id int NOT NULL DEFAULT '0'
);

CREATE TABLE draweropened (
    opendate timestamp NOT NULL DEFAULT current_timestamp,
    name varchar(255) DEFAULT NULL,
    ticketid varchar(255) DEFAULT NULL
);
CREATE INDEX ON people (role);
CREATE INDEX ON people (card);
CREATE INDEX ON customers (taxcategory);
CREATE INDEX ON customers (taxid);
CREATE INDEX ON customers (name);
CREATE INDEX ON customers (card);
CREATE INDEX ON suppliers (taxcategory);
CREATE INDEX ON suppliers (taxid);
CREATE INDEX ON suppliers (name);
CREATE INDEX ON categories (parentid);
CREATE INDEX ON taxes (category);
CREATE INDEX ON taxes (custcategory);
CREATE INDEX ON taxes (parentid);
CREATE INDEX ON attributevalue (attribute_id);
CREATE INDEX ON attributeuse (attribute_id);
CREATE INDEX ON attributesetinstance (attributeset_id);
CREATE INDEX ON attributeinstance (attributesetinstance_id);
CREATE INDEX ON attributeinstance (attribute_id);
CREATE INDEX ON products (category);
CREATE INDEX ON products (taxcat);
CREATE INDEX ON products (attributeset_id);
CREATE INDEX ON products_cat (catorder);
CREATE INDEX ON products_com (product2);
CREATE INDEX ON stockdiary (product);
CREATE INDEX ON stockdiary (attributesetinstance_id);
CREATE INDEX ON stockdiary (location);
CREATE INDEX ON stockdiary (datenew);
CREATE INDEX ON stocklevel (product);
CREATE INDEX ON stocklevel (location);
CREATE INDEX ON stockcurrent (product);
CREATE INDEX ON stockcurrent (attributesetinstance_id);
CREATE INDEX ON closedcash (datestart);
CREATE INDEX ON receipts (money);
CREATE INDEX ON receipts (datenew);
CREATE INDEX ON tickets (person);
CREATE INDEX ON tickets (customer);
CREATE INDEX ON tickets (tickettype,ticketid);
CREATE INDEX ON ticketlines (product);
CREATE INDEX ON ticketlines (attributesetinstance_id);
CREATE INDEX ON ticketlines (taxid);
CREATE INDEX ON payments (receipt);
CREATE INDEX ON payments (payment);
CREATE INDEX ON taxlines (taxid);
CREATE INDEX ON taxlines (receipt);
CREATE INDEX ON reservations (datenew);
CREATE INDEX ON reservation_customers (customer);
CREATE INDEX ON leaves (pplid);
CREATE INDEX ON shift_breaks (breakid);
CREATE INDEX ON shift_breaks (shiftid);
