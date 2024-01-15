-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Bideoteka
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Bideoteka
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Bideoteka` DEFAULT CHARACTER SET utf8 ;
USE `Bideoteka` ;

-- -----------------------------------------------------
-- Table `Bideoteka`.`Aktorea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bideoteka`.`Aktorea` (
  `a_zb` INT NOT NULL AUTO_INCREMENT,
  `Izena` VARCHAR(20) NOT NULL,
  `abizena` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`a_zb`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bideoteka`.`Euskarria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bideoteka`.`Euskarria` (
  `e_zb` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `Izena` VARCHAR(3) NOT NULL,
  `Deskribapena` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`e_zb`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bideoteka`.`Film_Mota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bideoteka`.`Film_Mota` (
  `m_zb` INT NOT NULL AUTO_INCREMENT,
  `izena` VARCHAR(2) NOT NULL,
  `deskribapena` VARCHAR(69) NULL,
  PRIMARY KEY (`m_zb`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bideoteka`.`Filma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bideoteka`.`Filma` (
  `p_zb` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `izenburua` VARCHAR(32) NOT NULL,
  `euskarria` INT UNSIGNED NOT NULL,
  `Mota` INT NOT NULL,
  `Euskarria_e_zb` INT UNSIGNED NOT NULL,
  `Film_Mota_m_zb` INT NOT NULL,
  PRIMARY KEY (`p_zb`),
  INDEX `fk_Filma_Euskarria_idx` (`Euskarria_e_zb` ASC) VISIBLE,
  INDEX `fk_Filma_Film_Mota1_idx` (`Film_Mota_m_zb` ASC) VISIBLE,
  CONSTRAINT `fk_Filma_Euskarria`
    FOREIGN KEY (`Euskarria_e_zb`)
    REFERENCES `Bideoteka`.`Euskarria` (`e_zb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filma_Film_Mota1`
    FOREIGN KEY (`Film_Mota_m_zb`)
    REFERENCES `Bideoteka`.`Film_Mota` (`m_zb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bideoteka`.`Zuzendaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bideoteka`.`Zuzendaria` (
  `z_zb` INT NOT NULL AUTO_INCREMENT,
  `Izena` VARCHAR(20) NOT NULL,
  `abizena` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`z_zb`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bideoteka`.`Filma_has_Zuzendaria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bideoteka`.`Filma_has_Zuzendaria` (
  `Filma_p_zb` INT UNSIGNED NOT NULL,
  `Zuzendaria_z_zb` INT NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`Filma_p_zb`, `Zuzendaria_z_zb`),
  INDEX `fk_Filma_has_Zuzendaria_Zuzendaria1_idx` (`Zuzendaria_z_zb` ASC) VISIBLE,
  INDEX `fk_Filma_has_Zuzendaria_Filma1_idx` (`Filma_p_zb` ASC) VISIBLE,
  CONSTRAINT `fk_Filma_has_Zuzendaria_Filma1`
    FOREIGN KEY (`Filma_p_zb`)
    REFERENCES `Bideoteka`.`Filma` (`p_zb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filma_has_Zuzendaria_Zuzendaria1`
    FOREIGN KEY (`Zuzendaria_z_zb`)
    REFERENCES `Bideoteka`.`Zuzendaria` (`z_zb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bideoteka`.`Filma_has_Aktorea`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bideoteka`.`Filma_has_Aktorea` (
  `Filma_p_zb` INT UNSIGNED NOT NULL,
  `Aktorea_a_zb` INT NOT NULL,
  `Data` DATE NOT NULL,
  PRIMARY KEY (`Filma_p_zb`, `Aktorea_a_zb`),
  INDEX `fk_Filma_has_Aktorea_Aktorea1_idx` (`Aktorea_a_zb` ASC) VISIBLE,
  INDEX `fk_Filma_has_Aktorea_Filma1_idx` (`Filma_p_zb` ASC) VISIBLE,
  CONSTRAINT `fk_Filma_has_Aktorea_Filma1`
    FOREIGN KEY (`Filma_p_zb`)
    REFERENCES `Bideoteka`.`Filma` (`p_zb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filma_has_Aktorea_Aktorea1`
    FOREIGN KEY (`Aktorea_a_zb`)
    REFERENCES `Bideoteka`.`Aktorea` (`a_zb`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
