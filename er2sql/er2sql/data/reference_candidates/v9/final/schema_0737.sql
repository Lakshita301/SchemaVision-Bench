-- Source: https://github.com/Smarty-pro/wornak/blob/8eabd8a179c75c4df4071b19660febc03205c228/Wornak.sql?raw=true
-- Tables detected: 7 | FK/REFERENCES mentions: 3
-- Foreign keys added via ALTER TABLE:
CREATE TABLE admin
(
    id int NOT NULL,
    full_name varchar(255) NOT NULL,
    mail varchar(255) NOT NULL,
    tel varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    user_id int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE company
(
    id int NOT NULL,
    roles TEXT     NOT NULL ,
    employees_number varchar(255) NOT NULL,
    company_name varchar(255) NOT NULL,
    description TEXT     NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE doctrine_migration_versions
(
    version varchar(191) NOT NULL,
    executed_at TIMESTAMP DEFAULT NULL,
    execution_time int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE job_post
(
    id int NOT NULL,
    company varchar(255) NOT NULL,
    job_title varchar(255) NOT NULL,
    description TEXT     NOT NULL,
    reference varchar(255) NOT NULL,
    exp_date date                                    NOT NULL,
    job_zone varchar(255) NOT NULL,
    training varchar(255) DEFAULT NULL,
    contract_type varchar(255) NOT NULL,
    published_at TIMESTAMP                                NOT NULL,
    salary int NOT NULL,
    sector varchar(255) NOT NULL,
    study_level_required varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE job_seeker (
    id int NOT NULL,
    roles TEXT NOT NULL ,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    gender varchar(255) NOT NULL,
    birthday_date date NOT NULL,
    address varchar(255) NOT NULL,
    mobility varchar(255) NOT NULL,
    handicap SMALLINT NOT NULL,
    diploma varchar(255) DEFAULT NULL,
    skills TEXT DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE search_bar (
    id int NOT NULL,
    search_content varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user" (
    id int NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    activation_token varchar(255) DEFAULT NULL,
    tel int DEFAULT NULL,
    companies_id int DEFAULT NULL,
    jobseeker_id int DEFAULT NULL,
    uuid varchar(255) NOT NULL,
    roles TEXT DEFAULT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                          

ALTER TABLE admin
    ADD CONSTRAINT fk_880e0d76a76ed395 FOREIGN KEY (user_id) REFERENCES "user" (id);

ALTER TABLE "user"
    ADD CONSTRAINT fk_8d93d6494cf2b5a9 FOREIGN KEY (jobseeker_id) REFERENCES job_seeker (id),
  ADD CONSTRAINT fk_8d93d6496ae4741e FOREIGN KEY (companies_id) REFERENCES company (id);
COMMENT ON COLUMN company.roles IS '(DC2Type:json)';
COMMENT ON COLUMN job_seeker.roles IS '(DC2Type:json)';
COMMENT ON COLUMN "user".roles IS '(DC2Type:json)';
