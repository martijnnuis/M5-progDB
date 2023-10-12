-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema gameraccount
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `gameraccount` DEFAULT CHARACTER SET utf8 ;
USE `gameraccount` ;

-- -----------------------------------------------------
-- Table `gameraccount`.`gameraccount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`gameraccount` (
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `achieft achievments` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`username`, `password`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`games` (
  `gamesID` INT NOT NULL,
  `name` VARCHAR(1000) NOT NULL,
  `Achievments` INT UNSIGNED NOT NULL,
  `gameraccount_username` VARCHAR(45) NOT NULL,
  `gameraccount_password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`gamesID`),
  UNIQUE INDEX `gamesID_UNIQUE` (`gamesID` ASC) VISIBLE,
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE,
  UNIQUE INDEX `Achievments_UNIQUE` (`Achievments` ASC) VISIBLE,
  INDEX `fk_games_gameraccount1_idx` (`gameraccount_username` ASC, `gameraccount_password` ASC) VISIBLE,
  CONSTRAINT `fk_games_gameraccount1`
    FOREIGN KEY (`gameraccount_username` , `gameraccount_password`)
    REFERENCES `gameraccount`.`gameraccount` (`username` , `password`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gameraccount`.`gameraccount_has_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `gameraccount`.`gameraccount_has_games` (
  `gameraccount_username` VARCHAR(45) NOT NULL,
  `gameraccount_password` VARCHAR(100) NOT NULL,
  `games_gamesID` INT NOT NULL,
  PRIMARY KEY (`gameraccount_username`, `gameraccount_password`, `games_gamesID`),
  INDEX `fk_gameraccount_has_games_games1_idx` (`games_gamesID` ASC) VISIBLE,
  INDEX `fk_gameraccount_has_games_gameraccount_idx` (`gameraccount_username` ASC, `gameraccount_password` ASC) VISIBLE,
  CONSTRAINT `fk_gameraccount_has_games_gameraccount`
    FOREIGN KEY (`gameraccount_username` , `gameraccount_password`)
    REFERENCES `gameraccount`.`gameraccount` (`username` , `password`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_gameraccount_has_games_games1`
    FOREIGN KEY (`games_gamesID`)
    REFERENCES `gameraccount`.`games` (`gamesID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
