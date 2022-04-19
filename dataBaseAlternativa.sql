-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema eturnoB
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ncountrydb2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ncountrydb2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ncountrydb2` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `ncountrydb2` ;

-- -----------------------------------------------------
-- Table `ncountrydb2`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ncountrydb2`.`patients` (
  `id` INT(11) NOT NULL,
  `insurance_name` VARCHAR(45) NULL DEFAULT NULL,
  `insurance_number` VARCHAR(45) NULL DEFAULT NULL,
  `medical_history` VARCHAR(245) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `surname` VARCHAR(45) NULL DEFAULT NULL,
  `dni` INT(11) NULL DEFAULT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `email` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `ncountrydb2`.`roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ncountrydb2`.`roles` (
  `id` INT(11) NOT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `ncountrydb2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ncountrydb2`.`users` (
  `id` INT(11) NOT NULL,
  `email` VARCHAR(60) NULL DEFAULT NULL,
  `password` VARCHAR(245) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `surname` VARCHAR(45) NULL DEFAULT NULL,
  `dni` INT(11) NULL DEFAULT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `office` VARCHAR(45) NULL,
  `role_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) ,
  INDEX `role_id_idx` (`role_id` ASC) ,
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `ncountrydb2`.`roles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `ncountrydb2`.`schedules`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ncountrydb2`.`schedules` (
  `id` INT(11) NOT NULL,
  `patient_id` INT(11) NULL DEFAULT NULL,
  `user_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `patient_id_idx` (`patient_id` ASC) ,
  INDEX `user_id_idx` (`user_id` ASC) ,
  CONSTRAINT `patient_id`
    FOREIGN KEY (`patient_id`)
    REFERENCES `ncountrydb2`.`patients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `ncountrydb2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
