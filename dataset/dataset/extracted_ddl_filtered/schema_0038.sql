-- Source: https://github.com/rookiezq/ssm/blob/5549b7b30b0fa4d2d11a757aea419473ede53dd7/db.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2

create table dept(
    deptno      int unsigned auto_increment primary key COMMENT '部门编号',
    dname       varchar(15) COMMENT '部门名称',
    loc         varchar(50) COMMENT '部门所在位置'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

create table emp(
    empno           int unsigned auto_increment primary key COMMENT '雇员编号',
    ename           varchar(15) COMMENT '雇员姓名',
    job             varchar(10) COMMENT '雇员职位',
    mgr             int unsigned COMMENT '雇员对应的领导的编号',
    hiredate        date COMMENT '雇员的雇佣日期',
    sal             decimal(7,2) COMMENT '雇员的基本工资',
    comm            decimal(7,2) COMMENT '奖金',
    deptno          int unsigned COMMENT '所在部门',
    foreign key(deptno) references dept(deptno)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='雇员表';

create table salgrade(
    grade       int unsigned COMMENT '工资等级',
    losal       int unsigned COMMENT '此等级的最低工资',
    hisal       int unsigned COMMENT '此等级的最高工资'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工资等级表';

create table bonus(
    ename       varchar(10) COMMENT '雇员姓名',
    job         varchar(9) COMMENT '雇员职位',
    sal         decimal(7,2) COMMENT '雇员工资',
    comm        decimal(7,2) COMMENT '雇员资金'
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工资表';

