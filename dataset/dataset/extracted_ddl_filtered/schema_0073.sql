-- Source: https://github.com/KhalilKes/shanoir_ms/blob/57a35425c315d5422c1f5965a6c3920b07bf8725/MS_ChallengeScores/src/main/resources/mysql-create-schema.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 12

create table SCORE (
	ID bigint not null auto_increment,
	SCORE_VALUE float,
    METRIC_ID bigint not null,
    OWNER_ID bigint not null,
    PATIENT_ID bigint not null,
    INPUT_DATASET_ID bigint,
    STUDY_ID bigint not null,
	primary key (ID)
) ENGINE=InnoDB;

create table METRIC (
	ID bigint not null auto_increment,
    NAME varchar(31) unique,
    NAN varchar(31),
    POS_INF varchar(31),
    NEG_INF varchar(31),
	primary key (ID)
) ENGINE=InnoDB;

create table METRIC_STUDY_REL (
    METRIC_ID bigint not null,
    STUDY_ID bigint not null,
	primary key (METRIC_ID, STUDY_ID)
) ENGINE=InnoDB;

create table CHALLENGER (
	ID bigint not null,
    NAME varchar(31),
	primary key (ID)
) ENGINE=InnoDB;

create table PATIENT (
	ID bigint not null,
    NAME varchar(31),
	primary key (ID)
) ENGINE=InnoDB;

create table STUDY (
	ID bigint not null,
    NAME varchar(31),
	primary key (ID)
) ENGINE=InnoDB;

-- Foreign keys added via ALTER TABLE:
alter table SCORE
	add index SCORE_METRIC_ID_INDEX (METRIC_ID),
	add constraint SCORE_METRIC_ID_FK
		foreign key (METRIC_ID)
		references METRIC(ID);

alter table SCORE
	add index SCORE_OWNER_ID_INDEX (OWNER_ID),
	add constraint SCORE_OWNER_ID_FK
		foreign key (OWNER_ID)
		references CHALLENGER(ID);

alter table SCORE
	add index SCORE_PATIENT_ID_INDEX (PATIENT_ID),
	add constraint SCORE_PATIENT_ID_FK
		foreign key (PATIENT_ID)
		references PATIENT(ID);

alter table SCORE
	add index SCORE_STUDY_ID_INDEX (STUDY_ID),
	add constraint SCORE_STUDY_ID_FK
		foreign key (STUDY_ID)
		references STUDY(ID);

alter table METRIC_STUDY_REL
	add index MS_REL_METRIC_ID_INDEX (METRIC_ID),
	add constraint MS_REL_METRIC_ID_FK
		foreign key (METRIC_ID)
		references METRIC(ID);

alter table METRIC_STUDY_REL
	add index MS_REL_STUDY_ID_INDEX (STUDY_ID),
	add constraint MS_REL_STUDY_ID_FK
		foreign key (STUDY_ID)
		references STUDY(ID);

