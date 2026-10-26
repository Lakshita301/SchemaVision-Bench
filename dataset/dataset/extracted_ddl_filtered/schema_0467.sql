-- Source: https://github.com/farnulfo/castor/blob/974f853be5680427a195a6b8ae3ce63a65a309b6/castor/branches/1.3/cpactf/src/old/ddl/derby.sql?raw=true
-- Tables detected: 145 | FK/REFERENCES mentions: 14

create table tc0x_sample (
  id      int           not null,
  value1  varchar(200)  not null,
  value2  varchar(200)
);

create table tc0x_race (
  id      int          not null,
  value1  int          not null
);

create table tc1x_sample (
  id      int           not null,
  value1  varchar(200)  not null,
  value2  varchar(200)
);

create table tc1x_persist (
  id         integer         not null,
  ctime      timestamp       not null,
  mtime      timestamp,
  value1     varchar(200)    not null,
  parent_id  integer,
  group_id   numeric(10,0)   not null
);

create table tc1x_related (
  id          integer     not null,
  persist_id  integer     not null
);

create table tc1x_group (
  id      numeric(10,0)  not null,
  value1  varchar(200)   not null
);

create table tc1x_handling (
  id             numeric(10,0)  not null,
  tdt            timestamp      not null,
  ttm            timestamp      not null,
  int_val        integer,
  float_val      float,
  real_val       real,
  long_val       numeric(18,0),
  char_val       char(1),
  bool_val       char(1),
  bool_is_method char(1),
  int_date       integer,
  str_time       char(23),
  num_date       numeric(17,0),
  long_date      numeric(20,0)
);

create table tc1x_lob (
  id        numeric(10,0)  not null,
  blob_val  blob,
  clob_val  clob,
  clob_val2 clob
);

create table tc1x_conv (
    id                 int         not null,
    bool_int           int,
    bool_int_minus     int,
    bool_bigdec        numeric,
    bool_bigdec_minus  numeric,
    byte_int           int         ,
    short_int          int         ,
    long_int           int         ,
    double_int         int         ,
    float_int          float       ,
    int_bigdec         numeric     ,
    float_bigdec       numeric     ,
    double_bigdec      numeric     ,
    int_string         varchar(20) ,
    long_string        varchar(20) ,
    bigdec_string      varchar(20) ,
    float_string       varchar(20) ,
    double_string      varchar(20) 
);

create table tc1x_serial (
  id      integer        not null,
  dep     blob           
);

create table tc1x_rollback (
  id      numeric(10,0) not null,
  value1  varchar(200)  not null,
  value2  varchar(200),
  numb     numeric(10,0)
);

create table tc1x_pks_person (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  bday  date            
);

create table tc1x_pks_only(
  fname varchar(15)    not null,
  lname varchar(15)    not null
);

create table tc1x_pks_employee (
  fname      varchar(100)    not null,
  lname      varchar(100)    not null,
  start_date date            
);

create table tc1x_pks_payroll (
  fname       varchar(100)  not null,
  lname       varchar(100)  not null,
  id          int           not null,
  holiday     int           not null,
  hourly_rate int           not null
);

create table tc1x_pks_address (
  fname   varchar(100)  not null,
  lname   varchar(100)  not null,
  id      int           not null,
  street  varchar(30)   ,
  city    varchar(30)   ,
  state   varchar(2)    ,
  zip     varchar(6)    
);

create table tc1x_pks_contract (
  fname        varchar(100)  not null,
  lname        varchar(100)  not null,
  policy_no    int           not null,
  contract_no  int           not null,
  c_comment    varchar(100)  
);

create table tc1x_pks_category_contract (
  policy_no    int      not null,
  contract_no  int      not null,
  cate_id      int      not null
);

create table tc1x_pks_category (
  id    int              not null,
  name  varchar(100)     not null
);

create table tc2x_master (
  id        numeric(10,0)  not null,
  value1    varchar(200)   not null,
  group_id  numeric(10,0)  default null
);

create table tc2x_detail (
  detail_id  numeric(10,0)  not null,
  master_id  numeric(10,0)  not null,
  value1     varchar(200)   not null
);

