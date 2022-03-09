-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: ewastemanagement
-- ------------------------------------------------------
-- Server version	8.0.24

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `adminemail` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`adminemail`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin@gmail.com','1234','admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buying_requests`
--

DROP TABLE IF EXISTS `buying_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `buying_requests` (
  `pid` int NOT NULL,
  `companyemail` varchar(100) NOT NULL,
  `owneremail` varchar(100) NOT NULL,
  KEY `companyemail` (`companyemail`),
  KEY `owneremail` (`owneremail`),
  KEY `pid` (`pid`),
  CONSTRAINT `buying_requests_ibfk_2` FOREIGN KEY (`companyemail`) REFERENCES `company` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_requests_ibfk_3` FOREIGN KEY (`owneremail`) REFERENCES `customer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buying_requests_ibfk_4` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buying_requests`
--

LOCK TABLES `buying_requests` WRITE;
/*!40000 ALTER TABLE `buying_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `buying_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `email` varchar(100) NOT NULL,
  `companyname` varchar(100) NOT NULL,
  PRIMARY KEY (`email`),
  CONSTRAINT `company_ibfk_1` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `email` varchar(60) NOT NULL,
  KEY `customeremail_idx` (`email`),
  CONSTRAINT `customeremail` FOREIGN KEY (`email`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `feed` varchar(300) NOT NULL,
  `rating` int NOT NULL,
  `customeremail` varchar(60) NOT NULL,
  KEY `useremail_idx` (`customeremail`),
  CONSTRAINT `useremail` FOREIGN KEY (`customeremail`) REFERENCES `user` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `pid` int NOT NULL AUTO_INCREMENT,
  `productname` varchar(45) NOT NULL,
  `brand` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `weight` double DEFAULT NULL,
  `image` varchar(250) NOT NULL,
  `description` varchar(300) DEFAULT NULL,
  `soldstatus` varchar(20) DEFAULT NULL,
  `owneremail` varchar(45) NOT NULL,
  PRIMARY KEY (`pid`),
  KEY `customeremail_idx` (`owneremail`),
  CONSTRAINT `owneremail` FOREIGN KEY (`owneremail`) REFERENCES `customer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recieved_products`
--

DROP TABLE IF EXISTS `recieved_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recieved_products` (
  `pid` int NOT NULL,
  `companyemail` varchar(100) NOT NULL,
  `owneremail` varchar(100) NOT NULL,
  KEY `pid` (`pid`),
  KEY `companyemail` (`companyemail`),
  KEY `owneremail` (`owneremail`),
  CONSTRAINT `recieved_products_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recieved_products_ibfk_2` FOREIGN KEY (`companyemail`) REFERENCES `company` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recieved_products_ibfk_3` FOREIGN KEY (`owneremail`) REFERENCES `customer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recieved_products`
--

LOCK TABLES `recieved_products` WRITE;
/*!40000 ALTER TABLE `recieved_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `recieved_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `remaining_collections`
--

DROP TABLE IF EXISTS `remaining_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `remaining_collections` (
  `pid` int NOT NULL,
  `companyemail` varchar(100) NOT NULL,
  `owneremail` varchar(100) NOT NULL,
  KEY `pid` (`pid`),
  KEY `companyemail` (`companyemail`),
  KEY `customeremail` (`owneremail`),
  CONSTRAINT `remaining_collections_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `remaining_collections_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remaining_collections_ibfk_3` FOREIGN KEY (`companyemail`) REFERENCES `company` (`email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `remaining_collections_ibfk_4` FOREIGN KEY (`owneremail`) REFERENCES `customer` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `remaining_collections`
--

LOCK TABLES `remaining_collections` WRITE;
/*!40000 ALTER TABLE `remaining_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `remaining_collections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `usertype` varchar(45) NOT NULL,
  `Address` varchar(250) NOT NULL,
  `pincode` varchar(20) NOT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-18 21:17:07
