-- Source: https://github.com/jorgenio/zksample2/blob/5dce01e2afe1d48a3a486b8e10e34361731a5df1/zkoss/src/main/resources/createSampleData.sql?raw=true
-- Tables detected: 24 | FK constraints: 13

CREATE TABLE hibernate_statistics
(
  id INT8 NOT NULL,
  flushcount integer NOT NULL,
  preparestatementcount integer NOT NULL,
  entityloadcount integer NOT NULL,
  entityupdatecount integer NOT NULL,
  entityinsertcount integer NOT NULL,
  entitydeletecount integer NOT NULL,
  entityfetchcount integer NOT NULL,
  collectionloadcount integer NOT NULL,
  collectionupdatecount integer NOT NULL,
  collectionremovecount integer NOT NULL,
  collectionrecreatecount integer NOT NULL,
  collectionfetchcount integer NOT NULL,
  queryexecutioncount integer NOT NULL,
  queryexecutionmaxtime integer NOT NULL,
  optimisticfailurecount integer NOT NULL,
  queryexecutionmaxtimequerystring text,
  callmethod text NOT NULL,
  javafinishms bigint NOT NULL,
  finishtime TIMESTAMP NOT NULL,
  CONSTRAINT hibernatestatistics_pkey PRIMARY KEY (id)
)
;

CREATE TABLE hibernate_entity_statistics
(
  id INT8 NOT NULL,
  hibernateentitystatisticsid bigint NOT NULL,
  entityname text NOT NULL,
  loadcount integer NOT NULL,
  updatecount integer NOT NULL,
  insertcount integer NOT NULL,
  deletecount integer NOT NULL,
  fetchcount integer NOT NULL,
  optimisticfailurecount integer NOT NULL,
  CONSTRAINT hibernateentitystatistics_pkey PRIMARY KEY (id)
)
;

create table app_news (
   anw_id               INT8                 not null,
   anw_text             VARCHAR(1000)        null,
   anw_date             DATE                 not null,
   version              INT4                 not null default 0,
   constraint PK_APP_NEWS primary key (anw_id)
)
;

create table youtube_link (
   ytb_id               INT8                 not null,
   ytb_interpret        VARCHAR(50)          null,
   ytb_title            VARCHAR(50)          null,
   ytb_url              VARCHAR(250)         not null,
   version              INT4                 not null default 0,
   constraint PK_youtube_link primary key (ytb_id)
)
;

create table Branche (
   bra_id               INT8                 not null,
   bra_nr               VARCHAR(20)          null,
   bra_bezeichnung      VARCHAR(30)          not null,
   version              INT4                 not null default 0,
   constraint PK_BRANCHE primary key (bra_id)
)
;

create table artikel (
   art_id               INT8                 not null,
   art_kurzbezeichnung  VARCHAR(50)          not null,
   art_langbezeichnung  TEXT                 null,
   art_nr               VARCHAR(20)          not null,
   art_preis            NUMERIC(12,2)        not null default 0.00,
   version              INT4                 not null default 0,
   constraint PK_ARTIKEL primary key (art_id)
)
;

create table auftrag (
   auf_id               INT8                 not null,
   auf_kun_id           INT8                 not null,
   auf_nr               varchar(20)          not null,
   auf_bezeichnung      varchar(50)          null,
   version              int4                 not null default 0,
   constraint pk_auftrag primary key (auf_id)
)
;

create table auftragposition (
   aup_id               INT8                 not null,
   aup_auf_id           INT8                 not null,
   art_id               INT8                 null,
   aup_position         int4                 null,
   aup_menge            numeric(12,2)        null,
   aup_einzelwert       numeric(12,2)        null,
   aup_gesamtwert       numeric(12,2)        null,
   version              int4                 not null default 0,
   constraint pk_auftragposition primary key (aup_id)
)
;

