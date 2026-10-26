-- Source: https://github.com/Encore-Playdata-Course/JDBC_JPA/blob/1eb4bb165bae76650a3e404caed7d4d0cfdd9e51/step03_jdbcProject_s/step03_jdbcProject_s/sql/probonoDDL.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6

CREATE TABLE activist (
       activist_id          	VARCHAR2(20)  PRIMARY KEY,
       name               	VARCHAR2(20) NOT NULL,
       password         	VARCHAR2(20) NOT NULL,
       major                	VARCHAR2(50) NOT NULL
);

CREATE TABLE recipient (
       recipient_id        		VARCHAR2(20) PRIMARY KEY,
       name                		VARCHAR2(20) NOT NULL,
       password          		VARCHAR2(20) NOT NULL,
       receiveHopeContent   VARCHAR2(50) NOT NULL
);

CREATE TABLE probono (
       probono_id          	VARCHAR2(50) PRIMARY KEY,
       probono_name      VARCHAR2(50) NOT NULL,
       probono_purpose  	VARCHAR2(200) NOT NULL
);

CREATE TABLE probono_project (
	   probono_project_id     		NUMBER(5) PRIMARY KEY,
	   probono_project_name 		VARCHAR2(50) NOT NULL,
       probono_id           			VARCHAR2(50) NOT NULL,       
       activist_id          				VARCHAR2(20) NOT NULL,
       receive_id           				VARCHAR2(20) NOT NULL, 
       project_content      			VARCHAR2(100) NOT NULL
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE probono_project  ADD FOREIGN KEY (receive_id) REFERENCES recipient  (recipient_id);

ALTER TABLE probono_project ADD FOREIGN KEY (activist_id)  REFERENCES activist  (activist_id);

ALTER TABLE probono_project ADD FOREIGN KEY (probono_id) REFERENCES probono  (probono_id);

