-- MySQL dump 10.13  Distrib 8.0.21, for Linux (x86_64)
--
-- Host: localhost    Database: jaktsite
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `animals`
--

DROP TABLE IF EXISTS `animals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animals` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `shooter_id` bigint unsigned NOT NULL,
  `species` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciestype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `engspecies` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_weight` double(8,2) DEFAULT NULL,
  `aprox_live_weight` double(8,2) DEFAULT NULL,
  `passad_weight` double(8,2) DEFAULT NULL,
  `aprox_passad_weight` double(8,2) DEFAULT NULL,
  `carcass_weight` double(8,2) DEFAULT NULL,
  `aprox_carcass_weight` double(8,2) DEFAULT NULL,
  `cut_weight` double(8,2) DEFAULT NULL,
  `heart_weight` double(8,2) DEFAULT NULL,
  `waste` double(8,2) DEFAULT NULL,
  `waste_notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antlers` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` int DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES (1,1,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,33.00,33.00,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2017-10-20 21:34:19',NULL),(2,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,32.00,32.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-10-22 16:32:16',NULL),(3,2,'Älg','Kvigkalv','moose','female','calf',NULL,NULL,NULL,NULL,47.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-10-24 18:07:12',NULL),(4,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:07:32','2017-10-25 17:03:43',NULL),(5,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,47.00,NULL,NULL,NULL,0.00,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:16:12','2017-10-25 17:08:58',NULL),(6,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,47.00,NULL,NULL,NULL,0.00,NULL,'Stång-Halvskovel',NULL,NULL,'2017-10-25 17:17:04',NULL),(7,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:18:45','2017-10-25 17:18:36',NULL),(8,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,33.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-10-26 16:50:53',NULL),(9,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,25.00,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2017-10-27 17:16:38',NULL),(10,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,27.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2017-11-25 17:25:53',NULL),(11,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-11-26 13:42:48',NULL),(12,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,20.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-11-26 17:00:25',NULL),(13,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,'2017-12-02 18:44:50','2017-12-02 19:42:18',NULL),(14,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,17.00,17.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-02 19:46:13',NULL),(15,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,21.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-03 17:21:41',NULL),(16,2,'Dovvilt','Hjort','fallowdeer','male','adult',83.00,NULL,NULL,NULL,46.00,NULL,NULL,NULL,0.00,NULL,'Helskovel',NULL,NULL,'2017-12-11 18:38:22',NULL),(17,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,25.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-11 21:07:15',NULL),(18,2,'Dovvilt','Hjort','fallowdeer','male','adult',44.00,NULL,NULL,NULL,23.00,NULL,NULL,333.00,0.00,NULL,'Spets',NULL,NULL,'2017-12-17 19:16:47',NULL),(19,2,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-18 07:40:17',NULL),(20,11,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,16.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-27 17:32:46',NULL),(21,2,'Rådjur','Bock','roedeer','male','adult',NULL,NULL,15.00,NULL,11.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-29 10:21:40',NULL),(22,11,'Kronvilt','Smalhind','reddeer','female','adult',107.00,NULL,NULL,NULL,63.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-03 20:08:42',NULL),(23,13,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,19.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-08 16:41:59',NULL),(24,2,'Rådjur','Smaldjur','roedeer','female','adult',NULL,NULL,NULL,NULL,NULL,11.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-16 11:28:55',NULL),(25,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,26.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-17 17:25:06',NULL),(26,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,12.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-17 17:47:59',NULL),(27,12,'Rådjur','Smaldjur','roedeer','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,'2018-01-23 05:44:33','2018-01-20 21:26:32',NULL),(28,11,'Dovvilt','Hjort','fallowdeer','male','adult',42.00,NULL,NULL,NULL,20.00,NULL,NULL,0.43,0.00,NULL,'Spets',NULL,NULL,'2018-01-23 18:12:03',NULL),(29,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,25.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-28 10:14:46',NULL),(30,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-28 15:49:35',NULL),(31,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,17.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-28 15:56:00',NULL),(32,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',25.00,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-03 13:53:47',NULL),(33,2,'Vildsvin','Gylta','boar','female','adult',72.00,NULL,56.00,NULL,35.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-16 18:28:31',NULL),(34,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-18 19:53:13',NULL),(35,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',26.00,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-21 22:19:46',NULL),(36,2,'Dovvilt','Hind','fallowdeer','female','adult',35.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-24 19:27:01',NULL),(37,10,'Vildsvin','Galt','boar','male','adult',65.00,65.00,NULL,NULL,30.00,30.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-03-20 12:00:12',NULL),(38,2,'Vildsvin','Galt','boar','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-08-09 17:35:52',NULL),(39,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,28.00,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2018-09-17 10:27:49',NULL),(40,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,NULL,10.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-10-20 09:58:38',NULL),(41,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-11-07 08:20:20',NULL),(42,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,33.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-11-18 08:15:55',NULL),(43,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,27.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-11-18 11:37:03',NULL),(44,2,'Kronvilt','Hjort','reddeer','male','adult',97.00,NULL,NULL,NULL,55.00,NULL,NULL,NULL,0.00,NULL,'2',2,NULL,'2019-01-02 20:16:21',NULL),(45,2,'Dovvilt','Hjort','fallowdeer','male','adult',75.00,NULL,NULL,NULL,46.00,NULL,NULL,NULL,0.00,NULL,'Halvskovel-Helskovel',NULL,NULL,'2019-01-02 20:18:49',NULL),(46,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-05 08:37:52',NULL),(47,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,44.00,NULL,NULL,NULL,0.00,NULL,'Helskovel',NULL,NULL,'2019-01-07 07:43:35',NULL),(48,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,34.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2019-01-09 15:22:57',NULL),(49,2,'Dovvilt','Hjort','fallowdeer','male','adult',51.00,NULL,NULL,NULL,30.00,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2019-01-13 16:34:58',NULL),(50,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,28.00,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2019-01-13 16:38:40',NULL),(51,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,29.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-13 16:41:44',NULL),(52,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,12.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-13 17:19:15',NULL),(53,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,'2019-01-13 18:25:33','2019-01-13 17:25:13',NULL),(54,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',26.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-19 09:55:31',NULL),(55,2,'Kronvilt','Hindkalv','reddeer','female','calf',NULL,NULL,NULL,NULL,40.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 08:42:12',NULL),(56,11,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,39.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 18:48:50',NULL),(57,2,'Kronvilt','Smalhind','reddeer','female','adult',NULL,NULL,NULL,NULL,62.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 19:55:40',NULL),(58,2,'Kronvilt','Smalhind','reddeer','female','adult',NULL,NULL,77.00,NULL,62.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 20:02:26',NULL),(59,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,55.00,NULL,40.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 20:04:46',NULL),(60,2,'Rådjur','Bock','roedeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-27 10:20:16',NULL),(61,2,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-29 15:11:25',NULL),(62,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,37.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2019-01-30 11:49:51',NULL),(63,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,27.00,27.00,NULL,NULL,0.00,'Mats Johansson vart tilldelad köttet.','Spets',NULL,NULL,'2019-01-30 11:51:36',NULL),(64,11,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-30 11:53:21',NULL),(65,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-30 11:55:02',NULL),(66,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',22.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-04 17:43:09',NULL),(67,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-06 18:26:16',NULL),(68,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,31.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-06 18:34:59',NULL),(69,2,'Dovvilt','Obestämd kalv','fallowdeer','unknown','calf',23.00,NULL,NULL,NULL,NULL,11.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-06 18:40:53',NULL),(70,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,25.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-07 13:20:18',NULL),(71,11,'Vildsvin','Galtkulting','boar','male','calf',NULL,NULL,NULL,NULL,20.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-14 12:48:13',NULL),(72,11,'Vildsvin','Gylta','boar','female','adult',46.00,NULL,NULL,NULL,24.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-03-16 12:45:20',NULL),(73,2,'Vildsvin','Galt','boar','male','adult',55.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-05-28 22:02:42',NULL),(74,11,'Vildsvin','Gylta','boar','female','adult',NULL,32.00,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-05 20:52:24',NULL),(75,2,'Kronvilt','Hind','reddeer','female','adult',NULL,NULL,NULL,NULL,63.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-18 15:48:38',NULL),(76,2,'Älg','Tjurkalv','moose','male','calf',NULL,NULL,NULL,NULL,52.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-19 16:34:58',NULL),(77,2,'Vildsvin','Suggkulting','boar','female','calf',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-19 16:35:47',NULL),(78,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2019-10-19 16:36:37',NULL),(79,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,34.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-23 17:46:27',NULL),(80,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,38.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-09 16:52:33',NULL),(81,2,'Vildsvin','Gylta','boar','female','adult',66.00,NULL,NULL,NULL,37.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-09 18:04:41',NULL),(82,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,40.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2019-11-16 11:45:00',NULL),(83,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,17.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-30 08:52:39',NULL),(84,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-30 10:21:25',NULL),(85,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,14.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-30 10:22:13',NULL),(86,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,16.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-30 10:23:07',NULL),(87,2,'Dovvilt','Obestämd kalv','fallowdeer','unknown','calf',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,'Niclas köpte djuret för 25:- kilot slaktkropp',NULL,NULL,NULL,'2019-12-01 19:52:12',NULL),(88,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,17.00,NULL,17.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-01-19 11:42:05',NULL),(89,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-01-19 15:30:33',NULL),(90,11,'Vildsvin','Galt','boar','male','adult',NULL,NULL,NULL,NULL,16.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-01-20 08:58:03',NULL),(91,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,26.00,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2020-01-20 12:39:56',NULL),(92,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,38.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2020-01-26 12:50:41',NULL),(93,11,'Rådjur','Bockkilling','roedeer','male','calf',NULL,NULL,NULL,NULL,9.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-02-04 16:49:05',NULL),(94,2,'Vildsvin','Obestämd kulting','boar','unknown','calf',NULL,NULL,NULL,NULL,17.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-02-08 23:06:05',NULL),(95,11,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,15.00,15.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-02-15 08:58:43',NULL),(96,11,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,18.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-10-31 06:37:29','2020-10-31 06:37:29'),(97,2,'Rådjur','Bock','roedeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-10-31 09:40:58','2020-10-31 09:40:58'),(98,19,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,33.00,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-10-31 12:42:20','2020-10-31 12:42:20');
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas`
--

LOCK TABLES `areas` WRITE;
/*!40000 ALTER TABLE `areas` DISABLE KEYS */;
INSERT INTO `areas` VALUES (1,'Småris',NULL,NULL,'2017-10-06 15:27:08',NULL),(2,'Glotterbäck',NULL,NULL,'2017-10-06 15:27:11',NULL),(3,'Haddebo',NULL,NULL,'2017-10-06 15:27:13',NULL),(4,'Västerby',NULL,NULL,'2017-10-06 15:27:17',NULL),(5,'Nästorp',NULL,NULL,'2017-10-06 15:27:20',NULL),(6,'Pålsboda',NULL,NULL,'2017-10-06 15:27:23',NULL);
/*!40000 ALTER TABLE `areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `killreport_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `filesize` bigint NOT NULL DEFAULT '0',
  `filesize_readable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` VALUES (3,97,2,'hunterjohan-97.jpeg','images/killreports','yes',NULL,1027168,'0.98MB','2020-10-28 05:58:34','2020-10-28 06:05:21'),(4,96,2,'hunterjohan-96.JPG','images/killreports','yes',NULL,1660845,'1.58MB','2020-10-28 06:07:06','2020-10-28 06:07:11'),(5,95,11,'hunterviktor-95.JPG','images/killreports','yes',NULL,1224694,'1.17MB','2020-10-28 06:09:25','2020-10-28 06:09:32'),(6,92,2,'hunterjohan-92.jpg','images/killreports','yes',NULL,795150,'776.51kB','2020-10-28 06:12:15','2020-10-28 06:12:21'),(7,91,2,'hunterjohan-91.JPG','images/killreports','yes',NULL,1434013,'1.37MB','2020-10-28 06:14:29','2020-10-28 06:14:35'),(8,94,2,'hunterjohan-94.JPG','images/killreports','yes',NULL,1053365,'1MB','2020-10-28 06:18:41','2020-10-28 06:18:57'),(12,87,2,'hunterjohan-87.JPG','images/killreports','yes',NULL,892720,'871.8kB','2020-10-28 06:30:04','2020-10-28 06:30:10'),(13,88,2,'hunterjohan-88.JPG','images/killreports','yes',NULL,950304,'0.91MB','2020-10-28 06:32:23','2020-10-28 06:32:30'),(14,89,2,'hunterjohan-89.JPG','images/killreports','yes',NULL,776608,'758.41kB','2020-10-28 06:34:32','2020-10-28 06:34:41'),(15,85,2,'hunterjohan-85.JPG','images/killreports','yes',NULL,1134523,'1.08MB','2020-10-28 06:35:25','2020-10-28 06:35:36'),(16,83,2,'hunter-83.jpg','images/killreports','yes',NULL,853514,'833.51kB','2020-10-28 06:37:07','2020-10-28 06:37:17'),(17,84,2,'hunterjohan-84.JPG','images/killreports','yes',NULL,1220144,'1.16MB','2020-10-28 06:37:57','2020-10-28 06:38:06'),(18,82,2,'hunterjohan-82.jpg','images/killreports','yes',NULL,246206,'240.44kB','2020-10-28 06:38:49','2020-10-28 06:38:53'),(19,78,2,'hunterjohan-78.JPG','images/killreports','yes',NULL,1086839,'1.04MB','2020-10-28 06:40:20','2020-10-28 06:40:27'),(20,76,2,'hunterjohan-76.jpeg','images/killreports','yes',NULL,1174646,'1.12MB','2020-10-28 06:41:13','2020-10-28 06:41:20'),(21,75,11,'hunterviktor-75.jpg','images/killreports','yes',NULL,957635,'0.91MB','2020-10-28 06:42:10','2020-10-28 06:42:17'),(22,74,11,'hunterviktor-74.jpg','images/killreports','yes',NULL,799809,'781.06kB','2020-10-28 06:43:02','2020-10-28 06:43:08'),(23,69,2,'hunterjohan-69.JPG','images/killreports','yes',NULL,605635,'591.44kB','2020-10-28 06:43:52','2020-10-28 06:44:02'),(24,67,2,'hunterjohan-67.JPG','images/killreports','yes',NULL,667045,'651.41kB','2020-10-28 06:44:54','2020-10-28 06:45:02'),(25,65,2,'hunterjohan-65.JPG','images/killreports','yes',NULL,671167,'655.44kB','2020-10-28 06:45:39','2020-10-28 06:45:43'),(26,66,2,'hunterjohan-66.JPG','images/killreports','yes',NULL,660227,'644.75kB','2020-10-28 06:46:18','2020-10-28 06:46:48'),(27,68,2,'hunterjohan-68.JPG','images/killreports','yes',NULL,1329702,'1.27MB','2020-10-28 06:47:34','2020-10-28 06:47:41'),(28,62,2,'hunterjohan-62.JPG','images/killreports','yes',NULL,974100,'0.93MB','2020-10-28 06:48:10','2020-10-28 06:48:15'),(29,61,2,'hunterjohan-61.JPG','images/killreports','yes',NULL,712696,'695.99kB','2020-10-28 06:48:44','2020-10-28 06:48:54'),(30,58,2,'hunterjohan-58.JPG','images/killreports','yes',NULL,1195083,'1.14MB','2020-10-28 06:49:33','2020-10-28 06:49:38'),(31,57,2,'hunterjohan-57.JPG','images/killreports','yes',NULL,537744,'525.14kB','2020-10-28 06:50:10','2020-10-28 06:50:14'),(32,52,2,'hunterjohan-52.JPG','images/killreports','yes',NULL,635637,'620.74kB','2020-10-28 06:51:14','2020-10-28 06:51:18'),(33,53,2,'hunterjohan-53.JPG','images/killreports','yes',NULL,1067173,'1.02MB','2020-10-28 06:54:39','2020-10-28 06:54:43'),(34,54,2,'hunterjohan-54.jpeg','images/killreports','yes',NULL,337207,'329.3kB','2020-10-28 06:55:13','2020-10-28 06:55:20'),(35,60,2,'hunterjohan-60.jpeg','images/killreports','yes',NULL,272574,'266.19kB','2020-10-28 06:56:47','2020-10-28 06:56:51'),(36,49,2,'hunterjohan-49.JPG','images/killreports','yes',NULL,1068036,'1.02MB','2020-10-28 06:57:26','2020-10-28 06:57:35'),(37,50,2,'hunterjohan-50.JPG','images/killreports','yes',NULL,1100302,'1.05MB','2020-10-28 06:58:42','2020-10-28 06:58:51'),(38,55,2,'hunterjohan-55.jpeg','images/killreports','yes',NULL,1636838,'1.56MB','2020-10-28 06:59:40','2020-10-28 06:59:58'),(39,70,11,'hunterviktor-70.jpg','images/killreports','yes',NULL,1316922,'1.26MB','2020-10-28 07:02:51','2020-10-28 07:03:06'),(40,47,2,'hunterjohan-47.JPG','images/killreports','yes',NULL,716197,'699.41kB','2020-10-28 07:03:47','2020-10-28 07:03:53'),(41,48,2,'hunterjohan-48.JPG','images/killreports','yes',NULL,687767,'671.65kB','2020-10-28 07:05:09','2020-10-28 07:05:24'),(42,51,2,'hunterjohan-51.JPG','images/killreports','yes',NULL,1038883,'0.99MB','2020-10-28 07:06:16','2020-10-28 07:06:21'),(43,59,11,'hunterviktor-59.jpg','images/killreports','yes',NULL,733981,'716.78kB','2020-10-28 07:07:06','2020-10-28 07:07:12'),(44,45,2,'hunterjohan-45.JPG','images/killreports','yes',NULL,1571328,'1.5MB','2020-10-28 07:07:58','2020-10-28 07:08:03'),(45,46,2,'hunterjohan-46.jpeg','images/killreports','yes',NULL,1897146,'1.81MB','2020-10-28 07:10:03','2020-10-28 07:10:11'),(46,73,2,'hunterjohan-73.jpg','images/killreports','yes',NULL,294876,'287.96kB','2020-10-28 07:11:15','2020-10-28 07:11:20'),(47,44,2,'hunterjohan-44.jpeg','images/killreports','yes',NULL,478872,'467.65kB','2020-10-28 07:12:15','2020-10-28 07:12:22'),(48,43,2,'hunterjohan-43.JPG','images/killreports','yes',NULL,1265334,'1.21MB','2020-10-28 07:13:04','2020-10-28 07:13:08'),(49,72,2,'hunterjohan-72.JPG','images/killreports','yes',NULL,1204951,'1.15MB','2020-10-28 07:13:53','2020-10-28 07:14:02'),(50,42,2,'hunterjohan-42.jpg','images/killreports','yes',NULL,702947,'686.47kB','2020-10-28 07:14:51','2020-10-28 07:15:00'),(51,63,2,'hunterjohan-63.jpg','images/killreports','yes',NULL,534437,'521.91kB','2020-10-28 07:15:55','2020-10-28 07:16:02'),(52,41,2,'hunterjohan-41.JPG','images/killreports','yes',NULL,662902,'647.37kB','2020-10-28 07:16:35','2020-10-28 07:16:54'),(53,64,2,'hunterjohan-64.jpeg','images/killreports','yes',NULL,826502,'807.13kB','2020-10-28 07:17:38','2020-10-28 07:17:43'),(54,40,11,'hunterviktor-40.jpg','images/killreports','yes',NULL,692666,'676.43kB','2020-10-28 07:19:49','2020-10-28 07:19:56'),(55,39,2,'hunterjohan-39.jpg','images/killreports','yes',NULL,61928,'60.48kB','2020-10-28 07:20:43','2020-10-28 07:20:52'),(56,38,2,'hunterjohan-38.JPG','images/killreports','yes',NULL,542550,'529.83kB','2020-10-28 07:21:36','2020-10-28 07:21:41'),(57,37,2,'hunterjohan-37.jpeg','images/killreports','yes',NULL,1930503,'1.84MB','2020-10-28 07:22:24','2020-10-28 07:22:30'),(58,36,2,'hunterjohan-36.JPG','images/killreports','yes',NULL,734106,'716.9kB','2020-10-28 07:23:19','2020-10-28 07:23:27'),(59,35,2,'hunterjohan-35.JPG','images/killreports','yes',NULL,841180,'821.46kB','2020-10-28 07:24:23','2020-10-28 07:24:27'),(61,33,2,'hunterjohan-33.JPG','images/killreports','yes',NULL,1198806,'1.14MB','2020-10-28 07:25:56','2020-10-28 07:26:02'),(62,32,2,'hunterjohan-32.JPG','images/killreports','yes',NULL,1098598,'1.05MB','2020-10-28 07:27:46','2020-10-28 07:27:49'),(63,34,2,'hunterjohan-34.jpg','images/killreports','yes',NULL,145023,'141.62kB','2020-10-28 07:28:32','2020-10-28 07:28:35'),(64,31,11,'hunterviktor-31.jpg','images/killreports','yes',NULL,874277,'853.79kB','2020-10-28 07:29:31','2020-10-28 07:29:38'),(66,28,11,'hunterviktor-28.jpg','images/killreports','yes',NULL,37590,'36.71kB','2020-10-28 07:32:11','2020-10-28 07:32:14'),(67,29,11,'hunterviktor-29.jpg','images/killreports','yes',NULL,701289,'684.85kB','2020-10-28 07:32:48','2020-10-28 07:32:52'),(68,27,11,'hunterviktor-27.jpg','images/killreports','no',NULL,1398905,'1.33MB','2020-10-28 07:34:39','2020-10-28 07:34:39'),(69,27,2,'hunterjohan-27.JPG','images/killreports','yes',NULL,5916884,'5.64MB','2020-10-28 07:35:38','2020-10-28 07:35:43'),(70,24,11,'hunterviktor-24.jpg','images/killreports','yes',NULL,1064954,'1.02MB','2020-10-28 07:36:52','2020-10-28 07:36:59'),(71,23,11,'hunterviktor-23.jpg','images/killreports','yes',NULL,891758,'870.86kB','2020-10-28 07:39:17','2020-10-28 07:39:25'),(72,22,2,'hunterjohan-22.jpg','images/killreports','yes',NULL,256040,'250.04kB','2020-10-28 07:40:24','2020-10-28 07:40:35'),(73,21,11,'hunterviktor-21.jpg','images/killreports','yes',NULL,1014890,'0.97MB','2020-10-28 07:41:21','2020-10-28 07:41:26'),(74,18,2,'hunterjohan-18.JPG','images/killreports','yes',NULL,715459,'698.69kB','2020-10-28 07:42:14','2020-10-28 07:42:20'),(75,20,2,'hunterjohan-20.JPG','images/killreports','yes',NULL,598177,'584.16kB','2020-10-28 07:43:06','2020-10-28 07:43:10'),(76,16,2,'hunterjohan-16.JPG','images/killreports','yes',NULL,895299,'874.32kB','2020-10-28 07:43:55','2020-10-28 07:43:59'),(77,15,2,'hunterjohan-15.JPG','images/killreports','no',NULL,840773,'821.07kB','2020-10-28 07:45:07','2020-10-28 07:45:07'),(78,15,2,'hunterjohan-15.jpg','images/killreports','yes',NULL,285464,'278.77kB','2020-10-28 07:45:30','2020-10-28 07:45:36'),(79,14,11,'hunterviktor-14.jpg','images/killreports','yes',NULL,1033146,'0.99MB','2020-10-28 07:47:51','2020-10-28 07:48:02'),(80,11,2,'hunterjohan-11.jpg','images/killreports','yes',NULL,288119,'281.37kB','2020-10-28 07:48:54','2020-10-28 07:49:02'),(81,12,2,'hunterjohan-12.JPG','images/killreports','yes',NULL,1253419,'1.2MB','2020-10-28 07:49:56','2020-10-28 07:50:01'),(82,10,2,'hunterjohan-10.JPG','images/killreports','yes',NULL,941088,'919.03kB','2020-10-28 07:51:00','2020-10-28 07:51:11'),(83,24,13,'hunteranders-24.jpg','images/killreports','no',NULL,1749405,'1.67MB','2020-10-28 07:52:06','2020-10-28 07:52:06'),(84,2,11,'hunterviktor-2.jpg','images/killreports','yes',NULL,905769,'884.54kB','2020-10-28 07:53:03','2020-10-28 07:53:09'),(85,1,11,'hunterviktor-1.jpg','images/killreports','yes',NULL,1074312,'1.02MB','2020-10-28 07:54:05','2020-10-28 07:54:10'),(86,8,2,'hunterjohan-8.jpg','images/killreports','yes',NULL,295327,'288.41kB','2020-10-28 07:55:06','2020-10-28 07:55:09'),(87,3,2,'hunterjohan-3.JPG','images/killreports','yes',NULL,1537106,'1.47MB','2020-10-28 07:56:05','2020-10-28 07:56:11'),(88,6,2,'hunterjohan-6.jpg','images/killreports','yes',NULL,406458,'396.93kB','2020-10-28 07:59:33','2020-10-28 07:59:36'),(89,17,2,'hunterjohan-17.jpg','images/killreports','yes',NULL,936740,'914.79kB','2020-10-28 08:00:59','2020-10-28 08:01:09'),(90,9,11,'hunterviktor-9.jpg','images/killreports','yes',NULL,756407,'738.68kB','2020-10-28 08:01:49','2020-10-28 08:01:52'),(93,98,1,'hunterviktor-98.JPG','images/killreports','yes',NULL,745845,'728.36kB','2020-10-31 07:50:58','2020-10-31 07:51:20'),(94,99,1,'hunterviktor-99.jpg','images/killreports','yes',NULL,1241450,'1.18MB','2020-10-31 07:51:48','2020-10-31 07:52:30'),(95,100,2,'IMG_8189.JPG','images/killreports','yes',NULL,1005353,'0.96MB','2020-10-31 09:44:12','2020-10-31 09:44:54'),(96,100,2,'DSC_8113.JPG','images/killreports','no',NULL,938328,'916.34kB','2020-10-31 09:45:39','2020-10-31 09:45:39'),(97,101,2,'IMG_20201031_133617_901.jpg','images/killreports','yes',NULL,360992,'352.53kB','2020-10-31 12:42:55','2020-10-31 12:43:01');
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagesv2`
--

