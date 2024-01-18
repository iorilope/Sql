-- MySQL Workbench Synchronization
-- Generated: 2024-01-18 08:40
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: 1ag3.iorilope

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

ALTER SCHEMA `bideoteka`  DEFAULT CHARACTER SET utf8  DEFAULT COLLATE utf8_general_ci ;

ALTER TABLE `bideoteka`.`Filma` 
DROP FOREIGN KEY `fk_Filma_Euskarria`,
DROP FOREIGN KEY `fk_Filma_Film_Mota1`;

ALTER TABLE `bideoteka`.`Filma_has_Zuzendaria` 
DROP FOREIGN KEY `fk_Filma_has_Zuzendaria_Filma1`,
DROP FOREIGN KEY `fk_Filma_has_Zuzendaria_Zuzendaria1`;

ALTER TABLE `bideoteka`.`Filma_has_Aktorea` 
DROP FOREIGN KEY `fk_Filma_has_Aktorea_Aktorea1`;

ALTER TABLE `bideoteka`.`Aktorea` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
ADD COLUMN `film_kopurua` INT(11) NULL DEFAULT NULL AFTER `abizena`,
CHANGE COLUMN `Izena` `Izena` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `abizena` `abizena` VARCHAR(20) NOT NULL ;

ALTER TABLE `bideoteka`.`Euskarria` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `Izena` `Izena` VARCHAR(3) NOT NULL ,
CHANGE COLUMN `Deskribapena` `Deskribapena` VARCHAR(32) NOT NULL ;

ALTER TABLE `bideoteka`.`Film_Mota` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `izena` `izena` VARCHAR(2) NOT NULL ,
CHANGE COLUMN `deskribapena` `deskribapena` VARCHAR(69) NULL DEFAULT NULL ;

ALTER TABLE `bideoteka`.`Filma` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `izenburua` `izenburua` VARCHAR(32) NOT NULL ;

ALTER TABLE `bideoteka`.`Zuzendaria` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ,
CHANGE COLUMN `Izena` `Izena` VARCHAR(20) NOT NULL ,
CHANGE COLUMN `abizena` `abizena` VARCHAR(20) NOT NULL ;

ALTER TABLE `bideoteka`.`Filma_has_Zuzendaria` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `bideoteka`.`Filma_has_Aktorea` 
CHARACTER SET = utf8 , COLLATE = utf8_general_ci ;

ALTER TABLE `bideoteka`.`Filma` 
ADD CONSTRAINT `fk_Filma_Euskarria`
  FOREIGN KEY (`Euskarria_e_zb`)
  REFERENCES `bideoteka`.`Euskarria` (`e_zb`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Filma_Film_Mota1`
  FOREIGN KEY (`Film_Mota_m_zb`)
  REFERENCES `bideoteka`.`Film_Mota` (`m_zb`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `bideoteka`.`Filma_has_Zuzendaria` 
ADD CONSTRAINT `fk_Filma_has_Zuzendaria_Filma1`
  FOREIGN KEY (`Filma_p_zb`)
  REFERENCES `bideoteka`.`Filma` (`p_zb`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Filma_has_Zuzendaria_Zuzendaria1`
  FOREIGN KEY (`Zuzendaria_z_zb`)
  REFERENCES `bideoteka`.`Zuzendaria` (`z_zb`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `bideoteka`.`Filma_has_Aktorea` 
DROP FOREIGN KEY `fk_Filma_has_Aktorea_Filma1`;

ALTER TABLE `bideoteka`.`Filma_has_Aktorea` ADD CONSTRAINT `fk_Filma_has_Aktorea_Filma1`
  FOREIGN KEY (`Filma_p_zb`)
  REFERENCES `bideoteka`.`Filma` (`p_zb`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_Filma_has_Aktorea_Aktorea1`
  FOREIGN KEY (`Aktorea_a_zb`)
  REFERENCES `bideoteka`.`Aktorea` (`a_zb`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
