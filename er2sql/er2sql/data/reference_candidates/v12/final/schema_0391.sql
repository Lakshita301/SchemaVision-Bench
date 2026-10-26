-- Source: https://github.com/Encore-Playdata-Course/JDBC_JPA/blob/1eb4bb165bae76650a3e404caed7d4d0cfdd9e51/step03_jdbcProject_s/step03_jdbcProject_s/sql/probonoDDL.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6
CREATE TABLE activist (
    activist_id VARCHAR(20)  PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    major VARCHAR(50) NOT NULL
);
CREATE TABLE recipient (
    recipient_id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    receiveHopeContent VARCHAR(50) NOT NULL
);
CREATE TABLE probono (
    probono_id VARCHAR(50) PRIMARY KEY,
    probono_name VARCHAR(50) NOT NULL,
    probono_purpose VARCHAR(200) NOT NULL
);
CREATE TABLE probono_project (
    probono_project_id NUMERIC(5) PRIMARY KEY,
    probono_project_name VARCHAR(50) NOT NULL,
    probono_id VARCHAR(50) NOT NULL,
    activist_id VARCHAR(20) NOT NULL,
    receive_id VARCHAR(20) NOT NULL,
    project_content VARCHAR(100) NOT NULL,
    FOREIGN KEY (receive_id) REFERENCES recipient  (recipient_id),
    FOREIGN KEY (activist_id)  REFERENCES activist  (activist_id),
    FOREIGN KEY (probono_id) REFERENCES probono  (probono_id)
);
