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
-- Table structure for table `filma`
--

DROP TABLE IF EXISTS `filma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filma` (
  `p_zb` int unsigned NOT NULL AUTO_INCREMENT,
  `izenburua` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15 10:51:22
