-- Source: https://github.com/FilipRebizant/company_manager/blob/814017c0b29b76bc9952da115de955f17a1a81ab/Docker/db/company-manager.sql?raw=true
-- Tables detected: 7 | FK constraints: 6
-- Foreign keys added via ALTER TABLE:
CREATE TABLE address (
    id int NOT NULL,
    street varchar(255) NOT NULL,
    town varchar(255) NOT NULL,
    post_code varchar(255) NOT NULL,
    house_number varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE commission (
    id int NOT NULL,
    address_id int DEFAULT NULL,
    name varchar(255) NOT NULL,
    description varchar(255) NOT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE material (
    id int NOT NULL,
    commission_id int DEFAULT NULL,
    name varchar(255) NOT NULL,
    code varchar(255) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    quantity int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE migration_versions (
    version varchar(14) NOT NULL,
    executed_at TIMESTAMP NOT NULL 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE report (
    id int NOT NULL,
    commission_id int DEFAULT NULL,
    user_id int DEFAULT NULL,
    created_at TIMESTAMP NOT NULL,
    day_description TEXT NOT NULL,
    started_at TIMESTAMP NOT NULL,
    finished_at TIMESTAMP NOT NULL,
    hours_summary int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE task (
    id int NOT NULL,
    commission_id int DEFAULT NULL,
    user_id int DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP DEFAULT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT NULL,
    status varchar(20) NOT NULL,
    priority varchar(20) NOT NULL,
    estimated_cost int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE "user" (
    id int NOT NULL,
    first_name varchar(255) NOT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    username varchar(255) NOT NULL,
    password varchar(255) DEFAULT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP DEFAULT NULL,
    active smallint NOT NULL,
    role varchar(255) NOT NULL,
    salary int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


                          

ALTER TABLE commission
  ADD CONSTRAINT fk_1c650158f5b7af75 FOREIGN KEY (address_id) REFERENCES address (id);

ALTER TABLE material
  ADD CONSTRAINT fk_7cbe7595202d1eb2 FOREIGN KEY (commission_id) REFERENCES commission (id);

ALTER TABLE report
  ADD CONSTRAINT fk_c42f7784202d1eb2 FOREIGN KEY (commission_id) REFERENCES commission (id),
  ADD CONSTRAINT fk_c42f7784a76ed395 FOREIGN KEY (user_id) REFERENCES "user" (id);

ALTER TABLE task
  ADD CONSTRAINT fk_527edb25202d1eb2 FOREIGN KEY (commission_id) REFERENCES commission (id),
  ADD CONSTRAINT fk_527edb25a76ed395 FOREIGN KEY (user_id) REFERENCES "user" (id);
COMMENT ON COLUMN migration_versions.executed_at IS '(DC2Type:datetime_immutable)';
