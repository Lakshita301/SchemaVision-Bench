-- Source: https://github.com/Shikhar167/Projects_VIT_Vellore/blob/60a7cf00c35823251e050238d9a27a04350fd79c/Student_Chapter_Projects/backend/platform.sql?raw=true
-- Tables detected: 12 | FK constraints: 11
CREATE TABLE invite (
    id int NOT NULL,
    from_email varchar(50) NOT NULL,
    team varchar(15) NOT NULL,
    to_email varchar(50) NOT NULL
);
CREATE TABLE mentor (
    sector text NOT NULL,
    name varchar(30) NOT NULL,
    domain text NOT NULL,
    phone_no varchar(13) NOT NULL,
    email varchar(50) NOT NULL,
    mentor_uid int NOT NULL,
    password varchar(50) NOT NULL,
    status text,
    hash varchar(32) NOT NULL
);
CREATE TABLE problem (
    id text NOT NULL,
    title text NOT NULL,
    statement text NOT NULL,
    sector text NOT NULL,
    track text NOT NULL
);
CREATE TABLE project (
    title varchar(50) NOT NULL,
    team_name varchar(15) NOT NULL,
    domain text NOT NULL,
    description varchar(500) NOT NULL,
    project_id int NOT NULL,
    status text
);
CREATE TABLE requirement (
    team_name varchar(15) NOT NULL,
    project int NOT NULL,
    title varchar(50) NOT NULL,
    description text NOT NULL,
    id int NOT NULL
);
CREATE TABLE student (
    type text NOT NULL,
    reg_no varchar(10) DEFAULT NULL,
    name varchar(30) NOT NULL,
    phone_no varchar(13) NOT NULL,
    email varchar(50) NOT NULL,
    college_name varchar(30) DEFAULT NULL,
    team_name varchar(15) DEFAULT NULL,
    password varchar(50) NOT NULL,
    std_uid int NOT NULL,
    hash varchar(32) NOT NULL
);
CREATE TABLE student_mentor (
    req_id int NOT NULL,
    std_uid int NOT NULL,
    skill varchar(100) NOT NULL,
    domain text NOT NULL,
    github text,
    linkedin text,
    status text
);
CREATE TABLE team (
    name varchar(50) NOT NULL,
    leader int NOT NULL
);
CREATE TABLE team_message (
    id int NOT NULL,
    sender varchar(20) NOT NULL,
    receiver varchar(20) NOT NULL,
    description text NOT NULL
);
CREATE TABLE viewstudent_approval (
    req_id int,
    std_uid int,
    name varchar(30),
    phone_no varchar(13),
    email varchar(50),
    skill varchar(100),
    domain text,
    status text
);
CREATE TABLE viewstudent_mentor (
    req_id int,
    name varchar(30),
    skills varchar(100),
    domain text,
    status text
);
CREATE TABLE working_on (
    work_id int NOT NULL,
    team_name varchar(15) NOT NULL,
    project int NOT NULL,
    mentor int DEFAULT NULL,
    student_mentor int DEFAULT NULL
);
ALTER TABLE invite ADD CONSTRAINT invite_ibfk_1 FOREIGN KEY (team) REFERENCES team (name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE project ADD CONSTRAINT project_ibfk_1 FOREIGN KEY (team_name) REFERENCES team (name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE requirement ADD CONSTRAINT requirement_ibfk_1 FOREIGN KEY (project) REFERENCES project (project_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE requirement ADD CONSTRAINT requirement_ibfk_2 FOREIGN KEY (team_name) REFERENCES team (name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student ADD CONSTRAINT student_ibfk_1 FOREIGN KEY (team_name) REFERENCES team (name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE student_mentor ADD CONSTRAINT student_mentor_ibfk_1 FOREIGN KEY (std_uid) REFERENCES student (std_uid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE team ADD CONSTRAINT team_ibfk_1 FOREIGN KEY (leader) REFERENCES student (std_uid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE working_on ADD CONSTRAINT working_on_ibfk_1 FOREIGN KEY (team_name) REFERENCES team (name) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE working_on ADD CONSTRAINT working_on_ibfk_2 FOREIGN KEY (project) REFERENCES project (project_id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE working_on ADD CONSTRAINT working_on_ibfk_3 FOREIGN KEY (mentor) REFERENCES mentor (mentor_uid) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE working_on ADD CONSTRAINT working_on_ibfk_4 FOREIGN KEY (student_mentor) REFERENCES student_mentor (std_uid) ON DELETE CASCADE ON UPDATE CASCADE;
