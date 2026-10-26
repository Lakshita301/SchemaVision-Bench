-- Source: https://github.com/CodeType8/InvoiceGenerator/blob/b837f8575c9ea7f7767227738c9995febc963747/vendor/Editor-PHP-1.9.5/examples/sql/sqlite.sql?raw=true
-- Tables detected: 12 | FK constraints: 6

CREATE TABLE todo (
    id integer primary key,
    item text NOT NULL default '',
    done boolean NOT NULL default '0',
    priority integer NOT NULL default 1
);

CREATE TABLE users (
    id integer primary key, 
    title text default NULL,
    first_name text default NULL,
    last_name text default NULL,
    phone text default NULL,
    city text default NULL,
    zip text default NULL,
    updated_date timestamp DEFAULT CURRENT_TIMESTAMP,
    registered_date timestamp,
    removed_date timestamp,
    active boolean default NULL,
    comments text default NULL,
    manager int default NULL,
    site int default NULL,
    image int default NULL,
    shift_start text default NULL,
    shift_end text default NULL,
    description text default NULL
);

CREATE TABLE dept (
    id integer primary key, 
    name text default NULL
);

CREATE TABLE permission (
    id integer primary key,  
    name text default NULL
);

CREATE TABLE sites (
    id integer primary key,  
    name text default NULL
);

CREATE TABLE files (
    id integer primary key,  
    filename text default NULL,
    filesize int default 0,
    web_path text default NULL,
    system_path text default NULL
);

CREATE TABLE user_dept (
    user_id int,
    dept_id int,
    PRIMARY KEY (user_id, dept_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (dept_id) REFERENCES dept(id) ON DELETE CASCADE
);

CREATE TABLE user_permission (
    user_id int,
    permission_id int,
    PRIMARY KEY (user_id, permission_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (permission_id) REFERENCES permission(id) ON DELETE CASCADE
);

CREATE TABLE users_files (
    user_id int NOT NULL,
    file_id int NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (file_id) REFERENCES files(id) ON DELETE CASCADE
);

CREATE TABLE audiobooks (
    id integer primary key,  
    title text NOT NULL,
    author text NOT NULL,
    duration int NOT NULL,
    readingOrder int NOT NULL
);

CREATE TABLE users_visits (
    user_id int NOT NULL,
    site_id int NOT NULL,
    visit_date date DEFAULT NULL,
    PRIMARY KEY (user_id, visit_date)
);

CREATE TABLE datatables_demo (
	id         integer primary key,
	first_name text NOT NULL default '',
	last_name  text NOT NULL default '',
	position   text NOT NULL default '',
	email      text NOT NULL default '',
	office     text NOT NULL default '',
	start_date timestamp default NULL,
	age        integer,
	salary     integer,
	seq        integer,
	extn       text NOT NULL default ''
);

