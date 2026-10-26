-- Source: https://github.com/codehaus/castor/blob/974f853be5680427a195a6b8ae3ce63a65a309b6/castor/tags/TAG_1_0_M4/castor/src/tests/jdo/mysql.sql?raw=true
-- Tables detected: 113 | FK/REFERENCES mentions: 10

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
  id        integer       not null,
  ctime     datetime      not null,
  mtime     datetime      null,
  value1    varchar(200)  not null,
  parent_id integer       null,
  group_id  numeric(10,0) not null
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
  tdt            datetime       not null,
  ttm            datetime       not null,
  int_val        integer        null,
  float_val      float          null, 
  real_val       real           null,
  long_val       bigint         null,
  char_val       char(1)        null,
  bool_val       char(1)        null,
  bool_is_method char(1)        null,
  int_date       integer        null,
  str_time       char(23)       null,
  num_date       bigint         null,
  date_str       datetime       null,
  long_date      numeric(20,0)  null
);

create table tc1x_lob (
  id        numeric(10,0)  not null,
  blob_val  longblob           null,
  clob_val  longtext           null,
  blob_val2 longblob           null,
  clob_val2 longtext           null
);

create table tc1x_conv (
    id                 int         not null,
    bool_byte          int         null,
    bool_short         int         null,
    bool_short_minus   int         null,
    bool_int           int         null,
    bool_int_minus     int         null,
    bool_bigdec        numeric     null,
    bool_bigdec_minus  numeric     null,
    byte_int           int         null,
    short_int          int         null,
    long_int           int         null,
    double_int         int         null,
    float_int          float       null,
    byte_bigdec        numeric     null,
    short_bigdec       numeric     null,
    int_bigdec         numeric     null,
    float_bigdec       numeric     null,
    double_bigdec      numeric     null,
    short_string       varchar(20) null,
    byte_string        varchar(20) null,
    int_string         varchar(20) null,
    long_string        varchar(20) null,
    bigdec_string      varchar(20) null,
    float_string       varchar(20) null,
    double_string      varchar(20) null
);

create table tc1x_serial (
  id      integer        not null,
  dep     longblob       null
);

create table tc1x_rollback (
  id      numeric(10,0) not null,
  value1  varchar(200)  not null,
  value2  varchar(200),
  numb     numeric(10,0)
);

create table tc1x_pks_person (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  bday  datetime       null
);

create table tc1x_pks_employee (
  fname      varchar(15)    not null,
  lname      varchar(15)    not null,
  start_date datetime       null
);

create table tc1x_pks_payroll (
  fname       varchar(15)  not null,
  lname       varchar(15)  not null,
  id          int          not null,
  holiday     int          not null,
  hourly_rate int          not null
);

