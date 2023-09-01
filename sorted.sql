-- MariaDB dump 10.19  Distrib 10.6.12-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pharm
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) NOT NULL,
  `school_ID` varchar(191) NOT NULL,
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
INSERT INTO `departments` VALUES (2,'Pharmaceuticals and Pharmaceutics','2','2023-07-13 14:36:16','2023-07-13 14:36:16'),(3,'Pharmacology and Pharmacognosy','2','2023-07-13 14:36:35','2023-07-13 14:36:35'),(4,'Pre-Clinical Chemistry','2','2023-07-13 14:36:50','2023-07-13 14:36:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=941 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generated_documents`
--

LOCK TABLES `generated_documents` WRITE;
/*!40000 ALTER TABLE `generated_documents` DISABLE KEYS */;
INSERT INTO `generated_documents` VALUES (56,2,2,'May-August Timetable','3ec83fc54f35998dc3908feb7933b394.pdf',1,'2023-08-01 09:56:17','2023-08-01 09:56:17'),(57,2,2,'May-August Timetable','2b674af14e05af911cf27870bd6159f5.pdf',1,'2023-08-01 10:35:19','2023-08-01 10:35:19'),(58,2,2,'May-August Timetable','6e432dd9820f85a10c0e30890a692d96.pdf',1,'2023-08-01 10:43:41','2023-08-01 10:43:41');
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
INSERT INTO `lab_types` VALUES (1,'Biochemistry Labs','2023-07-13 12:06:59','2023-07-13 12:06:59'),(2,'Chemistry Labs','2023-07-13 12:07:15','2023-07-13 12:07:15'),(3,'Physiology Labs','2023-07-13 12:08:12','2023-07-13 12:08:12'),(4,'Anatomy Labs','2023-07-13 12:08:32','2023-07-13 12:08:32'),(5,'Microbiology Labs','2023-07-13 12:09:34','2023-07-13 12:09:34'),(6,'Pharmacognosy Labs','2023-07-13 12:13:08','2023-07-13 12:13:08'),(7,'Pathology Labs','2023-07-13 12:13:21','2023-07-13 12:13:21'),(8,'Pharmaceutical Chemistry Labs','2023-07-13 12:14:42','2023-07-13 12:14:42'),(9,'Pharmaceutics Labs','2023-07-13 12:15:57','2023-07-13 12:15:57'),(10,'Pharmacology Labs','2023-07-27 18:36:26','2023-07-27 18:36:26');
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
INSERT INTO `lectures` VALUES (3,'Mr.','Mulinge',2,'1','mulinge@gmail.com',NULL,'',NULL,'2023-07-13 15:06:11','2023-07-27 11:20:27'),(4,'Mr.','Bundotich',2,'0','bundotich@gmail.com',NULL,'',NULL,'2023-07-13 15:06:59','2023-07-27 11:20:27'),(5,'Rev.','Rotich',2,'0','rotich@gmail.com',NULL,'',NULL,'2023-07-13 15:07:50','2023-07-27 11:20:27'),(6,'Ms.','Murithi',2,'0','murithi@gmail.com',NULL,'',NULL,'2023-07-13 15:15:25','2023-07-27 11:20:27'),(8,'Dr.','Akumu,',4,'1','akumu@gmail.com',NULL,'',NULL,'2023-07-13 15:17:39','2023-08-01 20:22:41'),(9,'Dr.','Rose',4,'0','rose@gmail.com',NULL,'',NULL,'2023-07-13 15:19:48','2023-08-01 20:22:41'),(10,'Dr.','Chepkirui',4,'0','kirui@gmail.com',NULL,'',NULL,'2023-07-13 15:20:50','2023-08-01 20:22:41'),(11,'Mr.','Rono',4,'0','rono@gmail.com',NULL,'',NULL,'2023-07-13 15:25:57','2023-08-01 20:22:41'),(12,'Ms.','Kerubo',4,'0','kerubo@gmail.com',NULL,'',NULL,'2023-07-13 15:26:52','2023-08-01 20:22:41'),(13,'Dr.','Nahashon',4,'0','Nahashon@gmail.com',NULL,'',NULL,'2023-07-13 15:27:24','2023-08-01 20:22:41'),(14,'Mr.','Micah',4,'0','Micah@gmail.com',NULL,'',NULL,'2023-07-13 15:30:47','2023-08-01 20:22:41'),(15,'Dr.','Kebenei',4,'0','Kebenei@gmail.com',NULL,'',NULL,'2023-07-13 15:38:36','2023-08-01 20:22:41'),(16,'Dr.','Wairimu',4,'0','Wairimu@gmail.com',NULL,'',NULL,'2023-07-13 15:39:22','2023-08-01 20:22:41'),(17,'Mr.','Charles',4,'0','Charles@gmail.com',NULL,'',NULL,'2023-07-13 15:45:00','2023-08-01 20:22:41'),(18,'Dr.','Walekhwa',4,'0','Walekhwa@gmail.com',NULL,'',NULL,'2023-07-13 15:45:39','2023-08-01 20:22:41'),(19,'Dr.','Tonui',4,'0','Tonui@gmail.com',NULL,'',NULL,'2023-07-13 15:46:06','2023-08-01 20:22:41'),(21,'Dr.','Chebon',4,'0','Chebon@gmail.com',NULL,'',NULL,'2023-07-13 15:47:41','2023-08-01 20:22:41'),(22,'Dr.','Keter',4,'0','Keter@gmail.com',NULL,'',NULL,'2023-07-13 15:48:23','2023-08-01 20:22:41'),(23,'Ms.','Elizabeth',3,'0','Elizabeth@gmail.com',NULL,'',NULL,'2023-07-13 15:49:07','2023-07-27 10:56:47'),(24,'Ms.','Emily Nyangena',2,'0','Nyangena@gmail.com',NULL,'',NULL,'2023-07-13 15:51:25','2023-07-27 11:20:27'),(25,'Dr.','Vugigi',2,'0','Vugigi@gmail.com',NULL,'',NULL,'2023-07-13 15:52:23','2023-07-27 11:20:27'),(26,'Dr.','Kagia',3,'0','Kagia@gmail.com',NULL,'',NULL,'2023-07-13 15:52:49','2023-07-27 10:56:47'),(27,'Dr.','Jediel',2,'0','Jediel@gmail.com',NULL,'',NULL,'2023-07-13 15:53:22','2023-07-27 11:20:27'),(28,'Dr.','Jim',3,'0','Jim@gmail.com',NULL,'',NULL,'2023-07-13 15:53:49','2023-07-27 10:56:47'),(29,'Dr.','Nyandoro',2,'0','Nyandoro@gmail.com',NULL,'',NULL,'2023-07-13 15:54:24','2023-07-27 11:20:27'),(30,'Mrs.','Somba',4,'0','Somba@gmail.com',NULL,'',NULL,'2023-07-13 15:55:01','2023-08-01 20:22:41'),(31,'Mr.','Kandagor',2,'0','Kandagor,@gmail.com',NULL,'',NULL,'2023-07-13 15:55:56','2023-07-27 11:20:27'),(32,'Dr.','Meroka',3,'1','Meroka@gmail.com',NULL,'',NULL,'2023-07-13 15:57:03','2023-07-27 10:56:47'),(33,'Dr.','Janet',3,'0','Janet@gmail.com',NULL,'',NULL,'2023-07-13 15:57:30','2023-07-27 10:56:47'),(34,'Dr.','Ndubi',2,'0','Ndubi@gmail.com',NULL,'',NULL,'2023-07-13 15:58:10','2023-07-27 11:20:27'),(35,'Dr.','Balongo,',2,'0','Balongo,@gmail.com',NULL,'',NULL,'2023-07-13 15:59:14','2023-07-27 11:20:27'),(36,'Dr.','Nelius',2,'0','Nelius@gmail.com',NULL,'',NULL,'2023-07-13 16:01:04','2023-07-27 11:20:27'),(37,'Dr.','Obat',2,'0','Obat@gmail.com',NULL,'',NULL,'2023-07-13 16:01:43','2023-07-27 11:20:27'),(39,'Ms.','Wakuraya',2,'0','Wakuraya@gmail.com',NULL,'',NULL,'2023-07-13 16:03:31','2023-07-27 11:20:27'),(40,'Ms.','Murugi',4,'0','Murugi@gmail.com',NULL,'',NULL,'2023-07-13 16:58:36','2023-08-01 20:22:41'),(41,'Mrs.','Kurui',2,'0','Kurui@gmail.com',NULL,'',NULL,'2023-07-13 18:02:13','2023-07-27 11:20:27'),(42,'Dr.','Saruni',4,'0','saruni@gmail.com',NULL,'',NULL,'2023-07-26 15:53:48','2023-08-01 20:22:41'),(54,'Dr.','Rotich',2,'0','drrotich@gmail.com',NULL,'',NULL,'2023-08-01 08:50:04','2023-08-01 08:50:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels_units_pivot`
--

LOCK TABLES `levels_units_pivot` WRITE;
/*!40000 ALTER TABLE `levels_units_pivot` DISABLE KEYS */;
INSERT INTO `levels_units_pivot` VALUES (161,156,16,NULL,NULL),(162,157,16,NULL,NULL),(163,158,16,NULL,NULL),(164,159,16,NULL,NULL),(165,161,16,NULL,NULL),(166,162,16,NULL,NULL),(167,163,16,NULL,NULL),(168,164,16,NULL,NULL),(169,165,16,NULL,NULL),(170,166,18,NULL,NULL),(171,167,18,NULL,NULL),(172,168,18,NULL,NULL),(173,169,18,NULL,NULL),(174,170,18,NULL,NULL),(175,171,18,NULL,NULL),(176,173,18,NULL,NULL),(177,174,18,NULL,NULL),(178,175,18,NULL,NULL),(179,176,18,NULL,NULL),(180,177,19,NULL,NULL),(181,178,19,NULL,NULL),(182,179,19,NULL,NULL),(183,180,19,NULL,NULL),(184,181,19,NULL,NULL),(185,182,19,NULL,NULL),(186,183,19,NULL,NULL),(187,184,19,NULL,NULL),(188,185,19,NULL,NULL),(189,186,19,NULL,NULL),(190,187,21,NULL,NULL),(191,188,21,NULL,NULL),(192,189,21,NULL,NULL),(193,190,21,NULL,NULL),(194,191,21,NULL,NULL),(195,192,21,NULL,NULL),(196,193,21,NULL,NULL),(197,194,21,NULL,NULL),(198,195,21,NULL,NULL),(199,196,22,NULL,NULL),(200,197,22,NULL,NULL),(201,198,22,NULL,NULL),(202,199,22,NULL,NULL),(203,200,22,NULL,NULL),(204,201,22,NULL,NULL),(205,202,22,NULL,NULL),(206,203,22,NULL,NULL),(207,204,22,NULL,NULL),(208,205,24,NULL,NULL),(209,206,24,NULL,NULL),(210,207,24,NULL,NULL),(211,208,24,NULL,NULL),(212,209,24,NULL,NULL),(213,210,24,NULL,NULL),(214,211,24,NULL,NULL),(215,212,24,NULL,NULL),(216,213,24,NULL,NULL),(217,214,24,NULL,NULL),(218,215,25,NULL,NULL),(219,216,25,NULL,NULL),(220,217,25,NULL,NULL),(221,218,25,NULL,NULL),(222,219,25,NULL,NULL),(223,220,25,NULL,NULL),(224,221,25,NULL,NULL),(225,222,25,NULL,NULL),(226,223,25,NULL,NULL),(227,224,25,NULL,NULL),(228,225,28,NULL,NULL),(229,226,28,NULL,NULL),(230,227,28,NULL,NULL),(231,228,28,NULL,NULL),(232,229,28,NULL,NULL),(233,230,28,NULL,NULL),(234,231,28,NULL,NULL),(235,232,28,NULL,NULL),(236,233,30,NULL,NULL),(237,234,30,NULL,NULL),(238,235,30,NULL,NULL),(239,236,30,NULL,NULL),(240,237,30,NULL,NULL),(241,238,30,NULL,NULL),(242,239,30,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'School of Pharmacy','2023-07-13 12:00:22','2023-07-13 12:00:22');
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
INSERT INTO `periods` VALUES (1,1,'07:00 - 09:00','2023-08-01 10:43:21','2023-08-01 10:43:21'),(2,1,'09:00 - 11:00','2023-08-01 10:43:21','2023-08-01 10:43:21'),(3,1,'11:00 - 13:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(4,1,'14:00 - 16:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(5,1,'16:00 - 18:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(6,2,'07:00 - 09:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(7,2,'09:00 - 11:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(8,2,'11:00 - 13:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(9,2,'14:00 - 16:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(10,2,'16:00 - 18:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(11,3,'07:00 - 09:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(12,3,'09:00 - 11:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(13,3,'14:00 - 16:00','2023-08-01 10:43:22','2023-08-01 10:43:22'),(14,3,'16:00 - 18:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(15,4,'07:00 - 09:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(16,4,'09:00 - 11:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(17,4,'11:00 - 13:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(18,4,'14:00 - 16:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(19,4,'16:00 - 18:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(20,5,'07:00 - 09:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(21,5,'09:00 - 11:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(22,5,'11:00 - 13:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(23,5,'14:00 - 16:00','2023-08-01 10:43:23','2023-08-01 10:43:23'),(24,5,'16:00 - 18:00','2023-08-01 10:43:23','2023-08-01 10:43:23');
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
INSERT INTO `permissions` VALUES (1,'view','user','2023-07-13 11:08:43','2023-07-13 11:08:43'),(2,'edit','user','2023-07-13 11:08:43','2023-07-13 11:08:43'),(3,'add-users','user','2023-07-13 11:08:43','2023-07-13 11:08:43'),(4,'delete-users','user','2023-07-13 11:08:43','2023-07-13 11:08:43'),(5,'generate-timetable','user','2023-07-13 11:08:44','2023-07-13 11:08:44'),(6,'assign-lecturers','user','2023-07-13 11:08:44','2023-07-13 11:08:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `program_levels`
--

LOCK TABLES `program_levels` WRITE;
/*!40000 ALTER TABLE `program_levels` DISABLE KEYS */;
INSERT INTO `program_levels` VALUES (16,2,NULL,1,'Year 1 Semester 1','2023-07-13 15:01:33','2023-07-27 12:40:00',40,1),(17,2,NULL,2,'Year 1 Semester 2','2023-07-13 15:01:33','2023-07-27 12:40:12',0,0),(18,2,NULL,3,'Year 1 Semester 3','2023-07-13 15:01:33','2023-07-27 13:05:47',75,1),(19,2,NULL,4,'Year 2 Semester 1','2023-07-13 15:01:33','2023-07-27 12:40:39',40,1),(20,2,NULL,5,'Year 2 Semester 2','2023-07-13 15:01:33','2023-07-27 12:40:43',0,0),(21,2,NULL,6,'Year 2 Semester 3','2023-07-13 15:01:33','2023-07-26 15:46:02',80,1),(22,2,NULL,7,'Year 3 Semester 1','2023-07-13 15:01:33','2023-07-27 12:41:13',40,1),(23,2,NULL,8,'Year 3 Semester 2','2023-07-13 15:01:33','2023-07-27 12:41:15',0,0),(24,2,NULL,9,'Year 3 Semester 3','2023-07-13 15:01:33','2023-07-26 15:46:13',80,1),(25,2,NULL,10,'Year 4 Semester 1','2023-07-13 15:01:33','2023-07-27 12:41:36',40,1),(26,2,NULL,11,'Year 4 Semester 2','2023-07-13 15:01:33','2023-07-13 18:08:22',0,0),(27,2,NULL,12,'Year 4 Semester 3','2023-07-13 15:01:33','2023-07-13 18:08:23',0,0),(28,2,NULL,13,'Year 5 Semester 1','2023-07-13 15:01:33','2023-07-27 12:41:53',40,1),(29,2,NULL,14,'Year 5 Semester 2','2023-07-13 15:01:33','2023-07-27 12:42:03',0,0),(30,2,NULL,15,'Year 5 Semester 3','2023-07-13 15:01:33','2023-07-27 12:42:07',40,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `programs`
--

LOCK TABLES `programs` WRITE;
/*!40000 ALTER TABLE `programs` DISABLE KEYS */;
INSERT INTO `programs` VALUES (2,'Bachelor of Pharmacy',3,5,'2023-07-13 15:01:33','2023-07-13 15:01:33','PHAM',2,0);
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
INSERT INTO `roles` VALUES (1,'admin','user','2023-07-13 11:08:44','2023-07-13 11:08:44'),(2,'timetabler','user','2023-07-13 11:08:44','2023-07-13 11:08:44'),(3,'dean','user','2023-07-13 11:08:44','2023-07-13 11:08:44'),(4,'lecturer','user','2023-07-13 11:08:44','2023-07-13 11:08:44'),(5,'hods','user','2023-07-13 11:08:44','2023-07-13 11:08:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rooms`
--

LOCK TABLES `rooms` WRITE;
/*!40000 ALTER TABLE `rooms` DISABLE KEYS */;
INSERT INTO `rooms` VALUES (3,1,'GF L6','lecture',NULL,40,'2023-07-13 14:29:19','2023-07-13 14:29:19'),(4,1,'GF L7','lecture',NULL,40,'2023-07-13 14:29:50','2023-07-13 14:29:50'),(5,1,'GF L8','lecture',NULL,40,'2023-07-13 14:30:28','2023-07-13 14:30:28'),(6,1,'GF L9','lecture',NULL,40,'2023-07-13 14:30:42','2023-07-13 14:30:42'),(7,1,'GF L10','lecture',NULL,40,'2023-07-13 14:31:39','2023-07-13 14:31:39'),(8,1,'GF L11','lecture',NULL,40,'2023-07-13 14:32:05','2023-07-13 14:32:05'),(9,1,'GF L5','lecture',NULL,40,'2023-07-13 14:32:40','2023-07-13 14:32:40'),(10,1,'GF L4','lecture',NULL,40,'2023-07-13 14:32:56','2023-07-13 14:32:56'),(11,1,'ADMIN BBIT LR1','lecture',NULL,40,'2023-07-26 15:48:54','2023-07-26 15:48:54'),(12,1,'KLAW 4','lecture',NULL,40,'2023-07-26 15:49:26','2023-07-26 15:49:26'),(13,1,'Klaw 5','lecture',NULL,40,'2023-07-27 11:58:36','2023-07-27 11:58:36'),(14,1,'Hall 1','lecture',NULL,40,'2023-07-27 13:26:03','2023-07-27 13:26:03'),(15,1,'Hall C','lecture',NULL,40,'2023-07-27 13:26:42','2023-07-27 13:26:42'),(16,1,'Hall D','lecture',NULL,40,'2023-07-27 13:26:53','2023-07-27 13:26:53'),(17,1,'Hall 2','lecture',NULL,40,'2023-07-27 13:27:06','2023-07-27 13:27:06'),(19,1,'Anatomy Lab','lab',4,40,'2023-07-27 17:53:22','2023-07-27 17:53:22'),(20,1,'Biochemistry Lab','lab',1,40,'2023-07-27 18:20:17','2023-07-27 18:20:17'),(21,1,'Chemistry Lab','lab',2,40,'2023-07-27 18:20:47','2023-07-27 18:20:47'),(22,1,'Physiology Lab','lab',3,40,'2023-07-27 18:21:12','2023-07-27 18:21:12'),(23,1,'Microbiology Labs','lab',5,40,'2023-07-27 18:21:49','2023-07-27 18:21:49'),(24,1,'Pharmacognosy Lab','lab',6,40,'2023-07-27 18:22:17','2023-07-27 18:22:17'),(25,1,'Pathology Lab','lab',7,40,'2023-07-27 18:22:50','2023-08-01 11:15:40'),(26,1,'Pharmaceutical Lab','lab',9,40,'2023-07-27 18:23:16','2023-07-27 18:23:16'),(28,1,'Pharmacology Labs','lab',10,40,'2023-07-27 18:36:46','2023-07-27 18:36:46'),(29,1,'Pharmaceutical Chemistry Labs','lab',8,40,'2023-08-01 09:05:34','2023-08-01 09:05:34');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_location_pivot`
--

LOCK TABLES `school_location_pivot` WRITE;
/*!40000 ALTER TABLE `school_location_pivot` DISABLE KEYS */;
INSERT INTO `school_location_pivot` VALUES (1,2,1,NULL,NULL);
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
INSERT INTO `schools` VALUES (2,'SCHOOL OF PHARMACY','2023-07-13 14:34:57','2023-07-13 14:34:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (1,1,211,29,3,'A',2,'2023-08-01 10:43:21','2023-08-01 11:23:58'),(2,1,194,19,4,'A',2,'2023-08-01 10:43:21','2023-08-01 20:36:02'),(3,1,169,6,5,'A',2,'2023-08-01 10:43:21','2023-08-01 11:39:47'),(4,1,218,28,6,'Non',1,'2023-08-01 10:43:21','2023-08-01 12:02:10'),(5,1,156,42,7,'Non',1,'2023-08-01 10:43:21','2023-08-01 12:09:08'),(6,1,232,21,8,'Non',1,'2023-08-01 10:43:21','2023-08-01 20:35:11'),(7,2,237,39,3,'Non',1,'2023-08-01 10:43:21','2023-08-01 10:52:44'),(8,1,238,36,9,'Non',1,'2023-08-01 10:43:21','2023-08-01 20:58:11'),(9,2,231,37,4,'Non',1,'2023-08-01 10:43:21','2023-08-01 10:54:02'),(10,1,NULL,NULL,10,NULL,1,'2023-08-01 10:43:21','2023-08-01 12:01:53'),(11,2,204,23,5,'Non',1,'2023-08-01 10:43:21','2023-08-01 11:49:59'),(12,1,181,18,11,'Non',1,'2023-08-01 10:43:21','2023-08-01 20:36:51'),(13,2,158,4,6,'Non',1,'2023-08-01 10:43:21','2023-08-01 11:41:44'),(14,1,NULL,NULL,12,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(15,2,NULL,NULL,7,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(16,1,NULL,NULL,13,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(17,2,NULL,NULL,8,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(18,1,NULL,NULL,14,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(19,2,NULL,NULL,9,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(20,1,NULL,NULL,15,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(21,2,NULL,NULL,10,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(22,1,NULL,NULL,16,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(23,2,NULL,NULL,11,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(24,1,NULL,NULL,17,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(25,2,NULL,NULL,12,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(26,1,NULL,NULL,19,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(27,2,NULL,NULL,13,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(28,1,NULL,NULL,20,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(29,2,NULL,NULL,14,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(30,1,NULL,NULL,21,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(31,2,NULL,NULL,15,NULL,1,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(32,1,NULL,NULL,22,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(33,2,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(34,1,NULL,NULL,23,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(35,2,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(36,1,NULL,NULL,24,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(37,2,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(38,1,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(39,2,169,6,20,'A',2,'2023-08-01 10:43:22','2023-08-01 11:39:54'),(40,1,NULL,NULL,26,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(41,2,NULL,NULL,21,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(42,1,NULL,NULL,28,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(43,2,NULL,NULL,22,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(44,1,NULL,NULL,29,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(45,2,194,19,23,'A',2,'2023-08-01 10:43:22','2023-08-01 20:36:08'),(46,2,NULL,NULL,24,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(47,3,192,23,3,'A',2,'2023-08-01 10:43:22','2023-08-01 11:48:49'),(48,2,181,18,25,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:36:58'),(49,3,212,16,4,'A',2,'2023-08-01 10:43:22','2023-08-01 20:38:38'),(50,2,211,29,26,'A',2,'2023-08-01 10:43:22','2023-08-01 11:24:05'),(51,3,170,4,5,'A',2,'2023-08-01 10:43:22','2023-08-01 11:41:56'),(52,2,218,28,28,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:59:02'),(53,3,217,35,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 10:55:59'),(54,2,NULL,NULL,29,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(55,3,211,29,7,'B',1,'2023-08-01 10:43:22','2023-08-01 11:31:05'),(56,3,236,32,8,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:04:54'),(57,3,159,5,9,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:41:02'),(58,3,177,14,10,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:42:20'),(59,3,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(60,3,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(61,4,220,36,3,'Non',1,'2023-08-01 10:43:22','2023-08-01 10:55:03'),(62,3,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(63,4,235,29,4,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:31:24'),(64,3,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(65,4,230,28,5,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:02:29'),(66,3,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(67,4,161,8,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:09:48'),(68,3,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(69,3,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(70,4,178,15,7,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:41:10'),(71,3,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(72,4,NULL,NULL,8,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(73,3,NULL,NULL,20,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(74,4,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(75,3,NULL,NULL,21,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(76,4,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(77,3,NULL,NULL,22,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(78,4,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(79,3,NULL,NULL,23,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(80,4,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(81,3,NULL,NULL,24,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(82,4,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(83,3,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(84,4,NULL,NULL,14,NULL,2,'2023-08-01 10:43:22','2023-08-01 11:31:05'),(85,3,NULL,NULL,26,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(86,4,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(87,3,199,28,28,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:56:55'),(88,4,194,19,16,'B',2,'2023-08-01 10:43:22','2023-08-01 20:36:14'),(89,3,231,37,29,'Non',1,'2023-08-01 10:43:22','2023-08-01 10:54:14'),(90,4,169,6,17,'B',2,'2023-08-01 10:43:22','2023-08-01 11:40:02'),(91,4,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(92,4,NULL,NULL,20,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(93,5,214,28,3,'A',2,'2023-08-01 10:43:22','2023-08-01 11:57:20'),(94,4,NULL,NULL,21,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(95,5,166,12,4,'A',2,'2023-08-01 10:43:22','2023-08-01 20:45:44'),(96,4,NULL,NULL,22,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(97,5,221,34,5,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:06:01'),(98,4,NULL,NULL,23,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(99,5,234,41,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 10:52:18'),(100,4,204,23,24,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:50:09'),(101,5,229,16,7,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:39:31'),(102,4,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(103,5,203,31,8,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:22:39'),(104,4,NULL,NULL,26,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(105,5,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(106,4,NULL,NULL,28,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(107,5,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(108,4,221,34,29,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:19:51'),(109,5,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(110,5,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(111,5,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(112,6,191,22,3,'A',2,'2023-08-01 10:43:22','2023-08-01 20:33:11'),(113,5,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(114,6,233,34,4,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:20:07'),(115,5,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(116,6,228,16,5,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:39:10'),(117,5,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(118,6,162,9,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:11:05'),(119,5,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(120,6,196,25,7,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:36:14'),(121,5,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(122,6,NULL,NULL,8,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(123,5,177,14,20,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:42:26'),(124,6,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(125,5,161,8,21,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:09:54'),(126,6,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(127,5,NULL,NULL,22,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(128,6,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(129,5,NULL,NULL,23,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(130,6,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(131,5,192,23,24,'A',2,'2023-08-01 10:43:22','2023-08-01 11:48:57'),(132,6,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(133,5,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(134,6,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(135,5,NULL,NULL,26,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(136,6,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(137,5,NULL,NULL,28,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(138,6,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(139,5,NULL,NULL,29,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(140,6,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(141,6,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(142,6,NULL,NULL,20,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(143,7,216,25,3,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:37:21'),(144,6,178,15,21,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:41:17'),(145,7,179,17,4,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:37:29'),(146,6,NULL,NULL,22,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(147,7,192,23,5,'B',2,'2023-08-01 10:43:22','2023-08-01 11:49:06'),(148,6,166,12,23,'A',2,'2023-08-01 10:43:22','2023-08-01 20:45:51'),(149,7,197,26,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:51:02'),(150,6,NULL,NULL,24,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(151,7,212,16,7,'B',2,'2023-08-01 10:43:22','2023-08-01 20:38:47'),(152,6,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(153,7,210,26,8,'A',1,'2023-08-01 10:43:22','2023-08-01 11:55:43'),(154,6,NULL,NULL,26,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(155,7,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(156,6,214,28,28,'A',2,'2023-08-01 10:43:22','2023-08-01 11:57:26'),(157,7,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(158,6,NULL,NULL,29,NULL,1,'2023-08-01 10:43:22','2023-08-01 11:19:51'),(159,7,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(160,7,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(161,7,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(162,8,176,10,3,'A',2,'2023-08-01 10:43:22','2023-08-01 20:53:34'),(163,7,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(164,8,227,32,4,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:04:20'),(165,7,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(166,8,NULL,NULL,5,NULL,1,'2023-08-01 10:43:22','2023-08-01 20:52:32'),(167,7,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(168,8,180,14,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:42:42'),(169,7,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(170,8,198,27,7,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:32:58'),(171,7,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(172,8,239,31,8,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:22:54'),(173,7,NULL,NULL,20,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(174,8,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(175,7,NULL,NULL,21,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(176,8,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(177,7,162,9,22,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:11:12'),(178,8,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(179,7,166,12,23,'B',2,'2023-08-01 10:43:22','2023-08-01 20:45:58'),(180,8,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(181,7,NULL,NULL,24,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(182,8,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(183,7,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(184,8,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(185,7,NULL,NULL,26,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(186,8,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(187,7,230,28,28,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:02:36'),(188,8,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(189,7,233,34,29,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:09:30'),(190,8,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(191,8,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(192,8,NULL,NULL,20,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(193,9,NULL,NULL,3,NULL,2,'2023-08-01 10:43:22','2023-08-01 11:55:43'),(194,8,NULL,NULL,21,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(195,9,215,26,4,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:56:00'),(196,8,191,22,22,'A',2,'2023-08-01 10:43:22','2023-08-01 20:33:19'),(197,9,226,33,5,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:05:58'),(198,8,NULL,NULL,23,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(199,9,164,11,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:47:45'),(200,8,NULL,NULL,24,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(201,9,NULL,NULL,7,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(202,8,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(203,9,NULL,NULL,8,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(204,8,216,25,26,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:37:27'),(205,9,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(206,8,214,28,28,'B',2,'2023-08-01 10:43:22','2023-08-01 11:57:34'),(207,9,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(208,8,NULL,NULL,29,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(209,9,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(210,9,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(211,9,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(212,10,190,8,3,'A',2,'2023-08-01 10:43:22','2023-08-01 12:10:08'),(213,9,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(214,10,167,13,4,'A',2,'2023-08-01 10:43:22','2023-08-01 20:43:36'),(215,9,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(216,10,219,32,5,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:03:59'),(217,9,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(218,10,182,19,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:35:42'),(219,9,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(220,10,NULL,NULL,7,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(221,9,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(222,10,NULL,NULL,8,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(223,10,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(224,9,180,14,20,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:42:50'),(225,10,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(226,9,176,10,21,'A',2,'2023-08-01 10:43:22','2023-08-01 12:12:38'),(227,10,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(228,9,191,22,22,'B',2,'2023-08-01 10:43:22','2023-08-01 20:33:27'),(229,10,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(230,9,NULL,NULL,23,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(231,10,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(232,9,NULL,NULL,24,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(233,10,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(234,9,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(235,10,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(236,9,196,25,26,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:36:23'),(237,10,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(238,9,NULL,NULL,28,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(239,10,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(240,9,NULL,NULL,29,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(241,10,164,11,19,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:47:52'),(242,10,NULL,NULL,20,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(243,10,NULL,NULL,21,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(244,11,222,37,3,'Non',1,'2023-08-01 10:43:22','2023-08-01 10:53:15'),(245,10,NULL,NULL,22,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(246,11,225,27,4,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:33:46'),(247,10,NULL,NULL,23,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(248,11,165,6,5,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:39:11'),(249,10,226,33,24,'Non',1,'2023-08-01 10:43:22','2023-08-01 12:06:03'),(250,11,200,29,6,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:23:26'),(251,10,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(252,11,NULL,NULL,7,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(253,10,NULL,NULL,26,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(254,11,NULL,NULL,8,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(255,10,210,26,28,'A',2,'2023-08-01 10:43:22','2023-08-01 11:01:14'),(256,11,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(257,10,198,27,29,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:33:06'),(258,11,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(259,11,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(260,11,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(261,12,209,25,3,'A',2,'2023-08-01 10:43:22','2023-08-01 11:36:37'),(262,11,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(263,12,183,10,4,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:55:41'),(264,11,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(265,12,201,30,5,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:32:25'),(266,11,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(267,12,NULL,NULL,6,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(268,11,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(269,12,NULL,NULL,7,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(270,11,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(271,12,NULL,NULL,8,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(272,11,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(273,12,NULL,NULL,9,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(274,11,NULL,NULL,20,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(275,12,NULL,NULL,10,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(276,11,190,8,21,'A',2,'2023-08-01 10:43:22','2023-08-01 12:10:15'),(277,12,NULL,NULL,11,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(278,11,167,13,22,'A',2,'2023-08-01 10:43:22','2023-08-01 20:44:17'),(279,12,NULL,NULL,12,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(280,11,182,19,23,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:35:48'),(281,12,NULL,NULL,13,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(282,11,NULL,NULL,24,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(283,12,NULL,NULL,14,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(284,11,NULL,NULL,25,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(285,12,NULL,NULL,15,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(286,11,NULL,NULL,26,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(287,12,NULL,NULL,16,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(288,11,210,26,28,'B',2,'2023-08-01 10:43:22','2023-08-01 11:01:22'),(289,12,NULL,NULL,17,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(290,11,NULL,NULL,29,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(291,12,NULL,NULL,19,NULL,1,'2023-08-01 10:43:22','2023-08-01 10:43:22'),(292,12,165,6,20,'Non',1,'2023-08-01 10:43:22','2023-08-01 11:39:18'),(293,12,190,8,21,'B',2,'2023-08-01 10:43:22','2023-08-01 12:10:21'),(294,13,224,37,3,'Non',1,'2023-08-01 10:43:22','2023-08-01 10:53:36'),(295,12,167,13,22,'B',2,'2023-08-01 10:43:22','2023-08-01 20:44:24'),(296,13,184,16,4,'Non',1,'2023-08-01 10:43:22','2023-08-01 20:38:18'),(297,12,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(298,13,202,23,5,'Non',1,'2023-08-01 10:43:23','2023-08-01 11:49:35'),(299,12,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(300,13,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(301,12,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(302,13,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(303,12,NULL,NULL,26,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(304,13,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(305,12,219,32,28,'Non',1,'2023-08-01 10:43:23','2023-08-01 12:04:06'),(306,13,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(307,12,225,27,29,'Non',1,'2023-08-01 10:43:23','2023-08-01 11:33:53'),(308,13,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(309,13,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(310,13,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(311,14,189,40,3,'A',2,'2023-08-01 10:43:23','2023-08-01 20:31:23'),(312,13,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(313,14,223,22,4,'Non',1,'2023-08-01 10:43:23','2023-08-01 20:33:55'),(314,13,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(315,14,157,3,5,'Non',1,'2023-08-01 10:43:23','2023-08-01 11:42:53'),(316,13,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(317,14,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(318,13,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(319,14,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(320,13,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(321,14,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(322,13,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(323,14,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(324,13,169,6,20,'B',2,'2023-08-01 10:43:23','2023-08-01 11:40:13'),(325,14,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(326,13,163,10,21,'Non',1,'2023-08-01 10:43:23','2023-08-01 12:11:54'),(327,14,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(328,13,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(329,14,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(330,13,194,19,23,'B',2,'2023-08-01 10:43:23','2023-08-01 20:56:44'),(331,14,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(332,13,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(333,14,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(334,13,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(335,14,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(336,13,211,29,26,'B',2,'2023-08-01 10:43:23','2023-08-01 11:24:23'),(337,14,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(338,13,227,32,28,'Non',1,'2023-08-01 10:43:23','2023-08-01 12:04:28'),(339,14,170,4,17,'B',2,'2023-08-01 10:43:23','2023-08-01 11:42:06'),(340,13,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(341,14,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(342,14,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(343,14,NULL,NULL,21,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(344,15,185,54,3,'Non',1,'2023-08-01 10:43:23','2023-08-01 10:49:31'),(345,14,184,16,22,'Non',1,'2023-08-01 10:43:23','2023-08-01 20:38:25'),(346,15,NULL,NULL,4,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(347,14,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(348,15,NULL,NULL,5,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(349,14,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(350,15,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(351,14,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(352,15,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(353,14,209,25,26,'A',2,'2023-08-01 10:43:23','2023-08-01 11:36:44'),(354,15,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(355,14,197,26,28,'Non',1,'2023-08-01 10:43:23','2023-08-01 11:51:10'),(356,15,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(357,14,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(358,15,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(359,15,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(360,15,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(361,16,168,15,3,'A',2,'2023-08-01 10:43:23','2023-08-01 20:40:17'),(362,15,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(363,16,186,21,4,'Non',1,'2023-08-01 10:43:23','2023-08-01 20:34:21'),(364,15,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(365,16,NULL,NULL,5,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(366,15,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(367,16,163,10,6,'Non',1,'2023-08-01 10:43:23','2023-08-01 20:52:32'),(368,15,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(369,16,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(370,15,214,28,17,'B',2,'2023-08-01 10:43:23','2023-08-01 11:57:43'),(371,16,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(372,15,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(373,16,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(374,15,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(375,16,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(376,15,176,10,21,'B',2,'2023-08-01 10:43:23','2023-08-01 20:54:16'),(377,16,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(378,15,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(379,16,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(380,15,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(381,16,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(382,15,192,23,24,'B',2,'2023-08-01 10:43:23','2023-08-01 11:49:13'),(383,16,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(384,15,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(385,16,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(386,15,222,37,26,'Non',1,'2023-08-01 10:43:23','2023-08-01 10:53:22'),(387,16,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(388,15,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(389,16,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(390,15,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(391,16,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(392,16,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(393,16,189,40,21,'A',2,'2023-08-01 10:43:23','2023-08-01 20:31:32'),(394,17,208,34,3,'A',2,'2023-08-01 10:43:23','2023-08-01 10:56:39'),(395,16,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(396,17,175,11,4,'A',2,'2023-08-01 10:43:23','2023-08-01 20:48:07'),(397,16,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(398,17,199,28,5,'Non',1,'2023-08-01 10:43:23','2023-08-01 12:01:53'),(399,16,202,23,24,'Non',1,'2023-08-01 10:43:23','2023-08-01 11:49:42'),(400,17,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(401,16,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(402,17,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(403,16,209,25,26,'B',2,'2023-08-01 10:43:23','2023-08-01 11:36:52'),(404,17,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(405,16,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(406,17,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(407,16,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(408,17,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(409,17,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(410,17,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(411,18,188,12,3,'A',2,'2023-08-01 10:43:23','2023-08-01 20:46:25'),(412,17,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(413,18,NULL,NULL,4,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(414,17,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(415,18,NULL,NULL,5,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(416,17,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(417,18,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(418,17,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(419,18,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(420,17,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(421,18,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(422,17,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(423,18,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(424,17,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(425,18,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(426,17,189,40,21,'B',2,'2023-08-01 10:43:23','2023-08-01 20:31:40'),(427,18,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(428,17,186,21,22,'Non',1,'2023-08-01 10:43:23','2023-08-01 20:34:28'),(429,18,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(430,17,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(431,18,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(432,17,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(433,18,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(434,17,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(435,18,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(436,17,224,37,26,'Non',1,'2023-08-01 10:43:23','2023-08-01 10:53:44'),(437,18,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(438,17,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(439,18,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(440,17,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(441,18,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(442,18,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(443,18,168,15,21,'A',2,'2023-08-01 10:43:23','2023-08-01 20:40:24'),(444,19,NULL,NULL,3,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(445,18,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(446,19,NULL,NULL,4,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(447,18,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(448,19,NULL,NULL,5,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(449,18,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(450,19,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(451,18,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(452,19,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(453,18,200,29,26,'Non',1,'2023-08-01 10:43:23','2023-08-01 11:23:37'),(454,19,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(455,18,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(456,19,176,10,9,'B',2,'2023-08-01 10:43:23','2023-08-01 20:54:24'),(457,18,208,34,29,'A',2,'2023-08-01 10:43:23','2023-08-01 10:56:46'),(458,19,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(459,19,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(460,19,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(461,20,191,22,3,'B',2,'2023-08-01 10:43:23','2023-08-01 20:33:36'),(462,19,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(463,20,NULL,NULL,4,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(464,19,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(465,20,167,13,5,'B',2,'2023-08-01 10:43:23','2023-08-01 20:44:32'),(466,19,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(467,20,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(468,19,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(469,20,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(470,19,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(471,20,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(472,19,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(473,20,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(474,19,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(475,20,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(476,19,NULL,NULL,21,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(477,20,210,26,11,'B',2,'2023-08-01 10:43:23','2023-08-01 10:57:04'),(478,19,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(479,20,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(480,19,188,12,23,'A',2,'2023-08-01 10:43:23','2023-08-01 20:46:32'),(481,20,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(482,19,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(483,20,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(484,19,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(485,20,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(486,19,NULL,NULL,26,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(487,20,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(488,19,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(489,20,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(490,19,208,34,29,'B',2,'2023-08-01 10:43:23','2023-08-01 10:56:52'),(491,20,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(492,20,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(493,20,183,10,21,'Non',1,'2023-08-01 10:43:23','2023-08-01 20:55:51'),(494,20,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(495,21,NULL,NULL,3,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(496,20,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(497,21,NULL,NULL,4,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(498,20,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(499,21,NULL,NULL,5,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(500,20,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(501,21,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(502,20,NULL,NULL,26,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(503,21,190,8,7,'B',2,'2023-08-01 10:43:23','2023-08-01 12:10:36'),(504,20,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(505,21,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(506,20,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(507,21,166,12,9,'B',2,'2023-08-01 10:43:23','2023-08-01 20:46:07'),(508,21,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(509,21,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(510,22,NULL,NULL,3,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(511,21,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(512,22,189,40,4,'B',2,'2023-08-01 10:43:23','2023-08-01 20:31:49'),(513,21,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(514,22,NULL,NULL,5,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(515,21,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(516,22,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(517,21,209,25,15,'B',2,'2023-08-01 10:43:23','2023-08-01 11:37:01'),(518,22,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(519,21,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(520,22,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(521,21,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(522,22,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(523,21,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(524,22,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(525,21,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(526,22,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(527,21,NULL,NULL,21,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(528,22,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(529,21,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(530,22,168,15,13,'B',2,'2023-08-01 10:43:23','2023-08-01 20:40:37'),(531,21,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(532,22,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(533,21,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(534,22,208,34,15,'B',2,'2023-08-01 10:43:23','2023-08-01 11:05:46'),(535,21,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(536,22,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(537,21,NULL,NULL,26,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(538,22,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(539,21,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(540,22,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(541,21,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(542,22,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(543,22,NULL,NULL,21,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(544,22,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(545,23,207,33,3,'A',2,'2023-08-01 10:43:23','2023-08-01 12:05:25'),(546,22,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(547,23,NULL,NULL,4,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(548,22,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(549,23,NULL,NULL,5,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(550,22,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(551,23,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(552,22,NULL,NULL,26,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(553,23,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(554,22,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(555,23,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(556,22,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(557,23,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(558,23,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(559,23,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(560,24,188,12,3,'B',2,'2023-08-01 10:43:23','2023-08-01 20:46:49'),(561,23,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(562,24,207,33,4,'B',2,'2023-08-01 10:43:23','2023-08-01 12:05:31'),(563,23,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(564,24,175,11,5,'B',2,'2023-08-01 10:43:23','2023-08-01 20:48:22'),(565,23,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(566,24,NULL,NULL,6,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(567,23,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(568,24,NULL,NULL,7,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(569,23,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(570,24,NULL,NULL,8,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(571,23,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(572,24,NULL,NULL,9,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(573,23,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(574,24,NULL,NULL,10,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(575,23,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(576,24,NULL,NULL,11,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(577,23,168,15,21,'B',2,'2023-08-01 10:43:23','2023-08-01 20:40:51'),(578,24,NULL,NULL,12,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(579,23,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(580,24,NULL,NULL,13,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(581,23,188,12,23,'B',2,'2023-08-01 10:43:23','2023-08-01 20:46:40'),(582,24,NULL,NULL,14,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(583,23,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(584,24,NULL,NULL,15,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(585,23,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(586,24,NULL,NULL,16,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(587,23,NULL,NULL,26,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(588,24,NULL,NULL,17,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(589,23,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(590,24,NULL,NULL,19,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(591,23,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(592,24,NULL,NULL,20,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(593,24,185,54,21,'Non',1,'2023-08-01 10:43:23','2023-08-01 10:49:42'),(594,24,NULL,NULL,22,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(595,24,NULL,NULL,23,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(596,24,NULL,NULL,24,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(597,24,NULL,NULL,25,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(598,24,NULL,NULL,26,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(599,24,NULL,NULL,28,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23'),(600,24,NULL,NULL,29,NULL,1,'2023-08-01 10:43:23','2023-08-01 10:43:23');
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
INSERT INTO `timetable_days` VALUES (1,1,'Monday',3.00,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(2,1,'Tuesday',3.00,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(3,1,'Wednesday',3.00,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(4,1,'Thursday',3.00,'2023-08-01 10:43:21','2023-08-01 10:43:21'),(5,1,'Friday',3.00,'2023-08-01 10:43:21','2023-08-01 10:43:21');
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
INSERT INTO `timetables` VALUES (1,'May-August Timetable','2023-08-01 10:43:21','2023-08-01 10:43:41',0);
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
  `lecturer_id` int(11) NOT NULL,
  `lab_hours` int(11) NOT NULL,
  `lab_type_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `related_to` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `units_lab_type_id_foreign` (`lab_type_id`),
  CONSTRAINT `units_lab_type_id_foreign` FOREIGN KEY (`lab_type_id`) REFERENCES `lab_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `units`
--

LOCK TABLES `units` WRITE;
/*!40000 ALTER TABLE `units` DISABLE KEYS */;
INSERT INTO `units` VALUES (156,'COMP100','INTRODUCTION TO COMPUTERS',45,0,42,0,NULL,'2023-08-01 06:11:11','2023-08-01 06:11:11',NULL),(157,'COMS110','COMMUNICATION SKILLS',45,0,3,0,NULL,'2023-08-01 06:11:39','2023-08-01 06:11:39',NULL),(158,'SCPH1111','MATHEMATICS FOR PHARMACY I',45,0,4,0,NULL,'2023-08-01 06:12:19','2023-08-01 06:12:19',NULL),(159,'BIBL110','OLD TESTAMENT SURVEY',45,0,5,0,NULL,'2023-08-01 06:12:48','2023-08-01 06:12:48',NULL),(161,'SCPH1123','INORGANIC CHEMISTRY I',45,0,8,15,2,'2023-08-01 06:15:47','2023-08-01 06:15:47',NULL),(162,'SCPH1141','MEDICAL PHYSIOLOGY I',45,0,9,15,3,'2023-08-01 06:16:27','2023-08-01 06:16:27',NULL),(163,'SCPH1122','PHYSICAL CHEMISTRY I',45,0,10,15,2,'2023-08-01 06:17:05','2023-08-01 06:17:05',NULL),(164,'SCPH1151','HUMAN ANATOMY I',45,0,11,15,4,'2023-08-01 06:17:51','2023-08-01 06:17:51',NULL),(165,'SCPH1131','BIOCHEMISTRY I',45,0,6,15,1,'2023-08-01 06:21:02','2023-08-01 06:21:02',NULL),(166,'SCPH1351','MEDICAL MICROBIOLOGY I',45,0,12,15,5,'2023-08-01 08:18:04','2023-08-01 08:18:04',NULL),(167,'SCPH1346','MEDICAL PHYSIOLOGY VI (SENSORY SYSTEMS)',45,0,13,15,3,'2023-08-01 08:18:49','2023-08-01 08:23:41',NULL),(168,'SCPH1327','ORGANIC CHEMISTRY II',45,0,15,15,2,'2023-08-01 08:21:53','2023-08-01 08:21:53',NULL),(169,'SCPH1334','BIOCHEMISTRY IV (METABOLISM II)',45,0,6,15,1,'2023-08-01 08:22:39','2023-08-01 08:22:39',NULL),(170,'SCPH1313','MATHEMATICS FOR PHARMACY III (CALCULUS II)',45,0,4,0,NULL,'2023-08-01 08:24:39','2023-08-01 08:24:39',NULL),(171,'SCPH1335','BIOCHEMISTRY V (SPECIALIZED TISSUES)',45,0,14,15,1,'2023-08-01 08:28:52','2023-08-01 08:28:52',NULL),(173,'SCPH1328','PHYSICAL CHEMISTRY III',45,0,10,15,2,'2023-08-01 08:31:19','2023-08-01 08:31:19',NULL),(174,'SCPH1345','MEDICAL PHYSIOLOGY V (CVS)',45,0,16,15,3,'2023-08-01 08:32:05','2023-08-01 08:32:05',NULL),(175,'SCPH1353','HUMAN ANATOMY III',45,0,11,15,4,'2023-08-01 08:32:49','2023-08-01 08:32:49',NULL),(176,'SCPH1329','INORGANIC CHEMISTRY III',45,0,10,15,2,'2023-08-01 08:33:54','2023-08-01 08:33:54',NULL),(177,'SCPH2136','BIOCHEMISTRY VI',45,0,14,15,1,'2023-08-01 08:42:14','2023-08-01 08:42:14',NULL),(178,'SCPH2121','ORGANIC CHEMISTRY III',45,0,15,15,2,'2023-08-01 08:43:07','2023-08-01 08:43:07',NULL),(179,'SCPH2111','BIOSTATISTICS',45,0,17,0,NULL,'2023-08-01 08:43:48','2023-08-01 08:43:48',NULL),(180,'SCPH2137','BIOCHEMISTRY VII',45,0,14,15,1,'2023-08-01 08:44:36','2023-08-01 08:44:36',NULL),(181,'SCPH2161','HUMAN PATHOLOGY I',45,0,18,15,7,'2023-08-01 08:45:21','2023-08-01 08:45:21',NULL),(182,'SCPH2151','MEDICAL MICROBIOLOGY II',45,0,19,15,5,'2023-08-01 08:46:09','2023-08-01 08:46:09',NULL),(183,'SCPH2123','PHYSICAL CHEMISTRY IV',45,0,10,15,2,'2023-08-01 08:47:01','2023-08-01 08:47:01',NULL),(184,'SCPH2142','MEDICAL PHYSIOLOGY VIII',45,0,16,15,3,'2023-08-01 08:47:56','2023-08-01 08:47:56',NULL),(185,'SCPH2122','ORGANIC CHEMISTRY IV',45,0,54,15,2,'2023-08-01 08:50:46','2023-08-01 08:50:46',NULL),(186,'SCPH2141','MEDICAL PHYSIOLOGY VII',45,0,21,15,3,'2023-08-01 08:51:29','2023-08-01 08:51:29',NULL),(187,'SCPH2341','MEDICAL PHYSIOLOGY XI',45,0,13,15,3,'2023-08-01 08:54:34','2023-08-01 08:54:34',NULL),(188,'SCPH2352','MEDICAL MICROBIOLOGY V',45,0,12,15,5,'2023-08-01 08:55:19','2023-08-01 08:55:19',NULL),(189,'SCPH2361','HUMAN PATHOLOGY IV (CLINICAL CHEMISTRY)',45,0,40,15,2,'2023-08-01 08:56:14','2023-08-01 08:56:14',NULL),(190,'SCPH2321','ORGANIC CHEMISTRY VI',45,0,8,15,2,'2023-08-01 08:57:07','2023-08-01 08:57:07',NULL),(191,'SCPH2342','MEDICAL PHYSIOLOGY XII',45,0,22,15,3,'2023-08-01 08:57:52','2023-08-01 08:57:52',NULL),(192,'PHAM2364','PHARMACOGNOSY I',45,0,23,15,6,'2023-08-01 09:00:57','2023-08-01 09:00:57',NULL),(193,'PHAM2340','SOCIAL AND BEHAVIORAL PHARMACY I',45,0,24,0,NULL,'2023-08-01 09:01:29','2023-08-01 09:01:29',NULL),(194,'SCPH2351','MEDICAL MICROBIOLOGY IV (VIROLOGY)',45,0,19,15,5,'2023-08-01 09:02:06','2023-08-01 09:02:06',NULL),(195,'PHAM2353','PHARMACEUTICAL CHEMISTRY II',45,0,54,15,8,'2023-08-01 09:02:50','2023-08-01 09:02:50',NULL),(196,'PHAM3126','PHARMACEUTICS I',45,0,25,15,9,'2023-08-01 09:06:48','2023-08-01 09:06:48',NULL),(197,'PHAM3102','PHARMACOLOGY II',45,0,26,15,10,'2023-08-01 09:07:31','2023-08-01 09:07:31',NULL),(198,'PHAM3154','PHARMACEUTICAL CHEMISTRY III',45,0,27,15,8,'2023-08-01 09:08:12','2023-08-01 09:08:12',NULL),(199,'PHAM3101','PHARMACOLOGY I',45,0,28,15,10,'2023-08-01 09:09:04','2023-08-01 09:09:04',NULL),(200,'PHAM3127','PHARMACEUTICS II',45,0,29,15,9,'2023-08-01 09:09:48','2023-08-01 09:09:48',NULL),(201,'PHAM3171','TECHNICAL WRITING',45,0,30,0,NULL,'2023-08-01 09:10:28','2023-08-01 09:10:28',NULL),(202,'PHAM3165','PHARMACOGNOSY II',45,0,23,15,6,'2023-08-01 09:11:12','2023-08-01 09:11:12',NULL),(203,'PHAM3141','SOCIAL AND BEHAVIORAL PHARMACY II',45,0,31,0,NULL,'2023-08-01 09:11:46','2023-08-01 09:11:46',NULL),(204,'PHAM3166','PHARMACOGNOSY III',45,0,23,15,6,'2023-08-01 09:12:31','2023-08-01 09:12:31',NULL),(205,'PHAM3307','PHARMACOLOGY VII',45,0,32,15,10,'2023-08-01 09:15:07','2023-08-01 09:15:07',NULL),(206,'PHAM3357','PHARMACEUTICAL CHEMISTRY VI',45,0,27,15,8,'2023-08-01 09:16:00','2023-08-01 09:16:00',NULL),(207,'PHAM3368','PHARMACOGNOSY V',45,0,33,15,6,'2023-08-01 09:16:43','2023-08-01 09:16:43',NULL),(208,'PHAM3358','PHARMACEUTICAL CHEMISTRY VII',45,0,34,15,8,'2023-08-01 09:17:35','2023-08-01 09:17:35',NULL),(209,'PHAM3330','PHARMACEUTICS V (PHYSICAL PHARMACY)',45,0,25,15,9,'2023-08-01 09:18:34','2023-08-01 09:18:34',NULL),(210,'PHAM3306','PHARMACOLOGY VI (CVS PHARMACOLOGY)',45,0,26,15,10,'2023-08-01 09:19:17','2023-08-01 09:19:17',NULL),(211,'PHAM3331','PHARMACEUTICS VI (STERILIZATION AND DISINFECTION)',45,0,29,15,9,'2023-08-01 09:20:08','2023-08-01 09:20:08',NULL),(212,'PHAM3316','CLINICAL PHARMACY II',45,0,16,0,NULL,'2023-08-01 09:21:09','2023-08-01 09:21:09',NULL),(213,'PHAM3346','PHARMACY MANAGEMENT I',45,0,21,0,NULL,'2023-08-01 09:21:51','2023-08-01 09:21:51',NULL),(214,'PHAM3305','PHARMACOLOGY V (HYPNOTICS AND SEDATIVES)',45,0,28,15,10,'2023-08-01 09:22:42','2023-08-01 09:22:42',NULL),(215,'PHAM4172','BIOINFORMATICS',45,0,26,0,NULL,'2023-08-01 09:26:30','2023-08-01 09:26:30',NULL),(216,'PHAM4134','PHARMACEUTICS IX (DOSAGE FORMS)',45,0,25,15,9,'2023-08-01 09:27:24','2023-08-01 09:27:24',NULL),(217,'PHAM4147','PHARMACY MANAGEMENT II (ENTREPRENEURSHIP)',45,0,35,0,NULL,'2023-08-01 09:28:34','2023-08-01 09:28:34',NULL),(218,'PHAM4108','PHARMACOLOGY VII (GIT PHARMACOLOGY)',45,0,28,15,10,'2023-08-01 09:29:28','2023-08-01 09:29:28',NULL),(219,'PHAM4109','PHARMACOLOGY IX',45,0,32,15,10,'2023-08-01 09:31:01','2023-08-01 09:31:28',NULL),(220,'PHAM4118','CLINICAL PHARMACY IV',45,0,36,0,NULL,'2023-08-01 09:32:36','2023-08-01 09:32:36',NULL),(221,'PHAM4159','PHARMACEUTICAL CHEMISTRY VIII',45,0,34,15,8,'2023-08-01 09:33:14','2023-08-01 09:33:14',NULL),(222,'PHAM4133','PHARMACEUTICS VIII',45,0,37,15,9,'2023-08-01 09:33:56','2023-08-01 09:33:56',NULL),(223,'PHAM4117','CLINICAL PHARMACY III',45,0,22,0,NULL,'2023-08-01 09:34:32','2023-08-01 09:34:32',NULL),(224,'PHAM4132','PHARMACEUTICS VII',45,0,37,15,9,'2023-08-01 09:35:11','2023-08-01 09:35:11',NULL),(225,'PHAM5161','PHARMACEUTICAL CHEMISTRY X',45,0,27,15,8,'2023-08-01 09:37:31','2023-08-01 09:37:31',NULL),(226,'PHAM5170','PHARMACOGNOSY VII',45,0,33,15,6,'2023-08-01 09:38:20','2023-08-01 09:38:20',NULL),(227,'PHAM5111','PHARMACOLOGY XI',45,0,32,15,10,'2023-08-01 09:39:01','2023-08-01 09:39:01',NULL),(228,'PHAM5121','CLINICAL PHARMACY VII',45,0,16,0,NULL,'2023-08-01 09:39:42','2023-08-01 09:39:42',NULL),(229,'PHAM5122','CLINICAL PHARMACY VIII',45,0,16,0,NULL,'2023-08-01 09:40:12','2023-08-01 09:40:12',NULL),(230,'PHAM5112','PHARMACOLOGY XII',45,0,28,15,10,'2023-08-01 09:40:58','2023-08-01 09:40:58',NULL),(231,'PHAM5137','PHARMACEUTICS XII',45,0,37,15,8,'2023-08-01 09:42:22','2023-08-01 09:42:22',NULL),(232,'PHAM5149','PHARMACY MANAGEMENT IV',45,0,21,0,NULL,'2023-08-01 09:42:49','2023-08-01 09:42:49',NULL),(233,'PHAM5363','PHARMACEUTICAL CHEMISTRY XII',45,0,34,15,8,'2023-08-01 09:45:10','2023-08-01 09:45:10',NULL),(234,'PHAM5345','ENVIRONMENTAL AND OCCUPATIONAL HEALTH',45,0,41,0,NULL,'2023-08-01 09:45:49','2023-08-01 09:45:49',NULL),(235,'PHAM5339','PHARMACEUTICS XIV (NOVEL DRUG DELIVERY SYSTEMS)',45,0,29,0,NULL,'2023-08-01 09:47:02','2023-08-01 09:47:02',NULL),(236,'PHAM5314','PHARMACOLOGY XIV (TOXICOLOGY)',45,0,32,0,NULL,'2023-08-01 09:48:14','2023-08-01 09:48:14',NULL),(237,'PHAM5377','PHARMACY LAW 2',45,0,39,0,NULL,'2023-08-01 09:48:49','2023-08-01 09:48:49',NULL),(238,'PHAM5325','CLINICAL PHARMACY XI',45,0,36,0,NULL,'2023-08-01 09:49:25','2023-08-01 09:49:25',NULL),(239,'PHAM5351','PHARMACY MANAGEMENT VI',45,0,31,0,NULL,'2023-08-01 09:49:57','2023-08-01 09:49:57',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Administrator','injuguna@kabarak.ac.ke','1','default.jpg',NULL,'$2y$10$adtU7CrPVNYxI9aSn90K2ubGpcSD.Rt/seCRAI1Kr476OQgdaANJq',NULL,'2023-07-13 11:08:44','2023-07-13 11:08:44'),(2,'Timetabler','timetabler@mail.com','2','default.jpg',NULL,'$2y$10$fiNvbG9jvGpJ3xdjeWj7qOd463KePzy3LpD2Ow7L1pEEiiEqdKVIa',NULL,'2023-07-13 11:08:44','2023-07-13 11:08:44'),(3,'lecturer','lecturer@mail.com','4','default.jpg',NULL,'$2y$10$FgEfklHG7U4Cg.bpXjOkjewne3.EfF1KQe.gwedRd0vrGZYJ9K/7O',NULL,'2023-07-13 11:08:44','2023-07-13 11:08:44'),(4,'hod','hod@mail.com','4','default.jpg',NULL,'$2y$10$RzS/5VxrD16chfDPe97sXO2mC0HYY5.4.Y6..YzIbGWFSXX1tGoKy',NULL,'2023-07-13 11:08:44','2023-07-13 11:08:44'),(5,'Mr.','mulinge@gmail.com','5','default.jpg',NULL,'$2y$10$Bh5gcXPiA0uWcxOH0MjS9.RTjnUZ0uRHBXCqBYR7u0gvqUOabnLH6',NULL,'2023-07-13 15:06:11','2023-07-27 11:20:27'),(6,'Mr.','bundotich@gmail.com','4','default.jpg',NULL,'$2y$10$OMlGlq0hzo1CGgChUks4ROGzmkzKpKVxpAUPux03HKHqPVw/kvq.i',NULL,'2023-07-13 15:06:59','2023-07-13 15:06:59'),(7,'Rev.','rotich@gmail.com','4','default.jpg',NULL,'$2y$10$MEq3O3IDwMRKIGwrcMWOO.9HTHPOEsWLkb8tZIppQ8Uqk5kWooNkq',NULL,'2023-07-13 15:07:50','2023-07-13 15:07:50'),(8,'Ms.','murithi@gmail.com','4','default.jpg',NULL,'$2y$10$ohQ6g64xto454x.WBqczJeDGi9I7EKkBeHwdIElNGBVcDI2HMtOKy',NULL,'2023-07-13 15:15:25','2023-07-13 15:15:25'),(9,'Dr.','akumu@gmail.com','5','default.jpg',NULL,'$2y$10$WnPqc7GgsRWCvWREoXkTn.p1YNls8kTTcyfeKFuQjUHIdTDBv8JYq',NULL,'2023-07-13 15:17:39','2023-08-01 20:22:41'),(10,'Dr.','rose@gmail.com','5','default.jpg',NULL,'$2y$10$4g4c7JNZ3AUwIaKdb62u6uW7X2HBGt4PKATcG1kNsANCpJ9wrd.w6',NULL,'2023-07-13 15:19:49','2023-08-01 20:20:58'),(11,'Dr.','kirui@gmail.com','4','default.jpg',NULL,'$2y$10$wY8vTyC.7Nw4uhHOoCfcWOoe7/0o0S5mrvwS323L3a6R6wJi2lnIG',NULL,'2023-07-13 15:20:50','2023-07-13 15:20:50'),(12,'Mr.','rono@gmail.com','4','default.jpg',NULL,'$2y$10$Btrja/7aKuDKTANta0P/2OZoY5rD6Eo9XP1vtykjh1Eng/FLd2jJi',NULL,'2023-07-13 15:25:57','2023-07-13 15:25:57'),(13,'Ms.','kerubo@gmail.com','4','default.jpg',NULL,'$2y$10$P1UEySpsiLYDcC4S/w.VhObHC4BfNjb1hsW9DAJwbMifo5.3mfvSe',NULL,'2023-07-13 15:26:52','2023-07-13 15:26:52'),(14,'Dr.','Nahashon@gmail.com','4','default.jpg',NULL,'$2y$10$kiEjQsmE2hbF2Pj.vNZAG.Sh2DfRtU3cG2ieJ29wKQ3pdywPmGhy6',NULL,'2023-07-13 15:27:24','2023-07-13 15:27:24'),(15,'Mr.','Micah@gmail.com','4','default.jpg',NULL,'$2y$10$Fvtzx0TLkE3OOcgcHjg7l.FBVqRF7FifoKSOu7/xWt3tt4sKHl0Rq',NULL,'2023-07-13 15:30:47','2023-07-13 15:30:47'),(16,'Dr.','Kebenei@gmail.com','4','default.jpg',NULL,'$2y$10$TucA2DItIQIT3kDrlbAcLOCTShrGJD3hXZrjcnZjdNCoub1qZvS2C',NULL,'2023-07-13 15:38:36','2023-07-13 15:38:36'),(17,'Dr.','Wairimu@gmail.com','4','default.jpg',NULL,'$2y$10$wwDZQUDsEuGUPtQtor3teOodo1I1eb7BIxOZtenHsrkOHH7IKlFGy',NULL,'2023-07-13 15:39:22','2023-07-13 15:39:22'),(18,'Mr.','Charles@gmail.com','4','default.jpg',NULL,'$2y$10$TnUkaFZQhrEyg4pZTurIC.QH8D31NMGikZvERe6yI8OvCGsvz6HDK',NULL,'2023-07-13 15:45:00','2023-07-13 15:45:00'),(19,'Dr.','Walekhwa@gmail.com','4','default.jpg',NULL,'$2y$10$vC8QgVEcDoqQt2knrLByN.ytfj8DWvXmRPnUX3bWoqg0ijueuk3qy',NULL,'2023-07-13 15:45:39','2023-07-13 15:45:39'),(20,'Dr.','Tonui@gmail.com','4','default.jpg',NULL,'$2y$10$GHu2AOEh8LZv8OtGQROyFebs2K4QppkGaT6Zrd4esr4GVqmu67Jay',NULL,'2023-07-13 15:46:06','2023-07-13 15:46:06'),(21,'Dr.','Chebon@gmail.com','4','default.jpg',NULL,'$2y$10$6udy89Wf0QSgn1cruz3mnuVsIpWrba9j1HQzHeDHRWlY85LS7MnxS',NULL,'2023-07-13 15:47:41','2023-07-13 15:47:41'),(22,'Dr.','Keter@gmail.com','4','default.jpg',NULL,'$2y$10$boSnZBJMhAPos69dt0aX7emcIolVnmPxFruzabKgqW2zYkAbAIRNi',NULL,'2023-07-13 15:48:23','2023-07-13 15:48:23'),(23,'Ms.','Elizabeth@gmail.com','5','default.jpg',NULL,'$2y$10$o6y75rPqThs2dUyazLzy..t7fDJmgsshaQ/vs6iToufxTrMP2blda',NULL,'2023-07-13 15:49:07','2023-07-27 10:55:35'),(24,'Ms.','Nyangena@gmail.com','4','default.jpg',NULL,'$2y$10$XgmamDk/Jcr.JYhbdJB0juiiT4xXPUTxEMpKvkwtOpXpUxb3wAJwu',NULL,'2023-07-13 15:51:25','2023-07-13 15:51:25'),(25,'Dr.','Vugigi@gmail.com','4','default.jpg',NULL,'$2y$10$0FvXNSxf4PjzmQGa6bb29.et3wMmDKXPKA5p4R.lJ/zSAhxxVVksO',NULL,'2023-07-13 15:52:23','2023-07-13 15:52:23'),(26,'Dr.','Kagia@gmail.com','4','default.jpg',NULL,'$2y$10$ELjn0kaBNNntrn2e4JezLuFJGyfDSKZhs3TNHTgZ0hdL8y.TPWPIK',NULL,'2023-07-13 15:52:49','2023-07-13 15:52:49'),(27,'Dr.','Jediel@gmail.com','4','default.jpg',NULL,'$2y$10$XBh4mfN/Bfw4/vr3ey2GG.vJuumVSZ/fvCC2e6UWmpU6ZQAbB3lzy',NULL,'2023-07-13 15:53:22','2023-07-13 15:53:22'),(28,'Dr.','Jim@gmail.com','4','default.jpg',NULL,'$2y$10$i8wtxbjZHVMzkxKCJ0RqH.hzC2GPTGhALJValZvnRqp6pav6SBJaS',NULL,'2023-07-13 15:53:49','2023-07-13 15:53:49'),(29,'Dr.','Nyandoro@gmail.com','4','default.jpg',NULL,'$2y$10$XwqcpCusRnvEOmNStAb3l.FG3/NY8pyJPC5ZPVbUzJXXUrQk5nCeC',NULL,'2023-07-13 15:54:24','2023-07-13 15:54:24'),(30,'Mrs.','Somba@gmail.com','4','default.jpg',NULL,'$2y$10$prDiT7L80rjih2QkIqQlQuf0.eCHqRPU2VtZcxpmxfWmMO79jMfae',NULL,'2023-07-13 15:55:01','2023-07-13 15:55:01'),(31,'Mr.','Kandagor,@gmail.com','4','default.jpg',NULL,'$2y$10$R/rvpc8ZMTLgK22sFZ5DWOBUZflKX1YkmDI/nhIXpleUkbP03hnP2',NULL,'2023-07-13 15:55:56','2023-07-13 15:55:56'),(32,'Dr.','Meroka@gmail.com','5','default.jpg',NULL,'$2y$10$OjzseffYFHET2oXuEyVu4elQCtgps.BFWjhMT017h4xS2dZQioGqC',NULL,'2023-07-13 15:57:03','2023-07-27 10:56:47'),(33,'Dr.','Janet@gmail.com','4','default.jpg',NULL,'$2y$10$VrO7zIRL2WT5o/L.Pcq.I.1OeFbbfDdXk2QlPmsLtsDBa03VyMp3S',NULL,'2023-07-13 15:57:30','2023-07-13 15:57:30'),(34,'Dr.','Ndubi@gmail.com','5','default.jpg',NULL,'$2y$10$EMKOIFZpjwD.aH88h7sFfOoxC6UTyGbx2kJCDF7ifXT5rukX7kVSS',NULL,'2023-07-13 15:58:10','2023-07-27 10:57:11'),(35,'Dr.','Balongo,@gmail.com','4','default.jpg',NULL,'$2y$10$sJHqsrYwn..wmFd0aqSCpea0DNx8fsodwOyBjeuXkyruy/H8gZflm',NULL,'2023-07-13 15:59:14','2023-07-13 15:59:14'),(36,'Dr.','Nelius@gmail.com','4','default.jpg',NULL,'$2y$10$mS4LM3Mxn2/bNDvHqxBmceqMHv6/76.3tOm/s.b2l2Bcc2DQ8NCNW',NULL,'2023-07-13 16:01:04','2023-07-13 16:01:04'),(37,'Dr.','Obat@gmail.com','4','default.jpg',NULL,'$2y$10$SuGn9u873g9AchH9dqrD1O1cLyEzoNE4Y0oV5I4FMwLzlSZP4x1da',NULL,'2023-07-13 16:01:43','2023-07-13 16:01:43'),(38,'Ms.','Wakuraya@gmail.com','4','default.jpg',NULL,'$2y$10$RdiqzTb7jNlLRrTI.//gOO/L1cI2fSS5oB19fj7qU5FrE2zmHfPgS',NULL,'2023-07-13 16:03:32','2023-07-13 16:03:32'),(39,'Ms.','Murugi@gmail.com','4','default.jpg',NULL,'$2y$10$hfxWZMoCx.qBsArAF7kQ8.c3JAizxfbx23wK7TE1fDOUuxgr/LPfa',NULL,'2023-07-13 16:58:36','2023-07-13 16:58:36'),(40,'Mrs.','Kurui@gmail.com','4','default.jpg',NULL,'$2y$10$w/fLAnhbYGIMDShd5IstHueZ1WR3NPxlUUCDYMgYGc38DpfnzlXCO',NULL,'2023-07-13 18:02:13','2023-07-13 18:02:13'),(41,'Dr.','saruni@gmail.com','4','default.jpg',NULL,'$2y$10$QkUNU4gWVzobr2i9FVjSBekC.4GNBSszqZksofhVN2.l6AdXhISFu',NULL,'2023-07-26 15:53:48','2023-07-26 15:53:48'),(42,'Biochemistry','Biochemistry@gmail.com','4','default.jpg',NULL,'$2y$10$aWUJqaoTmkjsVciEL2vaSe6ZiYkOVMw/qdPtHVnHndVtJ2DQusWPW',NULL,'2023-07-26 16:15:57','2023-07-26 16:15:57'),(43,'Chemistry','Chemistry@gmail.com','4','default.jpg',NULL,'$2y$10$zhi68cNWJGYQgCg2hMBhtuioiCTVt2wkrEPIjw9aDziyUWasSUrJC',NULL,'2023-07-26 16:16:44','2023-07-26 16:16:44'),(44,'Physiology','Physiology@gmail.com','4','default.jpg',NULL,'$2y$10$VX.vEhoED0i5NxfTqal6Gua4wh2doVtvm3bV3p1XJ3Nlp.Vb68tlK',NULL,'2023-07-26 16:18:11','2023-07-26 16:18:11'),(45,'Anatomy','Anatomy@gmail.com','4','default.jpg',NULL,'$2y$10$.L.CLUnJiM2GidIUOMTXieArZiUxzIdgTwCi0TJqq3eGFPr380wKe',NULL,'2023-07-26 16:18:52','2023-07-26 16:18:52'),(46,'Microbiology','Microbiology@gmail.com','4','default.jpg',NULL,'$2y$10$Jcekr7730x3MPnWHct70/unyFhsDabdcgMwpOc7ioV/sA4kWli1Ja',NULL,'2023-07-26 16:20:19','2023-07-26 16:20:19'),(47,'Pathology','Pathology@gmail.com','4','default.jpg',NULL,'$2y$10$ILocyFNuhJAydj3NmJMxUuIWsUMsRseqcm0X11GvP8ge94av8MfFy',NULL,'2023-07-26 16:23:25','2023-07-26 16:23:25'),(48,'Pharmaceutical','Pharmaceutical@gmail.com','4','default.jpg',NULL,'$2y$10$Y679EwuIi9wNAsRLlq540ufUcDfplLUzw8riIf5ZBfgaLLzg14.yW',NULL,'2023-07-26 16:26:48','2023-07-26 16:26:48'),(49,'Pharmacognosy','Pharmacognosy@gmail.com','4','default.jpg',NULL,'$2y$10$BRquIp.vaG/s3QWgj/hzvuVJHXLnlnHxMRPK5iqzpuqxAGJsmfidK',NULL,'2023-07-26 16:28:00','2023-07-26 16:28:00'),(50,'Mr.','Justine@gmail.com','4','default.jpg',NULL,'$2y$10$FDz4kgpjs8npqC1Cf7CRtu5hZVBh.gXL.3gas631GVAkc7IjhPqee',NULL,'2023-07-26 16:32:20','2023-07-26 16:32:20'),(51,'Mr.','Nicolas@gmail.com','4','default.jpg',NULL,'$2y$10$0rAhPpQRTobQRIXzZT4NRuYSxMImTt80A33BkYanAkbWfQJzCysri',NULL,'2023-07-26 16:33:09','2023-07-26 16:33:09'),(53,'Dr.','drrotich@gmail.com','4','default.jpg',NULL,'$2y$10$VtDRmyscKuJWqnG0MGqjkufNNw.tJlv5j8qCPZNVs1crGdDz3bQoy',NULL,'2023-08-01 08:50:04','2023-08-01 08:50:04');
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

-- Dump completed on 2023-08-02  1:03:19
