-- Source: https://github.com/Project-market-service/project03/blob/f5cc84f6c02b6eec9d022edaac1888960fd74c67/src/main/resources/db/schema.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 10

CREATE TABLE accounts (
	id INT PRIMARY KEY AUTO_INCREMENT,					-- 계정 고유번호
    name VARCHAR(30) UNIQUE,							-- 계정명
    password VARCHAR(255),								-- 패스워드
    created_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP	-- 생성일
);

CREATE TABLE users (
	account_id INT PRIMARY KEY,			
    first_name VARCHAR(50) NOT NULL,					
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) UNIQUE,
    phone VARCHAR(30),
    CONSTRAINT user_account_id_fk FOREIGN KEY (account_id)
		REFERENCES accounts (id)
);

CREATE TABLE account_images (
	account_id INT PRIMARY KEY,
	path VARCHAR(255) NOT NULL,
    CONSTRAINT account_image_account_id_fk FOREIGN KEY (account_id)
		REFERENCES accounts (id)
);

CREATE TABLE messages (
	message_no INT PRIMARY KEY AUTO_INCREMENT,
	sender_id INT NOT NULL,
	receiver_id INT NOT NULL,
	content VARCHAR(255),
	create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT message_sender_id_fk FOREIGN KEY (sender_id) REFERENCES accounts (id),
	CONSTRAINT message_receiver_id_fk FOREIGN KEY (receiver_id) REFERENCES accounts (id)

);

CREATE TABLE refresh_tokens (
	account_id INT PRIMARY KEY,				-- 계정 고유번호
    token VARCHAR(40) NOT NULL UNIQUE,		-- 토큰
    expired_date TIMESTAMP NOT NULL,		-- 만료일자
    CONSTRAINT refresh_token_account_id_fk FOREIGN KEY (account_id)
		REFERENCES accounts (id)
);

