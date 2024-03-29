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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15 10:51:22
