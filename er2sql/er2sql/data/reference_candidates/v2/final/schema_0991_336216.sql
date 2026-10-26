-- Source: https://github.com/Corey-Schall/Tech-Elevator-Projects/blob/8c47fbc9e16a2c03e97f9665153fe5a9053b9a83/java-final-capstone-team-0/backend/database/schema.sql?raw=true
-- Tables detected: 11 | FK constraints: 11

CREATE TABLE users (
	user_id int DEFAULT nextval('seq_user_id'::regclass) NOT NULL,
	username varchar(50) NOT NULL,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE region (
        region_name varchar(30) NOT NULL,
        region_cost float8 NOT NULL,
        
        CONSTRAINT pk_region PRIMARY KEY (region_name)
);

CREATE TABLE aesthetic (
        styleName varchar (30) NOT NULL,
        paragraph_description varchar (500),
        picture_url varchar(100),
        
        CONSTRAINT pk_aesthetic PRIMARY KEY (stylename)
);

CREATE TABLE project (
        project_id int DEFAULT nextval('seq_project_id'::regclass) NOT NULL,
        project_name varchar (30) NOT NULL,
        foundation_length int NOT NULL,
        foundation_width int NOT NULL,
        region_name varchar (30) NOT NULL,
        description varchar (300) NOT NULL,
        stylename varchar (30) NOT NULL,
        step_number int,
        
        CONSTRAINT pk_project PRIMARY KEY (project_id),
        CONSTRAINT fk_project_region FOREIGN KEY (region_name) REFERENCES region (region_name),
        CONSTRAINT fk_project_aesthetic FOREIGN KEY (stylename) REFERENCES aesthetic (stylename)
);

CREATE TABLE project_user (
        project_id int NOT NULL,
        user_id int NOT NULL,
        
        CONSTRAINT pk_project_user PRIMARY KEY (project_id, user_id),
        CONSTRAINT fk_project_user_user FOREIGN KEY (user_id) REFERENCES users (user_id),
        CONSTRAINT fk_project_user_project FOREIGN KEY (project_id) REFERENCES project (project_id)
);

CREATE TABLE floor (
        floor_id int DEFAULT nextval('seq_floor_id'::regclass) NOT NULL,
        project_id int NOT NULL,
        floor_name varchar(30) NOT NULL,
        floor_order int NOT NULL,
        
        CONSTRAINT pk_floor PRIMARY KEY (floor_id),
        CONSTRAINT fk_floor_project FOREIGN KEY (project_id) REFERENCES project (project_id)
);

CREATE TABLE floor_type (
        floor_type_name varchar (30) NOT NULL,
        cost float8 NOT NULL,
        
        CONSTRAINT pk_floor_type PRIMARY KEY (floor_type_name)
);

CREATE TABLE wall_type (
        wall_type_name varchar(30) NOT NULL,
        wall_cost float8 NOT NULL,
        
        CONSTRAINT pk_wall_type PRIMARY KEY (wall_type_name)
);

CREATE TABLE room (
        room_id int DEFAULT nextval('seq_room_id'::regclass) NOT NULL,
        room_name varchar(30) NOT NULL,
        floor_id int NOT NULL,
        floor_type_name varchar(30),
        length int,
        width int,
        x_coordinate float8,
        y_coordinate float8, 
        wall_type_name varchar(30),
        stylename varchar(30),
        
        CONSTRAINT pk_room PRIMARY KEY (room_id),
        CONSTRAINT fk_room_floor FOREIGN KEY (floor_id) REFERENCES floor (floor_id),
        CONSTRAINT fk_room_floor_type FOREIGN KEY (floor_type_name) REFERENCES floor_type (floor_type_name),
        CONSTRAINT fk_room_wall_type FOREIGN KEY (wall_type_name) REFERENCES wall_type (wall_type_name),
        CONSTRAINT fk_aesthetic FOREIGN KEY (stylename) REFERENCES aesthetic (stylename)
);

CREATE TABLE fixture_type (
        fixture_type varchar (50) NOT NULL,
        length int NOT NULL,
        width int NOT NULL,
        economic_cost float8 NOT NULL,
        average_cost float8 NOT NULL,
        high_end_cost float8 NOT NULL,
        
        CONSTRAINT pk_fixture_type PRIMARY KEY (fixture_type)
);

CREATE TABLE fixture (
        fixture_id int DEFAULT nextval('seq_fixture_id'::regclass) NOT NULL,
        room_id int NOT NULL,
        fixture_type varchar (50) NOT NULL,
        x_coordinate float8 NOT NULL,
        y_coordinate float8 NOT NULL,
        
        CONSTRAINT pk_fixture PRIMARY KEY (fixture_id),
        CONSTRAINT fk_fixture_room FOREIGN KEY (room_id) REFERENCES room (room_id),
        CONSTRAINT fk_fixture_fixture_type FOREIGN KEY (fixture_type) REFERENCES fixture_type (fixture_type)
);

