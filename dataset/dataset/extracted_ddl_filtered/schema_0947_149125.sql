-- Source: https://github.com/azarAngga/micandroid/blob/aa51bba4e6c35bbaf9b91cf5a290866e26e96756/java_version/examples/LeaveApplicationProcessEx/dbcript/oracle/2_example_tables.sql?raw=true
-- Tables detected: 5 | FK constraints: 1

create table T_BIZ_LeaveApp_TASKINSTANCE (TASKINSTANCE_ID varchar2(50 char) not null, SN varchar2(255 char), APPLICANT varchar2(255 char), leave_days number(10,0), approval_flag number(1,0), from_date varchar2(255 char), to_date varchar2(255 char), primary key (TASKINSTANCE_ID));

create table T_Biz_EmailMock (ID varchar2(50 char) not null, user_Id varchar2(50 char) not null, content varchar2(512 char) not null, create_Time timestamp not null, primary key (ID));

create table T_Biz_LeaveApplicationInfo (ID varchar2(50 char) not null, sn varchar2(50 char) not null unique, leaveReason varchar2(50 char), fromDate varchar2(50 char), toDate varchar2(50 char), leaveDays number(10,0), applicant_Id varchar2(50 char), applicant_Name varchar2(50 char), submitTime varchar2(50 char), approval_Flag number(1,0), approval_Detail varchar2(50 char), approver varchar2(50 char), approval_Time timestamp, primary key (ID));

create table T_Biz_LeaveApprovalInfo (ID varchar2(50 char) not null, sn varchar2(50 char) not null, approver varchar2(50 char), approval_Flag number(1,0), detail varchar2(100 char), approval_Time timestamp, primary key (ID));

create table T_FF_RT_TASKINSTANCE (ID varchar2(50 char) not null, BIZ_TYPE varchar2(250 char) not null, TASK_ID varchar2(300 char) not null, ACTIVITY_ID varchar2(200 char) not null, NAME varchar2(100 char) not null, DISPLAY_NAME varchar2(128 char), STATE number(10,0) not null, SUSPENDED number(1,0) not null, TASK_TYPE varchar2(10 char), CREATED_TIME timestamp not null, STARTED_TIME timestamp, EXPIRED_TIME timestamp, END_TIME timestamp, ASSIGNMENT_STRATEGY varchar2(10 char), PROCESSINSTANCE_ID varchar2(50 char) not null, PROCESS_ID varchar2(100 char) not null, VERSION number(10,0) not null, TARGET_ACTIVITY_ID varchar2(100 char), FROM_ACTIVITY_ID varchar2(600 char), STEP_NUMBER number(10,0) not null, CAN_BE_WITHDRAWN number(1,0) not null, primary key (ID));

-- Foreign keys added via ALTER TABLE:
alter table T_BIZ_LeaveApp_TASKINSTANCE add constraint FK1DED30B872C79ECD foreign key (TASKINSTANCE_ID) references T_FF_RT_TASKINSTANCE;

