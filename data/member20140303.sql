-- MySQL dump 10.11
--
-- Host: localhost    Database: membermanagement
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log

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
-- Table structure for table `tblconsume`
--

DROP TABLE IF EXISTS `tblconsume`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblconsume` (
  `conid` int(11) NOT NULL auto_increment,
  `conmphone` varchar(11) NOT NULL,
  `conemid` int(11) NOT NULL,
  `conserid` int(11) NOT NULL,
  `condate` date default NULL,
  `conagio` int(11) NOT NULL,
  `conmoney` double NOT NULL,
  `conremark` longtext,
  PRIMARY KEY  (`conid`),
  UNIQUE KEY `UQ_conid` (`conid`),
  KEY `conserid` (`conserid`),
  CONSTRAINT `FK_conserid_serid` FOREIGN KEY (`conserid`) REFERENCES `tblservices` (`serid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblconsume`
--

LOCK TABLES `tblconsume` WRITE;
/*!40000 ALTER TABLE `tblconsume` DISABLE KEYS */;
INSERT INTO `tblconsume` VALUES (1,'13072119035',24,10,'2014-03-03',95,23,''),(2,'13072119035',24,10,'2014-03-03',95,45,'');
/*!40000 ALTER TABLE `tblconsume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblemployee`
--

DROP TABLE IF EXISTS `tblemployee`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblemployee` (
  `emid` int(11) NOT NULL auto_increment,
  `emname` varchar(20) NOT NULL,
  `emsex` varchar(6) NOT NULL,
  `emage` int(11) NOT NULL,
  `emphone` varchar(11) NOT NULL,
  `emtel` varchar(20) NOT NULL,
  `emaddr` varchar(50) default NULL,
  `embirth` date default NULL,
  `emcard` varchar(50) NOT NULL,
  `emindate` date default NULL,
  `emjob` varchar(30) NOT NULL,
  `manage` varchar(30) default NULL,
  `managepass` varchar(50) default NULL,
  PRIMARY KEY  (`emid`),
  UNIQUE KEY `UQ_emname` (`emname`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblemployee`
--

LOCK TABLES `tblemployee` WRITE;
/*!40000 ALTER TABLE `tblemployee` DISABLE KEYS */;
INSERT INTO `tblemployee` VALUES (24,'admin','男',32,'13072118034','sdf','sdfja','2014-03-17','999999999999999','2014-03-21','学徒','admin','1');
/*!40000 ALTER TABLE `tblemployee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmember`
--

DROP TABLE IF EXISTS `tblmember`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblmember` (
  `mid` int(11) NOT NULL auto_increment,
  `mpass` varchar(20) NOT NULL,
  `mphone` varchar(11) NOT NULL,
  `mname` varchar(20) NOT NULL,
  `msex` varchar(10) NOT NULL,
  `mage` int(11) default NULL,
  `mbirth` date default NULL,
  `maddr` varchar(200) default NULL,
  `mindate` date default NULL,
  `maddmoney` int(11) NOT NULL,
  `mintegral` int(11) default NULL,
  PRIMARY KEY  (`mid`),
  UNIQUE KEY `UQ_mphone` (`mphone`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblmember`
--

LOCK TABLES `tblmember` WRITE;
/*!40000 ALTER TABLE `tblmember` DISABLE KEYS */;
INSERT INTO `tblmember` VALUES (1,'****','13072119035','梁小满','男',34,'2014-03-21','shagn','2014-03-03',34,0);
/*!40000 ALTER TABLE `tblmember` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblproduct`
--

DROP TABLE IF EXISTS `tblproduct`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblproduct` (
  `pid` int(11) NOT NULL auto_increment COMMENT '入库编号',
  `prid` varchar(15) NOT NULL COMMENT '商品编号',
  `pname` varchar(50) NOT NULL COMMENT '商品名称',
  `pcount` int(11) NOT NULL default '0' COMMENT '商品数量',
  `pperprice` double NOT NULL default '0' COMMENT '入库单价',
  `pfrom` varchar(100) default NULL COMMENT '商品来源',
  `pby` varchar(30) default NULL COMMENT '采购人',
  `penterdate` date NOT NULL COMMENT '采购日期',
  `pindate` datetime NOT NULL COMMENT '入库日期',
  `pexpiry` date default NULL COMMENT '有效期',
  PRIMARY KEY  (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblproduct`
--

LOCK TABLES `tblproduct` WRITE;
/*!40000 ALTER TABLE `tblproduct` DISABLE KEYS */;
INSERT INTO `tblproduct` VALUES (107,'E1002332','好迪润肤乳',23,12.34,'梁小满','老金','2013-12-18','2014-02-26 23:01:49','2014-02-12');
/*!40000 ALTER TABLE `tblproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblservices`
--

DROP TABLE IF EXISTS `tblservices`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tblservices` (
  `serid` int(11) NOT NULL auto_increment,
  `sername` varchar(50) NOT NULL,
  `sermoney` double NOT NULL,
  `sertype` varchar(50) default NULL,
  PRIMARY KEY  (`serid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tblservices`
--

LOCK TABLES `tblservices` WRITE;
/*!40000 ALTER TABLE `tblservices` DISABLE KEYS */;
INSERT INTO `tblservices` VALUES (5,'洗发',2,'附加项目'),(6,'烫发',10,'附加项目'),(7,'剪发',12,'附加项目'),(10,'染发',30,'常规项目'),(11,'剪发',12,'常规项目');
/*!40000 ALTER TABLE `tblservices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-03 15:08:20
