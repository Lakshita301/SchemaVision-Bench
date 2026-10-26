-- Source: https://github.com/emoyano21/poketest/blob/659ac2771a062cb0b6138e87136f2919bee45e92/databases/migrations/chat-plugins/v2.sql?raw=true
-- Tables detected: 6 | FK/REFERENCES mentions: 4

CREATE TABLE trivia_questions (
	question_id INTEGER NOT NULL PRIMARY KEY,
	question TEXT NOT NULL,
	category TEXT NOT NULL,
	-- unix timestamp in milliseconds
	added_at INTEGER NOT NULL,
	userid TEXT NOT NULL,
	is_submission TINYINT(1) NOT NULL,
	UNIQUE(question, category)
);

CREATE TABLE trivia_answers (
	question_id INTEGER NOT NULL,
	answer TEXT NOT NULL,
	PRIMARY KEY (question_id, answer),
	FOREIGN KEY (question_id) REFERENCES trivia_questions(question_id) ON DELETE CASCADE
);

CREATE TABLE trivia_leaderboard (
	userid TEXT NOT NULL,
	score INTEGER NOT NULL,
	total_points INTEGER NOT NULL,
	total_correct_answers INTEGER NOT NULL,
	-- indicates if this row is all time
	is_all_time TINYINT(1) NOT NULL,
	PRIMARY KEY (userid, is_all_time)
);

CREATE TABLE trivia_game_history (
	game_id INTEGER NOT NULL PRIMARY KEY,
	mode TEXT NOT NULL,
	-- either a length name ('long' etc) or a score cap
	length TEXT NOT NULL,
	category TEXT NOT NULL,
	-- unix timestamp in milliseconds
	time INTEGER NOT NULL,
	creator TEXT,
	gives_points TINYINT(1)
);

CREATE TABLE trivia_game_scores (
	game_id INTEGER NOT NULL,
	userid TEXT NOT NULL,
	score INTEGER NOT NULL,
	PRIMARY KEY (game_id, userid),
	FOREIGN KEY (game_id) REFERENCES trivia_game_history(game_id) ON DELETE CASCADE
);

CREATE TABLE trivia_settings (
	key TEXT NOT NULL PRIMARY KEY,
	value TINYINT(1) NOT NULL
);

