-- SQLBook: Code
-- MySQL dump 10.13  Distrib 8.0.33, for Linux (x86_64)
--
-- Host: localhost    Database: pharm
-- ------------------------------------------------------
-- Server version	8.0.33-0ubuntu0.22.04.2

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
-- Table structure for table `accesstokens`
--
SELECT code, name, lecture_hours, lab_hours, lab_type_id FROM units INTO OUTFILE 'C:/cancelled_orders.csv' FIELDS ENCLOSED BY '"' TERMINATED BY ';' ESCAPED BY '"' LINES TERMINATED BY '\r\n';
UPDATE units SET lecturer_id = NULL;
ALTER TABLE units MODIFY COLUMN lab_type_id INT NULL;
ALTER TABLE units DROP FOREIGN KEY units_lab_type_id_foreign;

DELETE FROM sessions;

DROP TABLE IF EXISTS `accesstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accesstokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accesstokens_user_id_unique` (`user_id`),
  UNIQUE KEY `accesstokens_token_unique` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accesstokens`
--

LOCK TABLES `accesstokens` WRITE;
/*!40000 ALTER TABLE `accesstokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `accesstokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `csv_data`
--

DROP TABLE IF EXISTS `csv_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `csv_data` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `csv_filename` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `csv_header` tinyint(1) NOT NULL DEFAULT '0',
  `csv_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csv_data`
--

LOCK TABLES `csv_data` WRITE;
/*!40000 ALTER TABLE `csv_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `csv_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `school_ID` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (2,'Pharmaceuticals and Pharmaceutics','2','2023-07-13 17:36:16','2023-07-13 17:36:16'),(3,'Pharmacology and Pharmacognosy','2','2023-07-13 17:36:35','2023-07-13 17:36:35'),(4,'Pre-Clinical Chemistry','2','2023-07-13 17:36:50','2023-07-13 17:36:50');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
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
-- Table structure for table `generated_documents`
--

DROP TABLE IF EXISTS `generated_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generated_documents` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `program_id` int unsigned NOT NULL,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `generated_documents_school_id_foreign` (`school_id`),
  KEY `generated_documents_program_id_foreign` (`program_id`),
  CONSTRAINT `generated_documents_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generated_documents_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generated_documents`
--

LOCK TABLES `generated_documents` WRITE;
/*!40000 ALTER TABLE `generated_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `generated_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_o_d_s`
--

DROP TABLE IF EXISTS `h_o_d_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `h_o_d_s` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lecturer_ID` int unsigned DEFAULT NULL,
  `deparment_ID` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `h_o_d_s_email_unique` (`email`),
  KEY `h_o_d_s_lecturer_id_foreign` (`lecturer_ID`),
  KEY `h_o_d_s_deparment_id_foreign` (`deparment_ID`),
  CONSTRAINT `h_o_d_s_deparment_id_foreign` FOREIGN KEY (`deparment_ID`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `h_o_d_s_lecturer_id_foreign` FOREIGN KEY (`lecturer_ID`) REFERENCES `lectures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_o_d_s`
--

LOCK TABLES `h_o_d_s` WRITE;
/*!40000 ALTER TABLE `h_o_d_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `h_o_d_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_types`
--

DROP TABLE IF EXISTS `lab_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lab_types` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_types`
--

LOCK TABLES `lab_types` WRITE;
/*!40000 ALTER TABLE `lab_types` DISABLE KEYS */;
INSERT INTO `lab_types` VALUES (1,'Biochemistry Labs','2023-07-13 15:06:59','2023-07-13 15:06:59'),(2,'Chemistry Labs','2023-07-13 15:07:15','2023-07-13 15:07:15'),(3,'Physiology Labs','2023-07-13 15:08:12','2023-07-13 15:08:12'),(4,'Anatomy Labs','2023-07-13 15:08:32','2023-07-13 15:08:32'),(5,'Microbiology Labs','2023-07-13 15:09:34','2023-07-13 15:09:34'),(6,'Pharmacognosy Labs','2023-07-13 15:13:08','2023-07-13 15:13:08'),(7,'Pathology Labs','2023-07-13 15:13:21','2023-07-13 15:13:21'),(8,'Pharmaceutical Chemistry Labs','2023-07-13 15:14:42','2023-07-13 15:14:42'),(9,'Pharmaceutics Labs','2023-07-13 15:15:57','2023-07-13 15:15:57');
/*!40000 ALTER TABLE `lab_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lectures`
--

DROP TABLE IF EXISTS `lectures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lectures` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `deparment_ID` int unsigned DEFAULT NULL,
  `is_HOD` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lectures_email_unique` (`email`),
  KEY `lectures_deparment_id_foreign` (`deparment_ID`),
  CONSTRAINT `lectures_deparment_id_foreign` FOREIGN KEY (`deparment_ID`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lectures`
--

LOCK TABLES `lectures` WRITE;
/*!40000 ALTER TABLE `lectures` DISABLE KEYS */;
INSERT INTO `lectures` VALUES (3,'Mr.','Mulinge',2,'0','mulinge@gmail.com',NULL,'',NULL,'2023-07-13 18:06:11','2023-07-13 18:06:11'),(4,'Mr.','Bundotich',2,'0','bundotich@gmail.com',NULL,'',NULL,'2023-07-13 18:06:59','2023-07-13 18:06:59'),(5,'Rev.','Rotich',2,'0','rotich@gmail.com',NULL,'',NULL,'2023-07-13 18:07:50','2023-07-13 18:07:50'),(6,'Ms.','Murithi',2,'0','murithi@gmail.com',NULL,'',NULL,'2023-07-13 18:15:25','2023-07-13 18:15:25'),(8,'Dr.','Akumu,',4,'0','akumu@gmail.com',NULL,'',NULL,'2023-07-13 18:17:39','2023-07-13 18:17:39'),(9,'Dr.','Rose',4,'0','rose@gmail.com',NULL,'',NULL,'2023-07-13 18:19:48','2023-07-13 18:19:48'),(10,'Dr.','Chepkirui,',4,'0','kirui@gmail.com',NULL,'',NULL,'2023-07-13 18:20:50','2023-07-13 18:20:50'),(11,'Mr.','Rono',4,'0','rono@gmail.com',NULL,'',NULL,'2023-07-13 18:25:57','2023-07-13 18:25:57'),(12,'Ms.','Kerubo',4,'0','kerubo@gmail.com',NULL,'',NULL,'2023-07-13 18:26:52','2023-07-13 18:26:52'),(13,'Dr.','Nahashon',4,'0','Nahashon@gmail.com',NULL,'',NULL,'2023-07-13 18:27:24','2023-07-13 18:27:24'),(14,'Mr.','Micah',4,'0','Micah@gmail.com',NULL,'',NULL,'2023-07-13 18:30:47','2023-07-13 18:30:47'),(15,'Dr.','Kebenei',4,'0','Kebenei@gmail.com',NULL,'',NULL,'2023-07-13 18:38:36','2023-07-13 18:38:36'),(16,'Dr.','Wairimu',4,'0','Wairimu@gmail.com',NULL,'',NULL,'2023-07-13 18:39:22','2023-07-13 18:39:22'),(17,'Mr.','Charles',4,'0','Charles@gmail.com',NULL,'',NULL,'2023-07-13 18:45:00','2023-07-13 18:45:00'),(18,'Dr.','Walekhwa',4,'0','Walekhwa@gmail.com',NULL,'',NULL,'2023-07-13 18:45:39','2023-07-13 18:45:39'),(19,'Dr.','Tonui',4,'0','Tonui@gmail.com',NULL,'',NULL,'2023-07-13 18:46:06','2023-07-13 18:46:06'),(21,'Dr.','Chebon',4,'0','Chebon@gmail.com',NULL,'',NULL,'2023-07-13 18:47:41','2023-07-13 18:47:41'),(22,'Dr.','Keter',4,'0','Keter@gmail.com',NULL,'',NULL,'2023-07-13 18:48:23','2023-07-13 18:48:23'),(23,'Ms.','Elizabeth',3,'0','Elizabeth@gmail.com',NULL,'',NULL,'2023-07-13 18:49:07','2023-07-13 18:49:07'),(24,'Ms.','Emily Nyangena',2,'0','Nyangena@gmail.com',NULL,'',NULL,'2023-07-13 18:51:25','2023-07-13 18:51:25'),(25,'Dr.','Vugigi',2,'0','Vugigi@gmail.com',NULL,'',NULL,'2023-07-13 18:52:23','2023-07-13 18:52:23'),(26,'Dr.','Kagia',3,'0','Kagia@gmail.com',NULL,'',NULL,'2023-07-13 18:52:49','2023-07-13 18:52:49'),(27,'Dr.','Jediel',2,'0','Jediel@gmail.com',NULL,'',NULL,'2023-07-13 18:53:22','2023-07-13 18:53:22'),(28,'Dr.','Jim',3,'0','Jim@gmail.com',NULL,'',NULL,'2023-07-13 18:53:49','2023-07-13 18:53:49'),(29,'Dr.','Nyandoro',2,'0','Nyandoro@gmail.com',NULL,'',NULL,'2023-07-13 18:54:24','2023-07-13 18:54:24'),(30,'Mrs.','Somba',4,'0','Somba@gmail.com',NULL,'',NULL,'2023-07-13 18:55:01','2023-07-13 18:55:01'),(31,'Mr.','Kandagor',2,'0','Kandagor,@gmail.com',NULL,'',NULL,'2023-07-13 18:55:56','2023-07-13 18:55:56'),(32,'Dr.','Meroka',3,'0','Meroka@gmail.com',NULL,'',NULL,'2023-07-13 18:57:03','2023-07-13 18:57:03'),(33,'Dr.','Janet',3,'0','Janet@gmail.com',NULL,'',NULL,'2023-07-13 18:57:30','2023-07-13 18:57:30'),(34,'Dr.','Ndubi',2,'0','Ndubi@gmail.com',NULL,'',NULL,'2023-07-13 18:58:10','2023-07-13 18:58:10'),(35,'Dr.','Balongo,',2,'0','Balongo,@gmail.com',NULL,'',NULL,'2023-07-13 18:59:14','2023-07-13 18:59:14'),(36,'Dr.','Nelius',2,'0','Nelius@gmail.com',NULL,'',NULL,'2023-07-13 19:01:04','2023-07-13 19:01:04'),(37,'Dr.','Obat',2,'0','Obat@gmail.com',NULL,'',NULL,'2023-07-13 19:01:43','2023-07-13 19:01:43'),(39,'Ms.','Wakuraya',2,'0','Wakuraya@gmail.com',NULL,'',NULL,'2023-07-13 19:03:31','2023-07-13 19:03:31'),(40,'Ms.','Murugi',4,'0','Murugi@gmail.com',NULL,'',NULL,'2023-07-13 19:58:36','2023-07-13 19:58:36'),(41,'Mrs.','Kurui',2,'0','Kurui@gmail.com',NULL,'',NULL,'2023-07-13 21:02:13','2023-07-13 21:02:13'),(42,'Dr.','Saruni',4,'0','saruni@gmail.com',NULL,'',NULL,'2023-07-26 18:53:48','2023-07-26 18:53:48'),(43,'Biochemistry','Technician',4,'0','Biochemistry@gmail.com',NULL,'',NULL,'2023-07-26 19:15:57','2023-07-26 19:15:57'),(44,'Chemistry','Technician',4,'0','Chemistry@gmail.com',NULL,'',NULL,'2023-07-26 19:16:44','2023-07-26 19:16:44'),(45,'Physiology','Technician',4,'0','Physiology@gmail.com',NULL,'',NULL,'2023-07-26 19:18:11','2023-07-26 19:18:11'),(46,'Anatomy','Technician',4,'0','Anatomy@gmail.com',NULL,'',NULL,'2023-07-26 19:18:52','2023-07-26 19:18:52'),(47,'Microbiology','Technician',4,'0','Microbiology@gmail.com',NULL,'',NULL,'2023-07-26 19:20:19','2023-07-26 19:20:19'),(48,'Pathology','Technician',4,'0','Pathology@gmail.com',NULL,'',NULL,'2023-07-26 19:23:25','2023-07-26 19:23:25'),(49,'Pharmaceutical','Technician',2,'0','Pharmaceutical@gmail.com',NULL,'',NULL,'2023-07-26 19:26:48','2023-07-26 19:26:48'),(50,'Pharmacognosy','Technician',3,'0','Pharmacognosy@gmail.com',NULL,'',NULL,'2023-07-26 19:28:00','2023-07-26 19:28:00'),(51,'Mr.','Justine',3,'0','Justine@gmail.com',NULL,'',NULL,'2023-07-26 19:32:20','2023-07-26 19:32:20'),(52,'Mr.','Nicolas',2,'0','Nicolas@gmail.com',NULL,'',NULL,'2023-07-26 19:33:09','2023-07-26 19:33:09');
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels_units_pivot`
--

DROP TABLE IF EXISTS `levels_units_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels_units_pivot` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int unsigned NOT NULL,
  `level_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `levels_units_pivot_unit_id_foreign` (`unit_id`),
  KEY `levels_units_pivot_level_id_foreign` (`level_id`),
  CONSTRAINT `levels_units_pivot_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `program_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `levels_units_pivot_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels_units_pivot`
