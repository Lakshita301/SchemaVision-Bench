-- Source: https://github.com/romanoprid/Hibernate-IOT-2020/blob/f3fb393f350796df45988241e6d62c7059ecb288/src/main/resources/lab4.sql?raw=true
-- Tables detected: 15 | FK/REFERENCES mentions: 16

CREATE TABLE  user (
                       id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                       name VARCHAR(45),
                       birth_date INT,
                       followers INT,
                       followings INT,
                       posts INT
) ENGINE = INNODB;

CREATE TABLE  story (
                        id INT NOT NULL AUTO_INCREMENT ,
                        bloger VARCHAR(45),
                        link VARCHAR(45),
                        add_time INT,
                        content VARCHAR(45),
                        like_number INT,
                        share_number INT,
                        user_id INT NOT NULL,
                        PRIMARY KEY(id, user_id)
) ENGINE = INNODB;

CREATE TABLE  security (
                           id INT NOT NULL AUTO_INCREMENT,
                           password VARCHAR(30),
                           user_id INT NOT NULL,
                           PRIMARY KEY(id, user_id)
) ENGINE = INNODB;

CREATE TABLE initialization (
                                id INT NOT NULL AUTO_INCREMENT,
                                login VARCHAR(45),
                                user_id INT NOT NULL,
                                PRIMARY KEY(id, user_id)
) ENGINE = INNODB;

