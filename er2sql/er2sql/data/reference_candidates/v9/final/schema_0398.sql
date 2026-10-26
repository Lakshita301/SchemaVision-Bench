-- Source: https://github.com/hye-rim/dg/blob/e8bfe0b2f4d4d0b6a2abadf01e43ba0b6027ef80/doc/DG.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 8
-- Foreign keys added via ALTER TABLE:
CREATE TABLE tb_user (
    user_code VARCHAR(100)	NOT NULL	,
    user_name VARCHAR(200)	NOT NULL	,
    email VARCHAR(200)	NOT NULL	,
    nickname VARCHAR(30)	NOT NULL	,
    password VARCHAR(30)	NOT NULL	,
    mobile INT	NOT NULL	,
    try_count INT	NOT NULL	DEFAULT 0	,
    success_count INT	NOT NULL	DEFAULT 0	,
    reg_date TIMESTAMP	NOT NULL	DEFAULT NOW()	,
    updt_date TIMESTAMP	NOT NULL	DEFAULT NOW()	
);

CREATE TABLE tb_problem_list (
    problem_code VARCHAR(100)	NOT NULL	,
    language_code VARCHAR(100)	NOT NULL	,
    user_code VARCHAR(100)	NOT NULL	,
    level INT	NOT NULL	,
    problem_title VARCHAR(200)	NOT NULL	,
    problem_contents TEXT	NOT NULL	,
    reg_date TIMESTAMP	NOT NULL	DEFAULT NOW()	,
    updt_date TIMESTAMP	NOT NULL	DEFAULT NOW()	,
    input TEXT	NULL	,
    output TEXT	NULL	
);

CREATE TABLE tb_answer (
    answer_code VARCHAR(100)	NOT NULL	,
    problem_code VARCHAR(100)	NOT NULL	,
    language_code VARCHAR(100)	NOT NULL	,
    user_code VARCHAR(100)	NOT NULL	,
    answer TEXT	NOT NULL	,
    reg_date TIMESTAMP	NOT NULL	DEFAULT NOW()	,
    updt_date TIMESTAMP	NOT NULL	DEFAULT NOW()	,
    success_yn VARCHAR(2)	NOT NULL	DEFAULT 'N'	,
    open_yn VARCHAR(2)	NOT NULL	DEFAULT 'Y'	,
    time BIGINT	NOT NULL	,
    memory BIGINT	NOT NULL	
);

CREATE TABLE tb_common_code (
    code_name VARCHAR(100)	NOT NULL	,
    code_group VARCHAR(100)	NOT NULL	,
    code_discription VARCHAR(1000)	NOT NULL	,
    reg_date TIMESTAMP	NOT NULL	DEFAULT NOW()	,
    updt_date TIMESTAMP	NOT NULL	DEFAULT NOW()	
);

CREATE TABLE tb_problem_like (
    like_seq BIGINT	NOT NULL	,
    answer_code VARCHAR(100)	NOT NULL	,
    problem_code VARCHAR(100)	NOT NULL	,
    language_code VARCHAR(100)	NOT NULL	,
    user_code VARCHAR(100)	NOT NULL	,
    reg_date TIMESTAMP	NOT NULL	DEFAULT NOW()	,
    updt_date TIMESTAMP	NOT NULL	DEFAULT NOW()	
);


                          

ALTER TABLE tb_problem_list ADD CONSTRAINT fk_tb_user_to_tb_problem_list_1 FOREIGN KEY (
	user_code
)
REFERENCES tb_user (
	user_code
);

ALTER TABLE tb_answer ADD CONSTRAINT fk_tb_problem_list_to_tb_answer_1 FOREIGN KEY (
	problem_code
)
REFERENCES tb_problem_list (
	problem_code
);

ALTER TABLE tb_answer ADD CONSTRAINT fk_tb_problem_list_to_tb_answer_2 FOREIGN KEY (
	language_code
)
REFERENCES tb_problem_list (
	language_code
);

ALTER TABLE tb_answer ADD CONSTRAINT fk_tb_problem_list_to_tb_answer_3 FOREIGN KEY (
	user_code
)
REFERENCES tb_problem_list (
	user_code
);

