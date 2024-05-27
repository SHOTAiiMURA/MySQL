-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `category_id` INT NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`category_id`));


-- -----------------------------------------------------
-- Table `mydb`.`Team`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Team` (
  `name` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Role` (
  `name` VARCHAR(50) NOT NULL,
  `team_name` VARCHAR(50) NOT NULL,
  `fortune_teller_team` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`name`),
  INDEX `fk_Role_Team_idx` (`team_name` ASC) VISIBLE,
  INDEX `fk_Role_Team1_idx` (`fortune_teller_team` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  CONSTRAINT `fk_Role_Team`
    FOREIGN KEY (`team_name`)
    REFERENCES `mydb`.`Team` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Role_Team1`
    FOREIGN KEY (`fortune_teller_team`)
    REFERENCES `mydb`.`Team` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`GameGroup`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`GameGroup` (
  `group_id` INT NOT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE INDEX `group_id_UNIQUE` (`group_id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Player`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Player` (
  `user_id` VARCHAR(50) NOT NULL,
  `name` INT NOT NULL,
  `role_name` VARCHAR(50) NULL,
  `group_id` INT NOT NULL,
  PRIMARY KEY (`user_id`),
  INDEX `fk_Player_Role1_idx` (`role_name` ASC) VISIBLE,
  UNIQUE INDEX `user_id_UNIQUE` (`user_id` ASC) VISIBLE,
  INDEX `fk_Player_GameGroup1_idx` (`group_id` ASC) VISIBLE,
  CONSTRAINT `fk_Player_Role1`
    FOREIGN KEY (`role_name`)
    REFERENCES `mydb`.`Role` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Player_GameGroup1`
    FOREIGN KEY (`group_id`)
    REFERENCES `mydb`.`GameGroup` (`group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Setting`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Setting` (
  `group_id` INT NOT NULL,
  `role_name` VARCHAR(50) NOT NULL,
  `num` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`group_id`, `role_name`),
  INDEX `fk_Setting_Role1_idx` (`role_name` ASC) VISIBLE,
  INDEX `fk_Setting_GameGroup1_idx` (`group_id` ASC) VISIBLE,
  CONSTRAINT `fk_Setting_Role1`
    FOREIGN KEY (`role_name`)
    REFERENCES `mydb`.`Role` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Setting_GameGroup1`
    FOREIGN KEY (`group_id`)
    REFERENCES `mydb`.`GameGroup` (`group_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SettingTemplate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SettingTemplate` (
  `player_num` INT NOT NULL,
  `role_name` VARCHAR(50) NOT NULL,
  `role_num` INT NOT NULL,
  PRIMARY KEY (`player_num`, `role_name`),
  INDEX `fk_SettingTemplate_Role1_idx` (`role_name` ASC) VISIBLE,
  CONSTRAINT `fk_SettingTemplate_Role1`
    FOREIGN KEY (`role_name`)
    REFERENCES `mydb`.`Role` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
