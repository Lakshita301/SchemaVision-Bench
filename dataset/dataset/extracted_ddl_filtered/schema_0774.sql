-- Source: https://github.com/bcgov/mds/blob/6c7186b844d07a1be5891ea42976fab014c06f1c/migrations/sql/V2021.06.10.16.33__update_camp_submission_activity.sql?raw=true
-- Tables detected: 3 | FK/REFERENCES mentions: 6

CREATE TABLE NOW_Submissions.camps (
  ID serial PRIMARY KEY,
	MESSAGEID integer,
	NAME varchar,
  PEOPLEINCAMP numeric,
  NUMBEROFSTRUCTURES numeric,
  DESCRIPTIONOFSTRUCTURES varchar,
  WASTEDISPOSAL varchar,
  SANITARYFACILITIES varchar,
  WATERSUPPLY varchar,
  QUANTITYOFWATER numeric,
	DISTURBEDAREA numeric,
	TIMBERVOLUME numeric,

  FOREIGN KEY (MESSAGEID) REFERENCES NOW_Submissions.application(MESSAGEID) DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE NOW_Submissions.stagingareas (
  ID serial PRIMARY KEY,
	MESSAGEID integer,
	NAME varchar,
	DISTURBEDAREA numeric,
	TIMBERVOLUME numeric,

  FOREIGN KEY (MESSAGEID) REFERENCES NOW_Submissions.application(MESSAGEID) DEFERRABLE INITIALLY DEFERRED
);

CREATE TABLE NOW_Submissions.buildings (
  ID serial PRIMARY KEY,
	MESSAGEID integer,
	NAME varchar,
  PURPOSE varchar,
  STRUCTURE varchar,
	DISTURBEDAREA numeric(14,2),
	TIMBERVOLUME numeric(14,2),

  FOREIGN KEY (MESSAGEID) REFERENCES NOW_Submissions.application(MESSAGEID) DEFERRABLE INITIALLY DEFERRED
);

