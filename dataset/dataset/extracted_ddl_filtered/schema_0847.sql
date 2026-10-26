-- Source: https://github.com/duanyadian/Python-100day/blob/1ef5bf058a29680779d425fc81c1215e08e7cd92/Day36-40/code/SRS_create_and_init.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 5

create table `tb_college`
(
`col_id` int unsigned auto_increment comment '编号',
`col_name` varchar(50) not null comment '名称',
`col_intro` varchar(5000) default '' comment '介绍',
primary key (`col_id`)
) engine=innodb comment '学院表';

create table `tb_student`
(
`stu_id` int unsigned not null comment '学号',
`stu_name` varchar(20) not null comment '姓名',
`stu_sex` boolean default 1 comment '性别',
`stu_birth` date not null comment '出生日期',
`stu_addr` varchar(255) default '' comment '籍贯',
`col_id` int unsigned not null comment '所属学院',
primary key (`stu_id`),
foreign key (`col_id`) references `tb_college` (`col_id`)
) engine=innodb comment '学生表';

create table `tb_teacher`
(
`tea_id` int unsigned not null comment '工号',
`tea_name` varchar(20) not null comment '姓名',
`tea_title` varchar(10) default '助教' comment '职称',
`col_id` int unsigned not null comment '所属学院',
primary key (`tea_id`),
foreign key (`col_id`) references `tb_college` (`col_id`)
) engine=innodb comment '老师表';

create table `tb_course`
(
`cou_id` int unsigned not null comment '编号',
`cou_name` varchar(50) not null comment '名称',
`cou_credit` int unsigned not null comment '学分',
`tea_id` int unsigned not null comment '授课老师',
primary key (`cou_id`),
foreign key (`tea_id`) references `tb_teacher` (`tea_id`)
) engine=innodb comment '课程表';

create table `tb_record`
(
`rec_id` bigint unsigned auto_increment comment '选课记录号',
`sid` int unsigned not null comment '学号',
`cid` int unsigned not null comment '课程编号',
`sel_date` date not null comment '选课日期',
`score` decimal(4,1) comment '考试成绩',
primary key (`rec_id`),
foreign key (`sid`) references `tb_student` (`stu_id`),
foreign key (`cid`) references `tb_course` (`cou_id`),
unique (`sid`, `cid`)
) engine=innodb comment '选课记录表';

