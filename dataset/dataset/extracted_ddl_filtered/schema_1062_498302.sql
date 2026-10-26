-- Source: https://github.com/jonathanjlee/jonathanjlee.github.io/blob/bcc3f0d2e39e05fad59826998c81c234739fc935/projectFiles/BullsAndCows/BACDatabaseTest.sql?raw=true
-- Tables detected: 3 | FK constraints: 1

CREATE TABLE Guess (
	GuessId INT PRIMARY KEY AUTO_INCREMENT,
    Guess VARCHAR(15) NOT NULL,
    `Time` DATETIME NOT NULL
);

CREATE TABLE `Round` (
	RoundId INT PRIMARY KEY AUTO_INCREMENT,
    GuessId INT NOT NULL,
    FOREIGN KEY fk_Round_Guess (GuessId)
    REFERENCES Guess(GuessId),
    Result VARCHAR(7) NOT NULL
);

CREATE TABLE Game (
	GameId INT PRIMARY KEY AUTO_INCREMENT,
    Answer VARCHAR(15) NOT NULL,
    RoundId INT NULL,
    FOREIGN KEY fk_Game_Round (RoundId)
    REFERENCES `Round`(RoundId),
    InProgress BOOL NOT NULL DEFAULT 1
);

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `Round`
	ADD COLUMN (
		GameId INT NOT NULL
	),
    ADD CONSTRAINT fk_Round_Game
		FOREIGN KEY (GameId)
        REFERENCES Game(GameId);

