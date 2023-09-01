-- SQLBook: Code
-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pharm2
-- ------------------------------------------------------
-- Server version	10.6.12-MariaDB-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lectures` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `deparment_ID` int(10) unsigned DEFAULT NULL,
  `is_HOD` varchar(191) NOT NULL DEFAULT '0',
  `email` varchar(191) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lectures_email_unique` (`email`),
  KEY `lectures_deparment_id_foreign` (`deparment_ID`),
  CONSTRAINT `lectures_deparment_id_foreign` FOREIGN KEY (`deparment_ID`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
INSERT INTO `lectures` VALUES 
  (1,'Mr.','Mulinge',2,'1','mulinge@gmail.com',NULL,'',NULL,'2023-07-13 15:06:11','2023-07-27 11:20:27'),
  (4,'Mr.','Bundotich',2,'0','bundotich@gmail.com',NULL,'',NULL,'2023-07-13 15:06:59','2023-07-27 11:20:27'),
  (5,'Rev.','Rotich',2,'0','rotich@gmail.com',NULL,'',NULL,'2023-07-13 15:07:50','2023-07-27 11:20:27'),
  (6,'Ms.','Murithi',2,'0','murithi@gmail.com',NULL,'',NULL,'2023-07-13 15:15:25','2023-07-27 11:20:27'),
  (8,'Dr.','Akumu,',2,'1','akumu@gmail.com',NULL,'',NULL,'2023-07-13 15:17:39','2023-08-01 20:22:41'),
  (9,'Dr.','Rose',2,'0','rose@gmail.com',NULL,'',NULL,'2023-07-13 15:19:48','2023-08-01 20:22:41'),
  (10,'Dr.','Chepkirui',2,'0','kirui@gmail.com',NULL,'',NULL,'2023-07-13 15:20:50','2023-08-01 20:22:41'),
  (11,'Mr.','Rono',2,'0','rono@gmail.com',NULL,'',NULL,'2023-07-13 15:25:57','2023-08-01 20:22:41'),
  (12,'Ms.','Kerubo',2,'0','kerubo@gmail.com',NULL,'',NULL,'2023-07-13 15:26:52','2023-08-01 20:22:41'),
  (13,'Dr.','Nahashon',2,'0','Nahashon@gmail.com',NULL,'',NULL,'2023-07-13 15:27:24','2023-08-01 20:22:41'),
  (14,'Mr.','Micah',2,'0','Micah@gmail.com',NULL,'',NULL,'2023-07-13 15:30:47','2023-08-01 20:22:41'),
  (15,'Dr.','Kebenei',2,'0','Kebenei@gmail.com',NULL,'',NULL,'2023-07-13 15:38:36','2023-08-01 20:22:41'),
  (16,'Dr.','Wairimu',2,'0','Wairimu@gmail.com',NULL,'',NULL,'2023-07-13 15:39:22','2023-08-01 20:22:41'),
  (17,'Mr.','Charles',2,'0','Charles@gmail.com',NULL,'',NULL,'2023-07-13 15:45:00','2023-08-01 20:22:41'),
  (18,'Dr.','Walekhwa',2,'0','Walekhwa@gmail.com',NULL,'',NULL,'2023-07-13 15:45:39','2023-08-01 20:22:41'),
  (19,'Dr.','Tonui',2,'0','Tonui@gmail.com',NULL,'',NULL,'2023-07-13 15:46:06','2023-08-01 20:22:41'),
  (21,'Dr.','Chebon',2,'0','Chebon@gmail.com',NULL,'',NULL,'2023-07-13 15:47:41','2023-08-01 20:22:41'),
  (22,'Dr.','Keter',2,'0','Keter@gmail.com',NULL,'',NULL,'2023-07-13 15:48:23','2023-08-01 20:22:41'),
  (23,'Ms.','Elizabeth',2,'0','Elizabeth@gmail.com',NULL,'',NULL,'2023-07-13 15:49:07','2023-07-27 10:56:47'),
  (24,'Ms.','Emily Nyangena',2,'0','Nyangena@gmail.com',NULL,'',NULL,'2023-07-13 15:51:25','2023-07-27 11:20:27'),
  (25,'Dr.','Vugigi',2,'0','Vugigi@gmail.com',NULL,'',NULL,'2023-07-13 15:52:23','2023-07-27 11:20:27'),
  (26,'Dr.','Kagia',2,'0','Kagia@gmail.com',NULL,'',NULL,'2023-07-13 15:52:49','2023-07-27 10:56:47'),
  (27,'Dr.','Jediel',2,'0','Jediel@gmail.com',NULL,'',NULL,'2023-07-13 15:53:22','2023-07-27 11:20:27'),
  (28,'Dr.','Jim',2,'0','Jim@gmail.com',NULL,'',NULL,'2023-07-13 15:53:49','2023-07-27 10:56:47'),
  (29,'Dr.','Nyandoro',2,'0','Nyandoro@gmail.com',NULL,'',NULL,'2023-07-13 15:54:24','2023-07-27 11:20:27'),
  (30,'Mrs.','Somba',2,'0','Somba@gmail.com',NULL,'',NULL,'2023-07-13 15:55:01','2023-08-01 20:22:41'),
  (31,'Mr.','Kandagor',2,'0','Kandagor,@gmail.com',NULL,'',NULL,'2023-07-13 15:55:56','2023-07-27 11:20:27'),
  (32,'Dr.','Meroka',2,'1','Meroka@gmail.com',NULL,'',NULL,'2023-07-13 15:57:03','2023-07-27 10:56:47'),
  (33,'Dr.','Janet',2,'0','Janet@gmail.com',NULL,'',NULL,'2023-07-13 15:57:30','2023-07-27 10:56:47'),
  (34,'Dr.','Ndubi',2,'0','Ndubi@gmail.com',NULL,'',NULL,'2023-07-13 15:58:10','2023-07-27 11:20:27'),
  (35,'Dr.','Balongo,',2,'0','Balongo,@gmail.com',NULL,'',NULL,'2023-07-13 15:59:14','2023-07-27 11:20:27'),
  (36,'Dr.','Nelius',2,'0','Nelius@gmail.com',NULL,'',NULL,'2023-07-13 16:01:04','2023-07-27 11:20:27'),
  (37,'Dr.','Obat',2,'0','Obat@gmail.com',NULL,'',NULL,'2023-07-13 16:01:43','2023-07-27 11:20:27'),
  (39,'Ms.','Wakuraya',2,'0','Wakuraya@gmail.com',NULL,'',NULL,'2023-07-13 16:03:31','2023-07-27 11:20:27'),
  (40,'Ms.','Murugi',2,'0','Murugi@gmail.com',NULL,'',NULL,'2023-07-13 16:58:36','2023-08-01 20:22:41'),
  (41,'Mrs.','Kurui',2,'0','Kurui@gmail.com',NULL,'',NULL,'2023-07-13 18:02:13','2023-07-27 11:20:27'),
  (42,'Dr.','Saruni',2,'0','saruni@gmail.com',NULL,'',NULL,'2023-07-26 15:53:48','2023-08-01 20:22:41'),
  (54,'Dr.','Rotich',2,'0','drrotich@gmail.com',NULL,'',NULL,'2023-08-01 08:50:04','2023-08-01 08:50:04');
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-12 12:12:20
