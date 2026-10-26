-- Source: https://github.com/farnulfo/castor/blob/974f853be5680427a195a6b8ae3ce63a65a309b6/castor/tags/1.3rc1/cpactf/src/old/ddl/postgres.sql?raw=true
-- Tables detected: 120 | FK/REFERENCES mentions: 8

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
  id         integer                        not null,
  ctime      timestamp without time zone    not null,
  mtime      timestamp without time zone    null,
  value1     varchar(200)                   not null,
  parent_id  integer                        null,
  group_id   numeric(10,0)                  not null
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
  id              numeric(10,0)                  not null,
  tdt             timestamp without time zone    not null,
  ttm             timestamp without time zone    not null,
  int_val         integer                        null,
  float_val       float                          null,
  real_val        real                           null,
  long_val        bigint                         null,
  char_val        char(1)                        null,
  bool_val        char(1)                        null,
  bool_is_method  char(1)                        null,
  int_date        integer                        null,
  str_time        varchar(40)                    null,
  num_date        numeric(17,0)                  null,
  long_date       numeric(20,0)                  null
);

create table tc1x_lob (
  id         numeric(10,0)  not null,
  blob_val   bytea          null,
  clob_val   text           null,
  clob_val2  text           null
);

create table tc1x_conv (
    id                 int          not null,
    bool_int           int          null,
    bool_int_minus     int          null,
    bool_bigdec        numeric      null,
    bool_bigdec_minus  numeric      null,
    byte_int           int          null,
    short_int          int          null,
    long_int           int          null,
    double_int         int          null,
    float_int          float        null,
    int_bigdec         numeric      null,
    float_bigdec       numeric      null,
    double_bigdec      numeric      null,
    int_string         varchar(20)  null,
    long_string        varchar(20)  null,
    bigdec_string      varchar(20)  null,
    float_string       varchar(20)  null,
    double_string      varchar(20)  null
);

create table tc1x_serial (
  id      integer        not null,
  dep     bytea          null
);

create table tc1x_rollback (
  id      numeric(10,0)  not null,
  value1  varchar(200)   not null,
  value2  varchar(200), 
  numb     numeric(10,0)
);

create table tc1x_pks_person (
  fname  varchar(15)                    not null,
  lname  varchar(15)                    not null,
  bday   timestamp without time zone    null
);

create table tc1x_pks_employee (
  fname       varchar(15)                    not null,
  lname       varchar(15)                    not null,
  start_date  timestamp without time zone    null
);

create table tc1x_pks_payroll (
  fname        varchar(15)  not null,
  lname        varchar(15)  not null,
  id           int          not null,
  holiday      int,
  hourly_rate  int
);

create table tc1x_pks_address (
  fname   varchar(15)    not null,
  lname   varchar(15)    not null,
  id      int            not null,
  street  varchar(30)    null,
  city    varchar(30)    null,
  state   varchar(2)     null,
  zip     varchar(6)     null
);

create table tc1x_pks_contract (
  fname        varchar(15)  not null,
  lname        varchar(15)  not null,
  policy_no    int          not null,
  contract_no  int          not null,
  c_comment    varchar(90)  null
);

create table tc1x_pks_category_contract (
  policy_no    int      not null,
  contract_no  int      not null,
  cate_id      int      not null
);

create table tc1x_pks_category (
  id    int             not null,
  name  varchar(20)     not null
);

create table tc2x_master (
  id        numeric(10,0)  not null,
  value1    varchar(200)   not null,
  group_id  numeric(10,0)  null
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
  depend1_id  int ,
  id          int not null primary key
);

create table tc2x_depend2 (
  master_id   int,
  id          int not null primary key
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
  id    SERIAL,
  attr  varchar(200) not null
);

create table tc2x_identity_ext (
  id   integer not null,
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
  value3  varchar(200) null,
  value4  varchar(200) null
);

create table tc3x_call (
  id      int          not null,
  value1  varchar(200) not null,
  value2  varchar(200) null
);

create table tc3x_group (
  id      numeric(10,0)  not null,
  value1  varchar(200)   not null
);

create table tc3x_persistent (
  id        integer                       not null,
  ctime     timestamp without time zone   not null,
  mtime     timestamp without time zone   null,
  value1    varchar(200)                  not null,
  parent_id integer                       null,
  group_id  numeric(10,0)                 not null
);

