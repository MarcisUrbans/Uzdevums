-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: uzdevums
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `answer_text` varchar(100) NOT NULL,
  `correct_answer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `question_index` (`question_id`),
  CONSTRAINT `answers_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,1,'5',0),(2,1,'9',0),(3,1,'7',0),(4,1,'6',1),(5,2,'6',0),(6,2,'1',0),(7,2,'0',1),(8,2,'4',0),(9,3,'4',0),(10,3,'2',0),(11,3,'3',0),(12,3,'1',1),(13,4,'0',1),(14,4,'4',0),(15,4,'8',0),(16,4,'12',0);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `test_id` int(11) NOT NULL,
  `question_text` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `test_index` (`test_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1,'Cik ir 2+2*2 ?'),(2,1,'Cik ir 3(2-1/0.5) ?'),(3,2,'Cik ir 2^(2-1/0.5) ?'),(4,2,'Cik ir -2^2+4 ?');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'Tests1'),(2,'Tests2');
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_answers`
--

DROP TABLE IF EXISTS `user_answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_answers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answers_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_name_id` (`user_name_id`),
  KEY `question_id` (`question_id`),
  KEY `answers_id` (`answers_id`),
  CONSTRAINT `user_answers_ibfk_1` FOREIGN KEY (`user_name_id`) REFERENCES `user_name` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_answers_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_answers_ibfk_3` FOREIGN KEY (`answers_id`) REFERENCES `answers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_answers`
--

LOCK TABLES `user_answers` WRITE;
/*!40000 ALTER TABLE `user_answers` DISABLE KEYS */;
INSERT INTO `user_answers` VALUES (1,1,1,1),(3,2,3,10),(5,3,1,1),(7,4,3,9),(9,5,1,1),(11,6,1,1),(13,7,3,9),(15,8,2,1),(17,9,4,9),(21,13,2,1),(23,14,1,1),(25,15,1,1),(28,16,1,1),(30,17,3,9),(32,18,1,1),(34,19,3,9),(36,20,3,9),(38,21,3,9),(40,22,3,9),(42,23,1,1),(44,24,3,9),(46,27,3,9),(48,29,1,4),(50,30,1,1),(52,31,3,9),(55,32,1,5),(56,33,3,9),(57,33,4,13),(58,34,1,1),(59,34,2,5),(60,35,1,4),(61,35,2,6),(62,36,3,9),(63,36,4,13),(64,37,1,4),(65,37,2,5),(66,38,3,12),(67,38,4,13),(68,39,1,4),(69,39,2,5),(70,40,1,4),(71,40,2,7),(72,41,1,4),(73,41,2,7),(74,42,3,9),(75,42,4,16),(76,43,1,1),(77,43,2,7),(78,44,3,12),(79,44,4,13),(80,45,1,4),(81,45,2,6),(82,46,1,4),(83,46,2,7),(84,47,3,12),(85,47,4,13),(86,48,1,4),(87,48,2,8),(88,49,1,4),(89,49,2,8),(90,50,1,4),(91,50,2,7),(92,51,1,4),(93,51,2,7),(94,52,1,4),(95,52,2,7),(96,53,1,4),(97,53,2,7),(98,54,1,4),(99,54,2,7),(100,55,1,2),(101,55,2,6),(102,56,1,1),(103,56,2,5),(104,58,1,1),(105,58,2,5),(106,59,1,1),(107,59,2,5),(108,60,1,4),(109,60,2,7),(110,61,1,1),(111,61,2,8),(112,62,1,4),(113,62,2,7),(114,63,1,4),(115,63,2,6),(116,64,1,4),(117,64,2,6),(118,65,1,4),(119,65,2,6),(120,66,1,4),(121,66,2,8),(122,67,1,4),(123,67,2,7),(124,68,1,1),(125,68,2,6),(126,69,1,1),(127,69,2,6),(128,70,1,1),(129,70,2,5),(130,71,1,4),(131,71,2,5),(132,72,1,4),(133,72,2,7),(134,73,1,4),(135,73,2,7),(136,74,1,4),(137,74,2,7),(138,75,1,1),(139,75,2,5),(140,76,1,1),(141,76,2,5),(142,77,1,4),(143,77,2,7),(144,78,1,4),(145,78,2,6),(146,79,1,4),(147,79,2,7),(148,80,3,12),(149,80,4,13),(150,81,1,4),(151,81,2,7),(152,82,1,4),(153,82,2,7),(154,83,3,12),(155,83,4,13),(156,84,1,1),(157,84,2,5),(158,85,1,4),(159,85,2,7),(160,86,3,12),(161,86,4,13),(162,87,1,3),(163,87,2,8),(164,88,1,4),(165,88,2,5),(166,89,1,4),(167,89,2,7);
/*!40000 ALTER TABLE `user_answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_name`
--

DROP TABLE IF EXISTS `user_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `test_id` int(11) NOT NULL,
  `result` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `test_id` (`test_id`),
  CONSTRAINT `user_name_ibfk_1` FOREIGN KEY (`test_id`) REFERENCES `tests` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_name`
--

LOCK TABLES `user_name` WRITE;
/*!40000 ALTER TABLE `user_name` DISABLE KEYS */;
INSERT INTO `user_name` VALUES (1,'what',1,NULL),(2,'asd',2,NULL),(3,'asd',1,NULL),(4,'xc',2,NULL),(5,'gf',1,NULL),(6,'hjg',1,NULL),(7,'nb',2,NULL),(8,'vc',1,NULL),(9,'dfg',2,NULL),(10,'df',1,NULL),(11,'cvvc',1,NULL),(12,'cv',1,NULL),(13,'ko',1,NULL),(14,'bbb',1,NULL),(15,'nbv',1,NULL),(16,'gg',1,NULL),(17,'sdfs',2,NULL),(18,'xx',1,NULL),(19,'lkl',2,NULL),(20,'nb',2,NULL),(21,'vv',2,NULL),(22,'zxc',2,NULL),(23,'zbn',1,NULL),(24,'mmm',2,NULL),(25,'poo',2,NULL),(26,'xc',2,NULL),(27,'aaa',2,NULL),(28,'vbcvx',1,NULL),(29,'vbcvx',1,NULL),(30,'ccc',1,NULL),(31,'cvb',2,NULL),(32,'hgb',1,NULL),(33,'xcc',2,NULL),(34,'iii',1,NULL),(35,'Marcis',1,NULL),(36,'wait',2,NULL),(37,'vbb',1,NULL),(38,'nbn',2,NULL),(39,'mnm',1,NULL),(40,'vgg',1,NULL),(41,'yu',1,NULL),(42,'nb',2,NULL),(43,'bbb',1,NULL),(44,'Anna',2,NULL),(45,'Ivo',1,NULL),(46,'cv',1,NULL),(47,'bvbcv',2,NULL),(48,'gg',1,NULL),(49,'hh',1,NULL),(50,'cc',1,NULL),(51,'mm',1,NULL),(52,'kk',1,NULL),(53,'ll',1,NULL),(54,'jj',1,NULL),(55,'aaa',1,NULL),(56,'XZ',1,NULL),(57,'qq',1,NULL),(58,'qq',1,NULL),(59,'abc',1,NULL),(60,'mmm',1,NULL),(61,'hh',1,NULL),(62,'rr',1,NULL),(63,'zz',1,NULL),(64,'zzz',1,NULL),(65,'asd',1,NULL),(66,'dsd',1,NULL),(67,'ops',1,NULL),(68,'qwe',1,NULL),(69,'ggff',1,NULL),(70,'za',1,NULL),(71,'az',1,NULL),(72,'sss',1,NULL),(73,'ttt',1,NULL),(74,'fghfg',1,NULL),(75,'kjhgfd',1,NULL),(76,'ppo',1,NULL),(77,'qwee',1,NULL),(78,'ffff',1,NULL),(79,'Artūrs',1,NULL),(80,'Mārcis',2,NULL),(81,'Mārcis',1,NULL),(82,'Ivans',1,1),(83,'ccc',2,1),(84,'ty',1,1),(85,'tyy',1,1),(86,'lp',2,2),(87,'ffdd',1,0),(88,'12',1,1),(89,'aāasd',1,2);
/*!40000 ALTER TABLE `user_name` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-02-06 17:51:11
