CREATE DATABASE  IF NOT EXISTS `app_saude` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `app_saude`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: app_saude
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `prontuario`
--

DROP TABLE IF EXISTS `prontuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prontuario` (
  `Id_Prontuario` bigint NOT NULL,
  `Horario_Entrada` datetime DEFAULT NULL,
  `Horario_Saida` datetime DEFAULT NULL,
  `Receita` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Observacoes` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Pressao_Paciente` float(10,2) DEFAULT NULL,
  `paciente` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `farm_resp` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`Id_Prontuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prontuario`
--

LOCK TABLES `prontuario` WRITE;
/*!40000 ALTER TABLE `prontuario` DISABLE KEYS */;
INSERT INTO `prontuario` VALUES (9290034432768134,'2023-11-08 10:30:00','2023-11-10 10:30:00','Buscopan','Alergico a Gluten',12341116.00,'Eduardo',NULL),(40675326455463490,'2023-11-08 10:30:00','2023-11-10 10:30:00','Buscopan','Alergico a Gluten',12341116.00,'Pedro','Pedro'),(149241024694285630,'2023-11-08 10:30:00','2023-11-10 10:30:00','Buscopan','Alergico a Gluten',12341116.00,'lucas',NULL),(234057644190914560,'2023-11-08 10:30:00','2023-11-10 10:30:00','Buscopan','Alergico a Gluten',12341116.00,NULL,NULL),(300754899399775040,'2023-11-08 10:30:00','2023-11-10 10:30:00','Buscopan','Alergico a Gluten',12341116.00,'Pedro',NULL),(845043114498872400,'2023-11-08 10:30:00','2023-11-10 10:30:00','Buscopan','Alergico a Gluten',12341116.00,'Pedro',NULL);
/*!40000 ALTER TABLE `prontuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-01 10:05:03
