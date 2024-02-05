CREATE DATABASE  IF NOT EXISTS `bideoteka` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bideoteka`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: bideoteka
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `2filmbainogehiagoaktoreak`
--

DROP TABLE IF EXISTS `2filmbainogehiagoaktoreak`;
/*!50001 DROP VIEW IF EXISTS `2filmbainogehiagoaktoreak`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `2filmbainogehiagoaktoreak` AS SELECT 
 1 AS `Izena`,
 1 AS `Abizena`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `aktore_zaharrak`
--

DROP TABLE IF EXISTS `aktore_zaharrak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aktore_zaharrak` (
  `id` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(20) NOT NULL,
  `abizena` varchar(20) NOT NULL,
  `film_kopurua` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktore_zaharrak`
--

LOCK TABLES `aktore_zaharrak` WRITE;
/*!40000 ALTER TABLE `aktore_zaharrak` DISABLE KEYS */;
INSERT INTO `aktore_zaharrak` VALUES (1,'Harrison','Ford',5),(2,'Russell','Crowe',2);
/*!40000 ALTER TABLE `aktore_zaharrak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aktorea`
--

DROP TABLE IF EXISTS `aktorea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aktorea` (
  `a_zb` int NOT NULL AUTO_INCREMENT,
  `Izena` varchar(20) NOT NULL,
  `abizena` varchar(20) NOT NULL,
  `film_kopurua` int DEFAULT NULL,
  PRIMARY KEY (`a_zb`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktorea`
--

LOCK TABLES `aktorea` WRITE;
/*!40000 ALTER TABLE `aktorea` DISABLE KEYS */;
INSERT INTO `aktorea` VALUES (1,'Harrison','Ford',4),(2,'Russell','Crowe',7),(3,'Brad','Pitt',1);
/*!40000 ALTER TABLE `aktorea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `euskarria`
--

DROP TABLE IF EXISTS `euskarria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `euskarria` (
  `e_zb` int unsigned NOT NULL AUTO_INCREMENT,
  `Izena` varchar(3) NOT NULL,
  `Deskribapena` varchar(32) NOT NULL,
  PRIMARY KEY (`e_zb`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `euskarria`
--

LOCK TABLES `euskarria` WRITE;
/*!40000 ALTER TABLE `euskarria` DISABLE KEYS */;
INSERT INTO `euskarria` VALUES (1,'DVD','DVD'),(2,'CD','CD'),(3,'ZI','ZINTA');
/*!40000 ALTER TABLE `euskarria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_aktore_historikoa`
--

DROP TABLE IF EXISTS `film_aktore_historikoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_aktore_historikoa` (
  `Kodea` int unsigned NOT NULL AUTO_INCREMENT,
  `a_zb` int NOT NULL,
  `p_zb` int unsigned NOT NULL,
  `Data` date DEFAULT NULL,
  `Noiz` date DEFAULT NULL,
  `Zeinek` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Kodea`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_aktore_historikoa`
--

LOCK TABLES `film_aktore_historikoa` WRITE;
/*!40000 ALTER TABLE `film_aktore_historikoa` DISABLE KEYS */;
INSERT INTO `film_aktore_historikoa` VALUES (1,1,3,NULL,'2024-02-01','root@localhost'),(2,3,2,'1990-04-28','2024-02-01','root@localhost');
/*!40000 ALTER TABLE `film_aktore_historikoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film_mota`
--

DROP TABLE IF EXISTS `film_mota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_mota` (
  `m_zb` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(2) NOT NULL,
  `deskribapena` varchar(69) DEFAULT NULL,
  PRIMARY KEY (`m_zb`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film_mota`
--

LOCK TABLES `film_mota` WRITE;
/*!40000 ALTER TABLE `film_mota` DISABLE KEYS */;
INSERT INTO `film_mota` VALUES (1,'ZF','zientzia-fikzioa'),(2,'A','abentura'),(3,'D','drama');
/*!40000 ALTER TABLE `film_mota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filma`
--

DROP TABLE IF EXISTS `filma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filma` (
  `p_zb` int unsigned NOT NULL AUTO_INCREMENT,
  `izenburua` varchar(32) NOT NULL,
  `euskarria` int unsigned NOT NULL,
  `Mota` int NOT NULL,
  `Euskarria_e_zb` int unsigned NOT NULL,
  `Film_Mota_m_zb` int NOT NULL,
  PRIMARY KEY (`p_zb`),
  KEY `fk_Filma_Euskarria_idx` (`Euskarria_e_zb`),
  KEY `fk_Filma_Film_Mota1_idx` (`Film_Mota_m_zb`),
  CONSTRAINT `fk_Filma_Euskarria` FOREIGN KEY (`Euskarria_e_zb`) REFERENCES `euskarria` (`e_zb`),
  CONSTRAINT `fk_Filma_Film_Mota1` FOREIGN KEY (`Film_Mota_m_zb`) REFERENCES `film_mota` (`m_zb`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filma`
--

LOCK TABLES `filma` WRITE;
/*!40000 ALTER TABLE `filma` DISABLE KEYS */;
INSERT INTO `filma` VALUES (1,'Blade Runner',1,1,1,1),(2,'Gladiator',1,2,1,2),(3,'A proposito Henry',2,3,1,3);
/*!40000 ALTER TABLE `filma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filma_has_aktorea`
--

DROP TABLE IF EXISTS `filma_has_aktorea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filma_has_aktorea` (
  `Filma_p_zb` int unsigned NOT NULL,
  `Aktorea_a_zb` int NOT NULL,
  `Data` date DEFAULT NULL,
  PRIMARY KEY (`Filma_p_zb`,`Aktorea_a_zb`),
  KEY `fk_Filma_has_Aktorea_Aktorea1_idx` (`Aktorea_a_zb`),
  KEY `fk_Filma_has_Aktorea_Filma1_idx` (`Filma_p_zb`),
  CONSTRAINT `fk_Filma_has_Aktorea_Aktorea1` FOREIGN KEY (`Aktorea_a_zb`) REFERENCES `aktorea` (`a_zb`),
  CONSTRAINT `fk_Filma_has_Aktorea_Filma1` FOREIGN KEY (`Filma_p_zb`) REFERENCES `filma` (`p_zb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filma_has_aktorea`
--

LOCK TABLES `filma_has_aktorea` WRITE;
/*!40000 ALTER TABLE `filma_has_aktorea` DISABLE KEYS */;
INSERT INTO `filma_has_aktorea` VALUES (1,1,'1982-02-03'),(1,3,'1992-03-29'),(2,2,'2000-05-19');
/*!40000 ALTER TABLE `filma_has_aktorea` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `filma_has_aktorea_AFTER_INSERT` AFTER INSERT ON `filma_has_aktorea` FOR EACH ROW update
aktorea
set film_kopurua = film_kopurua + 1  where  a_zb = new.aktorea_a_zb */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `filma_has_aktorea_AFTER_DELETE` AFTER DELETE ON `filma_has_aktorea` FOR EACH ROW BEGIN update
aktorea set film_kopurua = film_kopurua - 1 where a_zb = old.aktorea_a_zb;
insert into film_aktore_historikoa (a_zb,p_zb,Data,Noiz,Zeinek) values (old.Aktorea_a_zb,old.Filma_p_zb,old.Data,current_date(),current_user());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `filma_has_kokalekua`
--

