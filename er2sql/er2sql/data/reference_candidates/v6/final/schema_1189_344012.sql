-- Source: https://github.com/BarakatN/GeoEntreprise/blob/8521884ec5021556f08705bb7ca542e5a467f511/schemas/vokuro-postgresql.sql?raw=true
-- Tables detected: 9 | FK constraints: 8
CREATE TABLE email_confirmations (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    code character(32) NOT NULL,
    "createdAt" integer NOT NULL,
    "modifiedAt" integer,
    confirmed character(1) DEFAULT 'N'::bpchar
);
CREATE TABLE failed_logins (
    id integer NOT NULL,
    "usersId" integer,
    "ipAddress" character(15) NOT NULL,
    attempted integer NOT NULL
);
CREATE TABLE password_changes (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    "ipAddress" character(15) NOT NULL,
    "userAgent" character varying(48) NOT NULL,
    "createdAt" integer NOT NULL
);
CREATE TABLE permissions (
    id integer NOT NULL,
    "profilesId" integer NOT NULL,
    resource character varying(16) NOT NULL,
    action character varying(16) NOT NULL
);
CREATE TABLE profiles (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    active character(1) NOT NULL
);
CREATE TABLE remember_tokens (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    token character(32) NOT NULL,
    "userAgent" character varying(120) NOT NULL,
    "createdAt" integer NOT NULL
);
CREATE TABLE reset_passwords (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    code character varying(48) NOT NULL,
    "createdAt" integer NOT NULL,
    "modifiedAt" integer,
    reset character(1) NOT NULL
);
CREATE TABLE success_logins (
    id integer NOT NULL,
    "usersId" integer NOT NULL,
    "ipAddress" character(15) NOT NULL,
    "userAgent" character varying(120) NOT NULL
);
CREATE TABLE users (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character(60) NOT NULL,
    "mustChangePassword" character(1) DEFAULT NULL::bpchar,
    "profilesId" integer NOT NULL,
    banned character(1) NOT NULL,
    suspended character(1) NOT NULL,
    active character(1) DEFAULT NULL::bpchar
);
ALTER TABLE email_confirmations ADD CONSTRAINT email_confirmations_fk FOREIGN KEY ("usersId") REFERENCES users(id);
ALTER TABLE failed_logins ADD CONSTRAINT failed_logins_fk FOREIGN KEY ("usersId") REFERENCES users(id) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE password_changes ADD CONSTRAINT password_changes_fk FOREIGN KEY ("usersId") REFERENCES users(id);
ALTER TABLE permissions ADD CONSTRAINT permissions_fk FOREIGN KEY ("profilesId") REFERENCES profiles(id);
ALTER TABLE remember_tokens ADD CONSTRAINT remember_tokens_fk FOREIGN KEY ("usersId") REFERENCES users(id);
ALTER TABLE reset_passwords ADD CONSTRAINT reset_passwords_fk FOREIGN KEY ("usersId") REFERENCES users(id);
ALTER TABLE success_logins ADD CONSTRAINT success_logins_fk FOREIGN KEY ("usersId") REFERENCES users(id);
ALTER TABLE users ADD CONSTRAINT users_fk FOREIGN KEY ("profilesId") REFERENCES profiles(id);
