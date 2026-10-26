-- Source: https://github.com/liamjknight/techElevatorStuff/blob/f9acc6429d44e6de364417a91561935a564fc1a7/module-2/Week2_Review/exercise-final/java/database/campground.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 6
-- Name of the park
-- State name(s) where park is located
-- Date park was established
-- Area in acres
-- Latest recorded number of annual visitors
--
-- Parent park
-- Name of the campground
-- Campground is open from month: 01=January,
-- Campground is open to month: 01=January,
-- Site numbers are
-- Sites are limited to 6 people,
-- Accessible site,
-- RVs/Trailers not permitted if length is 0
-- Electricity,
CREATE TABLE park (
    park_id integer DEFAULT nextval('park_park_id_seq'::regclass) NOT NULL,
    name varchar(80) NOT NULL,
    location varchar(50) NOT NULL,
    establish_date date NOT NULL,
    area integer NOT NULL,
    visitors integer NOT NULL,
    description varchar(500) NOT NULL,
    CONSTRAINT pk_park_park_id PRIMARY KEY (park_id)
);
CREATE TABLE campground (
    campground_id integer DEFAULT nextval('campground_campground_id_seq'::regclass) NOT NULL,
    park_id integer NOT NULL,
    name varchar(80) NOT NULL,
    open_from_mm varchar(2) NOT NULL,
    02=February,
    ... 12=December
  open_to_mm varchar(4) NOT NULL,
    02=February,
    ... 12=December
  daily_fee money NOT NULL,
    CONSTRAINT pk_campground_campground_id PRIMARY KEY (campground_id),
    FOREIGN KEY (park_id) REFERENCES park(park_id)
);
CREATE TABLE site (
    site_id integer DEFAULT nextval('site_site_id_seq'::regclass) NOT NULL,
    campground_id integer NOT NULL,
    site_number integer NOT NULL,
    max_occupancy integer NOT NULL DEFAULT 6,
    however some sites are "doubled" (12 people)
  accessible boolean NOT NULL DEFAULT FALSE,
    reserved for campers with disabilities
  max_rv_length integer NOT NULL DEFAULT 0,
    utilities boolean NOT NULL DEFAULT FALSE,
    running water available.
  CONSTRAINT pk_site_site_number_campground_id PRIMARY KEY (site_id),
    FOREIGN KEY (campground_id) REFERENCES campground(campground_id)
);
CREATE TABLE reservation (
    reservation_id integer DEFAULT nextval('reservation_reservation_id_seq'::regclass) NOT NULL,
    site_id integer NOT NULL,
    name varChar(80) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL,
    create_date date NOT NULL DEFAULT now(),
    CONSTRAINT pk_reservation_reservation_id PRIMARY KEY (reservation_id),
    FOREIGN KEY (site_id) REFERENCES site(site_id)
);