create table tc3x_related (
  id          integer     not null,
  persist_id  integer     not null
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

create table tc7x_group_person (
  gid int         not null,
  pid int        not null
);

create table tc7x_many_group (
  gid       int           not null,
  value1    varchar(100)  not null
);

create table tc7x_many_person (
   pid      int          not null,
   value1   varchar(100) not null,
   helloworld varchar(100) null,
   sthelse varchar(100) null
);

create table list_types (
  o_char  CHAR(100)         null,
  o_nchar NATIONAL CHAR(100)   null,
  o_varchar VARCHAR(20) null,
  o_varchar2 VARCHAR(20) null,
  o_clob text null,
  o_long oid null,
  o_number NUMERIC null,
  o_int   INT null,
  o_date timestamp without time zone null,
  o_raw   oid     null,
  o_blob  oid         null,
  o_bfile oid  null
);

create table tc7x_col (
  id       integer         not null
);

create table tc7x_item (
  iid       integer         not null,
  id      integer         null
);

create table tc7x_comp_item (
  iid       integer         not null,
  id      integer
);

create table test_oqltag (
  id1   integer         not null,
  id2   integer         not null
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
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  bday  timestamp without time zone null
);

create table tc8x_pks_employee (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  start_date timestamp without time zone null
);

create table tc8x_pks_project (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  id    int             not null,
  name  varchar(100)
);

create table tc8x_pks_payroll (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  id int               not null,
  holiday int,
  hourly_rate int
);

create table tc8x_pks_address (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  id int               not null,
  street varchar(30)    null,
  city  varchar(30)    null,
  state varchar(2)     null,
  zip varchar(6)       null
);

create table tc8x_pks_contract (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  policy_no int        not null,
  contract_no int      not null,
  c_comment varchar(90)  null
);

create table tc8x_pks_category_contract (
  policy_no int        not null,
  contract_no int      not null,
  cate_id int          not null
);

create table tc8x_pks_category (
  id  int              not null,
  name varchar(20)     not null
);

create table tc8x_nton_a (
  id         varchar(20)    not null,
  status     integer        not null
);

create table tc8x_nton_b (
  id         varchar(20)    not null,
  status     integer        not null
);

create table tc7x_depend1(
  id int not null primary key
);

create table tc7x_master(
  depend1_id int ,
  id int not null primary key
);

create table tc7x_depend2(
  master_id int,
  id int not null primary key
);

create table tc8x_circbrother (
	brother_id int not null,
	brother_sibling int,
	primary key (brother_id));

create table tc8x_circsister (
	sister_id int not null,
	sister_sibling int,
	primary key (sister_id));

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

create table tc8x_test_depends_ns (
  id SERIAL,
  master_id int NOT NULL,
  descrip varchar(50) NOT NULL,
  constraint prim_depends_id primary key (id)
);

create table tc8x_test_master_ns (
  id SERIAL,
  descrip varchar(50) NOT NULL,
  constraint prim_master_id primary key (id)
);

create table tc8x_test_depends_ns_nokg (
  id int NOT NULL,
  master_id int NOT NULL,
  descrip varchar(50) NOT NULL,
  constraint prim_depends_nopk_id primary key (id)
);

create table tc8x_test_master_ns_nokg (
  id int NOT NULL,
  descrip varchar(50) NOT NULL,
  constraint prim_master_nopk_id primary key (id)
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

create table tc9x_poly_base (
  id varchar(64) not null,
  color varchar(64) null,
  primary key  (ID)
) ;

create table tc9x_poly_derived (
  id varchar(64) not null,
  scent varchar(64) null,
  primary key  (ID)
);

create table tc9x_poly_container (
  id varchar(64) not null,
  reference varchar(64) null,
  primary key  (ID)
);

create table tc9x_poly_Product(
  IdProd int primary key,
  NameProd   varchar(30) null,
  DescProd   varchar(30) null
);

create table tc9x_poly_ActProduct(
  IdAct int primary key,
  BestSeason varchar(30) null
);

create table tc9x_poly_ComposedOffer(
  IdCOffer numeric(10) primary key,
  NameCO   varchar(30) null,
  DescCO   varchar(30) null
);

create table tc9x_poly_OfferComposition(
  Offer numeric(10),
  Product numeric(10), 
  constraint unique_rel unique (Offer, Product) 
);

CREATE TABLE tc9x_poly_extend_object (
  id            int NOT NULL ,
  description2  varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tc9x_poly_base_object (
  id           int NOT NULL ,
  description  varchar(50) NOT NULL,
  saved        char(1),
  PRIMARY KEY (id)
);

CREATE TABLE tc9x_poly_depend_object (
  id           int NOT NULL,
  parentId     int NOT NULL,
  description  varchar(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tc7x_container (
  id int NOT NULL,
  name varchar(200) NULL,
  PRIMARY KEY (id)
);

CREATE TABLE tc7x_container_item (
  id int NOT NULL,
  item int default NULL,
  value varchar(200) NULL,
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
  parent_id	  int				null
  
);

create table tc200_self_relation_parent (
  id          int		     	not null,  
  name        varchar(255)    	not null
);

create table tc200_self_relation_extend (
  id          int		     	not null,  
  parent_id	  int				null
);

-- Foreign keys added via ALTER TABLE:
alter table tc2x_depend_master
  add constraint tc2x_master_depend1
  foreign key ( depend1_id ) references tc2x_depend1 ( id );

alter table tc2x_depend2
  add constraint tc2x_depend2_master
  foreign key ( master_id ) references tc2x_depend_master ( id );

alter table tc7x_master
	add constraint fk_master_depend1
	foreign key (depend1_id) references tc7x_depend1(id);

alter table tc7x_depend2
	add constraint fk_depend2_master
	foreign key (master_id) references tc7x_master(id);

