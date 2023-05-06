-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: lending_library
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
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

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
  `Rental_Days` int DEFAULT NULL,
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
/*!40000 ALTER TABLE `writers_written` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-06 14:49:07
