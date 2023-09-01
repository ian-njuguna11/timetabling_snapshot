-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pharmtt
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
-- Table structure for table `accesstokens`
--

DROP TABLE IF EXISTS `accesstokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accesstokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(191) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `csv_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `csv_filename` varchar(191) NOT NULL,
  `csv_header` tinyint(1) NOT NULL DEFAULT 0,
  `csv_data` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `csv_data`
--

LOCK TABLES `csv_data` WRITE;
/*!40000 ALTER TABLE `csv_data` DISABLE KEYS */;
INSERT INTO `csv_data` VALUES (1,'results.csv',1,'[[\"code\",\"name\",\"lecture_hours\",\"lab_hours\",\"lab_type_id\"],[\"COMP100\",\"INTRODUCTION TO COMPUTERS\",\"45\",\"0\",\"NULL\"],[\"COMS110\",\"COMMUNICATION SKILLS\",\"45\",\"0\",\"NULL\"],[\"SCPH1111\",\"MATHEMATICS FOR PHARMACY I\",\"45\",\"0\",\"NULL\"],[\"BIBL110\",\"OLD TESTAMENT SURVEY\",\"45\",\"0\",\"NULL\"],[\"SCPH1123\",\"INORGANIC CHEMISTRY I\",\"45\",\"15\",\"2\"],[\"SCPH1141\",\"MEDICAL PHYSIOLOGY I\",\"45\",\"15\",\"3\"],[\"SCPH1122\",\"PHYSICAL CHEMISTRY I\",\"45\",\"15\",\"2\"],[\"SCPH1151\",\"HUMAN ANATOMY I\",\"45\",\"15\",\"4\"],[\"SCPH1131\",\"BIOCHEMISTRY I\",\"45\",\"15\",\"1\"],[\"SCPH1351\",\"MEDICAL MICROBIOLOGY I\",\"45\",\"15\",\"5\"],[\"SCPH1346\",\"MEDICAL PHYSIOLOGY VI (SENSORY SYSTEMS)\",\"45\",\"15\",\"3\"],[\"SCPH1327\",\"ORGANIC CHEMISTRY II\",\"45\",\"15\",\"2\"],[\"SCPH1334\",\"BIOCHEMISTRY IV (METABOLISM II)\",\"45\",\"15\",\"1\"],[\"SCPH1313\",\"MATHEMATICS FOR PHARMACY III (CALCULUS II)\",\"45\",\"0\",\"NULL\"],[\"SCPH1335\",\"BIOCHEMISTRY V (SPECIALIZED TISSUES)\",\"45\",\"15\",\"1\"],[\"SCPH1328\",\"PHYSICAL CHEMISTRY III\",\"45\",\"15\",\"2 \"],[\"SCPH1345\",\"MEDICAL PHYSIOLOGY V (CVS)\",\"45\",\"15\",\"3\"],[\"SCPH1353\",\"HUMAN ANATOMY III\",\"45\",\"15\",\"4\"],[\"SCPH1329\",\"INORGANIC CHEMISTRY III\",\"45\",\"15\",\"2\"],[\"SCPH2136\",\"BIOCHEMISTRY VI\",\"45\",\"15\",\"1\"],[\"SCPH2121\",\"ORGANIC CHEMISTRY III\",\"45\",\"15\",\"2\"],[\"SCPH2111\",\"BIOSTATISTICS\",\"45\",\"0\",\"NULL\"],[\"SCPH2137\",\"BIOCHEMISTRY VII\",\"45\",\"15\",\"1\"],[\"SCPH2161\",\"HUMAN PATHOLOGY I\",\"45\",\"15\",\"7\"],[\"SCPH2151\",\"MEDICAL MICROBIOLOGY II\",\"45\",\"15\",\"5\"],[\"SCPH2123\",\"PHYSICAL CHEMISTRY IV\",\"45\",\"15\",\"2\"],[\"SCPH2142\",\"MEDICAL PHYSIOLOGY VIII\",\"45\",\"15\",\"3\"],[\"SCPH2122\",\"ORGANIC CHEMISTRY IV\",\"45\",\"15\",\"2\"],[\"SCPH2141\",\"MEDICAL PHYSIOLOGY VII\",\"45\",\"15\",\"3\"],[\"SCPH2341\",\"MEDICAL PHYSIOLOGY XI\",\"45\",\"15\",\"3\"],[\"SCPH2352\",\"MEDICAL MICROBIOLOGY V\",\"45\",\"15\",\"5\"],[\"SCPH2361\",\"HUMAN PATHOLOGY IV (CLINICAL CHEMISTRY)\",\"45\",\"15\",\"2\"],[\"SCPH2321\",\"ORGANIC CHEMISTRY VI\",\"45\",\"15\",\"2\"],[\"SCPH2342\",\"MEDICAL PHYSIOLOGY XII\",\"45\",\"15\",\"3\"],[\"PHAM2364\",\"PHARMACOGNOSY I\",\"45\",\"15\",\"6\"],[\"PHAM2340\",\"SOCIAL AND BEHAVIORAL PHARMACY I\",\"45\",\"0\",\"NULL\"],[\"SCPH2351\",\"MEDICAL MICROBIOLOGY IV (VIROLOGY)\",\"45\",\"15\",\"5\"],[\"PHAM2353\",\"PHARMACEUTICAL CHEMISTRY II\",\"45\",\"15\",\"8\"],[\"PHAM3126\",\"PHARMACEUTICS I\",\"45\",\"15\",\"9\"],[\"PHAM3102\",\"PHARMACOLOGY II\",\"45\",\"15\",\"10\"],[\"PHAM3154\",\"PHARMACEUTICAL CHEMISTRY III\",\"45\",\"15\",\"8\"],[\"PHAM3101\",\"PHARMACOLOGY I\",\"45\",\"15\",\"10\"],[\"PHAM3127\",\"PHARMACEUTICS II\",\"45\",\"15\",\"9\"],[\"PHAM3171\",\"TECHNICAL WRITING\",\"45\",\"0\",\"NULL\"],[\"PHAM3165\",\"PHARMACOGNOSY II\",\"45\",\"15\",\"6\"],[\"PHAM3141\",\"SOCIAL AND BEHAVIORAL PHARMACY II\",\"45\",\"0\",\"NULL\"],[\"PHAM3166\",\"PHARMACOGNOSY III\",\"45\",\"15\",\"6\"],[\"PHAM3307\",\"PHARMACOLOGY VII\",\"45\",\"15\",\"10\"],[\"PHAM3357\",\"PHARMACEUTICAL CHEMISTRY VI\",\"45\",\"15\",\"8\"],[\"PHAM3368\",\"PHARMACOGNOSY V\",\"45\",\"15\",\"6\"],[\"PHAM3358\",\"PHARMACEUTICAL CHEMISTRY VII\",\"45\",\"15\",\"8\"],[\"PHAM3330\",\"PHARMACEUTICS V (PHYSICAL PHARMACY)\",\"45\",\"15\",\"9\"],[\"PHAM3306\",\"PHARMACOLOGY VI (CVS PHARMACOLOGY)\",\"45\",\"15\",\"10\"],[\"PHAM3331\",\"PHARMACEUTICS VI (STERILIZATION AND DISINFECTION)\",\"45\",\"15\",\"9\"],[\"PHAM3316\",\"CLINICAL PHARMACY II\",\"45\",\"0\",\"NULL\"],[\"PHAM3346\",\"PHARMACY MANAGEMENT I\",\"45\",\"0\",\"NULL\"],[\"PHAM3305\",\"PHARMACOLOGY V (HYPNOTICS AND SEDATIVES)\",\"45\",\"15\",\"10\"],[\"PHAM4172\",\"BIOINFORMATICS\",\"45\",\"0\",\"NULL\"],[\"PHAM4134\",\"PHARMACEUTICS IX (DOSAGE FORMS)\",\"45\",\"15\",\"9\"],[\"PHAM4147\",\"PHARMACY MANAGEMENT II (ENTREPRENEURSHIP)\",\"45\",\"0\",\"NULL\"],[\"PHAM4108\",\"PHARMACOLOGY VII (GIT PHARMACOLOGY)\",\"45\",\"15\",\"10\"],[\"PHAM4109\",\"PHARMACOLOGY IX\",\"45\",\"15\",\"10\"],[\"PHAM4118\",\"CLINICAL PHARMACY IV\",\"45\",\"0\",\"NULL\"],[\"PHAM4159\",\"PHARMACEUTICAL CHEMISTRY VIII\",\"45\",\"15\",\"8\"],[\"PHAM4133\",\"PHARMACEUTICS VIII\",\"45\",\"15\",\"9\"],[\"PHAM4117\",\"CLINICAL PHARMACY III\",\"45\",\"0\",\"NULL\"],[\"PHAM4132\",\"PHARMACEUTICS VII\",\"45\",\"15\",\"9\"],[\"PHAM5161\",\"PHARMACEUTICAL CHEMISTRY X\",\"45\",\"15\",\"8\"],[\"PHAM5170\",\"PHARMACOGNOSY VII\",\"45\",\"15\",\"6\"],[\"PHAM5111\",\"PHARMACOLOGY XI\",\"45\",\"15\",\"10\"],[\"PHAM5121\",\"CLINICAL PHARMACY VII\",\"45\",\"0\",\"NULL\"],[\"PHAM5122\",\"CLINICAL PHARMACY VIII\",\"45\",\"0\",\"NULL\"],[\"PHAM5112\",\"PHARMACOLOGY XII\",\"45\",\"15\",\"10\"],[\"PHAM5137\",\"PHARMACEUTICS XII\",\"45\",\"15\",\"8\"],[\"PHAM5149\",\"PHARMACY MANAGEMENT IV\",\"45\",\"0\",\"NULL\"],[\"PHAM5363\",\"PHARMACEUTICAL CHEMISTRY XII\",\"45\",\"15\",\"8\"],[\"PHAM5345\",\"ENVIRONMENTAL AND OCCUPATIONAL HEALTH\",\"45\",\"0\",\"NULL\"],[\"PHAM5339\",\"PHARMACEUTICS XIV (NOVEL DRUG DELIVERY SYSTEMS)\",\"45\",\"0\",\"NULL\"],[\"PHAM5314\",\"PHARMACOLOGY XIV (TOXICOLOGY)\",\"45\",\"0\",\"NULL\"],[\"PHAM5377\",\"PHARMACY LAW 2\",\"45\",\"0\",\"NULL\"],[\"PHAM5325\",\"CLINICAL PHARMACY XI\",\"45\",\"0\",\"NULL\"],[\"PHAM5351\",\"PHARMACY MANAGEMENT VI\",\"45\",\"0\",\"NULL\"]]','2023-08-12 08:41:17','2023-08-12 08:41:17');
/*!40000 ALTER TABLE `csv_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `school_ID` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (2,'Pharmaceuticals and Pharmaceutics','2','2023-08-12 08:22:25','2023-08-12 08:22:25');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `generated_documents` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint(20) unsigned NOT NULL,
  `program_id` int(10) unsigned NOT NULL,
  `description` varchar(191) NOT NULL,
  `document_name` varchar(191) NOT NULL,
  `show` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `generated_documents_school_id_foreign` (`school_id`),
  KEY `generated_documents_program_id_foreign` (`program_id`),
  CONSTRAINT `generated_documents_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `generated_documents_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generated_documents`
--

LOCK TABLES `generated_documents` WRITE;
/*!40000 ALTER TABLE `generated_documents` DISABLE KEYS */;
INSERT INTO `generated_documents` VALUES (1,2,1,'May-August Timetable','7cec4a58a4d41ae7c8db82f4a9b4182d.pdf',1,'2023-08-12 09:51:08','2023-08-12 09:51:08');
/*!40000 ALTER TABLE `generated_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_o_d_s`
--

DROP TABLE IF EXISTS `h_o_d_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_o_d_s` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL DEFAULT '0',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `lecturer_ID` int(10) unsigned DEFAULT NULL,
  `deparment_ID` int(10) unsigned DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_types`
--

LOCK TABLES `lab_types` WRITE;
/*!40000 ALTER TABLE `lab_types` DISABLE KEYS */;
INSERT INTO `lab_types` VALUES (1,'Biochemistry Labs','2023-08-12 08:27:40','2023-08-12 08:27:40'),(2,'Chemistry Labs','2023-08-12 08:27:49','2023-08-12 08:27:49'),(3,'Physiology Labs','2023-08-12 08:27:58','2023-08-12 08:27:58'),(4,'Anatomy Labs','2023-08-12 08:28:06','2023-08-12 08:28:06'),(5,'Microbiology Labs','2023-08-12 08:28:16','2023-08-12 08:28:16'),(6,'Pharmacognosy Labs','2023-08-12 08:28:26','2023-08-12 08:28:26'),(7,'Pathology Labs','2023-08-12 08:28:37','2023-08-12 08:28:37'),(8,'Pharmaceutical Chemistry Labs','2023-08-12 08:28:47','2023-08-12 08:28:47'),(9,'Pharmaceutics Labs','2023-08-12 08:28:57','2023-08-12 08:28:57'),(10,'Pharmacology Labs','2023-08-12 08:29:06','2023-08-12 08:29:06');
/*!40000 ALTER TABLE `lab_types` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `lectures` VALUES (1,'Mr.','Mulinge',2,'0','mulinge@gmail.com',NULL,'',NULL,'2023-07-13 12:06:11','2023-08-12 09:48:24'),(4,'Mr.','Bundotich',2,'0','bundotich@gmail.com',NULL,'',NULL,'2023-07-13 12:06:59','2023-08-12 09:48:24'),(5,'Rev.','Rotich',2,'0','rotich@gmail.com',NULL,'',NULL,'2023-07-13 12:07:50','2023-08-12 09:48:24'),(6,'Ms.','Murithi',2,'0','murithi@gmail.com',NULL,'',NULL,'2023-07-13 12:15:25','2023-08-12 09:48:24'),(8,'Dr.','Akumu,',2,'0','akumu@gmail.com',NULL,'',NULL,'2023-07-13 12:17:39','2023-08-12 09:48:24'),(9,'Dr.','Rose',2,'0','rose@gmail.com',NULL,'',NULL,'2023-07-13 12:19:48','2023-08-12 09:48:24'),(10,'Dr.','Chepkirui',2,'0','kirui@gmail.com',NULL,'',NULL,'2023-07-13 12:20:50','2023-08-12 09:48:24'),(11,'Mr.','Rono',2,'0','rono@gmail.com',NULL,'',NULL,'2023-07-13 12:25:57','2023-08-12 09:48:24'),(12,'Ms.','Kerubo',2,'0','kerubo@gmail.com',NULL,'',NULL,'2023-07-13 12:26:52','2023-08-12 09:48:24'),(13,'Dr.','Nahashon',2,'0','Nahashon@gmail.com',NULL,'',NULL,'2023-07-13 12:27:24','2023-08-12 09:48:24'),(14,'Mr.','Micah',2,'0','Micah@gmail.com',NULL,'',NULL,'2023-07-13 12:30:47','2023-08-12 09:48:24'),(15,'Dr.','Kebenei',2,'0','Kebenei@gmail.com',NULL,'',NULL,'2023-07-13 12:38:36','2023-08-12 09:48:24'),(16,'Dr.','Wairimu',2,'0','Wairimu@gmail.com',NULL,'',NULL,'2023-07-13 12:39:22','2023-08-12 09:48:24'),(17,'Mr.','Charles',2,'0','Charles@gmail.com',NULL,'',NULL,'2023-07-13 12:45:00','2023-08-12 09:48:24'),(18,'Dr.','Walekhwa',2,'0','Walekhwa@gmail.com',NULL,'',NULL,'2023-07-13 12:45:39','2023-08-12 09:48:24'),(19,'Dr.','Tonui',2,'0','Tonui@gmail.com',NULL,'',NULL,'2023-07-13 12:46:06','2023-08-12 09:48:24'),(21,'Dr.','Chebon',2,'0','Chebon@gmail.com',NULL,'',NULL,'2023-07-13 12:47:41','2023-08-12 09:48:24'),(22,'Dr.','Keter',2,'0','Keter@gmail.com',NULL,'',NULL,'2023-07-13 12:48:23','2023-08-12 09:48:24'),(23,'Ms.','Elizabeth',2,'0','Elizabeth@gmail.com',NULL,'',NULL,'2023-07-13 12:49:07','2023-08-12 09:48:24'),(24,'Ms.','Emily Nyangena',2,'0','Nyangena@gmail.com',NULL,'',NULL,'2023-07-13 12:51:25','2023-08-12 09:48:24'),(25,'Dr.','Vugigi',2,'0','Vugigi@gmail.com',NULL,'',NULL,'2023-07-13 12:52:23','2023-08-12 09:48:24'),(26,'Dr.','Kagia',2,'0','Kagia@gmail.com',NULL,'',NULL,'2023-07-13 12:52:49','2023-08-12 09:48:24'),(27,'Dr.','Jediel',2,'0','Jediel@gmail.com',NULL,'',NULL,'2023-07-13 12:53:22','2023-08-12 09:48:24'),(28,'Dr.','Jim',2,'0','Jim@gmail.com',NULL,'',NULL,'2023-07-13 12:53:49','2023-08-12 09:48:24'),(29,'Dr.','Nyandoro',2,'0','Nyandoro@gmail.com',NULL,'',NULL,'2023-07-13 12:54:24','2023-08-12 09:48:24'),(30,'Mrs.','Somba',2,'0','Somba@gmail.com',NULL,'',NULL,'2023-07-13 12:55:01','2023-08-12 09:48:24'),(31,'Mr.','Kandagor',2,'0','Kandagor,@gmail.com',NULL,'',NULL,'2023-07-13 12:55:56','2023-08-12 09:48:24'),(32,'Dr.','Meroka',2,'1','Meroka@gmail.com',NULL,'',NULL,'2023-07-13 12:57:03','2023-08-12 09:48:24'),(33,'Dr.','Janet',2,'0','Janet@gmail.com',NULL,'',NULL,'2023-07-13 12:57:30','2023-08-12 09:48:24'),(34,'Dr.','Ndubi',2,'0','Ndubi@gmail.com',NULL,'',NULL,'2023-07-13 12:58:10','2023-08-12 09:48:24'),(35,'Dr.','Balongo,',2,'0','Balongo,@gmail.com',NULL,'',NULL,'2023-07-13 12:59:14','2023-08-12 09:48:24'),(36,'Dr.','Nelius',2,'0','Nelius@gmail.com',NULL,'',NULL,'2023-07-13 13:01:04','2023-08-12 09:48:24'),(37,'Dr.','Obat',2,'0','Obat@gmail.com',NULL,'',NULL,'2023-07-13 13:01:43','2023-08-12 09:48:24'),(39,'Ms.','Wakuraya',2,'0','Wakuraya@gmail.com',NULL,'',NULL,'2023-07-13 13:03:31','2023-08-12 09:48:24'),(40,'Ms.','Murugi',2,'0','Murugi@gmail.com',NULL,'',NULL,'2023-07-13 13:58:36','2023-08-12 09:48:24'),(41,'Mrs.','Kurui',2,'0','Kurui@gmail.com',NULL,'',NULL,'2023-07-13 15:02:13','2023-08-12 09:48:24'),(42,'Dr.','Saruni',2,'0','saruni@gmail.com',NULL,'',NULL,'2023-07-26 12:53:48','2023-08-12 09:48:24'),(54,'Dr.','Rotich',2,'0','drrotich@gmail.com',NULL,'',NULL,'2023-08-01 05:50:04','2023-08-12 09:48:24');
/*!40000 ALTER TABLE `lectures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels_units_pivot`
--

DROP TABLE IF EXISTS `levels_units_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `levels_units_pivot` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit_id` int(10) unsigned NOT NULL,
  `level_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `levels_units_pivot_unit_id_foreign` (`unit_id`),
  KEY `levels_units_pivot_level_id_foreign` (`level_id`),
  CONSTRAINT `levels_units_pivot_level_id_foreign` FOREIGN KEY (`level_id`) REFERENCES `program_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `levels_units_pivot_unit_id_foreign` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels_units_pivot`
--

LOCK TABLES `levels_units_pivot` WRITE;
/*!40000 ALTER TABLE `levels_units_pivot` DISABLE KEYS */;
INSERT INTO `levels_units_pivot` VALUES (1,8,1,NULL,NULL),(2,9,1,NULL,NULL),(3,10,1,NULL,NULL),(4,11,1,NULL,NULL),(5,12,1,NULL,NULL),(6,13,1,NULL,NULL),(7,14,1,NULL,NULL),(8,15,1,NULL,NULL),(9,16,1,NULL,NULL),(10,17,3,NULL,NULL),(11,18,3,NULL,NULL),(12,19,3,NULL,NULL),(13,20,3,NULL,NULL),(14,21,3,NULL,NULL),(15,22,3,NULL,NULL),(16,23,3,NULL,NULL),(17,24,3,NULL,NULL),(18,25,3,NULL,NULL),(19,26,3,NULL,NULL),(20,27,4,NULL,NULL),(21,28,4,NULL,NULL),(22,29,4,NULL,NULL),(23,30,4,NULL,NULL),(24,31,4,NULL,NULL),(25,32,4,NULL,NULL),(26,33,4,NULL,NULL),(27,34,4,NULL,NULL),(28,35,4,NULL,NULL),(29,36,4,NULL,NULL),(30,37,6,NULL,NULL),(31,38,6,NULL,NULL),(32,39,6,NULL,NULL),(33,40,6,NULL,NULL),(34,41,6,NULL,NULL),(35,42,6,NULL,NULL),(36,43,6,NULL,NULL),(37,44,6,NULL,NULL),(38,45,6,NULL,NULL),(39,46,7,NULL,NULL),(40,47,7,NULL,NULL),(41,48,7,NULL,NULL),(42,49,7,NULL,NULL),(43,50,7,NULL,NULL),(44,51,7,NULL,NULL),(45,52,7,NULL,NULL),(46,53,7,NULL,NULL),(47,54,7,NULL,NULL),(48,55,9,NULL,NULL),(49,56,9,NULL,NULL),(50,57,9,NULL,NULL),(51,58,9,NULL,NULL),(52,59,9,NULL,NULL),(53,60,9,NULL,NULL),(54,61,9,NULL,NULL),(55,62,9,NULL,NULL),(56,63,9,NULL,NULL),(57,64,9,NULL,NULL),(58,65,10,NULL,NULL),(59,66,10,NULL,NULL),(60,67,10,NULL,NULL),(61,68,10,NULL,NULL),(62,69,10,NULL,NULL),(63,70,10,NULL,NULL),(64,71,10,NULL,NULL),(65,72,10,NULL,NULL),(66,73,10,NULL,NULL),(67,74,10,NULL,NULL),(68,75,13,NULL,NULL),(69,76,13,NULL,NULL),(70,77,13,NULL,NULL),(71,78,13,NULL,NULL),(72,79,13,NULL,NULL),(73,80,13,NULL,NULL),(74,81,13,NULL,NULL),(75,82,13,NULL,NULL),(76,83,15,NULL,NULL),(77,84,15,NULL,NULL),(78,85,15,NULL,NULL),(79,86,15,NULL,NULL),(80,87,15,NULL,NULL),(81,88,15,NULL,NULL),(82,89,15,NULL,NULL);
/*!40000 ALTER TABLE `levels_units_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'SMHS','2023-08-12 08:20:31','2023-08-12 08:20:31'),(2,'KLAW','2023-08-12 08:53:11','2023-08-12 08:53:11'),(3,'ADMIN','2023-08-12 08:54:21','2023-08-12 08:54:21');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text DEFAULT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) NOT NULL,
  `secret` varchar(100) NOT NULL,
  `redirect` text NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `periods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `day_id` int(10) unsigned NOT NULL,
  `time` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `periods_day_id_foreign` (`day_id`),
  CONSTRAINT `periods_day_id_foreign` FOREIGN KEY (`day_id`) REFERENCES `timetable_days` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periods`
--

LOCK TABLES `periods` WRITE;
/*!40000 ALTER TABLE `periods` DISABLE KEYS */;
INSERT INTO `periods` VALUES (1,1,'07:00 - 09:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(2,1,'11:00 - 13:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(3,1,'09:00 - 11:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(4,1,'14:00 - 16:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(5,1,'16:00 - 18:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(6,2,'07:00 - 09:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(7,2,'09:00 - 11:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(8,2,'11:00 - 13:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(9,2,'14:00 - 16:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(10,2,'16:00 - 18:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(11,3,'07:00 - 09:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(12,3,'09:00 - 11:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(13,3,'14:00 - 16:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(14,3,'16:00 - 18:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(15,4,'07:00 - 09:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(16,4,'09:00 - 11:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(17,4,'11:00 - 13:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(18,4,'14:00 - 16:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(19,4,'16:00 - 18:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(20,5,'07:00 - 09:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(21,5,'09:00 - 11:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(22,5,'11:00 - 13:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(23,5,'14:00 - 16:00','2023-08-12 09:50:50','2023-08-12 09:50:50'),(24,5,'16:00 - 18:00','2023-08-12 09:50:50','2023-08-12 09:50:50');
/*!40000 ALTER TABLE `periods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
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
INSERT INTO `permissions` VALUES (1,'view','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(2,'edit','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(3,'add-users','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(4,'delete-users','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(5,'generate-timetable','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(6,'assign-lecturers','user','2023-08-12 08:18:53','2023-08-12 08:18:53');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `program_levels`
--

DROP TABLE IF EXISTS `program_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `program_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `program_id` int(10) unsigned NOT NULL,
  `department_ID` int(10) unsigned DEFAULT NULL,
  `semester_number` int(11) NOT NULL,
  `level` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `num_students` int(10) unsigned NOT NULL DEFAULT 0,
  `in_session` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `program_levels_program_id_foreign` (`program_id`),
  CONSTRAINT `program_levels_program_id_foreign` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_levels`
--

LOCK TABLES `program_levels` WRITE;
/*!40000 ALTER TABLE `program_levels` DISABLE KEYS */;
INSERT INTO `program_levels` VALUES (1,1,NULL,1,'Year 1 Semester 1','2023-08-12 08:23:34','2023-08-12 08:46:18',40,1),(2,1,NULL,2,'Year 1 Semester 2','2023-08-12 08:23:34','2023-08-12 08:46:43',0,0),(3,1,NULL,3,'Year 1 Semester 3','2023-08-12 08:23:34','2023-08-12 08:46:22',80,1),(4,1,NULL,4,'Year 2 Semester 1','2023-08-12 08:23:34','2023-08-12 08:46:26',40,1),(5,1,NULL,5,'Year 2 Semester 2','2023-08-12 08:23:34','2023-08-12 08:46:40',0,0),(6,1,NULL,6,'Year 2 Semester 3','2023-08-12 08:23:34','2023-08-12 08:46:39',80,1),(7,1,NULL,7,'Year 3 Semester 1','2023-08-12 08:23:34','2023-08-12 08:47:09',40,1),(8,1,NULL,8,'Year 3 Semester 2','2023-08-12 08:23:34','2023-08-12 08:47:11',0,0),(9,1,NULL,9,'Year 3 Semester 3','2023-08-12 08:23:34','2023-08-12 08:47:22',80,1),(10,1,NULL,10,'Year 4 Semester 1','2023-08-12 08:23:34','2023-08-12 08:48:52',40,1),(11,1,NULL,11,'Year 4 Semester 2','2023-08-12 08:23:34','2023-08-12 08:49:30',0,0),(12,1,NULL,12,'Year 4 Semester 3','2023-08-12 08:23:34','2023-08-12 08:49:28',0,0),(13,1,NULL,13,'Year 5 Semester 1','2023-08-12 08:23:34','2023-08-12 08:49:16',40,1),(14,1,NULL,14,'Year 5 Semester 2','2023-08-12 08:23:34','2023-08-12 08:49:27',0,0),(15,1,NULL,15,'Year 5 Semester 3','2023-08-12 08:23:34','2023-08-12 08:49:23',40,1);
/*!40000 ALTER TABLE `program_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `programs`
--

DROP TABLE IF EXISTS `programs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `programs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `semesters` int(11) NOT NULL,
  `years` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `program_code` varchar(191) DEFAULT NULL,
  `school_id` int(10) unsigned NOT NULL,
  `deparment_ID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (1,'Bachelor of Pharmacy',3,5,'2023-08-12 08:23:34','2023-08-12 08:23:34','PHAM',2,2);
/*!40000 ALTER TABLE `programs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
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
INSERT INTO `role_has_permissions` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(3,1),(4,1),(5,2),(6,3);
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `guard_name` varchar(191) NOT NULL,
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
INSERT INTO `roles` VALUES (1,'admin','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(2,'timetabler','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(3,'dean','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(4,'lecturer','user','2023-08-12 08:18:53','2023-08-12 08:18:53'),(5,'hods','user','2023-08-12 08:18:53','2023-08-12 08:18:53');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(10) unsigned NOT NULL,
  `room_code` varchar(191) NOT NULL,
  `type` varchar(191) NOT NULL,
  `lab_type_id` int(10) unsigned DEFAULT NULL,
  `capacity` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rooms_location_id_foreign` (`location_id`),
  KEY `rooms_lab_type_id_foreign` (`lab_type_id`),
  CONSTRAINT `rooms_lab_type_id_foreign` FOREIGN KEY (`lab_type_id`) REFERENCES `lab_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rooms_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (1,1,'GF L6','lecture',NULL,40,'2023-08-12 08:50:43','2023-08-12 08:50:43'),(2,1,'GF L7','lecture',NULL,40,'2023-08-12 08:51:01','2023-08-12 08:51:01'),(3,1,'GF L8','lecture',NULL,40,'2023-08-12 08:51:13','2023-08-12 08:51:13'),(4,1,'GF L9','lecture',NULL,40,'2023-08-12 08:51:27','2023-08-12 08:51:27'),(5,1,'GF L10','lecture',NULL,40,'2023-08-12 08:51:42','2023-08-12 08:51:42'),(6,1,'GF L11','lecture',NULL,40,'2023-08-12 08:52:02','2023-08-12 08:52:02'),(7,1,'GF L5','lecture',NULL,40,'2023-08-12 08:52:15','2023-08-12 08:52:15'),(8,1,'GF L4','lecture',NULL,40,'2023-08-12 08:52:31','2023-08-12 08:52:31'),(9,2,'KLAW 4','lecture',NULL,40,'2023-08-12 08:53:54','2023-08-12 08:53:54'),(10,3,'BBIT LR1','lecture',NULL,40,'2023-08-12 08:54:40','2023-08-12 08:54:40'),(11,1,'Anatomy Lab','lab',4,40,'2023-08-12 08:55:08','2023-08-12 08:55:08'),(12,1,'Biochemistry Lab','lab',1,40,'2023-08-12 08:55:29','2023-08-12 08:55:29'),(13,1,'Chemistry Lab','lab',2,40,'2023-08-12 08:55:49','2023-08-12 08:55:49'),(14,1,'Physiology Lab','lab',3,40,'2023-08-12 08:56:09','2023-08-12 08:56:09'),(15,1,'Microbiology Labs','lab',5,40,'2023-08-12 08:56:34','2023-08-12 08:56:34'),(16,1,'Pharmacognosy Lab','lab',6,40,'2023-08-12 08:57:00','2023-08-12 08:57:00'),(17,1,'Pathology Lab','lab',7,40,'2023-08-12 08:57:22','2023-08-12 08:57:22'),(19,1,'Pharmacology Labs','lab',10,40,'2023-08-12 08:58:21','2023-08-12 08:58:21'),(20,1,'Pharmaceutical Chemistry Labs','lab',8,40,'2023-08-12 08:58:44','2023-08-12 08:58:44'),(21,1,'Pharmaceutical Lab','lab',9,40,'2023-08-12 08:59:40','2023-08-12 08:59:40');
/*!40000 ALTER TABLE `rooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_location_pivot`
--

DROP TABLE IF EXISTS `school_location_pivot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_location_pivot` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `school_id` bigint(20) unsigned NOT NULL,
  `location_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `school_location_pivot_school_id_foreign` (`school_id`),
  KEY `school_location_pivot_location_id_foreign` (`location_id`),
  CONSTRAINT `school_location_pivot_location_id_foreign` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `school_location_pivot_school_id_foreign` FOREIGN KEY (`school_id`) REFERENCES `schools` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_location_pivot`
--

LOCK TABLES `school_location_pivot` WRITE;
/*!40000 ALTER TABLE `school_location_pivot` DISABLE KEYS */;
INSERT INTO `school_location_pivot` VALUES (1,2,1,NULL,NULL),(2,2,2,NULL,NULL),(3,2,3,NULL,NULL);
/*!40000 ALTER TABLE `school_location_pivot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schools`
--

DROP TABLE IF EXISTS `schools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schools` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
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
INSERT INTO `schools` VALUES (2,'SCHOOL OF PHARMACY','2023-08-12 08:19:55','2023-08-12 08:19:55');
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `period_id` int(10) unsigned NOT NULL,
  `unit_id` int(10) unsigned DEFAULT NULL,
  `lecture_id` int(10) unsigned DEFAULT NULL,
  `room_id` int(10) unsigned DEFAULT NULL,
  `group` varchar(191) DEFAULT NULL,
  `groups` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_room_id_foreign` (`room_id`),
  KEY `sessions_period_id_foreign` (`period_id`),
  CONSTRAINT `sessions_period_id_foreign` FOREIGN KEY (`period_id`) REFERENCES `periods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sessions_room_id_foreign` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=481 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,61,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(2,2,8,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(3,1,23,NULL,2,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(4,2,82,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(5,3,41,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(6,1,42,NULL,3,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(7,2,88,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(8,4,62,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(9,3,62,NULL,2,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(10,2,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(11,1,71,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(12,4,87,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(13,3,25,NULL,3,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(14,5,68,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(15,1,8,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(16,2,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(17,5,86,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(18,3,69,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(19,6,40,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(20,4,10,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(21,2,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(22,1,82,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(23,4,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(24,3,87,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(25,6,64,NULL,2,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(26,5,80,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(27,1,88,NULL,7,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(28,2,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(29,4,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(30,3,81,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(31,6,24,NULL,3,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(32,5,11,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(33,1,49,NULL,8,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(34,2,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(35,3,54,NULL,7,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(36,4,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(37,6,67,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(38,5,61,NULL,5,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(39,1,31,NULL,9,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(40,2,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(41,6,86,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(42,5,28,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(43,3,10,NULL,8,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(44,4,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(45,1,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(46,2,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(47,7,26,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(48,5,23,NULL,7,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(49,3,27,NULL,9,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(50,6,79,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(51,4,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(52,2,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(53,1,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(54,7,85,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(55,3,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(56,6,11,NULL,7,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(57,4,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(58,5,42,NULL,8,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(59,1,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(60,7,79,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(61,2,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(62,5,53,NULL,9,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(63,4,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(64,6,29,NULL,8,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(65,3,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(66,7,12,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(67,2,23,NULL,13,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(68,1,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(69,3,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(70,4,25,NULL,11,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(71,5,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(72,6,53,NULL,9,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(73,7,29,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(74,2,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(75,1,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(76,5,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(77,6,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(78,3,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(79,4,27,NULL,12,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(80,2,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(81,7,46,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(82,1,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(83,3,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(84,6,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(85,5,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(86,4,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(87,2,42,NULL,16,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(88,1,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(89,7,41,NULL,7,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(90,4,41,NULL,14,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(91,5,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(92,6,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(93,3,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(94,7,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(95,2,31,NULL,17,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(96,1,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(97,3,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(98,6,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(99,4,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(100,5,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(101,7,62,NULL,9,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(102,2,49,NULL,19,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(103,1,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(104,4,54,NULL,16,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(105,3,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(106,6,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(107,5,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(108,1,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(109,7,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(110,2,71,NULL,20,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(111,3,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(112,5,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(113,6,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(114,4,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(115,7,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(116,1,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(117,2,61,NULL,21,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(118,3,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(119,5,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(120,4,69,NULL,19,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(121,6,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(122,7,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(123,8,67,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(124,3,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(125,6,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(126,5,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(127,4,81,NULL,20,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(128,8,85,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(129,7,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(130,9,66,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(131,5,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(132,6,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(133,4,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(134,10,39,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(135,8,78,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(136,7,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(137,9,84,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(138,5,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(139,10,60,NULL,2,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(140,7,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(141,8,25,NULL,4,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(142,6,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(143,10,84,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(144,7,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(145,9,NULL,NULL,3,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(146,6,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(147,8,13,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(148,10,77,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(149,7,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(150,9,78,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(151,11,22,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:54'),(152,8,30,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(153,10,15,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(154,9,14,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(155,7,68,NULL,19,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(156,11,65,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(157,13,70,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(158,12,65,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(159,10,32,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(160,8,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(161,11,83,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(162,7,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(163,9,47,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(164,12,33,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(165,13,16,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(166,8,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(167,10,48,NULL,7,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(168,14,38,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(169,12,NULL,NULL,3,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(170,9,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(171,7,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(172,11,76,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(173,8,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(174,13,NULL,NULL,3,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(175,10,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(176,14,59,NULL,2,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(177,9,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(178,11,50,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(179,12,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(180,13,34,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(181,10,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(182,14,70,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(183,8,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(184,11,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(185,12,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(186,9,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(187,10,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(188,14,51,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(189,13,89,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(190,8,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(191,15,72,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(192,9,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(193,12,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(194,11,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(195,13,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(196,10,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(197,14,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(198,15,75,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(199,8,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(200,12,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(201,9,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(202,11,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(203,14,89,NULL,6,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(204,10,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(205,13,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(206,8,40,NULL,13,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(207,15,35,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(208,9,30,NULL,12,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(209,12,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(210,11,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(211,8,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(212,14,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(213,10,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(214,13,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(215,11,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(216,12,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(217,9,40,NULL,13,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(218,15,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(219,14,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(220,8,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(221,10,24,NULL,14,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(222,13,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(223,12,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(224,11,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(225,9,24,NULL,14,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(226,15,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(227,13,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(228,14,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(229,8,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(230,10,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(231,15,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(232,12,15,NULL,11,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(233,9,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(234,11,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(235,10,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(236,13,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(237,8,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(238,14,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(239,15,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(240,12,22,NULL,12,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:54'),(241,9,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(242,11,39,NULL,13,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(243,14,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(244,13,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(245,8,64,NULL,19,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(246,10,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(247,15,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(248,9,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(249,12,39,NULL,13,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(250,11,13,NULL,14,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(251,14,16,NULL,12,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(252,8,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(253,13,23,NULL,13,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(254,10,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(255,12,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(256,9,64,NULL,19,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(257,15,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(258,14,26,NULL,13,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(259,13,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(260,8,46,NULL,21,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(261,11,32,NULL,15,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:04'),(262,10,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(263,9,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(264,12,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(265,15,62,NULL,10,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(266,11,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(267,13,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(268,14,34,NULL,14,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(269,10,66,NULL,21,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(270,9,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(271,12,76,NULL,16,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(272,15,25,NULL,11,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(273,14,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(274,11,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(275,13,42,NULL,16,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(276,12,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(277,15,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(278,11,60,NULL,19,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(279,13,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(280,14,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(281,16,74,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(282,12,60,NULL,19,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(283,15,12,NULL,13,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(284,17,73,NULL,1,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(285,14,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(286,11,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(287,13,80,NULL,19,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(288,18,37,NULL,1,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(289,16,36,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(290,15,41,NULL,14,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(291,12,83,NULL,20,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(292,17,NULL,NULL,2,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(293,16,9,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(294,18,17,NULL,2,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:54'),(295,13,48,NULL,20,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(296,11,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(297,14,77,NULL,19,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(298,17,52,NULL,3,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(299,15,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(300,12,50,NULL,21,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(301,18,58,NULL,3,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(302,14,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(303,16,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(304,13,61,NULL,21,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(305,15,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(306,17,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(307,14,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(308,18,9,NULL,4,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(309,16,51,NULL,5,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(310,17,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(311,15,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(312,18,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(313,20,40,NULL,1,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(314,19,NULL,NULL,1,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(315,16,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(316,17,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(317,15,47,NULL,19,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(318,18,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(319,19,NULL,NULL,2,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(320,21,NULL,NULL,1,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(321,20,73,NULL,2,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(322,22,22,NULL,1,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:54'),(323,16,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(324,15,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(325,17,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(326,19,NULL,NULL,3,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(327,18,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(328,22,38,NULL,2,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(329,20,24,NULL,3,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(330,21,NULL,NULL,2,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(331,16,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(332,15,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(333,17,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(334,19,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(335,20,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(336,18,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(337,21,NULL,NULL,3,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(338,22,NULL,NULL,3,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(339,16,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(340,17,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(341,18,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(342,19,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(343,20,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(344,22,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(345,21,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(346,16,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(347,20,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(348,17,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(349,18,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(350,22,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(351,19,26,NULL,6,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(352,21,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(353,23,NULL,NULL,1,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(354,16,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(355,18,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(356,22,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(357,17,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(358,20,60,NULL,7,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(359,19,39,NULL,7,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(360,21,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(361,23,NULL,NULL,2,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(362,16,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(363,22,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(364,18,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(365,17,22,NULL,12,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:54'),(366,20,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(367,19,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(368,23,58,NULL,3,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(369,16,26,NULL,13,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(370,21,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(371,20,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(372,18,28,NULL,13,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(373,17,14,NULL,13,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(374,22,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(375,23,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(376,19,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(377,16,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(378,21,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(379,22,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(380,18,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(381,20,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(382,17,36,NULL,14,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(383,23,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(384,21,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(385,16,38,NULL,15,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(386,19,64,NULL,10,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(387,20,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(388,22,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(389,18,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(390,17,38,NULL,15,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(391,21,59,NULL,10,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(392,23,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(393,16,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(394,19,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(395,22,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(396,18,52,NULL,16,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(397,20,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(398,23,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(399,21,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(400,17,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(401,16,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(402,19,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(403,22,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(404,18,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(405,20,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(406,23,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(407,21,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(408,16,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(409,17,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(410,19,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(411,18,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(412,20,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(413,22,35,NULL,13,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(414,21,33,NULL,13,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:06'),(415,17,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(416,23,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(417,16,75,NULL,20,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:03'),(418,19,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(419,22,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(420,20,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(421,18,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(422,16,59,NULL,21,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(423,19,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(424,23,17,NULL,10,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:54'),(425,17,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(426,20,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(427,21,37,NULL,14,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(428,18,72,NULL,21,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(429,22,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(430,19,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(431,23,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(432,20,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(433,17,59,NULL,21,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(434,21,17,NULL,15,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:54'),(435,22,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(436,19,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(437,23,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(438,20,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(439,22,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(440,21,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(441,19,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(442,20,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(443,22,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(444,21,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(445,24,37,NULL,1,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(446,23,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(447,19,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(448,22,58,NULL,20,'A',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(449,21,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(450,20,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(451,24,NULL,NULL,2,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(452,23,37,NULL,14,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:53'),(453,19,74,NULL,21,'Non',1,'2023-08-12 09:50:50','2023-08-12 09:51:00'),(454,21,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(455,23,NULL,NULL,15,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(456,24,NULL,NULL,3,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(457,22,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(458,21,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(459,24,NULL,NULL,4,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(460,23,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(461,24,NULL,NULL,5,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(462,23,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(463,24,NULL,NULL,6,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(464,23,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(465,24,NULL,NULL,7,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(466,23,NULL,NULL,20,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(467,24,NULL,NULL,8,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(468,23,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(469,24,NULL,NULL,9,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(470,24,NULL,NULL,10,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(471,24,NULL,NULL,11,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(472,24,NULL,NULL,12,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(473,24,NULL,NULL,13,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(474,24,NULL,NULL,14,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(475,24,17,NULL,15,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:54'),(476,24,NULL,NULL,16,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(477,24,NULL,NULL,17,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(478,24,NULL,NULL,19,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(479,24,58,NULL,20,'B',2,'2023-08-12 09:50:50','2023-08-12 09:50:57'),(480,24,NULL,NULL,21,NULL,1,'2023-08-12 09:50:50','2023-08-12 09:50:50');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) NOT NULL,
  `last_name` varchar(191) NOT NULL,
  `Reg_No` varchar(191) NOT NULL,
  `program_id` int(10) unsigned NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_table_periods` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `day` varchar(191) NOT NULL,
  `time` varchar(191) NOT NULL,
  `unit` varchar(191) NOT NULL,
  `room` varchar(191) NOT NULL,
  `group` varchar(191) NOT NULL,
  `number_of_students` varchar(191) NOT NULL,
  `Programs` varchar(191) NOT NULL,
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetable_days` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `timetable_id` int(10) unsigned NOT NULL,
  `day` varchar(191) NOT NULL,
  `period_length` double(5,2) NOT NULL DEFAULT 3.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `timetable_days_timetable_id_foreign` (`timetable_id`),
  CONSTRAINT `timetable_days_timetable_id_foreign` FOREIGN KEY (`timetable_id`) REFERENCES `timetables` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable_days`
--

LOCK TABLES `timetable_days` WRITE;
/*!40000 ALTER TABLE `timetable_days` DISABLE KEYS */;
INSERT INTO `timetable_days` VALUES (1,1,'Monday',3.00,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(2,1,'Tuesday',3.00,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(3,1,'Wednesday',3.00,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(4,1,'Thursday',3.00,'2023-08-12 09:50:50','2023-08-12 09:50:50'),(5,1,'Friday',3.00,'2023-08-12 09:50:50','2023-08-12 09:50:50');
/*!40000 ALTER TABLE `timetable_days` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetables`
--

DROP TABLE IF EXISTS `timetables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `timetables` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `in_progress` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetables`
--

LOCK TABLES `timetables` WRITE;
/*!40000 ALTER TABLE `timetables` DISABLE KEYS */;
INSERT INTO `timetables` VALUES (1,'May-August Timetable','2023-08-12 09:50:50','2023-08-12 09:51:06',0);
/*!40000 ALTER TABLE `timetables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `units`
--

DROP TABLE IF EXISTS `units`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `units` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(191) NOT NULL,
  `name` varchar(191) NOT NULL,
  `lecture_hours` int(11) NOT NULL,
  `department_ID` int(11) NOT NULL,
  `lecturer_id` int(11) DEFAULT NULL,
  `lab_hours` int(11) NOT NULL,
  `lab_type_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `related_to` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_lab_type_id_foreign` (`lab_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (8,'COMP100','INTRODUCTION TO COMPUTERS',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(9,'COMS110','COMMUNICATION SKILLS',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(10,'SCPH1111','MATHEMATICS FOR PHARMACY I',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(11,'BIBL110','OLD TESTAMENT SURVEY',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(12,'SCPH1123','INORGANIC CHEMISTRY I',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(13,'SCPH1141','MEDICAL PHYSIOLOGY I',45,0,NULL,15,3,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(14,'SCPH1122','PHYSICAL CHEMISTRY I',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(15,'SCPH1151','HUMAN ANATOMY I',45,0,NULL,15,4,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(16,'SCPH1131','BIOCHEMISTRY I',45,0,NULL,15,1,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(17,'SCPH1351','MEDICAL MICROBIOLOGY I',45,0,NULL,15,5,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(18,'SCPH1346','MEDICAL PHYSIOLOGY VI (SENSORY SYSTEMS)',45,0,NULL,15,3,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(19,'SCPH1327','ORGANIC CHEMISTRY II',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(20,'SCPH1334','BIOCHEMISTRY IV (METABOLISM II)',45,0,NULL,15,1,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(21,'SCPH1313','MATHEMATICS FOR PHARMACY III (CALCULUS II)',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(22,'SCPH1335','BIOCHEMISTRY V (SPECIALIZED TISSUES)',45,0,NULL,15,1,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(23,'SCPH1328','PHYSICAL CHEMISTRY III',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(24,'SCPH1345','MEDICAL PHYSIOLOGY V (CVS)',45,0,NULL,15,3,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(25,'SCPH1353','HUMAN ANATOMY III',45,0,NULL,15,4,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(26,'SCPH1329','INORGANIC CHEMISTRY III',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(27,'SCPH2136','BIOCHEMISTRY VI',45,0,NULL,15,1,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(28,'SCPH2121','ORGANIC CHEMISTRY III',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(29,'SCPH2111','BIOSTATISTICS',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(30,'SCPH2137','BIOCHEMISTRY VII',45,0,NULL,15,1,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(31,'SCPH2161','HUMAN PATHOLOGY I',45,0,NULL,15,7,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(32,'SCPH2151','MEDICAL MICROBIOLOGY II',45,0,NULL,15,5,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(33,'SCPH2123','PHYSICAL CHEMISTRY IV',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(34,'SCPH2142','MEDICAL PHYSIOLOGY VIII',45,0,NULL,15,3,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(35,'SCPH2122','ORGANIC CHEMISTRY IV',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(36,'SCPH2141','MEDICAL PHYSIOLOGY VII',45,0,NULL,15,3,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(37,'SCPH2341','MEDICAL PHYSIOLOGY XI',45,0,NULL,15,3,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(38,'SCPH2352','MEDICAL MICROBIOLOGY V',45,0,NULL,15,5,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(39,'SCPH2361','HUMAN PATHOLOGY IV (CLINICAL CHEMISTRY)',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(40,'SCPH2321','ORGANIC CHEMISTRY VI',45,0,NULL,15,2,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(41,'SCPH2342','MEDICAL PHYSIOLOGY XII',45,0,NULL,15,3,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(42,'PHAM2364','PHARMACOGNOSY I',45,0,NULL,15,6,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(43,'PHAM2340','SOCIAL AND BEHAVIORAL PHARMACY I',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(44,'SCPH2351','MEDICAL MICROBIOLOGY IV (VIROLOGY)',45,0,NULL,15,5,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(45,'PHAM2353','PHARMACEUTICAL CHEMISTRY II',45,0,NULL,15,8,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(46,'PHAM3126','PHARMACEUTICS I',45,0,NULL,15,9,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(47,'PHAM3102','PHARMACOLOGY II',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(48,'PHAM3154','PHARMACEUTICAL CHEMISTRY III',45,0,NULL,15,8,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(49,'PHAM3101','PHARMACOLOGY I',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(50,'PHAM3127','PHARMACEUTICS II',45,0,NULL,15,9,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(51,'PHAM3171','TECHNICAL WRITING',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(52,'PHAM3165','PHARMACOGNOSY II',45,0,NULL,15,6,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(53,'PHAM3141','SOCIAL AND BEHAVIORAL PHARMACY II',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(54,'PHAM3166','PHARMACOGNOSY III',45,0,NULL,15,6,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(55,'PHAM3307','PHARMACOLOGY VII',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(56,'PHAM3357','PHARMACEUTICAL CHEMISTRY VI',45,0,NULL,15,8,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(57,'PHAM3368','PHARMACOGNOSY V',45,0,NULL,15,6,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(58,'PHAM3358','PHARMACEUTICAL CHEMISTRY VII',45,0,NULL,15,8,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(59,'PHAM3330','PHARMACEUTICS V (PHYSICAL PHARMACY)',45,0,NULL,15,9,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(60,'PHAM3306','PHARMACOLOGY VI (CVS PHARMACOLOGY)',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(61,'PHAM3331','PHARMACEUTICS VI (STERILIZATION AND DISINFECTION)',45,0,NULL,15,9,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(62,'PHAM3316','CLINICAL PHARMACY II',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(63,'PHAM3346','PHARMACY MANAGEMENT I',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(64,'PHAM3305','PHARMACOLOGY V (HYPNOTICS AND SEDATIVES)',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(65,'PHAM4172','BIOINFORMATICS',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(66,'PHAM4134','PHARMACEUTICS IX (DOSAGE FORMS)',45,0,NULL,15,9,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(67,'PHAM4147','PHARMACY MANAGEMENT II (ENTREPRENEURSHIP)',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(68,'PHAM4108','PHARMACOLOGY VII (GIT PHARMACOLOGY)',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(69,'PHAM4109','PHARMACOLOGY IX',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(70,'PHAM4118','CLINICAL PHARMACY IV',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(71,'PHAM4159','PHARMACEUTICAL CHEMISTRY VIII',45,0,NULL,15,8,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(72,'PHAM4133','PHARMACEUTICS VIII',45,0,NULL,15,9,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(73,'PHAM4117','CLINICAL PHARMACY III',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(74,'PHAM4132','PHARMACEUTICS VII',45,0,NULL,15,9,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(75,'PHAM5161','PHARMACEUTICAL CHEMISTRY X',45,0,NULL,15,8,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(76,'PHAM5170','PHARMACOGNOSY VII',45,0,NULL,15,6,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(77,'PHAM5111','PHARMACOLOGY XI',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(78,'PHAM5121','CLINICAL PHARMACY VII',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(79,'PHAM5122','CLINICAL PHARMACY VIII',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(80,'PHAM5112','PHARMACOLOGY XII',45,0,NULL,15,10,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(81,'PHAM5137','PHARMACEUTICS XII',45,0,NULL,15,8,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(82,'PHAM5149','PHARMACY MANAGEMENT IV',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(83,'PHAM5363','PHARMACEUTICAL CHEMISTRY XII',45,0,NULL,15,8,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(84,'PHAM5345','ENVIRONMENTAL AND OCCUPATIONAL HEALTH',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(85,'PHAM5339','PHARMACEUTICS XIV (NOVEL DRUG DELIVERY SYSTEMS)',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(86,'PHAM5314','PHARMACOLOGY XIV (TOXICOLOGY)',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(87,'PHAM5377','PHARMACY LAW 2',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(88,'PHAM5325','CLINICAL PHARMACY XI',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL),(89,'PHAM5351','PHARMACY MANAGEMENT VI',45,0,NULL,0,0,'2023-08-12 08:41:17','2023-08-12 08:41:17',NULL);
/*!40000 ALTER TABLE `units` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `role` varchar(191) NOT NULL DEFAULT '0',
  `avatar` varchar(191) NOT NULL DEFAULT 'default.jpg',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','injuguna@kabarak.ac.ke','1','default.jpg',NULL,'$2y$10$5SdXs9YnPGT0JWn6WCmK1ONjzO2xeJr/ufH.hNIOsjLg9EDwbNZO6',NULL,'2023-08-12 08:18:53','2023-08-12 08:18:53'),(2,'Timetabler','timetabler@mail.com','2','default.jpg',NULL,'$2y$10$8aWBNZY375.a9OOnz4Zy7OxLl0conIXf9UmQTJtHRUWz6IsH0l6ty',NULL,'2023-08-12 08:18:53','2023-08-12 08:18:53'),(3,'lecturer','lecturer@mail.com','4','default.jpg',NULL,'$2y$10$ZjK24TCOtZEJfJPQuzBh6eMnpY/tfzRoaGgOha80F8cp4GxVhhWxO',NULL,'2023-08-12 08:18:53','2023-08-12 08:18:53'),(4,'hod','hod@mail.com','4','default.jpg',NULL,'$2y$10$wg4OFVewuWJ7PbShNImuXukVmgLB0F/vHcMoVwgGfmM32B.3HbKjG',NULL,'2023-08-12 08:18:53','2023-08-12 08:18:53');
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

-- Dump completed on 2023-08-12 14:32:10