CREATE TABLE  save_on_top (
                              id INT NOT NULL AUTO_INCREMENT,
                              position INT,
                              status VARCHAR(45),
                              story_id INT NOT NULL,
                              PRIMARY KEY(id, story_id)
) ENGINE = INNODB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`user` (
#                                                      `id` INT NOT NULL AUTO_INCREMENT,
#                                                      `name` VARCHAR(45) NULL,
#                                                      `birth_date` INT NULL,
#                                                      `followers` INT NULL,
#                                                      `followings` INT NULL,
#                                                      `posts` INT NULL,
#                                                      PRIMARY KEY (`id`),
#                                                      UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`story` (
#                                                       `id` INT NOT NULL AUTO_INCREMENT,
#                                                       `bloger` VARCHAR(45) NULL,
#                                                       `link` VARCHAR(45) NULL,
#                                                       `add_time` INT NULL,
#                                                       `length_time` INT NULL,
#                                                       `content` VARCHAR(45) NULL,
#                                                       `filters` VARCHAR(45) NULL,
#                                                       `complaint_number` VARCHAR(45) NULL,
#                                                       `like_number` INT NULL,
#                                                       `share_number` INT NULL,
#                                                       `user_id` INT NOT NULL,
#                                                       PRIMARY KEY (`id`, `user_id`),
#                                                       UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
#                                                       INDEX `fk_story_user1_idx` (`user_id` ASC) VISIBLE,
#                                                       CONSTRAINT `fk_story_user1`
#                                                           FOREIGN KEY (`user_id`)
#                                                               REFERENCES `roman_oprysk`.`user` (`id`)
#                                                               ON DELETE NO ACTION
#                                                               ON UPDATE NO ACTION)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`security` (
#                                                          `id` INT NOT NULL AUTO_INCREMENT,
#                                                          `password` VARCHAR(30) NULL,
#                                                          `user_id` INT NOT NULL,
#                                                          PRIMARY KEY (`id`, `user_id`),
#                                                          INDEX `fk_security_user1_idx` (`user_id` ASC) VISIBLE,
#                                                          UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
#                                                          CONSTRAINT `fk_security_user1`
#                                                              FOREIGN KEY (`user_id`)
#                                                                  REFERENCES `roman_oprysk`.`user` (`id`)
#                                                                  ON DELETE NO ACTION
#                                                                  ON UPDATE NO ACTION)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`save_on_top` (
#                                                             `id` INT NOT NULL AUTO_INCREMENT,
#                                                             `position` INT NULL,
#                                                             `status` VARCHAR(45) NULL,
#                                                             `story_id` INT NOT NULL,
#                                                             PRIMARY KEY (`id`, `story_id`),
#                                                             INDEX `fk_save_on_top_story1_idx` (`story_id` ASC) VISIBLE,
#                                                             UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
#                                                             UNIQUE INDEX `story_id_UNIQUE` (`story_id` ASC) VISIBLE,
#                                                             CONSTRAINT `fk_save_on_top_story1`
#                                                                 FOREIGN KEY (`story_id`)
#                                                                     REFERENCES `roman_oprysk`.`story` (`id`)
#                                                                     ON DELETE NO ACTION
#                                                                     ON UPDATE NO ACTION)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`initialization` (
#                                                                `id` INT NOT NULL AUTO_INCREMENT,
#                                                                `login` VARCHAR(45) NULL,
#                                                                `user_id` INT NOT NULL,
#                                                                PRIMARY KEY (`id`, `user_id`),
#                                                                INDEX `fk_initialization_user1_idx` (`user_id` ASC) VISIBLE,
#                                                                CONSTRAINT `fk_initialization_user1`
#                                                                    FOREIGN KEY (`user_id`)
#                                                                        REFERENCES `roman_oprysk`.`user` (`id`)
#                                                                        ON DELETE NO ACTION
#                                                                        ON UPDATE NO ACTION)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`user` (
#                                                      `id` INT NOT NULL AUTO_INCREMENT,
#                                                      `name` VARCHAR(45) NULL,
#                                                      `birth_date` INT NULL,
#                                                      `followers` INT NULL,
#                                                      `followings` INT NULL,
#                                                      `posts` INT NULL,
#                                                      PRIMARY KEY (`id`),
#                                                      UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`story` (
#                                                       `id` INT NOT NULL AUTO_INCREMENT,
#                                                       `bloger` VARCHAR(45) NULL,
#                                                       `link` VARCHAR(45) NULL,
#                                                       `add_time` INT NULL,
#                                                       `length_time` INT NULL,
#                                                       `content` VARCHAR(45) NULL,
#                                                       `filters` VARCHAR(45) NULL,
#                                                       `complaint_number` VARCHAR(45) NULL,
#                                                       `like_number` INT NULL,
#                                                       `share_number` INT NULL,
#                                                       `user_id` INT NOT NULL,
#                                                       PRIMARY KEY (`id`, `user_id`),
#                                                       UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
#                                                       INDEX `fk_story_user1_idx` (`user_id` ASC) VISIBLE,
#                                                       CONSTRAINT `fk_story_user1`
#                                                           FOREIGN KEY (`user_id`)
#                                                               REFERENCES `roman_oprysk`.`user` (`id`)
#                                                               ON DELETE NO ACTION
#                                                               ON UPDATE NO ACTION)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`security` (
#                                                          `id` INT NOT NULL AUTO_INCREMENT,
#                                                          `password` VARCHAR(30) NULL,
#                                                          `user_id` INT NOT NULL,
#                                                          PRIMARY KEY (`id`, `user_id`),
#                                                          INDEX `fk_security_user1_idx` (`user_id` ASC) VISIBLE,
#                                                          UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
#                                                          CONSTRAINT `fk_security_user1`
#                                                              FOREIGN KEY (`user_id`)
#                                                                  REFERENCES `roman_oprysk`.`user` (`id`)
#                                                                  ON DELETE NO ACTION
#                                                                  ON UPDATE NO ACTION)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`save_on_top` (
#                                                             `id` INT NOT NULL AUTO_INCREMENT,
#                                                             `position` INT NULL,
#                                                             `status` VARCHAR(45) NULL,
#                                                             `story_id` INT NOT NULL,
#                                                             PRIMARY KEY (`id`, `story_id`),
#                                                             INDEX `fk_save_on_top_story1_idx` (`story_id` ASC) VISIBLE,
#                                                             UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
#                                                             UNIQUE INDEX `story_id_UNIQUE` (`story_id` ASC) VISIBLE,
#                                                             CONSTRAINT `fk_save_on_top_story1`
#                                                                 FOREIGN KEY (`story_id`)
#                                                                     REFERENCES `roman_oprysk`.`story` (`id`)
#                                                                     ON DELETE NO ACTION
#                                                                     ON UPDATE NO ACTION)
#     ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `roman_oprysk`.`initialization` (
#                                                                `id` INT NOT NULL AUTO_INCREMENT,
#                                                                `login` VARCHAR(45) NULL,
#                                                                `user_id` INT NOT NULL,
#                                                                PRIMARY KEY (`id`, `user_id`),
#                                                                INDEX `fk_initialization_user1_idx` (`user_id` ASC) VISIBLE,
#                                                                CONSTRAINT `fk_initialization_user1`
#                                                                    FOREIGN KEY (`user_id`)
#                                                                        REFERENCES `roman_oprysk`.`user` (`id`)
#                                                                        ON DELETE NO ACTION
#                                                                        ON UPDATE NO ACTION)
#     ENGINE = InnoDB;

-- Foreign keys added via ALTER TABLE:
ALTER TABLE security

    ADD CONSTRAINT security_user1
        FOREIGN KEY (user_id)
            REFERENCES user (id);

ALTER TABLE initialization

    ADD CONSTRAINT initialization_user1
        FOREIGN KEY (user_id)
            REFERENCES user (id);

ALTER TABLE save_on_top

    ADD CONSTRAINT save_on_top_story1
        FOREIGN KEY (story_id)
            REFERENCES story (id);

ALTER TABLE story

    ADD CONSTRAINT story_user1
        FOREIGN KEY (user_id)
            REFERENCES user (id);

