-- Source: https://github.com/dewianisaist/thesis/blob/70f83a8c1535548eea470834d56a70c71b0b9502/thesis-dummy.sql?raw=true
-- Tables detected: 20 | FK constraints: 23
CREATE TABLE choice (
    user_id int NOT NULL,
    criteria_id int NOT NULL,
    option varchar(1) NOT NULL,
    suggestion varchar(1) NOT NULL
);
CREATE TABLE courses (
    id int NOT NULL,
    major varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE course_experience (
    registrant_id int NOT NULL,
    course_id int NOT NULL,
    organizer varchar(100) NOT NULL,
    graduation_year year(4) NOT NULL
);
CREATE TABLE criterias (
    id int NOT NULL,
    group_criteria int DEFAULT NULL,
    name varchar(500) DEFAULT NULL,
    description varchar(1000) DEFAULT NULL,
    citation varchar(1000) DEFAULT NULL,
    information varchar(1000) DEFAULT NULL,
    partial_weight decimal(20,3) DEFAULT NULL,
    global_weight decimal(20,3) DEFAULT NULL,
    preference varchar(10) DEFAULT NULL,
    max_min varchar(10) DEFAULT NULL,
    parameter_p decimal(20,3) DEFAULT NULL,
    parameter_q decimal(20,3) DEFAULT NULL,
    parameter_s decimal(20,3) DEFAULT NULL,
    step varchar(1) DEFAULT NULL,
    status varchar(1) DEFAULT NULL,
    ref_id int DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE documents (
    id int NOT NULL,
    registrant_id int NOT NULL,
    photo varchar(255) DEFAULT NULL,
    ktp varchar(255) DEFAULT NULL,
    last_certificate varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE educational_background (
    registrant_id int NOT NULL,
    education_id int NOT NULL,
    name_institution varchar(100) NOT NULL,
    graduation_year year(4) NOT NULL
);
CREATE TABLE educations (
    id int NOT NULL,
    stage varchar(50) DEFAULT NULL,
    major varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE pairwise_comparisons (
    criteria1_id int NOT NULL,
    criteria2_id int NOT NULL,
    value decimal(20,3) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE permissions (
    id int NOT NULL,
    name varchar(100) DEFAULT NULL,
    display_name varchar(100) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE permission_role (
    role_id int NOT NULL,
    permission_id int NOT NULL
);
CREATE TABLE registrants (
    id int NOT NULL,
    user_id int NOT NULL,
    address varchar(255) DEFAULT NULL,
    phone_number varchar(15) DEFAULT NULL,
    gender varchar(15) DEFAULT NULL,
    place_birth varchar(50) DEFAULT NULL,
    date_birth date DEFAULT NULL,
    order_child SMALLINT DEFAULT NULL,
    amount_sibling SMALLINT DEFAULT NULL,
    religion varchar(15) DEFAULT NULL,
    biological_mother_name varchar(100) DEFAULT NULL,
    father_name varchar(100) DEFAULT NULL,
    parent_address varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE registrations (
    id int NOT NULL,
    registrant_id int NOT NULL,
    sub_vocational_id int NOT NULL,
    register_date timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE result_selection (
    selection_id int NOT NULL,
    criteria_id int NOT NULL,
    value int DEFAULT NULL
);
CREATE TABLE roles (
    id int NOT NULL,
    name varchar(100) DEFAULT NULL,
    display_name varchar(100) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE role_user (
    role_id int NOT NULL,
    user_id int NOT NULL
);
CREATE TABLE selections (
    id int NOT NULL,
    registration_id int NOT NULL,
    selection_schedule_id int NOT NULL,
    knowledge_value int DEFAULT NULL,
    technical_value int DEFAULT NULL,
    recommendation varchar(5) DEFAULT NULL,
    impression_value varchar(20) DEFAULT NULL,
    seriousness_value varchar(20) DEFAULT NULL,
    confidence_value varchar(20) DEFAULT NULL,
    communication_value varchar(20) DEFAULT NULL,
    appearance_value varchar(20) DEFAULT NULL,
    family_value varchar(20) DEFAULT NULL,
    motivation_value varchar(255) DEFAULT NULL,
    attitude_value varchar(20) DEFAULT NULL,
    orientation_value varchar(255) DEFAULT NULL,
    commitment_value varchar(20) DEFAULT NULL,
    honesty_value varchar(20) DEFAULT NULL,
    mental_value varchar(20) DEFAULT NULL,
    economic_value varchar(20) DEFAULT NULL,
    potential_value varchar(20) DEFAULT NULL,
    note varchar(255) DEFAULT NULL,
    final_score decimal(20,3) DEFAULT NULL,
    ranking int DEFAULT NULL,
    status varchar(15) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE selection_schedules (
    id int NOT NULL,
    sub_vocational_id int NOT NULL,
    date date DEFAULT NULL,
    time varchar(20) DEFAULT NULL,
    place varchar(100) DEFAULT NULL,
    information varchar(1000) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE sub_vocationals (
    id int NOT NULL,
    vocational_id int NOT NULL,
    name varchar(100) DEFAULT NULL,
    quota int DEFAULT NULL,
    long_training varchar(10) DEFAULT NULL,
    goal varchar(1000) DEFAULT NULL,
    unit_competence varchar(1000) DEFAULT NULL,
    requirement_participant varchar(1000) DEFAULT NULL,
    final_registration_date timestamp NULL DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE users (
    id int NOT NULL,
    identity_number varchar(20) DEFAULT NULL,
    name varchar(100) DEFAULT NULL,
    email varchar(100) DEFAULT NULL,
    password varchar(100) DEFAULT NULL,
    remember_token varchar(100) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
CREATE TABLE vocationals (
    id int NOT NULL,
    name varchar(100) DEFAULT NULL,
    description varchar(255) DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL
);
ALTER TABLE choice ADD CONSTRAINT fk_criterias_has_users_criterias1 FOREIGN KEY (criteria_id) REFERENCES criterias (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE choice ADD CONSTRAINT fk_criterias_has_users_users1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE course_experience ADD CONSTRAINT fk_pendaftar_has_kursus_kursus1 FOREIGN KEY (course_id) REFERENCES courses (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE course_experience ADD CONSTRAINT fk_pendaftar_has_kursus_pendaftar1 FOREIGN KEY (registrant_id) REFERENCES registrants (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE criterias ADD CONSTRAINT fk_criterias_criterias1 FOREIGN KEY (group_criteria) REFERENCES criterias (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE documents ADD CONSTRAINT fk_upload_pendaftar1 FOREIGN KEY (registrant_id) REFERENCES registrants (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE educational_background ADD CONSTRAINT fk_pendaftar_has_pendidikan_pendaftar1 FOREIGN KEY (registrant_id) REFERENCES registrants (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE educational_background ADD CONSTRAINT fk_pendaftar_has_pendidikan_pendidikan1 FOREIGN KEY (education_id) REFERENCES educations (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE pairwise_comparisons ADD CONSTRAINT fk_pairwise_comparison_criterias1 FOREIGN KEY (criteria1_id) REFERENCES criterias (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE pairwise_comparisons ADD CONSTRAINT fk_pairwise_comparisons_criterias1 FOREIGN KEY (criteria2_id) REFERENCES criterias (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE permission_role ADD CONSTRAINT fk_roles_has_permissions_permissions1 FOREIGN KEY (permission_id) REFERENCES permissions (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE permission_role ADD CONSTRAINT fk_roles_has_permissions_roles1 FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE registrants ADD CONSTRAINT fk_pendaftar_users1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE registrations ADD CONSTRAINT fk_registration_registrants1 FOREIGN KEY (registrant_id) REFERENCES registrants (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE registrations ADD CONSTRAINT fk_registration_sub_vocationals1 FOREIGN KEY (sub_vocational_id) REFERENCES sub_vocationals (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE result_selection ADD CONSTRAINT fk_result_selections_criterias1 FOREIGN KEY (criteria_id) REFERENCES criterias (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE result_selection ADD CONSTRAINT fk_result_selections_selections1 FOREIGN KEY (selection_id) REFERENCES selections (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE role_user ADD CONSTRAINT fk_roles_has_users_roles1 FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE role_user ADD CONSTRAINT fk_roles_has_users_users1 FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE NO ACTION ON UPDATE CASCADE;
ALTER TABLE selections ADD CONSTRAINT fk_selections_registrations1 FOREIGN KEY (registration_id) REFERENCES registrations (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE selections ADD CONSTRAINT fk_selections_selection_schedules1 FOREIGN KEY (selection_schedule_id) REFERENCES selection_schedules (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE selection_schedules ADD CONSTRAINT fk_selection_schedules_sub_vocationals1 FOREIGN KEY (sub_vocational_id) REFERENCES sub_vocationals (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE sub_vocationals ADD CONSTRAINT fk_sub_kejuruan_kejuruan1 FOREIGN KEY (vocational_id) REFERENCES vocationals (id) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMENT ON COLUMN choice.option IS '0: tidak sesuai 1: sesuai';
COMMENT ON COLUMN choice.suggestion IS '0: baku 1: usulan';
COMMENT ON COLUMN criterias.step IS '1: tahap 1 2: tahap 2';
COMMENT ON COLUMN criterias.status IS '0: deleted 1: active';
COMMENT ON COLUMN selections.status IS '“”: proses penilaian, Selesai: selesai penilaian, Diterima: hasil lampau diterima, Ditolak: hasil lampau tidak diterima';
