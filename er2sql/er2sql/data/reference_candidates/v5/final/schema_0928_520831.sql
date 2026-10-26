-- Source: https://github.com/PlayAnt/OpenDE/blob/7c771952f93eec11a4fd09c0c8dafff9ee39687b/docs/Flask/schema.sql?raw=true
-- Tables detected: 9 | FK constraints: 9
-- ,
-- PRIMARY KEY (lesson, user)
CREATE TABLE "user"(
    email TEXT NOT NULL,
    password TEXT NOT NULL,
    accountType TEXT NOT NULL,
    loggedIn BOOLEAN,
    token TEXT,
    PRIMARY KEY(email, accountType)
);

CREATE TABLE lessons(
    id INTEGER PRIMARY KEY,
    chapter TEXT NOT NULL,
    subchapter TEXT NOT NULL,
    points INTEGER NOT NULL,
    page TEXT NOT NULL
);

CREATE TABLE solved(
    odah INTEGER PRIMARY KEY,
    lesson TEXT NOT NULL,
    user TEXT NOT NULL,
    points INTEGER NOT NULL CHECK(points >=0),
    passed INTEGER,
    CONSTRAINT fk_lessons_lesson
  FOREIGN KEY (lesson) REFERENCES lessons(id),
    CONSTRAINT fk_user_user
  FOREIGN KEY (user) REFERENCES "user"(email)
);

CREATE TABLE questions(
    id INTEGER PRIMARY KEY,
    subchapter TEXT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    CONSTRAINT fk_lessons_questions
  FOREIGN KEY (subchapter) REFERENCES lessons(subchapter)
);

CREATE TABLE gateQuestions(
    id INTEGER PRIMARY KEY,
    subchapter TEXT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    circuits TEXT NOT NULL,
    truthTable TEXT NOT NULL,
    CONSTRAINT fk_lessons_gateQuestions
  FOREIGN KEY (subchapter) REFERENCES lessons(subchapter)
);

CREATE TABLE karnaughQuestions(
    id INTEGER PRIMARY KEY,
    subchapter TEXT NOT NULL,
    question TEXT NOT NULL,
    answer TEXT NOT NULL,
    CONSTRAINT fk_lessons_karnaughQuestions
  FOREIGN KEY (subchapter) REFERENCES lessons(subchapter)
);

CREATE TABLE class(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    key TEXT NOT NULL,
    admin TEXT NOT NULL,
    CONSTRAINT fk_class_lesson
  FOREIGN KEY (admin) REFERENCES "user"(email)
);

CREATE TABLE classroom(
    classID INTEGER NOT NULL,
    user TEXT NOT NULL,
    role TEXT NOT NULL,
    CONSTRAINT fk_classID_class
  FOREIGN KEY (classID) REFERENCES class(ID),
    CONSTRAINT fk_userclassroom_user
  FOREIGN KEY (user) REFERENCES "user"(email),
    PRIMARY KEY (classID, user)
);

CREATE TABLE tokens(
    id INTEGER PRIMARY KEY,
    user TEXT NOT NULL,
    type TEXT NOT NULL,
    token TEXT NOT NULL,
    expires TEXT NOT NULL,
    CONSTRAINT fk_token_user
  FOREIGN KEY (user) REFERENCES "user"(email)
);
