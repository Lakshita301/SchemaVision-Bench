-- Source: https://github.com/linpiaohsin/mixed_projects/blob/e3f2da2ec6f232dbd139eca75a5433dae2911500/gmsys/db/%E9%9B%86%E5%9B%A2%E4%BF%A1%E6%81%AF%E5%8C%96%E7%AE%A1%E7%90%86%E7%B3%BB%E7%BB%9F(oracle).sql?raw=true
-- Tables detected: 17 | FK constraints: 21

create table AREA
(
  areaid   NUMBER not null,
  areaname NVARCHAR2(50) not null,
  relative NUMBER
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table CATEGORY
(
  cid   NUMBER(9) not null,
  cname VARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table DEPARTMENT
(
  departid   NUMBER not null,
  departname NVARCHAR2(20) not null,
  areaid     NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table BALANCE
(
  bid      NUMBER not null,
  bname    VARCHAR2(50) not null,
  bcount   NUMBER(7) not null,
  price    NUMBER(7,2) not null,
  bdate    DATE not null,
  cid      NUMBER not null,
  departid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table PROVIDER
(
  provid   NUMBER not null,
  provname VARCHAR2(50) not null,
  address  VARCHAR2(50) not null,
  phone    VARCHAR2(20) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table BUY
(
  buyid    NUMBER not null,
  buycount NUMBER(7) not null,
  buytime  DATE not null,
  provid   NUMBER not null,
  departid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table REPAIR
(
  repairid NUMBER not null,
  rcount   NUMBER(7) not null,
  rtime    DATE not null,
  departid NUMBER not null,
  bid      NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table SCRAP
(
  sid      NUMBER not null,
  scount   NUMBER(7) not null,
  stime    DATE not null,
  bid      NUMBER not null,
  departid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table TRANSLATE
(
  tid      NUMBER not null,
  tcount   NUMBER(7) not null,
  trtime   DATE not null,
  bid      NUMBER not null,
  departid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table CHECKBALANCE
(
  chid     NUMBER not null,
  buyid    NUMBER not null,
  bid      NUMBER not null,
  repairid NUMBER not null,
  sid      NUMBER not null,
  tid      NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table DEMO
(
  id   NUMBER,
  name NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table PRIVILEGELIST
(
  pid      NUMBER not null,
  pname    NVARCHAR2(50) not null,
  purl     NVARCHAR2(255),
  parentid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table PRODUCT
(
  prodid    NUMBER not null,
  prodname  VARCHAR2(50) not null,
  prodcount NUMBER(7) not null,
  provid    NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table ROLELIST
(
  rid   NUMBER not null,
  rname NVARCHAR2(50) not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table ROLEPRIVILEGE
(
  rpid NUMBER not null,
  rid  NUMBER not null,
  pid  NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table T_USER
(
  user_id   NUMBER not null,
  user_name NVARCHAR2(20),
  user_age  NVARCHAR2(20)
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

create table USERACCOUNT
(
  userid   NUMBER not null,
  username NVARCHAR2(20) not null,
  accounts NVARCHAR2(20) not null,
  password NVARCHAR2(32) not null,
  sex      NVARCHAR2(20) not null,
  age      DATE not null,
  phone    NVARCHAR2(20) not null,
  ragedate DATE not null,
  rid      NUMBER not null,
  departid NUMBER not null
)
tablespace USERS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

-- Foreign keys added via ALTER TABLE:
alter table DEPARTMENT
  add constraint FK_DEPARTMENT_AREA foreign key (AREAID)
  references AREA (AREAID);

alter table BALANCE
  add constraint FK_BALANCE_CATEGORY foreign key (CID)
  references CATEGORY (CID);

alter table BALANCE
  add constraint FK_BALANCE_DEPARTMENT foreign key (DEPARTID)
  references DEPARTMENT (DEPARTID);

alter table BUY
  add constraint FK_BUY_DEPARTMENT_DEPARTID foreign key (DEPARTID)
  references DEPARTMENT (DEPARTID);

alter table BUY
  add constraint FK_BUY_PROVIDER_PROVID foreign key (PROVID)
  references PROVIDER (PROVID);

alter table REPAIR
  add constraint FK_REPAIR_BALANCE_BID foreign key (BID)
  references BALANCE (BID);

alter table REPAIR
  add constraint FK_REPAIR_DEPARTMENT_DEPARTID foreign key (DEPARTID)
  references DEPARTMENT (DEPARTID);

alter table SCRAP
  add constraint FK_SCRAP_BALANCE_BID foreign key (BID)
  references BALANCE (BID);

alter table SCRAP
  add constraint FK_SCRAP_DEPARTMENT_DEPARTID foreign key (DEPARTID)
  references DEPARTMENT (DEPARTID);

alter table TRANSLATE
  add constraint FK_TRANSLATE_BALANCE_BID foreign key (BID)
  references BALANCE (BID);

alter table TRANSLATE
  add constraint FK_TRANSLATE_DEPARTMENT foreign key (DEPARTID)
  references DEPARTMENT (DEPARTID);

alter table CHECKBALANCE
  add constraint FK_CHECKBALANCE_BALANCE_BID foreign key (BID)
  references BALANCE (BID);

alter table CHECKBALANCE
  add constraint FK_CHECKBALANCE_BUY_BUYID foreign key (BUYID)
  references BUY (BUYID);

alter table CHECKBALANCE
  add constraint FK_CHECKBALANCE_REPAIR foreign key (REPAIRID)
  references REPAIR (REPAIRID);

alter table CHECKBALANCE
  add constraint FK_CHECKBALANCE_SCRAP_SID foreign key (SID)
  references SCRAP (SID);

alter table CHECKBALANCE
  add constraint FK_CHECKBALANCE_SCRAP_TID foreign key (TID)
  references TRANSLATE (TID);

alter table PRODUCT
  add constraint FK_PRODUCT_PROVIDER_PROVID foreign key (PROVID)
  references PROVIDER (PROVID);

alter table ROLEPRIVILEGE
  add constraint FK_ROLEPRIVILEGE_PRIVILEGELIST foreign key (PID)
  references PRIVILEGELIST (PID);

alter table ROLEPRIVILEGE
  add constraint FK_ROLEPRIVILEGE_ROLELIST foreign key (RID)
  references ROLELIST (RID);

alter table USERACCOUNT
  add constraint FK_USERACCOUNT_DEPARTMENT foreign key (DEPARTID)
  references DEPARTMENT (DEPARTID);

alter table USERACCOUNT
  add constraint FK_USERACCOUNT_ROLELIST foreign key (RID)
  references ROLELIST (RID);