create table tc2x_detail2 (
  detail2_id  numeric(10,0)  not null,
  detail_id   numeric(10,0)  not null,
  value1      varchar(200 )  not null
);

create table tc2x_detail3 (
  detail3_id  numeric(10,0)  not null,
  detail_id   numeric(10,0)  not null,
  value1      varchar(200 )  not null
);

create table tc2x_group (
  id      numeric(10,0)  not null,
  value1  varchar(200)   not null
);

create table tc2x_depend1 (
  id          int not null primary key
);

create table tc2x_depend_master (
  id          int not null primary key,
  depend1_id  int,
  foreign key ( depend1_id ) references tc2x_depend1 ( id )
);

create table tc2x_depend2 (
  id          int not null primary key,
  master_id   int,
  foreign key ( master_id ) references tc2x_depend_master ( id )
);

create table tc2x_keygen (
  id    int           not null,
  attr  varchar(200)  not null
);

create table tc2x_keygen_ext (
  id   int          not null,
  ext  varchar(200) not null
);

create table tc2x_keygen_string (
  id    varchar(200)  not null,
  attr  varchar(200)  not null
);

create table tc2x_keygen_ext_string (
  id   varchar(200) not null,
  ext  varchar(200) not null
);

create table tc2x_uuid (
  id    char(30)      not null,
  attr  varchar(200)  not null
);

create table tc2x_uuid_ext (
  id   char(30)     not null,
  ext  varchar(200) not null
);

create table tc2x_identity (
  id    integer not null primary key generated always as identity,
  attr  varchar(200) not null
);

create table tc2x_identity_ext (
  id   integer not null primary key generated always as identity,
  ext  varchar(200) not null
);

create table tc2x_seqtable (
  table_name  varchar(200)  not null,
  max_id      int
);

create table tc3x_entity (
  id      int           not null,
  value1  varchar(200)  not null,
  value2  varchar(200)
);

create table tc3x_extends (
  id      int          not null,
  value3  varchar(200) ,
  value4  varchar(200) 
);

create table tc3x_call (
  id      int          not null,
  value1  varchar(200) not null,
  value2  varchar(200) 
);

create table tc3x_persistent (
  id        integer         not null,
  ctime     timestamp       not null,
  mtime     timestamp       ,
  value1    varchar(200)    not null,
  parent_id integer         ,
  group_id  numeric(10,0)   not null
);

create table tc3x_related (
  id          integer     not null,
  persist_id  integer     not null
);

create table tc3x_group (
  id      numeric(10,0)  not null,
  value1  varchar(200)  not null
);

create table tc3x_extends1 (
  ident   integer         not null,
  ext     integer         not null
);

create table tc3x_extends2 (
  id      integer         not null,
  ext     integer         not null
);

create table tc3x_nq_entity (
  id        integer not null primary key,
  name      varchar(200) not null
);

create table tc7x_table (
  id      int           not null,
  value1  varchar(200)  not null,
  value2  varchar(200)
);

create table test_table2 (
  id      int           not null,
  value1  varchar(200)  not null,
  value2  varchar(200)
);

create table tc7x_many_group (
  gid       int           not null primary key,
  value1    varchar(100)  not null
);

create table tc7x_many_person (
   pid      int          not null primary key,
   value1   varchar(100) not null,
   helloworld varchar(100) ,
   sthelse varchar(100) 
);

create table tc7x_group_person (
  gid int         not null,
  pid int        not null,
  CONSTRAINT person_delete
    FOREIGN KEY(pid) 
    REFERENCES tc7x_many_person(pid),
  CONSTRAINT group_delete
    FOREIGN KEY(gid) 
    REFERENCES tc7x_many_group(gid)
);

create table tc7x_as_assoc1 (
  id        int not null,
  name      varchar(200) not null,
  constraint pk_tc7x_as_assoc1 primary key (id)
);

create table tc7x_as_main (
  id        int not null,
  name      varchar(200) not null,
  assoc1_id	int default null,
  constraint pk_tc7x_as_main primary key (id)
);