create table calendar_event (
   cle_id               INT8                 not null,
   cle_title            VARCHAR(20)          null,
   cle_content          VARCHAR(300)         not null,
   cle_begin_date       TIMESTAMP            not null,
   cle_end_date         TIMESTAMP            not null,
   cle_header_color     VARCHAR(10)          null,
   cle_content_color    VARCHAR(10)          null,
   cle_usr_id           INT8                 not null,
   cle_locked           BOOL                 null default false,
   version              INT4                 not null default 0,
   constraint PK_CALENDAR_EVENT primary key (cle_id)
)
;

create table filiale (
   fil_id               INT8                 not null,
   fil_nr               varchar(20)          not null,
   fil_bezeichnung      varchar(50)          null,
   fil_name1            varchar(50)          null,
   fil_name2            varchar(50)          null,
   fil_ort              varchar(50)          null,
   version              int4                 not null default 0,
   constraint pk_filiale primary key (fil_id)
)
;

create table guestbook (
   gub_id               INT8                 not null,
   gub_subject          VARCHAR(40)          not null,
   gub_date             TIMESTAMP            not null,
   gub_usr_name         VARCHAR(40)          not null,
   gub_text             TEXT                 null,
   version              INT4                 null,
   constraint PK_GUESTBOOK primary key (gub_id)
)
;

create table ipc_ip2country (
   ipc_id               INT8                 not null,
   ipc_ip_from          INT8                 null,
   ipc_ip_to            INT8                 null,
   ipc_country_code2    VARCHAR(2)           null,
   ipc_country_code3    VARCHAR(3)           null,
   ipc_country_name     VARCHAR(50)          null,
   version              INT4                 not null default 0,
   constraint PK_IPC_IP2COUNTRY primary key (ipc_id)
)
;

create table kunde (
   kun_id               INT8                 not null,
   kun_fil_id           INT8                 not null,
   kun_bra_id           INT8                 null,
   kun_nr               VARCHAR(20)          not null,
   kun_matchcode        varchar(20)          null,
   kun_name1            varchar(50)          null,
   kun_name2            varchar(50)          null,
   kun_ort              varchar(50)          null,
   kun_mahnsperre       BOOL                 null,
   version              int4                 not null default 0,
   constraint pk_kunde primary key (kun_id)
)
;

create table log_ip2country (
   i2c_id               INT8                 not null,
   ccd_id               INT8                 null,
   i2c_city             VARCHAR(50)          null,
   i2c_latitude         FLOAT4               null,
   i2c_longitude        FLOAT4               null,
   version              INT4                 null default 0,
   constraint PK_LOG_IP2COUNTRY primary key (i2c_id)
)
;

create table sec_group (
   grp_id               INT8                 not null,
   grp_shortdescription VARCHAR(40)          not null,
   grp_longdescription  VARCHAR(1000)        null,
   version              INT4                 not null default 0,
   constraint PK_SEC_GROUP primary key (grp_id)
)
;

create table sec_groupright (
   gri_id               INT8                 not null,
   grp_id               INT8                 not null,
   rig_id               INT8                 not null,
   version              INT4                 not null default 0,
   constraint PK_SEC_GROUPRIGHT primary key (gri_id)
)
;

create table sec_loginlog (
   lgl_id               INT8                 not null,
   i2c_id               INT8                 null,
   lgl_loginname        VARCHAR(50)          not null,
   lgl_logtime          TIMESTAMP            not null,
   lgl_ip               VARCHAR(19)          null,
   lgl_browsertype      VARCHAR(40)          null,
   lgl_status_id        INT4                 not null,
   lgl_sessionid        VARCHAR(50)          null,
   version              INT4                 not null default 0,
   constraint PK_SEC_LOGINLOG primary key (lgl_id)
)
;

create table sec_right (
   rig_id               INT8                 not null,
   rig_type             INT4                 null default 1,
   rig_name             VARCHAR(50)          not null,
   version              INT4                 not null default 0,
   constraint PK_SEC_RIGHT primary key (rig_id)
)
;

create table sec_role (
   rol_id               INT8                 not null,
   rol_shortdescription VARCHAR(30)          not null,
   rol_longdescription  VARCHAR(1000)        null,
   version              INT4                 not null default 0,
   constraint PK_SEC_ROLE primary key (rol_id)
)
;