ALTER TABLE tb_problem_like ADD CONSTRAINT fk_tb_answer_to_tb_problem_like_1 FOREIGN KEY (
	answer_code
)
REFERENCES tb_answer (
	answer_code
);

ALTER TABLE tb_problem_like ADD CONSTRAINT fk_tb_answer_to_tb_problem_like_2 FOREIGN KEY (
	problem_code
)
REFERENCES tb_answer (
	problem_code
);

ALTER TABLE tb_problem_like ADD CONSTRAINT fk_tb_answer_to_tb_problem_like_3 FOREIGN KEY (
	language_code
)
REFERENCES tb_answer (
	language_code
);

ALTER TABLE tb_problem_like ADD CONSTRAINT fk_tb_answer_to_tb_problem_like_4 FOREIGN KEY (
	user_code
)
REFERENCES tb_answer (
	user_code
);
COMMENT ON COLUMN tb_user.user_code IS '유저 코드';
COMMENT ON COLUMN tb_user.user_name IS '유저 이름';
COMMENT ON COLUMN tb_user.email IS '이메일';
COMMENT ON COLUMN tb_user.nickname IS '별명';
COMMENT ON COLUMN tb_user.password IS '비밀번호';
COMMENT ON COLUMN tb_user.mobile IS '휴대폰';
COMMENT ON COLUMN tb_user.try_count IS '문제 시도 횟수';
COMMENT ON COLUMN tb_user.success_count IS '성공 횟수';
COMMENT ON COLUMN tb_user.reg_date IS '등록일';
COMMENT ON COLUMN tb_user.updt_date IS '수정일';
COMMENT ON COLUMN tb_problem_list.problem_code IS '문제 코드';
COMMENT ON COLUMN tb_problem_list.language_code IS '언어 코드';
COMMENT ON COLUMN tb_problem_list.user_code IS '유저 코드';
COMMENT ON COLUMN tb_problem_list.level IS '문제 난이도';
COMMENT ON COLUMN tb_problem_list.problem_title IS '문제 제목';
COMMENT ON COLUMN tb_problem_list.problem_contents IS '문제 내용';
COMMENT ON COLUMN tb_problem_list.reg_date IS '등록일';
COMMENT ON COLUMN tb_problem_list.updt_date IS '수정일';
COMMENT ON COLUMN tb_problem_list.input IS '입력';
COMMENT ON COLUMN tb_problem_list.output IS '출력';
COMMENT ON COLUMN tb_answer.answer_code IS '답안 코드';
COMMENT ON COLUMN tb_answer.problem_code IS '문제 코드';
COMMENT ON COLUMN tb_answer.language_code IS '언어 코드';
COMMENT ON COLUMN tb_answer.user_code IS '유저 코드';
COMMENT ON COLUMN tb_answer.answer IS '답안';
COMMENT ON COLUMN tb_answer.reg_date IS '등록일';
COMMENT ON COLUMN tb_answer.updt_date IS '수정일';
COMMENT ON COLUMN tb_answer.success_yn IS '성공 여부';
COMMENT ON COLUMN tb_answer.open_yn IS '답안 공개 여부';
COMMENT ON COLUMN tb_answer.time IS '시간';
COMMENT ON COLUMN tb_answer.memory IS '메모리';
COMMENT ON COLUMN tb_common_code.code_name IS '코드명';
COMMENT ON COLUMN tb_common_code.code_group IS '코드그룹';
COMMENT ON COLUMN tb_common_code.code_discription IS '코드설명';
COMMENT ON COLUMN tb_common_code.reg_date IS '등록일';
COMMENT ON COLUMN tb_common_code.updt_date IS '수정일';
COMMENT ON COLUMN tb_problem_like.like_seq IS '좋아요번호';
COMMENT ON COLUMN tb_problem_like.answer_code IS '답안 코드';
COMMENT ON COLUMN tb_problem_like.problem_code IS '문제 코드';
COMMENT ON COLUMN tb_problem_like.language_code IS '언어 코드';
COMMENT ON COLUMN tb_problem_like.user_code IS '유저 코드';
COMMENT ON COLUMN tb_problem_like.reg_date IS '등록일';
COMMENT ON COLUMN tb_problem_like.updt_date IS '수정일';
