-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: pokes
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `alias` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `dob` varchar(45) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'edgar grepo','egrepo','egrepo@gmail.com','$2b$12$I9ZPZondm4Ul9FBlY1VSrunW7wcil6/u0jXmRvXcwMmXUNfuOCXHG','1990-03-04','2016-05-21 18:21:01'),(2,'jon snow','jsnow','jsnow@gmail.com','$2b$12$ffI6PhjwCe4IrU8KrS7Y5O/mCgj6r/jELYnDEfWOi378Mrl5lR6TC','1111-11-11','2016-05-21 18:21:22'),(3,'harry potter','hpotter','harry@gmail.com','$2b$12$2l51nLhFrUjV/t.XFr3XJehUugt.Bc5ZK1tOzpANC1UEqGN..5gEW','1111-11-11','2016-05-21 18:30:09'),(4,'luke skywalker','skywalker','luke@gmail.com','$2b$12$d2NprZeZuWZJdQMjcTZnturzmFgouRl1iGDEJT./f.nb5h1h0Owzi','2222-02-22','2016-05-21 18:30:24'),(5,'wacko jacko','wacko','wacko@gmail.com','$2b$12$pbzEpV1eQTbjoLgkPdKjsO8yke2YQEnUPuvMvJryOkl2zrwn03.ym','1111-11-11','2016-05-21 19:32:31'),(6,'Ollie G','ollie','ollieg@gmail.com','$2b$12$xzzzmCXQAWijT/4HOLdQ9Ohcr0S9sWzAyQwhuI3zoHVKEhVLZ4pAC','1111-11-11','2016-05-21 19:41:26'),(7,'gollum','gollum','gollum@gmail.com','$2b$12$2tnqofN/E3tODZHXhOcvcudHB9PKjA88LXreD3Eqvm7GIj3snvP.y','1990-02-02','2016-05-21 19:41:48'),(8,'Horton Who','Horton','horton@gmail.com','$2b$12$oWkilR10ReeswPszaopKE.KHiUjWlqOhoQ.FA8VA.hvnCaSHmxWIi','1990-03-04','2016-05-21 19:42:32'),(9,'Peter Pan','peter','peter@gmail.com','$2b$12$9/N/rVmS9QeVx.M/7cEcruHwpLPhtqLI/NO2nkJKqDYcYahgcVXPi','1990-03-04','2016-05-21 19:42:55'),(10,'Donald Duck','donald','trump@gmail.com','$2b$12$QRCuVOgAsUhWOkw4Oci6vOty7XQGH52dYlweUp4Q.FvSERuj.IXIG','1990-03-04','2016-05-21 19:43:26'),(11,'Mickey Mouse','mouse','mouse@gmail.com','$2b$12$2vuL.I/iFJ5VYOG1RSdZj.qCM1iZuOAu.LeWOk3xu9vF0rKE3HFIK','1990-03-04','2016-05-21 19:43:42');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-21 19:46:32