create table sec_rolegroup (
   rlg_id               INT8                 not null,
   grp_id               INT8                 not null,
   rol_id               INT8                 not null,
   version              INT4                 not null default 0,
   constraint PK_SEC_ROLEGROUP primary key (rlg_id)
)
;

create table sec_user (
   usr_id               INT8                 not null,
   usr_loginname        VARCHAR(50)          not null,
   usr_password         VARCHAR(50)          not null,
   usr_lastname         VARCHAR(50)          null,
   usr_firstname        VARCHAR(50)          null,
   usr_email            VARCHAR(200)         null,
   usr_locale           VARCHAR(5)           null,
   usr_enabled          BOOL                 not null default FALSE,
   usr_accountNonExpired BOOL                 not null default TRUE,
   usr_credentialsNonExpired BOOL                 not null default TRUE,
   usr_accountNonLocked BOOL                 not null default TRUE,
   usr_token            VARCHAR(20)          null,
   version              INT4                 not null default 0,
   constraint PK_SEC_USER primary key (usr_id)
)
;

create table sec_userrole (
   urr_id               INT8                 not null,
   usr_id               INT8                 not null,
   rol_id               INT8                 not null,
   version              INT4                 not null default 0,
   constraint PK_SEC_USERROLE primary key (urr_id)
)
;

create table sys_countrycode (
   ccd_id               INT8                 not null,
   ccd_name             VARCHAR(48)          null,
   ccd_code2            VARCHAR(2)           not null,
   version              INT4                 null default 0,
   constraint PK_SYS_COUNTRYCODE primary key (ccd_id)
)
;

create table sys_ip4country (
   i4co_id              INT8                 not null,
   i4co_ip              INT8                 null,
   i4co_ccd_id          INT8                 null,
   version              INT4                 null default 0,
   constraint PK_SYS_IP4COUNTRY primary key (i4co_id)
)
;

-- Foreign keys added via ALTER TABLE:
alter table auftrag
   add constraint ref_auf_to_kun foreign key (auf_kun_id)
      references kunde (kun_id)
      on delete cascade on update cascade;

alter table auftragposition
   add constraint ref_aup_to_art foreign key (art_id)
      references artikel (art_id)
      on delete restrict on update restrict;

alter table auftragposition
   add constraint ref_aup_to_auf foreign key (aup_auf_id)
      references auftrag (auf_id)
      on delete cascade on update cascade;

alter table kunde
   add constraint ref_kun_to_bra foreign key (kun_bra_id)
      references Branche (bra_id)
      on delete restrict on update restrict;

alter table kunde
   add constraint ref_kun_to_fil foreign key (kun_fil_id)
      references filiale (fil_id)
      on delete cascade on update cascade;

alter table log_ip2country
   add constraint ref_i2c_to_ccd foreign key (ccd_id)
      references sys_countrycode (ccd_id)
      on delete restrict on update restrict;

alter table sec_groupright
   add constraint ref_gri_to_grp foreign key (grp_id)
      references sec_group (grp_id)
      on delete restrict on update restrict;

alter table sec_groupright
   add constraint ref_gri_to_rig foreign key (rig_id)
      references sec_right (rig_id)
      on delete restrict on update restrict;

alter table sec_loginlog
   add constraint ref_lgl_to_i2c foreign key (i2c_id)
      references log_ip2country (i2c_id)
      on delete cascade on update cascade;

alter table sec_rolegroup
   add constraint ref_rlg_to_grp foreign key (grp_id)
      references sec_group (grp_id)
      on delete restrict on update restrict;

alter table sec_rolegroup
   add constraint ref_rlg_to_rol foreign key (rol_id)
      references sec_role (rol_id)
      on delete restrict on update restrict;

alter table sec_userrole
   add constraint ref_aut_to_rol foreign key (rol_id)
      references sec_role (rol_id)
      on delete restrict on update restrict;

alter table sec_userrole
   add constraint ref_aut_to_usr foreign key (usr_id)
      references sec_user (usr_id)
      on delete restrict on update restrict;

