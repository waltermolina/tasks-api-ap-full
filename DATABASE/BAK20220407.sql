-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: brnv1yr93x1865xl8gni-mysql.services.clever-cloud.com    Database: brnv1yr93x1865xl8gni
-- ------------------------------------------------------
-- Server version	8.0.22-13

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ 'a05a675a-1414-11e9-9c82-cecd01b08c7e:1-491550428,
a38a16d0-767a-11eb-abe2-cecd029e558e:1-128824547';

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `idperson` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(500) DEFAULT NULL,
  `lastname` varchar(500) DEFAULT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(4000) NOT NULL,
  `role` int DEFAULT NULL,
  `picture` varchar(2048) DEFAULT NULL,
  `personcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idperson`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `fk_person_role_idx` (`role`),
  CONSTRAINT `fk_person_role` FOREIGN KEY (`role`) REFERENCES `role` (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (1,'Walter','Molina','waltermolina','1234',1,NULL,NULL),(2,'Mario','García I','marito048','1234',1,NULL,NULL),(3,'Camila',NULL,'camila','1234',2,NULL,NULL);
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `idrole` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idrole`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Administrator',NULL),(2,'Guest',NULL);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `idtask` int NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(2000) DEFAULT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `expiration` datetime DEFAULT NULL,
  `status` enum('not started','doing','done') DEFAULT 'not started',
  `owner` int NOT NULL,
  PRIMARY KEY (`idtask`),
  KEY `fk_task_person_idx` (`owner`),
  CONSTRAINT `fk_task_person` FOREIGN KEY (`owner`) REFERENCES `person` (`idperson`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (3,'Prueba1',NULL,NULL,NULL,'not started',2),(4,'Prueba2',NULL,NULL,NULL,'not started',2),(5,'Prueba 3',NULL,NULL,NULL,'not started',2),(6,'Prueba 4 con fecha',NULL,'2022-04-01 21:27:40',NULL,'done',2);
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taskmember`
--

DROP TABLE IF EXISTS `taskmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `taskmember` (
  `idtask` int NOT NULL,
  `idperson` int NOT NULL,
  PRIMARY KEY (`idtask`,`idperson`),
  KEY `fk_taskmember_person_idx` (`idperson`),
  CONSTRAINT `fk_taskmember_person` FOREIGN KEY (`idperson`) REFERENCES `person` (`idperson`),
  CONSTRAINT `fk_taskmember_task` FOREIGN KEY (`idtask`) REFERENCES `task` (`idtask`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `taskmember`
--

LOCK TABLES `taskmember` WRITE;
/*!40000 ALTER TABLE `taskmember` DISABLE KEYS */;
INSERT INTO `taskmember` VALUES (3,1),(3,2),(4,2),(5,2),(3,3);
/*!40000 ALTER TABLE `taskmember` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-07 20:17:19
