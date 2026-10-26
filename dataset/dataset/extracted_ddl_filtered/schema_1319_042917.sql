-- Source: https://github.com/shaikhdo/SpringBoot-Shopping-List/blob/072ebc10fd8d792fef3a40242480d6fe11a08bd5/MidtermDoaaShaikh/src/main/resources/schema.sql?raw=true
-- Tables detected: 4 | FK constraints: 2

CREATE TABLE sec_user (
  userId            BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  email             VARCHAR(75) NOT NULL UNIQUE,
  encryptedPassword VARCHAR(128) NOT NULL,
  enabled           BIT NOT NULL 
);

CREATE TABLE sec_role(
  roleId   BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  roleName VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE user_role
(
  id     BIGINT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  userId BIGINT NOT NULL,
  roleId BIGINT NOT NULL
);

CREATE TABLE userpubpost
(	
	email VARCHAR(75) NOT NULL UNIQUE PRIMARY KEY,
	userPost VARCHAR(5000) NOT NULL,
	sub_date DATE,
	sub_time TIME
	)

ALTER TABLE user_role
  ADD CONSTRAINT user_role_uk UNIQUE (userId, roleId);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE user_role
  ADD CONSTRAINT user_role_fk1 FOREIGN KEY (userId)
  REFERENCES sec_user (userId);

ALTER TABLE user_role
  ADD CONSTRAINT user_role_fk2 FOREIGN KEY (roleId)
  REFERENCES sec_role (roleId);

