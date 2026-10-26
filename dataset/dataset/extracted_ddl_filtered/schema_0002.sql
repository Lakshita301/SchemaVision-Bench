-- Source: https://github.com/JJRYY/web_gradle_erp/blob/1d4064b4171a63897f1fd4764aea8bd18164edea/Scripts/1.ddl_grant.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 6

CREATE TABLE web_gradle_erp.Title (
   titleNo   INT         NOT NULL COMMENT '직책코드', -- 직책코드
   titleName VARCHAR(20) NOT NULL COMMENT '직책명' -- 직책명
)
COMMENT '직책';

CREATE TABLE web_gradle_erp.department (
   deptNo   INT         NOT NULL COMMENT '부서번호', -- 부서번호
   deptName VARCHAR(20) NOT NULL COMMENT '부서명', -- 부서명
   floor    INT         NULL     COMMENT '위치' -- 위치
)
COMMENT '부서';

CREATE TABLE web_gradle_erp.employee (
   empno   INT         NOT NULL COMMENT '사원번호', -- 사원번호
   empname VARCHAR(20) NOT NULL COMMENT '사원명', -- 사원명
   title   INT         NULL     COMMENT '직책', -- 직책
   manager INT         NULL     COMMENT '직속상사', -- 직속상사
   salary  INT         NULL     COMMENT '급여', -- 급여
   dept    INT         NULL     COMMENT '부서', -- 부서
   hiredate	date	   NULL     COMMENT '입사일' -- 입사일
)
COMMENT '사원';

-- Foreign keys added via ALTER TABLE:
ALTER TABLE web_gradle_erp.employee
   ADD CONSTRAINT FK_Title_TO_employee -- 직책 -> 사원
      FOREIGN KEY (
         title -- 직책
      )
      REFERENCES web_gradle_erp.Title ( -- 직책
         titleNo -- 직책코드
      );

ALTER TABLE web_gradle_erp.employee
   ADD CONSTRAINT FK_employee_TO_employee -- 사원 -> 사원
      FOREIGN KEY (
         manager -- 직속상사
      )
      REFERENCES web_gradle_erp.employee ( -- 사원
         empno -- 사원번호
      );

ALTER TABLE web_gradle_erp.employee
   ADD CONSTRAINT FK_department_TO_employee -- 부서 -> 사원
      FOREIGN KEY (
         dept -- 부서
      )
      REFERENCES web_gradle_erp.department ( -- 부서
         deptNo -- 부서번호
      );