create table tc7x_as_main_many (
  id        int not null,
  name      varchar(200) not null,
  constraint pk_tc7x_as_main_many primary key (id)
);

create table tc7x_as_assoc_many (
  id        int not null,
  name      varchar(200) not null,
  main_id	int,
  constraint pk_tc7x_as_assoc_many primary key (id)
);

create table tc8x_pks_person (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  bday  date 
);

create table tc8x_pks_employee (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  start_date date 
);

create table tc8x_pks_payroll (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  id int               not null,
  holiday int,
  hourly_rate int
);

create table tc8x_pks_project (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  id    int             not null,
  name  varchar(100)
);

create table tc8x_pks_address (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  id int               not null,
  street varchar(30)    ,
  city  varchar(30)    ,
  state varchar(2)     ,
  zip varchar(6)       
);

create table tc8x_pks_contract (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  policy_no int        not null,
  contract_no int      not null,
  c_comment varchar(100)  
);

create table tc8x_pks_category_contract (
  policy_no int        not null,
  contract_no int      not null,
  cate_id int          not null
);

create table tc8x_pks_category (
  id  int              not null,
  name varchar(100)     not null
);

create table test_rel_person (
  pid    int             not null,
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  bday  date
);

create table test_rel_employee (
  pid    int             not null,
  start_date date 
);

create table test_rel_address (
  pid    int             not null,
  id  int               not null,
  street varchar(30) ,
  city  varchar(30) ,
  state varchar(30) ,
  zip varchar(30) 
);

create table test_rel_payroll (
  pid    int             not null,
  id int               not null,
  holiday int,
  hourly_rate int
);

create table test_master (
  id       numeric(10,0)    not null,
  value1    varchar(200)   not null,
  group_id numeric(10,0)  
);

create table test_detail (
  detail_id  numeric(10,0)  not null,
  master_id  numeric(10,0)  not null,
  value1      varchar(200)  not null
);

create table test_detail2 (
  detail2_id  numeric(10,0)  not null,
  detail_id  numeric(10,0)  not null,
  value1      varchar(200 )  not null
);

create table test_detail3 (
  detail3_id  numeric(10,0)  not null,
  detail_id  numeric(10,0)  not null,
  value1      varchar(200 )  not null
);

create table test_keygen (
  id    int           not null,
  attr  varchar(200)  not null
);

create table test_keygen_ext (
  id   int          not null,
  ext  varchar(200) not null
);

create table test_uuid (
  id    char(30)      not null,
  attr  varchar(200)  not null
);

create table test_uuid_ext (
  id   char(30)     not null,
  ext  varchar(200) not null
);

create table test_seqtable (
  table_name  varchar(200)  not null,
  max_id      int
);

create table test_identity (
--   id int not null generated always as identity,
--   attr varchar(200) not null
-- );

create table test_identity_ext (
--   id int not null generated always as identity,
--   ext varchar(200) not null
-- );

create table tc7x_col (
  id       integer         not null
);

create table tc7x_item (
  iid       integer         not null,
  id      integer           
);

create table tc7x_comp_item (
  iid       integer         not null,
  id      integer
);

create table list_types (
  o_char  CHAR(100),
  o_nchar VARCHAR(100)   ,
  o_varchar VARCHAR(20) ,
  o_varchar2 VARCHAR(20) ,
  o_clob CLOB ,
  o_long BLOB ,
  o_number NUMERIC ,
  o_int   INT ,
  o_date TIMESTAMP ,
  o_raw   BLOB     ,
  o_blob  BLOB         ,
  o_bfile BLOB  
);

create table test_oqltag (
  id1   integer         not null,
  id2   integer         not null
);

create table tc8x_nton_a (
  id         varchar(20)      not null,
  status     int              not null
);

create table tc8x_nton_b (
  id         varchar(20)      not null,
  status     int              not null
);

create table tc7x_depend1(
  id int not null,
  constraint pk_depend1 primary key (id)
);

create table tc7x_master(
  depend1_id int,
  id int not null,
  constraint pk_master primary key (id)
);