DROP TABLE IF EXISTS `imagesv2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imagesv2` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `killreport_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'no',
  `description` text COLLATE utf8mb4_unicode_ci,
  `filesize` bigint NOT NULL DEFAULT '0',
  `filesize_readable` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagesv2`
--

LOCK TABLES `imagesv2` WRITE;
/*!40000 ALTER TABLE `imagesv2` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagesv2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `killreports`
--

DROP TABLE IF EXISTS `killreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `killreports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `reporter_id` bigint unsigned NOT NULL,
  `shooter_id` bigint unsigned NOT NULL,
  `kindofhunt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `animal_id` bigint unsigned NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `killdate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `season` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_id` bigint unsigned NOT NULL,
  `place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitud` double(8,2) DEFAULT NULL,
  `latitud` double(8,2) DEFAULT NULL,
  `report_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `killreports`
--

LOCK TABLES `killreports` WRITE;
/*!40000 ALTER TABLE `killreports` DISABLE KEYS */;
INSERT INTO `killreports` VALUES (1,11,11,'Ensamjakt',1,'hunterviktor-1.jpg','2017-10-20 00:00:00','17/18',2,'Stora gärdet ',15.38,58.92,'green','yes',NULL,'2017-10-20 21:34:19',NULL),(2,11,18,'Ensamjakt',2,'hunterviktor-2.jpg','2017-10-21 00:00:00','17/18',1,'Tornet. Jannesberg ',NULL,NULL,'green','yes',NULL,'2017-10-22 16:32:17',NULL),(3,2,11,'Ensamjakt',3,'hunterjohan-3.JPG','2017-10-09 00:00:00','17/18',1,'Innan nedre vändplan på grusgropsvägen ',15.39,58.91,'green','yes',NULL,'2017-10-24 18:07:12',NULL),(4,12,12,'Ensamjakt',4,'hunterpeter-4.JPG','2017-10-09 00:00:00','17/18',1,'Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:07:32','2017-10-25 17:03:43',NULL),(5,12,12,'Ensamjakt',5,'hunterpeter-5.JPG','2017-10-09 00:00:00','17/18',1,'Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:16:12','2017-10-25 17:08:58',NULL),(6,12,12,'Ensamjakt',6,'hunterjohan-6.jpg','2017-10-09 00:00:00','17/18',1,'Tornet vid jannesberg. ',15.38,58.91,'green','yes',NULL,'2017-10-25 17:17:04',NULL),(7,12,12,'Ensamjakt',7,'default.png','2017-10-09 00:00:00','17/18',1,'Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:18:45','2017-10-25 17:18:36',NULL),(8,2,11,'Ensamjakt',8,'hunterjohan-8.jpg','2017-10-11 00:00:00','17/18',1,'Hygget mellan kojan och stenmurshålet ',15.36,58.91,'green','yes',NULL,'2017-10-26 16:50:53',NULL),(9,11,11,'Ensamjakt',9,'hunterviktor-9.jpg','2017-09-23 00:00:00','17/18',2,'Stora gärdet ',15.42,58.90,'green','yes',NULL,'2017-10-27 17:16:38',NULL),(10,2,19,'Gemensam jakt',10,'hunterjohan-10.JPG','2017-11-24 23:00:00','17/18',1,'Tornet Jannesberg',15.38,58.91,'green','yes',NULL,'2017-11-25 17:25:53',NULL),(11,2,2,'Ensamjakt',11,'hunterjohan-11.jpg','2017-11-25 23:00:00','17/18',2,'Bak vedboden',15.42,58.90,'green','yes',NULL,'2017-11-26 13:42:48',NULL),(12,2,11,'Ensamjakt',12,'hunterjohan-12.JPG','2017-11-25 23:00:00','17/18',2,'Långåkern nordvästra',15.38,58.92,'green','yes',NULL,'2017-11-26 17:00:25',NULL),(13,11,20,'Ensamjakt',13,'hunterviktor-13.jpg','2017-12-01 23:00:00','17/18',1,'Stenmursh&aring;let ',NULL,NULL,'yellow','no','2017-12-02 18:44:50','2017-12-02 19:42:18',NULL),(14,11,20,'Ensamjakt',14,'hunterviktor-14.jpg','2017-12-01 23:00:00','17/18',1,'Stenmurshålet',NULL,NULL,'green','yes',NULL,'2017-12-02 19:46:13',NULL),(15,2,2,'Ensamjakt',15,'hunterjohan-15.jpg','2017-12-02 23:00:00','17/18',2,'Götes kulle',15.38,58.92,'green','yes',NULL,'2017-12-03 17:21:41',NULL),(16,2,11,'Ensamjakt',16,'hunterjohan-16.JPG','2017-12-09 23:00:00','17/18',1,'Grusgropen',NULL,NULL,'yellow','yes',NULL,'2017-12-11 18:38:22',NULL),(17,2,12,'Gemensam jakt',17,'hunterjohan-17.jpg','2017-10-01 00:00:00','17/18',1,'Vändplan mossen',NULL,NULL,'green','yes',NULL,'2017-12-11 21:07:15',NULL),(18,2,2,'Ensamjakt',18,'hunterjohan-18.JPG','2017-12-16 23:00:00','17/18',1,'Bunten snickis ',NULL,NULL,'green','yes',NULL,'2017-12-17 19:16:47',NULL),(20,2,2,'Ensamjakt',19,'hunterjohan-20.JPG','2017-12-16 23:00:00','17/18',2,'Gärdet öster glotterbäck ',15.39,58.91,'yellow','no',NULL,'2017-12-18 07:40:17',NULL),(21,11,21,'Ensamjakt',20,'hunterviktor-21.jpg','2017-12-26 23:00:00','17/18',1,'Hygget söder om kojan.',NULL,NULL,'green','yes',NULL,'2017-12-27 17:32:46',NULL),(22,2,2,'Gemensam jakt',21,'hunterjohan-22.jpg','2017-12-28 23:00:00','17/18',1,'Tornet stenmurshålet ',15.36,58.91,'green','yes',NULL,'2017-12-29 10:21:40',NULL),(23,11,11,'Ensamjakt',22,'hunterviktor-23.jpg','2018-01-02 23:00:00','17/18',1,'Nedre vändplan',NULL,NULL,'green','yes',NULL,'2018-01-03 20:08:42',NULL),(24,13,11,'Ensamjakt',23,'hunterviktor-24.jpg','2018-01-07 23:00:00','17/18',1,'Kroken',NULL,NULL,'green','yes',NULL,'2018-01-08 16:41:59',NULL),(27,2,12,'Gemensam jakt',24,'hunterjohan-27.JPG','2018-01-12 23:00:00','17/18',1,'Tornet innan rönnen',15.37,58.90,'green','yes',NULL,'2018-01-16 11:28:55',NULL),(28,2,16,'Ensamjakt',25,'hunterviktor-28.jpg','2018-01-16 23:00:00','17/18',1,'Nedre vändplan',NULL,NULL,'green','yes',NULL,'2018-01-17 17:25:06',NULL),(29,2,11,'Ensamjakt',26,'hunterviktor-29.jpg','2018-01-16 23:00:00','17/18',2,'Johans torn stora gärdet',NULL,NULL,'green','yes',NULL,'2018-01-17 17:47:59',NULL),(30,12,12,'Gemensam jakt',27,'default.png','2018-01-13 23:00:00','17/18',1,'Tornet innan rönna ',NULL,NULL,'yellow','no','2018-01-23 05:44:33','2018-01-20 21:26:32',NULL),(31,11,11,'Ensamjakt',28,'hunterviktor-31.jpg','2018-01-22 23:00:00','17/18',1,'Mossen vändplan',NULL,NULL,'green','yes',NULL,'2018-01-23 18:12:03',NULL),(32,2,12,'Gemensam jakt',29,'hunterjohan-32.JPG','2018-01-27 23:00:00','17/18',1,'Götes kulle',15.39,58.91,'green','yes',NULL,'2018-01-28 10:14:46',NULL),(33,2,12,'Gemensam jakt',30,'hunterjohan-33.JPG','2018-01-27 23:00:00','17/18',1,'Götes kulle',15.39,58.91,'yellow','no',NULL,'2018-01-28 15:49:35',NULL),(34,2,16,'Gemensam jakt',31,'hunterjohan-34.jpg','2018-01-27 23:00:00','17/18',1,'Norr om akvägen inför rönnen en bit',15.37,58.90,'green','yes',NULL,'2018-01-28 15:56:00',NULL),(35,2,11,'Gemensam jakt',32,'hunterjohan-35.JPG','2018-02-02 23:00:00','17/18',1,'Gustaf-Adolfstorg',15.34,58.91,'green','yes',NULL,'2018-02-03 13:53:47',NULL),(36,2,13,'Ensamjakt',33,'hunterjohan-36.JPG','2018-02-14 23:00:00','17/18',1,'Åteln nedre vändplan',15.39,58.91,'green','yes',NULL,'2018-02-16 18:28:31',NULL),(37,2,22,'Gemensam jakt',34,'hunterjohan-37.jpeg','2018-02-16 23:00:00','17/18',1,'Stenarna bortanför grusgropen ',NULL,NULL,'green','yes',NULL,'2018-02-18 19:53:13',NULL),(38,2,2,'Ensamjakt',35,'hunterjohan-38.JPG','2018-02-20 23:00:00','17/18',1,'Snickis',15.40,58.91,'green','yes',NULL,'2018-02-21 22:19:46',NULL),(39,2,2,'Ensamjakt',36,'hunterjohan-39.jpg','2018-02-23 23:00:00','17/18',2,'Johans torn',15.38,58.92,'yellow','no',NULL,'2018-02-24 19:27:01',NULL),(40,10,10,'Ensamjakt',37,'hunterviktor-40.jpg','2018-03-15 23:00:00','17/18',5,'Ralatorpet',NULL,NULL,'green','no',NULL,'2018-03-20 12:00:12',NULL),(41,2,2,'Ensamjakt',38,'hunterjohan-41.JPG','2018-08-07 00:00:00','18/19',2,'Östra gärdet ',15.39,58.91,'yellow','no',NULL,'2018-08-09 17:35:52',NULL),(42,2,11,'Ensamjakt',39,'hunterjohan-42.jpg','2018-09-16 02:00:00','18/19',1,'Mellan kroken och grusgropen',NULL,NULL,'green','no',NULL,'2018-09-17 10:27:49',NULL),(43,2,18,'Gemensam jakt',40,'hunterjohan-43.JPG','2018-10-20 02:00:00','18/19',1,'Tornet innan rönnen ',NULL,NULL,'green','yes',NULL,'2018-10-20 09:58:38',NULL),(44,2,2,'Ensamjakt',41,'hunterjohan-44.jpeg','2018-11-03 01:00:00','18/19',2,'Stora gärdet',15.38,58.92,'yellow','no',NULL,'2018-11-07 08:20:20',NULL),(45,2,2,'Gemensam jakt',42,'hunterjohan-45.JPG','2018-11-17 01:00:00','18/19',1,'Mittentornet mellan kojan och rönnen',15.36,58.90,'green','yes',NULL,'2018-11-18 08:15:55',NULL),(46,2,18,'Gemensam jakt',43,'hunterjohan-46.jpeg','2018-11-17 01:00:00','18/19',1,'Mossevändplan',NULL,NULL,'green','yes',NULL,'2018-11-18 11:37:03',NULL),(47,2,11,'Ensamjakt',44,'hunterjohan-47.JPG','2019-01-02 01:00:00','18/19',1,'Grusgropsvägen',NULL,NULL,'green','yes',NULL,'2019-01-02 20:16:21',NULL),(48,2,12,'Ensamjakt',45,'hunterjohan-48.JPG','2019-01-01 01:00:00','18/19',1,'Nedre vändplan grusgropsvägen',15.39,58.91,'green','yes',NULL,'2019-01-02 20:18:49',NULL),(49,2,15,'Gemensam jakt',46,'hunterjohan-49.JPG','2019-01-05 01:00:00','18/19',1,'Berget snickarbohagen',15.40,58.91,'green','yes',NULL,'2019-01-05 08:37:52',NULL),(50,2,18,'Gemensam jakt',47,'hunterjohan-50.JPG','2019-01-05 01:00:00','18/19',1,'Mittentornet efter kojan',NULL,NULL,'green','yes',NULL,'2019-01-07 07:43:35',NULL),(51,2,12,'Gemensam jakt',48,'hunterjohan-51.JPG','2018-12-29 01:00:00','18/19',1,'Mittentornet efter kojan',NULL,NULL,'green','yes',NULL,'2019-01-09 15:22:57',NULL),(52,2,11,'Ensamjakt',49,'hunterjohan-52.JPG','2019-01-13 01:00:00','18/19',1,'Götes torn mossen',15.35,58.91,'green','yes',NULL,'2019-01-13 16:34:58',NULL),(53,2,19,'Gemensam jakt',50,'hunterjohan-53.JPG','2019-01-12 01:00:00','18/19',1,'Stolpen slaggis',15.35,58.91,'green','yes',NULL,'2019-01-13 16:38:40',NULL),(54,2,19,'Gemensam jakt',51,'hunterjohan-54.jpeg','2019-01-12 01:00:00','18/19',1,'Passet inför vändplan ak-vägen',15.38,58.90,'green','yes',NULL,'2019-01-13 16:41:44',NULL),(55,2,19,'Gemensam jakt',52,'hunterjohan-55.jpeg','2019-01-05 01:00:00','18/19',1,'Ledningen snickarbo',15.40,58.91,'green','yes',NULL,'2019-01-13 17:19:15',NULL),(56,2,19,'Gemensam jakt',53,'default.png','2019-01-05 01:00:00','18/19',1,'Ledningen snickis',NULL,NULL,'yellow','no','2019-01-13 18:25:32','2019-01-13 17:25:13',NULL),(57,2,2,'Ensamjakt',54,'hunterjohan-57.JPG','2019-01-18 01:00:00','18/19',2,'Stora gärdet ',NULL,NULL,'yellow','no',NULL,'2019-01-19 09:55:31',NULL),(58,2,11,'Gemensam jakt',55,'hunterjohan-58.JPG','2019-01-26 01:00:00','18/19',1,'Mitten passet mossen ak-v&auml;gen',NULL,NULL,'green','yes',NULL,'2019-01-26 08:42:12',NULL),(59,2,11,'Ensamjakt',56,'hunterviktor-59.jpg','2018-12-21 01:00:00','18/19',1,'Nedre vändplan',NULL,NULL,'green','yes',NULL,'2019-01-26 18:48:50',NULL),(60,2,19,'Ensamjakt',57,'hunterjohan-60.jpeg','2019-01-10 01:00:00','18/19',1,'Nedre vändplan',NULL,NULL,'green','yes',NULL,'2019-01-26 19:55:40',NULL),(61,2,24,'Gemensam jakt',58,'hunterjohan-61.JPG','2019-01-26 01:00:00','18/19',1,'Gröna tornet bortför ak',NULL,NULL,'green','yes',NULL,'2019-01-26 20:02:26',NULL),(62,2,24,'Gemensam jakt',59,'hunterjohan-62.JPG','2019-01-26 01:00:00','18/19',1,'Gröna tornet bortför ak',NULL,NULL,'green','yes',NULL,'2019-01-26 20:04:46',NULL),(63,2,2,'Ensamjakt',60,'hunterjohan-63.jpg','2018-08-18 02:00:00','18/19',5,'',NULL,NULL,'yellow','no',NULL,'2019-01-27 10:20:16',NULL),(64,2,2,'Ensamjakt',61,'hunterjohan-64.jpeg','2018-05-04 02:00:00','17/18',2,'Stora gärdet',NULL,NULL,'green','no',NULL,'2019-01-29 15:11:25',NULL),(65,2,23,'Gemensam jakt',62,'hunterjohan-65.JPG','2019-01-30 01:00:00','18/19',1,'Mossen',NULL,NULL,'green','yes',NULL,'2019-01-30 11:49:52',NULL),(66,11,19,'Gemensam jakt',63,'hunterjohan-66.JPG','2019-01-30 01:00:00','18/19',1,'Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan (Mats Johansson vart tilldelad k&ouml;ttet.)\r\n',NULL,NULL,'green','yes',NULL,'2019-01-30 11:51:36',NULL),(67,2,19,'Gemensam jakt',64,'hunterjohan-67.JPG','2019-01-30 01:00:00','18/19',1,'Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan ',NULL,NULL,'green','yes',NULL,'2019-01-30 11:53:21',NULL),(68,2,11,'Gemensam jakt',65,'hunterjohan-68.JPG','2019-01-26 01:00:00','18/19',1,'Mellan första och andra i mossen ak-vägen',NULL,NULL,'green','yes',NULL,'2019-01-30 11:55:02',NULL),(69,2,11,'Ensamjakt',66,'hunterjohan-69.JPG','2019-02-04 01:00:00','18/19',2,'Johans torn stora gärdet ',NULL,NULL,'yellow','no',NULL,'2019-02-04 17:43:09',NULL),(70,2,19,'Gemensam jakt',67,'hunterviktor-70.jpg','2019-01-05 01:00:00','18/19',1,'Andra passet bak ångsågen',NULL,NULL,'green','yes',NULL,'2019-02-06 18:26:16',NULL),(71,2,18,'Ensamjakt',68,'default.png','2018-09-01 02:00:00','18/19',1,'Tornet jannesberg',NULL,NULL,'green','yes',NULL,'2019-02-06 18:34:59',NULL),(72,2,11,'Ensamjakt',69,'hunterjohan-72.JPG','2018-10-10 02:00:00','18/19',1,'Hygget mellan stenmurshålet och kojan',NULL,NULL,'green','no',NULL,'2019-02-06 18:40:53',NULL),(73,2,12,'Gemensam jakt',70,'hunterjohan-73.jpg','2018-11-17 01:00:00','18/19',1,'Mittenpasset mossen ak-vägen',15.37,58.90,'green','yes',NULL,'2019-02-07 13:20:18',NULL),(74,11,11,'Ensamjakt',71,'hunterviktor-74.jpg','2019-02-06 01:00:00','18/19',1,'Årsgris skjuten foderplats/åteln nedrevändplan\r\n',NULL,NULL,'yellow','no',NULL,'2019-02-14 12:48:13',NULL),(75,11,11,'Ensamjakt',72,'hunterviktor-75.jpg','2019-03-05 01:00:00','18/19',1,'Grusgropen ',NULL,NULL,'yellow','no',NULL,'2019-03-16 12:45:20',NULL),(76,2,11,'Ensamjakt',73,'hunterjohan-76.jpeg','2019-05-28 02:00:00','18/19',2,'Kents torn stora gärdet',NULL,NULL,'yellow','no',NULL,'2019-05-28 22:02:42',NULL),(77,11,15,'Ensamjakt',74,'default.png','2019-04-28 02:00:00','18/19',1,'vildsvin gylta',NULL,NULL,'yellow','no',NULL,'2019-10-05 20:52:24',NULL),(78,2,12,'Gemensam jakt',75,'hunterjohan-78.JPG','2019-10-12 02:00:00','19/20',1,'Mossen akvägen mellan första och andra passet',NULL,NULL,'green','no',NULL,'2019-10-18 15:48:38',NULL),(79,2,11,'Gemensam jakt',76,'default.png','2019-10-19 02:00:00','19/20',1,'Mellan första och andra passet en bit ut i mossen akvägen ',NULL,NULL,'green','yes',NULL,'2019-10-19 16:34:58',NULL),(80,2,2,'Gemensam jakt',77,'default.png','2019-10-19 02:00:00','19/20',1,'Stubbarna grusgropsvägen ',NULL,NULL,'green','yes',NULL,'2019-10-19 16:35:47',NULL),(81,2,2,'Ensamjakt',78,'default.png','2019-10-18 02:00:00','19/20',2,'Johans torn stora gärdet ',NULL,NULL,'yellow','no',NULL,'2019-10-19 16:36:37',NULL),(82,2,19,'Ensamjakt',79,'hunterjohan-82.jpg','2019-10-23 02:00:00','19/20',1,'Hygget vid harberget',NULL,NULL,'green','yes',NULL,'2019-10-23 17:46:27',NULL),(83,2,25,'Ensamjakt',80,'hunter-83.jpg','2019-11-09 01:00:00','19/20',1,'Hygget vid harberget',NULL,NULL,'green','yes',NULL,'2019-11-09 16:52:33',NULL),(84,2,12,'Gemensam jakt',81,'hunterjohan-84.JPG','2019-11-03 01:00:00','19/20',1,'Hygget nedom tornet jannesberg',NULL,NULL,'green','yes',NULL,'2019-11-09 18:04:41',NULL),(85,2,12,'Gemensam jakt',82,'hunterjohan-85.JPG','2019-11-16 01:00:00','19/20',1,'Andra tornet efter kojan',NULL,NULL,'green','yes',NULL,'2019-11-16 11:45:00',NULL),(86,2,26,'Gemensam jakt',83,'default.png','2019-11-30 01:00:00','19/20',1,'Snickarbo',NULL,NULL,'green','yes',NULL,'2019-11-30 08:52:39',NULL),(87,2,11,'Gemensam jakt',84,'hunterjohan-87.JPG','2019-11-30 01:00:00','19/20',1,'Sten snickarbohagen',NULL,NULL,'green','yes',NULL,'2019-11-30 10:21:25',NULL),(88,2,11,'Gemensam jakt',85,'hunterjohan-88.JPG','2019-11-30 01:00:00','19/20',1,'Sten snickarbohagen ',NULL,NULL,'green','yes',NULL,'2019-11-30 10:22:13',NULL),(89,2,19,'Gemensam jakt',86,'hunterjohan-89.JPG','2019-11-30 01:00:00','19/20',1,'Bj&ouml;rken snickarbohagen ',NULL,NULL,'green','yes',NULL,'2019-11-30 10:23:07',NULL),(90,2,26,'Gemensam jakt',87,'default.png','2019-11-30 01:00:00','19/20',1,'Mellan kojan och mossevägen',NULL,NULL,'green','yes',NULL,'2019-12-01 19:52:12',NULL),(91,2,2,'Gemensam jakt',88,'hunterjohan-91.JPG','2020-01-19 01:00:00','19/20',1,'Kullen vid Anders mårdfälla stenmurshålet',NULL,NULL,'green','yes',NULL,'2020-01-19 11:42:05',NULL),(92,2,12,'Gemensam jakt',89,'hunterjohan-92.jpg','2020-01-19 01:00:00','19/20',1,'Brandgatan',NULL,NULL,'green','yes',NULL,'2020-01-19 15:30:33',NULL),(93,11,11,'Ensamjakt',90,'default.png','2019-12-31 01:00:00','19/20',1,'Nedre vändplan\r\n',NULL,NULL,'green','yes',NULL,'2020-01-20 08:58:03',NULL),(94,2,27,'Gemensam jakt',91,'hunterjohan-94.JPG','2019-12-14 01:00:00','19/20',1,'Tornet stenmurshålet',NULL,NULL,'green','yes',NULL,'2020-01-20 12:39:56',NULL),(95,2,11,'Gemensam jakt',92,'hunterviktor-95.JPG','2020-01-26 01:00:00','19/20',1,'I början av mossevägen',NULL,NULL,'green','yes',NULL,'2020-01-26 12:50:41',NULL),(96,11,10,'Gemensam jakt',93,'hunterjohan-96.JPG','2020-01-31 01:00:00','19/20',1,'Gustav Adolfs väg tornet',NULL,NULL,'green','no',NULL,'2020-02-04 16:49:05',NULL),(97,2,28,'Ensamjakt',94,'hunterjohan-97.jpeg','2020-02-08 01:00:00','19/20',1,'Pentagon ',NULL,NULL,'green','yes',NULL,'2020-02-08 23:06:05',NULL),(98,11,27,'Ensamjakt',95,'hunterviktor-98.JPG','2020-02-13 01:00:00','19/20',1,'Nedre vändplan Viktor och robin satt ihop i pentagon',NULL,NULL,'green','yes',NULL,'2020-02-15 08:58:43',NULL),(99,11,11,'Ensamjakt',96,'default.JPEG','2020-02-27','19/20',1,'Hygget vid Kristin',NULL,NULL,'green','no',NULL,'2020-03-02 06:37:29','2020-03-02 06:37:29'),(100,2,2,'Ensamjakt',97,'default.JPEG','2020-10-14','20/21',2,'Johans torn stora gärdet',NULL,NULL,'green','no',NULL,'2020-10-31 09:40:58','2020-10-31 09:40:58'),(101,2,19,'Ensamjakt',98,'default.JPEG','2020-09-10','20/21',1,'Harberget',NULL,NULL,'green','no',NULL,'2020-10-31 12:42:21','2020-10-31 12:42:21');
/*!40000 ALTER TABLE `killreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meats`
--

DROP TABLE IF EXISTS `meats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meats` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `killreport_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `share_kilogram` double(8,2) DEFAULT NULL,
  `share_lot` double(8,2) DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meats`
--

LOCK TABLES `meats` WRITE;
/*!40000 ALTER TABLE `meats` DISABLE KEYS */;
INSERT INTO `meats` VALUES (1,3,10,23.50,1.00,NULL,NULL,'2017-10-24 18:08:16',NULL),(2,3,15,23.50,1.00,NULL,NULL,'2017-10-24 18:08:16',NULL),(3,6,12,47.00,NULL,NULL,NULL,'2017-10-25 17:19:25',NULL),(4,2,10,32.00,NULL,NULL,NULL,'2017-10-27 17:14:53',NULL),(5,8,11,33.00,NULL,NULL,NULL,'2017-10-27 17:22:51',NULL),(6,10,14,27.00,NULL,NULL,NULL,'2017-11-25 20:56:14',NULL),(7,16,13,46.00,NULL,NULL,NULL,'2017-12-11 18:42:35',NULL),(8,17,12,25.00,NULL,NULL,NULL,'2017-12-11 21:10:41',NULL),(9,14,11,17.00,NULL,NULL,NULL,'2017-12-13 17:57:13',NULL),(10,18,2,23.00,NULL,NULL,NULL,'2017-12-17 19:34:02',NULL),(11,21,15,16.00,NULL,NULL,NULL,'2017-12-29 10:23:01',NULL),(12,22,2,11.00,NULL,NULL,NULL,'2017-12-30 19:01:40',NULL),(13,23,11,31.50,NULL,NULL,NULL,'2018-01-08 18:22:10',NULL),(14,23,10,31.50,NULL,NULL,NULL,'2018-01-08 18:22:10',NULL),(15,24,16,19.00,NULL,NULL,NULL,'2018-01-10 08:03:20',NULL),(16,31,9,20.00,NULL,NULL,NULL,'2018-01-26 12:39:07',NULL),(17,32,2,25.00,NULL,NULL,NULL,'2018-01-28 15:11:12',NULL),(18,28,16,26.00,NULL,NULL,NULL,'2018-01-29 09:03:27',NULL),(19,36,13,35.00,NULL,NULL,NULL,'2018-02-18 16:05:16',NULL),(20,35,13,15.00,NULL,NULL,NULL,'2018-02-18 19:42:12',NULL),(21,34,16,17.00,NULL,NULL,NULL,'2018-02-20 10:06:20',NULL),(22,38,2,15.00,NULL,NULL,NULL,'2018-02-21 22:22:29',NULL),(23,37,14,22.00,NULL,NULL,NULL,'2018-02-22 18:15:19',NULL),(24,27,9,11.00,NULL,NULL,NULL,'2018-02-25 15:01:20',NULL),(25,51,15,34.00,NULL,NULL,NULL,'2019-01-09 15:25:38',NULL),(26,54,13,29.00,NULL,NULL,NULL,'2019-01-15 21:10:41',NULL),(27,48,12,46.00,NULL,NULL,NULL,'2019-01-20 09:56:06',NULL),(28,45,2,33.00,NULL,NULL,NULL,'2019-01-20 11:13:34',NULL),(29,52,23,30.00,NULL,NULL,NULL,'2019-01-20 11:16:04',NULL),(30,47,12,27.50,NULL,NULL,NULL,'2019-01-21 08:58:06',NULL),(31,47,15,27.50,NULL,NULL,NULL,'2019-01-21 08:58:06',NULL),(32,53,19,28.00,NULL,NULL,NULL,'2019-01-26 19:59:01',NULL),(33,60,19,31.00,NULL,NULL,NULL,'2019-01-26 19:59:50',NULL),(34,60,13,31.00,NULL,NULL,NULL,'2019-01-26 19:59:50',NULL),(35,50,10,44.00,NULL,NULL,NULL,'2019-01-27 09:47:23',NULL),(36,42,11,28.00,NULL,NULL,NULL,'2019-01-27 09:59:26',NULL),(37,65,13,37.00,NULL,NULL,NULL,'2019-01-31 19:18:08',NULL),(38,68,14,22.00,NULL,NULL,NULL,'2019-02-02 09:14:01',NULL),(39,58,14,40.00,NULL,NULL,NULL,'2019-02-02 10:32:05',NULL),(40,62,24,40.00,NULL,NULL,NULL,'2019-02-02 11:51:18',NULL),(41,61,9,31.00,NULL,NULL,NULL,'2019-02-02 14:02:57',NULL),(42,61,2,31.00,NULL,NULL,NULL,'2019-02-02 14:02:57',NULL),(43,67,11,22.00,NULL,NULL,NULL,'2019-02-06 18:04:57',NULL),(44,66,30,27.00,NULL,'Mats Johansson vart tilldelad k&ouml;ttet.',NULL,'2019-02-06 18:07:32',NULL),(45,43,18,10.00,NULL,NULL,NULL,'2019-02-06 18:17:32',NULL),(46,46,18,27.00,NULL,NULL,NULL,'2019-02-06 18:18:31',NULL),(47,59,23,39.00,NULL,NULL,NULL,'2019-02-06 18:23:01',NULL),(48,55,24,12.00,NULL,NULL,NULL,'2019-02-06 18:25:26',NULL),(49,49,9,10.00,NULL,NULL,NULL,'2019-02-06 18:27:28',NULL),(50,70,11,10.00,NULL,NULL,NULL,'2019-02-06 18:30:06',NULL),(51,71,18,31.00,NULL,NULL,NULL,'2019-02-06 18:36:50',NULL),(52,72,11,11.00,NULL,NULL,NULL,'2019-02-06 18:42:44',NULL),(53,73,12,25.00,NULL,NULL,NULL,'2019-02-07 13:20:55',NULL),(54,78,12,31.50,NULL,NULL,NULL,'2019-10-18 15:49:34',NULL),(55,78,13,31.50,NULL,NULL,NULL,'2019-10-18 15:49:34',NULL),(56,80,2,15.00,NULL,NULL,NULL,'2019-10-19 16:37:56',NULL),(57,79,2,26.00,1.00,NULL,NULL,'2019-10-19 16:38:29',NULL),(58,79,10,26.00,1.00,NULL,NULL,'2019-10-19 16:38:29',NULL),(59,85,12,40.00,NULL,NULL,NULL,'2019-11-16 13:56:27',NULL),(60,83,15,38.00,NULL,NULL,NULL,'2019-11-30 08:15:30',NULL),(61,90,30,15.00,NULL,'Niclas k&ouml;pte djuret f&ouml;r 25:- kilot slaktkropp',NULL,'2019-12-01 19:54:42',NULL),(62,86,30,17.00,NULL,'Niclas k&ouml;pte djuret f&ouml;r 25:- kilo slaktkropp',NULL,'2019-12-01 19:55:32',NULL),(63,82,19,34.00,NULL,NULL,NULL,'2019-12-01 19:58:53',NULL),(64,87,24,22.00,NULL,NULL,NULL,'2019-12-09 15:26:54',NULL),(65,88,18,14.00,NULL,NULL,NULL,'2019-12-09 15:27:11',NULL),(66,89,19,16.00,NULL,NULL,NULL,'2019-12-09 15:27:46',NULL),(67,84,23,37.00,NULL,NULL,NULL,'2019-12-14 18:34:50',NULL),(68,91,2,17.00,NULL,NULL,NULL,'2020-01-19 15:36:46',NULL),(69,92,12,15.00,NULL,NULL,NULL,'2020-01-19 15:37:17',NULL),(70,94,23,26.00,NULL,NULL,NULL,'2020-01-20 12:43:11',NULL),(71,95,11,38.00,NULL,NULL,NULL,'2020-02-01 19:52:29',NULL),(72,97,19,17.00,NULL,NULL,NULL,'2020-02-08 23:06:45',NULL),(73,98,30,15.00,NULL,NULL,NULL,'2020-02-15 09:00:36',NULL),(74,96,10,9.00,NULL,NULL,NULL,'2020-02-15 09:02:54',NULL),(75,93,11,16.00,NULL,NULL,NULL,'2020-02-15 09:03:11',NULL),(77,1,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(78,4,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(79,5,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(80,7,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(81,9,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(82,11,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(83,12,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(84,13,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(85,15,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(86,20,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(87,29,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(88,30,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(89,33,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(90,39,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(91,40,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(92,41,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(93,44,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(94,56,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(95,57,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(96,63,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(97,64,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(98,69,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(99,74,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(100,75,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(101,76,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(102,77,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(103,81,NULL,NULL,NULL,NULL,NULL,'2020-10-28 05:53:52','2020-10-28 05:53:52'),(104,99,11,18.00,NULL,NULL,NULL,'2020-10-31 06:37:29','2020-10-31 06:37:29'),(105,100,NULL,NULL,NULL,NULL,NULL,'2020-10-31 09:40:58','2020-10-31 09:40:58'),(106,101,19,0.00,NULL,NULL,NULL,'2020-10-31 12:42:21','2020-10-31 12:42:21');
/*!40000 ALTER TABLE `meats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (50,'2014_10_12_000000_create_users_table',1),(51,'2014_10_12_100000_create_password_resets_table',1),(52,'2019_08_19_000000_create_failed_jobs_table',1),(53,'2019_10_22_044550_create_killreports_table',1),(54,'2019_10_25_115232_create_animals_table',1),(55,'2019_10_27_071805_create_areas_table',1),(56,'2020_02_05_071353_create_meats_table',1),(57,'2020_10_28_112104_create_images_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `active` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postnumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobilenumber` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in` timestamp NULL DEFAULT NULL,
  `logged_in_now` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_since` timestamp NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'yes','admin','webmaster','adminmagnus','Magnus','Andersson','Röjslavägen 3','712 91','0587-61199','073-5281761','Hällefors','2019-11-07 20:43:04',NULL,'','2018-10-02 19:00:00','magnusandersson076@gmail.com',NULL,'$2y$10$G85cjR.H9/EVGw3JQdgGHeUfZoLa6E5ZEGwYM65sjmY2wDneE9tPC','KaRzE6CziZgCqiNlC4J4MZ4AuMYg7k0O5TYUo8q6uv7Z2gtZcyQwlNVJFGc2','2017-10-02 18:01:23','2020-10-31 09:40:44'),(2,'yes','admin','hunter','johan','Johan','Eriksson','','','','','','2020-02-15 19:37:44',NULL,'','2017-10-02 00:00:00','glotterback@telia.com',NULL,'$2y$10$Wzp7x0mYi66Pzq9NvzSAf.IQZd9IK1UvqI5Ob9rYbv47ZWxhELr7e','UzlikzPB55WQQzz0rbvvQ4ENwmyUr8bj0T2Aa7YSchkupeNUh0WPNjbXFynZ','2017-10-02 00:00:00','2020-10-31 09:38:42'),(3,'yes','user','devaccount','testuser','Anders','Andersson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00',NULL,NULL,'$2y$10$kDBDzddM31OtZVzCS2q8aOPFxxgS/y4dzhfaHqi8cHEnZZXg4A72.',NULL,'2017-10-02 18:43:27',NULL),(9,'yes','guest','hunter','göte','Göte','Lundh','','','','','',NULL,NULL,'','2017-10-06 00:00:00','gote@email.com',NULL,'$2y$10$Nk7J.QOjEkTq.mb.w6nGd.kDqgHceSdtSVdxvFIGwqJ1g9FpcVKue',NULL,'2017-10-06 00:00:00','2019-09-28 15:26:21'),(10,'yes','user','hunter','kent','Kent','Sernander','','','','','','2020-01-28 08:46:22',NULL,'','2017-10-06 00:00:00','kent@email.com',NULL,'$2y$10$/YjZc1IyqDGdAbuRM/VWk.uoxdVYJpJGZYf98hoxnw/82n3lisK0W',NULL,'2017-10-06 00:00:00','2019-02-11 14:20:25'),(11,'yes','user','hunter','viktor','Viktor','Sernander','','','','','','2020-02-15 08:55:30',NULL,'','2017-10-06 00:00:00','viktor@email.com',NULL,'$2y$10$IoZCrayjNKSXfAaPMU.K4eV/6rGAxVJabuQNGTgHAET6tRDabNCv2',NULL,'2017-10-06 00:00:00','2019-02-11 14:20:52'),(12,'yes','user','hunter','peter','Peter','Steen','Rastorp Granudden 904','69791','730313198','','Pålsboda','2019-09-15 12:11:50',NULL,'','2017-10-06 00:00:00','petersteen@telia.com',NULL,'$2y$10$MywrDe3ZhXq7IcyUUepIoOquuxwjpWIeIxlmH1WkV0Okno56vn8uO',NULL,'2017-10-06 00:00:00','2019-02-11 14:21:07'),(13,'yes','user','hunter','anders','Anders','Jansson','','','','','','2019-09-15 12:11:10',NULL,'','2017-10-06 00:00:00','anders@email.com',NULL,'$2y$10$3zPNfqyH0acLOMpj8qVsreZtm3R2Hr2IpwvJC82b7y724yaWEYNv.',NULL,'2017-10-06 00:00:00','2019-02-11 14:21:28'),(14,'yes','user','hunter','mattias','Mattias','Törnqvist','','','','','',NULL,NULL,'','2017-10-06 00:00:00','mattias@email.com',NULL,'$2y$10$BJHakglEYV9SPoUmMNFir.vraRSaRnRJJ2CMW3XkP7/kLZ/9Asity',NULL,'2017-10-06 00:00:00','2019-02-11 14:21:48'),(15,'yes','user','hunter','kim','Kim','Mathsson','','','','','','2017-10-24 18:48:02',NULL,'','2017-10-06 00:00:00','kim@email.com',NULL,'$2y$10$FXpgPK.St1WwIuafXQcEluNUAvC4Dwvfns.n6TWr5XwowkC/TZroe',NULL,'2017-10-06 00:00:00','2019-02-11 14:23:06'),(16,'no','guest','hunter','klas','Klas','Tornholz','','','','','',NULL,NULL,'','2018-10-02 19:00:00','xxxx@xxx.xx',NULL,'$2y$10$CKtrflYNQf1JkPP./fbBBuf720w1yTQPFZQS93oiJ9zmdWPTb0zv6',NULL,'2017-10-06 11:46:51','2018-04-10 09:30:20'),(17,'no','guest','hunter','Conny','Conny','Rudolfsson','','','','','',NULL,NULL,'','2018-10-02 19:00:00','Conny.Rudolfsson@telia.com',NULL,'$2y$10$IXcmJs3ZdkMRZfB1LKWGE.jI0bKxHfodCBeoQ.cGFWfLTz4gyoJ52',NULL,'2017-10-12 19:32:41','2017-10-12 20:15:49'),(18,'yes','user','hunter','Kevin ','Kevin','Jirvelius','','','','','',NULL,NULL,'','2018-07-01 00:00:00','kevin@email.com',NULL,'$2y$10$BjAkbg2fAPVsG7G2Absl0.w0Sh7.Pp2B5zxmPab9C7/AIFPRdX7TS',NULL,'2017-10-21 00:00:00','2019-02-11 14:24:20'),(19,'yes','user','hunter','kim2','Kim','Preducic','Ässtugansgård 182','','','0730864050','','2019-08-31 08:52:56',NULL,'personnummer 199207213373','2018-07-01 00:00:00','Kimen_92_@hotmail.com',NULL,'$2y$10$RJoQ/BHFjuxj5aUJfUkdyezvD0fo.J9VAccHL7IgzFQRS5sC94Uve',NULL,'2017-11-25 00:00:00','2019-02-11 14:24:10'),(20,'yes','guest','hunter','Jocke','Joakim','Ahlen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','Joakimahlen@live.se',NULL,'$2y$10$TdAxd7T6kYzOoZ965IXilemWxviWtGHjn1cGMC1n/maviLjA6q0ZK',NULL,'2017-12-02 08:19:37',NULL),(21,'yes','guest','hunter','erik','Erik','K&aring;gstr&ouml;m','','','','','',NULL,NULL,'','2017-12-27 00:00:00','erik_kagstrom@hotmail.com',NULL,'$2y$10$NxrfLyA6Jvx7EXjGMyT3N.Acay1ACzt5jxF3oaVfNWqwd9Ujc3x9q',NULL,'2017-12-27 00:00:00','2019-02-11 14:25:01'),(22,'yes','guest','hunter','ove','Ove','Karlsson','','','','','','2018-02-19 21:08:53',NULL,'','2018-02-18 00:00:00','ovekarlsson97@yahoo.se',NULL,'$2y$10$CnwOJSCG.uGE7e1FGKFdduqC/tTLivtUv1830pRwCUy0.MhCLQ696',NULL,'2018-02-18 00:00:00','2019-02-11 14:25:27'),(23,'yes','user','hunter','bo','Bo','Lindsmyr','','','','','','2019-02-17 12:25:45',NULL,'','2018-07-01 00:00:00','bosselindsmyr@gmail.com',NULL,'$2y$10$KqhW2ExibJ54gUMP0gLgYuWToKGu2Pzi8WaKGnxYSlsHMAyZ.xx4y',NULL,'2018-04-15 00:00:00','2019-02-11 14:25:57'),(24,'yes','user','hunter','markus','Markus','Josefsson','','','','','','2019-02-28 13:01:30',NULL,'','2018-07-01 00:00:00','impala_1963_@hotmail.com',NULL,'$2y$10$mLZ0Gz/RhWzA0ELKIMuEAOnTnBsAL4bztN60ZaTDi3XtMjKJeQtx.',NULL,'2018-04-19 00:00:00','2019-02-11 14:26:22'),(25,'yes','guest','hunter','alexandra','Alexandra','Hellström',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','alexandrahellstrom@live.se',NULL,'$2y$10$EnfprVaUxU0t1End5lyjQ.fwE21MAHTbnyXiGm0cjTY/kIlf0h6Ha',NULL,'2019-11-09 16:51:17',NULL),(26,'yes','guest','hunter','niclas','Niclas','Roslund',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','huggarkungen@hotmail.com',NULL,'$2y$10$G.MKNNQ4o1veSuMhaIvPfeBJ09fhoCVKCzzA8N7/Rhs4uPdB3Z0ga',NULL,'2019-11-30 08:51:26',NULL),(27,'yes','guest','hunter','robin','Robin','Berghdal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','robin.bergdahl@hotmail.com',NULL,'$2y$10$6CtGIqDGbAESEFq2mOdEuOzFjx8yTI724.g0Oeact4EYnzuHgqaRq',NULL,'2020-01-20 12:38:24',NULL),(28,'yes','guest','hunter','adam','Adam','Preducic',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','A.preducic@hotmail.com',NULL,'$2y$10$.VM9JXvV9MprEdmkIFvrieFS0UIc6T3rZj2R6xMWVV60.FYbkdy9m',NULL,'2020-02-08 23:04:14',NULL),(29,'yes','guest','devaccount','defaultno','defaultnofirstname','defaultnosurname',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00',NULL,NULL,'$2y$10$aq58i30YFuMk1Okbmyj/Ee6yv1ViSCpANr8c/hlhfSINadB2OvNoe',NULL,'2017-10-06 08:38:31',NULL),(30,'yes','hunter','anonhunter','anonhunter','-','-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anonhunter',NULL,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-31 13:07:01