--

LOCK TABLES `levels_units_pivot` WRITE;
/*!40000 ALTER TABLE `levels_units_pivot` DISABLE KEYS */;
INSERT INTO `levels_units_pivot` VALUES (1,1,16,NULL,NULL),(2,2,16,NULL,NULL),(3,3,16,NULL,NULL),(4,4,16,NULL,NULL),(5,5,16,NULL,NULL),(6,6,16,NULL,NULL),(7,7,16,NULL,NULL),(8,8,16,NULL,NULL),(9,9,16,NULL,NULL),(10,10,18,NULL,NULL),(11,12,18,NULL,NULL),(12,13,18,NULL,NULL),(13,14,18,NULL,NULL),(14,15,18,NULL,NULL),(15,16,18,NULL,NULL),(16,17,18,NULL,NULL),(17,18,18,NULL,NULL),(18,20,18,NULL,NULL),(19,21,18,NULL,NULL),(30,32,19,NULL,NULL),(31,33,19,NULL,NULL),(32,34,19,NULL,NULL),(33,35,19,NULL,NULL),(34,36,19,NULL,NULL),(35,37,19,NULL,NULL),(36,38,19,NULL,NULL),(37,39,19,NULL,NULL),(38,40,19,NULL,NULL),(39,41,19,NULL,NULL),(40,42,21,NULL,NULL),(41,43,21,NULL,NULL),(42,44,21,NULL,NULL),(43,45,21,NULL,NULL),(44,46,21,NULL,NULL),(45,47,21,NULL,NULL),(46,48,21,NULL,NULL),(47,49,21,NULL,NULL),(48,50,21,NULL,NULL),(56,58,22,NULL,NULL),(57,59,22,NULL,NULL),(58,60,22,NULL,NULL),(59,61,22,NULL,NULL),(60,62,22,NULL,NULL),(61,63,22,NULL,NULL),(62,64,22,NULL,NULL),(63,65,22,NULL,NULL),(64,66,22,NULL,NULL),(65,67,24,NULL,NULL),(66,68,24,NULL,NULL),(67,69,24,NULL,NULL),(68,70,24,NULL,NULL),(69,71,24,NULL,NULL),(70,72,24,NULL,NULL),(71,73,24,NULL,NULL),(72,74,24,NULL,NULL),(73,75,24,NULL,NULL),(74,76,24,NULL,NULL),(84,86,25,NULL,NULL),(85,87,25,NULL,NULL),(86,88,25,NULL,NULL),(87,89,25,NULL,NULL),(88,90,25,NULL,NULL),(89,91,25,NULL,NULL),(90,92,25,NULL,NULL),(91,93,25,NULL,NULL),(92,94,25,NULL,NULL),(93,95,25,NULL,NULL),(94,96,28,NULL,NULL),(95,97,28,NULL,NULL),(96,98,28,NULL,NULL),(97,99,28,NULL,NULL),(98,100,28,NULL,NULL),(99,101,28,NULL,NULL),(100,102,28,NULL,NULL),(101,103,28,NULL,NULL),(102,104,30,NULL,NULL),(103,105,30,NULL,NULL),(104,106,30,NULL,NULL),(105,107,30,NULL,NULL),(106,108,30,NULL,NULL),(107,109,30,NULL,NULL),(108,110,30,NULL,NULL),(109,111,16,NULL,NULL),(110,114,16,NULL,NULL),(111,118,16,NULL,NULL),(112,122,16,NULL,NULL),(113,112,18,NULL,NULL),(114,115,18,NULL,NULL),(115,119,18,NULL,NULL),(116,123,18,NULL,NULL),(117,124,18,NULL,NULL),(118,113,19,NULL,NULL),(119,116,19,NULL,NULL),(120,120,19,NULL,NULL),(121,125,19,NULL,NULL),(122,127,19,NULL,NULL),(123,117,21,NULL,NULL),(124,121,21,NULL,NULL),(125,126,21,NULL,NULL),(126,128,21,NULL,NULL),(127,129,21,NULL,NULL),(128,134,21,NULL,NULL),(129,130,22,NULL,NULL),(130,135,22,NULL,NULL),(131,142,22,NULL,NULL),(132,131,24,NULL,NULL),(133,136,24,NULL,NULL),(134,139,24,NULL,NULL),(135,143,24,NULL,NULL),(136,146,24,NULL,NULL),(137,132,25,NULL,NULL),(138,140,25,NULL,NULL),(139,144,25,NULL,NULL),(140,147,25,NULL,NULL),(141,137,28,NULL,NULL),(142,141,28,NULL,NULL),(143,145,28,NULL,NULL),(144,148,28,NULL,NULL),(145,150,28,NULL,NULL),(146,102,30,NULL,NULL),(147,149,30,NULL,NULL),(148,151,30,NULL,NULL),(149,152,30,NULL,NULL);
/*!40000 ALTER TABLE `levels_units_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'School of Pharmacy','2023-07-13 15:00:22','2023-07-13 15:00:22');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2016_06_01_000001_create_oauth_auth_codes_table',1),(2,'2016_06_01_000002_create_oauth_access_tokens_table',1),(3,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),(4,'2016_06_01_000004_create_oauth_clients_table',1),(5,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),(6,'2017_10_09_123029_create_csv_data_table',1),(7,'2019_03_04_155934_create_departments_table',1),(8,'2019_03_04_155935_create_programs_table',1),(9,'2019_03_04_161550_create_table_lab_types',1),(10,'2019_03_04_164137_create_table_prgram_levels',1),(11,'2019_03_04_164436_create_table_units',1),(12,'2019_03_04_165954_modify_table_program_levels',1),(13,'2019_03_04_171757_create_levels_units_pivot',1),(14,'2019_03_04_172707_create_table_rooms',1),(15,'2019_03_04_173412_create_table_locations',1),(16,'2019_03_04_173721_modify_table_rooms',1),(17,'2019_03_04_175632_create_table_users',1),(18,'2019_03_05_202457_modify_table_units',1),(19,'2019_03_08_132149_update_table_program_levels',1),(20,'2019_03_27_083628_create_table_sessions',1),(21,'2019_03_31_142553_create_table_timetable',1),(22,'2019_03_31_142705_create_table_timetable_days',1),(23,'2019_03_31_142735_create_table_periods',1),(24,'2019_04_07_174605_modify_table_periods',1),(25,'2019_04_19_094154_create_failed_jobs_table',1),(26,'2019_04_22_202252_update_table_timetables',1),(27,'2019_05_21_153543_modify_units_table',1),(28,'2019_06_10_133437_modify_programs_table',1),(29,'2019_06_24_110403_create_table_schools',1),(30,'2019_06_24_110518_modify_table_programs',1),(31,'2019_06_24_145536_create_school_location_pivot',1),(32,'2019_07_10_120327_create_table_generated_documents',1),(33,'2019_07_30_211021_create_permission_tables',1),(34,'2021_10_12_151744_create_lectures_table',1),(35,'2021_10_12_151758_create_h_o_d_s_table',1),(36,'2022_04_04_004648_create_access_tokens_table',1),(37,'2022_04_05_050117_create_time_table_periods_table',1),(38,'2022_08_06_071146_create_students_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

LOCK TABLES `model_has_permissions` WRITE;
/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `model_has_roles` (
  `role_id` int unsigned NOT NULL,
  `model_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

LOCK TABLES `model_has_roles` WRITE;
/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'Timetabler\\User',1),(2,'Timetabler\\User',2),(2,'Timetabler\\User',3),(2,'Timetabler\\User',4);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `client_id` int unsigned NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_access_tokens`
--

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_auth_codes`
--

DROP TABLE IF EXISTS `oauth_auth_codes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint NOT NULL,
  `client_id` int unsigned NOT NULL,
  `scopes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_auth_codes`
--

LOCK TABLES `oauth_auth_codes` WRITE;
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint DEFAULT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_clients`
--

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_personal_access_clients`
--

DROP TABLE IF EXISTS `oauth_personal_access_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_personal_access_clients`
--

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth_refresh_tokens`
--

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periods`
--

DROP TABLE IF EXISTS `periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periods` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `day_id` int unsigned NOT NULL,
  `time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `periods_day_id_foreign` (`day_id`),
  CONSTRAINT `periods_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `timetable_days` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'view','user','2023-07-13 14:08:43','2023-07-13 14:08:43'),(2,'edit','user','2023-07-13 14:08:43','2023-07-13 14:08:43'),(3,'add-users','user','2023-07-13 14:08:43','2023-07-13 14:08:43'),(4,'delete-users','user','2023-07-13 14:08:43','2023-07-13 14:08:43'),(5,'generate-timetable','user','2023-07-13 14:08:44','2023-07-13 14:08:44'),(6,'assign-lecturers','user','2023-07-13 14:08:44','2023-07-13 14:08:44');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_levels`
--

DROP TABLE IF EXISTS `program_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `program_levels` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int unsigned NOT NULL,
  `department_ID` int unsigned DEFAULT NULL,
  `semester_number` int NOT NULL,
  `level` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num_students` int unsigned NOT NULL DEFAULT '0',
  `in_session` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `program_levels_program_id_foreign` (`program_id`),
  CONSTRAINT `program_levels_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_levels`
--

LOCK TABLES `program_levels` WRITE;
/*!40000 ALTER TABLE `program_levels` DISABLE KEYS */;
INSERT INTO `program_levels` VALUES (16,2,NULL,1,'Year 1 Semester 1','2023-07-13 18:01:33','2023-07-26 18:45:38',80,1),(17,2,NULL,2,'Year 1 Semester 2','2023-07-13 18:01:33','2023-07-26 18:45:43',80,0),(18,2,NULL,3,'Year 1 Semester 3','2023-07-13 18:01:33','2023-07-26 18:45:47',80,1),(19,2,NULL,4,'Year 2 Semester 1','2023-07-13 18:01:33','2023-07-26 18:45:56',80,1),(20,2,NULL,5,'Year 2 Semester 2','2023-07-13 18:01:33','2023-07-26 18:46:00',80,0),(21,2,NULL,6,'Year 2 Semester 3','2023-07-13 18:01:33','2023-07-26 18:46:02',80,1),(22,2,NULL,7,'Year 3 Semester 1','2023-07-13 18:01:33','2023-07-26 18:46:08',80,1),(23,2,NULL,8,'Year 3 Semester 2','2023-07-13 18:01:33','2023-07-26 18:46:11',80,0),(24,2,NULL,9,'Year 3 Semester 3','2023-07-13 18:01:33','2023-07-26 18:46:13',80,1),(25,2,NULL,10,'Year 4 Semester 1','2023-07-13 18:01:33','2023-07-26 18:46:17',80,1),(26,2,NULL,11,'Year 4 Semester 2','2023-07-13 18:01:33','2023-07-13 21:08:22',0,0),(27,2,NULL,12,'Year 4 Semester 3','2023-07-13 18:01:33','2023-07-13 21:08:23',0,0),(28,2,NULL,13,'Year 5 Semester 1','2023-07-13 18:01:33','2023-07-26 18:46:20',80,1),(29,2,NULL,14,'Year 5 Semester 2','2023-07-13 18:01:33','2023-07-26 18:46:22',80,0),(30,2,NULL,15,'Year 5 Semester 3','2023-07-13 18:01:33','2023-07-26 18:47:15',80,1);
/*!40000 ALTER TABLE `program_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `programs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semesters` int NOT NULL,
  `years` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `program_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school_id` int unsigned NOT NULL,
  `deparment_ID` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (2,'Bachelor of Pharmacy I',3,5,'2023-07-13 18:01:33','2023-07-13 18:01:33','PHAM I',2,0);
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

LOCK TABLES `role_has_permissions` WRITE;
/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
INSERT INTO `role_has_permissions` VALUES (1,1),(2,1),(3,1),(4,1),(1,2),(2,2),(5,2),(1,3),(6,3),(1,4),(1,5);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','user','2023-07-13 14:08:44','2023-07-13 14:08:44'),(2,'timetabler','user','2023-07-13 14:08:44','2023-07-13 14:08:44'),(3,'dean','user','2023-07-13 14:08:44','2023-07-13 14:08:44'),(4,'lecturer','user','2023-07-13 14:08:44','2023-07-13 14:08:44'),(5,'hods','user','2023-07-13 14:08:44','2023-07-13 14:08:44');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rooms` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int unsigned NOT NULL,
  `room_code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lab_type_id` int unsigned DEFAULT NULL,
  `capacity` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_location_id_foreign` (`location_id`),
  KEY `rooms_lab_type_id_foreign` (`lab_type_id`),
  CONSTRAINT `rooms_lab_type_id_foreign` FOREIGN KEY (`lab_type_id`) REFERENCES `lab_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rooms_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (3,1,'GF L6','lecture',NULL,40,'2023-07-13 17:29:19','2023-07-13 17:29:19'),(4,1,'GF L7','lecture',NULL,40,'2023-07-13 17:29:50','2023-07-13 17:29:50'),(5,1,'GF L8','lecture',NULL,40,'2023-07-13 17:30:28','2023-07-13 17:30:28'),(6,1,'GF L9','lecture',NULL,40,'2023-07-13 17:30:42','2023-07-13 17:30:42'),(7,1,'GF L10','lecture',NULL,40,'2023-07-13 17:31:39','2023-07-13 17:31:39'),(8,1,'GF L11','lecture',NULL,40,'2023-07-13 17:32:05','2023-07-13 17:32:05'),(9,1,'GF L5','lecture',NULL,40,'2023-07-13 17:32:40','2023-07-13 17:32:40'),(10,1,'GF L4','lecture',NULL,40,'2023-07-13 17:32:56','2023-07-13 17:32:56'),(11,1,'ADMIN BBIT LR1','lecture',NULL,40,'2023-07-26 18:48:54','2023-07-26 18:48:54'),(12,1,'KLAW 4','lecture',NULL,40,'2023-07-26 18:49:26','2023-07-26 18:49:26');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_location_pivot`
--

DROP TABLE IF EXISTS `school_location_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_location_pivot` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint unsigned NOT NULL,
  `location_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_location_pivot_school_id_foreign` (`school_id`),
  KEY `school_location_pivot_location_id_foreign` (`location_id`),
  CONSTRAINT `school_location_pivot_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `school_location_pivot_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_location_pivot`
--

LOCK TABLES `school_location_pivot` WRITE;
/*!40000 ALTER TABLE `school_location_pivot` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_location_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schools` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schools`
--

LOCK TABLES `schools` WRITE;
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` VALUES (2,'SCHOOL OF PHARMACY','2023-07-13 17:34:57','2023-07-13 17:34:57');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `period_id` int unsigned NOT NULL,
  `unit_id` int unsigned DEFAULT NULL,
  `lecture_id` int unsigned DEFAULT NULL,
  `room_id` int unsigned DEFAULT NULL,
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `groups` int NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_room_id_foreign` (`room_id`),
  KEY `sessions_period_id_foreign` (`period_id`),
  CONSTRAINT `sessions_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sessions_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Reg_No` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `program_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `students_program_id_foreign` (`program_id`),
  CONSTRAINT `students_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_table_periods`
--

DROP TABLE IF EXISTS `time_table_periods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_table_periods` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `day` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `group` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number_of_students` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Programs` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_table_periods`
--

LOCK TABLES `time_table_periods` WRITE;
/*!40000 ALTER TABLE `time_table_periods` DISABLE KEYS */;
/*!40000 ALTER TABLE `time_table_periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable_days`
--

DROP TABLE IF EXISTS `timetable_days`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable_days` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `timetable_id` int unsigned NOT NULL,
  `day` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period_length` double(5,2) NOT NULL DEFAULT '3.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_days_timetable_id_foreign` (`timetable_id`),
  CONSTRAINT `timetable_days_timetable_id_foreign` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_days`
--

LOCK TABLES `timetable_days` WRITE;
/*!40000 ALTER TABLE `timetable_days` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetables`
--

DROP TABLE IF EXISTS `timetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetables` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `in_progress` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetables`
--

LOCK TABLES `timetables` WRITE;
/*!40000 ALTER TABLE `timetables` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE `units` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lecture_hours` int NOT NULL,
  `department_ID` int NOT NULL,
  `lecturer_id` int NOT NULL,
  `lab_hours` int NOT NULL,
  `lab_type_id` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `related_to` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `units_lab_type_id_foreign` (`lab_type_id`),
  CONSTRAINT `units_lab_type_id_foreign` FOREIGN KEY (`lab_type_id`) REFERENCES `lab_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--
LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (1,'COMP100','INTRODUCTION TO COMPUTERS',3,0,3,0,NULL,'2023-07-13 19:06:53','2023-07-13 19:06:53',NULL),(2,'COMS110','COMMUNICATION SKILLS',3,0,3,0,NULL,'2023-07-13 19:07:48','2023-07-13 19:07:48',NULL),(3,'SCPH1111','MATHEMATICS FOR PHARMACY I',3,0,4,0,NULL,'2023-07-13 19:08:38','2023-07-13 19:08:38',NULL),(4,'BIBL110','OLD TESTAMENT SURVEY',3,0,5,0,NULL,'2023-07-13 19:09:36','2023-07-13 21:05:25',NULL),(5,'SCPH1131','BIOCHEMISTRY I',3,0,6,0,NULL,'2023-07-13 19:10:30','2023-07-13 19:10:30',NULL),(6,'SCPH1123','INORGANIC CHEMISTRY I',3,0,8,0,NULL,'2023-07-13 19:11:37','2023-07-13 19:11:37',NULL),(7,'SCPH1141','MEDICAL PHYSIOLOGY I',3,0,9,0,NULL,'2023-07-13 19:12:39','2023-07-13 19:12:39',NULL),(8,'SCPH1122','PHYSICAL CHEMISTRY I',3,0,10,0,NULL,'2023-07-13 19:13:16','2023-07-13 19:13:16',NULL),(9,'SCPH1151','HUMAN ANATOMY I',3,0,11,0,NULL,'2023-07-13 19:13:58','2023-07-13 19:13:58',NULL),(10,'SCPH1351','MEDICAL MICROBIOLOGY I',3,0,12,0,NULL,'2023-07-13 19:14:49','2023-07-13 19:14:49',NULL),(12,'SCPH1334','BIOCHEMISTRY IV (METABOLISM II)',3,0,6,0,NULL,'2023-07-13 19:16:22','2023-07-13 19:16:22',NULL),(13,'SCPH1313','MATHEMATICS FOR PHARMACY III',3,0,4,0,NULL,'2023-07-13 19:16:56','2023-07-13 19:16:56',NULL),(14,'SCPH1335','BIOCHEMISTRY V (SPECIALIZED TISSUES)',3,0,14,0,NULL,'2023-07-13 19:17:43','2023-07-13 19:17:43',NULL),(15,'SCPH1346','MEDICAL PHYSIOLOGY VI (SENSORY SYSTEMS)',3,0,13,0,NULL,'2023-07-13 19:23:05','2023-07-13 19:23:05',NULL),(16,'SCPH1327','ORGANIC CHEMISTRY II',3,0,15,0,NULL,'2023-07-13 19:26:42','2023-07-13 19:26:42',NULL),(17,'SCPH1328','PHYSICAL CHEMISTRY III',3,0,10,0,NULL,'2023-07-13 19:28:07','2023-07-13 19:28:07',NULL),(18,'SCPH1345','MEDICAL PHYSIOLOGY V (CVS)',3,0,16,0,NULL,'2023-07-13 19:31:52','2023-07-13 19:31:52',NULL),(20,'SCPH1329','INORGANIC CHEMISTRY III',3,0,10,0,NULL,'2023-07-13 19:33:17','2023-07-13 19:33:17',NULL),(21,'SCPH1353','HUMAN ANATOMY III',3,0,11,0,NULL,'2023-07-13 19:34:03','2023-07-13 19:34:03',NULL),(32,'SCPH2136','BIOCHEMISTRY VI',3,0,14,0,NULL,'2023-07-13 19:46:34','2023-07-13 19:46:34',NULL),(33,'SCPH2121','ORGANIC CHEMISTRY III',3,0,15,0,NULL,'2023-07-13 19:47:03','2023-07-13 19:47:03',NULL),(34,'SCPH2111','BIOSTATISTICS',3,0,17,0,NULL,'2023-07-13 19:47:33','2023-07-13 19:47:33',NULL),(35,'SCPH2137','BIOCHEMISTRY VII',3,0,14,0,NULL,'2023-07-13 19:48:18','2023-07-13 19:48:18',NULL),(36,'SCPH2161','HUMAN PATHOLOGY I',3,0,18,0,NULL,'2023-07-13 19:49:17','2023-07-13 19:49:17',NULL),(37,'SCPH2151','MEDICAL MICROBIOLOGY II',3,0,19,0,NULL,'2023-07-13 19:50:02','2023-07-13 19:50:02',NULL),(38,'SCPH2123','PHYSICAL CHEMISTRY IV',3,0,10,0,NULL,'2023-07-13 19:50:42','2023-07-13 19:50:42',NULL),(39,'SCPH2142','MEDICAL PHYSIOLOGY VIII',3,0,16,0,NULL,'2023-07-13 19:51:18','2023-07-13 19:51:18',NULL),(40,'SCPH2122','ORGANIC CHEMISTRY IV',3,0,5,0,NULL,'2023-07-13 19:52:38','2023-07-13 19:52:38',NULL),(41,'SCPH2141','MEDICAL PHYSIOLOGY VII',3,0,21,0,NULL,'2023-07-13 19:53:13','2023-07-13 19:53:13',NULL),(42,'SCPH2341','MEDICAL PHYSIOLOGY XI',3,0,13,0,NULL,'2023-07-13 19:55:57','2023-07-13 19:55:57',NULL),(43,'SCPH2352','MEDICAL MICROBIOLOGY',3,0,12,0,NULL,'2023-07-13 19:56:57','2023-07-13 19:56:57',NULL),(44,'SCPH2361','HUMAN PATHOLOGY IV (CLINICAL CHEMISTRY)',3,0,40,0,NULL,'2023-07-13 19:59:36','2023-07-13 19:59:36',NULL),(45,'SCPH2321','ORGANIC CHEMISTRY VI',3,0,8,0,NULL,'2023-07-13 20:00:18','2023-07-13 20:00:18',NULL),(46,'SCPH2342','MEDICAL PHYSIOLOGY XII',3,0,22,0,NULL,'2023-07-13 20:01:14','2023-07-13 20:01:14',NULL),(47,'PHAM2364','PHARMACOGNOSY I',3,0,23,0,NULL,'2023-07-13 20:01:45','2023-07-13 20:01:45',NULL),(48,'PHAM2340','SOCIAL AND BEHAVIORAL PHARMACY I',3,0,24,0,NULL,'2023-07-13 20:05:30','2023-07-13 20:05:30',NULL),(49,'SCPH2351','MEDICAL MICROBIOLOGY IV (VIROLOGY)',3,0,19,0,NULL,'2023-07-13 20:06:18','2023-07-13 20:06:18',NULL),(50,'PHAM2353','PHARMACEUTICAL CHEMISTRY II',3,0,3,0,NULL,'2023-07-13 20:07:48','2023-07-13 20:07:48',NULL),(58,'PHAM3126','PHARMACEUTICS I',3,0,25,0,NULL,'2023-07-13 20:15:54','2023-07-13 20:15:54',NULL),(59,'PHAM3102','PHARMACOLOGY II',3,0,26,0,NULL,'2023-07-13 20:16:51','2023-07-13 20:16:51',NULL),(60,'PHAM3154','PHARMACEUTICAL CHEMISTRY III',3,0,27,0,NULL,'2023-07-13 20:17:40','2023-07-13 20:17:40',NULL),(61,'PHAM3101','PHARMACOLOGY I',3,0,28,0,NULL,'2023-07-13 20:18:12','2023-07-13 20:18:12',NULL),(62,'PHAM3127','PHARMACEUTICS II',3,0,29,0,NULL,'2023-07-13 20:19:00','2023-07-13 20:19:00',NULL),(63,'PHAM3171','TECHNICAL WRITING',3,0,30,0,NULL,'2023-07-13 20:19:38','2023-07-13 20:19:38',NULL),(64,'PHAM3165','PHARMACOGNOSY II',3,0,23,0,NULL,'2023-07-13 20:20:16','2023-07-13 20:20:16',NULL),(65,'PHAM3141','SOCIAL AND BEHAVIORAL PHARMACY II',3,0,31,0,NULL,'2023-07-13 20:20:47','2023-07-13 20:25:34',NULL),(66,'PHAM3166','PHARMACOGNOSY III',3,0,23,0,NULL,'2023-07-13 20:26:34','2023-07-13 20:26:34',NULL),(67,'PHAM3307','PHARMACOLOGY VII',3,0,32,0,NULL,'2023-07-13 20:27:47','2023-07-13 20:27:47',NULL),(68,'PHAM3357','PHARMACEUTICAL CHEMISTRY VI',3,0,27,0,NULL,'2023-07-13 20:28:22','2023-07-13 20:28:22',NULL),(69,'PHAM3368','PHARMACOGNOSY V',3,0,33,0,NULL,'2023-07-13 20:28:54','2023-07-13 20:28:54',NULL),(70,'PHAM3358','PHARMACEUTICAL CHEMISTRY VII',3,0,34,0,NULL,'2023-07-13 20:29:30','2023-07-13 20:29:30',NULL),(71,'PHAM3330','PHARMACEUTICS V (PHYSICAL PHARMACY)',3,0,25,0,NULL,'2023-07-13 20:30:15','2023-07-13 20:30:15',NULL),(72,'PHAM3306','PHARMACOLOGY VI (CVS PHARMACOLOGY)',3,0,26,0,NULL,'2023-07-13 20:30:59','2023-07-13 20:30:59',NULL),(73,'PHAM3331','PHARMACEUTICS VI (STERILIZATION AND DISINFECTION)',3,0,29,0,NULL,'2023-07-13 20:31:39','2023-07-13 20:31:39',NULL),(74,'PHAM3316','CLINICAL PHARMACY II',3,0,16,0,NULL,'2023-07-13 20:32:14','2023-07-13 20:32:14',NULL),(75,'PHAM3346','PHARMACY MANAGEMENT I',3,0,21,0,NULL,'2023-07-13 20:32:49','2023-07-13 20:32:49',NULL),(76,'PHAM3305','PHARMACOLOGY V (HYPNOTICS AND SEDATIVES)',3,0,28,0,NULL,'2023-07-13 20:34:54','2023-07-13 20:34:54',NULL),(86,'PHAM4172','BIOINFORMATICS',3,0,26,0,NULL,'2023-07-13 20:43:46','2023-07-13 20:43:46',NULL),(87,'PHAM4134','PHARMACEUTICS IX (DOSAGE FORMS)',3,0,25,0,NULL,'2023-07-13 20:45:30','2023-07-13 20:45:30',NULL),(88,'PHAM4147','PHARMACY MANAGEMENT II (ENTREPRENEURSHIP)',3,0,35,0,NULL,'2023-07-13 20:46:01','2023-07-13 20:46:01',NULL),(89,'PHAM4108','PHARMACOLOGY VII (GIT PHARMACOLOGY)',3,0,28,0,NULL,'2023-07-13 20:48:18','2023-07-13 20:48:18',NULL),(90,'PHAM4109','PHARMACOLOGY IX',3,0,32,0,NULL,'2023-07-13 20:48:56','2023-07-13 20:48:56',NULL),(91,'PHAM4118','CLINICAL PHARMACY IV',3,0,36,0,NULL,'2023-07-13 20:49:28','2023-07-13 20:49:28',NULL),(92,'PHAM4159','PHARMACEUTICAL CHEMISTRY VIII',3,0,34,0,NULL,'2023-07-13 20:50:01','2023-07-13 20:50:01',NULL),(93,'PHAM4133','PHARMACEUTICS VIII',3,0,37,0,NULL,'2023-07-13 20:50:36','2023-07-13 20:50:36',NULL),(94,'PHAM4117','CLINICAL PHARMACY III',3,0,22,0,NULL,'2023-07-13 20:51:22','2023-07-13 20:51:22',NULL),(95,'PHAM4132','PHARMACEUTICS VII',3,0,37,0,NULL,'2023-07-13 20:52:06','2023-07-13 20:52:06',NULL),(96,'PHAM5161','PHARMACEUTICAL CHEMISTRY X',3,0,27,0,NULL,'2023-07-13 20:52:55','2023-07-13 20:52:55',NULL),(97,'PHAM5170','PHARMACOGNOSY VII',3,0,33,0,NULL,'2023-07-13 20:53:28','2023-07-13 20:53:28',NULL),(98,'PHAM5111','PHARMACOLOGY XI',3,0,32,0,NULL,'2023-07-13 20:54:16','2023-07-13 20:54:16',NULL),(99,'PHAM5121','CLINICAL PHARMACY VII',3,0,16,0,NULL,'2023-07-13 20:54:59','2023-07-13 20:54:59',NULL),(100,'PHAM5122','CLINICAL PHARMACY VIII',3,0,16,0,NULL,'2023-07-13 20:55:34','2023-07-13 20:55:34',NULL),(101,'PHAM5112','PHARMACOLOGY XII',3,0,28,0,NULL,'2023-07-13 20:56:48','2023-07-13 20:56:48',NULL),(102,'PHAM5137','PHARMACEUTICS XII',3,0,37,0,NULL,'2023-07-13 20:57:21','2023-07-13 20:57:21',NULL),(103,'PHAM5149','PHARMACY MANAGEMENT IV',3,0,21,0,NULL,'2023-07-13 20:57:54','2023-07-13 20:57:54',NULL),(104,'PHAM5363','PHARMACEUTICAL CHEMISTRY XII',3,0,34,0,NULL,'2023-07-13 20:58:45','2023-07-13 20:58:45',NULL),(105,'PHAM5345','ENVIRONMENTAL AND OCCUPATIONAL HEALTH',3,0,41,0,NULL,'2023-07-13 21:03:08','2023-07-13 21:03:08',NULL),(106,'PHAM5339','PHARMACEUTICS XIV (NOVEL DRUG DELIVERY SYSTEMS)',3,0,29,0,NULL,'2023-07-13 21:03:39','2023-07-13 21:03:39',NULL),(107,'PHAM5314','PHARMACOLOGY XIV (TOXICOLOGY)',3,0,32,0,NULL,'2023-07-13 21:04:25','2023-07-13 21:04:25',NULL),(108,'PHAM5377','PHARMACY LAW 2',3,0,39,0,NULL,'2023-07-13 21:05:12','2023-07-13 21:05:12',NULL),(109,'PHAM5325','CLINICAL PHARMACY XI',3,0,36,0,NULL,'2023-07-13 21:06:07','2023-07-13 21:06:07',NULL),(110,'PHAM5351','PHARMACY MANAGEMENT VI',3,0,31,0,NULL,'2023-07-13 21:07:35','2023-07-13 21:07:35',NULL),(111,'BCLAB111','BIOCHEMISTRY LABS',1,0,43,2,1,'2023-07-26 19:56:40','2023-07-26 19:56:40',NULL),(112,'BCLAB113','BIOCHEMISTRY LABS',1,0,43,2,1,'2023-07-26 19:58:45','2023-07-26 19:58:45',NULL),(113,'BCLAB211','BIOCHEMISTRY LABS',1,0,43,2,1,'2023-07-26 20:00:17','2023-07-26 20:00:17',NULL),(114,'CHMLAB111','CHEMISTRY LABS',1,0,44,2,2,'2023-07-26 20:02:27','2023-07-26 20:02:27',NULL),(115,'CHMLAB113','CHEMISTRY LABS',1,0,44,2,2,'2023-07-26 20:03:40','2023-07-26 20:03:40',NULL),(116,'CHMLAB211','CHEMISTRY LABS',1,0,44,2,2,'2023-07-26 20:05:48','2023-07-26 20:05:48',NULL),(117,'CHMLAB213','CHEMISTRY LABS',1,0,44,2,2,'2023-07-26 20:06:52','2023-07-26 20:06:52',NULL),(118,'PHYLAB111','PHYSIOLOGY LABS',1,0,45,2,3,'2023-07-26 20:13:01','2023-07-26 20:13:01',NULL),(119,'PHYLAB113','PHYSIOLOGY LABS',1,0,45,2,3,'2023-07-26 20:14:50','2023-07-26 20:14:50',NULL),(120,'PHYLAB211','PHYSIOLOGY LABS',1,0,45,2,3,'2023-07-26 20:16:31','2023-07-26 20:16:31',NULL),(121,'PHYLAB213','PHYSIOLOGY LABS',1,0,45,2,3,'2023-07-26 20:17:40','2023-07-26 20:17:40',NULL),(122,'ANLAB111','ANATOMY LABS',1,0,46,2,4,'2023-07-26 20:21:04','2023-07-26 20:21:04',NULL),(123,'ANLAB113','ANATOMY LABS',1,0,46,2,4,'2023-07-26 20:21:45','2023-07-26 20:21:45',NULL),(124,'MBLAB113','MICROBIOLOGY LABS',1,0,47,2,5,'2023-07-26 20:23:22','2023-07-26 20:23:22',NULL),(125,'MBLAB211','MICROBIOLOGY LABS',1,0,47,2,1,'2023-07-26 20:24:33','2023-07-26 20:24:33',NULL),(126,'MBLAB213','MICROBIOLOGY LABS',1,0,47,2,5,'2023-07-26 20:25:34','2023-07-26 20:25:34',NULL),(127,'PATLAB211','PATHOLOGY LABS',1,0,48,2,7,'2023-07-26 20:29:09','2023-07-26 20:29:09',NULL),(128,'PATLAB213','PATHOLOGY LABS',1,0,48,2,7,'2023-07-26 20:29:39','2023-07-26 20:29:39',NULL),(129,'PCHLAB213','PHARMACEUTICAL CHEMISTRY  LABS',1,0,49,2,8,'2023-07-26 20:36:15','2023-07-26 20:36:15',NULL),(130,'PCHLAB311','PHARMACEUTICAL CHEMISTRY  LABS',1,0,49,2,8,'2023-07-26 20:39:55','2023-07-26 20:39:55',NULL),(131,'PCHLAB313','PHARMACEUTICAL CHEMISTRY  LABS',1,0,49,2,8,'2023-07-26 20:40:58','2023-07-26 20:40:58',NULL),(132,'PCHLAB411','PHARMACEUTICAL CHEMISTRY  LABS',1,0,49,2,8,'2023-07-26 20:41:52','2023-07-26 20:41:52',NULL),(133,'PCHLAB511','PHARMACEUTICAL CHEMISTRY  LABS',1,0,49,2,8,'2023-07-26 20:42:31','2023-07-26 20:42:31',NULL),(134,'PCLAB213','PHARMACOGNOSY LABS',1,0,50,2,6,'2023-07-26 20:44:34','2023-07-26 20:44:34',NULL),(135,'PCLAB311','PHARMACOGNOSY LABS',1,0,50,2,6,'2023-07-26 20:46:32','2023-07-26 20:46:32',NULL),(136,'PCLAB313','PHARMACOGNOSY LABS',1,0,50,2,6,'2023-07-26 20:47:24','2023-07-26 20:47:24',NULL),(137,'PCLAB511','PHARMACOGNOSY LABS',1,0,50,2,6,'2023-07-26 20:49:26','2023-07-26 20:49:26',NULL),(138,'PCOLAB311','PHARMACOLOGY LABS',1,0,50,2,6,'2023-07-26 20:52:21','2023-07-26 20:52:21',NULL),(139,'PCOLAB313','PHARMACOLOGY LABS',1,0,50,2,6,'2023-07-26 20:53:18','2023-07-26 20:53:18',NULL),(140,'PCOLAB411','PHARMACOLOGY LABS',1,0,50,2,6,'2023-07-26 20:54:15','2023-07-26 20:54:15',NULL),(141,'PCOLAB511','PHARMACOLOGY LABS',1,0,50,2,6,'2023-07-26 20:54:57','2023-07-26 20:54:57',NULL),(142,'PMCLAB311','PHARMACEUTICS LABS',1,0,49,2,9,'2023-07-26 20:56:43','2023-07-26 20:56:43',NULL),(143,'PMCLAB313','PHARMACEUTICS LABS',1,0,49,2,9,'2023-07-26 20:57:57','2023-07-26 20:57:57',NULL),(144,'PMCLAB411','PHARMACEUTICS LABS',1,0,49,2,9,'2023-07-26 20:58:36','2023-07-26 20:58:36',NULL),(145,'PMCLAB511','PHARMACEUTICS LABS',1,0,49,2,9,'2023-07-26 20:59:38','2023-07-26 20:59:38',NULL),(146,'CPWR313','CLINICAL PHARMACY WARD ROUNDS',1,0,51,0,NULL,'2023-07-26 21:03:39','2023-07-26 21:03:39',NULL),(147,'CPWR411','CLINICAL PHARMACY WARD ROUNDS',1,0,51,0,NULL,'2023-07-26 21:04:29','2023-07-26 21:04:29',NULL),(148,'CPWR511','CLINICAL PHARMACY WARD ROUNDS',1,0,51,0,NULL,'2023-07-26 21:04:58','2023-07-26 21:04:58',NULL),(149,'CPWR513','CLINICAL PHARMACY WARD ROUNDS',1,0,51,0,NULL,'2023-07-26 21:05:43','2023-07-26 21:05:43',NULL),(150,'PHRP511','RESEARCH PROJECT',1,0,52,0,NULL,'2023-07-26 21:06:55','2023-07-26 21:06:55',NULL),(151,'PHRP513','RESEARCH PROJECT',1,0,52,0,NULL,'2023-07-26 21:07:23','2023-07-26 21:07:23',NULL),(152,'PHS1P513','STAGE 1 PREPARATION',4,0,52,0,NULL,'2023-07-26 21:34:41','2023-07-26 21:34:41',NULL);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `avatar` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default.jpg',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','injuguna@kabarak.ac.ke','1','default.jpg',NULL,'$2y$10$adtU7CrPVNYxI9aSn90K2ubGpcSD.Rt/seCRAI1Kr476OQgdaANJq',NULL,'2023-07-13 14:08:44','2023-07-13 14:08:44'),(2,'Timetabler','timetabler@mail.com','2','default.jpg',NULL,'$2y$10$fiNvbG9jvGpJ3xdjeWj7qOd463KePzy3LpD2Ow7L1pEEiiEqdKVIa',NULL,'2023-07-13 14:08:44','2023-07-13 14:08:44'),(3,'lecturer','lecturer@mail.com','4','default.jpg',NULL,'$2y$10$FgEfklHG7U4Cg.bpXjOkjewne3.EfF1KQe.gwedRd0vrGZYJ9K/7O',NULL,'2023-07-13 14:08:44','2023-07-13 14:08:44'),(4,'hod','hod@mail.com','4','default.jpg',NULL,'$2y$10$RzS/5VxrD16chfDPe97sXO2mC0HYY5.4.Y6..YzIbGWFSXX1tGoKy',NULL,'2023-07-13 14:08:44','2023-07-13 14:08:44'),(5,'Mr.','mulinge@gmail.com','4','default.jpg',NULL,'$2y$10$Bh5gcXPiA0uWcxOH0MjS9.RTjnUZ0uRHBXCqBYR7u0gvqUOabnLH6',NULL,'2023-07-13 18:06:11','2023-07-13 18:06:11'),(6,'Mr.','bundotich@gmail.com','4','default.jpg',NULL,'$2y$10$OMlGlq0hzo1CGgChUks4ROGzmkzKpKVxpAUPux03HKHqPVw/kvq.i',NULL,'2023-07-13 18:06:59','2023-07-13 18:06:59'),(7,'Rev.','rotich@gmail.com','4','default.jpg',NULL,'$2y$10$MEq3O3IDwMRKIGwrcMWOO.9HTHPOEsWLkb8tZIppQ8Uqk5kWooNkq',NULL,'2023-07-13 18:07:50','2023-07-13 18:07:50'),(8,'Ms.','murithi@gmail.com','4','default.jpg',NULL,'$2y$10$ohQ6g64xto454x.WBqczJeDGi9I7EKkBeHwdIElNGBVcDI2HMtOKy',NULL,'2023-07-13 18:15:25','2023-07-13 18:15:25'),(9,'Dr.','akumu@gmail.com','4','default.jpg',NULL,'$2y$10$WnPqc7GgsRWCvWREoXkTn.p1YNls8kTTcyfeKFuQjUHIdTDBv8JYq',NULL,'2023-07-13 18:17:39','2023-07-13 18:17:39'),(10,'Dr.','rose@gmail.com','4','default.jpg',NULL,'$2y$10$4g4c7JNZ3AUwIaKdb62u6uW7X2HBGt4PKATcG1kNsANCpJ9wrd.w6',NULL,'2023-07-13 18:19:49','2023-07-13 18:19:49'),(11,'Dr.','kirui@gmail.com','4','default.jpg',NULL,'$2y$10$wY8vTyC.7Nw4uhHOoCfcWOoe7/0o0S5mrvwS323L3a6R6wJi2lnIG',NULL,'2023-07-13 18:20:50','2023-07-13 18:20:50'),(12,'Mr.','rono@gmail.com','4','default.jpg',NULL,'$2y$10$Btrja/7aKuDKTANta0P/2OZoY5rD6Eo9XP1vtykjh1Eng/FLd2jJi',NULL,'2023-07-13 18:25:57','2023-07-13 18:25:57'),(13,'Ms.','kerubo@gmail.com','4','default.jpg',NULL,'$2y$10$P1UEySpsiLYDcC4S/w.VhObHC4BfNjb1hsW9DAJwbMifo5.3mfvSe',NULL,'2023-07-13 18:26:52','2023-07-13 18:26:52'),(14,'Dr.','Nahashon@gmail.com','4','default.jpg',NULL,'$2y$10$kiEjQsmE2hbF2Pj.vNZAG.Sh2DfRtU3cG2ieJ29wKQ3pdywPmGhy6',NULL,'2023-07-13 18:27:24','2023-07-13 18:27:24'),(15,'Mr.','Micah@gmail.com','4','default.jpg',NULL,'$2y$10$Fvtzx0TLkE3OOcgcHjg7l.FBVqRF7FifoKSOu7/xWt3tt4sKHl0Rq',NULL,'2023-07-13 18:30:47','2023-07-13 18:30:47'),(16,'Dr.','Kebenei@gmail.com','4','default.jpg',NULL,'$2y$10$TucA2DItIQIT3kDrlbAcLOCTShrGJD3hXZrjcnZjdNCoub1qZvS2C',NULL,'2023-07-13 18:38:36','2023-07-13 18:38:36'),(17,'Dr.','Wairimu@gmail.com','4','default.jpg',NULL,'$2y$10$wwDZQUDsEuGUPtQtor3teOodo1I1eb7BIxOZtenHsrkOHH7IKlFGy',NULL,'2023-07-13 18:39:22','2023-07-13 18:39:22'),(18,'Mr.','Charles@gmail.com','4','default.jpg',NULL,'$2y$10$TnUkaFZQhrEyg4pZTurIC.QH8D31NMGikZvERe6yI8OvCGsvz6HDK',NULL,'2023-07-13 18:45:00','2023-07-13 18:45:00'),(19,'Dr.','Walekhwa@gmail.com','4','default.jpg',NULL,'$2y$10$vC8QgVEcDoqQt2knrLByN.ytfj8DWvXmRPnUX3bWoqg0ijueuk3qy',NULL,'2023-07-13 18:45:39','2023-07-13 18:45:39'),(20,'Dr.','Tonui@gmail.com','4','default.jpg',NULL,'$2y$10$GHu2AOEh8LZv8OtGQROyFebs2K4QppkGaT6Zrd4esr4GVqmu67Jay',NULL,'2023-07-13 18:46:06','2023-07-13 18:46:06'),(21,'Dr.','Chebon@gmail.com','4','default.jpg',NULL,'$2y$10$6udy89Wf0QSgn1cruz3mnuVsIpWrba9j1HQzHeDHRWlY85LS7MnxS',NULL,'2023-07-13 18:47:41','2023-07-13 18:47:41'),(22,'Dr.','Keter@gmail.com','4','default.jpg',NULL,'$2y$10$boSnZBJMhAPos69dt0aX7emcIolVnmPxFruzabKgqW2zYkAbAIRNi',NULL,'2023-07-13 18:48:23','2023-07-13 18:48:23'),(23,'Ms.','Elizabeth@gmail.com','4','default.jpg',NULL,'$2y$10$o6y75rPqThs2dUyazLzy..t7fDJmgsshaQ/vs6iToufxTrMP2blda',NULL,'2023-07-13 18:49:07','2023-07-13 18:49:07'),(24,'Ms.','Nyangena@gmail.com','4','default.jpg',NULL,'$2y$10$XgmamDk/Jcr.JYhbdJB0juiiT4xXPUTxEMpKvkwtOpXpUxb3wAJwu',NULL,'2023-07-13 18:51:25','2023-07-13 18:51:25'),(25,'Dr.','Vugigi@gmail.com','4','default.jpg',NULL,'$2y$10$0FvXNSxf4PjzmQGa6bb29.et3wMmDKXPKA5p4R.lJ/zSAhxxVVksO',NULL,'2023-07-13 18:52:23','2023-07-13 18:52:23'),(26,'Dr.','Kagia@gmail.com','4','default.jpg',NULL,'$2y$10$ELjn0kaBNNntrn2e4JezLuFJGyfDSKZhs3TNHTgZ0hdL8y.TPWPIK',NULL,'2023-07-13 18:52:49','2023-07-13 18:52:49'),(27,'Dr.','Jediel@gmail.com','4','default.jpg',NULL,'$2y$10$XBh4mfN/Bfw4/vr3ey2GG.vJuumVSZ/fvCC2e6UWmpU6ZQAbB3lzy',NULL,'2023-07-13 18:53:22','2023-07-13 18:53:22'),(28,'Dr.','Jim@gmail.com','4','default.jpg',NULL,'$2y$10$i8wtxbjZHVMzkxKCJ0RqH.hzC2GPTGhALJValZvnRqp6pav6SBJaS',NULL,'2023-07-13 18:53:49','2023-07-13 18:53:49'),(29,'Dr.','Nyandoro@gmail.com','4','default.jpg',NULL,'$2y$10$XwqcpCusRnvEOmNStAb3l.FG3/NY8pyJPC5ZPVbUzJXXUrQk5nCeC',NULL,'2023-07-13 18:54:24','2023-07-13 18:54:24'),(30,'Mrs.','Somba@gmail.com','4','default.jpg',NULL,'$2y$10$prDiT7L80rjih2QkIqQlQuf0.eCHqRPU2VtZcxpmxfWmMO79jMfae',NULL,'2023-07-13 18:55:01','2023-07-13 18:55:01'),(31,'Mr.','Kandagor,@gmail.com','4','default.jpg',NULL,'$2y$10$R/rvpc8ZMTLgK22sFZ5DWOBUZflKX1YkmDI/nhIXpleUkbP03hnP2',NULL,'2023-07-13 18:55:56','2023-07-13 18:55:56'),(32,'Dr.','Meroka@gmail.com','4','default.jpg',NULL,'$2y$10$OjzseffYFHET2oXuEyVu4elQCtgps.BFWjhMT017h4xS2dZQioGqC',NULL,'2023-07-13 18:57:03','2023-07-13 18:57:03'),(33,'Dr.','Janet@gmail.com','4','default.jpg',NULL,'$2y$10$VrO7zIRL2WT5o/L.Pcq.I.1OeFbbfDdXk2QlPmsLtsDBa03VyMp3S',NULL,'2023-07-13 18:57:30','2023-07-13 18:57:30'),(34,'Dr.','Ndubi@gmail.com','4','default.jpg',NULL,'$2y$10$EMKOIFZpjwD.aH88h7sFfOoxC6UTyGbx2kJCDF7ifXT5rukX7kVSS',NULL,'2023-07-13 18:58:10','2023-07-13 18:58:10'),(35,'Dr.','Balongo,@gmail.com','4','default.jpg',NULL,'$2y$10$sJHqsrYwn..wmFd0aqSCpea0DNx8fsodwOyBjeuXkyruy/H8gZflm',NULL,'2023-07-13 18:59:14','2023-07-13 18:59:14'),(36,'Dr.','Nelius@gmail.com','4','default.jpg',NULL,'$2y$10$mS4LM3Mxn2/bNDvHqxBmceqMHv6/76.3tOm/s.b2l2Bcc2DQ8NCNW',NULL,'2023-07-13 19:01:04','2023-07-13 19:01:04'),(37,'Dr.','Obat@gmail.com','4','default.jpg',NULL,'$2y$10$SuGn9u873g9AchH9dqrD1O1cLyEzoNE4Y0oV5I4FMwLzlSZP4x1da',NULL,'2023-07-13 19:01:43','2023-07-13 19:01:43'),(38,'Ms.','Wakuraya@gmail.com','4','default.jpg',NULL,'$2y$10$RdiqzTb7jNlLRrTI.//gOO/L1cI2fSS5oB19fj7qU5FrE2zmHfPgS',NULL,'2023-07-13 19:03:32','2023-07-13 19:03:32'),(39,'Ms.','Murugi@gmail.com','4','default.jpg',NULL,'$2y$10$hfxWZMoCx.qBsArAF7kQ8.c3JAizxfbx23wK7TE1fDOUuxgr/LPfa',NULL,'2023-07-13 19:58:36','2023-07-13 19:58:36'),(40,'Mrs.','Kurui@gmail.com','4','default.jpg',NULL,'$2y$10$w/fLAnhbYGIMDShd5IstHueZ1WR3NPxlUUCDYMgYGc38DpfnzlXCO',NULL,'2023-07-13 21:02:13','2023-07-13 21:02:13'),(41,'Dr.','saruni@gmail.com','4','default.jpg',NULL,'$2y$10$QkUNU4gWVzobr2i9FVjSBekC.4GNBSszqZksofhVN2.l6AdXhISFu',NULL,'2023-07-26 18:53:48','2023-07-26 18:53:48'),(42,'Biochemistry','Biochemistry@gmail.com','4','default.jpg',NULL,'$2y$10$aWUJqaoTmkjsVciEL2vaSe6ZiYkOVMw/qdPtHVnHndVtJ2DQusWPW',NULL,'2023-07-26 19:15:57','2023-07-26 19:15:57'),(43,'Chemistry','Chemistry@gmail.com','4','default.jpg',NULL,'$2y$10$zhi68cNWJGYQgCg2hMBhtuioiCTVt2wkrEPIjw9aDziyUWasSUrJC',NULL,'2023-07-26 19:16:44','2023-07-26 19:16:44'),(44,'Physiology','Physiology@gmail.com','4','default.jpg',NULL,'$2y$10$VX.vEhoED0i5NxfTqal6Gua4wh2doVtvm3bV3p1XJ3Nlp.Vb68tlK',NULL,'2023-07-26 19:18:11','2023-07-26 19:18:11'),(45,'Anatomy','Anatomy@gmail.com','4','default.jpg',NULL,'$2y$10$.L.CLUnJiM2GidIUOMTXieArZiUxzIdgTwCi0TJqq3eGFPr380wKe',NULL,'2023-07-26 19:18:52','2023-07-26 19:18:52'),(46,'Microbiology','Microbiology@gmail.com','4','default.jpg',NULL,'$2y$10$Jcekr7730x3MPnWHct70/unyFhsDabdcgMwpOc7ioV/sA4kWli1Ja',NULL,'2023-07-26 19:20:19','2023-07-26 19:20:19'),(47,'Pathology','Pathology@gmail.com','4','default.jpg',NULL,'$2y$10$ILocyFNuhJAydj3NmJMxUuIWsUMsRseqcm0X11GvP8ge94av8MfFy',NULL,'2023-07-26 19:23:25','2023-07-26 19:23:25'),(48,'Pharmaceutical','Pharmaceutical@gmail.com','4','default.jpg',NULL,'$2y$10$Y679EwuIi9wNAsRLlq540ufUcDfplLUzw8riIf5ZBfgaLLzg14.yW',NULL,'2023-07-26 19:26:48','2023-07-26 19:26:48'),(49,'Pharmacognosy','Pharmacognosy@gmail.com','4','default.jpg',NULL,'$2y$10$BRquIp.vaG/s3QWgj/hzvuVJHXLnlnHxMRPK5iqzpuqxAGJsmfidK',NULL,'2023-07-26 19:28:00','2023-07-26 19:28:00'),(50,'Mr.','Justine@gmail.com','4','default.jpg',NULL,'$2y$10$FDz4kgpjs8npqC1Cf7CRtu5hZVBh.gXL.3gas631GVAkc7IjhPqee',NULL,'2023-07-26 19:32:20','2023-07-26 19:32:20'),(51,'Mr.','Nicolas@gmail.com','4','default.jpg',NULL,'$2y$10$0rAhPpQRTobQRIXzZT4NRuYSxMImTt80A33BkYanAkbWfQJzCysri',NULL,'2023-07-26 19:33:09','2023-07-26 19:33:09');
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

-- Dump completed on 2023-07-27  0:38:40