create table tc7x_depend2(
  master_id int,
  id int not null,
  constraint pk_depend2 primary key (id)
);

create table tc8x_circ_brother (
	brother_id int not null,
	brother_sibling int,
	constraint pk_brother primary key (brother_id));

create table tc8x_circ_sister (
	sister_id int not null,
	sister_sibling int,
	constraint pk_sister primary key (sister_id));

create table tc8x_lazy_11_chd (
  id        int not null,
  descr     varchar(20) not null
);

create table tc8x_lazy_11_par (
  id        int not null,
  descr     varchar(20) not null,
  child_id  int
);

create table tc8x_lazy_11_author (
  id			int not null,
  first_name		varchar(100) not null,
  last_name		varchar(100) not null
);

create table tc8x_lazy_11_book (
  id			int not null,
  name 			varchar(100) not null,
  author_id		int not null
);

create table tc8x_enum_prod (
  id        int not null,
  name      varchar(200) not null,
  kind      varchar(200) not null
);

create table tc8x_trans_master (
  id        int not null,
  name      varchar(200) not null,
  propty1	int,
  propty2	int,
  propty3	int,
  ent2		int
);

create table tc8x_trans_child1 (
  id        int not null,
  descr     varchar(200) not null
);

create table tc8x_trans_child2 (
  id        int not null,
  descr     varchar(200) not null
);

create table tc8x_self_refer_parent (
  id        int not null,
  fid		int,
  name      varchar(200) not null
);

create table tc8x_self_refer_child (
  id        int not null,
  descr     varchar(200) not null
);

CREATE TABLE tc8x_test_depends_ns (
--   id int NOT NULL key generated always as identity,
--   master_id int NOT NULL default '0',
--   descrip varchar(50) NOT NULL default '',
--   PRIMARY KEY  (id),
--   KEY master_id (master_id)
-- );

CREATE TABLE tc8x_test_master_ns (
--   id int NOT NULL key generated always as identity,
--   descrip varchar(50) NOT NULL default '',
--   PRIMARY KEY  (id)
-- );

CREATE TABLE tc8x_test_depends_ns_nokg (
  id int NOT NULL,
  master_id int NOT NULL,
  descrip varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
);

CREATE TABLE tc8x_test_master_ns_nokg (
  id int NOT NULL,
  descrip varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
);

create table tc8x_parent (
  id        int not null PRIMARY KEY,
  name      varchar(200) not null
);

create table tc8x_child (
  id        int not null PRIMARY KEY,
  descr     varchar(200) not null
);

create table tc8x_parent_compound (
  id1       int not null,
  id2       int not null,
  name      varchar(200) not null,
  PRIMARY KEY (id1, id2)
);

create table tc8x_child_compound (
  id1       int not null,
  id2       int not null,
  descr     varchar(200) not null,
  PRIMARY KEY (id1, id2)
);

create table tc9x_foo (
  id        		int not null,
  field     		varchar(200) not null
);

create table tc9x_bar (
  id        int not null
);

create table tc9x_customer (
	id				int not null,
	description 	varchar(200) not null			
);

create table tc9x_subscription (
	id				int not null,
	createddate		timestamp,
	description		varchar(200),
	customer_id		int not null
);

create table tc9x_supersubscription (
	id			int not null
);

create table tc9x_credit (
	id						int not null,
	balance					int not null,
	supersubscription_id	int not null
);

create table tc9x_poly_ordr (
  id int not null,
  name varchar (20) not null
);

create table tc9x_poly_detail (
  id int not null,
  category varchar (20) not null,
  location varchar (20) not null
);

create table tc9x_poly_owner (
  id int not null,
  name varchar (20) not null,
  product int not null
);

create table tc9x_poly_prod (
  id        int not null,
  name      varchar(200) not null,
  detail	int not null,
  owner		int
);

create table tc9x_poly_computer (
  id   int not null,
  cpu  varchar(200) not null
);

create table tc9x_poly_laptop (
  id   int not null,
  weight  int not null,
  resolution varchar(19) not null
);

