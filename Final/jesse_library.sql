-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: jesse_final
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `all_friends`
--

DROP TABLE IF EXISTS `all_friends`;
/*!50001 DROP VIEW IF EXISTS `all_friends`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `all_friends` AS SELECT 
 1 AS `Friend_ID`,
 1 AS `Title`,
 1 AS `Book_ID`,
 1 AS `Friend_Fname`,
 1 AS `Friend_Lname`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `Author_ID` varchar(3) NOT NULL,
  `Author_Fname` varchar(20) DEFAULT NULL,
  `Author_Lname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Author_ID`),
  UNIQUE KEY `Author_ID_UNIQUE` (`Author_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES ('0','Jerry','Springer'),('1','Billy','Scapegoat'),('2','Chicken','Cacchiatore'),('3','Matt','Pandamiglio'),('4','Mike','Birbiglia');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `Cat_ID` int NOT NULL,
  `ISBN` char(10) NOT NULL,
  `Friend_Bought` varchar(2) NOT NULL,
  `Price` double(5,2) DEFAULT NULL,
  `Purchased_At` varchar(20) DEFAULT NULL,
  `Date_Bought` date DEFAULT NULL,
  PRIMARY KEY (`Cat_ID`),
  UNIQUE KEY `Cat_ID_UNIQUE` (`Cat_ID`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  KEY `Friend_Bought_idx` (`Friend_Bought`),
  CONSTRAINT `Friend_Bought` FOREIGN KEY (`Friend_Bought`) REFERENCES `friends` (`Friend_ID`),
  CONSTRAINT `ISBN` FOREIGN KEY (`ISBN`) REFERENCES `inventory` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (0,'1001100001','0',13.00,'Goodwill','1999-01-25'),(1,'9999999999','1',13.30,'Half Price Books','2005-02-28'),(2,'1001190000','1',1.15,'Sears Outlet','2009-12-15'),(3,'1001110111','0',14.50,'Barnes & Noble','2015-01-10'),(4,'1111111111','2',19.99,'Amazon','2019-03-14');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friends` (
  `Friend_ID` varchar(2) NOT NULL,
  `Friend_Lname` varchar(20) NOT NULL,
  `Friend_Fname` varchar(20) NOT NULL,
  PRIMARY KEY (`Friend_ID`),
  UNIQUE KEY `Friend_ID_UNIQUE` (`Friend_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES ('0','Jampson','Johnny'),('1','Frejard','Bon'),('2','Aikikio','Sarasuka'),('3','Honch','Phillip'),('4','Flores','Corazon');
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `Book_ID` varchar(4) NOT NULL,
  `ISBN` char(10) NOT NULL,
  `Title` varchar(30) NOT NULL,
  `Year` int DEFAULT NULL,
  `Pub_ID` varchar(3) NOT NULL,
  `Pages` int NOT NULL,
  `Category` varchar(20) NOT NULL,
  `Genre` varchar(10) DEFAULT NULL,
  `Subject` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`),
  UNIQUE KEY `Book_ID_UNIQUE` (`Book_ID`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`),
  KEY `Pub_ID_idx` (`Pub_ID`),
  CONSTRAINT `Pub_ID` FOREIGN KEY (`Pub_ID`) REFERENCES `publishers` (`Pub_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('0','1001100001','\"The Berry the Boy Eats\"',1999,'3',234,'Fiction','Mystery','Murder'),('1','9999999999','\"Jerry Spring: a Memoir\"',2005,'2',1902,'Non-Fiction','Biography','Memoir'),('2','1001190000','\"Filth\"',2014,'4',1,'Fiction','Fantasy','Assassins'),('3','1001110111','\"Insurrection\"',2011,'4',133,'Reference','Encycl.','Jan 6'),('4','1111111111','\"Cowboys In Clothing\"',2019,'1',215,'Fiction','Romance','Western');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `johnny_rentals`
--

DROP TABLE IF EXISTS `johnny_rentals`;
/*!50001 DROP VIEW IF EXISTS `johnny_rentals`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `johnny_rentals` AS SELECT 
 1 AS `FRIEND_ID`,
 1 AS `RENTAL_ID`,
 1 AS `TITLE`,
 1 AS `FRIEND_FNAME`,
 1 AS `FRIEND_LNAME`,
 1 AS `FRIEND_BOUGHT`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `publishers`
--

DROP TABLE IF EXISTS `publishers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishers` (
  `Pub_ID` varchar(3) NOT NULL,
  `Pub_Name` varchar(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  PRIMARY KEY (`Pub_ID`),
  UNIQUE KEY `Pub_ID_UNIQUE` (`Pub_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishers`
--

LOCK TABLES `publishers` WRITE;
/*!40000 ALTER TABLE `publishers` DISABLE KEYS */;
INSERT INTO `publishers` VALUES ('0','Randy Day Books','Norman, OK'),('1','Rainy Day Books','OKC, OK'),('2','Fancy Dance Books','Tulsa, OK'),('3','Bookshelf Books','Not Real, OK'),('4','Local Book Company','Faketown, OK');
/*!40000 ALTER TABLE `publishers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rentals`
--

DROP TABLE IF EXISTS `rentals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rentals` (
  `Rental_ID` varchar(4) NOT NULL,
  `Book_ID` varchar(4) NOT NULL,
  `Friend_ID` varchar(2) NOT NULL,
  `Check_Out` date DEFAULT NULL,
  `Check_In` date DEFAULT NULL,
  `Rental_Days` int GENERATED ALWAYS AS (if(`Check_In`,(`Check_In` - `Check_Out`),NULL)) STORED,
  PRIMARY KEY (`Rental_ID`),
  UNIQUE KEY `Rental_ID_UNIQUE` (`Rental_ID`),
  KEY `Book_ID_idx` (`Book_ID`),
  KEY `Friend_ID_idx` (`Friend_ID`),
  CONSTRAINT `Book_ID` FOREIGN KEY (`Book_ID`) REFERENCES `inventory` (`Book_ID`),
  CONSTRAINT `Friend_ID` FOREIGN KEY (`Friend_ID`) REFERENCES `friends` (`Friend_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rentals`
--

LOCK TABLES `rentals` WRITE;
/*!40000 ALTER TABLE `rentals` DISABLE KEYS */;
INSERT INTO `rentals` (`Rental_ID`, `Book_ID`, `Friend_ID`, `Check_Out`, `Check_In`) VALUES ('0','1','0','1996-12-03','1996-12-17'),('1','2','0','1997-12-01','1997-12-27'),('2','1','1','1997-04-01','1997-04-10'),('3','3','2','1998-03-25',NULL),('4','4','1','2001-09-13','2001-10-13');
/*!40000 ALTER TABLE `rentals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `writers_written`
--

DROP TABLE IF EXISTS `writers_written`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `writers_written` (
  `ISBN` char(10) NOT NULL,
  `Author_ID` varchar(3) NOT NULL,
  PRIMARY KEY (`ISBN`,`Author_ID`),
  KEY `Author_ID_idx` (`Author_ID`),
  CONSTRAINT `Author_ID` FOREIGN KEY (`Author_ID`) REFERENCES `authors` (`Author_ID`),
  CONSTRAINT `ISBN(10)` FOREIGN KEY (`ISBN`) REFERENCES `inventory` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `writers_written`
--

LOCK TABLES `writers_written` WRITE;
/*!40000 ALTER TABLE `writers_written` DISABLE KEYS */;
INSERT INTO `writers_written` VALUES ('9999999999','0'),('1001100001','1'),('1111111111','2'),('1001190000','3'),('1001110111','4');
/*!40000 ALTER TABLE `writers_written` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `all_friends`
--

/*!50001 DROP VIEW IF EXISTS `all_friends`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `all_friends` AS select distinct `a`.`Friend_ID` AS `Friend_ID`,`c`.`Title` AS `Title`,`c`.`Book_ID` AS `Book_ID`,`a`.`Friend_Fname` AS `Friend_Fname`,`a`.`Friend_Lname` AS `Friend_Lname` from ((`friends` `a` join `rentals` `b`) join `inventory` `c`) where ((`a`.`Friend_ID` = `b`.`Friend_ID`) and (`b`.`Book_ID` = `c`.`Book_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `johnny_rentals`
--

/*!50001 DROP VIEW IF EXISTS `johnny_rentals`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `johnny_rentals` AS select `friends`.`Friend_ID` AS `FRIEND_ID`,`rentals`.`Rental_ID` AS `RENTAL_ID`,`inventory`.`Title` AS `TITLE`,`friends`.`Friend_Fname` AS `FRIEND_FNAME`,`friends`.`Friend_Lname` AS `FRIEND_LNAME`,`catalog`.`Friend_Bought` AS `FRIEND_BOUGHT` from (((`catalog` join `inventory`) join `friends`) join `rentals`) where ((`friends`.`Friend_ID` = 0) and (`rentals`.`Friend_ID` = `friends`.`Friend_ID`) and (`catalog`.`Friend_Bought` = `friends`.`Friend_ID`) and (`inventory`.`ISBN` = `catalog`.`ISBN`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-13 13:58:36
