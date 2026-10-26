-- Source: https://github.com/newton248/spring-core/blob/209815f7623660f1406fa5c5430a469fa1576437/core-spring-5.0.b.RELEASE/rewards-common/target/classes/rewards/testdb/schema.sql?raw=true
-- Tables detected: 6 | FK constraints: 2

create table T_ACCOUNT (ID integer identity primary key, NUMBER varchar(9), NAME varchar(50) not null, unique(NUMBER));

create table T_ACCOUNT_CREDIT_CARD (ID integer identity primary key, ACCOUNT_ID integer, NUMBER varchar(16), unique(ACCOUNT_ID, NUMBER));

create table T_ACCOUNT_BENEFICIARY (ID integer identity primary key, ACCOUNT_ID integer, NAME varchar(50), ALLOCATION_PERCENTAGE decimal(3,2) not null, SAVINGS decimal(8,2) not null, unique(ACCOUNT_ID, NAME));

create table T_RESTAURANT (ID integer identity primary key, MERCHANT_NUMBER varchar(10) not null, NAME varchar(80) not null, BENEFIT_PERCENTAGE decimal(3,2) not null, BENEFIT_AVAILABILITY_POLICY varchar(1) not null, unique(MERCHANT_NUMBER));

create table T_REWARD (ID integer identity primary key, CONFIRMATION_NUMBER varchar(25) not null, REWARD_AMOUNT decimal(8,2) not null, REWARD_DATE date not null, ACCOUNT_NUMBER varchar(9) not null, DINING_AMOUNT decimal not null, DINING_MERCHANT_NUMBER varchar(10) not null, DINING_DATE date not null, unique(CONFIRMATION_NUMBER));

create table DUAL_REWARD_CONFIRMATION_NUMBER (ZERO integer);

-- Foreign keys added via ALTER TABLE:
alter table T_ACCOUNT_CREDIT_CARD add constraint FK_ACCOUNT_CREDIT_CARD foreign key (ACCOUNT_ID) references T_ACCOUNT(ID) on delete cascade;

alter table T_ACCOUNT_BENEFICIARY add constraint FK_ACCOUNT_BENEFICIARY foreign key (ACCOUNT_ID) references T_ACCOUNT(ID) on delete cascade;

