-- MySQL Workbench Synchronization
-- Generated: 2024-01-15 09:19
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: 1ag3.iorilope

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `denda`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `denda`.`Produktua_has_Kategoria` 
DROP FOREIGN KEY `fk_Produktua_has_Kategoria_Kategoria1`;

ALTER TABLE `denda`.`Eskaera` 
DROP FOREIGN KEY `fk_Eskaera_Erabiltzaileak1`,
DROP FOREIGN KEY `fk_Eskaera_Ordainketa_Mota1`;

ALTER TABLE `denda`.`Erabiltzaileak` 
DROP FOREIGN KEY `fk_Erabiltzaileak_Profila1`;

ALTER TABLE `denda`.`Produktua` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `Egoera` SMALLINT(6) NOT NULL AFTER `Prezioa`,
CHANGE COLUMN `Prezioa` `Prezioa` DECIMAL NOT NULL ;

ALTER TABLE `denda`.`Kategoria` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `denda`.`Produktua_has_Kategoria` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD INDEX `fk_Produktua_has_Kategoria_Kategoria1_idx` (`Kategoria_id` ASC) VISIBLE,
ADD INDEX `fk_Produktua_has_Kategoria_Produktua_idx` (`Produktua_id` ASC) VISIBLE,
DROP INDEX `fk_Produktua_has_Kategoria_Produktua_idx` ,
DROP INDEX `fk_Produktua_has_Kategoria_Kategoria1_idx` ;
;

ALTER TABLE `denda`.`Eskaera` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD INDEX `fk_Eskaera_Erabiltzaileak1_idx` (`Erabiltzaileak_id` ASC) VISIBLE,
ADD INDEX `fk_Eskaera_Ordainketa_Mota1_idx` (`Ordainketa_Mota_id` ASC) VISIBLE,
DROP INDEX `fk_Eskaera_Ordainketa_Mota1_idx` ,
DROP INDEX `fk_Eskaera_Erabiltzaileak1_idx` ;
;

ALTER TABLE `denda`.`Erabiltzaileak` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD INDEX `fk_Erabiltzaileak_Profila1_idx` (`Profila_id` ASC) VISIBLE,
DROP INDEX `fk_Erabiltzaileak_Profila1_idx` ;
;

CREATE TABLE IF NOT EXISTS `denda`.`Eskaerak_Zehaztu` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `Eskaera_id` INT(11) NOT NULL,
  `Produktua_id` INT(11) NOT NULL,
  `ProduktuIzena` VARCHAR(45) NOT NULL,
  `ProduktuPrezioa` DECIMAL NOT NULL,
  `kantitatea` SMALLINT(6) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `Eskaera_id`, `Produktua_id`),
  INDEX `fk_Eskaera_has_Produktua_Produktua1_idx` (`Produktua_id` ASC) VISIBLE,
  INDEX `fk_Eskaera_has_Produktua_Eskaera1_idx` (`Eskaera_id` ASC) VISIBLE,
  CONSTRAINT `fk_Eskaera_has_Produktua_Eskaera1`
    FOREIGN KEY (`Eskaera_id`)
    REFERENCES `denda`.`Eskaera` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Eskaera_has_Produktua_Produktua1`
    FOREIGN KEY (`Produktua_id`)
    REFERENCES `denda`.`Produktua` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `denda`.`Profila` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `denda`.`Ordainketa_Mota` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

DROP TABLE IF EXISTS `denda`.`eskaerak_zehaztu` ;

ALTER TABLE `denda`.`Produktua_has_Kategoria` 
DROP FOREIGN KEY `fk_Produktua_has_Kategoria_Produktua`;

ALTER TABLE `denda`.`Produktua_has_Kategoria` ADD CONSTRAINT `fk_Produktua_has_Kategoria_Produktua`
  FOREIGN KEY (`Produktua_id`)
  REFERENCES `denda`.`Produktua` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Produktua_has_Kategoria_Kategoria1`
  FOREIGN KEY (`Kategoria_id`)
  REFERENCES `denda`.`Kategoria` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `denda`.`Eskaera` 
ADD CONSTRAINT `fk_Eskaera_Erabiltzaileak1`
  FOREIGN KEY (`Erabiltzaileak_id`)
  REFERENCES `denda`.`Erabiltzaileak` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Eskaera_Ordainketa_Mota1`
  FOREIGN KEY (`Ordainketa_Mota_id`)
  REFERENCES `denda`.`Ordainketa_Mota` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `denda`.`Erabiltzaileak` 
ADD CONSTRAINT `fk_Erabiltzaileak_Profila1`
  FOREIGN KEY (`Profila_id`)
  REFERENCES `denda`.`Profila` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
