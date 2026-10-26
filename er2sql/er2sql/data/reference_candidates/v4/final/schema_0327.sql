-- Source: https://github.com/petr-shumilov/CloudComputingCourse/blob/d0166cf0c0dedcebe3619bdb19c452e85c5de3c3/src/bot/dbSchema.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 4

CREATE TABLE cloud.users (
	id VARCHAR(64) NOT NULL PRIMARY KEY,
	chat_id VARCHAR(64) NOT NULL,
	phone_number VARCHAR(16) DEFAULT NULL
);

CREATE TABLE cloud.states (
	user_id VARCHAR(64) NOT NULL PRIMARY KEY,
	state VARCHAR(32) NOT NULL,
	previous_state VARCHAR(32),
	skill_id VARCHAR(32),
	memory_field VARCHAR(512),
	FOREIGN KEY (user_id) REFERENCES cloud.users(id)
);

CREATE TABLE cloud.memory (
	user_id VARCHAR(64) NOT NULL,
	field_name VARCHAR(128),
	field_value TEXT,
	FOREIGN KEY (user_id) REFERENCES cloud.users(id)
);

