-- Source: https://github.com/JayawardanaJTH/Timetable-Manager/blob/f81434c221861f1cfb4266b72ba6e6ee7bde71ce/timetable.sql?raw=true
-- Tables detected: 33 | FK/REFERENCES mentions: 2

CREATE TABLE academic_year_and_semester (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  yNs varchar(45) DEFAULT NULL
);

CREATE TABLE `all_details` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `yNs` varchar(45) DEFAULT NULL,
  `dp` varchar(45) DEFAULT NULL,
  `gNo` varchar(10) DEFAULT NULL,
  `gId` varchar(45) DEFAULT NULL,
  `sGid` varchar(45) DEFAULT NULL
) ;

CREATE TABLE `building` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` varchar(20) DEFAULT NULL
) ;

CREATE TABLE `center` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` varchar(50)
) ;

CREATE TABLE `degree_program` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `dp` varchar(45) DEFAULT NULL
) ;

CREATE TABLE `faculty` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` varchar(50) 
) ;

CREATE TABLE `department` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` varchar(50) ,
  `faculty` INTEGER ,
 
  CONSTRAINT `id` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;

CREATE TABLE `generated_group_id` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `gId` varchar(45) DEFAULT NULL,
  `yNsId` varchar(10) DEFAULT NULL,
  `dpId` varchar(10) DEFAULT NULL,
  `gnoId` varchar(10) DEFAULT NULL
) ;

CREATE TABLE `generated_sub_group_id` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `sGno` varchar(10) DEFAULT NULL,
  `sGid` varchar(50) DEFAULT NULL,
  `gId` varchar(10) DEFAULT NULL
) ;

CREATE TABLE `group_number` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `gNo` varchar(45) DEFAULT NULL
) ;

CREATE TABLE `lecturer` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `emp_id` varchar(45) DEFAULT NULL,
  `faculty` varchar(45) DEFAULT NULL,
  `department` varchar(45) DEFAULT NULL,
  `center` varchar(45) DEFAULT NULL,
  `building` varchar(45) DEFAULT NULL,
  `level` varchar(45) DEFAULT NULL,
  `rank` varchar(45) DEFAULT NULL
) ;

CREATE TABLE `level` (
  `id` INTEGER PRIMARY KEY,
  `name` varchar(20) 
) ;

CREATE TABLE `reservedrooms` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `room` varchar(10) DEFAULT NULL,
  `stime` varchar(10) DEFAULT NULL,
  `etime` varchar(10) DEFAULT NULL
) ;

CREATE TABLE `room` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ;

CREATE TABLE `roomsforatag` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `tag` varchar(10) DEFAULT NULL,
  `room` varchar(10) DEFAULT NULL
) ;

CREATE TABLE `roomsforconssession` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `room` varchar(10) DEFAULT NULL,
  `consSession` varchar(10) DEFAULT NULL
) ;

CREATE TABLE `roomsforgroup` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `room` varchar(10) DEFAULT NULL,
  `groups` varchar(20) DEFAULT NULL
) ;

CREATE TABLE `roomsforlecturer` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `room` varchar(10) DEFAULT NULL,
  `lecturer` varchar(50) DEFAULT NULL
) ;

CREATE TABLE `roomsforsession` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `room` varchar(10) DEFAULT NULL,
  `session` varchar(10) DEFAULT NULL
) ;

CREATE TABLE `roomssubtags` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `tag` varchar(10) DEFAULT NULL,
  `room` varchar(10) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL
) ;

CREATE TABLE `session` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `subject` varchar(20) DEFAULT NULL,
  `sub_code` varchar(20) DEFAULT NULL,
  `tag` varchar(10) DEFAULT NULL,
  `tag_duration` INTEGER DEFAULT NULL,
  `group_id` varchar(20) DEFAULT NULL,
  `subgroup_id` varchar(20) DEFAULT NULL,
  `stu_count` INTEGER DEFAULT NULL
) ;

CREATE TABLE `session_lec` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `session_id` INTEGER DEFAULT NULL,
  `lec_id` varchar(20) DEFAULT NULL
) ;

CREATE TABLE `sp2_consecutive_session` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `sGid` varchar(10) DEFAULT NULL,
  `cSession` varchar(10) DEFAULT NULL,
  `sessionID` varchar(20) DEFAULT NULL
) ;

CREATE TABLE `sp2_group_wise` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `gId` varchar(10) DEFAULT NULL,
  `day` varchar(20) DEFAULT NULL,
  `time_from` char(5) DEFAULT NULL,
  `time_to` char(5) DEFAULT NULL
) ;

CREATE TABLE `sp2_lecturers_wise` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `lecName` varchar(50) DEFAULT NULL,
  `lecId` varchar(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `time_from` char(5) DEFAULT NULL,
  `time_to` char(5) DEFAULT NULL
) ;

CREATE TABLE `sp2_parallel_session` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `yNs` varchar(10) DEFAULT NULL,
  `session` varchar(10) DEFAULT NULL,
  `sessionID` varchar(20) DEFAULT NULL
) ;

CREATE TABLE `sp2_session_wise` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `session` varchar(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `time_from` char(5) DEFAULT NULL,
  `time_to` char(5) DEFAULT NULL
) ;

CREATE TABLE `sp2_sub_group_wise` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `sGid` varchar(10) DEFAULT NULL,
  `day` varchar(10) DEFAULT NULL,
  `time_from` char(5) DEFAULT NULL,
  `time_to` char(5) DEFAULT NULL
) ;

CREATE TABLE `sub_group_number` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `sGno` INTEGER DEFAULT NULL
) ;

CREATE TABLE `subject` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `offered_year` varchar(2) DEFAULT NULL,
  `offered_semester` varchar(2) DEFAULT NULL,
  `subject_name` varchar(50) DEFAULT NULL,
  `subject_code` varchar(7) DEFAULT NULL,
  `lec_hr` varchar(2) DEFAULT NULL,
  `tute_hr` varchar(2) DEFAULT NULL,
  `lab_hr` varchar(2) DEFAULT NULL,
  `eva_hr` varchar(2) DEFAULT NULL
) ;

CREATE TABLE `tag` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `tag` varchar(45) DEFAULT NULL
) ;

CREATE TABLE `work_day_hour` (
  `id` INTEGER PRIMARY KEY,
  `days_no` INTEGER DEFAULT NULL,
  `days` varchar(100) DEFAULT NULL,
  `hour` INTEGER DEFAULT NULL,
  `mins` INTEGER DEFAULT NULL,
  `slot_type` INTEGER DEFAULT NULL
) ;

CREATE TABLE `work_day_hour_days` (
  `id` INTEGER PRIMARY KEY AUTOINCREMENT,
  `parentID` INTEGER  DEFAULT '0',
  `day` varchar(20) DEFAULT NULL,
  CONSTRAINT `fk1` FOREIGN KEY (`parentID`) REFERENCES `work_day_hour` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ;