create table tc9x_poly_server (
  id   int not null,
  numberOfCPUs  int not null,
  support int not null
);

create table tc9x_poly_car (
  id   int not null,
  kw   int not null,
  make  varchar(200) not null
);

create table tc9x_poly_truck (
  id   int not null,
  max_weight   int not null
);

create table tc9x_poly_prod_multi (
  id1        int not null,
  id2        int not null,
  name      varchar(200) not null
);

create table tc9x_poly_computer_multi (
  id1   int not null,
  id2        int not null,
  cpu  varchar(200) not null
);

create table tc9x_poly_laptop_multi (
  id1   int not null,
  id2        int not null,
  weight  int not null,
  resolution varchar(19) not null
);

create table tc9x_poly_server_multi (
  id1   int not null,
  id2        int not null,
  numberOfCPUs  int not null,
  support int not null
);

create table tc9x_poly_order_product (
  order_id	int not null,
  product_id int not null
);

create table tc9x_poly_table_m (
  id	int not null,
  name	varchar(20) not null
);

create table tc9x_poly_table_n (
  id	int not null,
  name	varchar(20) not null
);

create table tc9x_poly_m_n (
  m_id	int not null,
  n_id int not null
);

CREATE TABLE tc8x_test_depends_ns_nokg (
  id int NOT NULL,
  master_id int NOT NULL default '0',
  descrip varchar(50) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY master_id (master_id)
);

CREATE TABLE tc9x_poly_base (
  id varchar(64) NOT NULL default '',
  color varchar(64) default NULL,
  PRIMARY KEY  (ID)
) ;

CREATE TABLE tc9x_poly_derived (
  id varchar(64) NOT NULL default '',
  scent varchar(64) default NULL,
  PRIMARY KEY  (ID)
) ;

CREATE TABLE tc9x_poly_container (
  id varchar(64) NOT NULL default '',
  reference varchar(64) default NULL,
  PRIMARY KEY  (ID)
) ;

CREATE TABLE tc9x_poly_Product(
  IdProd int not null PRIMARY KEY,
  NameProd   VARCHAR(30) default NULL,
  DescProd   VARCHAR(30) default NULL
);

CREATE TABLE tc9x_poly_ActProduct(
  IdAct int not null PRIMARY KEY REFERENCES tc9x_poly_Product (IdProd),
  BestSeason VARCHAR(30) default NULL
);

CREATE TABLE tc9x_poly_ComposedOffer(
  IdCOffer int not null PRIMARY KEY REFERENCES tc9x_poly_Product (IdProd),
  NameCO   VARCHAR(30) default NULL,
  DescCO   VARCHAR(30) default NULL
);

CREATE TABLE tc9x_poly_OfferComposition(
  Offer NUMERIC(10) not null,
  Product NUMERIC(10) not null, 
  CONSTRAINT unique_rel UNIQUE (Offer, Product)
);

CREATE TABLE tc7x_container (
  id int NOT NULL ,
  name varchar(200) default NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tc7x_container_item (
  id int NOT NULL,
  item int DEFAULT NULL,
  value varchar(200) DEFAULT NULL,
  PRIMARY KEY (id)
);

create table tc7x_sorted_container (
  id        int not null,
  name      varchar(200) not null
);

create table tc7x_sorted_item(
  id        int not null,
  id_1		int not null,
  name      varchar(200) not null
);

create table tc200_self_relation_folder (
  id          int		     	not null,  
  name        varchar(255)    	not null,
  parent_id	  int				DEFAULT null
  
);

create table tc200_self_relation_parent (
  id          int		     	not null,  
  name        varchar(255)    	not null
);

create table tc200_self_relation_extend (
  id          int		     	not null,  
  parent_id	  int				DEFAULT null
);

-- Foreign keys added via ALTER TABLE:
alter table tc7x_master
	add constraint fk_master_depend1
	foreign key (depend1_id) references tc7x_depend1(id);

alter table tc7x_depend2
	add constraint fk_depend2_master
	foreign key (master_id) references tc7x_master(id);