DROP TABLE IF EXISTS `filma_has_kokalekua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filma_has_kokalekua` (
  `kokalekua_kodea` int unsigned NOT NULL,
  `Filma_p_zb` int unsigned NOT NULL,
  PRIMARY KEY (`kokalekua_kodea`,`Filma_p_zb`),
  KEY `filma_has_kokalekua_ibfk_2` (`Filma_p_zb`),
  CONSTRAINT `filma_has_kokalekua_ibfk_1` FOREIGN KEY (`kokalekua_kodea`) REFERENCES `kokalekua` (`kodea`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `filma_has_kokalekua_ibfk_2` FOREIGN KEY (`Filma_p_zb`) REFERENCES `filma` (`p_zb`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filma_has_kokalekua`
--

LOCK TABLES `filma_has_kokalekua` WRITE;
/*!40000 ALTER TABLE `filma_has_kokalekua` DISABLE KEYS */;
INSERT INTO `filma_has_kokalekua` VALUES (1,1),(3,2);
/*!40000 ALTER TABLE `filma_has_kokalekua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `filma_has_zuzendaria`
--

DROP TABLE IF EXISTS `filma_has_zuzendaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filma_has_zuzendaria` (
  `Filma_p_zb` int unsigned NOT NULL,
  `Zuzendaria_z_zb` int NOT NULL,
  `Data` date DEFAULT NULL,
  PRIMARY KEY (`Filma_p_zb`,`Zuzendaria_z_zb`),
  KEY `fk_Filma_has_Zuzendaria_Zuzendaria1_idx` (`Zuzendaria_z_zb`),
  KEY `fk_Filma_has_Zuzendaria_Filma1_idx` (`Filma_p_zb`),
  CONSTRAINT `fk_Filma_has_Zuzendaria_Filma1` FOREIGN KEY (`Filma_p_zb`) REFERENCES `filma` (`p_zb`),
  CONSTRAINT `fk_Filma_has_Zuzendaria_Zuzendaria1` FOREIGN KEY (`Zuzendaria_z_zb`) REFERENCES `zuzendaria` (`z_zb`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filma_has_zuzendaria`
--

LOCK TABLES `filma_has_zuzendaria` WRITE;
/*!40000 ALTER TABLE `filma_has_zuzendaria` DISABLE KEYS */;
INSERT INTO `filma_has_zuzendaria` VALUES (1,1,'1982-02-03'),(2,1,'2000-05-19'),(3,2,'1991-03-29');
/*!40000 ALTER TABLE `filma_has_zuzendaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kokalekua`
--

DROP TABLE IF EXISTS `kokalekua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kokalekua` (
  `kodea` int unsigned NOT NULL AUTO_INCREMENT,
  `izena` varchar(30) NOT NULL,
  `leku_mota` varchar(30) NOT NULL,
  `herrialdea` varchar(30) NOT NULL,
  PRIMARY KEY (`kodea`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kokalekua`
--

LOCK TABLES `kokalekua` WRITE;
/*!40000 ALTER TABLE `kokalekua` DISABLE KEYS */;
INSERT INTO `kokalekua` VALUES (1,'Simpson','Desertua','Australia'),(3,'Monegros','Desertua','Espainia'),(4,'Verula','Zenobioa','Espainia'),(5,'Loarre','Gaztelua','Espainia'),(6,'Gobi','Desertua','China');
/*!40000 ALTER TABLE `kokalekua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zuzendaria`
--

DROP TABLE IF EXISTS `zuzendaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zuzendaria` (
  `z_zb` int NOT NULL AUTO_INCREMENT,
  `Izena` varchar(20) NOT NULL,
  `abizena` varchar(20) NOT NULL,
  PRIMARY KEY (`z_zb`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zuzendaria`
--

LOCK TABLES `zuzendaria` WRITE;
/*!40000 ALTER TABLE `zuzendaria` DISABLE KEYS */;
INSERT INTO `zuzendaria` VALUES (1,'Ridley','Scott'),(2,'Mike','Nichols');
/*!40000 ALTER TABLE `zuzendaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'bideoteka'
--

--
-- Dumping routines for database 'bideoteka'
--
/*!50003 DROP FUNCTION IF EXISTS `datuak_sartu_Fun` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `datuak_sartu_Fun`(izen varchar(20),abizen varchar(20)) RETURNS varchar(70) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
DECLARE mezua varchar(70);
DECLARE zenb INT;

SET zenb = 0;
SELECT a_zb INTO zenb FROM aktorea WHERE Izena = izen;

IF zenb IS NOT NULL THEN
SET mezua = 'Idazlea existitzen da !';
ELSE
IF zenb = 0 THEN
INSERT INTO aktorea(Izena,abizena) VALUES (izen,abizen);
SET mezua = 'Idazlea ongi sartu da !';
ELSE
SET mezua = 'Errorea gertatu da !';
END IF;
END IF;

RETURN mezua;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `Pelikula_Kop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `Pelikula_Kop`() RETURNS int unsigned
    DETERMINISTIC
BEGIN
declare kopurua int;
set kopurua = 0;
set kopurua = (select count(p_zb)  from filma);
RETURN kopurua;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Aktore_Film_Kop` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Aktore_Film_Kop`(in zenbakia int, out kopurua int)
    DETERMINISTIC
BEGIN
declare zenb int;
set zenb =0;
select a_zb into zenb from aktorea where a_zb=zenbakia;
set kopurua = (select film_kopurua  from aktorea where a_zb = zenb);
insert into aktorea (film_kopurua) values (Kopurua); 
select kopurua;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Aktore_Film_Kop_IzenAbizen` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Aktore_Film_Kop_IzenAbizen`(in izenaa varchar(20),in abizenaa varchar(20))
    DETERMINISTIC
BEGIN
declare kodea,kopurua int;

select a_zb into kodea from aktorea where izena = izenaa and abizena = abizenaa;
if (kodea is null) Then
select "Aktore hori ez dago";
else
set kopurua = (select film_kopurua  from aktorea where a_zb = kodea);
insert into aktorea (film_kopurua) values (kopurua); 
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Datuak_Sartu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Datuak_Sartu`(In izen varchar(20),in abizen varchar(20))
BEGIN

insert into aktorea(Izena,abizena)  values (izen,abizen);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Pelikula_kop_Proze` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Pelikula_kop_Proze`(out kopuru int)
BEGIN
declare kopurua int;
set kopurua = 0;
set kopuru = (select count(p_zb)  from filma);
Select kopuru;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `2filmbainogehiagoaktoreak`
--

/*!50001 DROP VIEW IF EXISTS `2filmbainogehiagoaktoreak`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `2filmbainogehiagoaktoreak` AS select `aktorea`.`Izena` AS `Izena`,`aktorea`.`abizena` AS `Abizena` from `aktorea` where (`aktorea`.`film_kopurua` > 2) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-05  8:13:49
