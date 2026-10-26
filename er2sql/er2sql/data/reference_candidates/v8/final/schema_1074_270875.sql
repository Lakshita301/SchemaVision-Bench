-- Source: https://github.com/AdrianE-Gonzalez/The_Tutors-Homes_Needs_Service_Project/blob/f423914b114c3f203ce1dace310f318417a0087f/Code/sql_code/Database_HNS.sql?raw=true
-- Tables detected: 10 | FK constraints: 9
CREATE TABLE appointments (
    appointment_id int NOT NULL,
    client_id int NOT NULL,
    servicer_id int NOT NULL,
    special_instructions varchar(255) NOT NULL,
    date date NOT NULL,
    time time NOT NULL,
    service varchar(255) NOT NULL,
    address_number int NOT NULL,
    street varchar(255) NOT NULL,
    zip_code int NOT NULL,
    city varchar(255) NOT NULL,
    state varchar(255) NOT NULL
);
CREATE TABLE clients (
    client_id int NOT NULL,
    user_id int NOT NULL
);
CREATE TABLE payments (
    payment_id int NOT NULL,
    client_id int NOT NULL,
    servicer_id int NOT NULL,
    service varchar(255) NOT NULL,
    datetime TIMESTAMP NOT NULL,
    amount float NOT NULL
);
CREATE TABLE providesservice (
    id int NOT NULL,
    servicer_id int NOT NULL,
    service varchar(255) NOT NULL
);
CREATE TABLE reviews (
    review_id int NOT NULL,
    client_id int NOT NULL,
    servicer_id int NOT NULL,
    written_review varchar(255) NOT NULL,
    rating int NOT NULL,
    service varchar(255) NOT NULL,
    date date NOT NULL
);
CREATE TABLE servicers (
    servicer_id int NOT NULL,
    user_id int NOT NULL,
    distance_from_address int NOT NULL,
    average_rating int NOT NULL
);
CREATE TABLE services (
    service_id int NOT NULL,
    service varchar(255) NOT NULL
);
CREATE TABLE sessiontimeout (
    timeout int NOT NULL
);
CREATE TABLE users (
    user_id int NOT NULL,
    name varchar(255) NOT NULL,
    phone_number varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    password varchar(255) NOT NULL,
    address_number int NOT NULL,
    street varchar(255) NOT NULL,
    zip_code int NOT NULL,
    city varchar(255) NOT NULL,
    state varchar(255) NOT NULL,
    driver_license_number varchar(255) NOT NULL,
    driver_license_picture BYTEA NOT NULL
);
CREATE TABLE usersession (
    user_id int NOT NULL,
    session_id int NOT NULL,
    session_time timestamp NOT NULL DEFAULT current_timestamp()(),
    session_ip varchar(255) NOT NULL
);
ALTER TABLE appointments ADD CONSTRAINT appointments_ibfk_1 FOREIGN KEY (client_id) REFERENCES clients (client_id);
ALTER TABLE appointments ADD CONSTRAINT appointments_ibfk_2 FOREIGN KEY (servicer_id) REFERENCES servicers (servicer_id);
ALTER TABLE clients ADD CONSTRAINT clients_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (user_id);
ALTER TABLE payments ADD CONSTRAINT payments_ibfk_1 FOREIGN KEY (client_id) REFERENCES clients (client_id);
ALTER TABLE payments ADD CONSTRAINT payments_ibfk_2 FOREIGN KEY (servicer_id) REFERENCES servicers (servicer_id);
ALTER TABLE providesservice ADD CONSTRAINT providesservice_ibfk_1 FOREIGN KEY (servicer_id) REFERENCES servicers (servicer_id);
ALTER TABLE reviews ADD CONSTRAINT reviews_ibfk_1 FOREIGN KEY (client_id) REFERENCES clients (client_id);
ALTER TABLE reviews ADD CONSTRAINT reviews_ibfk_2 FOREIGN KEY (servicer_id) REFERENCES servicers (servicer_id);
ALTER TABLE servicers ADD CONSTRAINT servicers_ibfk_1 FOREIGN KEY (user_id) REFERENCES users (user_id);
