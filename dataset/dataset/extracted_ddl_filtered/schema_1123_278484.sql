-- Source: https://github.com/vkscorpio3/atg_training/blob/b9644bbb0cd0ff3e4e929d8d0a9b47fd520fee19/workspace/modules/ClothingStoreCA/build/atgsql/DAS/sql/db_components/oracle/create_staff_ddl.sql?raw=true
-- Tables detected: 3 | FK constraints: 1

create table das_account (
	account_name	varchar2(254)	not null,
	type	integer	not null,
	first_name	varchar2(254)	null,
	last_name	varchar2(254)	null,
	password	varchar2(254)	null,
	description	varchar2(254)	null,
	lastpwdupdate	date	null,
	password_kdf	varchar2(250)	null
,constraint das_account_p primary key (account_name));

create table das_group_assoc (
	account_name	varchar2(254)	not null,
	sequence_num	integer	not null,
	group_name	varchar2(254)	not null
,constraint das_grp_asc_p primary key (account_name,sequence_num));

create table das_acct_prevpwd (
	account_name	varchar2(254)	not null,
	seq_num	number(10)	not null,
	prevpwd	varchar2(70)	null
,constraint das_prevpwd_p primary key (account_name,seq_num)
,constraint das_prvpwd_d_f foreign key (account_name) references das_account (account_name));

