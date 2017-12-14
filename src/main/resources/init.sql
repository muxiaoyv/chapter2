-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: springtest
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `t_login_log`
--

DROP TABLE IF EXISTS `t_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_login_log` (
  `login_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `login_datetime` datetime DEFAULT NULL,
  `ip` varchar(23) DEFAULT NULL,
  PRIMARY KEY (`login_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_login_log`
--

LOCK TABLES `t_login_log` WRITE;
/*!40000 ALTER TABLE `t_login_log` DISABLE KEYS */;
INSERT INTO `t_login_log` VALUES (2,1,'2017-10-05 19:01:46','0:0:0:0:0:0:0:1'),(4,1,'2017-10-18 16:31:44','127.0.0.1'),(5,1,'2017-10-18 16:35:54','127.0.0.1'),(6,1,'2017-10-18 16:36:40','127.0.0.1'),(7,1,'2017-10-18 16:37:19','127.0.0.1'),(8,1,'2017-10-18 16:39:27','127.0.0.1'),(9,1,'2017-10-18 16:40:45','127.0.0.1'),(10,0,'2017-10-18 19:10:27','127.0.0.1'),(11,0,'2017-10-18 19:13:58','127.0.0.1'),(12,0,'2017-10-18 19:14:13','127.0.0.1'),(13,0,'2017-10-18 19:15:48','127.0.0.1'),(14,0,'2017-10-18 19:16:40','127.0.0.1'),(15,0,'2017-10-18 19:16:54','127.0.0.1'),(16,0,'2017-10-18 19:29:23','127.0.0.1'),(17,0,'2017-10-18 19:30:09','127.0.0.1'),(18,0,'2017-10-18 19:30:23','127.0.0.1'),(19,0,'2017-10-18 20:44:05','127.0.0.1'),(20,0,'2017-10-18 20:46:42','127.0.0.1'),(21,0,'2017-10-18 20:47:21','127.0.0.1'),(22,0,'2017-10-18 21:19:02','127.0.0.1'),(23,0,'2017-10-18 21:24:15','127.0.0.1'),(24,0,'2017-10-18 21:25:30','127.0.0.1'),(25,0,'2017-10-18 21:26:48','127.0.0.1'),(26,0,'2017-10-19 08:38:44','127.0.0.1'),(27,0,'2017-10-19 08:40:49','127.0.0.1'),(28,0,'2017-10-19 08:43:04','127.0.0.1'),(29,0,'2017-10-19 08:53:30','127.0.0.1'),(30,0,'2017-10-19 08:56:37','127.0.0.1'),(31,0,'2017-10-19 08:57:45','127.0.0.1'),(32,0,'2017-10-19 08:59:13','127.0.0.1'),(33,0,'2017-10-19 09:00:22','127.0.0.1'),(34,3,'2017-10-19 09:01:59','127.0.0.1'),(35,3,'2017-10-19 09:10:00','127.0.0.1'),(36,3,'2017-10-19 09:14:09','127.0.0.1'),(37,3,'2017-10-19 09:23:37','127.0.0.1'),(38,3,'2017-10-19 09:27:44','127.0.0.1'),(39,3,'2017-10-19 09:42:58','127.0.0.1'),(40,3,'2017-10-19 09:45:17','127.0.0.1'),(41,3,'2017-10-19 09:47:47','127.0.0.1'),(42,3,'2017-10-19 09:50:45','127.0.0.1'),(43,3,'2017-10-19 09:55:47','127.0.0.1'),(44,3,'2017-10-19 09:57:58','127.0.0.1'),(45,3,'2017-10-19 09:59:27','127.0.0.1'),(46,3,'2017-10-19 10:00:26','127.0.0.1'),(47,3,'2017-10-19 10:07:54','127.0.0.1'),(48,3,'2017-10-19 10:08:26','127.0.0.1'),(49,3,'2017-10-19 10:18:56','127.0.0.1'),(50,3,'2017-10-19 10:21:08','127.0.0.1'),(51,3,'2017-10-19 10:21:49','127.0.0.1'),(52,3,'2017-10-19 10:25:37','127.0.0.1'),(53,3,'2017-10-19 20:39:57','127.0.0.1'),(54,3,'2017-10-19 20:40:07','127.0.0.1'),(55,1,'2017-10-19 20:40:38','192.168.0.2'),(56,1,'2017-10-19 20:41:47','192.168.0.2'),(57,1,'2017-10-20 09:21:56','127.0.0.1'),(58,1,'2017-10-20 09:28:52','192.168.0.2'),(59,1,'2017-10-20 09:29:48','127.0.0.1'),(60,1,'2017-10-20 09:30:31','127.0.0.1'),(61,1,'2017-10-20 10:09:03','127.0.0.1'),(62,1,'2017-10-20 10:09:35','127.0.0.1'),(63,1,'2017-10-20 10:38:27','127.0.0.1'),(64,1,'2017-10-20 10:38:47','127.0.0.1'),(65,1,'2017-10-20 10:38:57','127.0.0.1'),(66,1,'2017-10-20 10:43:37','192.168.0.2'),(67,1,'2017-10-20 10:46:13','192.168.0.2'),(68,1,'2017-10-20 16:58:58','0:0:0:0:0:0:0:1'),(69,3,'2017-10-20 17:16:37','127.0.0.1'),(70,3,'2017-10-20 17:21:53','127.0.0.1'),(71,1,'2017-10-20 17:33:15','0:0:0:0:0:0:0:1'),(72,1,'2017-10-20 17:34:30','0:0:0:0:0:0:0:1'),(73,1,'2017-10-20 17:35:42','0:0:0:0:0:0:0:1'),(74,1,'2017-10-20 18:04:12','0:0:0:0:0:0:0:1'),(75,1,'2017-10-21 12:08:56','0:0:0:0:0:0:0:1'),(76,1,'2017-10-21 14:16:48','0:0:0:0:0:0:0:1'),(77,1,'2017-10-21 14:53:10','0:0:0:0:0:0:0:1'),(78,1,'2017-10-21 14:55:17','0:0:0:0:0:0:0:1'),(79,1,'2017-10-21 14:57:40','0:0:0:0:0:0:0:1'),(80,1,'2017-10-21 15:01:02','0:0:0:0:0:0:0:1'),(81,1,'2017-10-21 15:02:42','0:0:0:0:0:0:0:1'),(82,1,'2017-10-21 15:39:30','0:0:0:0:0:0:0:1'),(83,3,'2017-10-21 21:07:37','127.0.0.1'),(84,3,'2017-10-21 21:16:13','127.0.0.1'),(85,1,'2017-10-22 11:57:34','0:0:0:0:0:0:0:1'),(86,3,'2017-10-22 16:01:37','127.0.0.1'),(87,3,'2017-10-22 16:05:19','127.0.0.1'),(88,3,'2017-10-22 16:33:11','127.0.0.1'),(89,1,'2017-10-22 16:34:12','127.0.0.1'),(90,3,'2017-10-22 16:34:50','127.0.0.1'),(91,1,'2017-10-22 16:35:33','0:0:0:0:0:0:0:1'),(92,1,'2017-10-22 16:47:25','0:0:0:0:0:0:0:1'),(93,1,'2017-10-22 16:48:37','0:0:0:0:0:0:0:1'),(94,1,'2017-10-22 16:50:48','0:0:0:0:0:0:0:1'),(95,1,'2017-10-23 09:11:59','0:0:0:0:0:0:0:1'),(96,1,'2017-10-23 11:31:22','0:0:0:0:0:0:0:1'),(97,1,'2017-10-23 11:32:09','0:0:0:0:0:0:0:1'),(98,1,'2017-10-23 11:34:02','0:0:0:0:0:0:0:1'),(99,1,'2017-10-23 13:45:41','0:0:0:0:0:0:0:1'),(100,1,'2017-10-23 14:28:11','0:0:0:0:0:0:0:1'),(101,1,'2017-10-23 14:28:54','0:0:0:0:0:0:0:1'),(103,1,'2017-10-24 15:25:03','0:0:0:0:0:0:0:1'),(104,1,'2017-10-24 15:29:23','127.0.0.1'),(105,1,'2017-10-24 15:33:43','127.0.0.1'),(106,1,'2017-10-24 15:34:09','0:0:0:0:0:0:0:1'),(107,1,'2017-10-24 15:40:57','0:0:0:0:0:0:0:1'),(108,1,'2017-10-24 15:51:44','127.0.0.1'),(109,1,'2017-10-24 15:55:47','127.0.0.1'),(110,1,'2017-10-24 15:55:58','0:0:0:0:0:0:0:1'),(111,1,'2017-10-24 15:59:37','0:0:0:0:0:0:0:1'),(112,1,'2017-10-24 16:02:18','0:0:0:0:0:0:0:1'),(113,1,'2017-10-24 16:03:41','0:0:0:0:0:0:0:1'),(114,1,'2017-10-24 19:36:17','0:0:0:0:0:0:0:1'),(115,1,'2017-10-24 19:48:02','0:0:0:0:0:0:0:1'),(116,1,'2017-10-24 19:49:08','0:0:0:0:0:0:0:1'),(117,1,'2017-10-24 19:49:51','0:0:0:0:0:0:0:1'),(118,1,'2017-10-24 19:50:29','0:0:0:0:0:0:0:1'),(119,1,'2017-10-24 20:42:52','0:0:0:0:0:0:0:1'),(120,1,'2017-10-24 20:58:09','0:0:0:0:0:0:0:1'),(121,1,'2017-10-24 21:04:09','0:0:0:0:0:0:0:1'),(122,1,'2017-10-24 21:07:29','0:0:0:0:0:0:0:1'),(123,1,'2017-10-24 21:52:02','0:0:0:0:0:0:0:1'),(124,1,'2017-10-24 21:59:08','0:0:0:0:0:0:0:1'),(125,1,'2017-10-24 22:00:57','0:0:0:0:0:0:0:1'),(126,1,'2017-10-24 22:29:55','0:0:0:0:0:0:0:1'),(127,1,'2017-10-24 22:31:13','0:0:0:0:0:0:0:1'),(128,1,'2017-10-24 22:38:05','0:0:0:0:0:0:0:1'),(129,1,'2017-10-25 00:06:18','0:0:0:0:0:0:0:1'),(130,1,'2017-10-25 00:08:41','0:0:0:0:0:0:0:1'),(131,1,'2017-10-25 00:16:48','0:0:0:0:0:0:0:1'),(132,1,'2017-10-25 00:18:03','0:0:0:0:0:0:0:1'),(133,1,'2017-10-25 00:25:13','0:0:0:0:0:0:0:1'),(134,1,'2017-10-25 00:27:03','0:0:0:0:0:0:0:1'),(135,1,'2017-10-25 00:29:20','0:0:0:0:0:0:0:1'),(136,1,'2017-10-25 01:00:19','0:0:0:0:0:0:0:1'),(137,1,'2017-10-25 01:03:47','0:0:0:0:0:0:0:1'),(138,1,'2017-10-25 01:05:30','0:0:0:0:0:0:0:1'),(139,2,'2017-10-25 01:08:42','0:0:0:0:0:0:0:1'),(140,1,'2017-10-25 08:48:06','0:0:0:0:0:0:0:1'),(141,1,'2017-10-25 08:50:51','0:0:0:0:0:0:0:1'),(142,1,'2017-10-25 08:52:49','0:0:0:0:0:0:0:1'),(143,1,'2017-10-25 08:56:59','0:0:0:0:0:0:0:1'),(144,1,'2017-10-25 08:57:48','0:0:0:0:0:0:0:1'),(145,1,'2017-10-25 09:06:16','0:0:0:0:0:0:0:1'),(146,1,'2017-10-25 09:54:35','0:0:0:0:0:0:0:1'),(147,1,'2017-10-25 10:52:06','0:0:0:0:0:0:0:1'),(148,1,'2017-10-25 10:58:26','0:0:0:0:0:0:0:1'),(149,1,'2017-10-25 11:04:57','0:0:0:0:0:0:0:1'),(150,1,'2017-10-25 11:08:41','0:0:0:0:0:0:0:1'),(151,1,'2017-10-25 11:16:57','0:0:0:0:0:0:0:1'),(152,1,'2017-10-25 11:27:39','0:0:0:0:0:0:0:1'),(153,1,'2017-10-25 11:34:35','0:0:0:0:0:0:0:1'),(154,1,'2017-10-25 12:35:58','0:0:0:0:0:0:0:1'),(155,1,'2017-10-25 12:37:17','0:0:0:0:0:0:0:1'),(156,1,'2017-10-25 12:43:30','0:0:0:0:0:0:0:1'),(157,1,'2017-10-25 12:45:48','0:0:0:0:0:0:0:1'),(158,1,'2017-10-25 12:49:13','0:0:0:0:0:0:0:1'),(159,1,'2017-10-25 12:53:55','0:0:0:0:0:0:0:1'),(160,1,'2017-10-25 13:14:32','0:0:0:0:0:0:0:1'),(161,1,'2017-10-25 13:28:28','0:0:0:0:0:0:0:1'),(162,1,'2017-10-25 13:31:47','0:0:0:0:0:0:0:1'),(163,1,'2017-10-25 13:38:21','0:0:0:0:0:0:0:1'),(164,1,'2017-10-25 13:49:38','0:0:0:0:0:0:0:1'),(165,1,'2017-10-25 14:10:15','0:0:0:0:0:0:0:1'),(166,1,'2017-10-25 14:14:41','0:0:0:0:0:0:0:1'),(167,1,'2017-10-25 14:25:54','0:0:0:0:0:0:0:1'),(168,1,'2017-10-25 14:46:42','0:0:0:0:0:0:0:1'),(169,1,'2017-10-25 14:53:04','0:0:0:0:0:0:0:1'),(170,1,'2017-10-25 14:55:28','0:0:0:0:0:0:0:1'),(171,1,'2017-10-25 14:56:37','0:0:0:0:0:0:0:1'),(172,1,'2017-10-25 15:00:09','0:0:0:0:0:0:0:1'),(173,1,'2017-10-25 15:01:25','0:0:0:0:0:0:0:1'),(174,1,'2017-10-25 15:02:55','0:0:0:0:0:0:0:1'),(175,1,'2017-10-25 15:05:09','0:0:0:0:0:0:0:1'),(176,1,'2017-10-25 15:51:19','0:0:0:0:0:0:0:1'),(177,1,'2017-10-25 15:52:07','0:0:0:0:0:0:0:1'),(178,1,'2017-10-25 16:36:48','0:0:0:0:0:0:0:1'),(179,1,'2017-10-25 17:05:37','0:0:0:0:0:0:0:1'),(180,1,'2017-10-25 17:09:17','0:0:0:0:0:0:0:1'),(181,1,'2017-10-25 17:21:15','0:0:0:0:0:0:0:1'),(182,1,'2017-10-25 17:24:27','0:0:0:0:0:0:0:1'),(183,1,'2017-10-25 17:27:52','0:0:0:0:0:0:0:1'),(184,1,'2017-10-25 17:39:11','0:0:0:0:0:0:0:1'),(185,1,'2017-10-25 18:00:47','0:0:0:0:0:0:0:1'),(186,1,'2017-10-25 18:06:20','0:0:0:0:0:0:0:1'),(187,2,'2017-10-25 18:07:06','0:0:0:0:0:0:0:1'),(188,1,'2017-10-25 18:07:53','0:0:0:0:0:0:0:1'),(189,1,'2017-10-25 18:09:39','0:0:0:0:0:0:0:1'),(190,1,'2017-10-25 18:11:10','0:0:0:0:0:0:0:1'),(191,1,'2017-10-25 19:02:06','0:0:0:0:0:0:0:1'),(192,1,'2017-10-25 19:05:06','0:0:0:0:0:0:0:1'),(193,1,'2017-10-25 19:10:56','0:0:0:0:0:0:0:1'),(194,1,'2017-10-25 19:20:16','0:0:0:0:0:0:0:1'),(195,1,'2017-10-25 19:36:23','0:0:0:0:0:0:0:1'),(196,1,'2017-10-25 20:00:20','0:0:0:0:0:0:0:1'),(197,1,'2017-10-25 20:01:40','0:0:0:0:0:0:0:1'),(198,1,'2017-10-25 20:07:04','0:0:0:0:0:0:0:1'),(199,1,'2017-10-25 20:17:49','0:0:0:0:0:0:0:1'),(200,1,'2017-10-25 20:18:45','0:0:0:0:0:0:0:1'),(201,1,'2017-10-25 20:24:20','0:0:0:0:0:0:0:1'),(202,1,'2017-10-25 20:25:48','0:0:0:0:0:0:0:1'),(203,1,'2017-10-25 20:33:12','0:0:0:0:0:0:0:1'),(204,1,'2017-10-25 20:58:17','0:0:0:0:0:0:0:1'),(205,1,'2017-10-25 20:59:59','0:0:0:0:0:0:0:1'),(206,1,'2017-10-25 21:01:21','0:0:0:0:0:0:0:1'),(207,1,'2017-10-25 21:02:45','0:0:0:0:0:0:0:1'),(208,1,'2017-10-25 21:07:45','0:0:0:0:0:0:0:1'),(209,1,'2017-10-25 21:10:55','0:0:0:0:0:0:0:1'),(210,1,'2017-10-25 21:15:45','0:0:0:0:0:0:0:1'),(211,1,'2017-10-25 21:38:00','0:0:0:0:0:0:0:1'),(212,1,'2017-10-25 21:55:13','0:0:0:0:0:0:0:1'),(213,1,'2017-10-25 22:15:13','0:0:0:0:0:0:0:1'),(214,1,'2017-10-25 22:38:57','0:0:0:0:0:0:0:1'),(215,1,'2017-10-25 22:39:54','0:0:0:0:0:0:0:1'),(216,1,'2017-10-25 22:43:29','0:0:0:0:0:0:0:1'),(217,1,'2017-10-25 22:45:00','0:0:0:0:0:0:0:1'),(218,1,'2017-10-25 23:13:23','0:0:0:0:0:0:0:1'),(219,1,'2017-10-25 23:18:36','0:0:0:0:0:0:0:1'),(220,1,'2017-10-25 23:19:39','0:0:0:0:0:0:0:1'),(221,1,'2017-10-25 23:45:13','0:0:0:0:0:0:0:1'),(222,1,'2017-10-25 23:46:22','0:0:0:0:0:0:0:1'),(223,1,'2017-10-26 13:35:56','0:0:0:0:0:0:0:1'),(224,2,'2017-10-26 13:38:38','0:0:0:0:0:0:0:1'),(225,1,'2017-10-26 13:39:28','0:0:0:0:0:0:0:1'),(226,2,'2017-10-26 13:39:43','0:0:0:0:0:0:0:1'),(227,2,'2017-10-26 13:40:25','0:0:0:0:0:0:0:1'),(228,1,'2017-10-26 13:40:34','0:0:0:0:0:0:0:1'),(229,2,'2017-10-26 14:07:39','0:0:0:0:0:0:0:1'),(230,1,'2017-10-26 14:09:36','0:0:0:0:0:0:0:1'),(231,2,'2017-10-26 14:10:00','0:0:0:0:0:0:0:1'),(232,1,'2017-10-26 14:52:08','0:0:0:0:0:0:0:1'),(233,1,'2017-10-26 15:00:50','0:0:0:0:0:0:0:1'),(234,2,'2017-10-26 15:03:25','0:0:0:0:0:0:0:1'),(235,1,'2017-10-26 15:04:01','0:0:0:0:0:0:0:1'),(236,2,'2017-10-26 15:04:19','0:0:0:0:0:0:0:1'),(238,1,'2017-10-29 11:53:16','0:0:0:0:0:0:0:1'),(239,1,'2017-11-03 13:34:34','0:0:0:0:0:0:0:1');
/*!40000 ALTER TABLE `t_login_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_message`
--

DROP TABLE IF EXISTS `t_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `content` varchar(100) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `up_count` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL,
  `to_user` varchar(30) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message`
--

LOCK TABLES `t_message` WRITE;
/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` VALUES (28,1,'2017-10-24 22:01:24','1231231',0,0,0,'','123123'),(29,1,'2017-10-24 22:01:40','1231231',0,0,0,'','123123'),(41,1,'2017-10-25 09:16:51','1.对于不同的SoC，ROM要进行很大的改动才能跑起来。但是如果是相同品牌的SoC，改动相对而言就要少很多。 2.海思麒麟就华为和荣耀两家在用。而除了',2,1,0,'','为什么华为手机内核开源了但是几乎没有原生安卓的Rom？'),(42,1,'2017-10-25 09:56:55','asfaszxv',0,0,0,'','dsaf'),(43,1,'2017-10-25 09:57:15','safsadfsa',0,0,0,'','东风破斯卡迪篇幅、'),(44,1,'2017-10-25 11:27:53','',0,0,0,'','dsafsd'),(45,1,'2017-10-25 12:38:23','sasfdsaf',0,0,0,'','qewrwq'),(46,1,'2017-10-25 12:47:24','sadfsdafsda',1,1,0,'','sadfsad'),(47,1,'2017-10-25 12:47:58','ssssssssssssssssss',1,2,0,'','sssss'),(48,1,'2017-10-25 12:49:56','qwrqwer',1,1,0,'','qwer'),(60,1,'2017-10-25 14:29:16','sadfsdafsadf',0,0,48,'',NULL),(61,1,'2017-10-25 14:29:33','sdafsafsadfsad',0,0,46,'',NULL),(64,1,'2017-10-25 15:03:24','QERWQEQWE',0,0,47,'',NULL),(77,1,'2017-10-25 23:20:03','撒范德萨发',0,0,41,'',NULL),(78,1,'2017-10-25 23:20:33','sadfsa',0,0,41,'',NULL),(81,1,'2017-10-29 11:53:51','jk;sdjfskfjskk',1,1,0,'','jiwqjfi'),(82,1,'2017-11-03 13:35:29','hellow',0,0,81,'',NULL);
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `permissions` int(11) NOT NULL DEFAULT '3',
  `password` varchar(32) NOT NULL,
  `last_visit` datetime DEFAULT NULL,
  `last_ip` varchar(23) DEFAULT NULL,
  `roles` enum('MEMBER','ADMIN') NOT NULL DEFAULT 'MEMBER',
  `credits` int(11) NOT NULL DEFAULT '3',
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'admin',7,'123456','2017-11-03 13:34:34','0:0:0:0:0:0:0:1','ADMIN',5,'123456@pingan.com'),(2,'ls',3,'1234567','2017-10-26 15:04:19','0:0:0:0:0:0:0:1','MEMBER',5,'123456@pingan.com'),(3,'111',7,'627321','2017-10-22 16:34:50','127.0.0.1','MEMBER',5,'123456@pingan.com'),(4,'sdfsadf',3,'sdafsafsa',NULL,NULL,'MEMBER',3,'123456@pingan.com'),(5,'1234',3,'123456',NULL,NULL,'MEMBER',3,'1234@121'),(6,'1234',3,'123',NULL,NULL,'MEMBER',3,'1234@121.com'),(7,'12345',3,'23123',NULL,NULL,'MEMBER',3,'1234@121.com');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-14 20:59:17
