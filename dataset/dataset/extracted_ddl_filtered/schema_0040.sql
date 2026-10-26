-- Source: https://github.com/craigbartdev/CS460-Project/blob/f7969bc09a82143bb194a2076c6cfabf03afb5eb/schema.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 12

CREATE TABLE Users (
    user_id int4  AUTO_INCREMENT NOT NULL,
    email varchar(255) NOT NULL UNIQUE,
    password varchar(255),
    firstname varchar(20),
    lastname varchar(30),
    dob date,
    hometown varchar(30),
    gender varchar(6),
    pphoto longblob,
    bio varchar(255),
  CONSTRAINT users_pk PRIMARY KEY (user_id)
);

CREATE TABLE Friends
(
  user_id int4 NOT NULL,
  friend_id int4,
  CONSTRAINT friends_pk PRIMARY KEY (user_id, friend_id),
  CONSTRAINT uid_fk FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
  CONSTRAINT fid_fk FOREIGN KEY (friend_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Albums
(
  album_id int4 AUTO_INCREMENT NOT NULL,
  album_name varchar(20),
  user_id int4,
  doa date,
  CONSTRAINT albums_pk PRIMARY KEY (album_id),
  CONSTRAINT album_fk FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE
);

CREATE TABLE Pictures
(
  picture_id int4  AUTO_INCREMENT NOT NULL,
  user_id int4 NOT NULL,
  imgdata longblob ,
  caption VARCHAR(255),
  album_id int4 NOT NULL,
  INDEX upid_idx (user_id),
  CONSTRAINT pictures_pk PRIMARY KEY (picture_id),
  CONSTRAINT pictures_fk FOREIGN KEY (album_id) REFERENCES Albums(album_id) ON DELETE CASCADE
);

CREATE TABLE Tags
(
  tag varchar(20) NOT NULL,
  picture_id int4 NOT NULL,
  CONSTRAINT tag_pk PRIMARY KEY (tag, picture_id),
  CONSTRAINT tag_fk FOREIGN KEY (picture_id) references Pictures(picture_id) ON DELETE CASCADE
);

CREATE TABLE Comments
(
  cid int4 AUTO_INCREMENT NOT NULL,
  comment varchar(255),
  user_id int4,
  picture_id int4,
  doc date,
  CONSTRAINT comment_pk PRIMARY KEY (cid),
  CONSTRAINT comment_fk FOREIGN KEY (user_id) references Users(user_id) ON DELETE CASCADE
);

