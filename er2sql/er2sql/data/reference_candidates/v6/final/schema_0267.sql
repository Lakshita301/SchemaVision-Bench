-- Source: https://github.com/WS2022-S17-HU-R3/Station-01/blob/f9b0dd4b7b1bf500118f505100b249092af04ffc/submitted/db/dbhu_competitor_day2.sql?raw=true
-- Tables detected: 11 | FK/REFERENCES mentions: 13
CREATE TABLE attendees (
    id int NOT NULL,
    firstname varchar(45) NOT NULL,
    lastname varchar(45) NOT NULL,
    username varchar(45) NOT NULL,
    email varchar(255) NOT NULL,
    registration_code varchar(6) NOT NULL,
    login_token varchar(255) DEFAULT NULL
);
CREATE TABLE channels (
    id int NOT NULL,
    event_id int NOT NULL,
    name varchar(45) DEFAULT NULL
);
CREATE TABLE events (
    id int NOT NULL,
    organizer_id int NOT NULL,
    name varchar(45) DEFAULT NULL,
    slug varchar(45) DEFAULT NULL,
    date date DEFAULT NULL
);
CREATE TABLE event_ratings (
    id int NOT NULL,
    event_id int NOT NULL,
    attendee_id int NOT NULL,
    comment text NOT NULL,
    rating SMALLINT NOT NULL,
    rating_time TIMESTAMP NOT NULL
);
CREATE TABLE event_tickets (
    id int NOT NULL,
    event_id int NOT NULL,
    name varchar(45) DEFAULT NULL,
    cost decimal(9,2) DEFAULT NULL,
    special_validity varchar(255) DEFAULT NULL
);
CREATE TABLE organizers (
    id int NOT NULL,
    name varchar(45) NOT NULL,
    slug varchar(45) NOT NULL,
    email varchar(255) DEFAULT NULL,
    password_hash varchar(255) NOT NULL
);
CREATE TABLE registrations (
    id int NOT NULL,
    attendee_id int NOT NULL,
    ticket_id int NOT NULL,
    registration_time TIMESTAMP DEFAULT NULL
);
CREATE TABLE rooms (
    id int NOT NULL,
    channel_id int NOT NULL,
    name varchar(45) DEFAULT NULL,
    capacity int DEFAULT NULL
);
CREATE TABLE sessions (
    id int NOT NULL,
    room_id int NOT NULL,
    title varchar(255) NOT NULL,
    description TEXT DEFAULT NULL,
    speaker varchar(45) DEFAULT NULL,
    start TIMESTAMP NOT NULL,
    "end" TIMESTAMP NOT NULL,
    type TEXT NOT NULL CHECK (type IN ('talk', 'workshop')),
    cost decimal(9,2) DEFAULT NULL
);
CREATE TABLE session_ratings (
    id int NOT NULL,
    session_id int NOT NULL,
    attendee_id int NOT NULL,
    comment text NOT NULL,
    rating SMALLINT NOT NULL,
    rating_time TIMESTAMP NOT NULL
);
CREATE TABLE session_registrations (
    id int NOT NULL,
    registration_id int NOT NULL,
    session_id int NOT NULL
);
ALTER TABLE event_ratings
  ADD CONSTRAINT event_ratings_ibfk_1 FOREIGN KEY (attendee_id) REFERENCES attendees (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT event_ratings_ibfk_2 FOREIGN KEY (event_id) REFERENCES events (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE registrations
  ADD CONSTRAINT fk_registrations_attendees1 FOREIGN KEY (attendee_id) REFERENCES attendees (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_registrations_tickets1 FOREIGN KEY (ticket_id) REFERENCES event_tickets (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE session_ratings
  ADD CONSTRAINT session_ratings_ibfk_1 FOREIGN KEY (session_id) REFERENCES sessions (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT session_ratings_ibfk_2 FOREIGN KEY (attendee_id) REFERENCES attendees (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE session_registrations
  ADD CONSTRAINT fk_registrations_has_sessions_registrations1 FOREIGN KEY (registration_id) REFERENCES registrations (id) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT fk_registrations_has_sessions_sessions1 FOREIGN KEY (session_id) REFERENCES sessions (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE channels ADD CONSTRAINT fk_channels_events1 FOREIGN KEY (event_id) REFERENCES events (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE events ADD CONSTRAINT fk_events_organizers1 FOREIGN KEY (organizer_id) REFERENCES organizers (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE event_ratings ADD CONSTRAINT event_ratings_ibfk_1 FOREIGN KEY (attendee_id) REFERENCES attendees (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE event_tickets ADD CONSTRAINT fk_tickets_events FOREIGN KEY (event_id) REFERENCES events (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE registrations ADD CONSTRAINT fk_registrations_attendees1 FOREIGN KEY (attendee_id) REFERENCES attendees (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE rooms ADD CONSTRAINT fk_rooms_channels1 FOREIGN KEY (channel_id) REFERENCES channels (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE sessions ADD CONSTRAINT fk_sessions_rooms1 FOREIGN KEY (room_id) REFERENCES rooms (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE session_ratings ADD CONSTRAINT session_ratings_ibfk_1 FOREIGN KEY (session_id) REFERENCES sessions (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE session_registrations ADD CONSTRAINT fk_registrations_has_sessions_registrations1 FOREIGN KEY (registration_id) REFERENCES registrations (id) ON DELETE NO ACTION ON UPDATE NO ACTION;
