-- Source: https://github.com/iPhlouxMaster/FilmDistributionInterface/blob/3c485c9f6c4266732164a735f7f7425e5a4cccce/src/main/queries/create.sql?raw=true
-- Tables detected: 4 | FK/REFERENCES mentions: 4

CREATE TABLE `db_bidding`.`tbl_roles` (
  `role_id` INT NOT NULL AUTO_INCREMENT,
  `role_name` VARCHAR(80) NOT NULL,
  `role_desc` VARCHAR(100),
  PRIMARY KEY (`role_id`),
  UNIQUE INDEX `role_id_UNIQUE` (`role_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `db_bidding`.`tbl_users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_username` VARCHAR(45) NOT NULL,
  `user_password` VARCHAR(45) NOT NULL,
  `user_name` VARCHAR(80) NOT NULL,
  `user_email` VARCHAR(80) NOT NULL,
  `user_role` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC),
  FOREIGN KEY  fk_role(`user_role`)
  REFERENCES `db_bidding`.`tbl_roles` (`role_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `db_bidding`.`tbl_items` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `item_name` VARCHAR(80) NOT NULL,
  `item_desc` VARCHAR(80) NOT NULL,
  `item_owner` INT NOT NULL,
  `item_date_added` DATETIME NOT NULL,
  `item_date_expiry` DATETIME NOT NULL,
  `item_price` DOUBLE NOT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE INDEX `item_id_UNIQUE` (`item_id` ASC),
  FOREIGN KEY  fk_owner(`item_owner`)
  REFERENCES `db_bidding`.`tbl_users` (`user_id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE `db_bidding`.`tbl_bids` (
  `bid_id` INT NOT NULL AUTO_INCREMENT,
  `bid_item` INT NOT NULL,
  `bid_owner` INT NOT NULL,
  `bid_high_price` DOUBLE NOT NULL,
  `bid_offer_price` DOUBLE NOT NULL,
  `bid_offer_date` DATETIME NOT NULL,
  PRIMARY KEY (`bid_id`),
  UNIQUE INDEX `bid_id_UNIQUE` (`bid_id` ASC),
  INDEX `fk_item_id_idx` (`bid_item` ASC),
  INDEX `fk_owner_id_idx` (`bid_owner` ASC),
  CONSTRAINT `fk_item_id`
    FOREIGN KEY (`bid_item`)
    REFERENCES `db_bidding`.`tbl_items` (`item_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seller_id`
    FOREIGN KEY (`bid_owner`)
    REFERENCES `db_bidding`.`tbl_users` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

