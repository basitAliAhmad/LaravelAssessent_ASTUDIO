-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: LARAVEL
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `cache`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (17,'0001_01_01_000000_create_users_table',1),(18,'0001_01_01_000001_create_cache_table',1),(19,'0001_01_01_000002_create_jobs_table',1),(20,'2024_06_09_122841_create_personal_access_tokens_table',1),(21,'2024_06_09_125228_user_model_modification',1),(24,'2024_06_09_144312_project_model_creation',2),(27,'2024_06_09_155221_time_sheet_model_creation',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
INSERT INTO `personal_access_tokens` VALUES (1,'App\\Models\\User',1,'API_TOKEN','84ee83fcb346b01bd1793e8905403bde32423322be2b7def7eaf5848382ddfb3','[\"*\"]','2024-06-09 17:21:50',NULL,'2024-06-09 15:24:11','2024-06-09 17:21:50'),(2,'App\\Models\\User',2,'API_TOKEN','35eb2bf9789f9fd4768dfcd98e92a54afe09b06ee16ebe7a1b029e0a5534eac8','[\"*\"]',NULL,NULL,'2024-06-09 17:12:19','2024-06-09 17:12:19'),(3,'App\\Models\\User',3,'API_TOKEN','0a5521cbc8386406ada9a9f392049c16c0a2509f3a79f36e191212d132b11665','[\"*\"]',NULL,NULL,'2024-06-09 17:13:05','2024-06-09 17:13:05'),(4,'App\\Models\\User',4,'API_TOKEN','fc180dd1899460174e5c0ea02de9334d52ae1d4388b46d38a43aa36af8fa34e5','[\"*\"]',NULL,NULL,'2024-06-09 17:13:44','2024-06-09 17:13:44');
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `department` varchar(255) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `creator_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_creator_id_foreign` (`creator_id`),
  CONSTRAINT `projects_creator_id_foreign` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (1,'Website Redesign','Marketing','2023-01-15','2023-07-30','active',1,'2024-06-09 17:20:15','2024-06-09 17:20:15'),(2,'Mobile App Development','Engineering',NULL,NULL,'inactive',1,'2024-06-09 17:20:20','2024-06-09 17:20:20'),(3,'Product Launch Campaign','Sales','2023-03-05',NULL,'active',1,'2024-06-09 17:20:29','2024-06-09 17:20:29'),(4,'Financial Analysis Project','Finance',NULL,'2023-10-15','inactive',1,'2024-06-09 17:21:17','2024-06-09 17:21:17'),(5,'Supply Chain Optimization','Operations','2023-05-10','2023-11-30','active',1,'2024-06-09 17:21:22','2024-06-09 17:21:22'),(6,'Market Research Initiative','Marketing',NULL,NULL,'inactive',1,'2024-06-09 17:21:28','2024-06-09 17:21:28'),(7,'HR Policy Restructuring','Human Resources','2023-07-10',NULL,'active',1,'2024-06-09 17:21:34','2024-06-09 17:21:34'),(8,'New Product Development','Engineering',NULL,NULL,'inactive',1,'2024-06-09 17:21:39','2024-06-09 17:21:39'),(9,'Customer Satisfaction Survey','Sales','2023-09-01',NULL,'active',1,'2024-06-09 17:21:44','2024-06-09 17:21:44'),(10,'Financial Forecasting Project','Finance',NULL,'2024-04-20','inactive',1,'2024-06-09 17:21:50','2024-06-09 17:21:50');
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `payload` longtext NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_sheets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time_sheets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `task_name` varchar(255) NOT NULL,
  `date_logged` date NOT NULL,
  `hours` double NOT NULL,
  `project_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `time_sheets_project_id_foreign` (`project_id`),
  KEY `time_sheets_user_id_foreign` (`user_id`),
  CONSTRAINT `time_sheets_project_id_foreign` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE,
  CONSTRAINT `time_sheets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_sheets`
--

LOCK TABLES `time_sheets` WRITE;
/*!40000 ALTER TABLE `time_sheets` DISABLE KEYS */;
INSERT INTO `time_sheets` VALUES (88,'Design UI','2023-01-01',4,1,1),(89,'Setup Database','2023-01-02',3,1,2),(90,'Write API','2023-01-03',5,1,3),(91,'Create Test Cases','2023-01-04',2,1,4),(92,'Project Planning','2023-01-05',6,2,1),(93,'Requirement Analysis','2023-01-06',8,2,2),(94,'UI Mockup','2023-01-07',7,2,3),(95,'Backend Development','2023-01-08',3,2,4),(96,'Client Meeting','2023-01-09',4,3,1),(97,'Prepare Presentation','2023-01-10',5,3,2),(98,'Code Review','2023-01-11',6,3,3),(99,'Deployment','2023-01-12',7,3,4),(100,'Financial Analysis','2023-01-13',8,4,1),(101,'Report Generation','2023-01-14',3,4,2),(102,'Data Validation','2023-01-15',4,4,3),(103,'Data Cleaning','2023-01-16',5,4,4),(104,'Supply Chain Analysis','2023-01-17',6,5,1),(105,'Logistics Planning','2023-01-18',7,5,2),(106,'Inventory Management','2023-01-19',8,5,3),(107,'Supplier Coordination','2023-01-20',3,5,4),(108,'Market Research','2023-01-21',4,6,1),(109,'Survey Analysis','2023-01-22',5,6,2),(110,'Focus Group','2023-01-23',6,6,3),(111,'Competitor Analysis','2023-01-24',7,6,4),(112,'HR Policy Review','2023-01-25',8,7,1),(113,'Employee Training','2023-01-26',3,7,2),(114,'Recruitment Planning','2023-01-27',4,7,3),(115,'Performance Evaluation','2023-01-28',5,7,4),(116,'Product Development','2023-01-29',6,8,1),(117,'Prototyping','2023-01-30',7,8,2),(118,'Testing','2023-01-31',8,8,3),(119,'Product Launch','2023-02-01',3,8,4),(120,'Customer Feedback','2023-02-02',4,9,1),(121,'Survey Deployment','2023-02-03',5,9,2),(122,'Data Collection','2023-02-04',6,9,3),(123,'Report Preparation','2023-02-05',7,9,4),(124,'Financial Forecasting','2023-02-06',8,10,1),(125,'Budget Planning','2023-02-07',3,10,2),(126,'Expense Tracking','2023-02-08',4,10,3),(127,'Cost Analysis','2023-02-09',5,10,4),(128,'Update UI','2023-02-10',6,1,1),(129,'Database Migration','2023-02-11',7,1,2),(130,'API Optimization','2023-02-12',8,1,3),(131,'Test Automation','2023-02-13',3,1,4),(132,'Sprint Planning','2023-02-14',4,2,1),(133,'User Story Mapping','2023-02-15',5,2,2),(134,'Mockup Review','2023-02-16',6,2,3),(135,'Backend Refactor','2023-02-17',7,2,4),(136,'Client Demo','2023-02-18',8,3,1),(137,'Presentation Feedback','2023-02-19',3,3,2),(138,'Code Refactor','2023-02-20',4,3,3),(139,'System Deployment','2023-02-21',5,3,4),(140,'Financial Modeling','2023-02-22',6,4,1),(141,'Generate Reports','2023-02-23',7,4,2),(142,'Data Analysis','2023-02-24',8,4,3),(143,'Clean Data','2023-02-25',3,4,4),(144,'Analyze Logistics','2023-02-26',4,5,1),(145,'Plan Logistics','2023-02-27',5,5,2),(146,'Manage Inventory','2023-02-28',6,5,3),(147,'Coordinate Suppliers','2023-03-01',7,5,4),(148,'Research Market','2023-03-02',8,6,1),(149,'Analyze Surveys','2023-03-03',3,6,2),(150,'Conduct Focus Group','2023-03-04',4,6,3),(151,'Analyze Competitors','2023-03-05',5,6,4),(152,'Review HR Policies','2023-03-06',6,7,1),(153,'Train Employees','2023-03-07',7,7,2),(154,'Plan Recruitment','2023-03-08',8,7,3),(155,'Evaluate Performance','2023-03-09',3,7,4),(156,'Develop Product','2023-03-10',4,8,1),(157,'Prototype Product','2023-03-11',5,8,2),(158,'Test Product','2023-03-12',6,8,3),(159,'Launch Product','2023-03-13',7,8,4),(160,'Get Customer Feedback','2023-03-14',8,9,1),(161,'Deploy Survey','2023-03-15',3,9,2),(162,'Collect Data','2023-03-16',4,9,3),(163,'Prepare Report','2023-03-17',5,9,4),(164,'Forecast Financials','2023-03-18',6,10,1),(165,'Plan Budget','2023-03-19',7,10,2),(166,'Track Expenses','2023-03-20',8,10,3),(167,'Analyze Costs','2023-03-21',3,10,4);
/*!40000 ALTER TABLE `time_sheets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Bob','robert.johnson@email.com',NULL,'$2y$12$p9V9sQIrMMBYeKydGdoeYut5yPGAPcKiL9mVlPPoWCYU88w5.f.9K',NULL,'2024-06-09 15:24:11','2024-06-09 15:24:11','Johnson','1999-01-01','male'),(2,'Eva','eva.ferguson@example.com',NULL,'$2y$12$WhbVGzSZaOG9l5iElJuhUejaOe8iKbnPcCkOeJvmQb0N0aEwdPp0O',NULL,'2024-06-09 17:12:19','2024-06-09 17:12:19','Ferguson','1965-04-12','female'),(3,'Ann','ann.cooper@example.com',NULL,'$2y$12$4XsPfJjR/lWv5mzCxb/d3OTlZGGauCVKMXjYzdDOcubjFhigAk8Py',NULL,'2024-06-09 17:13:04','2024-06-09 17:13:04','Cooper','1960-03-09','female'),(4,'Angel','angel.moore@example.com',NULL,'$2y$12$xSuTGHRYEiauQFSvJOyfeejJI03SK3lg2FJbNBdhyaVEKPbYds03q',NULL,'2024-06-09 17:13:44','2024-06-09 17:13:44','Moore','1948-03-01','male');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'LARAVEL'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-09 21:45:34
