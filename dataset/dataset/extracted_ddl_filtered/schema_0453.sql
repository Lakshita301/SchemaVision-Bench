-- Source: https://github.com/CSC4790-Fall2021-Org/senior-project-icbm/blob/92689ec36269effdc7b795a33015fa57c7d3ec71/side_code/WholeTableDraft.sql?raw=true
-- Tables detected: 5 | FK/REFERENCES mentions: 3

CREATE TABLE `icmb-tables`.`customer` (
`Customer_ID` INT NOT NULL,
`Customer_First_Name` VARCHAR(45) NULL DEFAULT NULL,
PRIMARY KEY (`Customer_ID`));

CREATE TABLE `icmb-tables`.`result` (
  `Result_ID` INT NOT NULL,
  `Result_Description` VARCHAR(255) NULL,
  `Result_Risk` DOUBLE NULL,
  PRIMARY KEY (`Result_ID`),
  CONSTRAINT `Customer_ID`
    FOREIGN KEY (`Result_ID`)
    REFERENCES `icmb-tables`.`customer` (`Customer_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Question_Risk_Modifier`
    FOREIGN KEY (`Result_ID`)
    REFERENCES `icmb-tables`.`questions` (`Question_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE `icmb-tables`.`login_history` (
  `Login_ID` INT NOT NULL,
  `Login_Date` DATETIME NULL,
  PRIMARY KEY (`Login_ID`));

CREATE TABLE `icmb-tables`.`lookup_risk` (
  `Risk_ID` INT NOT NULL,
  `Risk_Description` VARCHAR(255) NULL,
  PRIMARY KEY (`Risk_ID`));

CREATE TABLE `icmb-tables`.`questions` (
  `Question_ID` INT NOT NULL,
  `Question_Description` VARCHAR(45) NULL,
  `Question_Risk_Modifier` DOUBLE NULL,
  PRIMARY KEY (`Question_ID`));

-- Foreign keys added via ALTER TABLE:
ALTER TABLE `icmb-tables`.`questions` 
ADD CONSTRAINT `Customer_ID`
  FOREIGN KEY (`Question_ID`)
  REFERENCES `icmb-tables`.`customer` (`Customer_ID`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

