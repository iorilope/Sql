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
-- Table structure for table `aktorea`
--

DROP TABLE IF EXISTS `aktorea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aktorea` (
  `a_zb` int NOT NULL AUTO_INCREMENT,
  `Izena` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `abizena` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`a_zb`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aktorea`
--

LOCK TABLES `aktorea` WRITE;
/*!40000 ALTER TABLE `aktorea` DISABLE KEYS */;
INSERT INTO `aktorea` VALUES (1,'Harrison','Ford'),(2,'Russell','Crowe');
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
  `Izena` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Deskribapena` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
-- Table structure for table `film_mota`
--

DROP TABLE IF EXISTS `film_mota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `film_mota` (
  `m_zb` int NOT NULL AUTO_INCREMENT,
  `izena` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `deskribapena` varchar(69) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
INSERT INTO `filma_has_aktorea` VALUES (1,1,'1982-02-03'),(2,2,'2000-05-19'),(3,1,'1991-03-29');
/*!40000 ALTER TABLE `filma_has_aktorea` ENABLE KEYS */;
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
-- Table structure for table `zuzendaria`
--

DROP TABLE IF EXISTS `zuzendaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zuzendaria` (
  `z_zb` int NOT NULL AUTO_INCREMENT,
  `Izena` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `abizena` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15 10:52:22
