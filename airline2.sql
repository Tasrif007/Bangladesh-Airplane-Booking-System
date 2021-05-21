CREATE DATABASE  IF NOT EXISTS `airline2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `airline2`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: airline2
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `airplane`
--

DROP TABLE IF EXISTS `airplane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airplane` (
  `ID` varchar(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `company` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airplane`
--

LOCK TABLES `airplane` WRITE;
/*!40000 ALTER TABLE `airplane` DISABLE KEYS */;
INSERT INTO `airplane` VALUES ('1170','B738',' Biman Bangladesh Airlines'),('1201','A320','US-Bangla Airlines');
/*!40000 ALTER TABLE `airplane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `airport`
--

DROP TABLE IF EXISTS `airport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `airport` (
  `code` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('HSIA',' Hazrat Shahjalal International Airport','Dhaka','Dhaka','Bangladesh'),
('DIA','Dubai International Airport','Garhoud','Dubai','UAE'),
('BCIA','Beijing Capital International Airport','Chaoyang-Shunyi','Beijing','CHINA'),
('CIA','Changi International Airport','Changi','Singapore','Singapore'),
('LAIA','Los Angeles International Airport','Los Angeles ','California','USA');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `time` datetime NOT NULL,
  `date` date NOT NULL,
  `flightno` varchar(10) NOT NULL,
  `username` varchar(45) NOT NULL,
  `classtype` varchar(20) NOT NULL,
  `paid` int(1) DEFAULT '0',
  PRIMARY KEY (`ID`,`flightno`),
  KEY `username_idx` (`username`),
  KEY `classname_idx` (`classtype`),
  KEY `flightno_idx` (`flightno`,`classtype`),
  CONSTRAINT `flightno` FOREIGN KEY (`flightno`, `classtype`) REFERENCES `class` (`number`, `name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `username` FOREIGN KEY (`username`) REFERENCES `passanger` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'2021-04-01 17:22:00','2021-04-01','AA986','Tasrif','Economy',0);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `class` (
  `number` varchar(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `capacity` int(11) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`number`,`name`),
  KEY `number_idx` (`number`),
  CONSTRAINT `number` FOREIGN KEY (`number`) REFERENCES `flight` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES ('AA100','Business',5,500),('AA100','Economy',200,180),('AA120','Business',15,4000),('AA120','Economy',100,1000),('AA1512','Business',1,200),('AA1512','Economy',100,100),('AA180','Business',15,800),('AA180','Economy',100,240),('AA181','Business',10,200),('AA181','Economy',100,100),('AA600','Business',5,200),('AA600','Economy',80,50),('AA601','Business',3,300),('AA601','Economy',50,60),('AA6861','Business',3,100),('AA6861','Economy',100,40),('AA6927','Business',10,100),('AA6927','Economy',200,40),('AA80','Business',3,200),('AA80','Economy',80,50),('AA986','Business',8,400),('AA986','Economy',120,120);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flight` (
  `number` varchar(20) NOT NULL,
  `airplane_id` varchar(10) NOT NULL,
  `departure` varchar(10) NOT NULL,
  `d_time` time NOT NULL,
  `arrival` varchar(10) NOT NULL,
  `a_time` time NOT NULL,
  PRIMARY KEY (`number`),
  KEY `code_idx` (`departure`,`arrival`),
  KEY `airplaneid_idx` (`airplane_id`),
  KEY `arrival_idx` (`arrival`),
  CONSTRAINT `airplaneid` FOREIGN KEY (`airplane_id`) REFERENCES `airplane` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `arrival` FOREIGN KEY (`arrival`) REFERENCES `airport` (`code`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `departure` FOREIGN KEY (`departure`) REFERENCES `airport` (`code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flight`
--

LOCK TABLES `flight` WRITE;
/*!40000 ALTER TABLE `flight` DISABLE KEYS */;
INSERT INTO `flight` VALUES ('AA100','1201','HSIA','18:10:00','DIA','21:40:00'),
('AA120','1201','DIA','14:00:00','HSIA','20:40:00'),
('AA1512','1170','HSIA','13:40:00','BCIA','22:40:00'),
('AA180','1201','BCIA','07:35:00','HSIA','10:30:00'),
('AA181','1170','HSIA','22:10:00','CIA','04:20:00'),
('AA600','1201','CIA','15:00:00','HSIA','18:00:00'),
('AA601','1201','HSIA','20:00:00','LAIA','18:00:00'),
('AA6861','1201','LAIA','21:00:00','HSIA','16:00:00'),
('AA6927','1201','DIA','13:00:00','BCIA','20:00:00'),
('AA80','1170','BCIA','20:00:00','DIA','05:00:00'),
('AA986','1170','CIA','10:00:00','LAIA','14:00:00');
/*!40000 ALTER TABLE `flight` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passanger`
--

DROP TABLE IF EXISTS `passanger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `passanger` (
  `username` varchar(30) NOT NULL,
  `firstname` varchar(45) DEFAULT NULL,
  `middlename` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `cellphone` varchar(15) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passanger`
--

LOCK TABLES `passanger` WRITE;
/*!40000 ALTER TABLE `passanger` DISABLE KEYS */;
INSERT INTO `passanger` VALUES ('abc','abc',NULL,'','abc@utd.edu',NULL,NULL,NULL,'abcdef123456');
/*!40000 ALTER TABLE `passanger` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;


