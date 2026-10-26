-- Source: https://github.com/paarshan4800/football-manager/blob/a275f62f127532103606af7ba2c3225a4b756646/src/setup/query.sql?raw=true
-- Tables detected: 12 | FK constraints: 12

create table managers
(
    manager_id int NOT NULL,
    name       varchar(255),
    country    varchar(255),
    age        int,
    username   varchar(255),
    password   varchar(255),
    PRIMARY KEY (manager_id)
);

create table teams
(
    team_id    BIGINT NOT NULL,
    manager_id int,
    name       varchar(255),
    badge      varchar(512),
    PRIMARY KEY (team_id),
    FOREIGN KEY (manager_id) REFERENCES managers (manager_id)
);

create table standings
(
    team_id        BIGINT NOT NULL,
    position       int,
    matches_played int,
    matches_won    int,
    matches_drawn  int,
    matches_lost   int,
    goals_for      int,
    goals_against  int,
    points         int,
    PRIMARY KEY (team_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id)
);

create table players
(
    player_id      BIGINT NOT NULL,
    team_id        BIGINT,
    name           varchar(255),
    shirt_number   int,
    country        varchar(255),
    position       varchar(255),
    age            int,
    matches_played int,
    goals_scored   int,
    yellow_cards   int,
    red_cards      int,
    username       varchar(255),
    password       varchar(255),
    PRIMARY KEY (player_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id)
);

create table transfers
(
    transfer_id BIGINT NOT NULL auto_increment,
    player_id   BIGINT,
    fromTeam_id BIGINT,
    toTeam_id   BIGINT,
    status      int,
    type        ENUM('permanenttransfers', 'playerexchangetransfers', 'loantransfers') NOT NULL,
    PRIMARY KEY (transfer_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (fromTeam_id) REFERENCES teams (team_id),
    FOREIGN KEY (toTeam_id) REFERENCES teams (team_id)
);

create table permanentTransfers
(
    transfer_id  BIGINT,
    transfer_fee DOUBLE,
    PRIMARY KEY (transfer_id),
    FOREIGN KEY (transfer_id) REFERENCES transfers (transfer_id) ON DELETE CASCADE
);

create table playerExchangeTransfers
(
    transfer_id           BIGINT,
    exchangePlayer_id     BIGINT,
    exchangePlayerTeam_id BIGINT,
    PRIMARY KEY (transfer_id),
    FOREIGN KEY (transfer_id) REFERENCES permanentTransfers (transfer_id) ON DELETE CASCADE,
    FOREIGN KEY (exchangePlayerTeam_id) REFERENCES transfers (toTeam_id)
);

create table loanTransfers
(
    transfer_id       BIGINT,
    wage_split        int,
    duration_inMonths int,
    PRIMARY KEY (transfer_id),
    FOREIGN KEY (transfer_id) REFERENCES transfers (transfer_id) ON DELETE CASCADE
);

create table topScorers
(
    player_id    BIGINT NOT NULL,
    team_id      BIGINT NOT NULL,
    goals_scored int,
    PRIMARY KEY (player_id, team_id),
    FOREIGN KEY (player_id) REFERENCES players (player_id),
    FOREIGN KEY (team_id) REFERENCES teams (team_id)
);

create table finishedMatches
(
    match_id      BIGINT NOT NULL AUTO_INCREMENT,
    date          varchar(255),
    time          varchar(255),
    homeTeam      varchar(255),
    awayTeam      varchar(255),
    homeTeamScore int,
    awayTeamScore int,
    PRIMARY KEY (match_id)
);

create table upcomingMatches
(
    match_id BIGINT NOT NULL AUTO_INCREMENT,
    date     varchar(255),
    time     varchar(255),
    homeTeam varchar(255),
    awayTeam varchar(255),
    PRIMARY KEY (match_id)
);

create table lastupdated
(
    table_name varchar(255),
    date_time  varchar(255),
    PRIMARY KEY (table_name)
);

