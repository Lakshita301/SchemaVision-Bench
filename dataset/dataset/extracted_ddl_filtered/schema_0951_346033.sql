-- Source: https://github.com/mromig09/CertIV-DB-Semester1-Tables/blob/f806ec6363f649dfbf428189777e35b89543559b/week_2_tasks.sql?raw=true
-- Tables detected: 5 | FK constraints: 4

create table baseballClub (
    clubName        nvarchar(100),
    contactName     nvarchar(100),
    primary key (clubName)
);

create table season (
    seasonYear      int,
    seasonName      nvarchar(6),
    primary key (seasonYear, seasonName)
);

create table player (
    playerId        int,
    firstName       nvarchar(100),
    lastName        nvarchar(100),
    phone           nvarchar(50),
    primary key (playerId)   
);

create table teamEntry (
    ageGroup        nvarchar(3),
    teamNumber      int,
    clubName        nvarchar(100),
    seasonYear      int,
    seasonName      nvarchar(6),
    primary key (ageGroup, teamNumber, clubName, seasonYear, seasonName),
    foreign key (clubName) references baseballClub,
    foreign key (seasonYear, seasonName) references season, 
);

create table playerRegistration (
    dateRegistered  date,
    playerID        int,
    clubName        nvarchar(100),
    seasonYear      int,
    seasonName      nvarchar(6),
    ageGroup        nvarchar(3),
    teamNumber      int,
    primary key (playerID, clubName, seasonYear, seasonName, ageGroup, teamNumber),
    foreign key (playerID) references player,
    foreign key (ageGroup, teamNumber, clubName, seasonYear, seasonName) references teamEntry,
);

