-- Source: https://github.com/ElectroluxV2/rdb/blob/e535559123376035674b72ad9979f7705ba0d8ec/create.sql?raw=true
-- Tables detected: 8 | FK/REFERENCES mentions: 12
create table clubs (
    club_id int not null auto_increment,
    short_name varchar(64) not null,
    full_name varchar(256) not null,
    primary key (club_id)
);

create table sailors (
    sailor_id int not null auto_increment,
    club_id int not null,
    given_name varchar(128) not null,
    family_name varchar(128) not null,
    birth_date TIMESTAMP not null,
    primary key (sailor_id),
    constraint fk_sailors_clubs_club_id foreign key (club_id) references clubs(club_id) on delete cascade
);

create table regattas (
    regatta_id int not null auto_increment,
    name varchar(512) not null,
    year int not null,
    cup_multiplier float not null,
    primary key (regatta_id)
);

create table starting_list (
    entry_id int not null auto_increment,
    sailor_id int not null,
    regatta_id int not null,
    sail_number varchar(10) not null,
    confirmed boolean default false,
    primary key (entry_id),
    constraint fk_starting_list_sailors_sailor_id foreign key (sailor_id) references sailors(sailor_id) on delete cascade,
    constraint fk_starting_list_regattas_regatta_id foreign key (regatta_id) references regattas(regatta_id) on delete cascade
);

create table races (
    race_id int not null auto_increment,
    regatta_id int not null,
    number int not null,
    name TEXT,
    primary key (race_id),
    constraint single_race_number_for_regatta unique (regatta_id, number),
    constraint fk_races_regattas_regatta_id foreign key (regatta_id) references regattas(regatta_id) on delete cascade
);

create table results_abbreviations (
    short_name varchar(5) not null unique,
    full_name varchar(255) not null,
    primary key (short_name)
);

create table race_results (
    race_id int not null,
    sail_number varchar(10) not null,
    place int not null,
    abbreviation varchar(5) default null,
    points int,
    primary key (race_id, sail_number),
    constraint fk_race_results_races_race_id foreign key (race_id) references races(race_id) on delete cascade,
    constraint fk_race_results_results_abbreviations_abbreviation foreign key (abbreviation) references results_abbreviations(short_name) on delete cascade
);

create table year_categories (
    category varchar(16) not null unique,
    younger_than int not null,
    primary key (category)
);
