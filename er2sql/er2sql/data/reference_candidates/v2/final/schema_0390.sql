-- Source: https://github.com/NikolayDobrinski/SoftUni-Java/blob/80140a1e52e9ba186f607fb118db392cecd71923/src/softuni/mySql/Exam_Prep/Table_Design_by_DDL_Diagram.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 14
CREATE TABLE countries(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL
);

CREATE TABLE towns(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    country_id INT NOT NULL,
    CONSTRAINT fk_towns_countries
    FOREIGN KEY (country_id)
    REFERENCES countries(id)
);

CREATE TABLE stadiums(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    capacity INT NOT NULL,
    town_id INT NOT NULL,
    CONSTRAINT fk_stadiums_towns
    FOREIGN KEY (town_id)
    REFERENCES towns(id)
);

CREATE TABLE teams(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    established DATE NOT NULL,
    fan_base BIGINT NOT NULL DEFAULT 0,
    stadium_id INT NOT NULL,
    CONSTRAINT fk_teams_stadiums
    FOREIGN KEY (stadium_id)
    REFERENCES stadiums(id)
);

CREATE TABLE skills_data(
    id INT PRIMARY KEY AUTO_INCREMENT,
    dribbling INT DEFAULT 0,
    pace INT DEFAULT 0,
    passing INT DEFAULT 0,
    shooting INT DEFAULT 0,
    speed INT DEFAULT 0,
    strength INT DEFAULT 0
);

CREATE TABLE players(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    age INT NOT NULL DEFAULT 0,
    position CHAR(1) NOT NULL,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0,
    hire_date TIMESTAMP,
    skills_data_id INT NOT NULL,
    CONSTRAINT fk_players_skills_data
    FOREIGN KEY (skills_data_id)
    REFERENCES skills_data(id),
    team_id INT,
    CONSTRAINT fk_players_teams
    FOREIGN KEY (team_id)
    REFERENCES teams(id)
);

CREATE TABLE coaches(
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(10) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    salary DECIMAL(10,2) NOT NULL DEFAULT 0,
    coach_level INT NOT NULL DEFAULT 0
);

CREATE TABLE players_coaches(
    player_id INT,
    coach_id INT,
    CONSTRAINT pk_players_coaches
	PRIMARY KEY (player_id, coach_id),
    CONSTRAINT fk_players_coaches_players
	FOREIGN KEY (player_id)
	REFERENCES players(id),
    CONSTRAINT fk_players_coachess_coaches
	FOREIGN KEY (coach_id)
	REFERENCES coaches(id)
);
