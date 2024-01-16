-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: localhost    Database: moving
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `adult_status`
--

DROP TABLE IF EXISTS `adult_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `adult_status` (
  `as_code` char(1) NOT NULL,
  `as_title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`as_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adult_status`
--

LOCK TABLES `adult_status` WRITE;
/*!40000 ALTER TABLE `adult_status` DISABLE KEYS */;
INSERT INTO `adult_status` VALUES ('A','성인'),('K','청소년');
/*!40000 ALTER TABLE `adult_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_no` int NOT NULL AUTO_INCREMENT,
  `user_no` int DEFAULT NULL,
  `b_title` varchar(255) DEFAULT NULL,
  `b_content` text,
  `b_hit` int DEFAULT NULL,
  `b_crtdate` datetime DEFAULT NULL,
  `b_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`board_no`),
  KEY `user_no` (`user_no`),
  CONSTRAINT `board_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,1,'공지','공지',1,'2024-01-10 00:00:00','0.0.0.0'),(2,1,'공지','공지',3,'2024-01-09 00:00:00','0.0.0.0');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `broken_seat`
--

DROP TABLE IF EXISTS `broken_seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `broken_seat` (
  `bk_st_no` int NOT NULL AUTO_INCREMENT,
  `scr_no` int DEFAULT NULL,
  `bk_st_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`bk_st_no`),
  KEY `scr_no` (`scr_no`),
  CONSTRAINT `broken_seat_ibfk_1` FOREIGN KEY (`scr_no`) REFERENCES `screen` (`scr_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `broken_seat`
--

LOCK TABLES `broken_seat` WRITE;
/*!40000 ALTER TABLE `broken_seat` DISABLE KEYS */;
INSERT INTO `broken_seat` VALUES (1,1,'J6'),(2,1,'J7'),(3,1,'J8');
/*!40000 ALTER TABLE `broken_seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `mv_cd` int NOT NULL AUTO_INCREMENT,
  `mv_ktitle` varchar(255) DEFAULT NULL,
  `mv_etitle` varchar(255) DEFAULT NULL,
  `mv_runtime` int DEFAULT NULL,
  `mv_plot` text,
  `mv_dname` varchar(255) DEFAULT NULL,
  `movie_genre` varchar(255) DEFAULT NULL,
  `mv_aname` varchar(255) DEFAULT NULL,
  `mv_rating` varchar(255) DEFAULT NULL,
  `mv_nation` varchar(255) DEFAULT NULL,
  `mv_company` varchar(255) DEFAULT NULL,
  `mv_img` varchar(255) DEFAULT NULL,
  `mv_start` date DEFAULT NULL,
  `mv_crtdate` datetime DEFAULT NULL,
  PRIMARY KEY (`mv_cd`)
) ENGINE=InnoDB AUTO_INCREMENT=20240006 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (20124079,'광해, 왕이 된 남자','Masquerade',131,'ㅇㅇ','추창민','사극','이병헌','15세이상관람가','한국','(주)씨제이이엔엠','https://file.koreafilm.or.kr/thm/02/00/01/46/tn_DPK005647.JPG','2021-10-03','2023-01-09 00:00:00'),(20240001,'테스트 영화1','Test Movie 1',120,'이 영화는 테스트용입니다.','테스트 감독','테스트 장르','테스트 배우','15세 이상 관람가','테스트 국가','테스트 제작사','https://example.com/test1.jpg','2024-01-15','2024-01-12 00:00:00'),(20240002,'테스트 영화2','Test Movie 2',110,'이 영화도 테스트용입니다.','테스트 감독','테스트 장르','테스트 배우','12세 이상 관람가','테스트 국가','테스트 제작사','https://example.com/test2.jpg','2024-01-16','2024-01-12 00:00:00'),(20240003,'테스트 영화3','Test Movie 3',105,'이 영화 역시 테스트용입니다.','테스트 감독','테스트 장르','테스트 배우','19세 이상 관람가','테스트 국가','테스트 제작사','https://example.com/test3.jpg','2024-01-17','2024-01-12 00:00:00'),(20240004,'테스트 영화4','Test Movie 4',95,'이 영화는 다섯 번째 테스트용입니다.','테스트 감독','테스트 장르','테스트 배우','모든 연령 관람가','테스트 국가','테스트 제작사','https://example.com/test4.jpg','2024-01-18','2024-01-12 00:00:00'),(20240005,'테스트 영화5','Test Movie 5',130,'이 영화는 여섯 번째 테스트용입니다.','테스트 감독','테스트 장르','테스트 배우','12세 이상 관람가','테스트 국가','테스트 제작사','https://example.com/test5.jpg','2024-01-19','2024-01-12 00:00:00');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation`
--

DROP TABLE IF EXISTS `reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservation` (
  `r_no` int NOT NULL AUTO_INCREMENT,
  `user_no` int DEFAULT NULL,
  `sch_no` int DEFAULT NULL,
  `r_price` int DEFAULT NULL,
  `rstate_no` int DEFAULT NULL,
  `r_crtdate` datetime DEFAULT NULL,
  PRIMARY KEY (`r_no`),
  KEY `user_no` (`user_no`),
  KEY `sch_no` (`sch_no`),
  KEY `rstate_no` (`rstate_no`),
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`user_no`) REFERENCES `user` (`user_no`),
  CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`sch_no`) REFERENCES `schedule` (`sch_no`),
  CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`rstate_no`) REFERENCES `reservationstate` (`rstate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation`
--

LOCK TABLES `reservation` WRITE;
/*!40000 ALTER TABLE `reservation` DISABLE KEYS */;
INSERT INTO `reservation` VALUES (1,1,3,15000,1,'2024-01-09 00:00:00'),(2,1,2,10000,1,'2024-01-10 00:00:00'),(3,17,20,10000,1,'2023-01-01 09:06:33'),(4,2,18,10000,1,'2022-11-26 17:40:03'),(5,5,19,10000,1,'2023-07-08 04:14:44'),(6,11,13,15000,1,'2020-08-07 06:12:31'),(7,3,10,10000,1,'2021-12-31 07:40:35'),(8,9,12,10000,1,'2020-09-22 10:41:53'),(9,18,8,15000,1,'2022-04-08 20:16:57'),(10,14,14,10000,1,'2020-06-25 19:01:18'),(11,15,22,10000,1,'2021-05-21 19:04:03'),(12,7,25,10000,1,'2020-01-01 08:34:43'),(13,13,1,10000,1,'2023-06-25 19:50:49'),(14,5,7,10000,1,'2022-06-29 21:40:47'),(15,15,17,15000,1,'2020-10-16 22:02:15'),(16,11,23,15000,1,'2020-03-13 14:31:50'),(17,19,6,10000,1,'2021-01-10 19:27:03'),(18,9,24,15000,1,'2021-07-07 22:41:05'),(19,2,16,15000,1,'2020-02-16 21:04:04'),(20,6,5,15000,1,'2021-09-17 13:38:33'),(21,9,9,15000,1,'2022-04-16 00:29:38'),(22,6,11,15000,1,'2020-10-24 06:24:23'),(23,5,4,10000,1,'2023-04-08 12:49:01'),(24,4,15,15000,1,'2022-06-19 18:41:26'),(25,4,21,15000,1,'2022-10-06 06:46:16');
/*!40000 ALTER TABLE `reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationdetail`
--

DROP TABLE IF EXISTS `reservationdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservationdetail` (
  `rd_no` int NOT NULL AUTO_INCREMENT,
  `r_no` int DEFAULT NULL,
  `rd_st_name` varchar(255) DEFAULT NULL,
  `as_code` char(1) DEFAULT NULL,
  `rd_price` int DEFAULT NULL,
  PRIMARY KEY (`rd_no`),
  KEY `r_no` (`r_no`),
  KEY `as_code` (`as_code`),
  CONSTRAINT `reservationdetail_ibfk_1` FOREIGN KEY (`r_no`) REFERENCES `reservation` (`r_no`),
  CONSTRAINT `reservationdetail_ibfk_2` FOREIGN KEY (`as_code`) REFERENCES `adult_status` (`as_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationdetail`
--

LOCK TABLES `reservationdetail` WRITE;
/*!40000 ALTER TABLE `reservationdetail` DISABLE KEYS */;
INSERT INTO `reservationdetail` VALUES (1,1,'A1','A',10000),(2,2,'A2','K',5000),(3,3,'A3','A',10000),(4,4,'G5','K',5000),(5,5,'A5','K',5000),(6,6,'J4','K',5000),(7,7,'F3','K',5000),(8,8,'H2','A',10000),(9,9,'J4','K',5000),(10,10,'H1','K',5000),(11,11,'H1','A',10000),(12,12,'H3','K',5000),(13,13,'G4','K',5000),(14,14,'C5','K',5000),(15,15,'E5','K',5000),(16,16,'F6','K',5000),(17,17,'E8','A',10000),(18,18,'B7','K',5000),(19,19,'A9','A',10000),(20,20,'B4','A',10000),(21,21,'G5','K',5000),(22,22,'H9','K',5000),(23,23,'E8','K',5000),(24,24,'G7','A',10000),(25,25,'B3','K',5000);
/*!40000 ALTER TABLE `reservationdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservationstate`
--

DROP TABLE IF EXISTS `reservationstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservationstate` (
  `rstate_no` int NOT NULL AUTO_INCREMENT,
  `rstate_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rstate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservationstate`
--

LOCK TABLES `reservationstate` WRITE;
/*!40000 ALTER TABLE `reservationstate` DISABLE KEYS */;
INSERT INTO `reservationstate` VALUES (1,'결제완료'),(2,'취소됨'),(3,'관람완료');
/*!40000 ALTER TABLE `reservationstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `sch_no` int NOT NULL AUTO_INCREMENT,
  `scr_no` int DEFAULT NULL,
  `mv_cd` int DEFAULT NULL,
  `sch_date` date DEFAULT NULL,
  `sch_start` time DEFAULT NULL,
  `sch_end` time DEFAULT NULL,
  `sch_period` int DEFAULT NULL,
  `sch_crtdate` datetime DEFAULT NULL,
  `schstate_no` int DEFAULT NULL,
  `sch_cnt` int DEFAULT NULL,
  PRIMARY KEY (`sch_no`),
  KEY `scr_no` (`scr_no`),
  KEY `mv_cd` (`mv_cd`),
  KEY `schstate_no` (`schstate_no`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`scr_no`) REFERENCES `screen` (`scr_no`),
  CONSTRAINT `schedule_ibfk_2` FOREIGN KEY (`mv_cd`) REFERENCES `movie` (`mv_cd`),
  CONSTRAINT `schedule_ibfk_3` FOREIGN KEY (`schstate_no`) REFERENCES `schedulestate` (`schstate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,20240002,'2024-01-16','07:00:00','03:00:00',1,'2024-01-12 22:52:21',1,70),(2,8,20240002,'2024-01-14','05:00:00','03:00:00',1,'2024-01-12 22:52:21',1,85),(3,18,20240002,'2024-01-18','07:00:00','03:00:00',1,'2024-01-12 22:52:21',1,94),(4,4,20240002,'2024-01-16','02:00:00','03:00:00',1,'2024-01-12 22:52:21',1,91),(5,20,20240002,'2024-01-12','09:00:00','03:00:00',1,'2024-01-12 22:52:21',1,91),(6,1,20240001,'2024-01-14','06:00:00','02:00:00',1,'2024-01-12 22:52:21',1,77),(7,8,20240001,'2024-01-15','07:00:00','02:00:00',1,'2024-01-12 22:52:21',1,83),(8,18,20240001,'2024-01-13','05:00:00','03:00:00',1,'2024-01-12 22:52:21',1,90),(9,4,20240001,'2024-01-14','03:00:00','02:00:00',1,'2024-01-12 22:52:21',1,91),(10,20,20240001,'2024-01-18','05:00:00','02:00:00',1,'2024-01-12 22:52:21',1,74),(11,1,20240003,'2024-01-18','06:00:00','03:00:00',1,'2024-01-12 22:52:21',1,88),(12,8,20240003,'2024-01-16','05:00:00','03:00:00',1,'2024-01-12 22:52:21',1,77),(13,18,20240003,'2024-01-12','02:00:00','02:00:00',1,'2024-01-12 22:52:21',1,96),(14,4,20240003,'2024-01-12','00:00:00','02:00:00',1,'2024-01-12 22:52:21',1,90),(15,20,20240003,'2024-01-16','02:00:00','02:00:00',1,'2024-01-12 22:52:21',1,96),(16,1,20124079,'2024-01-17','03:00:00','03:00:00',1,'2024-01-12 22:52:21',1,87),(17,8,20124079,'2024-01-18','05:00:00','02:00:00',1,'2024-01-12 22:52:21',1,91),(18,18,20124079,'2024-01-15','03:00:00','03:00:00',1,'2024-01-12 22:52:21',1,85),(19,4,20124079,'2024-01-13','02:00:00','03:00:00',1,'2024-01-12 22:52:21',1,96),(20,20,20124079,'2024-01-13','07:00:00','02:00:00',1,'2024-01-12 22:52:21',1,80),(21,1,20240005,'2024-01-17','00:00:00','03:00:00',1,'2024-01-12 22:52:21',1,70),(22,8,20240005,'2024-01-18','09:00:00','03:00:00',1,'2024-01-12 22:52:21',1,98),(23,18,20240005,'2024-01-15','06:00:00','03:00:00',1,'2024-01-12 22:52:21',1,99),(24,4,20240005,'2024-01-16','05:00:00','03:00:00',1,'2024-01-12 22:52:21',1,87),(25,20,20240005,'2024-01-13','04:00:00','02:00:00',1,'2024-01-12 22:52:21',1,92),(26,1,20240004,'2024-01-17','02:00:00','03:00:00',1,'2024-01-12 22:52:21',1,78),(27,8,20240004,'2024-01-16','08:00:00','02:00:00',1,'2024-01-12 22:52:21',1,84),(28,18,20240004,'2024-01-14','05:00:00','03:00:00',1,'2024-01-12 22:52:21',1,88),(29,4,20240004,'2024-01-15','09:00:00','03:00:00',1,'2024-01-12 22:52:21',1,82);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedulestate`
--

DROP TABLE IF EXISTS `schedulestate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedulestate` (
  `schstate_no` int NOT NULL AUTO_INCREMENT,
  `schstate_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`schstate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedulestate`
--

LOCK TABLES `schedulestate` WRITE;
/*!40000 ALTER TABLE `schedulestate` DISABLE KEYS */;
INSERT INTO `schedulestate` VALUES (1,'상영전'),(2,'상영중'),(3,'상영완료');
/*!40000 ALTER TABLE `schedulestate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen`
--

DROP TABLE IF EXISTS `screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen` (
  `scr_no` int NOT NULL AUTO_INCREMENT,
  `tt_no` int DEFAULT NULL,
  `scr_name` varchar(255) DEFAULT NULL,
  `scr_st_cnt` int DEFAULT NULL,
  `scr_crtdate` datetime DEFAULT NULL,
  `scr_price` int DEFAULT NULL,
  `scr_st_row` int DEFAULT NULL,
  `scr_st_col` char(1) DEFAULT NULL,
  `scrstate_no` int DEFAULT NULL,
  PRIMARY KEY (`scr_no`),
  KEY `tt_no` (`tt_no`),
  KEY `scrstate_no` (`scrstate_no`),
  CONSTRAINT `screen_ibfk_1` FOREIGN KEY (`tt_no`) REFERENCES `theater` (`tt_no`),
  CONSTRAINT `screen_ibfk_2` FOREIGN KEY (`scrstate_no`) REFERENCES `screenstate` (`scrstate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen`
--

LOCK TABLES `screen` WRITE;
/*!40000 ALTER TABLE `screen` DISABLE KEYS */;
INSERT INTO `screen` VALUES (1,1,'1관',100,'2024-01-12 00:00:00',10000,10,'E',1),(2,1,'2관',100,'2024-01-12 00:00:00',10000,10,'E',1),(3,1,'3관',100,'2024-01-12 00:00:00',10000,10,'E',1),(4,1,'4관',100,'2024-01-12 00:00:00',10000,10,'E',1),(5,1,'5관',100,'2024-01-12 00:00:00',10000,10,'E',1),(6,2,'1관',100,'2024-01-12 00:00:00',10000,10,'E',1),(7,2,'2관',100,'2024-01-12 00:00:00',10000,10,'E',1),(8,2,'3관',100,'2024-01-12 00:00:00',10000,10,'E',1),(9,2,'4관',100,'2024-01-12 00:00:00',10000,10,'E',1),(10,2,'5관',100,'2024-01-12 00:00:00',10000,10,'E',1),(11,3,'1관',100,'2024-01-12 00:00:00',10000,10,'E',1),(12,3,'2관',100,'2024-01-12 00:00:00',10000,10,'E',1),(13,3,'3관',100,'2024-01-12 00:00:00',10000,10,'E',1),(14,3,'4관',100,'2024-01-12 00:00:00',10000,10,'E',1),(15,3,'5관',100,'2024-01-12 00:00:00',10000,10,'E',1),(16,4,'1관',100,'2024-01-12 00:00:00',10000,10,'E',1),(17,4,'2관',100,'2024-01-12 00:00:00',10000,10,'E',1),(18,4,'3관',100,'2024-01-12 00:00:00',10000,10,'E',1),(19,4,'4관',100,'2024-01-12 00:00:00',10000,10,'E',1),(20,4,'5관',100,'2024-01-12 00:00:00',10000,10,'E',1),(21,5,'1관',100,'2024-01-12 00:00:00',10000,10,'E',1),(22,5,'2관',100,'2024-01-12 00:00:00',10000,10,'E',1),(23,5,'3관',100,'2024-01-12 00:00:00',10000,10,'E',1),(24,5,'4관',100,'2024-01-12 00:00:00',10000,10,'E',1),(25,5,'5관',100,'2024-01-12 00:00:00',10000,10,'E',1);
/*!40000 ALTER TABLE `screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screenstate`
--

DROP TABLE IF EXISTS `screenstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screenstate` (
  `scrstate_no` int NOT NULL AUTO_INCREMENT,
  `scrstate_state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scrstate_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screenstate`
--

LOCK TABLES `screenstate` WRITE;
/*!40000 ALTER TABLE `screenstate` DISABLE KEYS */;
INSERT INTO `screenstate` VALUES (1,'영업중'),(2,'영업안함');
/*!40000 ALTER TABLE `screenstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theater`
--

DROP TABLE IF EXISTS `theater`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theater` (
  `tt_no` int NOT NULL AUTO_INCREMENT,
  `tt_name` varchar(255) DEFAULT NULL,
  `tt_tel` varchar(255) DEFAULT NULL,
  `tt_start` time DEFAULT NULL,
  `tt_close` time DEFAULT NULL,
  `tt_scrcnt` int DEFAULT NULL,
  `tt_img` varchar(255) DEFAULT NULL,
  `tt_address` varchar(255) DEFAULT NULL,
  `tt_crtdate` datetime DEFAULT NULL,
  PRIMARY KEY (`tt_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theater`
--

LOCK TABLES `theater` WRITE;
/*!40000 ALTER TABLE `theater` DISABLE KEYS */;
INSERT INTO `theater` VALUES (1,'강남 CGV','02-1234-5678','09:00:00','23:00:00',5,'강남CGV.jpg','서울 강남구 강남대로 123번길 45','2024-01-12 00:00:00'),(2,'홍대 메가박스','02-9876-5432','10:00:00','22:00:00',5,'홍대메가박스.jpg','서울 마포구 와우산로 111번길 67','2024-01-12 00:00:00'),(3,'신촌 롯데시네마','02-5555-5555','11:00:00','21:00:00',5,'신촌롯데시네마.jpg','서울 서대문구 연세로 50-1','2024-01-12 00:00:00'),(4,'종로 메가박스','02-1234-5678','10:00:00','22:00:00',5,'종로메가박스.jpg','서울 종로구 종로 123번길 45','2024-01-12 00:00:00'),(5,'강서 CGV','02-9876-5432','09:00:00','23:00:00',5,'강서CGV.jpg','서울 강서구 강서로 111번길 67','2024-01-12 00:00:00');
/*!40000 ALTER TABLE `theater` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_no` int NOT NULL AUTO_INCREMENT,
  `usertp_no` int DEFAULT NULL,
  `user_id` varchar(255) DEFAULT NULL,
  `user_name` varchar(255) DEFAULT NULL,
  `user_pass` varchar(255) DEFAULT NULL,
  `user_nick` varchar(255) DEFAULT NULL,
  `user_mail` varchar(255) DEFAULT NULL,
  `user_age` date DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  `user_kakao` varchar(255) DEFAULT NULL,
  `user_crtdate` datetime DEFAULT NULL,
  `user_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_no`),
  KEY `usertp_no` (`usertp_no`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`usertp_no`) REFERENCES `usertype` (`usertp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,0,'admin','관리자','1111','관리자','admin@gmail.com','1995-11-01','010-0000-0000','0','2023-12-15 00:00:00','1.1.1.1'),(2,1,'first','강권식','1111','꿔시기','soyeon318@naver.com','1994-03-18','010-2606-2718','카카오고유번호','2023-12-15 00:00:00','1.1.1.2'),(3,1,'second','second','2222','second','second@naver.com','1994-03-22','010-2222-2222','0','2023-12-15 00:00:00','1.1.1.2'),(4,1,'user4','사용자4','pass4','닉네임4','user4@example.com','1999-01-04','010-0000-0004','0','2023-12-15 00:00:00','1.1.1.4'),(5,1,'user5','사용자5','pass5','닉네임5','user5@example.com','1998-01-05','010-0000-0005','0','2023-12-15 00:00:00','1.1.1.5'),(6,1,'user6','사용자6','pass6','닉네임6','user6@example.com','1994-01-06','010-0000-0006','0','2023-12-15 00:00:00','1.1.1.6'),(7,1,'user7','사용자7','pass7','닉네임7','user7@example.com','1995-01-07','010-0000-0007','0','2023-12-15 00:00:00','1.1.1.7'),(8,1,'user8','사용자8','pass8','닉네임8','user8@example.com','1996-01-08','010-0000-0008','0','2023-12-15 00:00:00','1.1.1.8'),(9,1,'user9','사용자9','pass9','닉네임9','user9@example.com','1997-01-09','010-0000-0009','0','2023-12-15 00:00:00','1.1.1.9'),(10,1,'user10','사용자10','pass10','닉네임10','user10@example.com','1997-01-10','010-0000-0010','0','2023-12-15 00:00:00','1.1.1.10'),(11,1,'user11','사용자11','pass11','닉네임11','user11@example.com','1998-01-11','010-0000-0011','0','2023-12-15 00:00:00','1.1.1.11'),(12,1,'user12','사용자12','pass12','닉네임12','user12@example.com','1990-01-12','010-0000-0012','0','2023-12-15 00:00:00','1.1.1.12'),(13,1,'user13','사용자13','pass13','닉네임13','user13@example.com','1990-01-13','010-0000-0013','0','2023-12-15 00:00:00','1.1.1.13'),(14,1,'user14','사용자14','pass14','닉네임14','user14@example.com','1990-01-14','010-0000-0014','0','2023-12-15 00:00:00','1.1.1.14'),(15,1,'user15','사용자15','pass15','닉네임15','user15@example.com','1990-01-15','010-0000-0015','0','2023-12-15 00:00:00','1.1.1.15'),(16,1,'user16','사용자16','pass16','닉네임16','user16@example.com','1990-01-16','010-0000-0016','0','2023-12-15 00:00:00','1.1.1.16'),(17,1,'user17','사용자17','pass17','닉네임17','user17@example.com','1990-01-17','010-0000-0017','0','2023-12-15 00:00:00','1.1.1.17'),(18,1,'user18','사용자18','pass18','닉네임18','user18@example.com','1990-01-18','010-0000-0018','0','2023-12-15 00:00:00','1.1.1.18'),(19,1,'user19','사용자19','pass19','닉네임19','user19@example.com','1990-01-19','010-0000-0019','0','2023-12-15 00:00:00','1.1.1.19');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usertype`
--

DROP TABLE IF EXISTS `usertype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usertype` (
  `usertp_no` int NOT NULL AUTO_INCREMENT,
  `usertp_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`usertp_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usertype`
--

LOCK TABLES `usertype` WRITE;
/*!40000 ALTER TABLE `usertype` DISABLE KEYS */;
INSERT INTO `usertype` VALUES (0,'관리자'),(1,'일반회원');
/*!40000 ALTER TABLE `usertype` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-15  0:07:58
