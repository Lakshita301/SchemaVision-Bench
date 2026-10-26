-- Source: https://github.com/hyun-on/JYOGIYO/blob/00d89971b80d283c0a2583c916aed094126f2852/JYOGIYO.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 15

CREATE TABLE BUY
(
	-- 주문 번호
	BUY_SEQ number NOT NULL,
	-- 메뉴 번호
	MENU_SEQ number NOT NULL,
	-- 수량
	BUY_CNT number,
	IN_DATE varchar2(15),
	IN_USER_ID varchar2(20),
	UP_DATE varchar2(15),
	UP_USER_ID varchar2(20),
	PRIMARY KEY (BUY_SEQ)
);

CREATE TABLE CATEGORY
(
	-- 카테고리 번호
	CATE_SEQ number NOT NULL,
	-- 회원 번호
	OWNER_SEQ number NOT NULL,
	-- 카테고리 이름
	CATE_NAME varchar2(100),
	-- 설명
	CATE_CONTENT varchar2(3000),
	-- 표시 여부
	CATE_DISPLAY_YN char(1),
	-- 이미지 파일 저장 경로
	ATTACH_PATH varchar2(100),
	-- 이미지 파일명
	ATTACH_FILE varchar2(50),
	IN_DATE varchar2(15),
	IN_USER_ID varchar2(20),
	UP_DATE varchar2(15),
	UP_USER_ID varchar2(20),
	PRIMARY KEY (CATE_SEQ)
);

CREATE TABLE EVENT
(
	-- 이벤트 번호
	EVENT_SEQ number NOT NULL,
	-- 회원 번호
	OWNER_SEQ number NOT NULL,
	-- 제목
	EVENT_TITLE varchar2(150),
	-- 내용
	EVENT_CONTENT varchar2(3000),
	-- 시작일
	EVENT_START date,
	-- 종료일
	EVENT_END date,
	-- 파일 저장 경로
	ATTACH_PATH varchar2(100),
	-- 파일명
	ATTACH_FILE varchar2(50),
	IN_DATE varchar2(15),
	IN_USER_ID varchar2(20),
	UP_DATE varchar2(15),
	UP_USER_ID varchar2(20),
	PRIMARY KEY (EVENT_SEQ, OWNER_SEQ)
);

CREATE TABLE MENU
(
	-- 메뉴 번호
	MENU_SEQ number NOT NULL,
	-- 회원 번호
	OWNER_SEQ number NOT NULL,
	-- 카테고리 번호
	CATE_SEQ number NOT NULL,
	-- 이름
	MENU_NAME varchar2(100),
	-- 가격
	MENU_PRICE number,
	-- 설명
	MENU_CONTENT varchar2(3000),
	-- 표시 여부
	MENU_DISPLAY_YN char(1),
	-- 이미지 파일 저장 경로
	ATTACH_PATH varchar2(100),
	-- 이미지 파일명
	ATTACH_FILE varchar2(50),
	IN_DATE varchar2(15),
	IN_USER_ID varchar2(20),
	UP_DATE varchar2(15),
	UP_USER_ID varchar2(20),
	PRIMARY KEY (MENU_SEQ)
);

CREATE TABLE NOTICE
(
	-- 공지 번호
	NOTI_SEQ number NOT NULL,
	-- 제목
	NOTI_TITLE varchar2(150),
	-- 내용
	NOTI_CONTENT varchar2(3000),
	-- 표시 여부
	NOTI_DISPLAY_YN char(1),
	-- 파일 저장 경로
	ATTACH_PATH varchar2(100),
	-- 파일명
	ATTACH_FILE varchar2(50),
	IN_DATE varchar2(15),
	IN_USER_ID varchar2(20),
	UP_DATE varchar2(15),
	UP_USER_ID varchar2(20),
	PRIMARY KEY (NOTI_SEQ)
);

CREATE TABLE OWNER
(
	-- 회원 번호
	OWNER_SEQ number NOT NULL,
	-- 이름
	OWNER_NAME varchar2(100),
	-- EMAIL
	OWNER_ID varchar2(50) UNIQUE,
	-- 비밀번호
	OWNER_PWD nvarchar2(50),
	-- 상호명
	OWNER_STR_NAME varchar2(100),
	-- 사업자 등록번호 또는 가맹점 번호
	OWNER_STR_NUM char(10) UNIQUE,
	-- 전화번호
	OWNER_STR_TEL varchar2(11),
	-- 우편번호
	OWNER_POST char(5),
	-- 주소1
	OWNER_ADD1 varchar2(150),
	-- 주소2
	OWNER_ADD2 varchar2(150),
	-- 이미지 파일 저장 경로
	LOGO_PATH varchar2(100),
	-- 이미지 파일명
	LOGO_FILE varchar2(50),
	ADMIN_YN char(1) DEFAULT 'N',
	IN_DATE varchar2(15),
	IN_USER_ID varchar2(20),
	UP_DATE varchar2(15),
	UP_USER_ID varchar2(20),
	PRIMARY KEY (OWNER_SEQ)
);

CREATE TABLE SYS_ANSWER
(
	-- 시스템 질문 번호
	SYS_QUES_SEQ number NOT NULL,
	-- 답변
	SYS_ANS_REPLY varchar2(3000),
	IN_DATE varchar2(15),
	IN_USER_ID varchar2(20),
	UP_DATE varchar2(15),
	UP_USER_ID varchar2(20)
);

CREATE TABLE SYS_QUESTION
(
	-- 시스템 질문 번호
	SYS_QUES_SEQ number NOT NULL,
	-- 회원 번호
	OWNER_SEQ number NOT NULL,
	-- 제목
	SYS_QUES_TITLE varchar2(150),
	-- 내용
	SYS_QUES_CONTENT varchar2(3000),
	-- 표시 여부
	SYS_QUES_DISPLAY_YN char(1),
	-- 파일 저장 경로
	ATTACH_PATH varchar2(100),
	-- 파일명
	ATTACH_FILE varchar2(50),
	IN_DATE varchar2(15),
	IN_USER_ID varchar2(20),
	UP_DATE varchar2(15),
	UP_USER_ID varchar2(20),
	PRIMARY KEY (SYS_QUES_SEQ)
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE MENU
	ADD FOREIGN KEY (CATE_SEQ)
	REFERENCES CATEGORY (CATE_SEQ)
;

ALTER TABLE BUY
	ADD FOREIGN KEY (MENU_SEQ)
	REFERENCES MENU (MENU_SEQ)
;

ALTER TABLE CATEGORY
	ADD FOREIGN KEY (OWNER_SEQ)
	REFERENCES OWNER (OWNER_SEQ)
;

ALTER TABLE EVENT
	ADD FOREIGN KEY (OWNER_SEQ)
	REFERENCES OWNER (OWNER_SEQ)
;

ALTER TABLE MENU
	ADD FOREIGN KEY (OWNER_SEQ)
	REFERENCES OWNER (OWNER_SEQ)
;

ALTER TABLE SYS_QUESTION
	ADD FOREIGN KEY (OWNER_SEQ)
	REFERENCES OWNER (OWNER_SEQ)
;

ALTER TABLE SYS_ANSWER
	ADD FOREIGN KEY (SYS_QUES_SEQ)
	REFERENCES SYS_QUESTION (SYS_QUES_SEQ)
;

