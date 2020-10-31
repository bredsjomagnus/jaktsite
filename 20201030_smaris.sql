-- MySQL dump 10.13  Distrib 5.5.57, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: smaris
-- ------------------------------------------------------
-- Server version	5.5.57-0+deb8u1

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
-- Table structure for table `SRAccounts`
--

DROP TABLE IF EXISTS `SRAccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRAccounts` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `active` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'yes',
  `role` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'hunter',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postnumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inlogged` timestamp NULL DEFAULT NULL,
  `notes` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `membersince` timestamp NOT NULL DEFAULT '2018-10-02 19:00:00',
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRAccounts`
--

LOCK TABLES `SRAccounts` WRITE;
/*!40000 ALTER TABLE `SRAccounts` DISABLE KEYS */;
INSERT INTO `SRAccounts` VALUES (-1,'yes','guest','devaccount','defaultno','$2y$10$aq58i30YFuMk1Okbmyj/Ee6yv1ViSCpANr8c/hlhfSINadB2OvNoe','defaultnofirstname','defaultnosurname',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-06 08:38:31','2018-10-02 19:00:00',NULL,NULL),(1,'yes','admin','webmaster','adminmagnus','$2y$10$5EdVLUl.tPddGg7pDETFrepHkq9hawJHgnDM2sxtu/u3wMi53YIay','Magnus','Andersson','R&ouml;jslav&auml;gen 3','magnusandersson076@gmail.com','712 91','0587-61199','073-5281761','H&auml;llefors','2020-02-24 19:48:53','','2017-10-02 18:01:23','2018-10-02 19:00:00','2019-02-11 14:36:58',NULL),(2,'yes','admin','hunter','johan','$2y$10$8T2hYOqeFFUjxVcKH43zsucHyDZOJ3JbJTXuZoCUkJToWc6Jn80me','Johan','Eriksson','','glotterback@telia.com','','','','','2020-10-30 13:12:53','','2017-10-02 00:00:00','2017-10-02 00:00:00','2019-02-11 14:18:42',NULL),(3,'yes','user','devaccount','testuser','$2y$10$kDBDzddM31OtZVzCS2q8aOPFxxgS/y4dzhfaHqi8cHEnZZXg4A72.','Anders','Andersson',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-10-02 18:43:27','2018-10-02 19:00:00',NULL,NULL),(9,'yes','guest','hunter','g&ouml;te','$2y$10$Nk7J.QOjEkTq.mb.w6nGd.kDqgHceSdtSVdxvFIGwqJ1g9FpcVKue','G&ouml;te','Lundh','','gote@email.com','','','','',NULL,'','2017-10-06 00:00:00','2017-10-06 00:00:00','2019-09-28 15:26:21',NULL),(10,'yes','user','hunter','kent','$2y$10$/YjZc1IyqDGdAbuRM/VWk.uoxdVYJpJGZYf98hoxnw/82n3lisK0W','Kent','Sernander','','kent@email.com','','','','','2020-01-28 08:46:22','','2017-10-06 00:00:00','2017-10-06 00:00:00','2019-02-11 14:20:25',NULL),(11,'yes','user','hunter','viktor','$2y$10$IoZCrayjNKSXfAaPMU.K4eV/6rGAxVJabuQNGTgHAET6tRDabNCv2','Viktor','Sernander','','viktor@email.com','','','','','2020-03-02 18:57:18','','2017-10-06 00:00:00','2017-10-06 00:00:00','2019-02-11 14:20:52',NULL),(12,'yes','user','hunter','peter','$2y$10$MywrDe3ZhXq7IcyUUepIoOquuxwjpWIeIxlmH1WkV0Okno56vn8uO','Peter','Steen','Rastorp Granudden 904','petersteen@telia.com','69791','730313198','','P&aring;lsboda','2019-09-15 12:11:50','','2017-10-06 00:00:00','2017-10-06 00:00:00','2019-02-11 14:21:07',NULL),(13,'yes','user','hunter','anders','$2y$10$3zPNfqyH0acLOMpj8qVsreZtm3R2Hr2IpwvJC82b7y724yaWEYNv.','Anders','Jansson','','anders@email.com','','','','','2019-09-15 12:11:10','','2017-10-06 00:00:00','2017-10-06 00:00:00','2019-02-11 14:21:28',NULL),(14,'yes','user','hunter','mattias','$2y$10$BJHakglEYV9SPoUmMNFir.vraRSaRnRJJ2CMW3XkP7/kLZ/9Asity','Mattias','T&ouml;rnqvist','','mattias@email.com','','','','',NULL,'','2017-10-06 00:00:00','2017-10-06 00:00:00','2019-02-11 14:21:48',NULL),(15,'yes','user','hunter','kim','$2y$10$FXpgPK.St1WwIuafXQcEluNUAvC4Dwvfns.n6TWr5XwowkC/TZroe','Kim','Mathsson','','kim@email.com','','','','','2017-10-24 18:48:02','','2017-10-06 00:00:00','2017-10-06 00:00:00','2019-02-11 14:23:06',NULL),(16,'no','exuser','hunter','klas','$2y$10$CKtrflYNQf1JkPP./fbBBuf720w1yTQPFZQS93oiJ9zmdWPTb0zv6','Klas','Tornholz','','xxxx@xxx.xx','','','','',NULL,'','2017-10-06 11:46:51','2018-10-02 19:00:00','2018-04-10 09:30:20',NULL),(17,'no','exuser','hunter','Conny','$2y$10$IXcmJs3ZdkMRZfB1LKWGE.jI0bKxHfodCBeoQ.cGFWfLTz4gyoJ52','Conny','Rudolfsson','','Conny.Rudolfsson@telia.com','','','','',NULL,'','2017-10-12 19:32:41','2018-10-02 19:00:00','2017-10-12 20:15:49',NULL),(18,'yes','user','hunter','Kevin ','$2y$10$BjAkbg2fAPVsG7G2Absl0.w0Sh7.Pp2B5zxmPab9C7/AIFPRdX7TS','Kevin','Jirvelius','','kevin@email.com','','','','',NULL,'','2017-10-21 00:00:00','2018-07-01 00:00:00','2019-02-11 14:24:20',NULL),(19,'yes','user','hunter','kim2','$2y$10$RJoQ/BHFjuxj5aUJfUkdyezvD0fo.J9VAccHL7IgzFQRS5sC94Uve','Kim','Preducic','&Auml;sstugansg&aring;rd 182','Kimen_92_@hotmail.com','','','0730864050','','2019-08-31 08:52:56','personnummer 199207213373','2017-11-25 00:00:00','2018-07-01 00:00:00','2019-02-11 14:24:10',NULL),(20,'yes','guest','hunter','Jocke','$2y$10$TdAxd7T6kYzOoZ965IXilemWxviWtGHjn1cGMC1n/maviLjA6q0ZK','Joakim','Ahlen',NULL,'Joakimahlen@live.se',NULL,NULL,NULL,NULL,NULL,NULL,'2017-12-02 08:19:37','2018-10-02 19:00:00',NULL,NULL),(21,'yes','guest','hunter','erik','$2y$10$NxrfLyA6Jvx7EXjGMyT3N.Acay1ACzt5jxF3oaVfNWqwd9Ujc3x9q','Erik','K&aring;gstr&ouml;m','','erik_kagstrom@hotmail.com','','','','',NULL,'','2017-12-27 00:00:00','2017-12-27 00:00:00','2019-02-11 14:25:01',NULL),(22,'yes','guest','hunter','ove','$2y$10$CnwOJSCG.uGE7e1FGKFdduqC/tTLivtUv1830pRwCUy0.MhCLQ696','Ove','Karlsson','','ovekarlsson97@yahoo.se','','','','','2018-02-19 21:08:53','','2018-02-18 00:00:00','2018-02-18 00:00:00','2019-02-11 14:25:27',NULL),(23,'yes','user','hunter','bo','$2y$10$KqhW2ExibJ54gUMP0gLgYuWToKGu2Pzi8WaKGnxYSlsHMAyZ.xx4y','Bo','Lindsmyr','','bosselindsmyr@gmail.com','','','','','2019-02-17 12:25:45','','2018-04-15 00:00:00','2018-07-01 00:00:00','2019-02-11 14:25:57',NULL),(24,'yes','user','hunter','markus','$2y$10$mLZ0Gz/RhWzA0ELKIMuEAOnTnBsAL4bztN60ZaTDi3XtMjKJeQtx.','Markus','Josefsson','','impala_1963_@hotmail.com','','','','','2019-02-28 13:01:30','','2018-04-19 00:00:00','2018-07-01 00:00:00','2019-02-11 14:26:22',NULL),(25,'yes','guest','hunter','alexandra','$2y$10$EnfprVaUxU0t1End5lyjQ.fwE21MAHTbnyXiGm0cjTY/kIlf0h6Ha','Alexandra','Hellstr&ouml;m',NULL,'alexandrahellstrom@live.se',NULL,NULL,NULL,NULL,NULL,NULL,'2019-11-09 16:51:17','2018-10-02 19:00:00',NULL,NULL),(26,'yes','guest','hunter','niclas','$2y$10$G.MKNNQ4o1veSuMhaIvPfeBJ09fhoCVKCzzA8N7/Rhs4uPdB3Z0ga','Niclas','Roslund',NULL,'huggarkungen@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'2019-11-30 08:51:26','2018-10-02 19:00:00',NULL,NULL),(27,'yes','guest','hunter','robin','$2y$10$6CtGIqDGbAESEFq2mOdEuOzFjx8yTI724.g0Oeact4EYnzuHgqaRq','Robin','Berghdal',NULL,'robin.bergdahl@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'2020-01-20 12:38:24','2018-10-02 19:00:00',NULL,NULL),(28,'yes','guest','hunter','adam','$2y$10$.VM9JXvV9MprEdmkIFvrieFS0UIc6T3rZj2R6xMWVV60.FYbkdy9m','Adam','Preducic',NULL,'A.preducic@hotmail.com',NULL,NULL,NULL,NULL,NULL,NULL,'2020-02-08 23:04:14','2018-10-02 19:00:00',NULL,NULL);
/*!40000 ALTER TABLE `SRAccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SRAnimal`
--

DROP TABLE IF EXISTS `SRAnimal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRAnimal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor` int(11) DEFAULT NULL,
  `species` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `speciestype` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `engspecies` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sex` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `live_weight` float DEFAULT NULL,
  `aprox_live_weight` float DEFAULT NULL,
  `passad_weight` float DEFAULT NULL,
  `aprox_passad_weight` float DEFAULT NULL,
  `carcass_weight` float DEFAULT NULL,
  `aprox_carcass_weight` float DEFAULT NULL,
  `cut_weight` float DEFAULT NULL,
  `heart_weight` float DEFAULT NULL,
  `waste` float DEFAULT '0',
  `wastenotes` text COLLATE utf8mb4_unicode_ci,
  `antlers` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRAnimal`
--

LOCK TABLES `SRAnimal` WRITE;
/*!40000 ALTER TABLE `SRAnimal` DISABLE KEYS */;
INSERT INTO `SRAnimal` VALUES (1,1,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,33,33,NULL,NULL,0,NULL,'Spets',NULL,'2017-10-20 21:34:19',NULL,NULL),(2,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,32,32,NULL,NULL,0,NULL,NULL,NULL,'2017-10-22 16:32:16',NULL,NULL),(3,2,'Älg','Kvigkalv','moose','female','calf',NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-10-24 18:07:12',NULL,NULL),(4,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:03:43',NULL,'2017-10-25 15:07:32'),(5,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,0,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:08:58',NULL,'2017-10-25 15:16:12'),(6,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,47,NULL,NULL,NULL,0,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:17:04',NULL,NULL),(7,12,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'Stång-Halvskovel',NULL,'2017-10-25 17:18:36',NULL,'2017-10-25 15:18:45'),(8,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-10-26 16:50:53',NULL,NULL),(9,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,0,NULL,'Spets',NULL,'2017-10-27 17:16:38',NULL,NULL),(10,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,0,NULL,'Stång',NULL,'2017-11-25 17:25:53',NULL,NULL),(11,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-11-26 13:42:48',NULL,NULL),(12,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-11-26 17:00:25',NULL,NULL),(13,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'Spets',NULL,'2017-12-02 19:42:18',NULL,'2017-12-02 17:44:50'),(14,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,17,17,NULL,NULL,0,NULL,NULL,NULL,'2017-12-02 19:46:13',NULL,NULL),(15,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,21,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-12-03 17:21:41',NULL,NULL),(16,2,'Dovvilt','Hjort','fallowdeer','male','adult',83,NULL,NULL,NULL,46,NULL,NULL,NULL,0,NULL,'Helskovel',NULL,'2017-12-11 18:38:22',NULL,NULL),(17,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,0,NULL,NULL,NULL,'2017-12-11 21:07:15',NULL,NULL),(18,2,'Dovvilt','Hjort','fallowdeer','male','adult',44,NULL,NULL,NULL,23,NULL,NULL,333,0,NULL,'Spets',NULL,'2017-12-17 19:16:47',NULL,NULL),(19,2,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-12-18 07:40:17',NULL,NULL),(20,11,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-12-27 17:32:46',NULL,NULL),(21,2,'Rådjur','Bock','roedeer','male','adult',NULL,NULL,15,NULL,11,NULL,NULL,NULL,0,NULL,NULL,NULL,'2017-12-29 10:21:40',NULL,NULL),(22,11,'Kronvilt','Smalhind','reddeer','female','adult',107,NULL,NULL,NULL,63,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-03 20:08:42',NULL,NULL),(23,13,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,19,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-08 16:41:59',NULL,NULL),(24,2,'Rådjur','Smaldjur','roedeer','female','adult',NULL,NULL,NULL,NULL,NULL,11,NULL,NULL,0,NULL,NULL,NULL,'2018-01-16 11:28:55',NULL,NULL),(25,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-17 17:25:06',NULL,NULL),(26,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-17 17:47:59',NULL,NULL),(27,12,'Rådjur','Smaldjur','roedeer','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-20 21:26:32',NULL,'2018-01-23 04:44:33'),(28,11,'Dovvilt','Hjort','fallowdeer','male','adult',42,NULL,NULL,NULL,20,NULL,NULL,0.428,0,NULL,'Spets',NULL,'2018-01-23 18:12:03',NULL,NULL),(29,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,25,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-28 10:14:46',NULL,NULL),(30,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-28 15:49:35',NULL,NULL),(31,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-01-28 15:56:00',NULL,NULL),(32,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',25,NULL,NULL,NULL,15,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-02-03 13:53:47',NULL,NULL),(33,2,'Vildsvin','Gylta','boar','female','adult',72,NULL,56,NULL,35,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-02-16 18:28:31',NULL,NULL),(34,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-02-18 19:53:13',NULL,NULL),(35,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',26,NULL,NULL,NULL,15,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-02-21 22:19:46',NULL,NULL),(36,2,'Dovvilt','Hind','fallowdeer','female','adult',35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-02-24 19:27:01',NULL,NULL),(37,10,'Vildsvin','Galt','boar','male','adult',65,65,NULL,NULL,30,30,NULL,NULL,0,NULL,NULL,NULL,'2018-03-20 12:00:12',NULL,NULL),(38,2,'Vildsvin','Galt','boar','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-08-09 17:35:52',NULL,NULL),(39,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,28,NULL,NULL,NULL,0,NULL,'Spets',NULL,'2018-09-17 10:27:49',NULL,NULL),(40,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,NULL,10,NULL,NULL,0,NULL,NULL,NULL,'2018-10-20 09:58:38',NULL,NULL),(41,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-11-07 08:20:20',NULL,NULL),(42,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,33,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-11-18 08:15:55',NULL,NULL),(43,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,27,NULL,NULL,NULL,0,NULL,NULL,NULL,'2018-11-18 11:37:03',NULL,NULL),(44,2,'Kronvilt','Hjort','reddeer','male','adult',97,NULL,NULL,NULL,55,NULL,NULL,NULL,0,NULL,'2',2,'2019-01-02 20:16:21',NULL,NULL),(45,2,'Dovvilt','Hjort','fallowdeer','male','adult',75,NULL,NULL,NULL,46,NULL,NULL,NULL,0,NULL,'Halvskovel-Helskovel',NULL,'2019-01-02 20:18:49',NULL,NULL),(46,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-05 08:37:52',NULL,NULL),(47,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,44,NULL,NULL,NULL,0,NULL,'Helskovel',NULL,'2019-01-07 07:43:35',NULL,NULL),(48,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,0,NULL,'Stång',NULL,'2019-01-09 15:22:57',NULL,NULL),(49,2,'Dovvilt','Hjort','fallowdeer','male','adult',51,NULL,NULL,NULL,30,NULL,NULL,NULL,0,NULL,'Spets',NULL,'2019-01-13 16:34:58',NULL,NULL),(50,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,28,NULL,NULL,0,NULL,'Spets',NULL,'2019-01-13 16:38:40',NULL,NULL),(51,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,29,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-13 16:41:44',NULL,NULL),(52,11,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,12,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-13 17:19:15',NULL,NULL),(53,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-13 17:25:13',NULL,'2019-01-13 17:25:33'),(54,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-19 09:55:31',NULL,NULL),(55,2,'Kronvilt','Hindkalv','reddeer','female','calf',NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 08:42:12',NULL,NULL),(56,11,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,39,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 18:48:50',NULL,NULL),(57,2,'Kronvilt','Smalhind','reddeer','female','adult',NULL,NULL,NULL,NULL,62,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 19:55:40',NULL,NULL),(58,2,'Kronvilt','Smalhind','reddeer','female','adult',NULL,NULL,77,NULL,62,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 20:02:26',NULL,NULL),(59,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,55,NULL,40,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-26 20:04:46',NULL,NULL),(60,2,'Rådjur','Bock','roedeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-27 10:20:16',NULL,NULL),(61,2,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-29 15:11:25',NULL,NULL),(62,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,37,NULL,NULL,NULL,0,NULL,'Stång',NULL,'2019-01-30 11:49:51',NULL,NULL),(63,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,27,27,NULL,NULL,0,NULL,'Spets',NULL,'2019-01-30 11:51:36',NULL,NULL),(64,11,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-30 11:53:21',NULL,NULL),(65,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-01-30 11:55:02',NULL,NULL),(66,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-02-04 17:43:09',NULL,NULL),(67,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,10,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-02-06 18:26:16',NULL,NULL),(68,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,31,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-02-06 18:34:59',NULL,NULL),(69,2,'Dovvilt','Obestämd kalv','fallowdeer','unknown','calf',23,NULL,NULL,NULL,NULL,11,NULL,NULL,0,NULL,NULL,NULL,'2019-02-06 18:40:53',NULL,NULL),(70,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,NULL,25,NULL,NULL,0,NULL,NULL,NULL,'2019-02-07 13:20:18',NULL,NULL),(71,11,'Vildsvin','Galtkulting','boar','male','calf',NULL,NULL,NULL,NULL,20,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-02-14 12:48:13',NULL,NULL),(72,11,'Vildsvin','Gylta','boar','female','adult',46,NULL,NULL,NULL,24,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-03-16 12:45:20',NULL,NULL),(73,2,'Vildsvin','Galt','boar','male','adult',55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-05-28 22:02:42',NULL,NULL),(74,11,'Vildsvin','Gylta','boar','female','adult',NULL,32,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-10-05 20:52:24',NULL,NULL),(75,2,'Kronvilt','Hind','reddeer','female','adult',NULL,NULL,NULL,NULL,63,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-10-18 15:48:38',NULL,NULL),(76,2,'Älg','Tjurkalv','moose','male','calf',NULL,NULL,NULL,NULL,52,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-10-19 16:34:58',NULL,NULL),(77,2,'Vildsvin','Suggkulting','boar','female','calf',NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-10-19 16:35:47',NULL,NULL),(78,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'Spets',NULL,'2019-10-19 16:36:37',NULL,NULL),(79,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,34,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-10-23 17:46:27',NULL,NULL),(80,2,'Kronvilt','Hjortkalv','reddeer','male','calf',NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-11-09 16:52:33',NULL,NULL),(81,2,'Vildsvin','Gylta','boar','female','adult',66,NULL,NULL,NULL,37,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-11-09 18:04:41',NULL,NULL),(82,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,40,NULL,NULL,NULL,0,NULL,'Stång',NULL,'2019-11-16 11:45:00',NULL,NULL),(83,2,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-11-30 08:52:39',NULL,NULL),(84,2,'Dovvilt','Hind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,22,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-11-30 10:21:25',NULL,NULL),(85,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,14,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-11-30 10:22:13',NULL,NULL),(86,2,'Dovvilt','Hjortkalv','fallowdeer','male','calf',NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-11-30 10:23:07',NULL,NULL),(87,2,'Dovvilt','Obestämd kalv','fallowdeer','unknown','calf',NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,0,NULL,NULL,NULL,'2019-12-01 19:52:12',NULL,NULL),(88,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,17,NULL,17,NULL,NULL,NULL,0,NULL,NULL,NULL,'2020-01-19 11:42:05',NULL,NULL),(89,2,'Dovvilt','Hindkalv','fallowdeer','female','calf',NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,0,NULL,NULL,NULL,'2020-01-19 15:30:33',NULL,NULL),(90,11,'Vildsvin','Galt','boar','male','adult',NULL,NULL,NULL,NULL,16,NULL,NULL,NULL,0,NULL,NULL,NULL,'2020-01-20 08:58:03',NULL,NULL),(91,2,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,26,NULL,NULL,NULL,0,NULL,'Spets',NULL,'2020-01-20 12:39:56',NULL,NULL),(92,11,'Dovvilt','Hjort','fallowdeer','male','adult',NULL,NULL,NULL,NULL,38,NULL,NULL,NULL,0,NULL,'Stång',NULL,'2020-01-26 12:50:41',NULL,NULL),(93,11,'Rådjur','Bockkilling','roedeer','male','calf',NULL,NULL,NULL,NULL,9,NULL,NULL,NULL,0,NULL,NULL,NULL,'2020-02-04 16:49:05',NULL,NULL),(94,2,'Vildsvin','Obestämd kulting','boar','unknown','calf',NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,0,NULL,NULL,NULL,'2020-02-08 23:06:05',NULL,NULL),(95,11,'Vildsvin','Gylta','boar','female','adult',NULL,NULL,NULL,NULL,15,15,NULL,NULL,0,NULL,NULL,NULL,'2020-02-15 08:58:43',NULL,NULL),(96,11,'Dovvilt','Smalhind','fallowdeer','female','adult',NULL,NULL,NULL,NULL,18,NULL,NULL,NULL,0,NULL,NULL,NULL,'2020-03-02 18:59:20',NULL,NULL);
/*!40000 ALTER TABLE `SRAnimal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SRArea`
--

DROP TABLE IF EXISTS `SRArea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRArea` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `areaname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRArea`
--

LOCK TABLES `SRArea` WRITE;
/*!40000 ALTER TABLE `SRArea` DISABLE KEYS */;
INSERT INTO `SRArea` VALUES (1,'Småris',NULL,'2017-10-06 15:27:08',NULL,NULL),(2,'Glotterbäck',NULL,'2017-10-06 15:27:11',NULL,NULL),(3,'Haddebo',NULL,'2017-10-06 15:27:13',NULL,NULL),(4,'Västerby',NULL,'2017-10-06 15:27:17',NULL,NULL),(5,'Nästorp',NULL,'2017-10-06 15:27:20',NULL,NULL),(6,'Pålsboda',NULL,'2017-10-06 15:27:23',NULL,NULL);
/*!40000 ALTER TABLE `SRArea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SRImage`
--

DROP TABLE IF EXISTS `SRImage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRImage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagename` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagefolder` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagesize` int(255) DEFAULT NULL,
  `imagetype` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullimagename` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRImage`
--

LOCK TABLES `SRImage` WRITE;
/*!40000 ALTER TABLE `SRImage` DISABLE KEYS */;
INSERT INTO `SRImage` VALUES (1,'hunterviktor-1',NULL,'huntingimages',3083019,'jpg','hunterviktor-1.jpg',NULL,'public','2017-10-20 21:34:46'),(2,'hunterviktor-2',NULL,'huntingimages',3583817,'jpg','hunterviktor-2.jpg',NULL,'public','2017-10-22 16:33:43'),(3,'hunterjohan-3',NULL,'huntingimages',3293906,'JPG','hunterjohan-3.JPG',NULL,'public','2017-10-24 18:21:04'),(4,'hunterpeter-4',NULL,'huntingimages',3367506,'JPG','hunterpeter-4.JPG',NULL,'public','2017-10-25 17:05:32'),(5,'hunterpeter-5',NULL,'huntingimages',3367506,'JPG','hunterpeter-5.JPG',NULL,'public','2017-10-25 17:10:49'),(6,'hunterpeter-6',NULL,'huntingimages',3367510,'JPG','hunterpeter-6.JPG',NULL,'public','2017-10-25 17:22:31'),(7,'hunterjohan-6',NULL,'huntingimages',406458,'jpg','hunterjohan-6.jpg',NULL,'public','2017-10-25 17:25:04'),(8,'hunterjohan-8',NULL,'huntingimages',295327,'jpg','hunterjohan-8.jpg',NULL,'public','2017-10-26 16:51:41'),(9,'hunterviktor-9',NULL,'huntingimages',4185602,'jpg','hunterviktor-9.jpg',NULL,'public','2017-10-27 17:18:06'),(10,'hunterjohan-10',NULL,'huntingimages',4741117,'JPG','hunterjohan-10.JPG',NULL,'public','2017-11-25 17:29:11'),(11,'hunterjohan-11',NULL,'huntingimages',288119,'jpg','hunterjohan-11.jpg',NULL,'public','2017-11-26 13:43:08'),(12,'hunterjohan-12',NULL,'huntingimages',2165665,'JPG','hunterjohan-12.JPG',NULL,'public','2017-11-26 17:02:47'),(13,'hunterviktor-13',NULL,'huntingimages',5140352,'jpg','hunterviktor-13.jpg',NULL,'public','2017-12-02 19:43:00'),(14,'hunterviktor-14',NULL,'huntingimages',5140352,'jpg','hunterviktor-14.jpg',NULL,'public','2017-12-02 19:46:34'),(15,'hunterjohan-15',NULL,'huntingimages',2360823,'JPG','hunterjohan-15.JPG',NULL,'public','2017-12-03 17:22:13'),(16,'hunterjohan-15',NULL,'huntingimages',285464,'jpg','hunterjohan-15.jpg',NULL,'public','2017-12-04 20:03:56'),(17,'hunterjohan-16',NULL,'huntingimages',895299,'JPG','hunterjohan-16.JPG',NULL,'public','2017-12-11 18:38:45'),(18,'hunterjohan-17',NULL,'huntingimages',9278794,'jpg','hunterjohan-17.jpg',NULL,'public','2017-12-11 21:10:04'),(19,'hunterjohan-18',NULL,'huntingimages',7705659,'JPG','hunterjohan-18.JPG',NULL,'public','2017-12-17 19:32:21'),(20,'hunterjohan-20',NULL,'huntingimages',3431330,'JPG','hunterjohan-20.JPG',NULL,'public','2017-12-18 07:42:33'),(21,'hunterjohan-20',NULL,'huntingimages',3431332,'JPG','hunterjohan-20.JPG',NULL,'public','2017-12-18 07:46:02'),(22,'hunterviktor-21',NULL,'huntingimages',6203420,'jpg','hunterviktor-21.jpg',NULL,'public','2017-12-27 17:34:20'),(23,'hunterviktor-21',NULL,'huntingimages',6075251,'jpg','hunterviktor-21.jpg',NULL,'public','2017-12-27 17:36:03'),(24,'hunterviktor-21',NULL,'huntingimages',6298087,'jpg','hunterviktor-21.jpg',NULL,'public','2017-12-27 17:37:03'),(25,'hunterjohan-22',NULL,'huntingimages',256040,'jpg','hunterjohan-22.jpg',NULL,'public','2017-12-29 10:22:15'),(26,'hunterjohan-22',NULL,'huntingimages',256040,'jpg','hunterjohan-22.jpg',NULL,'public','2017-12-29 10:22:20'),(27,'hunterviktor-23',NULL,'huntingimages',5331107,'jpg','hunterviktor-23.jpg',NULL,'public','2018-01-03 20:10:24'),(28,'hunteranders-24',NULL,'huntingimages',1749405,'jpg','hunteranders-24.jpg',NULL,'public','2018-01-08 16:49:54'),(29,'hunterviktor-24',NULL,'huntingimages',5933427,'jpg','hunterviktor-24.jpg',NULL,'public','2018-01-08 18:21:17'),(30,'hunterviktor-27',NULL,'huntingimages',6880422,'jpg','hunterviktor-27.jpg',NULL,'public','2018-01-17 18:01:52'),(31,'hunterviktor-29',NULL,'huntingimages',4536975,'jpg','hunterviktor-29.jpg',NULL,'public','2018-01-17 18:04:10'),(32,'hunterviktor-28',NULL,'huntingimages',37590,'jpg','hunterviktor-28.jpg',NULL,'public','2018-01-17 18:08:19'),(33,'hunterjohan-27',NULL,'huntingimages',2072440,'JPG','hunterjohan-27.JPG',NULL,'public','2018-01-17 18:13:08'),(34,'hunterviktor-31',NULL,'huntingimages',5282263,'jpg','hunterviktor-31.jpg',NULL,'public','2018-01-23 18:12:56'),(35,'hunterjohan-32',NULL,'huntingimages',6623986,'JPG','hunterjohan-32.JPG',NULL,'public','2018-01-28 10:20:57'),(36,'hunterjohan-33',NULL,'huntingimages',7725160,'JPG','hunterjohan-33.JPG',NULL,'public','2018-01-28 15:50:11'),(37,'hunterjohan-34',NULL,'huntingimages',145023,'jpg','hunterjohan-34.jpg',NULL,'public','2018-01-28 15:56:19'),(38,'hunterjohan-35',NULL,'huntingimages',5029122,'JPG','hunterjohan-35.JPG',NULL,'public','2018-02-03 13:54:28'),(39,'hunterjohan-36',NULL,'huntingimages',3790230,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:29:08'),(40,'hunterjohan-36',NULL,'huntingimages',3720543,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:29:28'),(41,'hunterjohan-36',NULL,'huntingimages',3898323,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:29:51'),(42,'hunterjohan-36',NULL,'huntingimages',3731366,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:30:16'),(43,'hunterjohan-36',NULL,'huntingimages',3731366,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:30:35'),(44,'hunterjohan-36',NULL,'huntingimages',4361758,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:30:58'),(45,'hunterjohan-36',NULL,'huntingimages',3790230,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:31:22'),(46,'hunterjohan-36',NULL,'huntingimages',3790230,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:31:53'),(47,'hunterjohan-36',NULL,'huntingimages',3790232,'JPG','hunterjohan-36.JPG',NULL,'public','2018-02-16 18:32:53'),(48,'hunterjohan-37',NULL,'huntingimages',1930503,'jpeg','hunterjohan-37.jpeg',NULL,'public','2018-02-18 19:53:30'),(49,'hunterjohan-38',NULL,'huntingimages',3585902,'JPG','hunterjohan-38.JPG',NULL,'public','2018-02-21 22:20:18'),(50,'hunterjohan-39',NULL,'huntingimages',61830,'jpg','hunterjohan-39.jpg',NULL,'public','2018-02-24 19:27:18'),(51,'hunterjohan-39',NULL,'huntingimages',61928,'jpg','hunterjohan-39.jpg',NULL,'public','2018-02-24 19:28:28'),(52,'hunterviktor-40',NULL,'huntingimages',3447722,'jpg','hunterviktor-40.jpg',NULL,'public','2018-03-20 12:04:08'),(53,'hunterjohan-41',NULL,'huntingimages',2871160,'JPG','hunterjohan-41.JPG',NULL,'public','2018-08-09 17:36:27'),(54,'hunterjohan-41',NULL,'huntingimages',2871164,'JPG','hunterjohan-41.JPG',NULL,'public','2018-08-09 17:38:35'),(55,'hunterjohan-43',NULL,'huntingimages',11962851,'JPG','hunterjohan-43.JPG',NULL,'public','2018-10-21 16:12:37'),(56,'hunterjohan-44',NULL,'huntingimages',478872,'jpeg','hunterjohan-44.jpeg',NULL,'public','2018-11-07 08:23:20'),(57,'hunterjohan-44',NULL,'huntingimages',478872,'jpeg','hunterjohan-44.jpeg',NULL,'public','2018-11-07 08:23:43'),(58,'hunterjohan-45',NULL,'huntingimages',7511056,'JPG','hunterjohan-45.JPG',NULL,'public','2018-11-18 08:18:59'),(59,'hunterjohan-46',NULL,'huntingimages',1897146,'jpeg','hunterjohan-46.jpeg',NULL,'public','2018-11-18 11:37:56'),(60,'hunterjohan-48',NULL,'huntingimages',3214102,'JPG','hunterjohan-48.JPG',NULL,'public','2019-01-02 20:21:51'),(61,'hunterjohan-49',NULL,'huntingimages',7167259,'JPG','hunterjohan-49.JPG',NULL,'public','2019-01-05 08:40:50'),(62,'hunterjohan-49',NULL,'huntingimages',7051747,'JPG','hunterjohan-49.JPG',NULL,'public','2019-01-07 07:29:34'),(63,'hunterjohan-49',NULL,'huntingimages',7167261,'JPG','hunterjohan-49.JPG',NULL,'public','2019-01-07 07:40:01'),(64,'hunterjohan-49',NULL,'huntingimages',7199349,'JPG','hunterjohan-49.JPG',NULL,'public','2019-01-07 07:41:09'),(65,'hunterjohan-50',NULL,'huntingimages',7309310,'JPG','hunterjohan-50.JPG',NULL,'public','2019-01-07 07:44:27'),(66,'hunterjohan-47',NULL,'huntingimages',2870721,'JPG','hunterjohan-47.JPG',NULL,'public','2019-01-07 07:49:04'),(67,'hunterjohan-51',NULL,'huntingimages',6185147,'JPG','hunterjohan-51.JPG',NULL,'public','2019-01-09 15:24:21'),(68,'hunterjohan-52',NULL,'huntingimages',3094343,'JPG','hunterjohan-52.JPG',NULL,'public','2019-01-13 16:35:28'),(69,'hunterjohan-52',NULL,'huntingimages',3094345,'JPG','hunterjohan-52.JPG',NULL,'public','2019-01-13 16:36:49'),(70,'hunterjohan-53',NULL,'huntingimages',6581243,'JPG','hunterjohan-53.JPG',NULL,'public','2019-01-13 16:39:35'),(71,'hunterjohan-55',NULL,'huntingimages',1636604,'jpeg','hunterjohan-55.jpeg',NULL,'public','2019-01-13 17:26:15'),(72,'hunterjohan-55',NULL,'huntingimages',1636838,'jpeg','hunterjohan-55.jpeg',NULL,'public','2019-01-13 17:28:12'),(73,'hunterjohan-54',NULL,'huntingimages',337207,'jpeg','hunterjohan-54.jpeg',NULL,'public','2019-01-15 21:08:43'),(74,'hunterjohan-57',NULL,'huntingimages',3934864,'JPG','hunterjohan-57.JPG',NULL,'public','2019-01-19 09:56:32'),(75,'hunterjohan-58',NULL,'huntingimages',7423461,'JPG','hunterjohan-58.JPG',NULL,'public','2019-01-26 11:32:29'),(76,'hunterjohan-60',NULL,'huntingimages',272574,'jpeg','hunterjohan-60.jpeg',NULL,'public','2019-01-26 19:56:43'),(77,'hunterjohan-61',NULL,'huntingimages',4255664,'JPG','hunterjohan-61.JPG',NULL,'public','2019-01-26 20:03:07'),(78,'hunterjohan-62',NULL,'huntingimages',5776354,'JPG','hunterjohan-62.JPG',NULL,'public','2019-01-26 20:05:40'),(79,'hunterjohan-42',NULL,'huntingimages',2997590,'jpg','hunterjohan-42.jpg',NULL,'public','2019-01-27 10:06:25'),(80,'hunterjohan-63',NULL,'huntingimages',534437,'jpg','hunterjohan-63.jpg',NULL,'public','2019-01-27 10:22:02'),(81,'hunterjohan-64',NULL,'huntingimages',826502,'jpeg','hunterjohan-64.jpeg',NULL,'public','2019-01-29 15:12:40'),(82,'hunterjohan-68',NULL,'huntingimages',7219410,'JPG','hunterjohan-68.JPG',NULL,'public','2019-01-30 11:56:03'),(83,'hunterjohan-66',NULL,'huntingimages',5617978,'JPG','hunterjohan-66.JPG',NULL,'public','2019-01-30 18:49:30'),(84,'hunterjohan-67',NULL,'huntingimages',5651174,'JPG','hunterjohan-67.JPG',NULL,'public','2019-01-30 18:50:51'),(85,'hunterjohan-65',NULL,'huntingimages',5553418,'JPG','hunterjohan-65.JPG',NULL,'public','2019-01-30 18:51:38'),(86,'hunterjohan-69',NULL,'huntingimages',3215708,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-04 17:43:25'),(87,'hunterjohan-69',NULL,'huntingimages',2910587,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-04 17:43:45'),(88,'hunterviktor-59',NULL,'huntingimages',3705213,'jpg','hunterviktor-59.jpg',NULL,'public','2019-02-06 18:20:53'),(89,'hunterviktor-70',NULL,'huntingimages',6320332,'jpg','hunterviktor-70.jpg',NULL,'public','2019-02-06 18:29:00'),(90,'hunterjohan-69',NULL,'huntingimages',3511165,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-06 21:13:42'),(91,'hunterjohan-69',NULL,'huntingimages',2910591,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-06 21:14:26'),(92,'hunterjohan-69',NULL,'huntingimages',2910591,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-06 21:15:09'),(93,'hunterjohan-69',NULL,'huntingimages',3511165,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-06 21:16:41'),(94,'hunterjohan-69',NULL,'huntingimages',4154933,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-06 21:17:04'),(95,'hunterjohan-69',NULL,'huntingimages',3949224,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-06 21:17:33'),(96,'hunterjohan-69',NULL,'huntingimages',2910591,'JPG','hunterjohan-69.JPG',NULL,'public','2019-02-06 21:18:08'),(97,'hunterjohan-72',NULL,'huntingimages',7731458,'JPG','hunterjohan-72.JPG',NULL,'public','2019-02-06 21:28:29'),(98,'hunterjohan-73',NULL,'huntingimages',294876,'jpg','hunterjohan-73.jpg',NULL,'public','2019-02-07 13:22:53'),(99,'hunterviktor-74',NULL,'huntingimages',4389602,'jpg','hunterviktor-74.jpg',NULL,'public','2019-02-14 12:51:13'),(100,'hunterviktor-74',NULL,'huntingimages',4389602,'jpg','hunterviktor-74.jpg',NULL,'public','2019-02-14 12:53:00'),(101,'hunterviktor-75',NULL,'huntingimages',5835028,'jpg','hunterviktor-75.jpg',NULL,'public','2019-03-16 12:47:17'),(102,'hunterjohan-76',NULL,'huntingimages',1174646,'jpeg','hunterjohan-76.jpeg',NULL,'public','2019-05-28 22:03:05'),(103,'hunterjohan-78',NULL,'huntingimages',7308939,'JPG','hunterjohan-78.JPG',NULL,'public','2019-10-18 15:52:51'),(104,'hunterjohan-82',NULL,'huntingimages',246206,'jpg','hunterjohan-82.jpg',NULL,'public','2019-10-23 17:47:08'),(105,'hunter-83',NULL,'huntingimages',3224380,'jpg','hunter-83.jpg',NULL,'public','2019-11-09 18:02:34'),(106,'hunterjohan-84',NULL,'huntingimages',7688668,'JPG','hunterjohan-84.JPG',NULL,'public','2019-11-09 18:05:23'),(107,'hunter-85',NULL,'huntingimages',5621443,'JPG','hunter-85.JPG',NULL,'public','2019-11-16 13:54:20'),(108,'hunterjohan-85',NULL,'huntingimages',5792460,'JPG','hunterjohan-85.JPG',NULL,'public','2019-11-16 13:55:01'),(109,'hunterjohan-85',NULL,'huntingimages',6335824,'JPG','hunterjohan-85.JPG',NULL,'public','2019-11-16 13:55:59'),(110,'hunterjohan-87',NULL,'huntingimages',8366075,'JPG','hunterjohan-87.JPG',NULL,'public','2019-11-30 16:56:36'),(111,'hunterjohan-88',NULL,'huntingimages',9315301,'JPG','hunterjohan-88.JPG',NULL,'public','2019-11-30 16:57:22'),(112,'hunterjohan-89',NULL,'huntingimages',7213904,'JPG','hunterjohan-89.JPG',NULL,'public','2019-12-04 14:53:01'),(113,'hunterjohan-91',NULL,'huntingimages',5140158,'jpg','hunterjohan-91.jpg',NULL,'public','2020-01-19 15:31:04'),(114,'hunterjohan-91',NULL,'huntingimages',6754372,'JPG','hunterjohan-91.JPG',NULL,'public','2020-01-19 15:31:56'),(115,'hunterjohan-92',NULL,'huntingimages',5140158,'jpg','hunterjohan-92.jpg',NULL,'public','2020-01-19 15:32:55'),(116,'hunterjohan-94',NULL,'huntingimages',8521689,'JPG','hunterjohan-94.JPG',NULL,'public','2020-01-20 12:40:57'),(117,'hunterjohan-94',NULL,'huntingimages',10777203,'JPG','hunterjohan-94.JPG',NULL,'public','2020-01-20 12:42:02'),(118,'hunterviktor-95',NULL,'huntingimages',1224694,'JPG','hunterviktor-95.JPG',NULL,'public','2020-01-30 12:03:05'),(119,'hunterjohan-97',NULL,'huntingimages',1027168,'jpeg','hunterjohan-97.jpeg',NULL,'public','2020-02-09 12:17:57'),(120,'hunterviktor-98',NULL,'huntingimages',745845,'JPG','hunterviktor-98.JPG',NULL,'public','2020-02-15 08:59:07'),(121,'hunterjohan-96',NULL,'huntingimages',7634369,'jpg','hunterjohan-96.jpg',NULL,'public','2020-02-15 19:41:14'),(122,'hunterjohan-96',NULL,'huntingimages',7611922,'jpg','hunterjohan-96.jpg',NULL,'public','2020-02-15 19:42:46'),(123,'hunterjohan-96',NULL,'huntingimages',2587682,'JPG','hunterjohan-96.JPG',NULL,'public','2020-02-15 19:44:40'),(124,'hunterjohan-96',NULL,'huntingimages',2587686,'JPG','hunterjohan-96.JPG',NULL,'public','2020-02-15 19:46:04'),(125,'hunterviktor-99',NULL,'huntingimages',5668088,'jpg','hunterviktor-99.jpg',NULL,'public','2020-03-02 19:00:17');
/*!40000 ALTER TABLE `SRImage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SRImageportfolio`
--

DROP TABLE IF EXISTS `SRImageportfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRImageportfolio` (
  `id` int(11) NOT NULL DEFAULT '0',
  `account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `account` (`account`),
  CONSTRAINT `SRImageportfolio_ibfk_1` FOREIGN KEY (`account`) REFERENCES `SRAccounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRImageportfolio`
--

LOCK TABLES `SRImageportfolio` WRITE;
/*!40000 ALTER TABLE `SRImageportfolio` DISABLE KEYS */;
INSERT INTO `SRImageportfolio` VALUES (2,2),(11,11),(12,12),(13,13);
/*!40000 ALTER TABLE `SRImageportfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SRImagerow`
--

DROP TABLE IF EXISTS `SRImagerow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRImagerow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageportfolio` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imageportfolio` (`imageportfolio`),
  KEY `image` (`image`),
  CONSTRAINT `SRImagerow_ibfk_1` FOREIGN KEY (`imageportfolio`) REFERENCES `SRImageportfolio` (`id`),
  CONSTRAINT `SRImagerow_ibfk_2` FOREIGN KEY (`image`) REFERENCES `SRImage` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRImagerow`
--

LOCK TABLES `SRImagerow` WRITE;
/*!40000 ALTER TABLE `SRImagerow` DISABLE KEYS */;
/*!40000 ALTER TABLE `SRImagerow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SRKillreport`
--

DROP TABLE IF EXISTS `SRKillreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRKillreport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actor` int(11) DEFAULT NULL,
  `from_account` int(11) DEFAULT NULL,
  `for_account` int(11) DEFAULT NULL,
  `kindofhunt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `animal` int(11) DEFAULT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `killdate` timestamp NULL DEFAULT NULL,
  `season` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` text COLLATE utf8mb4_unicode_ci,
  `longitud` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitud` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'yellow',
  `locked` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `from_account` (`from_account`),
  KEY `for_account` (`for_account`),
  KEY `animal` (`animal`),
  CONSTRAINT `SRKillreport_ibfk_1` FOREIGN KEY (`from_account`) REFERENCES `SRAccounts` (`id`),
  CONSTRAINT `SRKillreport_ibfk_2` FOREIGN KEY (`for_account`) REFERENCES `SRAccounts` (`id`),
  CONSTRAINT `SRKillreport_ibfk_3` FOREIGN KEY (`animal`) REFERENCES `SRAnimal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRKillreport`
--

LOCK TABLES `SRKillreport` WRITE;
/*!40000 ALTER TABLE `SRKillreport` DISABLE KEYS */;
INSERT INTO `SRKillreport` VALUES (1,11,11,11,'Ensamjakt',1,'hunterviktor-1.jpg','2017-10-19 22:00:00','17/18','2','Stora gärdet ','15.38111111','58.91638889','green','yes','2017-10-20 21:34:19',NULL,NULL),(2,11,11,18,'Ensamjakt',2,'hunterviktor-2.jpg','2017-10-20 22:00:00','17/18','1','Tornet. Jannesberg ',NULL,NULL,'green','yes','2017-10-22 16:32:17',NULL,NULL),(3,2,2,11,'Ensamjakt',3,'hunterjohan-3.JPG','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ','15.38667389','58.90659194','green','yes','2017-10-24 18:07:12',NULL,NULL),(4,12,12,12,'Ensamjakt',4,'hunterpeter-4.JPG','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:03:43',NULL,'2017-10-25 15:07:32'),(5,12,12,12,'Ensamjakt',5,'hunterpeter-5.JPG','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:08:58',NULL,'2017-10-25 15:16:12'),(6,12,12,12,'Ensamjakt',6,'hunterjohan-6.jpg','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ','15.38199972','58.91014694','green','yes','2017-10-25 17:17:04',NULL,NULL),(7,12,12,12,'Ensamjakt',7,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:18:36',NULL,'2017-10-25 15:18:45'),(8,2,2,11,'Ensamjakt',8,'hunterjohan-8.jpg','2017-10-10 22:00:00','17/18','1','Hygget mellan kojan och stenmurshålet ','15.36166667','58.91083056','green','yes','2017-10-26 16:50:53',NULL,NULL),(9,11,11,11,'Ensamjakt',9,'hunterviktor-9.jpg','2017-09-22 22:00:00','17/18','2','Stora gärdet ','15.42083333','58.90166667','green','yes','2017-10-27 17:16:38',NULL,NULL),(10,2,2,19,'Gemensam jakt',10,'hunterjohan-10.JPG','2017-11-24 22:00:00','17/18','1','Tornet Jannesberg','15.37934806','58.90904889','green','yes','2017-11-25 17:25:53',NULL,NULL),(11,2,2,2,'Ensamjakt',11,'hunterjohan-11.jpg','2017-11-25 22:00:00','17/18','2','Bak vedboden','15.42282778','58.90117778','green','yes','2017-11-26 13:42:48',NULL,NULL),(12,2,2,11,'Ensamjakt',12,'hunterjohan-12.JPG','2017-11-25 22:00:00','17/18','2','Långåkern nordvästra','15.37839833','58.916235','green','yes','2017-11-26 17:00:25',NULL,NULL),(13,11,11,20,'Ensamjakt',13,'hunterviktor-13.jpg','2017-12-01 22:00:00','17/18','1','Stenmursh&aring;let ',NULL,NULL,'yellow','no','2017-12-02 19:42:18',NULL,'2017-12-02 17:44:50'),(14,11,11,20,'Ensamjakt',14,'hunterviktor-14.jpg','2017-12-01 22:00:00','17/18','1','Stenmurshålet',NULL,NULL,'green','yes','2017-12-02 19:46:13',NULL,NULL),(15,2,2,2,'Ensamjakt',15,'hunterjohan-15.jpg','2017-12-02 22:00:00','17/18','2','Götes kulle','15.38497639','58.91536333','green','yes','2017-12-03 17:21:41',NULL,NULL),(16,2,2,11,'Ensamjakt',16,'hunterjohan-16.JPG','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'yellow','yes','2017-12-11 18:38:22',NULL,NULL),(17,2,2,12,'Gemensam jakt',17,'hunterjohan-17.jpg','2017-09-30 22:00:00','17/18','1','Vändplan mossen',NULL,NULL,'green','yes','2017-12-11 21:07:15',NULL,NULL),(18,2,2,2,'Ensamjakt',18,'hunterjohan-18.JPG','2017-12-16 22:00:00','17/18','1','Bunten snickis ',NULL,NULL,'green','yes','2017-12-17 19:16:47',NULL,NULL),(19,NULL,NULL,NULL,NULL,NULL,'default.png',NULL,NULL,NULL,NULL,NULL,NULL,'yellow',NULL,'2017-12-17 19:33:37',NULL,NULL),(20,2,2,2,'Ensamjakt',19,'hunterjohan-20.JPG','2017-12-16 22:00:00','17/18','2','Gärdet öster glotterbäck ','15.39153389','58.914975','yellow','no','2017-12-18 07:40:17',NULL,NULL),(21,11,11,21,'Ensamjakt',20,'hunterviktor-21.jpg','2017-12-26 22:00:00','17/18','1','Hygget söder om kojan.',NULL,NULL,'green','yes','2017-12-27 17:32:46',NULL,NULL),(22,2,2,2,'Gemensam jakt',21,'hunterjohan-22.jpg','2017-12-28 22:00:00','17/18','1','Tornet stenmurshålet ','15.3625','58.90805278','green','yes','2017-12-29 10:21:40',NULL,NULL),(23,11,11,11,'Ensamjakt',22,'hunterviktor-23.jpg','2018-01-02 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'green','yes','2018-01-03 20:08:42',NULL,NULL),(24,13,13,11,'Ensamjakt',23,'hunterviktor-24.jpg','2018-01-07 22:00:00','17/18','1','Kroken',NULL,NULL,'green','yes','2018-01-08 16:41:59',NULL,NULL),(25,NULL,NULL,NULL,NULL,NULL,'default.png',NULL,NULL,NULL,NULL,NULL,NULL,'green','yes','2018-01-08 18:23:43',NULL,NULL),(26,NULL,NULL,NULL,NULL,NULL,'default.png',NULL,NULL,NULL,NULL,NULL,NULL,'green','yes','2018-01-08 18:23:43',NULL,NULL),(27,2,2,12,'Gemensam jakt',24,'hunterjohan-27.JPG','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen','15.36611111','58.90416667','green','yes','2018-01-16 11:28:55',NULL,NULL),(28,2,2,16,'Ensamjakt',25,'hunterviktor-28.jpg','2018-01-16 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'green','yes','2018-01-17 17:25:06',NULL,NULL),(29,2,2,11,'Ensamjakt',26,'hunterviktor-29.jpg','2018-01-16 22:00:00','17/18','2','Johans torn stora gärdet',NULL,NULL,'green','yes','2018-01-17 17:47:59',NULL,NULL),(30,12,12,12,'Gemensam jakt',27,'default.png','2018-01-13 22:00:00','17/18','1','Tornet innan rönna ',NULL,NULL,'yellow','no','2018-01-20 21:26:32',NULL,'2018-01-23 04:44:33'),(31,11,11,11,'Ensamjakt',28,'hunterviktor-31.jpg','2018-01-22 22:00:00','17/18','1','Mossen vändplan',NULL,NULL,'green','yes','2018-01-23 18:12:03',NULL,NULL),(32,2,2,12,'Gemensam jakt',29,'hunterjohan-32.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle','15.385105','58.91450028','green','yes','2018-01-28 10:14:46',NULL,NULL),(33,2,2,12,'Gemensam jakt',30,'hunterjohan-33.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle','15.385105','58.91450028','yellow','no','2018-01-28 15:49:35',NULL,NULL),(34,2,2,16,'Gemensam jakt',31,'hunterjohan-34.jpg','2018-01-27 22:00:00','17/18','1','Norr om akvägen inför rönnen en bit','15.36936306','58.90371694','green','yes','2018-01-28 15:56:00',NULL,NULL),(35,2,2,11,'Gemensam jakt',32,'hunterjohan-35.JPG','2018-02-02 22:00:00','17/18','1','Gustaf-Adolfstorg','15.34046528','58.90676222','green','yes','2018-02-03 13:53:47',NULL,NULL),(36,2,2,13,'Ensamjakt',33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan','15.38937722','58.90540694','green','yes','2018-02-16 18:28:31',NULL,NULL),(37,2,2,22,'Gemensam jakt',34,'hunterjohan-37.jpeg','2018-02-16 22:00:00','17/18','1','Stenarna bortanför grusgropen ',NULL,NULL,'green','yes','2018-02-18 19:53:13',NULL,NULL),(38,2,2,2,'Ensamjakt',35,'hunterjohan-38.JPG','2018-02-20 22:00:00','17/18','1','Snickis','15.39619222','58.91275139','green','yes','2018-02-21 22:19:46',NULL,NULL),(39,2,2,2,'Ensamjakt',36,'hunterjohan-39.jpg','2018-02-23 22:00:00','17/18','2','Johans torn','15.382775','58.91580889','yellow','no','2018-02-24 19:27:01',NULL,NULL),(40,10,11,10,'Ensamjakt',37,'hunterviktor-40.jpg','2018-03-15 22:00:00','17/18','5','Ralatorpet',NULL,NULL,'green','no','2018-03-20 12:00:12',NULL,NULL),(41,2,2,2,'Ensamjakt',38,'hunterjohan-41.JPG','2018-08-06 22:00:00','18/19','2','Östra gärdet ','15.39254694','58.91481611','yellow','no','2018-08-09 17:35:52',NULL,NULL),(42,2,2,11,'Ensamjakt',39,'hunterjohan-42.jpg','2018-09-16 00:00:00','18/19','1','Mellan kroken och grusgropen',NULL,NULL,'green','no','2018-09-17 10:27:49',NULL,NULL),(43,2,2,18,'Gemensam jakt',40,'hunterjohan-43.JPG','2018-10-20 00:00:00','18/19','1','Tornet innan rönnen ',NULL,NULL,'green','yes','2018-10-20 09:58:38',NULL,NULL),(44,2,2,2,'Ensamjakt',41,'hunterjohan-44.jpeg','2018-11-03 00:00:00','18/19','2','Stora gärdet','15.38303889','58.91552306','yellow','no','2018-11-07 08:20:20',NULL,NULL),(45,2,2,2,'Gemensam jakt',42,'hunterjohan-45.JPG','2018-11-17 00:00:00','18/19','1','Mittentornet mellan kojan och rönnen','15.36455306','58.90470806','green','yes','2018-11-18 08:15:55',NULL,NULL),(46,2,2,18,'Gemensam jakt',43,'hunterjohan-46.jpeg','2018-11-17 00:00:00','18/19','1','Mossevändplan',NULL,NULL,'green','yes','2018-11-18 11:37:03',NULL,NULL),(47,2,2,11,'Ensamjakt',44,'hunterjohan-47.JPG','2019-01-02 00:00:00','18/19','1','Grusgropsvägen',NULL,NULL,'green','yes','2019-01-02 20:16:21',NULL,NULL),(48,2,2,12,'Ensamjakt',45,'hunterjohan-48.JPG','2019-01-01 00:00:00','18/19','1','Nedre vändplan grusgropsvägen','15.38955389','58.90537694','green','yes','2019-01-02 20:18:49',NULL,NULL),(49,2,2,15,'Gemensam jakt',46,'hunterjohan-49.JPG','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen','15.40111722','58.91345389','green','yes','2019-01-05 08:37:52',NULL,NULL),(50,2,2,18,'Gemensam jakt',47,'hunterjohan-50.JPG','2019-01-05 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'green','yes','2019-01-07 07:43:35',NULL,NULL),(51,2,2,12,'Gemensam jakt',48,'hunterjohan-51.JPG','2018-12-29 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'green','yes','2019-01-09 15:22:57',NULL,NULL),(52,2,2,11,'Ensamjakt',49,'hunterjohan-52.JPG','2019-01-13 00:00:00','18/19','1','Götes torn mossen','15.354685','58.90697889','green','yes','2019-01-13 16:34:58',NULL,NULL),(53,2,2,19,'Gemensam jakt',50,'hunterjohan-53.JPG','2019-01-12 00:00:00','18/19','1','Stolpen slaggis','15.35394722','58.91067028','green','yes','2019-01-13 16:38:40',NULL,NULL),(54,2,2,19,'Gemensam jakt',51,'hunterjohan-54.jpeg','2019-01-12 00:00:00','18/19','1','Passet inför vändplan ak-vägen','15.38437306','58.90063611','green','yes','2019-01-13 16:41:44',NULL,NULL),(55,2,2,19,'Gemensam jakt',52,'hunterjohan-55.jpeg','2019-01-05 00:00:00','18/19','1','Ledningen snickarbo','15.40259694','58.91292889','green','yes','2019-01-13 17:19:15',NULL,NULL),(56,2,2,19,'Gemensam jakt',53,'default.png','2019-01-05 00:00:00','18/19','1','Ledningen snickis',NULL,NULL,'yellow','no','2019-01-13 17:25:13',NULL,'2019-01-13 17:25:32'),(57,2,2,2,'Ensamjakt',54,'hunterjohan-57.JPG','2019-01-18 00:00:00','18/19','2','Stora gärdet ',NULL,NULL,'yellow','no','2019-01-19 09:55:31',NULL,NULL),(58,2,2,11,'Gemensam jakt',55,'hunterjohan-58.JPG','2019-01-26 00:00:00','18/19','1','Mitten passet mossen ak-v&auml;gen',NULL,NULL,'green','yes','2019-01-26 08:42:12',NULL,NULL),(59,2,2,11,'Ensamjakt',56,'hunterviktor-59.jpg','2018-12-21 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'green','yes','2019-01-26 18:48:50',NULL,NULL),(60,2,2,19,'Ensamjakt',57,'hunterjohan-60.jpeg','2019-01-10 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'green','yes','2019-01-26 19:55:40',NULL,NULL),(61,2,2,24,'Gemensam jakt',58,'hunterjohan-61.JPG','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'green','yes','2019-01-26 20:02:26',NULL,NULL),(62,2,2,24,'Gemensam jakt',59,'hunterjohan-62.JPG','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'green','yes','2019-01-26 20:04:46',NULL,NULL),(63,2,2,2,'Ensamjakt',60,'hunterjohan-63.jpg','2018-08-18 00:00:00','18/19','5','',NULL,NULL,'yellow','no','2019-01-27 10:20:16',NULL,NULL),(64,2,2,2,'Ensamjakt',61,'hunterjohan-64.jpeg','2018-05-04 00:00:00','17/18','2','Stora gärdet',NULL,NULL,'green','no','2019-01-29 15:11:25',NULL,NULL),(65,2,2,23,'Gemensam jakt',62,'hunterjohan-65.JPG','2019-01-30 00:00:00','18/19','1','Mossen',NULL,NULL,'green','yes','2019-01-30 11:49:52',NULL,NULL),(66,11,2,19,'Gemensam jakt',63,'hunterjohan-66.JPG','2019-01-30 00:00:00','18/19','1','Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan (Mats Johansson vart tilldelad k&ouml;ttet.)\r\n',NULL,NULL,'green','yes','2019-01-30 11:51:36',NULL,NULL),(67,2,2,19,'Gemensam jakt',64,'hunterjohan-67.JPG','2019-01-30 00:00:00','18/19','1','Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan ',NULL,NULL,'green','yes','2019-01-30 11:53:21',NULL,NULL),(68,2,2,11,'Gemensam jakt',65,'hunterjohan-68.JPG','2019-01-26 00:00:00','18/19','1','Mellan första och andra i mossen ak-vägen',NULL,NULL,'green','yes','2019-01-30 11:55:02',NULL,NULL),(69,2,2,11,'Ensamjakt',66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-04 17:43:09',NULL,NULL),(70,2,2,19,'Gemensam jakt',67,'hunterviktor-70.jpg','2019-01-05 00:00:00','18/19','1','Andra passet bak ångsågen',NULL,NULL,'green','yes','2019-02-06 18:26:16',NULL,NULL),(71,2,2,18,'Ensamjakt',68,'default.png','2018-09-01 00:00:00','18/19','1','Tornet jannesberg',NULL,NULL,'green','yes','2019-02-06 18:34:59',NULL,NULL),(72,2,2,11,'Ensamjakt',69,'hunterjohan-72.JPG','2018-10-10 00:00:00','18/19','1','Hygget mellan stenmurshålet och kojan',NULL,NULL,'green','no','2019-02-06 18:40:53',NULL,NULL),(73,2,2,12,'Gemensam jakt',70,'hunterjohan-73.jpg','2018-11-17 00:00:00','18/19','1','Mittenpasset mossen ak-vägen','15.37374611','58.90157694','green','yes','2019-02-07 13:20:18',NULL,NULL),(74,11,11,11,'Ensamjakt',71,'hunterviktor-74.jpg','2019-02-06 00:00:00','18/19','1','Årsgris skjuten foderplats/åteln nedrevändplan\r\n',NULL,NULL,'yellow','no','2019-02-14 12:48:13',NULL,NULL),(75,11,11,11,'Ensamjakt',72,'hunterviktor-75.jpg','2019-03-05 00:00:00','18/19','1','Grusgropen ',NULL,NULL,'yellow','no','2019-03-16 12:45:20',NULL,NULL),(76,2,2,11,'Ensamjakt',73,'hunterjohan-76.jpeg','2019-05-28 00:00:00','18/19','2','Kents torn stora gärdet',NULL,NULL,'yellow','no','2019-05-28 22:02:42',NULL,NULL),(77,11,11,15,'Ensamjakt',74,'default.png','2019-04-28 00:00:00','18/19','1','vildsvin gylta',NULL,NULL,'yellow','no','2019-10-05 20:52:24',NULL,NULL),(78,2,2,12,'Gemensam jakt',75,'hunterjohan-78.JPG','2019-10-12 00:00:00','19/20','1','Mossen akvägen mellan första och andra passet',NULL,NULL,'green','no','2019-10-18 15:48:38',NULL,NULL),(79,2,2,11,'Gemensam jakt',76,'default.png','2019-10-19 00:00:00','19/20','1','Mellan första och andra passet en bit ut i mossen akvägen ',NULL,NULL,'green','yes','2019-10-19 16:34:58',NULL,NULL),(80,2,2,2,'Gemensam jakt',77,'default.png','2019-10-19 00:00:00','19/20','1','Stubbarna grusgropsvägen ',NULL,NULL,'green','yes','2019-10-19 16:35:47',NULL,NULL),(81,2,2,2,'Ensamjakt',78,'default.png','2019-10-18 00:00:00','19/20','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-10-19 16:36:37',NULL,NULL),(82,2,2,19,'Ensamjakt',79,'hunterjohan-82.jpg','2019-10-23 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'green','yes','2019-10-23 17:46:27',NULL,NULL),(83,2,2,25,'Ensamjakt',80,'hunter-83.jpg','2019-11-09 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'green','yes','2019-11-09 16:52:33',NULL,NULL),(84,2,2,12,'Gemensam jakt',81,'hunterjohan-84.JPG','2019-11-03 00:00:00','19/20','1','Hygget nedom tornet jannesberg',NULL,NULL,'green','yes','2019-11-09 18:04:41',NULL,NULL),(85,2,2,12,'Gemensam jakt',82,'hunterjohan-85.JPG','2019-11-16 00:00:00','19/20','1','Andra tornet efter kojan',NULL,NULL,'green','yes','2019-11-16 11:45:00',NULL,NULL),(86,2,2,26,'Gemensam jakt',83,'default.png','2019-11-30 00:00:00','19/20','1','Snickarbo',NULL,NULL,'green','yes','2019-11-30 08:52:39',NULL,NULL),(87,2,2,11,'Gemensam jakt',84,'hunterjohan-87.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen',NULL,NULL,'green','yes','2019-11-30 10:21:25',NULL,NULL),(88,2,2,11,'Gemensam jakt',85,'hunterjohan-88.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen ',NULL,NULL,'green','yes','2019-11-30 10:22:13',NULL,NULL),(89,2,2,19,'Gemensam jakt',86,'hunterjohan-89.JPG','2019-11-30 00:00:00','19/20','1','Bj&ouml;rken snickarbohagen ',NULL,NULL,'green','yes','2019-11-30 10:23:07',NULL,NULL),(90,2,2,26,'Gemensam jakt',87,'default.png','2019-11-30 00:00:00','19/20','1','Mellan kojan och mossevägen',NULL,NULL,'green','yes','2019-12-01 19:52:12',NULL,NULL),(91,2,2,2,'Gemensam jakt',88,'hunterjohan-91.JPG','2020-01-19 00:00:00','19/20','1','Kullen vid Anders mårdfälla stenmurshålet',NULL,NULL,'green','yes','2020-01-19 11:42:05',NULL,NULL),(92,2,2,12,'Gemensam jakt',89,'hunterjohan-92.jpg','2020-01-19 00:00:00','19/20','1','Brandgatan',NULL,NULL,'green','yes','2020-01-19 15:30:33',NULL,NULL),(93,11,11,11,'Ensamjakt',90,'default.png','2019-12-31 00:00:00','19/20','1','Nedre vändplan\r\n',NULL,NULL,'green','yes','2020-01-20 08:58:03',NULL,NULL),(94,2,2,27,'Gemensam jakt',91,'hunterjohan-94.JPG','2019-12-14 00:00:00','19/20','1','Tornet stenmurshålet',NULL,NULL,'green','yes','2020-01-20 12:39:56',NULL,NULL),(95,2,2,11,'Gemensam jakt',92,'hunterviktor-95.JPG','2020-01-26 00:00:00','19/20','1','I början av mossevägen',NULL,NULL,'green','yes','2020-01-26 12:50:41',NULL,NULL),(96,11,11,10,'Gemensam jakt',93,'hunterjohan-96.JPG','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'green','no','2020-02-04 16:49:05',NULL,NULL),(97,2,2,28,'Ensamjakt',94,'hunterjohan-97.jpeg','2020-02-08 00:00:00','19/20','1','Pentagon ',NULL,NULL,'green','yes','2020-02-08 23:06:05',NULL,NULL),(98,11,11,27,'Ensamjakt',95,'hunterviktor-98.JPG','2020-02-13 00:00:00','19/20','1','Nedre vändplan Viktor och robin satt ihop i pentagon',NULL,NULL,'green','yes','2020-02-15 08:58:43',NULL,NULL),(99,11,11,11,'Ensamjakt',96,'hunterviktor-99.jpg','2020-02-27 00:00:00','19/20','1','Hygget vid Kristin ',NULL,NULL,'green','yes','2020-03-02 18:59:20',NULL,NULL);
/*!40000 ALTER TABLE `SRKillreport` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER SRInsertKillreportLogg   
AFTER INSERT ON SRKillreport FOR EACH ROW
 
BEGIN
 	DECLARE killreport INTEGER;
    DECLARE actor INTEGER;
    DECLARE typeofchange VARCHAR(100);
    DECLARE from_account INTEGER;
    DECLARE for_account INTEGER;
    DECLARE animal INTEGER;
    DECLARE image VARCHAR(500);
    DECLARE killdate TIMESTAMP;
    DECLARE season VARCHAR(50);
    DECLARE area VARCHAR(500);
    DECLARE place TEXT;
    DECLARE longitud VARCHAR(100);
	DECLARE latitud VARCHAR(100);
    DECLARE report_status VARCHAR(50);
    DECLARE locked VARCHAR(10);
	SELECT NEW.id INTO killreport;
    SELECT NEW.actor INTO actor;
    SELECT NEW.from_account INTO from_account;
	SELECT NEW.for_account INTO for_account;
    SELECT NEW.animal INTO animal;
    SELECT NEW.image INTO image;
    SELECT NEW.killdate INTO killdate;
    SELECT NEW.season INTO season;
    SELECT NEW.area INTO area;
    SELECT NEW.place INTO place;
    SELECT NEW.longitud INTO longitud;
    SELECT NEW.latitud INTO latitud;
    SELECT NEW.report_status INTO report_status;
    SELECT NEW.locked INTO locked;

	INSERT INTO SRKillreportLogg (killreport, actor, typeofchange, from_account, for_account, animal, image, killdate, season, area, place, longitud, latitud, report_status, locked) 
							 VALUES (killreport, actor, 'INSERT', from_account, for_account, animal, image, killdate, season, area, place, longitud, latitud, report_status, locked);     
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER SRUpdateKillreportLogg   
AFTER UPDATE ON SRKillreport FOR EACH ROW
 
BEGIN
 	DECLARE killreport INTEGER;
    DECLARE actor INTEGER;
    DECLARE typeofchange VARCHAR(100);
    DECLARE from_account INTEGER;
    DECLARE for_account INTEGER;
    DECLARE animal INTEGER;
    DECLARE image VARCHAR(500);
    DECLARE killdate TIMESTAMP;
    DECLARE season VARCHAR(50);
    DECLARE area VARCHAR(500);
    DECLARE place TEXT;
    DECLARE longitud VARCHAR(100);
	DECLARE latitud VARCHAR(100);
    DECLARE report_status VARCHAR(50);
    DECLARE locked VARCHAR(10);
	SELECT NEW.id INTO killreport;
    SELECT NEW.actor INTO actor;
    SELECT NEW.from_account INTO from_account;
	SELECT NEW.for_account INTO for_account;
    SELECT NEW.animal INTO animal;
    SELECT NEW.image INTO image;
    SELECT NEW.killdate INTO killdate;
    SELECT NEW.season INTO season;
    SELECT NEW.area INTO area;
    SELECT NEW.place INTO place;
    SELECT NEW.longitud INTO longitud;
    SELECT NEW.latitud INTO latitud;
    SELECT NEW.report_status INTO report_status;
    SELECT NEW.locked INTO locked;

	INSERT INTO SRKillreportLogg (killreport, actor, typeofchange, from_account, for_account, animal, image, killdate, season, area, place, longitud, latitud, report_status, locked) 
							 VALUES (killreport, actor, 'UPDATE', from_account, for_account, animal, image, killdate, season, area, place, longitud, latitud, report_status, locked);     
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `SRKillreportLogg`
--

DROP TABLE IF EXISTS `SRKillreportLogg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRKillreportLogg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `killreport` int(11) DEFAULT NULL,
  `actor` int(11) DEFAULT NULL,
  `typeofchange` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_account` int(11) DEFAULT NULL,
  `for_account` int(11) DEFAULT NULL,
  `kindofhunt` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `animal` int(11) DEFAULT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'default.png',
  `killdate` timestamp NULL DEFAULT NULL,
  `season` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `place` text COLLATE utf8mb4_unicode_ci,
  `longitud` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitud` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `report_status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'yellow',
  `locked` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'no',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `killreport` (`killreport`),
  KEY `from_account` (`from_account`),
  KEY `for_account` (`for_account`),
  KEY `animal` (`animal`),
  CONSTRAINT `SRKillreportLogg_ibfk_1` FOREIGN KEY (`killreport`) REFERENCES `SRKillreport` (`id`),
  CONSTRAINT `SRKillreportLogg_ibfk_2` FOREIGN KEY (`from_account`) REFERENCES `SRAccounts` (`id`),
  CONSTRAINT `SRKillreportLogg_ibfk_3` FOREIGN KEY (`for_account`) REFERENCES `SRAccounts` (`id`),
  CONSTRAINT `SRKillreportLogg_ibfk_4` FOREIGN KEY (`animal`) REFERENCES `SRAnimal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=453 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRKillreportLogg`
--

LOCK TABLES `SRKillreportLogg` WRITE;
/*!40000 ALTER TABLE `SRKillreportLogg` DISABLE KEYS */;
INSERT INTO `SRKillreportLogg` VALUES (1,1,11,'INSERT',11,11,NULL,1,'default.png','2017-10-19 22:00:00','17/18','2','Stora gärdet ',NULL,NULL,'yellow','no','2017-10-20 21:34:19'),(2,1,11,'UPDATE',11,11,NULL,1,'hunterviktor-1.jpg','2017-10-19 22:00:00','17/18','2','Stora gärdet ',NULL,NULL,'yellow','no','2017-10-20 21:34:46'),(3,1,11,'UPDATE',11,11,NULL,1,'hunterviktor-1.jpg','2017-10-19 22:00:00','17/18','2','Stora gärdet ','15.38111111','58.91638889','yellow','no','2017-10-20 21:35:06'),(4,1,11,'UPDATE',11,11,NULL,1,'hunterviktor-1.jpg','2017-10-19 22:00:00','17/18','2','Stora gärdet ','15.38111111','58.91638889','green','no','2017-10-20 21:35:44'),(5,2,11,'INSERT',11,18,NULL,2,'default.png','2017-10-20 22:00:00','17/18','1','Tornet. Jannesberg ',NULL,NULL,'yellow','no','2017-10-22 16:32:17'),(6,2,11,'UPDATE',11,18,NULL,2,'hunterviktor-2.jpg','2017-10-20 22:00:00','17/18','1','Tornet. Jannesberg ',NULL,NULL,'yellow','no','2017-10-22 16:33:43'),(7,3,2,'INSERT',2,11,NULL,3,'default.png','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ',NULL,NULL,'yellow','no','2017-10-24 18:07:12'),(8,3,2,'UPDATE',2,11,NULL,3,'default.png','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ',NULL,NULL,'green','yes','2017-10-24 18:08:17'),(9,3,2,'UPDATE',2,11,NULL,3,'default.png','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ',NULL,NULL,'green','no','2017-10-24 18:08:50'),(10,3,2,'UPDATE',2,11,NULL,3,'default.png','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ',NULL,NULL,'yellow','no','2017-10-24 18:14:03'),(11,3,2,'UPDATE',2,11,NULL,3,'hunterjohan-3.JPG','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ',NULL,NULL,'yellow','no','2017-10-24 18:21:04'),(12,3,2,'UPDATE',2,11,NULL,3,'hunterjohan-3.JPG','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ','15.38667389','58.90659194','yellow','no','2017-10-24 18:21:14'),(13,3,2,'UPDATE',2,11,NULL,3,'hunterjohan-3.JPG','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ','15.38667389','58.90659194','yellow','yes','2017-10-24 18:21:35'),(14,3,2,'UPDATE',2,11,NULL,3,'hunterjohan-3.JPG','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ','15.38667389','58.90659194','yellow','no','2017-10-24 18:26:40'),(15,3,2,'UPDATE',2,11,NULL,3,'hunterjohan-3.JPG','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ','15.38667389','58.90659194','yellow','yes','2017-10-24 18:27:21'),(16,3,2,'UPDATE',2,11,NULL,3,'hunterjohan-3.JPG','2017-10-08 22:00:00','17/18','1','Innan nedre vändplan på grusgropsvägen ','15.38667389','58.90659194','green','yes','2017-10-24 18:47:58'),(17,4,12,'INSERT',12,12,NULL,4,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:03:43'),(18,4,12,'UPDATE',12,12,NULL,4,'hunterpeter-4.JPG','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:05:32'),(19,4,12,'UPDATE',12,12,NULL,4,'hunterpeter-4.JPG','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:07:32'),(20,5,12,'INSERT',12,12,NULL,5,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:08:58'),(21,5,12,'UPDATE',12,12,NULL,5,'hunterpeter-5.JPG','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:10:49'),(22,5,12,'UPDATE',12,12,NULL,5,'hunterpeter-5.JPG','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:16:12'),(23,6,12,'INSERT',12,12,NULL,6,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:17:04'),(24,7,12,'INSERT',12,12,NULL,7,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:18:36'),(25,7,12,'UPDATE',12,12,NULL,7,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'yellow','no','2017-10-25 17:18:45'),(26,6,12,'UPDATE',12,12,NULL,6,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'green','yes','2017-10-25 17:19:26'),(27,6,12,'UPDATE',12,12,NULL,6,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'green','yes','2017-10-25 17:19:26'),(28,6,12,'UPDATE',12,12,NULL,6,'default.png','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'green','no','2017-10-25 17:20:10'),(29,6,12,'UPDATE',12,12,NULL,6,'hunterpeter-6.JPG','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ',NULL,NULL,'green','no','2017-10-25 17:22:31'),(30,6,12,'UPDATE',12,12,NULL,6,'hunterpeter-6.JPG','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ','15.38199972','58.91014694','green','no','2017-10-25 17:23:27'),(31,6,12,'UPDATE',12,12,NULL,6,'hunterjohan-6.jpg','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ','15.38199972','58.91014694','green','no','2017-10-25 17:25:04'),(32,6,12,'UPDATE',12,12,NULL,6,'hunterjohan-6.jpg','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ','15.38199972','58.91014694','green','yes','2017-10-25 17:27:22'),(33,6,12,'UPDATE',12,12,NULL,6,'hunterjohan-6.jpg','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ','15.38199972','58.91014694','green','no','2017-10-25 17:34:02'),(34,1,11,'UPDATE',11,11,NULL,1,'hunterviktor-1.jpg','2017-10-19 22:00:00','17/18','2','Stora gärdet ','15.38111111','58.91638889','green','yes','2017-10-26 07:15:29'),(35,6,12,'UPDATE',12,12,NULL,6,'hunterjohan-6.jpg','2017-10-08 22:00:00','17/18','1','Tornet vid jannesberg. ','15.38199972','58.91014694','green','yes','2017-10-26 07:15:34'),(36,8,2,'INSERT',2,11,NULL,8,'default.png','2017-10-10 22:00:00','17/18','1','Hygget mellan kojan och stenmurshålet ',NULL,NULL,'yellow','no','2017-10-26 16:50:53'),(37,8,2,'UPDATE',2,11,NULL,8,'hunterjohan-8.jpg','2017-10-10 22:00:00','17/18','1','Hygget mellan kojan och stenmurshålet ',NULL,NULL,'yellow','no','2017-10-26 16:51:41'),(38,8,2,'UPDATE',2,11,NULL,8,'hunterjohan-8.jpg','2017-10-10 22:00:00','17/18','1','Hygget mellan kojan och stenmurshålet ','15.36166667','58.91083056','yellow','no','2017-10-26 16:51:44'),(39,2,11,'UPDATE',11,18,NULL,2,'hunterviktor-2.jpg','2017-10-20 22:00:00','17/18','1','Tornet. Jannesberg ',NULL,NULL,'green','yes','2017-10-27 17:14:56'),(40,2,11,'UPDATE',11,18,NULL,2,'hunterviktor-2.jpg','2017-10-20 22:00:00','17/18','1','Tornet. Jannesberg ',NULL,NULL,'green','yes','2017-10-27 17:14:56'),(41,9,11,'INSERT',11,11,NULL,9,'default.png','2017-09-22 22:00:00','17/18','2','Stora gärdet ',NULL,NULL,'yellow','no','2017-10-27 17:16:38'),(42,9,11,'UPDATE',11,11,NULL,9,'hunterviktor-9.jpg','2017-09-22 22:00:00','17/18','2','Stora gärdet ',NULL,NULL,'yellow','no','2017-10-27 17:18:06'),(43,9,11,'UPDATE',11,11,NULL,9,'hunterviktor-9.jpg','2017-09-22 22:00:00','17/18','2','Stora gärdet ',NULL,NULL,'green','no','2017-10-27 17:19:12'),(44,8,2,'UPDATE',2,11,NULL,8,'hunterjohan-8.jpg','2017-10-10 22:00:00','17/18','1','Hygget mellan kojan och stenmurshålet ','15.36166667','58.91083056','green','yes','2017-10-27 17:22:52'),(45,8,2,'UPDATE',2,11,NULL,8,'hunterjohan-8.jpg','2017-10-10 22:00:00','17/18','1','Hygget mellan kojan och stenmurshålet ','15.36166667','58.91083056','green','yes','2017-10-27 17:22:52'),(46,9,11,'UPDATE',11,11,NULL,9,'hunterviktor-9.jpg','2017-09-22 22:00:00','17/18','2','Stora gärdet ','15.42083333','58.90166667','green','no','2017-10-27 19:39:17'),(47,9,11,'UPDATE',11,11,NULL,9,'hunterviktor-9.jpg','2017-09-22 22:00:00','17/18','2','Stora gärdet ','15.42083333','58.90166667','green','yes','2017-11-02 14:04:56'),(48,10,2,'INSERT',2,19,NULL,10,'default.png','2017-11-24 22:00:00','17/18','1','Tornet Jannesberg',NULL,NULL,'yellow','no','2017-11-25 17:25:53'),(49,10,2,'UPDATE',2,19,NULL,10,'hunterjohan-10.JPG','2017-11-24 22:00:00','17/18','1','Tornet Jannesberg',NULL,NULL,'yellow','no','2017-11-25 17:29:11'),(50,10,2,'UPDATE',2,19,NULL,10,'hunterjohan-10.JPG','2017-11-24 22:00:00','17/18','1','Tornet Jannesberg','15.37934806','58.90904889','yellow','no','2017-11-25 17:29:17'),(51,10,2,'UPDATE',2,19,NULL,10,'hunterjohan-10.JPG','2017-11-24 22:00:00','17/18','1','Tornet Jannesberg','15.37934806','58.90904889','green','yes','2017-11-25 20:56:15'),(52,10,2,'UPDATE',2,19,NULL,10,'hunterjohan-10.JPG','2017-11-24 22:00:00','17/18','1','Tornet Jannesberg','15.37934806','58.90904889','green','yes','2017-11-25 20:56:15'),(53,11,2,'INSERT',2,2,NULL,11,'default.png','2017-11-25 22:00:00','17/18','2','Bak vedboden',NULL,NULL,'yellow','no','2017-11-26 13:42:48'),(54,11,2,'UPDATE',2,2,NULL,11,'hunterjohan-11.jpg','2017-11-25 22:00:00','17/18','2','Bak vedboden',NULL,NULL,'yellow','no','2017-11-26 13:43:08'),(55,11,2,'UPDATE',2,2,NULL,11,'hunterjohan-11.jpg','2017-11-25 22:00:00','17/18','2','Bak vedboden','15.42282778','58.90117778','yellow','no','2017-11-26 13:43:11'),(56,11,2,'UPDATE',2,2,NULL,11,'hunterjohan-11.jpg','2017-11-25 22:00:00','17/18','2','Bak vedboden','15.42282778','58.90117778','green','no','2017-11-26 13:43:40'),(57,11,2,'UPDATE',2,2,NULL,11,'hunterjohan-11.jpg','2017-11-25 22:00:00','17/18','2','Bak vedboden','15.42282778','58.90117778','green','yes','2017-11-26 13:44:50'),(58,12,2,'INSERT',2,11,NULL,12,'default.png','2017-11-25 22:00:00','17/18','2','Långåkern nordvästra',NULL,NULL,'yellow','no','2017-11-26 17:00:25'),(59,12,2,'UPDATE',2,11,NULL,12,'hunterjohan-12.JPG','2017-11-25 22:00:00','17/18','2','Långåkern nordvästra',NULL,NULL,'yellow','no','2017-11-26 17:02:47'),(60,12,2,'UPDATE',2,11,NULL,12,'hunterjohan-12.JPG','2017-11-25 22:00:00','17/18','2','Långåkern nordvästra','15.37839833','58.916235','yellow','no','2017-11-26 17:02:50'),(61,12,2,'UPDATE',2,11,NULL,12,'hunterjohan-12.JPG','2017-11-25 22:00:00','17/18','2','Långåkern nordvästra','15.37839833','58.916235','green','no','2017-11-26 17:03:05'),(62,12,2,'UPDATE',2,11,NULL,12,'hunterjohan-12.JPG','2017-11-25 22:00:00','17/18','2','Långåkern nordvästra','15.37839833','58.916235','green','yes','2017-11-26 17:03:19'),(63,13,11,'INSERT',11,20,NULL,13,'default.png','2017-12-01 22:00:00','17/18','1','Stenmurshålet ',NULL,NULL,'yellow','no','2017-12-02 19:42:18'),(64,13,11,'UPDATE',11,20,NULL,13,'hunterviktor-13.jpg','2017-12-01 22:00:00','17/18','1','Stenmurshålet ',NULL,NULL,'yellow','no','2017-12-02 19:43:00'),(65,13,11,'UPDATE',11,20,NULL,13,'hunterviktor-13.jpg','2017-12-01 22:00:00','17/18','1','Stenmursh&aring;let ',NULL,NULL,'yellow','no','2017-12-02 19:44:06'),(66,13,11,'UPDATE',11,20,NULL,13,'hunterviktor-13.jpg','2017-12-01 22:00:00','17/18','1','Stenmursh&aring;let ',NULL,NULL,'yellow','no','2017-12-02 19:44:50'),(67,14,11,'INSERT',11,20,NULL,14,'default.png','2017-12-01 22:00:00','17/18','1','Stenmurshålet',NULL,NULL,'yellow','no','2017-12-02 19:46:13'),(68,14,11,'UPDATE',11,20,NULL,14,'hunterviktor-14.jpg','2017-12-01 22:00:00','17/18','1','Stenmurshålet',NULL,NULL,'yellow','no','2017-12-02 19:46:34'),(69,15,2,'INSERT',2,2,NULL,15,'default.png','2017-12-02 22:00:00','17/18','2','Götes kulle',NULL,NULL,'yellow','no','2017-12-03 17:21:41'),(70,15,2,'UPDATE',2,2,NULL,15,'hunterjohan-15.JPG','2017-12-02 22:00:00','17/18','2','Götes kulle',NULL,NULL,'yellow','no','2017-12-03 17:22:13'),(71,15,2,'UPDATE',2,2,NULL,15,'hunterjohan-15.JPG','2017-12-02 22:00:00','17/18','2','Götes kulle','15.38497639','58.91536333','yellow','no','2017-12-03 17:22:20'),(72,15,2,'UPDATE',2,2,NULL,15,'hunterjohan-15.JPG','2017-12-02 22:00:00','17/18','2','Götes kulle','15.38497639','58.91536333','green','no','2017-12-03 17:22:37'),(73,15,2,'UPDATE',2,2,NULL,15,'hunterjohan-15.JPG','2017-12-02 22:00:00','17/18','2','Götes kulle','15.38497639','58.91536333','green','yes','2017-12-03 17:23:08'),(74,15,2,'UPDATE',2,2,NULL,15,'hunterjohan-15.JPG','2017-12-02 22:00:00','17/18','2','Götes kulle','15.38497639','58.91536333','green','no','2017-12-04 20:03:00'),(75,15,2,'UPDATE',2,2,NULL,15,'hunterjohan-15.jpg','2017-12-02 22:00:00','17/18','2','Götes kulle','15.38497639','58.91536333','green','no','2017-12-04 20:03:56'),(76,15,2,'UPDATE',2,2,NULL,15,'hunterjohan-15.jpg','2017-12-02 22:00:00','17/18','2','Götes kulle','15.38497639','58.91536333','green','yes','2017-12-04 20:04:25'),(77,16,2,'INSERT',2,11,NULL,16,'default.png','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'yellow','no','2017-12-11 18:38:22'),(78,16,2,'UPDATE',2,11,NULL,16,'hunterjohan-16.JPG','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'yellow','no','2017-12-11 18:38:45'),(79,16,2,'UPDATE',2,11,NULL,16,'hunterjohan-16.JPG','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'green','yes','2017-12-11 18:42:37'),(80,16,2,'UPDATE',2,11,NULL,16,'hunterjohan-16.JPG','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'green','yes','2017-12-11 18:42:37'),(81,17,2,'INSERT',2,12,NULL,17,'default.png','2017-09-30 22:00:00','17/18','1','Vändplan mossen',NULL,NULL,'yellow','no','2017-12-11 21:07:15'),(82,17,2,'UPDATE',2,12,NULL,17,'hunterjohan-17.jpg','2017-09-30 22:00:00','17/18','1','Vändplan mossen',NULL,NULL,'yellow','no','2017-12-11 21:10:04'),(83,17,2,'UPDATE',2,12,NULL,17,'hunterjohan-17.jpg','2017-09-30 22:00:00','17/18','1','Vändplan mossen',NULL,NULL,'green','yes','2017-12-11 21:10:42'),(84,17,2,'UPDATE',2,12,NULL,17,'hunterjohan-17.jpg','2017-09-30 22:00:00','17/18','1','Vändplan mossen',NULL,NULL,'green','yes','2017-12-11 21:10:42'),(85,14,11,'UPDATE',11,20,NULL,14,'hunterviktor-14.jpg','2017-12-01 22:00:00','17/18','1','Stenmurshålet',NULL,NULL,'green','yes','2017-12-13 17:57:15'),(86,14,11,'UPDATE',11,20,NULL,14,'hunterviktor-14.jpg','2017-12-01 22:00:00','17/18','1','Stenmurshålet',NULL,NULL,'green','yes','2017-12-13 17:57:15'),(87,16,2,'UPDATE',2,11,NULL,16,'hunterjohan-16.JPG','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'green','no','2017-12-15 07:27:51'),(88,16,2,'UPDATE',2,11,NULL,16,'hunterjohan-16.JPG','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'green','no','2017-12-15 07:28:11'),(89,16,2,'UPDATE',2,11,NULL,16,'hunterjohan-16.JPG','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'yellow','no','2017-12-15 07:28:11'),(90,16,2,'UPDATE',2,11,NULL,16,'hunterjohan-16.JPG','2017-12-09 22:00:00','17/18','1','Grusgropen',NULL,NULL,'yellow','yes','2017-12-15 07:28:32'),(91,18,2,'INSERT',2,2,NULL,18,'default.png','2017-12-16 22:00:00','17/18','1','Bunten snickis ',NULL,NULL,'yellow','no','2017-12-17 19:16:47'),(92,18,2,'UPDATE',2,2,NULL,18,'hunterjohan-18.JPG','2017-12-16 22:00:00','17/18','1','Bunten snickis ',NULL,NULL,'yellow','no','2017-12-17 19:32:21'),(93,19,NULL,'INSERT',NULL,NULL,NULL,NULL,'default.png',NULL,NULL,NULL,NULL,NULL,NULL,'yellow',NULL,'2017-12-17 19:33:37'),(94,18,2,'UPDATE',2,2,NULL,18,'hunterjohan-18.JPG','2017-12-16 22:00:00','17/18','1','Bunten snickis ',NULL,NULL,'green','yes','2017-12-17 19:34:03'),(95,18,2,'UPDATE',2,2,NULL,18,'hunterjohan-18.JPG','2017-12-16 22:00:00','17/18','1','Bunten snickis ',NULL,NULL,'green','yes','2017-12-17 19:34:03'),(96,20,2,'INSERT',2,2,NULL,19,'default.png','2017-12-16 22:00:00','17/18','2','Gärdet öster glotterbäck ',NULL,NULL,'yellow','no','2017-12-18 07:40:17'),(97,20,2,'UPDATE',2,2,NULL,19,'hunterjohan-20.JPG','2017-12-16 22:00:00','17/18','2','Gärdet öster glotterbäck ',NULL,NULL,'yellow','no','2017-12-18 07:42:33'),(98,20,2,'UPDATE',2,2,NULL,19,'hunterjohan-20.JPG','2017-12-16 22:00:00','17/18','2','Gärdet öster glotterbäck ','14.87074222','59.176675','yellow','no','2017-12-18 07:42:47'),(99,20,2,'UPDATE',2,2,NULL,19,'hunterjohan-20.JPG','2017-12-16 22:00:00','17/18','2','Gärdet öster glotterbäck ','14.87074222','59.176675','yellow','no','2017-12-18 07:46:02'),(100,20,2,'UPDATE',2,2,NULL,19,'hunterjohan-20.JPG','2017-12-16 22:00:00','17/18','2','Gärdet öster glotterbäck ','15.39153389','58.914975','yellow','no','2017-12-18 07:46:19'),(101,21,11,'INSERT',11,21,NULL,20,'default.png','2017-12-26 22:00:00','17/18','1','Hygget söder om kojan.',NULL,NULL,'yellow','no','2017-12-27 17:32:46'),(102,21,11,'UPDATE',11,21,NULL,20,'hunterviktor-21.jpg','2017-12-26 22:00:00','17/18','1','Hygget söder om kojan.',NULL,NULL,'yellow','no','2017-12-27 17:34:20'),(103,21,11,'UPDATE',11,21,NULL,20,'hunterviktor-21.jpg','2017-12-26 22:00:00','17/18','1','Hygget söder om kojan.',NULL,NULL,'yellow','no','2017-12-27 17:36:03'),(104,21,11,'UPDATE',11,21,NULL,20,'hunterviktor-21.jpg','2017-12-26 22:00:00','17/18','1','Hygget söder om kojan.',NULL,NULL,'yellow','no','2017-12-27 17:37:03'),(105,22,2,'INSERT',2,2,NULL,21,'default.png','2017-12-28 22:00:00','17/18','1','Tornet stenmurshålet ',NULL,NULL,'yellow','no','2017-12-29 10:21:40'),(106,22,2,'UPDATE',2,2,NULL,21,'hunterjohan-22.jpg','2017-12-28 22:00:00','17/18','1','Tornet stenmurshålet ',NULL,NULL,'yellow','no','2017-12-29 10:22:15'),(107,22,2,'UPDATE',2,2,NULL,21,'hunterjohan-22.jpg','2017-12-28 22:00:00','17/18','1','Tornet stenmurshålet ',NULL,NULL,'yellow','no','2017-12-29 10:22:20'),(108,22,2,'UPDATE',2,2,NULL,21,'hunterjohan-22.jpg','2017-12-28 22:00:00','17/18','1','Tornet stenmurshålet ','15.3625','58.90805278','yellow','no','2017-12-29 10:22:36'),(109,21,11,'UPDATE',11,21,NULL,20,'hunterviktor-21.jpg','2017-12-26 22:00:00','17/18','1','Hygget söder om kojan.',NULL,NULL,'green','yes','2017-12-29 10:23:02'),(110,21,11,'UPDATE',11,21,NULL,20,'hunterviktor-21.jpg','2017-12-26 22:00:00','17/18','1','Hygget söder om kojan.',NULL,NULL,'green','yes','2017-12-29 10:23:02'),(111,22,2,'UPDATE',2,2,NULL,21,'hunterjohan-22.jpg','2017-12-28 22:00:00','17/18','1','Tornet stenmurshålet ','15.3625','58.90805278','green','yes','2017-12-30 19:01:41'),(112,22,2,'UPDATE',2,2,NULL,21,'hunterjohan-22.jpg','2017-12-28 22:00:00','17/18','1','Tornet stenmurshålet ','15.3625','58.90805278','green','yes','2017-12-30 19:01:42'),(113,23,11,'INSERT',11,11,NULL,22,'default.png','2018-01-02 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'yellow','no','2018-01-03 20:08:42'),(114,23,11,'UPDATE',11,11,NULL,22,'hunterviktor-23.jpg','2018-01-02 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'yellow','no','2018-01-03 20:10:24'),(115,24,13,'INSERT',13,11,NULL,23,'default.png','2018-01-07 22:00:00','17/18','1','Kroken',NULL,NULL,'yellow','no','2018-01-08 16:41:59'),(116,24,13,'UPDATE',13,11,NULL,23,'hunteranders-24.jpg','2018-01-07 22:00:00','17/18','1','Kroken',NULL,NULL,'yellow','no','2018-01-08 16:49:54'),(117,24,13,'UPDATE',13,11,NULL,23,'hunterviktor-24.jpg','2018-01-07 22:00:00','17/18','1','Kroken',NULL,NULL,'yellow','no','2018-01-08 18:21:17'),(118,23,11,'UPDATE',11,11,NULL,22,'hunterviktor-23.jpg','2018-01-02 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'green','yes','2018-01-08 18:22:12'),(119,23,11,'UPDATE',11,11,NULL,22,'hunterviktor-23.jpg','2018-01-02 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'green','yes','2018-01-08 18:22:12'),(120,25,NULL,'INSERT',NULL,NULL,NULL,NULL,'default.png',NULL,NULL,NULL,NULL,NULL,NULL,'green','yes','2018-01-08 18:23:43'),(121,26,NULL,'INSERT',NULL,NULL,NULL,NULL,'default.png',NULL,NULL,NULL,NULL,NULL,NULL,'green','yes','2018-01-08 18:23:43'),(122,24,13,'UPDATE',13,11,NULL,23,'hunterviktor-24.jpg','2018-01-07 22:00:00','17/18','1','Kroken',NULL,NULL,'green','yes','2018-01-10 08:03:22'),(123,24,13,'UPDATE',13,11,NULL,23,'hunterviktor-24.jpg','2018-01-07 22:00:00','17/18','1','Kroken',NULL,NULL,'green','yes','2018-01-10 08:03:22'),(124,27,2,'INSERT',2,12,NULL,24,'default.png','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen',NULL,NULL,'yellow','no','2018-01-16 11:28:55'),(125,28,2,'INSERT',2,16,NULL,25,'default.png','2018-01-16 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'yellow','no','2018-01-17 17:25:06'),(126,29,2,'INSERT',2,11,NULL,26,'default.png','2018-01-16 22:00:00','17/18','2','Johans torn stora gärdet',NULL,NULL,'yellow','no','2018-01-17 17:47:59'),(127,29,2,'UPDATE',2,11,NULL,26,'default.png','2018-01-16 22:00:00','17/18','2','Johans torn stora gärdet',NULL,NULL,'green','no','2018-01-17 17:56:07'),(128,27,2,'UPDATE',2,12,NULL,24,'hunterviktor-27.jpg','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen',NULL,NULL,'yellow','no','2018-01-17 18:01:52'),(129,29,2,'UPDATE',2,11,NULL,26,'hunterviktor-29.jpg','2018-01-16 22:00:00','17/18','2','Johans torn stora gärdet',NULL,NULL,'green','no','2018-01-17 18:04:10'),(130,28,2,'UPDATE',2,16,NULL,25,'hunterviktor-28.jpg','2018-01-16 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'yellow','no','2018-01-17 18:08:19'),(131,27,2,'UPDATE',2,12,NULL,24,'hunterviktor-27.jpg','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen','15.36611111','58.90416667','yellow','no','2018-01-17 18:12:05'),(132,27,2,'UPDATE',2,12,NULL,24,'hunterviktor-27.jpg','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen','15.36611111','58.90416667','yellow','no','2018-01-17 18:12:15'),(133,27,2,'UPDATE',2,12,NULL,24,'hunterviktor-27.jpg','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen','15.36611111','58.90416667','yellow','no','2018-01-17 18:12:22'),(134,27,2,'UPDATE',2,12,NULL,24,'hunterviktor-27.jpg','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen','15.36611111','58.90416667','yellow','no','2018-01-17 18:12:49'),(135,27,2,'UPDATE',2,12,NULL,24,'hunterjohan-27.JPG','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen','15.36611111','58.90416667','yellow','no','2018-01-17 18:13:08'),(136,30,12,'INSERT',12,12,NULL,27,'default.png','2018-01-13 22:00:00','17/18','1','Tornet innan rönna ',NULL,NULL,'yellow','no','2018-01-20 21:26:32'),(137,30,12,'UPDATE',12,12,NULL,27,'default.png','2018-01-13 22:00:00','17/18','1','Tornet innan rönna ',NULL,NULL,'yellow','no','2018-01-23 06:44:33'),(138,31,11,'INSERT',11,11,NULL,28,'default.png','2018-01-22 22:00:00','17/18','1','Mossen vändplan',NULL,NULL,'yellow','no','2018-01-23 18:12:03'),(139,31,11,'UPDATE',11,11,NULL,28,'hunterviktor-31.jpg','2018-01-22 22:00:00','17/18','1','Mossen vändplan',NULL,NULL,'yellow','no','2018-01-23 18:12:56'),(140,31,11,'UPDATE',11,11,NULL,28,'hunterviktor-31.jpg','2018-01-22 22:00:00','17/18','1','Mossen vändplan',NULL,NULL,'green','yes','2018-01-26 12:39:09'),(141,31,11,'UPDATE',11,11,NULL,28,'hunterviktor-31.jpg','2018-01-22 22:00:00','17/18','1','Mossen vändplan',NULL,NULL,'green','yes','2018-01-26 12:39:09'),(142,28,2,'UPDATE',2,16,NULL,25,'hunterviktor-28.jpg','2018-01-16 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'yellow','yes','2018-01-26 12:40:00'),(143,28,2,'UPDATE',2,16,NULL,25,'hunterviktor-28.jpg','2018-01-16 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'yellow','no','2018-01-26 12:40:12'),(144,29,2,'UPDATE',2,11,NULL,26,'hunterviktor-29.jpg','2018-01-16 22:00:00','17/18','2','Johans torn stora gärdet',NULL,NULL,'green','yes','2018-01-26 12:41:17'),(145,32,2,'INSERT',2,12,NULL,29,'default.png','2018-01-27 22:00:00','17/18','1','Götes kulle',NULL,NULL,'yellow','no','2018-01-28 10:14:46'),(146,32,2,'UPDATE',2,12,NULL,29,'hunterjohan-32.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle',NULL,NULL,'yellow','no','2018-01-28 10:20:57'),(147,32,2,'UPDATE',2,12,NULL,29,'hunterjohan-32.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle','15.385105','58.91450028','yellow','no','2018-01-28 10:25:12'),(148,32,2,'UPDATE',2,12,NULL,29,'hunterjohan-32.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle','15.385105','58.91450028','yellow','no','2018-01-28 13:12:25'),(149,32,2,'UPDATE',2,12,NULL,29,'hunterjohan-32.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle','15.385105','58.91450028','yellow','no','2018-01-28 15:10:34'),(150,32,2,'UPDATE',2,12,NULL,29,'hunterjohan-32.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle','15.385105','58.91450028','green','yes','2018-01-28 15:11:13'),(151,32,2,'UPDATE',2,12,NULL,29,'hunterjohan-32.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle','15.385105','58.91450028','green','yes','2018-01-28 15:11:13'),(152,33,2,'INSERT',2,12,NULL,30,'default.png','2018-01-27 22:00:00','17/18','1','Götes kulle',NULL,NULL,'yellow','no','2018-01-28 15:49:35'),(153,33,2,'UPDATE',2,12,NULL,30,'hunterjohan-33.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle',NULL,NULL,'yellow','no','2018-01-28 15:50:11'),(154,33,2,'UPDATE',2,12,NULL,30,'hunterjohan-33.JPG','2018-01-27 22:00:00','17/18','1','Götes kulle','15.385105','58.91450028','yellow','no','2018-01-28 15:50:21'),(155,34,2,'INSERT',2,16,NULL,31,'default.png','2018-01-27 22:00:00','17/18','1','Norr om akvägen inför rönnen en bit',NULL,NULL,'yellow','no','2018-01-28 15:56:00'),(156,34,2,'UPDATE',2,16,NULL,31,'hunterjohan-34.jpg','2018-01-27 22:00:00','17/18','1','Norr om akvägen inför rönnen en bit',NULL,NULL,'yellow','no','2018-01-28 15:56:19'),(157,34,2,'UPDATE',2,16,NULL,31,'hunterjohan-34.jpg','2018-01-27 22:00:00','17/18','1','Norr om akvägen inför rönnen en bit','15.36936306','58.90371694','yellow','no','2018-01-28 15:56:20'),(158,28,2,'UPDATE',2,16,NULL,25,'hunterviktor-28.jpg','2018-01-16 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'green','yes','2018-01-29 09:03:28'),(159,28,2,'UPDATE',2,16,NULL,25,'hunterviktor-28.jpg','2018-01-16 22:00:00','17/18','1','Nedre vändplan',NULL,NULL,'green','yes','2018-01-29 09:03:28'),(160,35,2,'INSERT',2,11,NULL,32,'default.png','2018-02-02 22:00:00','17/18','1','Gustaf-Adolfstorg',NULL,NULL,'yellow','no','2018-02-03 13:53:47'),(161,35,2,'UPDATE',2,11,NULL,32,'hunterjohan-35.JPG','2018-02-02 22:00:00','17/18','1','Gustaf-Adolfstorg',NULL,NULL,'yellow','no','2018-02-03 13:54:28'),(162,35,2,'UPDATE',2,11,NULL,32,'hunterjohan-35.JPG','2018-02-02 22:00:00','17/18','1','Gustaf-Adolfstorg','15.34046528','58.90676222','yellow','no','2018-02-03 13:54:51'),(163,36,2,'INSERT',2,13,NULL,33,'default.png','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan',NULL,NULL,'yellow','no','2018-02-16 18:28:31'),(164,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan',NULL,NULL,'yellow','no','2018-02-16 18:29:08'),(165,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan',NULL,NULL,'yellow','no','2018-02-16 18:29:28'),(166,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan',NULL,NULL,'yellow','no','2018-02-16 18:29:51'),(167,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan',NULL,NULL,'yellow','no','2018-02-16 18:30:16'),(168,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan',NULL,NULL,'yellow','no','2018-02-16 18:30:35'),(169,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan',NULL,NULL,'yellow','no','2018-02-16 18:30:58'),(170,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan','15.38937722','58.90540694','yellow','no','2018-02-16 18:31:05'),(171,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan','15.38937722','58.90540694','yellow','no','2018-02-16 18:31:22'),(172,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan','15.38937722','58.90540694','yellow','no','2018-02-16 18:31:53'),(173,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan','15.38937722','58.90540694','yellow','no','2018-02-16 18:32:53'),(174,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan','15.38937722','58.90540694','yellow','no','2018-02-16 18:33:00'),(175,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan','15.38937722','58.90540694','green','yes','2018-02-18 16:05:17'),(176,36,2,'UPDATE',2,13,NULL,33,'hunterjohan-36.JPG','2018-02-14 22:00:00','17/18','1','Åteln nedre vändplan','15.38937722','58.90540694','green','yes','2018-02-18 16:05:17'),(177,35,2,'UPDATE',2,11,NULL,32,'hunterjohan-35.JPG','2018-02-02 22:00:00','17/18','1','Gustaf-Adolfstorg','15.34046528','58.90676222','green','yes','2018-02-18 19:42:13'),(178,35,2,'UPDATE',2,11,NULL,32,'hunterjohan-35.JPG','2018-02-02 22:00:00','17/18','1','Gustaf-Adolfstorg','15.34046528','58.90676222','green','yes','2018-02-18 19:42:13'),(179,37,2,'INSERT',2,22,NULL,34,'default.png','2018-02-16 22:00:00','17/18','1','Stenarna bortanför grusgropen ',NULL,NULL,'yellow','no','2018-02-18 19:53:13'),(180,37,2,'UPDATE',2,22,NULL,34,'hunterjohan-37.jpeg','2018-02-16 22:00:00','17/18','1','Stenarna bortanför grusgropen ',NULL,NULL,'yellow','no','2018-02-18 19:53:30'),(181,34,2,'UPDATE',2,16,NULL,31,'hunterjohan-34.jpg','2018-01-27 22:00:00','17/18','1','Norr om akvägen inför rönnen en bit','15.36936306','58.90371694','green','yes','2018-02-20 10:06:22'),(182,34,2,'UPDATE',2,16,NULL,31,'hunterjohan-34.jpg','2018-01-27 22:00:00','17/18','1','Norr om akvägen inför rönnen en bit','15.36936306','58.90371694','green','yes','2018-02-20 10:06:22'),(183,38,2,'INSERT',2,2,NULL,35,'default.png','2018-02-20 22:00:00','17/18','1','Snickis',NULL,NULL,'yellow','no','2018-02-21 22:19:46'),(184,38,2,'UPDATE',2,2,NULL,35,'hunterjohan-38.JPG','2018-02-20 22:00:00','17/18','1','Snickis',NULL,NULL,'yellow','no','2018-02-21 22:20:18'),(185,38,2,'UPDATE',2,2,NULL,35,'hunterjohan-38.JPG','2018-02-20 22:00:00','17/18','1','Snickis','15.39619222','58.91275139','yellow','no','2018-02-21 22:20:22'),(186,38,2,'UPDATE',2,2,NULL,35,'hunterjohan-38.JPG','2018-02-20 22:00:00','17/18','1','Snickis','15.39619222','58.91275139','green','yes','2018-02-21 22:22:31'),(187,38,2,'UPDATE',2,2,NULL,35,'hunterjohan-38.JPG','2018-02-20 22:00:00','17/18','1','Snickis','15.39619222','58.91275139','green','yes','2018-02-21 22:22:31'),(188,37,2,'UPDATE',2,22,NULL,34,'hunterjohan-37.jpeg','2018-02-16 22:00:00','17/18','1','Stenarna bortanför grusgropen ',NULL,NULL,'green','yes','2018-02-22 18:15:21'),(189,37,2,'UPDATE',2,22,NULL,34,'hunterjohan-37.jpeg','2018-02-16 22:00:00','17/18','1','Stenarna bortanför grusgropen ',NULL,NULL,'green','yes','2018-02-22 18:15:21'),(190,39,2,'INSERT',2,2,NULL,36,'default.png','2018-02-23 22:00:00','17/18','2','Johans torn',NULL,NULL,'yellow','no','2018-02-24 19:27:01'),(191,39,2,'UPDATE',2,2,NULL,36,'hunterjohan-39.jpg','2018-02-23 22:00:00','17/18','2','Johans torn',NULL,NULL,'yellow','no','2018-02-24 19:27:18'),(192,39,2,'UPDATE',2,2,NULL,36,'hunterjohan-39.jpg','2018-02-23 22:00:00','17/18','2','Johans torn',NULL,NULL,'yellow','no','2018-02-24 19:28:28'),(193,39,2,'UPDATE',2,2,NULL,36,'hunterjohan-39.jpg','2018-02-23 22:00:00','17/18','2','Johans torn','15.382775','58.91580889','yellow','no','2018-02-24 19:28:32'),(194,27,2,'UPDATE',2,12,NULL,24,'hunterjohan-27.JPG','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen','15.36611111','58.90416667','green','yes','2018-02-25 15:01:21'),(195,27,2,'UPDATE',2,12,NULL,24,'hunterjohan-27.JPG','2018-01-12 22:00:00','17/18','1','Tornet innan rönnen','15.36611111','58.90416667','green','yes','2018-02-25 15:01:21'),(196,40,11,'INSERT',11,10,NULL,37,'default.png','2018-03-15 22:00:00','17/18','5','Ralatorpet',NULL,NULL,'yellow','no','2018-03-20 12:00:12'),(197,40,11,'UPDATE',11,10,NULL,37,'hunterviktor-40.jpg','2018-03-15 22:00:00','17/18','5','Ralatorpet',NULL,NULL,'yellow','no','2018-03-20 12:04:08'),(198,40,10,'UPDATE',11,10,NULL,37,'hunterviktor-40.jpg','2018-03-15 22:00:00','17/18','5','Ralatorpet',NULL,NULL,'green','no','2018-03-20 16:59:23'),(199,41,2,'INSERT',2,2,NULL,38,'default.png','2018-08-06 22:00:00','18/19','2','Östra gärdet ',NULL,NULL,'yellow','no','2018-08-09 17:35:52'),(200,41,2,'UPDATE',2,2,NULL,38,'hunterjohan-41.JPG','2018-08-06 22:00:00','18/19','2','Östra gärdet ',NULL,NULL,'yellow','no','2018-08-09 17:36:27'),(201,41,2,'UPDATE',2,2,NULL,38,'hunterjohan-41.JPG','2018-08-06 22:00:00','18/19','2','Östra gärdet ',NULL,NULL,'yellow','no','2018-08-09 17:38:35'),(202,41,2,'UPDATE',2,2,NULL,38,'hunterjohan-41.JPG','2018-08-06 22:00:00','18/19','2','Östra gärdet ','15.39254694','58.91481611','yellow','no','2018-08-09 17:38:40'),(203,42,2,'INSERT',2,11,NULL,39,'default.png','2018-09-15 22:00:00','18/19','1','Mellan kroken och grusgropen',NULL,NULL,'yellow','no','2018-09-17 10:27:49'),(204,43,2,'INSERT',2,18,NULL,40,'default.png','2018-10-20 00:00:00','18/19','1','Tornet innan rönnen ',NULL,NULL,'yellow','no','2018-10-20 09:58:38'),(205,43,2,'UPDATE',2,18,NULL,40,'hunterjohan-43.JPG','2018-10-20 00:00:00','18/19','1','Tornet innan rönnen ',NULL,NULL,'yellow','no','2018-10-21 16:12:37'),(206,44,2,'INSERT',2,2,NULL,41,'default.png','2018-11-03 00:00:00','18/19','2','Stora gärdet',NULL,NULL,'yellow','no','2018-11-07 08:20:20'),(207,44,2,'UPDATE',2,2,NULL,41,'hunterjohan-44.jpeg','2018-11-03 00:00:00','18/19','2','Stora gärdet',NULL,NULL,'yellow','no','2018-11-07 08:23:20'),(208,44,2,'UPDATE',2,2,NULL,41,'hunterjohan-44.jpeg','2018-11-03 00:00:00','18/19','2','Stora gärdet',NULL,NULL,'yellow','no','2018-11-07 08:23:43'),(209,44,2,'UPDATE',2,2,NULL,41,'hunterjohan-44.jpeg','2018-11-03 00:00:00','18/19','2','Stora gärdet','15.38303889','58.91552306','yellow','no','2018-11-07 08:23:49'),(210,45,2,'INSERT',2,2,NULL,42,'default.png','2018-11-17 00:00:00','18/19','1','Mittentornet mellan kojan och rönnen',NULL,NULL,'yellow','no','2018-11-18 08:15:55'),(211,45,2,'UPDATE',2,2,NULL,42,'hunterjohan-45.JPG','2018-11-17 00:00:00','18/19','1','Mittentornet mellan kojan och rönnen',NULL,NULL,'yellow','no','2018-11-18 08:18:59'),(212,45,2,'UPDATE',2,2,NULL,42,'hunterjohan-45.JPG','2018-11-17 00:00:00','18/19','1','Mittentornet mellan kojan och rönnen','15.36455306','58.90470806','yellow','no','2018-11-18 08:19:19'),(213,46,2,'INSERT',2,18,NULL,43,'default.png','2018-11-17 00:00:00','18/19','1','Mossevändplan',NULL,NULL,'yellow','no','2018-11-18 11:37:03'),(214,46,2,'UPDATE',2,18,NULL,43,'hunterjohan-46.jpeg','2018-11-17 00:00:00','18/19','1','Mossevändplan',NULL,NULL,'yellow','no','2018-11-18 11:37:56'),(215,47,2,'INSERT',2,11,NULL,44,'default.png','2019-01-02 00:00:00','18/19','1','Grusgropsvägen',NULL,NULL,'yellow','no','2019-01-02 20:16:21'),(216,48,2,'INSERT',2,12,NULL,45,'default.png','2019-01-01 00:00:00','18/19','1','Nedre vändplan grusgropsvägen',NULL,NULL,'yellow','no','2019-01-02 20:18:49'),(217,48,2,'UPDATE',2,12,NULL,45,'hunterjohan-48.JPG','2019-01-01 00:00:00','18/19','1','Nedre vändplan grusgropsvägen',NULL,NULL,'yellow','no','2019-01-02 20:21:51'),(218,48,2,'UPDATE',2,12,NULL,45,'hunterjohan-48.JPG','2019-01-01 00:00:00','18/19','1','Nedre vändplan grusgropsvägen','15.38955389','58.90537694','yellow','no','2019-01-02 20:21:57'),(219,49,2,'INSERT',2,15,NULL,46,'default.png','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen',NULL,NULL,'yellow','no','2019-01-05 08:37:52'),(220,49,2,'UPDATE',2,15,NULL,46,'hunterjohan-49.JPG','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen',NULL,NULL,'yellow','no','2019-01-05 08:40:50'),(221,49,2,'UPDATE',2,15,NULL,46,'hunterjohan-49.JPG','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen','15.40111722','58.91345389','yellow','no','2019-01-05 09:51:42'),(222,49,2,'UPDATE',2,15,NULL,46,'hunterjohan-49.JPG','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen','15.40111722','58.91345389','yellow','no','2019-01-07 07:29:34'),(223,49,2,'UPDATE',2,15,NULL,46,'hunterjohan-49.JPG','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen','15.40111722','58.91345389','yellow','no','2019-01-07 07:40:01'),(224,49,2,'UPDATE',2,15,NULL,46,'hunterjohan-49.JPG','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen','15.40111722','58.91345389','yellow','no','2019-01-07 07:41:09'),(225,50,2,'INSERT',2,18,NULL,47,'default.png','2019-01-05 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'yellow','no','2019-01-07 07:43:35'),(226,50,2,'UPDATE',2,18,NULL,47,'hunterjohan-50.JPG','2019-01-05 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'yellow','no','2019-01-07 07:44:27'),(227,47,2,'UPDATE',2,11,NULL,44,'hunterjohan-47.JPG','2019-01-02 00:00:00','18/19','1','Grusgropsvägen',NULL,NULL,'yellow','no','2019-01-07 07:49:04'),(228,51,2,'INSERT',2,12,NULL,48,'default.png','2018-12-29 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'yellow','no','2019-01-09 15:22:57'),(229,51,2,'UPDATE',2,12,NULL,48,'hunterjohan-51.JPG','2018-12-29 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'yellow','no','2019-01-09 15:24:21'),(230,51,2,'UPDATE',2,12,NULL,48,'hunterjohan-51.JPG','2018-12-29 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'green','yes','2019-01-09 15:25:38'),(231,51,2,'UPDATE',2,12,NULL,48,'hunterjohan-51.JPG','2018-12-29 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'green','yes','2019-01-09 15:25:38'),(232,52,2,'INSERT',2,11,NULL,49,'default.png','2019-01-13 00:00:00','18/19','1','Götes torn mossen',NULL,NULL,'yellow','no','2019-01-13 16:34:58'),(233,52,2,'UPDATE',2,11,NULL,49,'hunterjohan-52.JPG','2019-01-13 00:00:00','18/19','1','Götes torn mossen',NULL,NULL,'yellow','no','2019-01-13 16:35:28'),(234,52,2,'UPDATE',2,11,NULL,49,'hunterjohan-52.JPG','2019-01-13 00:00:00','18/19','1','Götes torn mossen',NULL,NULL,'yellow','no','2019-01-13 16:36:49'),(235,52,2,'UPDATE',2,11,NULL,49,'hunterjohan-52.JPG','2019-01-13 00:00:00','18/19','1','Götes torn mossen','15.354685','58.90697889','yellow','no','2019-01-13 16:36:54'),(236,53,2,'INSERT',2,19,NULL,50,'default.png','2019-01-12 00:00:00','18/19','1','Stolpen slaggis',NULL,NULL,'yellow','no','2019-01-13 16:38:40'),(237,53,2,'UPDATE',2,19,NULL,50,'hunterjohan-53.JPG','2019-01-12 00:00:00','18/19','1','Stolpen slaggis',NULL,NULL,'yellow','no','2019-01-13 16:39:35'),(238,53,2,'UPDATE',2,19,NULL,50,'hunterjohan-53.JPG','2019-01-12 00:00:00','18/19','1','Stolpen slaggis','15.35394722','58.91067028','yellow','no','2019-01-13 16:39:43'),(239,54,2,'INSERT',2,19,NULL,51,'default.png','2019-01-12 00:00:00','18/19','1','Passet inför vändplan ak-vägen',NULL,NULL,'yellow','no','2019-01-13 16:41:44'),(240,55,2,'INSERT',2,19,NULL,52,'default.png','2019-01-05 00:00:00','18/19','1','Ledningen snickarbo',NULL,NULL,'yellow','no','2019-01-13 17:19:15'),(241,56,2,'INSERT',2,19,NULL,53,'default.png','2019-01-05 00:00:00','18/19','1','Ledningen snickis',NULL,NULL,'yellow','no','2019-01-13 17:25:13'),(242,56,2,'UPDATE',2,19,NULL,53,'default.png','2019-01-05 00:00:00','18/19','1','Ledningen snickis',NULL,NULL,'yellow','no','2019-01-13 17:25:32'),(243,55,2,'UPDATE',2,19,NULL,52,'hunterjohan-55.jpeg','2019-01-05 00:00:00','18/19','1','Ledningen snickarbo',NULL,NULL,'yellow','no','2019-01-13 17:26:15'),(244,55,2,'UPDATE',2,19,NULL,52,'hunterjohan-55.jpeg','2019-01-05 00:00:00','18/19','1','Ledningen snickarbo',NULL,NULL,'yellow','no','2019-01-13 17:28:12'),(245,55,2,'UPDATE',2,19,NULL,52,'hunterjohan-55.jpeg','2019-01-05 00:00:00','18/19','1','Ledningen snickarbo','15.40259694','58.91292889','yellow','no','2019-01-13 17:28:17'),(246,54,2,'UPDATE',2,19,NULL,51,'hunterjohan-54.jpeg','2019-01-12 00:00:00','18/19','1','Passet inför vändplan ak-vägen',NULL,NULL,'yellow','no','2019-01-15 21:08:43'),(247,54,2,'UPDATE',2,19,NULL,51,'hunterjohan-54.jpeg','2019-01-12 00:00:00','18/19','1','Passet inför vändplan ak-vägen','15.38437306','58.90063611','yellow','no','2019-01-15 21:08:48'),(248,54,2,'UPDATE',2,19,NULL,51,'hunterjohan-54.jpeg','2019-01-12 00:00:00','18/19','1','Passet inför vändplan ak-vägen','15.38437306','58.90063611','green','yes','2019-01-15 21:10:42'),(249,54,2,'UPDATE',2,19,NULL,51,'hunterjohan-54.jpeg','2019-01-12 00:00:00','18/19','1','Passet inför vändplan ak-vägen','15.38437306','58.90063611','green','yes','2019-01-15 21:10:42'),(250,57,2,'INSERT',2,2,NULL,54,'default.png','2019-01-18 00:00:00','18/19','2','Stora gärdet ',NULL,NULL,'yellow','no','2019-01-19 09:55:31'),(251,57,2,'UPDATE',2,2,NULL,54,'hunterjohan-57.JPG','2019-01-18 00:00:00','18/19','2','Stora gärdet ',NULL,NULL,'yellow','no','2019-01-19 09:56:32'),(252,48,2,'UPDATE',2,12,NULL,45,'hunterjohan-48.JPG','2019-01-01 00:00:00','18/19','1','Nedre vändplan grusgropsvägen','15.38955389','58.90537694','green','yes','2019-01-20 09:56:06'),(253,48,2,'UPDATE',2,12,NULL,45,'hunterjohan-48.JPG','2019-01-01 00:00:00','18/19','1','Nedre vändplan grusgropsvägen','15.38955389','58.90537694','green','yes','2019-01-20 09:56:06'),(254,45,2,'UPDATE',2,2,NULL,42,'hunterjohan-45.JPG','2018-11-17 00:00:00','18/19','1','Mittentornet mellan kojan och rönnen','15.36455306','58.90470806','green','yes','2019-01-20 11:13:35'),(255,45,2,'UPDATE',2,2,NULL,42,'hunterjohan-45.JPG','2018-11-17 00:00:00','18/19','1','Mittentornet mellan kojan och rönnen','15.36455306','58.90470806','green','yes','2019-01-20 11:13:35'),(256,52,2,'UPDATE',2,11,NULL,49,'hunterjohan-52.JPG','2019-01-13 00:00:00','18/19','1','Götes torn mossen','15.354685','58.90697889','green','yes','2019-01-20 11:16:05'),(257,52,2,'UPDATE',2,11,NULL,49,'hunterjohan-52.JPG','2019-01-13 00:00:00','18/19','1','Götes torn mossen','15.354685','58.90697889','green','yes','2019-01-20 11:16:05'),(258,47,2,'UPDATE',2,11,NULL,44,'hunterjohan-47.JPG','2019-01-02 00:00:00','18/19','1','Grusgropsvägen',NULL,NULL,'green','yes','2019-01-21 08:58:07'),(259,47,2,'UPDATE',2,11,NULL,44,'hunterjohan-47.JPG','2019-01-02 00:00:00','18/19','1','Grusgropsvägen',NULL,NULL,'green','yes','2019-01-21 08:58:07'),(260,58,2,'INSERT',2,11,NULL,55,'default.png','2019-01-26 00:00:00','18/19','1','Mitten passet mossen ak-vägen',NULL,NULL,'yellow','no','2019-01-26 08:42:12'),(261,58,2,'UPDATE',2,11,NULL,55,'default.png','2019-01-26 00:00:00','18/19','1','Mitten passet mossen ak-v&auml;gen',NULL,NULL,'yellow','no','2019-01-26 09:17:29'),(262,58,2,'UPDATE',2,11,NULL,55,'default.png','2019-01-26 00:00:00','18/19','1','Mitten passet mossen ak-v&auml;gen',NULL,NULL,'yellow','no','2019-01-26 09:47:37'),(263,58,2,'UPDATE',2,11,NULL,55,'hunterjohan-58.JPG','2019-01-26 00:00:00','18/19','1','Mitten passet mossen ak-v&auml;gen',NULL,NULL,'yellow','no','2019-01-26 11:32:29'),(264,59,2,'INSERT',2,11,NULL,56,'default.png','2018-12-21 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'yellow','no','2019-01-26 18:48:50'),(265,60,2,'INSERT',2,19,NULL,57,'default.png','2019-01-10 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'yellow','no','2019-01-26 19:55:40'),(266,60,2,'UPDATE',2,19,NULL,57,'hunterjohan-60.jpeg','2019-01-10 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'yellow','no','2019-01-26 19:56:43'),(267,53,2,'UPDATE',2,19,NULL,50,'hunterjohan-53.JPG','2019-01-12 00:00:00','18/19','1','Stolpen slaggis','15.35394722','58.91067028','green','yes','2019-01-26 19:59:01'),(268,53,2,'UPDATE',2,19,NULL,50,'hunterjohan-53.JPG','2019-01-12 00:00:00','18/19','1','Stolpen slaggis','15.35394722','58.91067028','green','yes','2019-01-26 19:59:01'),(269,60,2,'UPDATE',2,19,NULL,57,'hunterjohan-60.jpeg','2019-01-10 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'green','yes','2019-01-26 19:59:50'),(270,60,2,'UPDATE',2,19,NULL,57,'hunterjohan-60.jpeg','2019-01-10 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'green','yes','2019-01-26 19:59:50'),(271,61,2,'INSERT',2,24,NULL,58,'default.png','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'yellow','no','2019-01-26 20:02:26'),(272,61,2,'UPDATE',2,24,NULL,58,'hunterjohan-61.JPG','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'yellow','no','2019-01-26 20:03:07'),(273,62,2,'INSERT',2,24,NULL,59,'default.png','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'yellow','no','2019-01-26 20:04:46'),(274,62,2,'UPDATE',2,24,NULL,59,'hunterjohan-62.JPG','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'yellow','no','2019-01-26 20:05:40'),(275,50,2,'UPDATE',2,18,NULL,47,'hunterjohan-50.JPG','2019-01-05 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'green','yes','2019-01-27 09:47:24'),(276,50,2,'UPDATE',2,18,NULL,47,'hunterjohan-50.JPG','2019-01-05 00:00:00','18/19','1','Mittentornet efter kojan',NULL,NULL,'green','yes','2019-01-27 09:47:24'),(277,42,2,'UPDATE',2,11,NULL,39,'default.png','2018-09-16 00:00:00','18/19','1','Mellan kroken och grusgropen',NULL,NULL,'yellow','no','2019-01-27 09:58:44'),(278,42,2,'UPDATE',2,11,NULL,39,'default.png','2018-09-16 00:00:00','18/19','1','Mellan kroken och grusgropen',NULL,NULL,'green','yes','2019-01-27 09:59:26'),(279,42,2,'UPDATE',2,11,NULL,39,'default.png','2018-09-16 00:00:00','18/19','1','Mellan kroken och grusgropen',NULL,NULL,'green','yes','2019-01-27 09:59:26'),(280,42,2,'UPDATE',2,11,NULL,39,'default.png','2018-09-16 00:00:00','18/19','1','Mellan kroken och grusgropen',NULL,NULL,'green','no','2019-01-27 10:05:14'),(281,42,2,'UPDATE',2,11,NULL,39,'hunterjohan-42.jpg','2018-09-16 00:00:00','18/19','1','Mellan kroken och grusgropen',NULL,NULL,'green','no','2019-01-27 10:06:25'),(282,63,2,'INSERT',2,2,NULL,60,'default.png','2018-08-18 00:00:00','18/19','5','',NULL,NULL,'yellow','no','2019-01-27 10:20:16'),(283,63,2,'UPDATE',2,2,NULL,60,'hunterjohan-63.jpg','2018-08-18 00:00:00','18/19','5','',NULL,NULL,'yellow','no','2019-01-27 10:22:02'),(284,64,2,'INSERT',2,2,NULL,61,'default.png','2018-05-04 00:00:00','17/18','2','Stora gärdet',NULL,NULL,'yellow','no','2019-01-29 15:11:25'),(285,64,2,'UPDATE',2,2,NULL,61,'hunterjohan-64.jpeg','2018-05-04 00:00:00','17/18','2','Stora gärdet',NULL,NULL,'yellow','no','2019-01-29 15:12:40'),(286,64,2,'UPDATE',2,2,NULL,61,'hunterjohan-64.jpeg','2018-05-04 00:00:00','17/18','2','Stora gärdet',NULL,NULL,'green','no','2019-01-29 15:12:55'),(287,65,2,'INSERT',2,23,NULL,62,'default.png','2019-01-30 00:00:00','18/19','1','Mossen',NULL,NULL,'yellow','no','2019-01-30 11:49:52'),(288,66,2,'INSERT',2,19,NULL,63,'default.png','2019-01-30 00:00:00','18/19','1','Mellan åttan och nians älg pass nedom mossestugan\r\n',NULL,NULL,'yellow','no','2019-01-30 11:51:36'),(289,67,2,'INSERT',2,19,NULL,64,'default.png','2019-01-30 00:00:00','18/19','1','Mellan åttan och nians älg pass nedom mossestugan ',NULL,NULL,'yellow','no','2019-01-30 11:53:21'),(290,68,2,'INSERT',2,11,NULL,65,'default.png','2019-01-26 00:00:00','18/19','1','Mellan första och andra i mossen ak-vägen',NULL,NULL,'yellow','no','2019-01-30 11:55:02'),(291,68,2,'UPDATE',2,11,NULL,65,'hunterjohan-68.JPG','2019-01-26 00:00:00','18/19','1','Mellan första och andra i mossen ak-vägen',NULL,NULL,'yellow','no','2019-01-30 11:56:03'),(292,66,2,'UPDATE',2,19,NULL,63,'hunterjohan-66.JPG','2019-01-30 00:00:00','18/19','1','Mellan åttan och nians älg pass nedom mossestugan\r\n',NULL,NULL,'yellow','no','2019-01-30 18:49:30'),(293,67,2,'UPDATE',2,19,NULL,64,'hunterjohan-67.JPG','2019-01-30 00:00:00','18/19','1','Mellan åttan och nians älg pass nedom mossestugan ',NULL,NULL,'yellow','no','2019-01-30 18:50:51'),(294,67,2,'UPDATE',2,19,NULL,64,'hunterjohan-67.JPG','2019-01-30 00:00:00','18/19','1','Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan ',NULL,NULL,'yellow','no','2019-01-30 18:51:02'),(295,65,2,'UPDATE',2,23,NULL,62,'hunterjohan-65.JPG','2019-01-30 00:00:00','18/19','1','Mossen',NULL,NULL,'yellow','no','2019-01-30 18:51:38'),(296,65,2,'UPDATE',2,23,NULL,62,'hunterjohan-65.JPG','2019-01-30 00:00:00','18/19','1','Mossen',NULL,NULL,'yellow','no','2019-01-30 18:51:57'),(297,65,2,'UPDATE',2,23,NULL,62,'hunterjohan-65.JPG','2019-01-30 00:00:00','18/19','1','Mossen',NULL,NULL,'green','yes','2019-01-31 19:18:09'),(298,65,2,'UPDATE',2,23,NULL,62,'hunterjohan-65.JPG','2019-01-30 00:00:00','18/19','1','Mossen',NULL,NULL,'green','yes','2019-01-31 19:18:09'),(299,68,2,'UPDATE',2,11,NULL,65,'hunterjohan-68.JPG','2019-01-26 00:00:00','18/19','1','Mellan första och andra i mossen ak-vägen',NULL,NULL,'green','yes','2019-02-02 09:14:01'),(300,68,2,'UPDATE',2,11,NULL,65,'hunterjohan-68.JPG','2019-01-26 00:00:00','18/19','1','Mellan första och andra i mossen ak-vägen',NULL,NULL,'green','yes','2019-02-02 09:14:01'),(301,58,2,'UPDATE',2,11,NULL,55,'hunterjohan-58.JPG','2019-01-26 00:00:00','18/19','1','Mitten passet mossen ak-v&auml;gen',NULL,NULL,'green','yes','2019-02-02 10:32:06'),(302,58,2,'UPDATE',2,11,NULL,55,'hunterjohan-58.JPG','2019-01-26 00:00:00','18/19','1','Mitten passet mossen ak-v&auml;gen',NULL,NULL,'green','yes','2019-02-02 10:32:06'),(303,62,2,'UPDATE',2,24,NULL,59,'hunterjohan-62.JPG','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'green','yes','2019-02-02 11:51:19'),(304,62,2,'UPDATE',2,24,NULL,59,'hunterjohan-62.JPG','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'green','yes','2019-02-02 11:51:19'),(305,61,2,'UPDATE',2,24,NULL,58,'hunterjohan-61.JPG','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'green','yes','2019-02-02 14:02:58'),(306,61,2,'UPDATE',2,24,NULL,58,'hunterjohan-61.JPG','2019-01-26 00:00:00','18/19','1','Gröna tornet bortför ak',NULL,NULL,'green','yes','2019-02-02 14:02:58'),(307,69,2,'INSERT',2,11,NULL,66,'default.png','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-04 17:43:09'),(308,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-04 17:43:25'),(309,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-04 17:43:45'),(310,67,2,'UPDATE',2,19,NULL,64,'hunterjohan-67.JPG','2019-01-30 00:00:00','18/19','1','Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan ',NULL,NULL,'green','yes','2019-02-06 18:04:57'),(311,67,2,'UPDATE',2,19,NULL,64,'hunterjohan-67.JPG','2019-01-30 00:00:00','18/19','1','Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan ',NULL,NULL,'green','yes','2019-02-06 18:04:57'),(312,66,11,'UPDATE',2,19,NULL,63,'hunterjohan-66.JPG','2019-01-30 00:00:00','18/19','1','Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan (Mats Johansson vart tilldelad k&ouml;ttet.)\r\n',NULL,NULL,'yellow','no','2019-02-06 18:06:42'),(313,66,11,'UPDATE',2,19,NULL,63,'hunterjohan-66.JPG','2019-01-30 00:00:00','18/19','1','Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan (Mats Johansson vart tilldelad k&ouml;ttet.)\r\n',NULL,NULL,'green','yes','2019-02-06 18:07:32'),(314,66,11,'UPDATE',2,19,NULL,63,'hunterjohan-66.JPG','2019-01-30 00:00:00','18/19','1','Mellan &aring;ttan och nians &auml;lg pass nedom mossestugan (Mats Johansson vart tilldelad k&ouml;ttet.)\r\n',NULL,NULL,'green','yes','2019-02-06 18:07:32'),(315,43,2,'UPDATE',2,18,NULL,40,'hunterjohan-43.JPG','2018-10-20 00:00:00','18/19','1','Tornet innan rönnen ',NULL,NULL,'green','yes','2019-02-06 18:17:33'),(316,43,2,'UPDATE',2,18,NULL,40,'hunterjohan-43.JPG','2018-10-20 00:00:00','18/19','1','Tornet innan rönnen ',NULL,NULL,'green','yes','2019-02-06 18:17:33'),(317,46,2,'UPDATE',2,18,NULL,43,'hunterjohan-46.jpeg','2018-11-17 00:00:00','18/19','1','Mossevändplan',NULL,NULL,'green','yes','2019-02-06 18:18:31'),(318,46,2,'UPDATE',2,18,NULL,43,'hunterjohan-46.jpeg','2018-11-17 00:00:00','18/19','1','Mossevändplan',NULL,NULL,'green','yes','2019-02-06 18:18:31'),(319,59,2,'UPDATE',2,11,NULL,56,'hunterviktor-59.jpg','2018-12-21 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'yellow','no','2019-02-06 18:20:53'),(320,59,2,'UPDATE',2,11,NULL,56,'hunterviktor-59.jpg','2018-12-21 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'green','yes','2019-02-06 18:23:02'),(321,59,2,'UPDATE',2,11,NULL,56,'hunterviktor-59.jpg','2018-12-21 00:00:00','18/19','1','Nedre vändplan',NULL,NULL,'green','yes','2019-02-06 18:23:02'),(322,55,2,'UPDATE',2,19,NULL,52,'hunterjohan-55.jpeg','2019-01-05 00:00:00','18/19','1','Ledningen snickarbo','15.40259694','58.91292889','green','yes','2019-02-06 18:25:26'),(323,55,2,'UPDATE',2,19,NULL,52,'hunterjohan-55.jpeg','2019-01-05 00:00:00','18/19','1','Ledningen snickarbo','15.40259694','58.91292889','green','yes','2019-02-06 18:25:26'),(324,70,2,'INSERT',2,19,NULL,67,'default.png','2019-01-05 00:00:00','18/19','1','Andra passet bak ångsågen',NULL,NULL,'yellow','no','2019-02-06 18:26:16'),(325,49,2,'UPDATE',2,15,NULL,46,'hunterjohan-49.JPG','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen','15.40111722','58.91345389','green','yes','2019-02-06 18:27:29'),(326,49,2,'UPDATE',2,15,NULL,46,'hunterjohan-49.JPG','2019-01-05 00:00:00','18/19','1','Berget snickarbohagen','15.40111722','58.91345389','green','yes','2019-02-06 18:27:29'),(327,70,2,'UPDATE',2,19,NULL,67,'hunterviktor-70.jpg','2019-01-05 00:00:00','18/19','1','Andra passet bak ångsågen',NULL,NULL,'yellow','no','2019-02-06 18:29:00'),(328,70,2,'UPDATE',2,19,NULL,67,'hunterviktor-70.jpg','2019-01-05 00:00:00','18/19','1','Andra passet bak ångsågen',NULL,NULL,'green','yes','2019-02-06 18:30:08'),(329,70,2,'UPDATE',2,19,NULL,67,'hunterviktor-70.jpg','2019-01-05 00:00:00','18/19','1','Andra passet bak ångsågen',NULL,NULL,'green','yes','2019-02-06 18:30:08'),(330,71,2,'INSERT',2,18,NULL,68,'default.png','2018-09-01 00:00:00','18/19','1','Tornet jannesberg',NULL,NULL,'yellow','no','2019-02-06 18:34:59'),(331,71,2,'UPDATE',2,18,NULL,68,'default.png','2018-09-01 00:00:00','18/19','1','Tornet jannesberg',NULL,NULL,'green','yes','2019-02-06 18:36:50'),(332,71,2,'UPDATE',2,18,NULL,68,'default.png','2018-09-01 00:00:00','18/19','1','Tornet jannesberg',NULL,NULL,'green','yes','2019-02-06 18:36:50'),(333,72,2,'INSERT',2,11,NULL,69,'default.png','2018-10-10 00:00:00','18/19','1','Hygget mellan stenmurshålet och kojan',NULL,NULL,'yellow','no','2019-02-06 18:40:53'),(334,72,2,'UPDATE',2,11,NULL,69,'default.png','2018-10-10 00:00:00','18/19','1','Hygget mellan stenmurshålet och kojan',NULL,NULL,'green','yes','2019-02-06 18:42:44'),(335,72,2,'UPDATE',2,11,NULL,69,'default.png','2018-10-10 00:00:00','18/19','1','Hygget mellan stenmurshålet och kojan',NULL,NULL,'green','yes','2019-02-06 18:42:44'),(336,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-06 21:13:42'),(337,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-06 21:14:26'),(338,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-06 21:15:09'),(339,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-06 21:16:41'),(340,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-06 21:17:04'),(341,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-06 21:17:33'),(342,69,2,'UPDATE',2,11,NULL,66,'hunterjohan-69.JPG','2019-02-04 00:00:00','18/19','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-02-06 21:18:08'),(343,72,2,'UPDATE',2,11,NULL,69,'default.png','2018-10-10 00:00:00','18/19','1','Hygget mellan stenmurshålet och kojan',NULL,NULL,'green','no','2019-02-06 21:27:25'),(344,72,2,'UPDATE',2,11,NULL,69,'hunterjohan-72.JPG','2018-10-10 00:00:00','18/19','1','Hygget mellan stenmurshålet och kojan',NULL,NULL,'green','no','2019-02-06 21:28:29'),(345,73,2,'INSERT',2,12,NULL,70,'default.png','2018-11-17 00:00:00','18/19','1','Mittenpasset mossen ak-vägen',NULL,NULL,'yellow','no','2019-02-07 13:20:18'),(346,73,2,'UPDATE',2,12,NULL,70,'default.png','2018-11-17 00:00:00','18/19','1','Mittenpasset mossen ak-vägen',NULL,NULL,'green','yes','2019-02-07 13:20:56'),(347,73,2,'UPDATE',2,12,NULL,70,'default.png','2018-11-17 00:00:00','18/19','1','Mittenpasset mossen ak-vägen',NULL,NULL,'green','yes','2019-02-07 13:20:56'),(348,73,2,'UPDATE',2,12,NULL,70,'default.png','2018-11-17 00:00:00','18/19','1','Mittenpasset mossen ak-vägen',NULL,NULL,'green','no','2019-02-07 13:22:23'),(349,73,2,'UPDATE',2,12,NULL,70,'hunterjohan-73.jpg','2018-11-17 00:00:00','18/19','1','Mittenpasset mossen ak-vägen',NULL,NULL,'green','no','2019-02-07 13:22:53'),(350,73,2,'UPDATE',2,12,NULL,70,'hunterjohan-73.jpg','2018-11-17 00:00:00','18/19','1','Mittenpasset mossen ak-vägen','15.37374611','58.90157694','green','no','2019-02-07 13:22:55'),(351,73,2,'UPDATE',2,12,NULL,70,'hunterjohan-73.jpg','2018-11-17 00:00:00','18/19','1','Mittenpasset mossen ak-vägen','15.37374611','58.90157694','green','yes','2019-02-07 13:23:36'),(352,74,11,'INSERT',11,11,NULL,71,'default.png','2019-02-06 00:00:00','18/19','1','Årsgris skjuten foderplats/åteln nedrevändplan\r\n',NULL,NULL,'yellow','no','2019-02-14 12:48:13'),(353,74,11,'UPDATE',11,11,NULL,71,'hunterviktor-74.jpg','2019-02-06 00:00:00','18/19','1','Årsgris skjuten foderplats/åteln nedrevändplan\r\n',NULL,NULL,'yellow','no','2019-02-14 12:51:13'),(354,74,11,'UPDATE',11,11,NULL,71,'hunterviktor-74.jpg','2019-02-06 00:00:00','18/19','1','Årsgris skjuten foderplats/åteln nedrevändplan\r\n',NULL,NULL,'yellow','no','2019-02-14 12:53:00'),(355,75,11,'INSERT',11,11,NULL,72,'default.png','2019-03-05 00:00:00','18/19','1','Grusgropen ',NULL,NULL,'yellow','no','2019-03-16 12:45:20'),(356,75,11,'UPDATE',11,11,NULL,72,'hunterviktor-75.jpg','2019-03-05 00:00:00','18/19','1','Grusgropen ',NULL,NULL,'yellow','no','2019-03-16 12:47:17'),(357,76,2,'INSERT',2,11,NULL,73,'default.png','2019-05-28 00:00:00','18/19','2','Kents torn stora gärdet',NULL,NULL,'yellow','no','2019-05-28 22:02:42'),(358,76,2,'UPDATE',2,11,NULL,73,'hunterjohan-76.jpeg','2019-05-28 00:00:00','18/19','2','Kents torn stora gärdet',NULL,NULL,'yellow','no','2019-05-28 22:03:05'),(359,77,11,'INSERT',11,15,NULL,74,'default.png','2019-04-28 00:00:00','18/19','1','vildsvin gylta',NULL,NULL,'yellow','no','2019-10-05 20:52:24'),(360,78,2,'INSERT',2,12,NULL,75,'default.png','2019-10-12 00:00:00','19/20','1','Mossen akvägen mellan första och andra passet',NULL,NULL,'yellow','no','2019-10-18 15:48:38'),(361,78,2,'UPDATE',2,12,NULL,75,'default.png','2019-10-12 00:00:00','19/20','1','Mossen akvägen mellan första och andra passet',NULL,NULL,'green','yes','2019-10-18 15:49:34'),(362,78,2,'UPDATE',2,12,NULL,75,'default.png','2019-10-12 00:00:00','19/20','1','Mossen akvägen mellan första och andra passet',NULL,NULL,'green','yes','2019-10-18 15:49:34'),(363,78,2,'UPDATE',2,12,NULL,75,'default.png','2019-10-12 00:00:00','19/20','1','Mossen akvägen mellan första och andra passet',NULL,NULL,'green','no','2019-10-18 15:50:22'),(364,78,2,'UPDATE',2,12,NULL,75,'hunterjohan-78.JPG','2019-10-12 00:00:00','19/20','1','Mossen akvägen mellan första och andra passet',NULL,NULL,'green','no','2019-10-18 15:52:51'),(365,79,2,'INSERT',2,11,NULL,76,'default.png','2019-10-19 00:00:00','19/20','1','Mellan första och andra passet en bit ut i mossen akvägen ',NULL,NULL,'yellow','no','2019-10-19 16:34:58'),(366,80,2,'INSERT',2,2,NULL,77,'default.png','2019-10-19 00:00:00','19/20','1','Stubbarna grusgropsvägen ',NULL,NULL,'yellow','no','2019-10-19 16:35:47'),(367,81,2,'INSERT',2,2,NULL,78,'default.png','2019-10-18 00:00:00','19/20','2','Johans torn stora gärdet ',NULL,NULL,'yellow','no','2019-10-19 16:36:37'),(368,80,2,'UPDATE',2,2,NULL,77,'default.png','2019-10-19 00:00:00','19/20','1','Stubbarna grusgropsvägen ',NULL,NULL,'green','yes','2019-10-19 16:37:57'),(369,80,2,'UPDATE',2,2,NULL,77,'default.png','2019-10-19 00:00:00','19/20','1','Stubbarna grusgropsvägen ',NULL,NULL,'green','yes','2019-10-19 16:37:57'),(370,79,2,'UPDATE',2,11,NULL,76,'default.png','2019-10-19 00:00:00','19/20','1','Mellan första och andra passet en bit ut i mossen akvägen ',NULL,NULL,'green','yes','2019-10-19 16:38:30'),(371,79,2,'UPDATE',2,11,NULL,76,'default.png','2019-10-19 00:00:00','19/20','1','Mellan första och andra passet en bit ut i mossen akvägen ',NULL,NULL,'green','yes','2019-10-19 16:38:30'),(372,82,2,'INSERT',2,19,NULL,79,'default.png','2019-10-23 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'yellow','no','2019-10-23 17:46:27'),(373,82,2,'UPDATE',2,19,NULL,79,'hunterjohan-82.jpg','2019-10-23 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'yellow','no','2019-10-23 17:47:08'),(374,83,2,'INSERT',2,25,NULL,80,'default.png','2019-11-09 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'yellow','no','2019-11-09 16:52:33'),(375,83,2,'UPDATE',2,25,NULL,80,'hunter-83.jpg','2019-11-09 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'yellow','no','2019-11-09 18:02:34'),(376,84,2,'INSERT',2,12,NULL,81,'default.png','2019-11-03 00:00:00','19/20','1','Hygget nedom tornet jannesberg',NULL,NULL,'yellow','no','2019-11-09 18:04:41'),(377,84,2,'UPDATE',2,12,NULL,81,'hunterjohan-84.JPG','2019-11-03 00:00:00','19/20','1','Hygget nedom tornet jannesberg',NULL,NULL,'yellow','no','2019-11-09 18:05:23'),(378,85,2,'INSERT',2,12,NULL,82,'default.png','2019-11-16 00:00:00','19/20','1','Andra tornet efter kojan',NULL,NULL,'yellow','no','2019-11-16 11:45:00'),(379,85,2,'UPDATE',2,12,NULL,82,'hunter-85.JPG','2019-11-16 00:00:00','19/20','1','Andra tornet efter kojan',NULL,NULL,'yellow','no','2019-11-16 13:54:20'),(380,85,2,'UPDATE',2,12,NULL,82,'hunterjohan-85.JPG','2019-11-16 00:00:00','19/20','1','Andra tornet efter kojan',NULL,NULL,'yellow','no','2019-11-16 13:55:01'),(381,85,2,'UPDATE',2,12,NULL,82,'hunterjohan-85.JPG','2019-11-16 00:00:00','19/20','1','Andra tornet efter kojan',NULL,NULL,'yellow','no','2019-11-16 13:55:59'),(382,85,2,'UPDATE',2,12,NULL,82,'hunterjohan-85.JPG','2019-11-16 00:00:00','19/20','1','Andra tornet efter kojan',NULL,NULL,'green','yes','2019-11-16 13:56:27'),(383,85,2,'UPDATE',2,12,NULL,82,'hunterjohan-85.JPG','2019-11-16 00:00:00','19/20','1','Andra tornet efter kojan',NULL,NULL,'green','yes','2019-11-16 13:56:27'),(384,83,2,'UPDATE',2,25,NULL,80,'hunter-83.jpg','2019-11-09 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'green','yes','2019-11-30 08:15:31'),(385,83,2,'UPDATE',2,25,NULL,80,'hunter-83.jpg','2019-11-09 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'green','yes','2019-11-30 08:15:31'),(386,86,2,'INSERT',2,26,NULL,83,'default.png','2019-11-30 00:00:00','19/20','1','Snickarbo',NULL,NULL,'yellow','no','2019-11-30 08:52:39'),(387,87,2,'INSERT',2,11,NULL,84,'default.png','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen',NULL,NULL,'yellow','no','2019-11-30 10:21:25'),(388,88,2,'INSERT',2,11,NULL,85,'default.png','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen ',NULL,NULL,'yellow','no','2019-11-30 10:22:13'),(389,89,2,'INSERT',2,19,NULL,86,'default.png','2019-11-30 00:00:00','19/20','1','Björken snickarbohagen ',NULL,NULL,'yellow','no','2019-11-30 10:23:07'),(390,87,2,'UPDATE',2,11,NULL,84,'hunterjohan-87.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen',NULL,NULL,'yellow','no','2019-11-30 16:56:36'),(391,88,2,'UPDATE',2,11,NULL,85,'hunterjohan-88.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen ',NULL,NULL,'yellow','no','2019-11-30 16:57:22'),(392,90,2,'INSERT',2,26,NULL,87,'default.png','2019-11-30 00:00:00','19/20','1','Mellan kojan och mossevägen',NULL,NULL,'yellow','no','2019-12-01 19:52:12'),(393,90,2,'UPDATE',2,26,NULL,87,'default.png','2019-11-30 00:00:00','19/20','1','Mellan kojan och mossevägen',NULL,NULL,'green','yes','2019-12-01 19:54:43'),(394,90,2,'UPDATE',2,26,NULL,87,'default.png','2019-11-30 00:00:00','19/20','1','Mellan kojan och mossevägen',NULL,NULL,'green','yes','2019-12-01 19:54:43'),(395,86,2,'UPDATE',2,26,NULL,83,'default.png','2019-11-30 00:00:00','19/20','1','Snickarbo',NULL,NULL,'green','yes','2019-12-01 19:55:33'),(396,86,2,'UPDATE',2,26,NULL,83,'default.png','2019-11-30 00:00:00','19/20','1','Snickarbo',NULL,NULL,'green','yes','2019-12-01 19:55:33'),(397,82,2,'UPDATE',2,19,NULL,79,'hunterjohan-82.jpg','2019-10-23 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'green','yes','2019-12-01 19:58:53'),(398,82,2,'UPDATE',2,19,NULL,79,'hunterjohan-82.jpg','2019-10-23 00:00:00','19/20','1','Hygget vid harberget',NULL,NULL,'green','yes','2019-12-01 19:58:53'),(399,88,2,'UPDATE',2,11,NULL,85,'hunterjohan-88.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen ',NULL,NULL,'yellow','no','2019-12-04 14:52:07'),(400,89,2,'UPDATE',2,19,NULL,86,'default.png','2019-11-30 00:00:00','19/20','1','Bj&ouml;rken snickarbohagen ',NULL,NULL,'yellow','no','2019-12-04 14:52:26'),(401,89,2,'UPDATE',2,19,NULL,86,'hunterjohan-89.JPG','2019-11-30 00:00:00','19/20','1','Bj&ouml;rken snickarbohagen ',NULL,NULL,'yellow','no','2019-12-04 14:53:01'),(402,87,2,'UPDATE',2,11,NULL,84,'hunterjohan-87.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen',NULL,NULL,'green','yes','2019-12-09 15:26:54'),(403,87,2,'UPDATE',2,11,NULL,84,'hunterjohan-87.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen',NULL,NULL,'green','yes','2019-12-09 15:26:54'),(404,88,2,'UPDATE',2,11,NULL,85,'hunterjohan-88.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen ',NULL,NULL,'green','yes','2019-12-09 15:27:11'),(405,88,2,'UPDATE',2,11,NULL,85,'hunterjohan-88.JPG','2019-11-30 00:00:00','19/20','1','Sten snickarbohagen ',NULL,NULL,'green','yes','2019-12-09 15:27:11'),(406,89,2,'UPDATE',2,19,NULL,86,'hunterjohan-89.JPG','2019-11-30 00:00:00','19/20','1','Bj&ouml;rken snickarbohagen ',NULL,NULL,'green','yes','2019-12-09 15:27:47'),(407,89,2,'UPDATE',2,19,NULL,86,'hunterjohan-89.JPG','2019-11-30 00:00:00','19/20','1','Bj&ouml;rken snickarbohagen ',NULL,NULL,'green','yes','2019-12-09 15:27:47'),(408,84,2,'UPDATE',2,12,NULL,81,'hunterjohan-84.JPG','2019-11-03 00:00:00','19/20','1','Hygget nedom tornet jannesberg',NULL,NULL,'green','yes','2019-12-14 18:34:50'),(409,84,2,'UPDATE',2,12,NULL,81,'hunterjohan-84.JPG','2019-11-03 00:00:00','19/20','1','Hygget nedom tornet jannesberg',NULL,NULL,'green','yes','2019-12-14 18:34:50'),(410,91,2,'INSERT',2,2,NULL,88,'default.png','2020-01-19 00:00:00','19/20','1','Kullen vid Anders mårdfälla stenmurshålet',NULL,NULL,'yellow','no','2020-01-19 11:42:05'),(411,92,2,'INSERT',2,12,NULL,89,'default.png','2020-01-19 00:00:00','19/20','1','Brandgatan',NULL,NULL,'yellow','no','2020-01-19 15:30:33'),(412,91,2,'UPDATE',2,2,NULL,88,'hunterjohan-91.jpg','2020-01-19 00:00:00','19/20','1','Kullen vid Anders mårdfälla stenmurshålet',NULL,NULL,'yellow','no','2020-01-19 15:31:04'),(413,91,2,'UPDATE',2,2,NULL,88,'hunterjohan-91.JPG','2020-01-19 00:00:00','19/20','1','Kullen vid Anders mårdfälla stenmurshålet',NULL,NULL,'yellow','no','2020-01-19 15:31:56'),(414,92,2,'UPDATE',2,12,NULL,89,'hunterjohan-92.jpg','2020-01-19 00:00:00','19/20','1','Brandgatan',NULL,NULL,'yellow','no','2020-01-19 15:32:55'),(415,91,2,'UPDATE',2,2,NULL,88,'hunterjohan-91.JPG','2020-01-19 00:00:00','19/20','1','Kullen vid Anders mårdfälla stenmurshålet',NULL,NULL,'green','yes','2020-01-19 15:36:47'),(416,91,2,'UPDATE',2,2,NULL,88,'hunterjohan-91.JPG','2020-01-19 00:00:00','19/20','1','Kullen vid Anders mårdfälla stenmurshålet',NULL,NULL,'green','yes','2020-01-19 15:36:47'),(417,92,2,'UPDATE',2,12,NULL,89,'hunterjohan-92.jpg','2020-01-19 00:00:00','19/20','1','Brandgatan',NULL,NULL,'green','yes','2020-01-19 15:37:18'),(418,92,2,'UPDATE',2,12,NULL,89,'hunterjohan-92.jpg','2020-01-19 00:00:00','19/20','1','Brandgatan',NULL,NULL,'green','yes','2020-01-19 15:37:18'),(419,93,11,'INSERT',11,11,NULL,90,'default.png','2019-12-31 00:00:00','19/20','1','Nedre vändplan\r\n',NULL,NULL,'yellow','no','2020-01-20 08:58:03'),(420,94,2,'INSERT',2,27,NULL,91,'default.png','2019-12-14 00:00:00','19/20','1','Tornet stenmurshålet',NULL,NULL,'yellow','no','2020-01-20 12:39:56'),(421,94,2,'UPDATE',2,27,NULL,91,'hunterjohan-94.JPG','2019-12-14 00:00:00','19/20','1','Tornet stenmurshålet',NULL,NULL,'yellow','no','2020-01-20 12:40:57'),(422,94,2,'UPDATE',2,27,NULL,91,'hunterjohan-94.JPG','2019-12-14 00:00:00','19/20','1','Tornet stenmurshålet',NULL,NULL,'yellow','no','2020-01-20 12:42:02'),(423,94,2,'UPDATE',2,27,NULL,91,'hunterjohan-94.JPG','2019-12-14 00:00:00','19/20','1','Tornet stenmurshålet',NULL,NULL,'green','yes','2020-01-20 12:43:12'),(424,94,2,'UPDATE',2,27,NULL,91,'hunterjohan-94.JPG','2019-12-14 00:00:00','19/20','1','Tornet stenmurshålet',NULL,NULL,'green','yes','2020-01-20 12:43:12'),(425,95,2,'INSERT',2,11,NULL,92,'default.png','2020-01-26 00:00:00','19/20','1','I början av mossevägen',NULL,NULL,'yellow','no','2020-01-26 12:50:41'),(426,95,2,'UPDATE',2,11,NULL,92,'hunterviktor-95.JPG','2020-01-26 00:00:00','19/20','1','I början av mossevägen',NULL,NULL,'yellow','no','2020-01-30 12:03:05'),(427,95,2,'UPDATE',2,11,NULL,92,'hunterviktor-95.JPG','2020-01-26 00:00:00','19/20','1','I början av mossevägen',NULL,NULL,'green','yes','2020-02-01 19:52:30'),(428,95,2,'UPDATE',2,11,NULL,92,'hunterviktor-95.JPG','2020-01-26 00:00:00','19/20','1','I början av mossevägen',NULL,NULL,'green','yes','2020-02-01 19:52:30'),(429,96,11,'INSERT',11,10,NULL,93,'default.png','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'yellow','no','2020-02-04 16:49:05'),(430,97,2,'INSERT',2,28,NULL,94,'default.png','2020-02-08 00:00:00','19/20','1','Pentagon ',NULL,NULL,'yellow','no','2020-02-08 23:06:05'),(431,97,2,'UPDATE',2,28,NULL,94,'default.png','2020-02-08 00:00:00','19/20','1','Pentagon ',NULL,NULL,'green','yes','2020-02-08 23:06:46'),(432,97,2,'UPDATE',2,28,NULL,94,'default.png','2020-02-08 00:00:00','19/20','1','Pentagon ',NULL,NULL,'green','yes','2020-02-08 23:06:46'),(433,97,2,'UPDATE',2,28,NULL,94,'default.png','2020-02-08 00:00:00','19/20','1','Pentagon ',NULL,NULL,'green','no','2020-02-09 12:16:57'),(434,97,2,'UPDATE',2,28,NULL,94,'hunterjohan-97.jpeg','2020-02-08 00:00:00','19/20','1','Pentagon ',NULL,NULL,'green','no','2020-02-09 12:17:57'),(435,97,2,'UPDATE',2,28,NULL,94,'hunterjohan-97.jpeg','2020-02-08 00:00:00','19/20','1','Pentagon ',NULL,NULL,'green','yes','2020-02-09 12:18:16'),(436,98,11,'INSERT',11,27,NULL,95,'default.png','2020-02-13 00:00:00','19/20','1','Nedre vändplan Viktor och robin satt ihop i pentagon',NULL,NULL,'yellow','no','2020-02-15 08:58:43'),(437,98,11,'UPDATE',11,27,NULL,95,'hunterviktor-98.JPG','2020-02-13 00:00:00','19/20','1','Nedre vändplan Viktor och robin satt ihop i pentagon',NULL,NULL,'yellow','no','2020-02-15 08:59:07'),(438,98,11,'UPDATE',11,27,NULL,95,'hunterviktor-98.JPG','2020-02-13 00:00:00','19/20','1','Nedre vändplan Viktor och robin satt ihop i pentagon',NULL,NULL,'green','yes','2020-02-15 09:00:37'),(439,98,11,'UPDATE',11,27,NULL,95,'hunterviktor-98.JPG','2020-02-13 00:00:00','19/20','1','Nedre vändplan Viktor och robin satt ihop i pentagon',NULL,NULL,'green','yes','2020-02-15 09:00:37'),(440,96,11,'UPDATE',11,10,NULL,93,'default.png','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'green','yes','2020-02-15 09:02:54'),(441,96,11,'UPDATE',11,10,NULL,93,'default.png','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'green','yes','2020-02-15 09:02:54'),(442,93,11,'UPDATE',11,11,NULL,90,'default.png','2019-12-31 00:00:00','19/20','1','Nedre vändplan\r\n',NULL,NULL,'green','yes','2020-02-15 09:03:11'),(443,93,11,'UPDATE',11,11,NULL,90,'default.png','2019-12-31 00:00:00','19/20','1','Nedre vändplan\r\n',NULL,NULL,'green','yes','2020-02-15 09:03:11'),(444,96,11,'UPDATE',11,10,NULL,93,'default.png','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'green','no','2020-02-15 18:17:26'),(445,96,11,'UPDATE',11,10,NULL,93,'hunterjohan-96.jpg','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'green','no','2020-02-15 19:41:14'),(446,96,11,'UPDATE',11,10,NULL,93,'hunterjohan-96.jpg','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'green','no','2020-02-15 19:42:46'),(447,96,11,'UPDATE',11,10,NULL,93,'hunterjohan-96.JPG','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'green','no','2020-02-15 19:44:40'),(448,96,11,'UPDATE',11,10,NULL,93,'hunterjohan-96.JPG','2020-01-31 00:00:00','19/20','1','Gustav Adolfs väg tornet',NULL,NULL,'green','no','2020-02-15 19:46:04'),(449,99,11,'INSERT',11,11,NULL,96,'default.png','2020-02-27 00:00:00','19/20','1','Hygget vid Kristin ',NULL,NULL,'yellow','no','2020-03-02 18:59:20'),(450,99,11,'UPDATE',11,11,NULL,96,'hunterviktor-99.jpg','2020-02-27 00:00:00','19/20','1','Hygget vid Kristin ',NULL,NULL,'yellow','no','2020-03-02 19:00:17'),(451,99,11,'UPDATE',11,11,NULL,96,'hunterviktor-99.jpg','2020-02-27 00:00:00','19/20','1','Hygget vid Kristin ',NULL,NULL,'green','yes','2020-03-02 19:02:59'),(452,99,11,'UPDATE',11,11,NULL,96,'hunterviktor-99.jpg','2020-02-27 00:00:00','19/20','1','Hygget vid Kristin ',NULL,NULL,'green','yes','2020-03-02 19:02:59');
/*!40000 ALTER TABLE `SRKillreportLogg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `SRKillreportLoggView`
--

DROP TABLE IF EXISTS `SRKillreportLoggView`;
/*!50001 DROP VIEW IF EXISTS `SRKillreportLoggView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRKillreportLoggView` (
  `id` tinyint NOT NULL,
  `for_account` tinyint NOT NULL,
  `animalid` tinyint NOT NULL,
  `typeofchange` tinyint NOT NULL,
  `image` tinyint NOT NULL,
  `kindofhunt` tinyint NOT NULL,
  `report_status` tinyint NOT NULL,
  `reported_from` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `dateofkill` tinyint NOT NULL,
  `dateofreport` tinyint NOT NULL,
  `area` tinyint NOT NULL,
  `areaname` tinyint NOT NULL,
  `place` tinyint NOT NULL,
  `created` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SRKillreportView`
--

DROP TABLE IF EXISTS `SRKillreportView`;
/*!50001 DROP VIEW IF EXISTS `SRKillreportView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRKillreportView` (
  `Killreportid` tinyint NOT NULL,
  `for_id` tinyint NOT NULL,
  `Animalid` tinyint NOT NULL,
  `image` tinyint NOT NULL,
  `kindofhunt` tinyint NOT NULL,
  `report_status` tinyint NOT NULL,
  `locked` tinyint NOT NULL,
  `reported_from` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `engspecies` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `dateofkill` tinyint NOT NULL,
  `dateofreport` tinyint NOT NULL,
  `antlers` tinyint NOT NULL,
  `points` tinyint NOT NULL,
  `live_weight` tinyint NOT NULL,
  `aprox_live_weight` tinyint NOT NULL,
  `passad_weight` tinyint NOT NULL,
  `aprox_passad_weight` tinyint NOT NULL,
  `carcass_weight` tinyint NOT NULL,
  `aprox_carcass_weight` tinyint NOT NULL,
  `cut_weight` tinyint NOT NULL,
  `heart_weight` tinyint NOT NULL,
  `waste` tinyint NOT NULL,
  `area` tinyint NOT NULL,
  `areaname` tinyint NOT NULL,
  `place` tinyint NOT NULL,
  `deleted` tinyint NOT NULL,
  `lat` tinyint NOT NULL,
  `lng` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SRMailList`
--

DROP TABLE IF EXISTS `SRMailList`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRMailList` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'yes',
  `firstname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mailtriggers` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRMailList`
--

LOCK TABLES `SRMailList` WRITE;
/*!40000 ALTER TABLE `SRMailList` DISABLE KEYS */;
INSERT INTO `SRMailList` VALUES (1,'yes','Johan','Eriksson','glotterback@telia.com','insertreport,updatereport,deletereport,insertmeat,deletemeat'),(2,'yes','Magnus','Andersson','magnusandersson076@gmail.com','insertreport,updatereport,deletereport,insertmeat,deletemeat');
/*!40000 ALTER TABLE `SRMailList` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SRMeat`
--

DROP TABLE IF EXISTS `SRMeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRMeat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `killreport` int(11) DEFAULT NULL,
  `hunter` int(11) DEFAULT NULL,
  `share_kilogram` float DEFAULT NULL,
  `share_lot` int(11) DEFAULT NULL,
  `actual_kilogram` float DEFAULT NULL,
  `outsidenotes` text COLLATE utf8mb4_unicode_ci,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `killreport` (`killreport`),
  KEY `hunter` (`hunter`),
  CONSTRAINT `SRMeat_ibfk_1` FOREIGN KEY (`killreport`) REFERENCES `SRKillreport` (`id`),
  CONSTRAINT `SRMeat_ibfk_2` FOREIGN KEY (`hunter`) REFERENCES `SRAccounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRMeat`
--

LOCK TABLES `SRMeat` WRITE;
/*!40000 ALTER TABLE `SRMeat` DISABLE KEYS */;
INSERT INTO `SRMeat` VALUES (1,3,10,23.5,1,NULL,NULL,'2017-10-24 18:08:16',NULL,NULL),(2,3,15,23.5,1,NULL,NULL,'2017-10-24 18:08:16',NULL,NULL),(3,6,12,47,NULL,NULL,NULL,'2017-10-25 17:19:25',NULL,NULL),(4,2,10,32,NULL,NULL,NULL,'2017-10-27 17:14:53',NULL,NULL),(5,8,11,33,NULL,NULL,NULL,'2017-10-27 17:22:51',NULL,NULL),(6,10,14,27,NULL,NULL,NULL,'2017-11-25 20:56:14',NULL,NULL),(7,16,13,46,NULL,NULL,NULL,'2017-12-11 18:42:35',NULL,NULL),(8,17,12,25,NULL,NULL,NULL,'2017-12-11 21:10:41',NULL,NULL),(9,14,11,17,NULL,NULL,NULL,'2017-12-13 17:57:13',NULL,NULL),(10,18,2,23,NULL,NULL,NULL,'2017-12-17 19:34:02',NULL,NULL),(11,21,15,16,NULL,NULL,NULL,'2017-12-29 10:23:01',NULL,NULL),(12,22,2,11,NULL,NULL,NULL,'2017-12-30 19:01:40',NULL,NULL),(13,23,11,31.5,NULL,NULL,NULL,'2018-01-08 18:22:10',NULL,NULL),(14,23,10,31.5,NULL,NULL,NULL,'2018-01-08 18:22:10',NULL,NULL),(15,24,16,19,NULL,NULL,NULL,'2018-01-10 08:03:20',NULL,NULL),(16,31,9,20,NULL,NULL,NULL,'2018-01-26 12:39:07',NULL,NULL),(17,32,2,25,NULL,NULL,NULL,'2018-01-28 15:11:12',NULL,NULL),(18,28,16,26,NULL,NULL,NULL,'2018-01-29 09:03:27',NULL,NULL),(19,36,13,35,NULL,NULL,NULL,'2018-02-18 16:05:16',NULL,NULL),(20,35,13,15,NULL,NULL,NULL,'2018-02-18 19:42:12',NULL,NULL),(21,34,16,17,NULL,NULL,NULL,'2018-02-20 10:06:20',NULL,NULL),(22,38,2,15,NULL,NULL,NULL,'2018-02-21 22:22:29',NULL,NULL),(23,37,14,22,NULL,NULL,NULL,'2018-02-22 18:15:19',NULL,NULL),(24,27,9,11,NULL,NULL,NULL,'2018-02-25 15:01:20',NULL,NULL),(25,51,15,34,NULL,NULL,NULL,'2019-01-09 15:25:38',NULL,NULL),(26,54,13,29,NULL,NULL,NULL,'2019-01-15 21:10:41',NULL,NULL),(27,48,12,46,NULL,NULL,NULL,'2019-01-20 09:56:06',NULL,NULL),(28,45,2,33,NULL,NULL,NULL,'2019-01-20 11:13:34',NULL,NULL),(29,52,23,30,NULL,NULL,NULL,'2019-01-20 11:16:04',NULL,NULL),(30,47,12,27.5,NULL,NULL,NULL,'2019-01-21 08:58:06',NULL,NULL),(31,47,15,27.5,NULL,NULL,NULL,'2019-01-21 08:58:06',NULL,NULL),(32,53,19,28,NULL,NULL,NULL,'2019-01-26 19:59:01',NULL,NULL),(33,60,19,31,NULL,NULL,NULL,'2019-01-26 19:59:50',NULL,NULL),(34,60,13,31,NULL,NULL,NULL,'2019-01-26 19:59:50',NULL,NULL),(35,50,10,44,NULL,NULL,NULL,'2019-01-27 09:47:23',NULL,NULL),(36,42,11,28,NULL,NULL,NULL,'2019-01-27 09:59:26',NULL,NULL),(37,65,13,37,NULL,NULL,NULL,'2019-01-31 19:18:08',NULL,NULL),(38,68,14,22,NULL,NULL,NULL,'2019-02-02 09:14:01',NULL,NULL),(39,58,14,40,NULL,NULL,NULL,'2019-02-02 10:32:05',NULL,NULL),(40,62,24,40,NULL,NULL,NULL,'2019-02-02 11:51:18',NULL,NULL),(41,61,9,31,NULL,NULL,NULL,'2019-02-02 14:02:57',NULL,NULL),(42,61,2,31,NULL,NULL,NULL,'2019-02-02 14:02:57',NULL,NULL),(43,67,11,22,NULL,NULL,NULL,'2019-02-06 18:04:57',NULL,NULL),(44,66,-1,27,NULL,NULL,'Mats Johansson vart tilldelad k&ouml;ttet.','2019-02-06 18:07:32',NULL,NULL),(45,43,18,10,NULL,NULL,NULL,'2019-02-06 18:17:32',NULL,NULL),(46,46,18,27,NULL,NULL,NULL,'2019-02-06 18:18:31',NULL,NULL),(47,59,23,39,NULL,NULL,NULL,'2019-02-06 18:23:01',NULL,NULL),(48,55,24,12,NULL,NULL,NULL,'2019-02-06 18:25:26',NULL,NULL),(49,49,9,10,NULL,NULL,NULL,'2019-02-06 18:27:28',NULL,NULL),(50,70,11,10,NULL,NULL,NULL,'2019-02-06 18:30:06',NULL,NULL),(51,71,18,31,NULL,NULL,NULL,'2019-02-06 18:36:50',NULL,NULL),(52,72,11,11,NULL,NULL,NULL,'2019-02-06 18:42:44',NULL,NULL),(53,73,12,25,NULL,NULL,NULL,'2019-02-07 13:20:55',NULL,NULL),(54,78,12,31.5,NULL,NULL,NULL,'2019-10-18 15:49:34',NULL,NULL),(55,78,13,31.5,NULL,NULL,NULL,'2019-10-18 15:49:34',NULL,NULL),(56,80,2,15,NULL,NULL,NULL,'2019-10-19 16:37:56',NULL,NULL),(57,79,2,26,1,NULL,NULL,'2019-10-19 16:38:29',NULL,NULL),(58,79,10,26,1,NULL,NULL,'2019-10-19 16:38:29',NULL,NULL),(59,85,12,40,NULL,NULL,NULL,'2019-11-16 13:56:27',NULL,NULL),(60,83,15,38,NULL,NULL,NULL,'2019-11-30 08:15:30',NULL,NULL),(61,90,-1,15,NULL,NULL,'Niclas k&ouml;pte djuret f&ouml;r 25:- kilot slaktkropp','2019-12-01 19:54:42',NULL,NULL),(62,86,-1,17,NULL,NULL,'Niclas k&ouml;pte djuret f&ouml;r 25:- kilo slaktkropp','2019-12-01 19:55:32',NULL,NULL),(63,82,19,34,NULL,NULL,NULL,'2019-12-01 19:58:53',NULL,NULL),(64,87,24,22,NULL,NULL,NULL,'2019-12-09 15:26:54',NULL,NULL),(65,88,18,14,NULL,NULL,NULL,'2019-12-09 15:27:11',NULL,NULL),(66,89,19,16,NULL,NULL,NULL,'2019-12-09 15:27:46',NULL,NULL),(67,84,23,37,NULL,NULL,NULL,'2019-12-14 18:34:50',NULL,NULL),(68,91,2,17,NULL,NULL,NULL,'2020-01-19 15:36:46',NULL,NULL),(69,92,12,15,NULL,NULL,NULL,'2020-01-19 15:37:17',NULL,NULL),(70,94,23,26,NULL,NULL,NULL,'2020-01-20 12:43:11',NULL,NULL),(71,95,11,38,NULL,NULL,NULL,'2020-02-01 19:52:29',NULL,NULL),(72,97,19,17,NULL,NULL,NULL,'2020-02-08 23:06:45',NULL,NULL),(73,98,-1,15,NULL,NULL,NULL,'2020-02-15 09:00:36',NULL,NULL),(74,96,10,9,NULL,NULL,NULL,'2020-02-15 09:02:54',NULL,NULL),(75,93,11,16,NULL,NULL,NULL,'2020-02-15 09:03:11',NULL,NULL),(76,99,11,18,NULL,NULL,NULL,'2020-03-02 19:02:58',NULL,NULL);
/*!40000 ALTER TABLE `SRMeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `SRMeatBoarSumView`
--

DROP TABLE IF EXISTS `SRMeatBoarSumView`;
/*!50001 DROP VIEW IF EXISTS `SRMeatBoarSumView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRMeatBoarSumView` (
  `killreportid` tinyint NOT NULL,
  `hunterid` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `share_kilosum` tinyint NOT NULL,
  `actual_kilosum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SRMeatDovSumView`
--

DROP TABLE IF EXISTS `SRMeatDovSumView`;
/*!50001 DROP VIEW IF EXISTS `SRMeatDovSumView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRMeatDovSumView` (
  `killreportid` tinyint NOT NULL,
  `hunterid` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `share_kilosum` tinyint NOT NULL,
  `actual_kilosum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SRMeatKronSumView`
--

DROP TABLE IF EXISTS `SRMeatKronSumView`;
/*!50001 DROP VIEW IF EXISTS `SRMeatKronSumView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRMeatKronSumView` (
  `killreportid` tinyint NOT NULL,
  `hunterid` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `share_kilosum` tinyint NOT NULL,
  `actual_kilosum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SRMeatMooseSumView`
--

DROP TABLE IF EXISTS `SRMeatMooseSumView`;
/*!50001 DROP VIEW IF EXISTS `SRMeatMooseSumView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRMeatMooseSumView` (
  `killreportid` tinyint NOT NULL,
  `hunterid` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `share_kilosum` tinyint NOT NULL,
  `actual_kilosum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SRMeatRoedeerSumView`
--

DROP TABLE IF EXISTS `SRMeatRoedeerSumView`;
/*!50001 DROP VIEW IF EXISTS `SRMeatRoedeerSumView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRMeatRoedeerSumView` (
  `killreportid` tinyint NOT NULL,
  `hunterid` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `share_kilosum` tinyint NOT NULL,
  `actual_kilosum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SRMeatSumView`
--

DROP TABLE IF EXISTS `SRMeatSumView`;
/*!50001 DROP VIEW IF EXISTS `SRMeatSumView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRMeatSumView` (
  `killreportid` tinyint NOT NULL,
  `hunterid` tinyint NOT NULL,
  `role` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `share_kilosum` tinyint NOT NULL,
  `share_lot` tinyint NOT NULL,
  `actual_kilosum` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SRMeatView`
--

DROP TABLE IF EXISTS `SRMeatView`;
/*!50001 DROP VIEW IF EXISTS `SRMeatView`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRMeatView` (
  `killreportid` tinyint NOT NULL,
  `hunterid` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `season` tinyint NOT NULL,
  `species` tinyint NOT NULL,
  `speciestype` tinyint NOT NULL,
  `share_kilogram` tinyint NOT NULL,
  `share_lot` tinyint NOT NULL,
  `actual_kilogram` tinyint NOT NULL,
  `outsidenotes` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `SRMooseLots`
--

DROP TABLE IF EXISTS `SRMooseLots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SRMooseLots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hunterid` int(11) DEFAULT NULL,
  `lot` int(11) DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hunterid` (`hunterid`),
  CONSTRAINT `SRMooseLots_ibfk_1` FOREIGN KEY (`hunterid`) REFERENCES `SRAccounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SRMooseLots`
--

LOCK TABLES `SRMooseLots` WRITE;
/*!40000 ALTER TABLE `SRMooseLots` DISABLE KEYS */;
INSERT INTO `SRMooseLots` VALUES (1,10,2,'2017-10-27 12:52:39','2019-10-19 16:38:29',NULL),(2,15,1,'2017-10-27 12:52:45',NULL,NULL),(3,2,1,'2019-10-19 16:38:29','2019-10-19 16:38:29',NULL);
/*!40000 ALTER TABLE `SRMooseLots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `SRPortfoliolistedview`
--

DROP TABLE IF EXISTS `SRPortfoliolistedview`;
/*!50001 DROP VIEW IF EXISTS `SRPortfoliolistedview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRPortfoliolistedview` (
  `imageportfolio` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `setname` tinyint NOT NULL,
  `imagename` tinyint NOT NULL,
  `imagetype` tinyint NOT NULL,
  `imagefolder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `SRPortfolioview`
--

DROP TABLE IF EXISTS `SRPortfolioview`;
/*!50001 DROP VIEW IF EXISTS `SRPortfolioview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `SRPortfolioview` (
  `imageportfolio` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `setname` tinyint NOT NULL,
  `imagename` tinyint NOT NULL,
  `fullname` tinyint NOT NULL,
  `imagefolder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `smarisaccounts`
--

DROP TABLE IF EXISTS `smarisaccounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smarisaccounts` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `active` char(5) COLLATE utf8mb4_unicode_ci DEFAULT 'yes',
  `role` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `occupation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'hunter',
  `username` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` char(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` char(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postnumber` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mobile` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inlogged` timestamp NULL DEFAULT NULL,
  `notes` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `deleted` timestamp NULL DEFAULT NULL,
  `address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smarisaccounts`
--

LOCK TABLES `smarisaccounts` WRITE;
/*!40000 ALTER TABLE `smarisaccounts` DISABLE KEYS */;
INSERT INTO `smarisaccounts` VALUES (1,'yes','admin','webmaster','adminmagnus','$2y$10$APjTrD.uxwI2HAbCFklbxeyyrjCL5tuNF2/qqifNYyG/4irmk7cxa','Magnus','Andersson','magnusandersson076@gmail.com','712 91','','0735281761','H&auml;llefors','2017-10-02 12:04:19','','2017-09-20 06:27:13',NULL,NULL,'R&ouml;jslav&auml;gen 3'),(2,'yes','admin','hunter','johan','$2y$10$lD8E5Yk/ULKOCFkaYXm9FerrPS34CBfIxQxxBSgtUIPRYk.35hIqa','Johan','Eriksson','glotterback@telia.com',NULL,NULL,NULL,NULL,'2017-10-02 08:08:46',NULL,'2017-09-20 06:30:12',NULL,NULL,NULL),(3,'yes','user','hunter','testuser','$2y$10$SRruL5buGKFIPPDDLUVOFOXc4fq.kx6.qtrqE.SkoZ4ADM/GpDiOK','testkontouser','','test@email.se','12345','','','Testla','2017-09-27 19:51:15','testuser, testuser','2017-09-20 06:57:35',NULL,NULL,'Testuserv&auml;gen 1'),(4,'yes','user','hunter','gasten','$2y$10$L7mvXAXH/eLjnd1nppm9F.N5ybHWX5w/hPoYPSnqybi35JzNKqZpG','G&auml;st','g&auml;stis','gast@email.se',NULL,NULL,NULL,NULL,NULL,NULL,'2017-09-28 19:59:53',NULL,'2017-09-28 18:32:45',NULL);
/*!40000 ALTER TABLE `smarisaccounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smarisimage`
--

DROP TABLE IF EXISTS `smarisimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smarisimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imagename` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `setname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagefolder` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `imagesize` int(255) DEFAULT NULL,
  `imagetype` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullimagename` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(10000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `public` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'public',
  `uploaded` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smarisimage`
--

LOCK TABLES `smarisimage` WRITE;
/*!40000 ALTER TABLE `smarisimage` DISABLE KEYS */;
INSERT INTO `smarisimage` VALUES (3,'adminmagnus-3',NULL,'uploadedimages',5082709,'JPG','adminmagnus-3.JPG',NULL,'public','2017-09-27 21:54:15'),(4,'adminmagnus',NULL,'uploadedimages',1213199,'JPG','adminmagnus.JPG',NULL,'public','2017-09-27 21:55:25'),(5,'adminmagnus-2',NULL,'uploadedimages',389348,'JPG','adminmagnus-2.JPG',NULL,'public','2017-09-27 21:56:11'),(6,'adminmagnus-4',NULL,'uploadedimages',1720786,'JPG','adminmagnus-4.JPG',NULL,'public','2017-09-27 22:21:43'),(7,'adminmagnus-5',NULL,'uploadedimages',1771958,'PNG','adminmagnus-5.PNG',NULL,'public','2017-10-06 16:47:48'),(8,'adminmagnus-6',NULL,'uploadedimages',907916,'JPG','adminmagnus-6.JPG',NULL,'public','2017-10-06 17:18:47');
/*!40000 ALTER TABLE `smarisimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smarisimageportfolio`
--

DROP TABLE IF EXISTS `smarisimageportfolio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smarisimageportfolio` (
  `id` int(11) NOT NULL DEFAULT '0',
  `account` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `account` (`account`),
  CONSTRAINT `smarisimageportfolio_ibfk_1` FOREIGN KEY (`account`) REFERENCES `smarisaccounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smarisimageportfolio`
--

LOCK TABLES `smarisimageportfolio` WRITE;
/*!40000 ALTER TABLE `smarisimageportfolio` DISABLE KEYS */;
INSERT INTO `smarisimageportfolio` VALUES (1,1);
/*!40000 ALTER TABLE `smarisimageportfolio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `smarisimagerow`
--

DROP TABLE IF EXISTS `smarisimagerow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `smarisimagerow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageportfolio` int(11) DEFAULT NULL,
  `image` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `imageportfolio` (`imageportfolio`),
  KEY `image` (`image`),
  CONSTRAINT `smarisimagerow_ibfk_1` FOREIGN KEY (`imageportfolio`) REFERENCES `smarisimageportfolio` (`id`),
  CONSTRAINT `smarisimagerow_ibfk_2` FOREIGN KEY (`image`) REFERENCES `smarisimage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smarisimagerow`
--

LOCK TABLES `smarisimagerow` WRITE;
/*!40000 ALTER TABLE `smarisimagerow` DISABLE KEYS */;
INSERT INTO `smarisimagerow` VALUES (3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8);
/*!40000 ALTER TABLE `smarisimagerow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `smarisportfoliolistedview`
--

DROP TABLE IF EXISTS `smarisportfoliolistedview`;
/*!50001 DROP VIEW IF EXISTS `smarisportfoliolistedview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `smarisportfoliolistedview` (
  `imageportfolio` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `setname` tinyint NOT NULL,
  `imagename` tinyint NOT NULL,
  `imagetype` tinyint NOT NULL,
  `imagefolder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `smarisportfolioview`
--

DROP TABLE IF EXISTS `smarisportfolioview`;
/*!50001 DROP VIEW IF EXISTS `smarisportfolioview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `smarisportfolioview` (
  `imageportfolio` tinyint NOT NULL,
  `id` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `email` tinyint NOT NULL,
  `firstname` tinyint NOT NULL,
  `surname` tinyint NOT NULL,
  `setname` tinyint NOT NULL,
  `imagename` tinyint NOT NULL,
  `fullname` tinyint NOT NULL,
  `imagefolder` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `SRKillreportLoggView`
--

/*!50001 DROP TABLE IF EXISTS `SRKillreportLoggView`*/;
/*!50001 DROP VIEW IF EXISTS `SRKillreportLoggView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRKillreportLoggView` AS select `K`.`id` AS `id`,`K`.`for_account` AS `for_account`,`A`.`id` AS `animalid`,`K`.`typeofchange` AS `typeofchange`,`K`.`image` AS `image`,`K`.`kindofhunt` AS `kindofhunt`,`K`.`report_status` AS `report_status`,`K`.`from_account` AS `reported_from`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,`K`.`season` AS `season`,`K`.`killdate` AS `dateofkill`,`K`.`created` AS `dateofreport`,`K`.`area` AS `area`,`AR`.`areaname` AS `areaname`,`K`.`place` AS `place`,`K`.`created` AS `created` from (((`SRKillreportLogg` `K` join `SRAccounts` `H` on((`K`.`actor` = `H`.`id`))) join `SRAnimal` `A` on((`K`.`animal` = `A`.`id`))) join `SRArea` `AR` on((`K`.`area` = `AR`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRKillreportView`
--

/*!50001 DROP TABLE IF EXISTS `SRKillreportView`*/;
/*!50001 DROP VIEW IF EXISTS `SRKillreportView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRKillreportView` AS select `K`.`id` AS `Killreportid`,`H`.`id` AS `for_id`,`A`.`id` AS `Animalid`,`K`.`image` AS `image`,`K`.`kindofhunt` AS `kindofhunt`,`K`.`report_status` AS `report_status`,`K`.`locked` AS `locked`,`K`.`from_account` AS `reported_from`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,`A`.`engspecies` AS `engspecies`,`K`.`season` AS `season`,`K`.`killdate` AS `dateofkill`,`K`.`created` AS `dateofreport`,`A`.`antlers` AS `antlers`,`A`.`points` AS `points`,`A`.`live_weight` AS `live_weight`,`A`.`aprox_live_weight` AS `aprox_live_weight`,`A`.`passad_weight` AS `passad_weight`,`A`.`aprox_passad_weight` AS `aprox_passad_weight`,`A`.`carcass_weight` AS `carcass_weight`,`A`.`aprox_carcass_weight` AS `aprox_carcass_weight`,`A`.`cut_weight` AS `cut_weight`,`A`.`heart_weight` AS `heart_weight`,`A`.`waste` AS `waste`,`K`.`area` AS `area`,`AR`.`areaname` AS `areaname`,`K`.`place` AS `place`,`K`.`deleted` AS `deleted`,`K`.`latitud` AS `lat`,`K`.`longitud` AS `lng` from (((`SRKillreport` `K` join `SRAccounts` `H` on((`K`.`for_account` = `H`.`id`))) join `SRAnimal` `A` on((`K`.`animal` = `A`.`id`))) join `SRArea` `AR` on((`K`.`area` = `AR`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRMeatBoarSumView`
--

/*!50001 DROP TABLE IF EXISTS `SRMeatBoarSumView`*/;
/*!50001 DROP VIEW IF EXISTS `SRMeatBoarSumView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRMeatBoarSumView` AS select `M`.`killreport` AS `killreportid`,`M`.`hunter` AS `hunterid`,`H`.`role` AS `role`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`K`.`season` AS `season`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,sum(`M`.`share_kilogram`) AS `share_kilosum`,sum(`M`.`actual_kilogram`) AS `actual_kilosum` from (((`SRMeat` `M` join `SRAccounts` `H` on((`M`.`hunter` = `H`.`id`))) join `SRKillreport` `K` on((`M`.`killreport` = `K`.`id`))) join `SRAnimal` `A` on((`A`.`id` = `K`.`animal`))) where (`A`.`species` = 'Vildsvin') group by `M`.`hunter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRMeatDovSumView`
--

/*!50001 DROP TABLE IF EXISTS `SRMeatDovSumView`*/;
/*!50001 DROP VIEW IF EXISTS `SRMeatDovSumView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRMeatDovSumView` AS select `M`.`killreport` AS `killreportid`,`M`.`hunter` AS `hunterid`,`H`.`role` AS `role`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`K`.`season` AS `season`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,sum(`M`.`share_kilogram`) AS `share_kilosum`,sum(`M`.`actual_kilogram`) AS `actual_kilosum` from (((`SRMeat` `M` join `SRAccounts` `H` on((`M`.`hunter` = `H`.`id`))) join `SRKillreport` `K` on((`M`.`killreport` = `K`.`id`))) join `SRAnimal` `A` on((`A`.`id` = `K`.`animal`))) where (`A`.`species` = 'Dovvilt') group by `M`.`hunter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRMeatKronSumView`
--

/*!50001 DROP TABLE IF EXISTS `SRMeatKronSumView`*/;
/*!50001 DROP VIEW IF EXISTS `SRMeatKronSumView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRMeatKronSumView` AS select `M`.`killreport` AS `killreportid`,`M`.`hunter` AS `hunterid`,`H`.`role` AS `role`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`K`.`season` AS `season`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,sum(`M`.`share_kilogram`) AS `share_kilosum`,sum(`M`.`actual_kilogram`) AS `actual_kilosum` from (((`SRMeat` `M` join `SRAccounts` `H` on((`M`.`hunter` = `H`.`id`))) join `SRKillreport` `K` on((`M`.`killreport` = `K`.`id`))) join `SRAnimal` `A` on((`A`.`id` = `K`.`animal`))) where (`A`.`species` = 'Kronvilt') group by `M`.`hunter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRMeatMooseSumView`
--

/*!50001 DROP TABLE IF EXISTS `SRMeatMooseSumView`*/;
/*!50001 DROP VIEW IF EXISTS `SRMeatMooseSumView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRMeatMooseSumView` AS select `M`.`killreport` AS `killreportid`,`M`.`hunter` AS `hunterid`,`H`.`role` AS `role`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`K`.`season` AS `season`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,sum(`M`.`share_kilogram`) AS `share_kilosum`,sum(`M`.`actual_kilogram`) AS `actual_kilosum` from (((`SRMeat` `M` join `SRAccounts` `H` on((`M`.`hunter` = `H`.`id`))) join `SRKillreport` `K` on((`M`.`killreport` = `K`.`id`))) join `SRAnimal` `A` on((`A`.`id` = `K`.`animal`))) where (`A`.`species` = 'Älg') group by `M`.`hunter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRMeatRoedeerSumView`
--

/*!50001 DROP TABLE IF EXISTS `SRMeatRoedeerSumView`*/;
/*!50001 DROP VIEW IF EXISTS `SRMeatRoedeerSumView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRMeatRoedeerSumView` AS select `M`.`killreport` AS `killreportid`,`M`.`hunter` AS `hunterid`,`H`.`role` AS `role`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`K`.`season` AS `season`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,sum(`M`.`share_kilogram`) AS `share_kilosum`,sum(`M`.`actual_kilogram`) AS `actual_kilosum` from (((`SRMeat` `M` join `SRAccounts` `H` on((`M`.`hunter` = `H`.`id`))) join `SRKillreport` `K` on((`M`.`killreport` = `K`.`id`))) join `SRAnimal` `A` on((`A`.`id` = `K`.`animal`))) where (`A`.`species` = 'Rådjur') group by `M`.`hunter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRMeatSumView`
--

/*!50001 DROP TABLE IF EXISTS `SRMeatSumView`*/;
/*!50001 DROP VIEW IF EXISTS `SRMeatSumView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRMeatSumView` AS select `M`.`killreport` AS `killreportid`,`M`.`hunter` AS `hunterid`,`H`.`role` AS `role`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`K`.`season` AS `season`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,sum(`M`.`share_kilogram`) AS `share_kilosum`,sum(`M`.`share_lot`) AS `share_lot`,sum(`M`.`actual_kilogram`) AS `actual_kilosum` from (((`SRMeat` `M` join `SRAccounts` `H` on((`M`.`hunter` = `H`.`id`))) join `SRKillreport` `K` on((`M`.`killreport` = `K`.`id`))) join `SRAnimal` `A` on((`A`.`id` = `K`.`animal`))) group by `M`.`hunter` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRMeatView`
--

/*!50001 DROP TABLE IF EXISTS `SRMeatView`*/;
/*!50001 DROP VIEW IF EXISTS `SRMeatView`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRMeatView` AS select `M`.`killreport` AS `killreportid`,`M`.`hunter` AS `hunterid`,`H`.`firstname` AS `firstname`,`H`.`surname` AS `surname`,`K`.`season` AS `season`,`A`.`species` AS `species`,`A`.`speciestype` AS `speciestype`,`M`.`share_kilogram` AS `share_kilogram`,`M`.`share_lot` AS `share_lot`,`M`.`actual_kilogram` AS `actual_kilogram`,`M`.`outsidenotes` AS `outsidenotes` from (((`SRMeat` `M` join `SRAccounts` `H` on((`M`.`hunter` = `H`.`id`))) join `SRKillreport` `K` on((`M`.`killreport` = `K`.`id`))) join `SRAnimal` `A` on((`A`.`id` = `K`.`animal`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRPortfoliolistedview`
--

/*!50001 DROP TABLE IF EXISTS `SRPortfoliolistedview`*/;
/*!50001 DROP VIEW IF EXISTS `SRPortfoliolistedview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRPortfoliolistedview` AS select `R`.`imageportfolio` AS `imageportfolio`,`A`.`id` AS `id`,`A`.`username` AS `username`,`A`.`email` AS `email`,`A`.`firstname` AS `firstname`,`A`.`surname` AS `surname`,`I`.`setname` AS `setname`,`I`.`imagename` AS `imagename`,`I`.`imagetype` AS `imagetype`,`I`.`imagefolder` AS `imagefolder` from ((`SRImagerow` `R` join `SRImage` `I` on((`R`.`image` = `I`.`id`))) join `SRAccounts` `A` on((`R`.`imageportfolio` = `A`.`id`))) order by `R`.`imageportfolio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `SRPortfolioview`
--

/*!50001 DROP TABLE IF EXISTS `SRPortfolioview`*/;
/*!50001 DROP VIEW IF EXISTS `SRPortfolioview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `SRPortfolioview` AS select `R`.`imageportfolio` AS `imageportfolio`,`A`.`id` AS `id`,`A`.`username` AS `username`,`A`.`email` AS `email`,`A`.`firstname` AS `firstname`,`A`.`surname` AS `surname`,group_concat(`I`.`setname` separator ',') AS `setname`,group_concat(`I`.`imagename` separator ',') AS `imagename`,group_concat(`I`.`fullimagename` separator ',') AS `fullname`,group_concat(`I`.`imagefolder` separator ',') AS `imagefolder` from ((`SRImagerow` `R` join `SRImage` `I` on((`R`.`image` = `I`.`id`))) join `SRAccounts` `A` on((`R`.`imageportfolio` = `A`.`id`))) group by `A`.`username` order by `R`.`imageportfolio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `smarisportfoliolistedview`
--

/*!50001 DROP TABLE IF EXISTS `smarisportfoliolistedview`*/;
/*!50001 DROP VIEW IF EXISTS `smarisportfoliolistedview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `smarisportfoliolistedview` AS select `R`.`imageportfolio` AS `imageportfolio`,`A`.`id` AS `id`,`A`.`username` AS `username`,`A`.`email` AS `email`,`A`.`firstname` AS `firstname`,`A`.`surname` AS `surname`,`I`.`setname` AS `setname`,`I`.`imagename` AS `imagename`,`I`.`imagetype` AS `imagetype`,`I`.`imagefolder` AS `imagefolder` from ((`smarisimagerow` `R` join `smarisimage` `I` on((`R`.`image` = `I`.`id`))) join `smarisaccounts` `A` on((`R`.`imageportfolio` = `A`.`id`))) order by `R`.`imageportfolio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `smarisportfolioview`
--

/*!50001 DROP TABLE IF EXISTS `smarisportfolioview`*/;
/*!50001 DROP VIEW IF EXISTS `smarisportfolioview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `smarisportfolioview` AS select `R`.`imageportfolio` AS `imageportfolio`,`A`.`id` AS `id`,`A`.`username` AS `username`,`A`.`email` AS `email`,`A`.`firstname` AS `firstname`,`A`.`surname` AS `surname`,group_concat(`I`.`setname` separator ',') AS `setname`,group_concat(`I`.`imagename` separator ',') AS `imagename`,group_concat(`I`.`fullimagename` separator ',') AS `fullname`,group_concat(`I`.`imagefolder` separator ',') AS `imagefolder` from ((`smarisimagerow` `R` join `smarisimage` `I` on((`R`.`image` = `I`.`id`))) join `smarisaccounts` `A` on((`R`.`imageportfolio` = `A`.`id`))) group by `A`.`username` order by `R`.`imageportfolio` */;
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

-- Dump completed on 2020-10-30 23:58:01
