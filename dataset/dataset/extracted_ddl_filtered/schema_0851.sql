-- Source: https://github.com/facebookincubator/CG-SQL/blob/e6b3188fc69d6e9a19e3edc100e093012de1d108/sources/test/cg_test_query_plan.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 2

CREATE TABLE t1
-- + CREATE TABLE t2
-- + CREATE TABLE t3
-- + CREATE TABLE t4
-- + CREATE TABLE t5
-- + CREATE TABLE scan_ok
-- + CREATE TABLE sql_temp
-- + CREATE TABLE plan_temp
-- + CREATE TABLE no_table_scan
-- + CREATE TABLE ok_table_scan
-- + CREATE TABLE foo
-- + CREATE TABLE foo_
-- + CREATE TABLE _foo
-- +17 CREATE PROC populate_query_plan_%()
-- + CREATE PROC populate_table_scan_alert_table(table_ text not null)
-- + CREATE PROC populate_b_tree_alert_table()
-- + CALL populate_table_scan_alert_table(C.table_name);

create table t1(id int primary key, name text);

create table t2(id int primary key, name text);

create table t3(id int primary key, name text);

create table t4(id long int primary key autoincrement, data blob);

create table t5(id long int, foreign key (id) references t4(id) on update cascade on delete cascade);

create table t6(id int primary key, name text) @delete(1);

create table scan_ok(id int);

create table foo(id int);

create table _foo(id int);

create table foo_(id int);

