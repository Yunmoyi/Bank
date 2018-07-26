-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: bank
-- ------------------------------------------------------
-- Server version	5.5.60

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
-- Table structure for table `tb_agetype`
--

DROP TABLE IF EXISTS `tb_agetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_agetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `agePeriod` varchar(255) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_agetype`
--

LOCK TABLES `tb_agetype` WRITE;
/*!40000 ALTER TABLE `tb_agetype` DISABLE KEYS */;
INSERT INTO `tb_agetype` VALUES (1,'<=20',0),(2,'20~30',0),(3,'30~40',0),(4,'40~50',0),(5,'50~60',0),(6,'>=60',0);
/*!40000 ALTER TABLE `tb_agetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_card`
--

DROP TABLE IF EXISTS `tb_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `deposit` double(18,3) NOT NULL,
  `region_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `region_id` (`region_id`),
  KEY `tb_card_ibfk_1` (`user_id`),
  CONSTRAINT `tb_card_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tb_customer` (`id`),
  CONSTRAINT `tb_card_ibfk_2` FOREIGN KEY (`region_id`) REFERENCES `tb_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_card`
--

LOCK TABLES `tb_card` WRITE;
/*!40000 ALTER TABLE `tb_card` DISABLE KEYS */;
INSERT INTO `tb_card` VALUES (1,'123456789012341111',1,500.000,1),(2,'123456789012342222',1,100000.000,1),(3,'123456789012343333',2,-4.000,6),(4,'123456789012344444',3,2323.000,1),(5,'123456789012345555',4,0.000,10);
/*!40000 ALTER TABLE `tb_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_city`
--

DROP TABLE IF EXISTS `tb_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`id`,`city`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_city`
--

LOCK TABLES `tb_city` WRITE;
/*!40000 ALTER TABLE `tb_city` DISABLE KEYS */;
INSERT INTO `tb_city` VALUES (1,'北京'),(2,'天津'),(3,'哈尔滨'),(4,'长春'),(5,'沈阳'),(6,'济南'),(7,'石家庄'),(8,'太原'),(9,'上海'),(10,'广州');
/*!40000 ALTER TABLE `tb_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cityconsumeforecast`
--

DROP TABLE IF EXISTS `tb_cityconsumeforecast`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_cityconsumeforecast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cityconsumeforecast`
--

LOCK TABLES `tb_cityconsumeforecast` WRITE;
/*!40000 ALTER TABLE `tb_cityconsumeforecast` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cityconsumeforecast` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_citypaypreference`
--

DROP TABLE IF EXISTS `tb_citypaypreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_citypaypreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) DEFAULT NULL,
  `payprefertypeId` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `payprefertypeId` FOREIGN KEY (`id`) REFERENCES `tb_paytype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_citypaypreference`
--

LOCK TABLES `tb_citypaypreference` WRITE;
/*!40000 ALTER TABLE `tb_citypaypreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_citypaypreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_citypaysumanalysis`
--

DROP TABLE IF EXISTS `tb_citypaysumanalysis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_citypaysumanalysis` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(20) DEFAULT NULL,
  `payMoney` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_citypaysumanalysis`
--

LOCK TABLES `tb_citypaysumanalysis` WRITE;
/*!40000 ALTER TABLE `tb_citypaysumanalysis` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_citypaysumanalysis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_consumerecord`
--

DROP TABLE IF EXISTS `tb_consumerecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_consumerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recordCustomerId` int(11) DEFAULT NULL,
  `recordCardId` int(11) DEFAULT NULL,
  `recordtime` timestamp NULL DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `purchase` varchar(20) DEFAULT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `recordCustomerId` FOREIGN KEY (`id`) REFERENCES `tb_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `recordCardId` FOREIGN KEY (`id`) REFERENCES `tb_card` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_consumerecord`
--

LOCK TABLES `tb_consumerecord` WRITE;
/*!40000 ALTER TABLE `tb_consumerecord` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_consumerecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customer`
--

DROP TABLE IF EXISTS `tb_customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` char(2) NOT NULL,
  `birthday` date DEFAULT NULL,
  `age` int(3) NOT NULL,
  `married` char(2) DEFAULT '否',
  `cardId` varchar(18) NOT NULL,
  `salary` varchar(45) DEFAULT NULL,
  `cityId` int(11) DEFAULT NULL,
  `carNum` int(11) DEFAULT '0',
  `houseNum` int(11) DEFAULT '0',
  `isDeleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `city_id` (`cityId`),
  CONSTRAINT `tb_customer_ibfk_1` FOREIGN KEY (`cityId`) REFERENCES `tb_city` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customer`
--

LOCK TABLES `tb_customer` WRITE;
/*!40000 ALTER TABLE `tb_customer` DISABLE KEYS */;
INSERT INTO `tb_customer` VALUES (1,'张三','男',NULL,25,'0','120011199304011234',NULL,1,0,0,0),(2,'李四','女',NULL,35,'0','120011198303011234',NULL,2,0,0,0),(3,'王五','男',NULL,45,'0','120011197303011234',NULL,3,0,0,0),(4,'赵六','女',NULL,45,'0','120011200005011234',NULL,3,0,0,0),(5,'秦七','男',NULL,35,'0','120011200005011234',NULL,2,0,0,0);
/*!40000 ALTER TABLE `tb_customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customerandagetype`
--

DROP TABLE IF EXISTS `tb_customerandagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customerandagetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age_customerId` int(11) NOT NULL,
  `agetypeId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `age_customerId` FOREIGN KEY (`id`) REFERENCES `tb_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `agetypeId` FOREIGN KEY (`id`) REFERENCES `tb_agetype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customerandagetype`
--

LOCK TABLES `tb_customerandagetype` WRITE;
/*!40000 ALTER TABLE `tb_customerandagetype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customerandagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_customerandpaytype`
--

DROP TABLE IF EXISTS `tb_customerandpaytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_customerandpaytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pay_customerId` int(11) NOT NULL,
  `paytypeId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `pay_customerId` FOREIGN KEY (`id`) REFERENCES `tb_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `paytypeId` FOREIGN KEY (`id`) REFERENCES `tb_paytype` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_customerandpaytype`
--

LOCK TABLES `tb_customerandpaytype` WRITE;
/*!40000 ALTER TABLE `tb_customerandpaytype` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_customerandpaytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paytype`
--

DROP TABLE IF EXISTS `tb_paytype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_paytype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `counter` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paytype`
--

LOCK TABLES `tb_paytype` WRITE;
/*!40000 ALTER TABLE `tb_paytype` DISABLE KEYS */;
INSERT INTO `tb_paytype` VALUES (1,'银行卡（线下）',0),(2,'微信',0),(3,'支付宝',0),(4,'信用卡',0),(5,'其他',0);
/*!40000 ALTER TABLE `tb_paytype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_product`
--

DROP TABLE IF EXISTS `tb_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `leastMoney` decimal(10,3) DEFAULT '0.000',
  `profit` decimal(10,2) DEFAULT '0.00',
  `cycle` int(11) DEFAULT '0',
  `riskLevel` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_product`
--

LOCK TABLES `tb_product` WRITE;
/*!40000 ALTER TABLE `tb_product` DISABLE KEYS */;
INSERT INTO `tb_product` VALUES (1,'活期储蓄',0.000,0.30,0,0),(2,'定期储蓄',0.000,1.35,91,0),(3,'定期储蓄',0.000,1.55,180,0),(4,'定期储蓄',0.000,1.75,365,0),(5,'定期储蓄',0.000,2.25,732,0),(6,'定期储蓄',0.000,2.75,1095,0),(7,'银行理财1',5.000,3.60,91,1),(8,'银行理财2',10.000,4.50,118,3),(9,'银行理财3',5.000,4.00,364,1),(10,'银行理财4',5.000,5.30,1827,2),(11,'基金1',0.100,3.64,0,0),(12,'基金2',0.100,2.75,0,0),(13,'基金3',0.500,5.48,0,0),(14,'基金4',0.000,5.67,0,0),(15,'私人现金管理1',50.000,3.45,0,2),(16,'私人现金管理2',50.000,3.00,0,1),(17,'私人现金管理3',100.000,3.40,0,2),(18,'债券1',0.000,3.69,1080,2),(19,'债券2',0.000,4.18,1800,4),(20,'债券3',0.000,4.09,2520,3),(21,'债券4',0.000,3.88,1800,2),(22,'养老理财1',5.000,5.50,60,1),(23,'养老理财2',10.000,4.85,180,1),(24,'养老理财3',15.000,6.60,270,1);
/*!40000 ALTER TABLE `tb_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user`
--

DROP TABLE IF EXISTS `tb_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `work_id` varchar(18) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `gender` char(2) NOT NULL,
  `age` int(3) NOT NULL,
  `post` varchar(18) DEFAULT NULL,
  `phone` varchar(18) DEFAULT NULL,
  `mail` varchar(255) DEFAULT NULL,
  `isDeleted` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user`
--

LOCK TABLES `tb_user` WRITE;
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` VALUES (1,'0901','123456','张天天','女',34,'总经理','17695796045','222@abc.com',0),(2,'0902','123456','乔悠扬','女',43,'经理','13224453453','123@abc.com',0),(3,'0903','123456','杨洋','男',33,'经理','13224453453','123@123.com',0),(4,'0904','123456','屈库拉','女',23,'经理','12345678912','abc@123.com',0),(5,'0905','123456','卞可','女',33,'经理','13821622663','123@abc.com',0),(6,'0906','123456','张靖','男',23,'职员','12345678912','abc@123.com',0),(7,'0907','123456','黄岐','男',23,'职员','12345678900','abc@111.com',0),(8,'0908','123456','王铮','男',44,'职员','12345678912','abc@123.com',0),(9,'0909','123456','王萍','女',33,'职员','12345678912','efg@123.com',0),(10,'0910','123456','李静','女',30,'职员','12345678923',NULL,0);
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-07-26  9:18:15
