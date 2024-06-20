-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `number` varchar(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Иван','Иванов','79991234567'),(2,'Мария','Петрова','79005556677'),(3,'Алексей','Сидоров','79118889900'),(4,'Анна','Кузнецова','79001234567'),(5,'Виктор','Смирнов','79007654321'),(6,'Ольга','Михайлова','79105556677'),(7,'Дмитрий','Фёдоров','79210011234'),(8,'Екатерина','Соколова','79124567890'),(9,'Сергей','Васильев','79332221100'),(10,'Александр','Николаев','79227894561'),(11,'Елена','Попова','79136748592'),(12,'Татьяна','Лебедева','79045671234'),(13,'Павел','Новиков','79341234123'),(14,'Наталья','Морозова','79299887766'),(15,'Игорь','Павлов','79236789012'),(16,'Марина','Зайцева','79301234987'),(17,'Валерий','Григорьев','79455678901'),(18,'Кирилл','Степанов','79567890123'),(20,'Даниил ','Дедов','79005554677');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'Иван','Петров'),(2,'Мария','Сидорова'),(3,'Алексей','Кузнецов');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rims`
--

DROP TABLE IF EXISTS `rims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rims` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firm` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `razboltovka` varchar(255) DEFAULT NULL,
  `radius` decimal(5,1) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rims`
--

LOCK TABLES `rims` WRITE;
/*!40000 ALTER TABLE `rims` DISABLE KEYS */;
INSERT INTO `rims` VALUES (1,'Enkei','RPF1','5x114.3',18.0,'Черный'),(2,'BBS','CH-R','5x120',19.0,'Серебристый'),(3,'OZ Racing','Ultraleggera','4x100',17.0,'Золотой'),(4,'Work','Emotion CR Kiwami','5x112',18.0,'Белый'),(5,'Rays','Volk TE37','4x108',16.0,'Синий'),(6,'SSR','Executor CV01','5x112',20.0,'Черный'),(7,'Advanti','Storm S1','5x114.3',17.0,'Матовый серый'),(8,'Konig','Hypergram','4x108',18.0,'Красный'),(9,'American Racing','AR105 Torq Thrust M','5x120',19.0,'Антрацит'),(10,'Rotiform','KPS','4x100',16.0,'Серебристый'),(11,'SSR','Executor CV01','5x112',20.0,'Черный'),(12,'Advanti','Storm S1','5x114.3',17.0,'Матовый серый'),(13,'Konig','Hypergram','4x108',18.0,'Красный'),(14,'American Racing','AR105 Torq Thrust M','5x120',19.0,'Антрацит'),(15,'Rotiform','KPS','4x100',16.0,'Серебристый'),(16,'SSR','Executor CV01','5x112',20.0,'Черный'),(17,'Advanti','Storm S1','5x114.3',17.0,'Матовый серый'),(18,'Konig','Hypergram','4x108',18.0,'Красный'),(19,'American Racing','AR105 Torq Thrust M','5x120',19.0,'Антрацит'),(20,'Rotiform','KPS','4x100',16.0,'Серебристый');
/*!40000 ALTER TABLE `rims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `salesinformationview`
--

DROP TABLE IF EXISTS `salesinformationview`;
/*!50001 DROP VIEW IF EXISTS `salesinformationview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `salesinformationview` AS SELECT 
 1 AS `SellID`,
 1 AS `SellDate`,
 1 AS `SellAmount`,
 1 AS `Quantity`,
 1 AS `ClientFirstName`,
 1 AS `ClientLastName`,
 1 AS `RimFirm`,
 1 AS `RimModel`,
 1 AS `RimColor`,
 1 AS `ManagerFirstName`,
 1 AS `ManagerLastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sell`
--

DROP TABLE IF EXISTS `sell`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sell` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `sum` decimal(6,2) NOT NULL,
  `kolvo` varchar(45) NOT NULL,
  `rims_id` int NOT NULL,
  `manager_id` int NOT NULL,
  `client_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sell_rims_idx` (`rims_id`),
  KEY `fk_sell_manager1_idx` (`manager_id`),
  KEY `fk_sell_client1_idx` (`client_id`),
  CONSTRAINT `fk_sell_client1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `fk_sell_manager1` FOREIGN KEY (`manager_id`) REFERENCES `manager` (`id`),
  CONSTRAINT `fk_sell_rims` FOREIGN KEY (`rims_id`) REFERENCES `rims` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sell`
--

LOCK TABLES `sell` WRITE;
/*!40000 ALTER TABLE `sell` DISABLE KEYS */;
INSERT INTO `sell` VALUES (1,'2023-10-26 00:00:00',1500.00,'2',1,1,1),(2,'2023-10-27 00:00:00',2500.00,'3',2,2,2),(3,'2023-10-28 00:00:00',1000.00,'1',3,3,3),(4,'2023-10-29 12:00:00',2000.00,'2',4,1,4),(5,'2023-10-30 15:30:00',3000.00,'4',5,2,5),(6,'2023-11-01 09:45:00',1500.00,'1',6,3,6),(7,'2023-11-02 14:20:00',2500.00,'3',7,1,7),(8,'2023-11-03 17:10:00',1000.00,'2',8,2,8),(9,'2023-11-04 11:30:00',1800.00,'2',9,3,9),(10,'2023-11-05 13:40:00',2200.00,'3',10,1,10),(11,'2023-11-06 16:50:00',2700.00,'4',11,2,11),(12,'2023-11-07 10:15:00',1200.00,'1',12,3,12),(13,'2023-11-08 12:05:00',1900.00,'2',13,1,13),(14,'2023-11-09 15:25:00',2400.00,'3',14,2,14),(15,'2023-11-10 18:35:00',1600.00,'2',15,3,15),(16,'2023-11-11 14:10:00',2100.00,'2',16,1,1),(17,'2023-11-12 16:30:00',2600.00,'3',17,2,2),(18,'2023-11-13 09:20:00',1400.00,'1',18,3,3),(21,'2024-06-18 10:00:00',1800.00,'2',1,3,18);
/*!40000 ALTER TABLE `sell` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `AfterInsertSell` AFTER INSERT ON `sell` FOR EACH ROW BEGIN
    UPDATE storage 
    SET summa = summa - NEW.kolvo 
    WHERE rims_id = NEW.rims_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `storage`
--

DROP TABLE IF EXISTS `storage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `storage` (
  `id` int NOT NULL AUTO_INCREMENT,
  `summa` decimal(6,2) DEFAULT NULL,
  `rims_id` int NOT NULL,
  `storages` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_storage_rims1_idx` (`rims_id`),
  CONSTRAINT `fk_storage_rims1` FOREIGN KEY (`rims_id`) REFERENCES `rims` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `storage`
--

LOCK TABLES `storage` WRITE;
/*!40000 ALTER TABLE `storage` DISABLE KEYS */;
INSERT INTO `storage` VALUES (1,6.00,1,'Склад A'),(2,20.00,4,'Склад B'),(3,5.00,6,'Склад A');
/*!40000 ALTER TABLE `storage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'mydb'
--

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP FUNCTION IF EXISTS `GetClientFullName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `GetClientFullName`(client_id INT) RETURNS varchar(512) CHARSET utf8mb3
    DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(512);
    
    -- Объединяем имя и фамилию клиента в одну строку
    SELECT CONCAT(name, ' ', surname) INTO full_name
    FROM client
    WHERE id = client_id;
    
    RETURN full_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewClient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewClient`(
    IN p_name VARCHAR(255),
    IN p_surname VARCHAR(255),
    IN p_number VARCHAR(13)
)
BEGIN
	DECLARE phone_number VARCHAR(13);
    
    SET phone_number = (SELECT number FROM client WHERE  number = p_number);
    IF phone_number is not NULL THEN 
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Номер телефона уже используется';
      ELSE 
        START TRANSACTION;
        
        INSERT INTO client (name, surname, number) VALUES (p_name, p_surname, p_number);
        
        COMMIT;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ProcessSalesByManagerAndDateRange` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ProcessSalesByManagerAndDateRange`(
    IN managerID INT,
    IN startDate DATETIME,
    IN endDate DATETIME
)
BEGIN
    DECLARE SaleID INT;
    DECLARE SaleDate DATETIME;
    DECLARE SaleAmount DECIMAL(6,2);
    DECLARE Quantity VARCHAR(45);
    
    DECLARE continueHandler INT DEFAULT 1;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET continueHandler = 0;

    START TRANSACTION;

    SELECT 
        sell.id,
        sell.date,
        sell.sum,
        sell.kolvo
    INTO
        SaleID,
        SaleDate,
        SaleAmount,
        Quantity
    FROM 
        sell
    WHERE 
        sell.manager_id = managerID AND
        sell.date BETWEEN startDate AND endDate
    ORDER BY 
        sell.date;

    IF continueHandler THEN
        SELECT 
            rims.firm,
            rims.model,
            client.name AS 'CliName', 
            client.surname AS 'CliSurname',
            manager.name AS 'MagerName',
            manager.surname AS 'MagerSurname'
        FROM 
            rims
        INNER JOIN 
            sell ON sell.rims_id = rims.id
        INNER JOIN 
            client ON sell.client_id = client.id
        INNER JOIN 
            manager ON sell.manager_id = manager.id
        WHERE 
            sell.id = SaleID;
    END IF;

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `salesinformationview`
--

/*!50001 DROP VIEW IF EXISTS `salesinformationview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesinformationview` AS select `sell`.`id` AS `SellID`,`sell`.`date` AS `SellDate`,`sell`.`sum` AS `SellAmount`,`sell`.`kolvo` AS `Quantity`,`client`.`name` AS `ClientFirstName`,`client`.`surname` AS `ClientLastName`,`rims`.`firm` AS `RimFirm`,`rims`.`model` AS `RimModel`,`rims`.`color` AS `RimColor`,`manager`.`name` AS `ManagerFirstName`,`manager`.`surname` AS `ManagerLastName` from (((`sell` join `client` on((`sell`.`client_id` = `client`.`id`))) join `rims` on((`sell`.`rims_id` = `rims`.`id`))) join `manager` on((`sell`.`manager_id` = `manager`.`id`))) */;
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

-- Dump completed on 2024-06-20  3:34:41
