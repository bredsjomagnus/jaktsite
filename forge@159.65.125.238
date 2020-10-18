-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: jaktsite
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `animals` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `shooter_id` bigint(20) unsigned NOT NULL,
  `species` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `speciestype` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `engspecies` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sex` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `age` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_weight` double(8,2) DEFAULT NULL,
  `aprox_live_weight` double(8,2) DEFAULT NULL,
  `passad_weight` double(8,2) DEFAULT NULL,
  `aprox_passad_weight` double(8,2) DEFAULT NULL,
  `carcass_weight` double(8,2) DEFAULT NULL,
  `aprox_carcass_weight` double(8,2) DEFAULT NULL,
  `cut_weight` double(8,2) DEFAULT NULL,
  `heart_weight` double(8,2) DEFAULT NULL,
  `waste` double(8,2) DEFAULT NULL,
  `waste_notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `antlers` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animals`
--

LOCK TABLES `animals` WRITE;
/*!40000 ALTER TABLE `animals` DISABLE KEYS */;
INSERT INTO `animals` VALUES (1,1,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,33.00,33.00,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2017-10-20 21:34:19',NULL),(2,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,32.00,32.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-10-22 16:32:16',NULL),(3,2,'Älg','Kvigkalv','moose','female','calf',NULL,NULL,NULL,NULL,47.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-10-24 18:07:12',NULL),(4,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:07:32','2017-10-25 17:03:43',NULL),(5,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,47.00,NULL,NULL,NULL,0.00,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:16:12','2017-10-25 17:08:58',NULL),(6,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,47.00,NULL,NULL,NULL,0.00,NULL,'Stång-Halvskovel',NULL,NULL,'2017-10-25 17:17:04',NULL),(7,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:18:45','2017-10-25 17:18:36',NULL),(8,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,33.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-10-26 16:50:53',NULL),(9,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,25.00,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2017-10-27 17:16:38',NULL),(10,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,27.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2017-11-25 17:25:53',NULL),(11,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-11-26 13:42:48',NULL),(12,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,20.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-11-26 17:00:25',NULL),(13,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,'2017-12-02 18:44:50','2017-12-02 19:42:18',NULL),(14,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,17.00,17.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-02 19:46:13',NULL),(15,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,21.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-03 17:21:41',NULL),(16,2,'Dovvilt','Hjort','fallowdeer','male','adult',83.00,NULL,NULL,NULL,46.00,NULL,NULL,NULL,0.00,NULL,'Helskovel',NULL,NULL,'2017-12-11 18:38:22',NULL),(17,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,25.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-11 21:07:15',NULL),(18,2,'Dovvilt','Hjort','fallowdeer','male','adult',44.00,NULL,NULL,NULL,23.00,NULL,NULL,333.00,0.00,NULL,'Spets',NULL,NULL,'2017-12-17 19:16:47',NULL),(19,2,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-18 07:40:17',NULL),(20,11,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,16.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-27 17:32:46',NULL),(21,2,'Rådjur','Bock','roedeer','male','adult',NULL,NULL,15.00,NULL,11.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2017-12-29 10:21:40',NULL),(22,11,'Kronvilt','Smalhind','reddeer','female','adult',107.00,NULL,NULL,NULL,63.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-03 20:08:42',NULL),(23,13,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,19.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-08 16:41:59',NULL),(24,2,'Rådjur','Smaldjur','roedeer','female','adult',NULL,NULL,NULL,NULL,NULL,11.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-16 11:28:55',NULL),(25,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,26.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-17 17:25:06',NULL),(26,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,12.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-17 17:47:59',NULL),(27,12,'Rådjur','Smaldjur','roedeer','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,'2018-01-23 05:44:33','2018-01-20 21:26:32',NULL),(28,11,'Dovvilt','Hjort','fallowdeer','male','adult',42.00,NULL,NULL,NULL,20.00,NULL,NULL,0.43,0.00,NULL,'Spets',NULL,NULL,'2018-01-23 18:12:03',NULL),(29,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,25.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-28 10:14:46',NULL),(30,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-28 15:49:35',NULL),(31,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,17.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-01-28 15:56:00',NULL),(32,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',25.00,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-03 13:53:47',NULL),(33,2,'Vildsvin','Gylta','boar','female','adult',72.00,NULL,56.00,NULL,35.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-16 18:28:31',NULL),(34,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-18 19:53:13',NULL),(35,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',26.00,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-21 22:19:46',NULL),(36,2,'Dovvilt','Hind','fallowdeer','female','adult',35.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-02-24 19:27:01',NULL),(37,10,'Vildsvin','Galt','boar','male','adult',65.00,65.00,NULL,NULL,30.00,30.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-03-20 12:00:12',NULL),(38,2,'Vildsvin','Galt','boar','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-08-09 17:35:52',NULL),(39,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,28.00,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2018-09-17 10:27:49',NULL),(40,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,NULL,10.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-10-20 09:58:38',NULL),(41,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-11-07 08:20:20',NULL),(42,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,33.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-11-18 08:15:55',NULL),(43,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,27.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2018-11-18 11:37:03',NULL),(44,2,'Kronvilt','Hjort','reddeer','male','adult',97.00,NULL,NULL,NULL,55.00,NULL,NULL,NULL,0.00,NULL,'2',2,NULL,'2019-01-02 20:16:21',NULL),(45,2,'Dovvilt','Hjort','fallowdeer','male','adult',75.00,NULL,NULL,NULL,46.00,NULL,NULL,NULL,0.00,NULL,'Halvskovel-Helskovel',NULL,NULL,'2019-01-02 20:18:49',NULL),(46,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-05 08:37:52',NULL),(47,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,44.00,NULL,NULL,NULL,0.00,NULL,'Helskovel',NULL,NULL,'2019-01-07 07:43:35',NULL),(48,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,34.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2019-01-09 15:22:57',NULL),(49,2,'Dovvilt','Hjort','fallowdeer','male','adult',51.00,NULL,NULL,NULL,30.00,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2019-01-13 16:34:58',NULL),(50,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,28.00,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2019-01-13 16:38:40',NULL),(51,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,29.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-13 16:41:44',NULL),(52,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,12.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-13 17:19:15',NULL),(53,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,'2019-01-13 18:25:33','2019-01-13 17:25:13',NULL),(54,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',26.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-19 09:55:31',NULL),(55,2,'Kronvilt','Hindkalv','reddeer','female','calf',NULL,NULL,NULL,NULL,40.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 08:42:12',NULL),(56,11,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,39.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 18:48:50',NULL),(57,2,'Kronvilt','Smalhind','reddeer','female','adult',NULL,NULL,NULL,NULL,62.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 19:55:40',NULL),(58,2,'Kronvilt','Smalhind','reddeer','female','adult',NULL,NULL,77.00,NULL,62.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 20:02:26',NULL),(59,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,55.00,NULL,40.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-26 20:04:46',NULL),(60,2,'Rådjur','Bock','roedeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-27 10:20:16',NULL),(61,2,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-29 15:11:25',NULL),(62,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,37.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2019-01-30 11:49:51',NULL),(63,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,27.00,27.00,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2019-01-30 11:51:36',NULL),(64,11,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-30 11:53:21',NULL),(65,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-01-30 11:55:02',NULL),(66,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',22.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-04 17:43:09',NULL),(67,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-06 18:26:16',NULL),(68,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,31.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-06 18:34:59',NULL),(69,2,'Dovvilt','Obestämd kalv','fallowdeer','unknown','calf',23.00,NULL,NULL,NULL,NULL,11.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-06 18:40:53',NULL),(70,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,25.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-07 13:20:18',NULL),(71,11,'Vildsvin','Galtkulting','boar','male','calf',NULL,NULL,NULL,NULL,20.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-02-14 12:48:13',NULL),(72,11,'Vildsvin','Gylta','boar','female','adult',46.00,NULL,NULL,NULL,24.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-03-16 12:45:20',NULL),(73,2,'Vildsvin','Galt','boar','male','adult',55.00,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-05-28 22:02:42',NULL),(74,11,'Vildsvin','Gylta','boar','female','adult',NULL,32.00,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-05 20:52:24',NULL),(75,2,'Kronvilt','Hind','reddeer','female','adult',NULL,NULL,NULL,NULL,63.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-18 15:48:38',NULL),(76,2,'Älg','Tjurkalv','moose','male','calf',NULL,NULL,NULL,NULL,52.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-19 16:34:58',NULL),(77,2,'Vildsvin','Suggkulting','boar','female','calf',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-19 16:35:47',NULL),(78,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2019-10-19 16:36:37',NULL),(79,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,34.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-10-23 17:46:27',NULL),(80,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,38.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-09 16:52:33',NULL),(81,2,'Vildsvin','Gylta','boar','female','adult',66.00,NULL,NULL,NULL,37.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-09 18:04:41',NULL),(82,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,40.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2019-11-16 11:45:00',NULL),(83,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,17.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-30 08:52:39',NULL),(84,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-30 10:21:25',NULL),(85,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,14.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-30 10:22:13',NULL),(86,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,16.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-11-30 10:23:07',NULL),(87,2,'Dovvilt','Obestämd kalv','fallowdeer','unknown','calf',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2019-12-01 19:52:12',NULL),(88,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,17.00,NULL,17.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-01-19 11:42:05',NULL),(89,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,15.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-01-19 15:30:33',NULL),(90,11,'Vildsvin','Galt','boar','male','adult',NULL,NULL,NULL,NULL,16.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-01-20 08:58:03',NULL),(91,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,26.00,NULL,NULL,NULL,0.00,NULL,'Spets',NULL,NULL,'2020-01-20 12:39:56',NULL),(92,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,38.00,NULL,NULL,NULL,0.00,NULL,'Stång',NULL,NULL,'2020-01-26 12:50:41',NULL),(93,11,'Rådjur','Bockkilling','roedeer','male','calf',NULL,NULL,NULL,NULL,9.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-02-04 16:49:05',NULL),(94,2,'Vildsvin','Obestämd kulting','boar','unknown','calf',NULL,NULL,NULL,NULL,17.00,NULL,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-02-08 23:06:05',NULL),(95,11,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,15.00,15.00,NULL,NULL,0.00,NULL,NULL,NULL,NULL,'2020-02-15 08:58:43',NULL);
/*!40000 ALTER TABLE `animals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas`
--

DROP TABLE IF EXISTS `areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `area_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Table structure for table `killreports`
--

DROP TABLE IF EXISTS `killreports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `killreports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reporter_id` bigint(20) unsigned NOT NULL,
  `shooter_id` bigint(20) unsigned NOT NULL,
  `kindofhunt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `animal_id` bigint(20) unsigned NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `killdate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `season` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_id` bigint(20) unsigned NOT NULL,
  `place` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitud` double(8,2) DEFAULT NULL,
  `latitud` double(8,2) DEFAULT NULL,
  `report_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locked` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `killreports`
--

LOCK TABLES `killreports` WRITE;
/*!40000 ALTER TABLE `killreports` DISABLE KEYS */;
INSERT INTO `killreports` VALUES (1,11,11,'Ensamjakt',1,'hunterviktor-1.jpg','2017-10-20 00:00:00','17/18',2,'Stora gärdet ',15.38,58.92,'green','yes',NULL,'2017-10-20 21:34:19',NULL),(2,11,18,'Ensamjakt',2,'hunterviktor-2.jpg','2017-10-21 00:00:00','17/18',1,'Tornet. Jannesberg ',NULL,NULL,'green','yes',NULL,'2017-10-22 16:32:17',NULL),(3,2,11,'Ensamjakt',3,'hunterjohan-3.JPG','2017-10-09 00:00:00','17/18',1,'Innan nedre vändplan på grusgropsvägen ',15.39,58.91,'green','yes',NULL,'2017-10-24 18:07:12',NULL),(4,12,12,'Ensamjakt',4,'hunterpeter-4.JPG','2017-10-09 00:00:00','17/18',1,'Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:07:32','2017-10-25 17:03:43',NULL),(5,12,12,'Ensamjakt',5,'hunterpeter-5.JPG','2017-10-09 00:00:00','17/18',1,'Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:16:12','2017-10-25 17:08:58',NULL),(6,12,12,'Ensamjakt',6,'hunterjohan-6.jpg','2017-10-09 00:00:00','17/18',1,'Tornet vid jannesberg. ',15.38,58.91,'green','yes',NULL,'2017-10-25 17:17:04',NULL),(7,12,12,'Ensamjakt',7,'default.png','2017-10-09 00:00:00','17/18',1,'Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:18:45','2017-10-25 17:18:36',NULL),(8,2,11,'Ensamjakt',8,'hunterjohan-8.jpg','2017-10-11 00:00:00','17/18',1,'Hygget mellan kojan och stenmurshålet ',15.36,58.91,'green','yes',NULL,'2017-10-26 16:50:53',NULL),(9,11,11,'Ensamjakt',9,'hunterviktor-9.jpg','2017-09-23 00:00:00','17/18',2,'Stora gärdet ',15.42,58.90,'green','yes',NULL,'2017-10-27 17:16:38',NULL),(10,2,19,'Gemensam jakt',10,'hunterjohan-10.JPG','2017-11-24 23:00:00','17/18',1,'Tornet Jannesberg',15.38,58.91,'green','yes',NULL,'2017-11-25 17:25:53',NULL),(11,2,2,'Ensamjakt',11,'hunterjohan-11.jpg','2017-11-25 23:00:00','17/18',2,'Bak vedboden',15.42,58.90,'green','yes',NULL,'2017-11-26 13:42:48',NULL),(12,2,11,'Ensamjakt',12,'hunterjohan-12.JPG','2017-11-25 23:00:00','17/18',2,'Långåkern nordvästra',15.38,58.92,'green','yes',NULL,'2017-11-26 17:00:25',NULL),(13,11,20,'Ensamjakt',13,'hunterviktor-13.jpg','2017-12-01 23:00:00','17/18',1,'Stenmursh&aring;let ',NULL,NULL,'yellow','no','2017-12-02 18:44:50','2017-12-02 19:42:18',NULL),(14,11,20,'Ensamjakt',14,'hunterviktor-14.jpg','2017-12-01 23:00:00','17/18',1,'Stenmurshålet',NULL,NULL,'green','yes',NULL,'2017-12-02 19:46:13',NULL),(15,2,2,'Ensamjakt',15,'hunterjohan-15.jpg','2017-12-02 23:00:00','17/18',2,'Götes kulle',15.38,58.92,'green','yes',NULL,'2017-12-03 17:21:41',NULL),(16,2,11,'Ensamjakt',16,'hunterjohan-16.JPG','2017-12-09 23:00:00','17/18',1,'Grusgropen',NULL,NULL,'yellow','yes',NULL,'2017-12-11 18:38:22',NULL),(17,2,12,'Gemensam jakt',17,'hunterjohan-17.jpg','2017-10-01 00:00:00','17/18',1,'Vändplan mossen',NULL,NULL,'green','yes',NULL,'2017-12-11 21:07:15',NULL),(18,2,2,'Ensamjakt',18,'hunterjohan-18.JPG','2017-12-16 23:00:00','17/18',1,'Bunten snickis ',NULL,NULL,'green','yes',NULL,'2017-12-17 19:16:47',NULL),(20,2,2,'Ensamjakt',19,'hunterjohan-20.JPG','2017-12-16 23:00:00','17/18',2,'Gärdet öster glotterbäck ',15.39,58.91,'yellow','no',NULL,'2017-12-18 07:40:17',NULL),(21,11,21,'Ensamjakt',20,'hunterviktor-21.jpg','2017-12-26 23:00:00','17/18',1,'Hygget söder om kojan.',NULL,NULL,'green','yes',NULL,'2017-12-27 17:32:46',NULL),(22,2,2,'Gemensam jakt',21,'hunterjohan-22.jpg','2017-12-28 23:00:00','17/18',1,'Tornet stenmurshålet ',15.36,58.91,'green','yes',NULL,'2017-12-29 10:21:40',NULL),(23,11,11,'Ensamjakt',22,'hunterviktor-23.jpg','2018-01-02 23:00:00','17/18',1,'Nedre vändplan',NULL,NULL,'green','yes',NULL,'2018-01-03 20:08:42',NULL),(24,13,11,'Ensamjakt',23,'hunterviktor-24.jpg','2018-01-07 23:00:00','17/18',1,'Kroken',NULL,NULL,'green','yes',NULL,'2018-01-08 16:41:59',NULL),(27,2,12,'Gemensam jakt',24,'hunterjohan-27.JPG','2018-01-12 23:00:00','17/18',1,'Tornet innan rönnen',15.37,58.90,'green','yes',NULL,'2018-01-16 11:28:55',NULL),(28,2,16,'Ensamjakt',25,'hunterviktor-28.jpg','2018-01-16 23:00:00','17/18',1,'Nedre vändplan',NULL,NULL,'green','yes',NULL,'2018-01-17 17:25:06',NULL),(29,2,11,'Ensamjakt',26,'hunterviktor-29.jpg','2018-01-16 23:00:00','17/18',2,'Johans torn stora gärdet',NULL,NULL,'green','yes',NULL,'2018-01-17 17:47:59',NULL),(30,12,12,'Gemensam jakt',27,'default.png','2018-01-13 23:00:00','17/18',1,'Tornet innan rönna ',NULL,NULL,'yellow','no','2018-01-23 05:44:33','2018-01-20 21:26:32',NULL),(31,11,11,'Ensamjakt',28,'hunterviktor-31.jpg','2018-01-22 23:00:00','17/18',1,'Mossen vändplan',NULL,NULL,'green','yes',NULL,'2018-01-23 18:12:03',NULL),(32,2,12,'Gemensam jakt',29,'hunterjohan-32.JPG','2018-01-27 23:00:00','17/18',1,'Götes kulle',15.39,58.91,'green','yes',NULL,'2018-01-28 10:14:46',NULL),(33,2,12,'Gemensam jakt',30,'hunterjohan-33.JPG','2018-01-27 23:00:00','17/18',1,'Götes kulle',15.39,58.91,'yellow','no',NULL,'2018-01-28 15:49:35',NULL),(34,2,16,'Gemensam jakt',31,'hunterjohan-34.jpg','2018-01-27 23:00:00','17/18',1,'Norr om akvägen inför rönnen en bit',15.37,58.90,'green','yes',NULL,'2018-01-28 15:56:00',NULL),(35,2,11,'Gemensam jakt',32,'hunterjohan-35.JPG','2018-02-02 23:00:00','17/18',1,'Gustaf-Adolfstorg',15.34,58.91,'green','yes',NULL,'2018-02-03 13:53:47',NULL),(36,2,13,'Ensamjakt',33,'hunterjohan-36.JPG','2018-02-14 23:00:00','17/18',1,'Åteln nedre vändplan',15.39,58.91,'green','yes',NULL,'2018-02-16 18:28:31',NULL),(37,2,22,'Gemensam jakt',34,'hunterjohan-37.jpeg','2018-02-16 23:00:00','17/18',1,'Stenarna bortanför grusgropen ',NULL,NULL,'green','yes',NULL,'2018-02-18 19:53:13',NULL),(38,2,2,'Ensamjakt',35,'hunterjohan-38.JPG','2018-02-20 23:00:00','17/18',1,'Snickis',15.40,58.91,'green','yes',NULL,'2018-02-21 22:19:46',NULL),(39,2,2,'Ensamjakt',36,'hunterjohan-39.jpg','2018-02-23 23:00:00','17/18',2,'Johans torn',15.38,58.92,'yellow','no',NULL,'2018-02-24 19:27:01',NULL),(40,10,10,'Ensamjakt',37,'hunterviktor-40.jpg','2018-03-15 23:00:00','17/18',5,'Ralatorpet',NULL,NULL,'green','no',NULL,'2018-03-20 12:00:12',NULL),(41,2,2,'Ensamjakt',38,'hunterjohan-41.JPG','2018-08-07 00:00:00','18/19',2,'Östra gärdet ',15.39,58.91,'yellow','no',NULL,'2018-08-09 17:35:52',NULL),(42,2,11,'Ensamjakt',39,'hunterjohan-42.jpg','2018-09-16 02:00:00','18/19',1,'Mellan kroken och grusgropen',NULL,NULL,'green','no',NULL,'2018-09-17 10:27:49',NULL),(43,2,18,'Gemensam jakt',40,'hunterjohan-43.JPG','2018-10-20 02:00:00','18/19',1,'Tornet innan rönnen ',NULL,NULL,'green','yes',NULL,'2018-10-20 09:58:38',NULL),(44,2,2,'Ensamjakt',41,'hunterjohan-44.jpeg','2018-11-03 01:00:00','18/19',2,'Stora gärdet',15.38,58.92,'yellow','no',NULL,'2018-11-07 08:20:20',NULL),(45,2,2,'Gemensam jakt',42,'hunterjohan-45.JPG','2018-11-17 01:00:00','18/19',1,'Mittentornet mellan kojan och rönnen',15.36,58.90,'green','yes',NULL,'2018-11-18 08:15:55',NULL),(46,2,18,'Gemensam jakt',43,'hunterjohan-46.jpeg','2018-11-17 01:00:00','18/19',1,'Mossevändplan',NULL,NULL,'green','yes',NULL,'2018-11-18 11:37:03',NULL),(47,2,11,'Ensamjakt',44,'hunterjohan-47.JPG','2019-01-02 01:00:00','18/19',1,'Grusgropsvägen',NULL,NULL,'green','yes',NULL,'2019-01-02 20:16:21',NULL),(48,2,12,'Ensamjakt',45,'hunterjohan-48.JPG','2019-01-01 01:00:00','18/19',1,'Nedre vändplan grusgropsvägen',15.39,58.91,'green','yes',NULL,'2019-01-02 20:18:49',NULL),(49,2,15,'Gemensam jakt',46,'hunterjohan-49.JPG','2019-01-05 01:00:00','18/19',1,'Berget snickarbohagen',15.40,58.91,'green','yes',NULL,'2019-01-05 08:37:52',NULL),(50,2,18,'Gemensam jakt',47,'hunterjohan-50.JPG','2019-01-05 01:00:00','18/19',1,'Mittentornet efter kojan',NULL,NULL,'green','yes',NULL,'2019-01-07 07:43:35',NULL),(51,2,12,'Gemensam jakt',48,'hunterjohan-51.JPG','2018-12-29 01:00:00','18/19',1,'Mittentornet efter kojan',NULL,NULL,'green','yes',NULL,'2019-01-09 15:22:57',NULL),(52,2,11,'Ensamjakt',49,'hunterjohan-52.JPG','2019-01-13 01:00:00','18/19',1,'Götes torn mossen',15.35,58.91,'green','yes',NULL,'2019-01-13 16:34:58',NULL),(53,2,19,'Gemensam jakt',50,'hunterjohan-53.JPG','2019-01-12 01:00:00','18/19',1,'Stolpen slaggis',15.35,58.91,'green','yes',NULL,'2019-01-13 16:38:40',NULL),(54,2,19,'Gemensam jakt',51,'hunterjohan-54.jpeg','2019-01-12 01:00:00','18/19',1,'Passet inför vändplan ak-vägen',15.38,58.90,'green','yes',NULL,'2019-01-13 16:41:44',NULL),(55,2,19,'Gemensam jakt',52,'hunterjohan-55.jpeg','2019-01-05 01:00:00','18/19',1,'Ledningen snickarbo',15.40,58.91,'green','yes',NULL,'2019-01-13 17:19:15',NULL),(56,2,19,'Gemensam jakt',53,'default.png','2019-01-05 01:00:00','18/19',1,'Ledningen snickis',NULL,NULL,'yellow','no','2019-01-13 18:25:32','2019-01-13 17:25:13',NULL),(57,2,2,'Ensamjakt',54,'hunterjohan-57.JPG','2019-01-18 01:00:00','18/19',2,'Stora gärdet ',NULL,NULL,'yellow','no',NULL,'2019-01-19 09:55:31',NULL),(58,2,11,'Gemensam jakt',55,'hunterjohan-58.JPG','2019-01-26 01:00:00','18/19',1,'Mitten passet mossen ak-v&auml;gen',NULL,NULL,'green','yes',NULL,'2019-01-26 08:42:12',NULL),(59,2,11,'Ensamjakt',56,'hunterviktor-59.jpg','2018-12-21 01:00:00','18/19',1,'Nedre vändplan',NULL,NULL,'green','yes',NULL,'2019-01-26 18:48:50',NULL),(60,2,19,'Ensamjakt',57,'hunterjohan-60.jpeg','2019-01-10 01:00:00','18/19',1,'Nedre vändplan',NULL,NULL,'green','yes',NULL,'2019-01-26 19:55:40',NULL),(61,2,24,'Gemensam jakt',58,'hunterjohan-61.JPG','2019-01-26 01:00:00','18/19',1,'Gröna tornet bortför ak',NULL,NULL,'green','yes',NULL,'2019-01-26 20:02:26',NULL),(62,2,24,'Gemensam jakt',59,'hunterjohan-62.JPG','2019-01-26 01:00:00','18/19',1,'Gröna tornet bortför ak',NULL,NULL,'green','yes',NULL,'2019-01-26 20:04:46',NULL),(63,2,2,'Ensamjakt',60,'hunterjohan-63.jpg','2018-08-18 02:00:00','18/19',5,'',NULL,NULL,'yellow','no',NULL,'2019-01-27 10:20:16',NULL),(64,2,2,'Ensamjakt',61,'hunterjohan-64.jpeg','2018-05-04 02:00:00','17/18',2,'Stora gärdet',NULL,NULL,'green','no',NULL,'2019-01-29 15:11:25',NULL),(65,2,23,'Gemensam jakt',62,'hunterjohan-65.JPG','2019-01-30 01:00:00','18/19',1,'Mossen',NULL,NULL,'green','yes',NULL,'2019-01-30 11:49:52',NULL),(66,11,19,'Gemensam jakt',63,'hunterjohan-66.JPG','2019-01-30 01:00:00','18/19',1,'Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan (Mats Johansson vart tilldelad k&ouml;ttet.)\r\n',NULL,NULL,'green','yes',NULL,'2019-01-30 11:51:36',NULL),(67,2,19,'Gemensam jakt',64,'hunterjohan-67.JPG','2019-01-30 01:00:00','18/19',1,'Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan ',NULL,NULL,'green','yes',NULL,'2019-01-30 11:53:21',NULL),(68,2,11,'Gemensam jakt',65,'hunterjohan-68.JPG','2019-01-26 01:00:00','18/19',1,'Mellan första och andra i mossen ak-vägen',NULL,NULL,'green','yes',NULL,'2019-01-30 11:55:02',NULL),(69,2,11,'Ensamjakt',66,'hunterjohan-69.JPG','2019-02-04 01:00:00','18/19',2,'Johans torn stora gärdet ',NULL,NULL,'yellow','no',NULL,'2019-02-04 17:43:09',NULL),(70,2,19,'Gemensam jakt',67,'hunterviktor-70.jpg','2019-01-05 01:00:00','18/19',1,'Andra passet bak ångsågen',NULL,NULL,'green','yes',NULL,'2019-02-06 18:26:16',NULL),(71,2,18,'Ensamjakt',68,'default.png','2018-09-01 02:00:00','18/19',1,'Tornet jannesberg',NULL,NULL,'green','yes',NULL,'2019-02-06 18:34:59',NULL),(72,2,11,'Ensamjakt',69,'hunterjohan-72.JPG','2018-10-10 02:00:00','18/19',1,'Hygget mellan stenmurshålet och kojan',NULL,NULL,'green','no',NULL,'2019-02-06 18:40:53',NULL),(73,2,12,'Gemensam jakt',70,'hunterjohan-73.jpg','2018-11-17 01:00:00','18/19',1,'Mittenpasset mossen ak-vägen',15.37,58.90,'green','yes',NULL,'2019-02-07 13:20:18',NULL),(74,11,11,'Ensamjakt',71,'hunterviktor-74.jpg','2019-02-06 01:00:00','18/19',1,'Årsgris skjuten foderplats/åteln nedrevändplan\r\n',NULL,NULL,'yellow','no',NULL,'2019-02-14 12:48:13',NULL),(75,11,11,'Ensamjakt',72,'hunterviktor-75.jpg','2019-03-05 01:00:00','18/19',1,'Grusgropen ',NULL,NULL,'yellow','no',NULL,'2019-03-16 12:45:20',NULL),(76,2,11,'Ensamjakt',73,'hunterjohan-76.jpeg','2019-05-28 02:00:00','18/19',2,'Kents torn stora gärdet',NULL,NULL,'yellow','no',NULL,'2019-05-28 22:02:42',NULL),(77,11,15,'Ensamjakt',74,'default.png','2019-04-28 02:00:00','18/19',1,'vildsvin gylta',NULL,NULL,'yellow','no',NULL,'2019-10-05 20:52:24',NULL),(78,2,12,'Gemensam jakt',75,'hunterjohan-78.JPG','2019-10-12 02:00:00','19/20',1,'Mossen akvägen mellan första och andra passet',NULL,NULL,'green','no',NULL,'2019-10-18 15:48:38',NULL),(79,2,11,'Gemensam jakt',76,'default.png','2019-10-19 02:00:00','19/20',1,'Mellan första och andra passet en bit ut i mossen akvägen ',NULL,NULL,'green','yes',NULL,'2019-10-19 16:34:58',NULL),(80,2,2,'Gemensam jakt',77,'default.png','2019-10-19 02:00:00','19/20',1,'Stubbarna grusgropsvägen ',NULL,NULL,'green','yes',NULL,'2019-10-19 16:35:47',NULL),(81,2,2,'Ensamjakt',78,'default.png','2019-10-18 02:00:00','19/20',2,'Johans torn stora gärdet ',NULL,NULL,'yellow','no',NULL,'2019-10-19 16:36:37',NULL),(82,2,19,'Ensamjakt',79,'hunterjohan-82.jpg','2019-10-23 02:00:00','19/20',1,'Hygget vid harberget',NULL,NULL,'green','yes',NULL,'2019-10-23 17:46:27',NULL),(83,2,25,'Ensamjakt',80,'hunter-83.jpg','2019-11-09 01:00:00','19/20',1,'Hygget vid harberget',NULL,NULL,'green','yes',NULL,'2019-11-09 16:52:33',NULL),(84,2,12,'Gemensam jakt',81,'hunterjohan-84.JPG','2019-11-03 01:00:00','19/20',1,'Hygget nedom tornet jannesberg',NULL,NULL,'green','yes',NULL,'2019-11-09 18:04:41',NULL),(85,2,12,'Gemensam jakt',82,'hunterjohan-85.JPG','2019-11-16 01:00:00','19/20',1,'Andra tornet efter kojan',NULL,NULL,'green','yes',NULL,'2019-11-16 11:45:00',NULL),(86,2,26,'Gemensam jakt',83,'default.png','2019-11-30 01:00:00','19/20',1,'Snickarbo',NULL,NULL,'green','yes',NULL,'2019-11-30 08:52:39',NULL),(87,2,11,'Gemensam jakt',84,'hunterjohan-87.JPG','2019-11-30 01:00:00','19/20',1,'Sten snickarbohagen',NULL,NULL,'green','yes',NULL,'2019-11-30 10:21:25',NULL),(88,2,11,'Gemensam jakt',85,'hunterjohan-88.JPG','2019-11-30 01:00:00','19/20',1,'Sten snickarbohagen ',NULL,NULL,'green','yes',NULL,'2019-11-30 10:22:13',NULL),(89,2,19,'Gemensam jakt',86,'hunterjohan-89.JPG','2019-11-30 01:00:00','19/20',1,'Bj&ouml;rken snickarbohagen ',NULL,NULL,'green','yes',NULL,'2019-11-30 10:23:07',NULL),(90,2,26,'Gemensam jakt',87,'default.png','2019-11-30 01:00:00','19/20',1,'Mellan kojan och mossevägen',NULL,NULL,'green','yes',NULL,'2019-12-01 19:52:12',NULL),(91,2,2,'Gemensam jakt',88,'hunterjohan-91.JPG','2020-01-19 01:00:00','19/20',1,'Kullen vid Anders mårdfälla stenmurshålet',NULL,NULL,'green','yes',NULL,'2020-01-19 11:42:05',NULL),(92,2,12,'Gemensam jakt',89,'hunterjohan-92.jpg','2020-01-19 01:00:00','19/20',1,'Brandgatan',NULL,NULL,'green','yes',NULL,'2020-01-19 15:30:33',NULL),(93,11,11,'Ensamjakt',90,'default.png','2019-12-31 01:00:00','19/20',1,'Nedre vändplan\r\n',NULL,NULL,'green','yes',NULL,'2020-01-20 08:58:03',NULL),(94,2,27,'Gemensam jakt',91,'hunterjohan-94.JPG','2019-12-14 01:00:00','19/20',1,'Tornet stenmurshålet',NULL,NULL,'green','yes',NULL,'2020-01-20 12:39:56',NULL),(95,2,11,'Gemensam jakt',92,'hunterviktor-95.JPG','2020-01-26 01:00:00','19/20',1,'I början av mossevägen',NULL,NULL,'green','yes',NULL,'2020-01-26 12:50:41',NULL),(96,11,10,'Gemensam jakt',93,'hunterjohan-96.JPG','2020-01-31 01:00:00','19/20',1,'Gustav Adolfs väg tornet',NULL,NULL,'green','no',NULL,'2020-02-04 16:49:05',NULL),(97,2,28,'Ensamjakt',94,'hunterjohan-97.jpeg','2020-02-08 01:00:00','19/20',1,'Pentagon ',NULL,NULL,'green','yes',NULL,'2020-02-08 23:06:05',NULL),(98,11,27,'Ensamjakt',95,'hunterviktor-98.JPG','2020-02-13 01:00:00','19/20',1,'Nedre vändplan Viktor och robin satt ihop i pentagon',NULL,NULL,'green','yes',NULL,'2020-02-15 08:58:43',NULL);
/*!40000 ALTER TABLE `killreports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meats`
--

DROP TABLE IF EXISTS `meats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meats` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `killreport_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `share_kilogram` double(8,2) DEFAULT NULL,
  `share_lot` double(8,2) DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meats`
--

LOCK TABLES `meats` WRITE;
/*!40000 ALTER TABLE `meats` DISABLE KEYS */;
INSERT INTO `meats` VALUES (1,3,10,23.50,1.00,NULL,NULL,'2017-10-24 18:08:16',NULL),(2,3,15,23.50,1.00,NULL,NULL,'2017-10-24 18:08:16',NULL),(3,6,12,47.00,NULL,NULL,NULL,'2017-10-25 17:19:25',NULL),(4,2,10,32.00,NULL,NULL,NULL,'2017-10-27 17:14:53',NULL),(5,8,11,33.00,NULL,NULL,NULL,'2017-10-27 17:22:51',NULL),(6,10,14,27.00,NULL,NULL,NULL,'2017-11-25 20:56:14',NULL),(7,16,13,46.00,NULL,NULL,NULL,'2017-12-11 18:42:35',NULL),(8,17,12,25.00,NULL,NULL,NULL,'2017-12-11 21:10:41',NULL),(9,14,11,17.00,NULL,NULL,NULL,'2017-12-13 17:57:13',NULL),(10,18,2,23.00,NULL,NULL,NULL,'2017-12-17 19:34:02',NULL),(11,21,15,16.00,NULL,NULL,NULL,'2017-12-29 10:23:01',NULL),(12,22,2,11.00,NULL,NULL,NULL,'2017-12-30 19:01:40',NULL),(13,23,11,31.50,NULL,NULL,NULL,'2018-01-08 18:22:10',NULL),(14,23,10,31.50,NULL,NULL,NULL,'2018-01-08 18:22:10',NULL),(15,24,16,19.00,NULL,NULL,NULL,'2018-01-10 08:03:20',NULL),(16,31,9,20.00,NULL,NULL,NULL,'2018-01-26 12:39:07',NULL),(17,32,2,25.00,NULL,NULL,NULL,'2018-01-28 15:11:12',NULL),(18,28,16,26.00,NULL,NULL,NULL,'2018-01-29 09:03:27',NULL),(19,36,13,35.00,NULL,NULL,NULL,'2018-02-18 16:05:16',NULL),(20,35,13,15.00,NULL,NULL,NULL,'2018-02-18 19:42:12',NULL),(21,34,16,17.00,NULL,NULL,NULL,'2018-02-20 10:06:20',NULL),(22,38,2,15.00,NULL,NULL,NULL,'2018-02-21 22:22:29',NULL),(23,37,14,22.00,NULL,NULL,NULL,'2018-02-22 18:15:19',NULL),(24,27,9,11.00,NULL,NULL,NULL,'2018-02-25 15:01:20',NULL),(25,51,15,34.00,NULL,NULL,NULL,'2019-01-09 15:25:38',NULL),(26,54,13,29.00,NULL,NULL,NULL,'2019-01-15 21:10:41',NULL),(27,48,12,46.00,NULL,NULL,NULL,'2019-01-20 09:56:06',NULL),(28,45,2,33.00,NULL,NULL,NULL,'2019-01-20 11:13:34',NULL),(29,52,23,30.00,NULL,NULL,NULL,'2019-01-20 11:16:04',NULL),(30,47,12,27.50,NULL,NULL,NULL,'2019-01-21 08:58:06',NULL),(31,47,15,27.50,NULL,NULL,NULL,'2019-01-21 08:58:06',NULL),(32,53,19,28.00,NULL,NULL,NULL,'2019-01-26 19:59:01',NULL),(33,60,19,31.00,NULL,NULL,NULL,'2019-01-26 19:59:50',NULL),(34,60,13,31.00,NULL,NULL,NULL,'2019-01-26 19:59:50',NULL),(35,50,10,44.00,NULL,NULL,NULL,'2019-01-27 09:47:23',NULL),(36,42,11,28.00,NULL,NULL,NULL,'2019-01-27 09:59:26',NULL),(37,65,13,37.00,NULL,NULL,NULL,'2019-01-31 19:18:08',NULL),(38,68,14,22.00,NULL,NULL,NULL,'2019-02-02 09:14:01',NULL),(39,58,14,40.00,NULL,NULL,NULL,'2019-02-02 10:32:05',NULL),(40,62,24,40.00,NULL,NULL,NULL,'2019-02-02 11:51:18',NULL),(41,61,9,31.00,NULL,NULL,NULL,'2019-02-02 14:02:57',NULL),(42,61,2,31.00,NULL,NULL,NULL,'2019-02-02 14:02:57',NULL),(43,67,11,22.00,NULL,NULL,NULL,'2019-02-06 18:04:57',NULL),(44,66,30,27.00,NULL,'Mats Johansson vart tilldelad k&ouml;ttet.',NULL,'2019-02-06 18:07:32',NULL),(45,43,18,10.00,NULL,NULL,NULL,'2019-02-06 18:17:32',NULL),(46,46,18,27.00,NULL,NULL,NULL,'2019-02-06 18:18:31',NULL),(47,59,23,39.00,NULL,NULL,NULL,'2019-02-06 18:23:01',NULL),(48,55,24,12.00,NULL,NULL,NULL,'2019-02-06 18:25:26',NULL),(49,49,9,10.00,NULL,NULL,NULL,'2019-02-06 18:27:28',NULL),(50,70,11,10.00,NULL,NULL,NULL,'2019-02-06 18:30:06',NULL),(51,71,18,31.00,NULL,NULL,NULL,'2019-02-06 18:36:50',NULL),(52,72,11,11.00,NULL,NULL,NULL,'2019-02-06 18:42:44',NULL),(53,73,12,25.00,NULL,NULL,NULL,'2019-02-07 13:20:55',NULL),(54,78,12,31.50,NULL,NULL,NULL,'2019-10-18 15:49:34',NULL),(55,78,13,31.50,NULL,NULL,NULL,'2019-10-18 15:49:34',NULL),(56,80,2,15.00,NULL,NULL,NULL,'2019-10-19 16:37:56',NULL),(57,79,2,26.00,1.00,NULL,NULL,'2019-10-19 16:38:29',NULL),(58,79,10,26.00,1.00,NULL,NULL,'2019-10-19 16:38:29',NULL),(59,85,12,40.00,NULL,NULL,NULL,'2019-11-16 13:56:27',NULL),(60,83,15,38.00,NULL,NULL,NULL,'2019-11-30 08:15:30',NULL),(61,90,30,15.00,NULL,'Niclas k&ouml;pte djuret f&ouml;r 25:- kilot slaktkropp',NULL,'2019-12-01 19:54:42',NULL),(62,86,30,17.00,NULL,'Niclas k&ouml;pte djuret f&ouml;r 25:- kilo slaktkropp',NULL,'2019-12-01 19:55:32',NULL),(63,82,19,34.00,NULL,NULL,NULL,'2019-12-01 19:58:53',NULL),(64,87,24,22.00,NULL,NULL,NULL,'2019-12-09 15:26:54',NULL),(65,88,18,14.00,NULL,NULL,NULL,'2019-12-09 15:27:11',NULL),(66,89,19,16.00,NULL,NULL,NULL,'2019-12-09 15:27:46',NULL),(67,84,23,37.00,NULL,NULL,NULL,'2019-12-14 18:34:50',NULL),(68,91,2,17.00,NULL,NULL,NULL,'2020-01-19 15:36:46',NULL),(69,92,12,15.00,NULL,NULL,NULL,'2020-01-19 15:37:17',NULL),(70,94,23,26.00,NULL,NULL,NULL,'2020-01-20 12:43:11',NULL),(71,95,11,38.00,NULL,NULL,NULL,'2020-02-01 19:52:29',NULL),(72,97,19,17.00,NULL,NULL,NULL,'2020-02-08 23:06:45',NULL),(73,98,30,15.00,NULL,NULL,NULL,'2020-02-15 09:00:36',NULL),(74,96,10,9.00,NULL,NULL,NULL,'2020-02-15 09:02:54',NULL),(75,93,11,16.00,NULL,NULL,NULL,'2020-02-15 09:03:11',NULL);
/*!40000 ALTER TABLE `meats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (50,'2014_10_12_000000_create_users_table',1),(51,'2014_10_12_100000_create_password_resets_table',1),(52,'2019_08_19_000000_create_failed_jobs_table',1),(53,'2019_10_22_044550_create_killreports_table',1),(54,'2019_10_25_115232_create_animals_table',1),(55,'2019_10_27_071805_create_areas_table',1),(56,'2020_02_05_071353_create_meats_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `active` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postnumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phonenumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobilenumber` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in` timestamp NULL DEFAULT NULL,
  `logged_in_now` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_since` timestamp NULL DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `users` VALUES (1,'yes','admin','webmaster','adminmagnus','Magnus','Andersson','R&ouml;jslav&auml;gen 3','712 91','0587-61199','073-5281761','H&auml;llefors','2019-11-07 20:43:04',NULL,'','2018-10-02 19:00:00','magnusandersson076@gmail.com',NULL,'$2y$10$5EdVLUl.tPddGg7pDETFrepHkq9hawJHgnDM2sxtu/u3wMi53YIay',NULL,'2017-10-02 18:01:23','2019-02-11 14:36:58'),(2,'yes','admin','hunter','johan','Johan','Eriksson','','','','','','2020-02-15 19:37:44',NULL,'','2017-10-02 00:00:00','glotterback@telia.com',NULL,'$2y$10$KLhH5LRInRnvc6DzGRbCu.TGmTbGilvH9DnKRgrb8MhTSTcgjd5J.',NULL,'2017-10-02 00:00:00','2019-02-11 14:18:42'),(3,'yes','user','devaccount','testuser','Anders','Andersson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00',NULL,NULL,'$2y$10$kDBDzddM31OtZVzCS2q8aOPFxxgS/y4dzhfaHqi8cHEnZZXg4A72.',NULL,'2017-10-02 18:43:27',NULL),(9,'yes','guest','hunter','g&ouml;te','G&ouml;te','Lundh','','','','','',NULL,NULL,'','2017-10-06 00:00:00','gote@email.com',NULL,'$2y$10$Nk7J.QOjEkTq.mb.w6nGd.kDqgHceSdtSVdxvFIGwqJ1g9FpcVKue',NULL,'2017-10-06 00:00:00','2019-09-28 15:26:21'),(10,'yes','user','hunter','kent','Kent','Sernander','','','','','','2020-01-28 08:46:22',NULL,'','2017-10-06 00:00:00','kent@email.com',NULL,'$2y$10$/YjZc1IyqDGdAbuRM/VWk.uoxdVYJpJGZYf98hoxnw/82n3lisK0W',NULL,'2017-10-06 00:00:00','2019-02-11 14:20:25'),(11,'yes','user','hunter','viktor','Viktor','Sernander','','','','','','2020-02-15 08:55:30',NULL,'','2017-10-06 00:00:00','viktor@email.com',NULL,'$2y$10$IoZCrayjNKSXfAaPMU.K4eV/6rGAxVJabuQNGTgHAET6tRDabNCv2',NULL,'2017-10-06 00:00:00','2019-02-11 14:20:52'),(12,'yes','user','hunter','peter','Peter','Steen','Rastorp Granudden 904','69791','730313198','','P&aring;lsboda','2019-09-15 12:11:50',NULL,'','2017-10-06 00:00:00','petersteen@telia.com',NULL,'$2y$10$MywrDe3ZhXq7IcyUUepIoOquuxwjpWIeIxlmH1WkV0Okno56vn8uO',NULL,'2017-10-06 00:00:00','2019-02-11 14:21:07'),(13,'yes','user','hunter','anders','Anders','Jansson','','','','','','2019-09-15 12:11:10',NULL,'','2017-10-06 00:00:00','anders@email.com',NULL,'$2y$10$3zPNfqyH0acLOMpj8qVsreZtm3R2Hr2IpwvJC82b7y724yaWEYNv.',NULL,'2017-10-06 00:00:00','2019-02-11 14:21:28'),(14,'yes','user','hunter','mattias','Mattias','T&ouml;rnqvist','','','','','',NULL,NULL,'','2017-10-06 00:00:00','mattias@email.com',NULL,'$2y$10$BJHakglEYV9SPoUmMNFir.vraRSaRnRJJ2CMW3XkP7/kLZ/9Asity',NULL,'2017-10-06 00:00:00','2019-02-11 14:21:48'),(15,'yes','user','hunter','kim','Kim','Mathsson','','','','','','2017-10-24 18:48:02',NULL,'','2017-10-06 00:00:00','kim@email.com',NULL,'$2y$10$FXpgPK.St1WwIuafXQcEluNUAvC4Dwvfns.n6TWr5XwowkC/TZroe',NULL,'2017-10-06 00:00:00','2019-02-11 14:23:06'),(16,'no','guest','hunter','klas','Klas','Tornholz','','','','','',NULL,NULL,'','2018-10-02 19:00:00','xxxx@xxx.xx',NULL,'$2y$10$CKtrflYNQf1JkPP./fbBBuf720w1yTQPFZQS93oiJ9zmdWPTb0zv6',NULL,'2017-10-06 11:46:51','2018-04-10 09:30:20'),(17,'no','guest','hunter','Conny','Conny','Rudolfsson','','','','','',NULL,NULL,'','2018-10-02 19:00:00','Conny.Rudolfsson@telia.com',NULL,'$2y$10$IXcmJs3ZdkMRZfB1LKWGE.jI0bKxHfodCBeoQ.cGFWfLTz4gyoJ52',NULL,'2017-10-12 19:32:41','2017-10-12 20:15:49'),(18,'yes','user','hunter','Kevin ','Kevin','Jirvelius','','','','','',NULL,NULL,'','2018-07-01 00:00:00','kevin@email.com',NULL,'$2y$10$BjAkbg2fAPVsG7G2Absl0.w0Sh7.Pp2B5zxmPab9C7/AIFPRdX7TS',NULL,'2017-10-21 00:00:00','2019-02-11 14:24:20'),(19,'yes','user','hunter','kim2','Kim','Preducic','&Auml;sstugansg&aring;rd 182','','','0730864050','','2019-08-31 08:52:56',NULL,'personnummer 199207213373','2018-07-01 00:00:00','Kimen_92_@hotmail.com',NULL,'$2y$10$RJoQ/BHFjuxj5aUJfUkdyezvD0fo.J9VAccHL7IgzFQRS5sC94Uve',NULL,'2017-11-25 00:00:00','2019-02-11 14:24:10'),(20,'yes','guest','hunter','Jocke','Joakim','Ahlen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','Joakimahlen@live.se',NULL,'$2y$10$TdAxd7T6kYzOoZ965IXilemWxviWtGHjn1cGMC1n/maviLjA6q0ZK',NULL,'2017-12-02 08:19:37',NULL),(21,'yes','guest','hunter','erik','Erik','K&aring;gstr&ouml;m','','','','','',NULL,NULL,'','2017-12-27 00:00:00','erik_kagstrom@hotmail.com',NULL,'$2y$10$NxrfLyA6Jvx7EXjGMyT3N.Acay1ACzt5jxF3oaVfNWqwd9Ujc3x9q',NULL,'2017-12-27 00:00:00','2019-02-11 14:25:01'),(22,'yes','guest','hunter','ove','Ove','Karlsson','','','','','','2018-02-19 21:08:53',NULL,'','2018-02-18 00:00:00','ovekarlsson97@yahoo.se',NULL,'$2y$10$CnwOJSCG.uGE7e1FGKFdduqC/tTLivtUv1830pRwCUy0.MhCLQ696',NULL,'2018-02-18 00:00:00','2019-02-11 14:25:27'),(23,'yes','user','hunter','bo','Bo','Lindsmyr','','','','','','2019-02-17 12:25:45',NULL,'','2018-07-01 00:00:00','bosselindsmyr@gmail.com',NULL,'$2y$10$KqhW2ExibJ54gUMP0gLgYuWToKGu2Pzi8WaKGnxYSlsHMAyZ.xx4y',NULL,'2018-04-15 00:00:00','2019-02-11 14:25:57'),(24,'yes','user','hunter','markus','Markus','Josefsson','','','','','','2019-02-28 13:01:30',NULL,'','2018-07-01 00:00:00','impala_1963_@hotmail.com',NULL,'$2y$10$mLZ0Gz/RhWzA0ELKIMuEAOnTnBsAL4bztN60ZaTDi3XtMjKJeQtx.',NULL,'2018-04-19 00:00:00','2019-02-11 14:26:22'),(25,'yes','guest','hunter','alexandra','Alexandra','Hellstr&ouml;m',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','alexandrahellstrom@live.se',NULL,'$2y$10$EnfprVaUxU0t1End5lyjQ.fwE21MAHTbnyXiGm0cjTY/kIlf0h6Ha',NULL,'2019-11-09 16:51:17',NULL),(26,'yes','guest','hunter','niclas','Niclas','Roslund',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','huggarkungen@hotmail.com',NULL,'$2y$10$G.MKNNQ4o1veSuMhaIvPfeBJ09fhoCVKCzzA8N7/Rhs4uPdB3Z0ga',NULL,'2019-11-30 08:51:26',NULL),(27,'yes','guest','hunter','robin','Robin','Berghdal',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','robin.bergdahl@hotmail.com',NULL,'$2y$10$6CtGIqDGbAESEFq2mOdEuOzFjx8yTI724.g0Oeact4EYnzuHgqaRq',NULL,'2020-01-20 12:38:24',NULL),(28,'yes','guest','hunter','adam','Adam','Preducic',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00','A.preducic@hotmail.com',NULL,'$2y$10$.VM9JXvV9MprEdmkIFvrieFS0UIc6T3rZj2R6xMWVV60.FYbkdy9m',NULL,'2020-02-08 23:04:14',NULL),(29,'yes','guest','devaccount','defaultno','defaultnofirstname','defaultnosurname',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2018-10-02 19:00:00',NULL,NULL,'$2y$10$aq58i30YFuMk1Okbmyj/Ee6yv1ViSCpANr8c/hlhfSINadB2OvNoe',NULL,'2017-10-06 08:38:31',NULL),(30,'yes','hunter','anonhunter','anonhunter','-','-',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'anonhunter',NULL,NULL,NULL);
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

-- Dump completed on 2020-02-24 21:23:26