create table tc1x_pks_address (
  fname   varchar(15)  not null,
  lname   varchar(15)  not null,
  id      int          not null,
  street  varchar(30)  null,
  city    varchar(30)  null,
  state   varchar(2)   null,
  zip     varchar(6)   null
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

create table tc1x_entity1 (
  id        int not null PRIMARY KEY,
  name      varchar(200) not null
);

create table tc1x_child (
  id        int not null PRIMARY KEY,
  descr     varchar(200) not null
);

create table tc1x_entity_compound (
  id1       int not null,
  id2       int not null,
  name      varchar(200) not null,
  PRIMARY KEY (id1, id2)
);

create table tc1x_child_compound (
  id1       int not null,
  id2       int not null,
  descr     varchar(200) not null,
  PRIMARY KEY (id1, id2)
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
  id          int not null primary key,
  depend1_id  int,
  index tc2x_master_depend1 ( depend1_id ),
  foreign key ( depend1_id ) references tc2x_depend1 ( id )
);

create table tc2x_depend2 (
  id          int not null primary key,
  master_id   int,
  index tc2x_depend2_master ( master_id ),
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
  id    integer not null primary key auto_increment,
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

create table test_table (
  id      int           not null,
  value1  varchar(200)  not null,
  value2  varchar(200)
);

create table test_group_person (
  gid int         not null,
  pid int        not null 
);

create table test_many_group (
  gid       int           not null,
  value1    varchar(100)  not null
);

create table test_many_person (
   pid      int          not null,
   value1   varchar(100) not null,
   helloworld varchar(100) null,
   sthelse varchar(100) null
);

create table test_pks_person (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  bday  datetime null
);

create table test_pks_employee (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  start_date datetime null
);

create table test_pks_payroll (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  id int               not null,
  holiday int,
  hourly_rate int
);

create table test_pks_project (
  fname varchar(100)    not null,
  lname varchar(100)    not null,
  id    int             not null,
  name  varchar(100)
);

create table test_pks_address (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  id int               not null,
  street varchar(30)    null,
  city  varchar(30)    null,
  state varchar(2)     null,
  zip varchar(6)       null
);

create table test_pks_contract (
  fname varchar(15)    not null,
  lname varchar(15)    not null,
  policy_no int        not null,
  contract_no int      not null,
  c_comment varchar(90)  null
);

create table test_pks_category_contract (
  policy_no int        not null,
  contract_no int      not null,
  cate_id int          not null
);

create table test_pks_category (
  id  int              not null,
  name varchar(20)     not null
);

create table test_table_ex (
  id      int          not null,
  value1  varchar(200) not null,
  value2  varchar(200) null
);

create table test_table_extends (
  id      int          not null,
  value3  varchar(200) null,
  value4  varchar(200) null
);

create table test_group (
  id     numeric(10,0)  not null,
  value1  varchar(200)  not null
);

create table list_types (
  o_char  CHAR(100)         null,
  o_nchar NATIONAL CHAR(100)   null,
  o_varchar VARCHAR(20) null,
  o_varchar2 VARCHAR(20) null,
  o_clob LONGTEXT null,
  o_long LONGBLOB null,
  o_number NUMERIC null,
  o_int   INT null,
  o_date datetime null,
  o_raw   TINYBLOB     null,
  o_blob  BLOB         null,
  o_bfile MEDIUMBLOB  null
);

create table test_persistent (
  id       integer         not null,
  ctime    datetime            not null,
  mtime    datetime            null,
  value1    varchar(200)    not null,
  parent_id integer        null,
  group_id numeric(10,0)   not null
);

create table test_related (
  id          integer     not null,
  persist_id  integer     not null
);

create table test_col (
  id       integer         not null,
  dum    integer    null
);

create table test_item (
  iid       integer         not null,
  id      integer         not null
);

create table test_comp_item (
  iid       integer         not null,
  id      integer         not null
);

create table test_oqlext (
  ident   integer         not null,
  ext     integer         not null
);

create table test_oqlext2 (
  id      integer         not null,
  ext     integer         not null
);

create table test_oqltag (
  id1   integer         not null,
  id2   integer         not null
);

create table test_nton_a (
  id         varchar(20)    not null,
  status     integer        not null
);

create table test_nton_b (
  id         varchar(20)    not null,
  status     integer        not null
);

create table depend1(
  id int not null primary key
);

create table master(
  depend1_id int ,
  id int not null primary key,
  index idx_master_depend1 (depend1_id),
  foreign key (depend1_id) references depend1(id)
);

create table depend2(
  master_id int,
  id int not null primary key,
  index idx_depend2_master (master_id),
  foreign key (master_id) references master(id)
);

create table lazy_11_chd (
  id        int not null,
  descr     varchar(20) not null
);

create table lazy_11_par (
  id        int not null,
  descr     varchar(20) not null,
  child_id  int
);

create table lazy_11_author (
  id			bigint not null,
  first_name	varchar(100) not null,
  last_name		varchar(100) not null
);

create table lazy_11_book (
  id			bigint not null,
  name 			varchar(100) not null,
  author_id		bigint not null
);

create table enum_prod (
  id        int not null,
  name      varchar(200) not null,
  kind      varchar(200) not null
);

create table trans_master (
  id        int not null,
  name      varchar(200) not null,
  propty1	int,
  propty2	int,
  propty3	int,
  ent2		int
);

create table trans_child1 (
  id        int not null,
  descr     varchar(200) not null
);

create table trans_child2 (
  id        int not null,
  entityOneId int not null,
  descr     varchar(200) not null
);

create table tc7x_self_refer_parent (
  id        int not null primary key,
  fid		int,
  name      varchar(200) not null
);

create table tc7x_self_refer_child (
  id        int not null primary key,
  descr     varchar(200) not null
);

CREATE TABLE IF NOT EXISTS tc8x_test_depends_ns (
  id int(11) NOT NULL auto_increment,
  master_id int(11) NOT NULL default '0',
  descrip varchar(50) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY master_id (master_id)
);

CREATE TABLE IF NOT EXISTS tc8x_test_master_ns (
  id int(11) NOT NULL auto_increment,
  descrip varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
);

CREATE TABLE IF NOT EXISTS tc8x_test_depends_ns_nokg (
  id int(11) NOT NULL,
  master_id int(11) NOT NULL default '0',
  descrip varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
);

CREATE TABLE IF NOT EXISTS tc8x_test_master_ns_nokg (
  id int(11) NOT NULL,
  descrip varchar(50) NOT NULL default '',
  PRIMARY KEY  (id)
);

create table poly_ordr (
  id int not null,
  name varchar (20) not null
);

create table poly_detail (
  id int not null,
  category varchar (20) not null,
  location varchar (20) not null
);

create table poly_owner (
  id int not null,
  name varchar (20) not null,
  product int not null
);

create table poly_prod (
  id        int not null,
  name      varchar(200) not null,
  detail	int not null,
  owner		int
);

create table poly_computer (
  id   int not null,
  cpu  varchar(200) not null
);

create table poly_laptop (
  id   int not null,
  weight  int not null,
  resolution varchar(19) not null
);

create table poly_server (
  id   int not null,
  numberOfCPUs  int not null,
  support int not null
);

create table poly_car (
  id   int not null,
  kw   int not null,
  make  varchar(200) not null
);

create table poly_truck (
  id   int not null,
  max_weight   int not null
);

create table poly_prod_multi (
  id1        int not null,
  id2        int not null,
  name      varchar(200) not null,
  detail	int not null
);

create table poly_computer_multi (
  id1   int not null,
  id2        int not null,
  cpu  varchar(200) not null
);

create table poly_laptop_multi (
  id1   int not null,
  id2        int not null,
  weight  int not null,
  resolution varchar(19) not null
);

create table poly_server_multi (
  id1   int not null,
  id2        int not null,
  numberOfCPUs  int not null,
  support int not null
);

create table poly_order_product (
  order_id	int not null,
  product_id int not null
);

create table poly_table_m (
  id	int not null,
  name	varchar(20) not null
);

create table poly_table_n (
  id	int not null,
  name	varchar(20) not null
);

create table poly_m_n (
  m_id	int not null,
  n_id int not null
);

CREATE TABLE poly_base (
  id varchar(64) NOT NULL default '',
  color varchar(64) default NULL,
  PRIMARY KEY  (ID)
) ;

CREATE TABLE poly_derived (
  id varchar(64) NOT NULL default '',
  scent varchar(64) default NULL,
  PRIMARY KEY  (ID)
) ;

CREATE TABLE poly_container (
  id varchar(64) NOT NULL default '',
  reference varchar(64) default NULL,
  PRIMARY KEY  (ID)
) ;

CREATE TABLE poly_Product(
  IdProd NUMERIC(10) PRIMARY KEY,
  NameProd   VARCHAR(30) NULL,
  DescProd   VARCHAR(30) NULL);

CREATE TABLE poly_ActProduct(
  IdAct NUMERIC(10) PRIMARY KEY REFERENCES Product (IdProd),
  BestSeason VARCHAR(30) NULL);

CREATE TABLE poly_ComposedOffer(
  IdCOffer NUMERIC(10) PRIMARY KEY REFERENCES Product (IdProd),
  NameCO   VARCHAR(30) NULL,
  DescCO   VARCHAR(30) NULL);

CREATE TABLE poly_OfferComposition(
  Offer NUMERIC(10),
  Product NUMERIC(10), 
  CONSTRAINT unique_rel UNIQUE (Offer, Product) );

CREATE TABLE poly_extend_object (
  id            int NOT NULL default '0',
  description2  varchar(50) NOT NULL default '',
  PRIMARY KEY (id)
);

CREATE TABLE poly_base_object (
  id           int NOT NULL default '0',
  description  varchar(50) NOT NULL default '',
  saved        char(1) default '0',
  PRIMARY KEY (id)
);

CREATE TABLE poly_depend_object (
  id           int NOT NULL default '0',
  parentId           int NOT NULL default '0',
  description  varchar(50) NOT NULL default '',
  PRIMARY KEY (id)
);

CREATE TABLE container (
  id int(11) unsigned NOT NULL auto_increment,
  name varchar(200) NULL,
  prop int(11) unsigned default NULL,
  PRIMARY KEY  (id)
);

CREATE TABLE container_item (
  id int(11) unsigned NOT NULL auto_increment,
  item int(11) unsigned default NULL,
  value varchar(200) NULL,
  PRIMARY KEY  (id)
);

create table sorted_container (
  id        int not null,
  name      varchar(200) not null
);

create table sorted_item(
  id        int not null,
  id_1		int not null,
  name      varchar(200) not null
);

