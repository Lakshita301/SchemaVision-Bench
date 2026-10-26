-- Source: https://github.com/leeheejin0/bitcamp-study/blob/b4bb2a3d8afdff932d0634ff7a84e48e0d237aec/dbmodel/asms.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 16

CREATE TABLE asms_mngr (
  mno     INTEGER     NOT NULL COMMENT '관리자번호', -- 관리자번호
  as_name VARCHAR(50) NOT NULL COMMENT '보호소명' -- 보호소명
)
COMMENT '관리자';

CREATE TABLE asms_gnl_memb (
  meno       INTEGER      NOT NULL COMMENT '일반회원번호', -- 일반회원번호
  pst_no     VARCHAR(7)   NULL     COMMENT '우편번호', -- 우편번호
  basic_addr VARCHAR(255) NULL     COMMENT '기본주소', -- 기본주소
  addr       VARCHAR(255) NULL     COMMENT '상세주소' -- 상세주소
)
COMMENT '일반회원';

CREATE TABLE asms_board (
  bno       INTEGER      NOT NULL COMMENT '게시글번호', -- 게시글번호
  writer_no INTEGER      NOT NULL COMMENT '작성자 번호', -- 작성자 번호
  title     VARCHAR(255) NOT NULL COMMENT '제목', -- 제목
  cont      LONGTEXT     NOT NULL COMMENT '내용', -- 내용
  rdt       DATETIME     NOT NULL COMMENT '등록일', -- 등록일
  vct       INTEGER      NOT NULL COMMENT '조회수', -- 조회수
  lct       INTEGER      NOT NULL COMMENT '좋아요수', -- 좋아요수
  COL       VARCHAR(255) NULL     COMMENT '첨부파일' -- 첨부파일
)
COMMENT '게시판';

CREATE TABLE asms_animal (
  ano       INTEGER      NOT NULL COMMENT '동물번호', -- 동물번호
  writer_no INTEGER      NOT NULL COMMENT '작성자 번호', -- 작성자 번호
  as_name   VARCHAR(50)  NULL     COMMENT '보호소명', -- 보호소명
  spec_no   INTEGER      NOT NULL COMMENT '동물종류번호', -- 동물종류번호
  spec      VARCHAR(100) NOT NULL COMMENT '동물종류', -- 동물종류
  a_photo   VARCHAR(255) NOT NULL COMMENT '사진', -- 사진
  a_breed   VARCHAR(100) NOT NULL COMMENT '품종', -- 품종
  a_gendr   INTEGER      NOT NULL COMMENT '성별', -- 성별
  a_age     VARCHAR(30)  NOT NULL COMMENT '나이', -- 나이
  a_rdt     DATE         NOT NULL COMMENT '구조일', -- 구조일
  a_place   VARCHAR(50)  NOT NULL COMMENT '구조장소', -- 구조장소
  as_tel    VARCHAR(30)  NOT NULL COMMENT '보호소 전화번호', -- 보호소 전화번호
  a_stat    INTEGER      NOT NULL COMMENT '상태' -- 상태
)
COMMENT '동물';

CREATE TABLE asms_memb (
  no    INTEGER      NOT NULL COMMENT '회원번호', -- 회원번호
  name  VARCHAR(50)  NOT NULL COMMENT '이름', -- 이름
  id    VARCHAR(20)  NOT NULL COMMENT '아이디', -- 아이디
  pwd   VARCHAR(100) NOT NULL COMMENT '비밀번호', -- 비밀번호
  email VARCHAR(40)  NOT NULL COMMENT '이메일', -- 이메일
  tel   VARCHAR(30)  NOT NULL COMMENT '전화', -- 전화
  photo VARCHAR(255) NULL     COMMENT '사진', -- 사진
  rdt   DATETIME     NOT NULL COMMENT '가입일', -- 가입일
  gendr INTEGER      NULL     COMMENT '성별' -- 성별
)
COMMENT '회원';

CREATE TABLE asms_animal_comt (
  acno INTEGER  NOT NULL COMMENT '댓글번호', -- 댓글번호
  meno INTEGER  NOT NULL COMMENT '작성자 번호', -- 작성자 번호
  ano  INTEGER  NOT NULL COMMENT '동물번호', -- 동물번호
  cont LONGTEXT NOT NULL COMMENT '댓글', -- 댓글
  rdt  DATETIME NOT NULL COMMENT '등록일' -- 등록일
)
COMMENT '동물댓글';

CREATE TABLE asms_board_comt (
  bcno INTEGER  NOT NULL COMMENT '댓글번호', -- 댓글번호
  meno INTEGER  NOT NULL COMMENT '작성자 번호', -- 작성자 번호
  bno  INTEGER  NOT NULL COMMENT '게시글번호', -- 게시글번호
  cont LONGTEXT NOT NULL COMMENT '댓글', -- 댓글
  rdt  DATETIME NOT NULL COMMENT '등록일' -- 등록일
)
COMMENT '게시글댓글';

-- Foreign keys added via ALTER TABLE:
ALTER TABLE asms_mngr
  ADD CONSTRAINT FK_asms_memb_TO_asms_mngr -- 회원 -> 관리자
    FOREIGN KEY (
      mno -- 관리자번호
    )
    REFERENCES asms_memb ( -- 회원
      no -- 회원번호
    );

ALTER TABLE asms_gnl_memb
  ADD CONSTRAINT FK_asms_memb_TO_asms_gnl_memb -- 회원 -> 일반회원
    FOREIGN KEY (
      meno -- 일반회원번호
    )
    REFERENCES asms_memb ( -- 회원
      no -- 회원번호
    );

ALTER TABLE asms_board
  ADD CONSTRAINT FK_asms_gnl_memb_TO_asms_board -- 일반회원 -> 게시판
    FOREIGN KEY (
      writer_no -- 작성자 번호
    )
    REFERENCES asms_gnl_memb ( -- 일반회원
      meno -- 일반회원번호
    );

ALTER TABLE asms_animal
  ADD CONSTRAINT FK_asms_mngr_TO_asms_animal -- 관리자 -> 동물
    FOREIGN KEY (
      writer_no, -- 작성자 번호
      as_name    -- 보호소명
    )
    REFERENCES asms_mngr ( -- 관리자
      mno,     -- 관리자번호
      as_name  -- 보호소명
    );

ALTER TABLE asms_animal_comt
  ADD CONSTRAINT FK_asms_gnl_memb_TO_asms_animal_comt -- 일반회원 -> 동물댓글
    FOREIGN KEY (
      meno -- 작성자 번호
    )
    REFERENCES asms_gnl_memb ( -- 일반회원
      meno -- 일반회원번호
    );

ALTER TABLE asms_animal_comt
  ADD CONSTRAINT FK_asms_animal_TO_asms_animal_comt -- 동물 -> 동물댓글
    FOREIGN KEY (
      ano -- 동물번호
    )
    REFERENCES asms_animal ( -- 동물
      ano -- 동물번호
    );

ALTER TABLE asms_board_comt
  ADD CONSTRAINT FK_asms_gnl_memb_TO_asms_board_comt -- 일반회원 -> 게시글댓글
    FOREIGN KEY (
      meno -- 작성자 번호
    )
    REFERENCES asms_gnl_memb ( -- 일반회원
      meno -- 일반회원번호
    );

ALTER TABLE asms_board_comt
  ADD CONSTRAINT FK_asms_board_TO_asms_board_comt -- 게시판 -> 게시글댓글
    FOREIGN KEY (
      bno -- 게시글번호
    )
    REFERENCES asms_board ( -- 게시판
      bno -- 게시글번호
    );

