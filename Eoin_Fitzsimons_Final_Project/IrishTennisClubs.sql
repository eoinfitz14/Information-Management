-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: irish
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `club` (
  `club_name` varchar(40) DEFAULT NULL,
  `club_id` int(11) NOT NULL,
  `street` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `president_id` int(11) DEFAULT NULL,
  `region_name` varchar(40) DEFAULT NULL,
  `phone_no` int(11) NOT NULL,
  PRIMARY KEY (`club_id`),
  KEY `region_name` (`region_name`),
  KEY `president_id` (`president_id`),
  CONSTRAINT `club_ibfk_1` FOREIGN KEY (`region_name`) REFERENCES `region` (`region_name`),
  CONSTRAINT `club_ibfk_2` FOREIGN KEY (`president_id`) REFERENCES `member` (`tennis_ireland_id`),
  CONSTRAINT `club_ibfk_3` FOREIGN KEY (`president_id`) REFERENCES `member` (`tennis_ireland_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('Malahide LTC',1000000,'coast road','dublin',10000,'Dublin',18450000),('Sutton LTC',2000000,'strand road','dublin',NULL,'Dublin',18450001),('Clontarf LTC',3000000,'sea road','dublin',10005,'Dublin',18450002),('Howth LTC',4000000,'water road','dublin',10009,'Dublin',18450003),('Carrickmines LTC',5000000,'fir street','dublin',10011,'Dublin',18450004),('Leopardstown LTC',6000000,'brewery road','dublin',10012,'Dublin',18450005),('Kilkenny LTC',7000000,'knock road','kilkenny',10016,'Greater Leinster Area',18450006),('Naas LTC',8000000,'naas road','kildare',10021,'Greater Leinster Area',18450007),('Slane LTC',9000000,'slane road','meath',10024,'Greater Leinster Area',18450008),('Rushbrooke LTC',9000001,'cobh road','cork',10028,'Munster',18450009),('Cobh LTC',9000002,'rushbrooke road','cork',10029,'Munster',18450010),('Sandy LTC',9000003,'waterford road','waterford',10032,'Munster',18450011),('Salthill LTC',9000004,'salthill road','galway',10035,'Connacht',18450012),('Castlebar LTC',9000005,'castlebar road','mayo',10037,'Connacht',18450013),('Nordie LTC',9000006,'dublin road','armagh',10040,'Ulster',18450014),('Right Left LTC',9000007,'up road','down',10045,'Ulster',18450015),('Belfast Boat Club ',9000008,'wind road','belfast',10046,'Ulster',18450016);
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `club_contact_view`
--

DROP TABLE IF EXISTS `club_contact_view`;
/*!50001 DROP VIEW IF EXISTS `club_contact_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `club_contact_view` AS SELECT 
 1 AS `club_name`,
 1 AS `street`,
 1 AS `city`,
 1 AS `committee_email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `committee`
--

DROP TABLE IF EXISTS `committee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `committee` (
  `club_id` int(11) NOT NULL,
  `committee_email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`club_id`),
  CONSTRAINT `fk_club` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `committee`
--

LOCK TABLES `committee` WRITE;
/*!40000 ALTER TABLE `committee` DISABLE KEYS */;
INSERT INTO `committee` VALUES (1000000,'mala@mala.ie'),(2000000,'sutton@tennis.ie'),(3000000,'clontarf@tennis.ie'),(4000000,'howth@tennis.ie'),(5000000,'carrickmines@tennis.ie'),(6000000,'leopardstown@tennis.ie'),(7000000,'kilkenny@tennis.ie'),(8000000,'naas@tennis.ie'),(9000000,'slane@tennis.ie'),(9000001,'rushnrooke@tennis.ie'),(9000002,'cobh@tennis.ie'),(9000003,'sandy@tennis.ie'),(9000004,'salthill@tennis.ie'),(9000005,'castlebar@tennis.ie'),(9000006,'nordie@tennis.ie'),(9000007,'rl@tennis.ie'),(9000008,'bb@tennis.ie');
/*!40000 ALTER TABLE `committee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `member` (
  `tennis_ireland_id` int(11) NOT NULL,
  `first_name` varchar(25) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `club_id` int(11) NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`tennis_ireland_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (10000,'bob','ryan',1000000,'bob@tennis.ie'),(10001,'tim','ryan',1000000,'tim@tennis.ie'),(10002,'jim','ryan',1000000,'jim@tennis.ie'),(10003,'sally','o brien',2000000,'sally@tennis.ie'),(10004,'dec','o brien',2000000,'dec@tennis.ie'),(10005,'james','o connor',3000000,'j@tennis.ie'),(10006,'rob','o connor',3000000,'r@tennis.ie'),(10007,'eoin','fitz',4000000,'t@tennis.ie'),(10008,'lily','byrne',4000000,'lb@tennis.ie'),(10009,'quintin','talin',4000000,'qt@tennis.ie'),(10010,'grant','jennings',5000000,'grant@tennis.ie'),(10011,'gill','jennings',5000000,'gill@tennis.ie'),(10012,'fred','marks',6000000,'fred@tennis.ie'),(10013,'harry','marks',6000000,'harry@tennis.ie'),(10014,'sara','marks',6000000,'sara@tennis.ie'),(10015,'jane','marks',6000000,'jane@tennis.ie'),(10016,'ron','howard',7000000,'ron@tennis.ie'),(10017,'tim','howard',7000000,'tim@tennis.ie'),(10018,'nuno','howard',7000000,'nuno@tennis.ie'),(10019,'rita','howard',7000000,'rita@tennis.ie'),(10020,'holly','crossan',8000000,'hols@tennis.ie'),(10021,'jerome','crossan',8000000,'jerome@tennis.ie'),(10022,'rex','crossan',8000000,'rex@tennis.ie'),(10023,'angus','lloyd',9000000,'angus@tennis.ie'),(10024,'kate','lloyd',9000000,'kate@tennis.ie'),(10025,'bernie','lloyd',9000000,'bernie@tennis.ie'),(10026,'pete','louther',9000001,'hello@tennis.ie'),(10027,'tadhg','louther',9000001,'hello@tennis.ie'),(10028,'rob','louther',9000001,'hello@tennis.ie'),(10029,'tadhg','lambe',9000002,'lambe@tennis.ie'),(10030,'brett','lambe',9000002,'blambe@tennis.ie'),(10031,'bennon','lambe',9000002,'blambe@tennis.ie'),(10032,'victor','drummy',9000003,'drummy@tennis.ie'),(10033,'aisling','drummy',9000003,'drummy@tennis.ie'),(10034,'nicola','drummy',9000003,'drummy@tennis.ie'),(10035,'tim','cahill',9000004,'cahill@tennis.ie'),(10036,'caoimhe','cahill',9000004,'cahill@tennis.ie'),(10037,'cathal','cahill',9000005,'cahill@tennis.ie'),(10038,'ciara','cahill',9000005,'cahill@tennis.ie'),(10039,'conor','clancy',9000006,'clancy@tennis.ie'),(10040,'claire','clancy',9000006,'clancy@tennis.ie'),(10041,'clancy','clancy',9000006,'clancy@tennis.ie'),(10042,'niall','gahan',9000007,'gahan@tennis.ie'),(10043,'vron','gahan',9000007,'gahan@tennis.ie'),(10044,'dec','gahan',9000007,'gahan@tennis.ie'),(10045,'bro','gahan',9000007,'gahan@tennis.ie'),(10046,'daniel','daniels',9000008,'daniels@tennis.ie'),(10047,'stormy','daniels',9000008,'daniels@tennis.ie'),(10048,'stormy','danieless',1000000,'danielles@tennis.ie');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `member_view`
--

DROP TABLE IF EXISTS `member_view`;
/*!50001 DROP VIEW IF EXISTS `member_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `member_view` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `player` (
  `tennis_ireland_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `team_id` int(11) NOT NULL,
  PRIMARY KEY (`tennis_ireland_id`),
  KEY `team_id` (`team_id`),
  CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (10000,1,1),(10001,2,1),(10002,2,2),(10003,1,3),(10004,2,3),(10005,1,4),(10006,2,4),(10007,1,5),(10008,2,5),(10010,1,6),(10011,2,6),(10012,1,7),(10013,2,7),(10014,1,8),(10015,2,8),(10016,1,9),(10017,2,9),(10048,2,2);
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `player_view`
--

DROP TABLE IF EXISTS `player_view`;
/*!50001 DROP VIEW IF EXISTS `player_view`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `player_view` AS SELECT 
 1 AS `first_name`,
 1 AS `last_name`,
 1 AS `team_name`,
 1 AS `position`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `region`
--

DROP TABLE IF EXISTS `region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `region` (
  `region_name` varchar(40) NOT NULL,
  `popularity` int(11) NOT NULL,
  `no_clubs` int(11) NOT NULL,
  PRIMARY KEY (`region_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `region`
--

LOCK TABLES `region` WRITE;
/*!40000 ALTER TABLE `region` DISABLE KEYS */;
INSERT INTO `region` VALUES ('Connacht',0,0),('Dublin',0,0),('Greater Leinster Area',0,0),('Munster',0,0),('Ulster',0,0);
/*!40000 ALTER TABLE `region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `team` (
  `team_name` varchar(45) DEFAULT NULL,
  `team_id` int(11) NOT NULL,
  `club_id` int(11) NOT NULL,
  PRIMARY KEY (`team_id`),
  KEY `club_id` (`club_id`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`club_id`) REFERENCES `club` (`club_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('malahide 1',1,1000000),('malahide 2',2,1000000),('sutton 1',3,2000000),('sutton 2',4,2000000),('clontarf 1',5,3000000),('howth 1',6,4000000),('carrickmines 1',7,5000000),('leopardstown 1',8,6000000),('kilkenny 1',9,7000000),('naas 1',10,8000000),('slane 1',11,9000000),('rushbrooke 1',12,9000001),('cobh 1',13,9000002),('sandy 1',14,9000003),('salthill 1',15,9000004),('castlebar 1',16,9000005),('nordie 1',17,9000006),('right left 1',18,9000007),('BB 1',19,9000008);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'irish'
--

--
-- Final view structure for view `club_contact_view`
--

/*!50001 DROP VIEW IF EXISTS `club_contact_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `club_contact_view` AS select `club`.`club_name` AS `club_name`,`club`.`street` AS `street`,`club`.`city` AS `city`,`committee`.`committee_email` AS `committee_email` from (`club` join `committee`) where (`club`.`club_id` = `committee`.`club_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `member_view`
--

/*!50001 DROP VIEW IF EXISTS `member_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `member_view` AS select `member`.`first_name` AS `first_name`,`member`.`last_name` AS `last_name`,`member`.`email` AS `email` from `member` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `player_view`
--

/*!50001 DROP VIEW IF EXISTS `player_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `player_view` AS select `member`.`first_name` AS `first_name`,`member`.`last_name` AS `last_name`,`team`.`team_name` AS `team_name`,`player`.`position` AS `position` from ((`member` join `team`) join `player`) where ((`member`.`tennis_ireland_id` = `player`.`tennis_ireland_id`) and (`player`.`team_id` = `team`.`team_id`)) */;
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

-- Dump completed on 2018-11-28 10:16:33
