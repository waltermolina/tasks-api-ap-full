-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TasksDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TasksDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TasksDB` DEFAULT CHARACTER SET utf8 ;
USE `TasksDB` ;

-- -----------------------------------------------------
-- Table `TasksDB`.`role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TasksDB`.`role` (
  `idrole` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(1000) NULL,
  PRIMARY KEY (`idrole`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TasksDB`.`person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TasksDB`.`person` (
  `idperson` INT NOT NULL AUTO_INCREMENT,
  `firstname` VARCHAR(500) NULL,
  `lastname` VARCHAR(500) NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(4000) NOT NULL,
  `role` INT NULL,
  `picture` VARCHAR(2048) NULL,
  `personcol` VARCHAR(45) NULL,
  PRIMARY KEY (`idperson`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  INDEX `fk_person_role_idx` (`role` ASC) VISIBLE,
  CONSTRAINT `fk_person_role`
    FOREIGN KEY (`role`)
    REFERENCES `TasksDB`.`role` (`idrole`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TasksDB`.`task`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TasksDB`.`task` (
  `idtask` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  `description` VARCHAR(2000) NULL,
  `created` DATETIME NULL,
  `expiration` DATETIME NULL,
  `status` ENUM('not started', 'doing', 'done') NULL DEFAULT 'not started',
  `owner` INT NOT NULL,
  PRIMARY KEY (`idtask`),
  INDEX `fk_task_person_idx` (`owner` ASC) VISIBLE,
  CONSTRAINT `fk_task_person`
    FOREIGN KEY (`owner`)
    REFERENCES `TasksDB`.`person` (`idperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TasksDB`.`taskmember`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TasksDB`.`taskmember` (
  `idtask` INT NOT NULL,
  `idperson` INT NOT NULL,
  PRIMARY KEY (`idtask`, `idperson`),
  INDEX `fk_taskmember_person_idx` (`idperson` ASC) VISIBLE,
  CONSTRAINT `fk_taskmember_task`
    FOREIGN KEY (`idtask`)
    REFERENCES `TasksDB`.`task` (`idtask`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_taskmember_person`
    FOREIGN KEY (`idperson`)
    REFERENCES `TasksDB`.`person` (`idperson`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
