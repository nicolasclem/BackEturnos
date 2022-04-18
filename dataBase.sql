-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema NcountryDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema NcountryDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `NcountryDB` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `NcountryDB` ;

-- -----------------------------------------------------
-- Table `NcountryDB`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NcountryDB`.`roles` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NcountryDB`.`offices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NcountryDB`.`offices` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `isAviable` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NcountryDB`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NcountryDB`.`users` (
  `id` INT NOT NULL,
  `email` VARCHAR(60) NULL,
  `password` VARCHAR(245) NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `dni` INT NULL,
  `phone` INT NULL,
  `role_id` INT NULL,
  `offices_id` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `role_id_idx` (`role_id` ASC) ,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) ,
  INDEX `offices_idx` (`offices_id` ASC),
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `NcountryDB`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `offices`
    FOREIGN KEY (`offices_id`)
    REFERENCES `NcountryDB`.`offices` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NcountryDB`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NcountryDB`.`patients` (
  `id` INT NOT NULL,
  `insurance_name` VARCHAR(45) NULL,
  `insurance_number` VARCHAR(45) NULL,
  `medical_history` VARCHAR(245) NULL,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  `dni` INT NULL,
  `phone` INT NULL,
  `email` VARCHAR(60) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NcountryDB`.`Status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NcountryDB`.`Status` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `NcountryDB`.`schedules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `NcountryDB`.`schedules` (
  `id` INT NOT NULL,
  `status_id` INT NULL,
  `user_id` INT NULL,
  `info` VARCHAR(45) NULL,
  `patient_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `patient_id_idx` (`patient_id` ASC) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  INDEX `status_id_idx` (`status_id` ASC) ,
  CONSTRAINT `patient_id`
    FOREIGN KEY (`patient_id`)
    REFERENCES `NcountryDB`.`patients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `NcountryDB`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `status_id`
    FOREIGN KEY (`status_id`)
    REFERENCES `NcountryDB`.`Status` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
