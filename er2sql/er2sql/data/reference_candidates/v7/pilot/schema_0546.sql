-- Source: https://github.com/JAMorello/HPlus_Bot/blob/8927798f5e12828bfe93f5cc3b0808b9957d83f2/data/hplusbot_create_tables.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 2

CREATE TABLE twitter_user (
    user_id_str VARCHAR(20) NOT NULL PRIMARY KEY,
    user_screen_name VARCHAR(50) NOT NULL,
    description TEXT,
    location VARCHAR(100),
    followers INT NOT NULL,
    friends INT NOT NULL,
    statuses INT NOT NULL,
    favourites INT NOT NULL,
    CONSTRAINT unique_user_id_str UNIQUE (user_id_str) );

CREATE TABLE twitter_tweet (
    id BIGSERIAL NOT NULL PRIMARY KEY,
    tweet_id_str VARCHAR(20) NOT NULL,
    text TEXT NOT NULL,
    created_at TIMESTAMP NOT NULL,
    tweet_quoted VARCHAR(20),
    user_id_str VARCHAR(20) NOT NULL,
    FOREIGN KEY (user_id_str) REFERENCES twitter_user(user_id_str) );

CREATE TABLE nyt_links (
    id SERIAL NOT NULL PRIMARY KEY,
    link VARCHAR(255) NOT NULL);

CREATE TABLE tweet_id (
    id SERIAL NOT NULL PRIMARY KEY,
    last_tweet_id VARCHAR(20) NOT NULL);

