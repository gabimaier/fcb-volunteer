-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: volunteer
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.12.04.1

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Bucuresti',0),(2,'Amsterdaam',0),(3,'London',0);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facilitators`
--

DROP TABLE IF EXISTS `facilitators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facilitators` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_h2i87qmhkpd3s4vndrjide8g9` FOREIGN KEY (`id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facilitators`
--

LOCK TABLES `facilitators` WRITE;
/*!40000 ALTER TABLE `facilitators` DISABLE KEYS */;
/*!40000 ALTER TABLE `facilitators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `organizations` (
  `name` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_p9pbw3flq9hkay8hdx3ypsldy` (`name`),
  CONSTRAINT `FK_6y5owvxkgm8r57ddyq7qcv8br` FOREIGN KEY (`id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accepted` bit(1) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `initial_feedback` varchar(255) NOT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `results` varchar(255) DEFAULT NULL,
  `start_date` datetime NOT NULL,
  `title` varchar(250) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `city` bigint(20) NOT NULL,
  `organization` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_tjhqwalyna982dhwdnx5ksuwv` (`title`),
  KEY `FK_p3onfp85p80koi89y9l5qh52x` (`city`),
  KEY `FK_p35w5fq0pntixa7y6kupusbou` (`organization`),
  CONSTRAINT `FK_p35w5fq0pntixa7y6kupusbou` FOREIGN KEY (`organization`) REFERENCES `organizations` (`id`),
  CONSTRAINT `FK_p3onfp85p80koi89y9l5qh52x` FOREIGN KEY (`city`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_required_skills`
--

DROP TABLE IF EXISTS `projects_required_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_required_skills` (
  `projects` bigint(20) NOT NULL,
  `required_skills` bigint(20) NOT NULL,
  KEY `FK_luf31hjkqyljks5oysl20n8a4` (`required_skills`),
  KEY `FK_bclkmm7ubhyr8nwq6wyvdyuff` (`projects`),
  CONSTRAINT `FK_bclkmm7ubhyr8nwq6wyvdyuff` FOREIGN KEY (`projects`) REFERENCES `projects` (`id`),
  CONSTRAINT `FK_luf31hjkqyljks5oysl20n8a4` FOREIGN KEY (`required_skills`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_required_skills`
--

LOCK TABLES `projects_required_skills` WRITE;
/*!40000 ALTER TABLE `projects_required_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_required_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_tags`
--

DROP TABLE IF EXISTS `projects_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_tags` (
  `projects` bigint(20) NOT NULL,
  `tags` bigint(20) NOT NULL,
  PRIMARY KEY (`projects`,`tags`),
  KEY `FK_4l39yl8chhaliy8krwtxs8mgv` (`tags`),
  CONSTRAINT `FK_dqlohfs6cg9vxqock4sh0qpso` FOREIGN KEY (`projects`) REFERENCES `projects` (`id`),
  CONSTRAINT `FK_4l39yl8chhaliy8krwtxs8mgv` FOREIGN KEY (`tags`) REFERENCES `tags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_tags`
--

LOCK TABLES `projects_tags` WRITE;
/*!40000 ALTER TABLE `projects_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_volunteers`
--

DROP TABLE IF EXISTS `projects_volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projects_volunteers` (
  `projects` bigint(20) NOT NULL,
  `volunteers` bigint(20) NOT NULL,
  PRIMARY KEY (`projects`,`volunteers`),
  KEY `FK_bvfa6d4r5ikkmbu78slt4bme5` (`volunteers`),
  CONSTRAINT `FK_dpilmplq9m9dd85i6c528d4vs` FOREIGN KEY (`projects`) REFERENCES `projects` (`id`),
  CONSTRAINT `FK_bvfa6d4r5ikkmbu78slt4bme5` FOREIGN KEY (`volunteers`) REFERENCES `volunteer_applications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_volunteers`
--

LOCK TABLES `projects_volunteers` WRITE;
/*!40000 ALTER TABLE `projects_volunteers` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'marketing',0),(2,'PR',0),(3,'graphical design',0),(4,'programare',0),(5,'project management',0);
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'batrani',0),(2,'orfani',0),(3,'dizabilitati',0);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_account`
--

DROP TABLE IF EXISTS `user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `city` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_n581kgbdmb1ruhd047l51wn0a` (`user_name`),
  KEY `FK_r3b93dkao46hr98fql9erx6tq` (`city`),
  CONSTRAINT `FK_r3b93dkao46hr98fql9erx6tq` FOREIGN KEY (`city`) REFERENCES `cities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_account`
--

LOCK TABLES `user_account` WRITE;
/*!40000 ALTER TABLE `user_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `user_account` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_p48cn30k34to9qbcqusrr83lq` (`user_account`),
  CONSTRAINT `FK_p48cn30k34to9qbcqusrr83lq` FOREIGN KEY (`user_account`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteer_applications`
--

DROP TABLE IF EXISTS `volunteer_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteer_applications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `accepted` bit(1) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `project` bigint(20) NOT NULL,
  `volunteer` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3pcka4x4iqftojie540abdtxx` (`project`),
  KEY `FK_ry63ax1vbkaowo07w34ulhv4j` (`volunteer`),
  CONSTRAINT `FK_ry63ax1vbkaowo07w34ulhv4j` FOREIGN KEY (`volunteer`) REFERENCES `volunteers` (`id`),
  CONSTRAINT `FK_3pcka4x4iqftojie540abdtxx` FOREIGN KEY (`project`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer_applications`
--

LOCK TABLES `volunteer_applications` WRITE;
/*!40000 ALTER TABLE `volunteer_applications` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteer_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers`
--

DROP TABLE IF EXISTS `volunteers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteers` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FK_lkioguhh67ol4s3ny13e7g11u` FOREIGN KEY (`id`) REFERENCES `user_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers`
--

LOCK TABLES `volunteers` WRITE;
/*!40000 ALTER TABLE `volunteers` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers_expert_skills`
--

DROP TABLE IF EXISTS `volunteers_expert_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteers_expert_skills` (
  `volunteers` bigint(20) NOT NULL,
  `expert_skills` bigint(20) NOT NULL,
  PRIMARY KEY (`volunteers`,`expert_skills`),
  KEY `FK_sh9m4nkpa7on61wdscsvp4ll9` (`expert_skills`),
  CONSTRAINT `FK_m4hodxqvbtdn5scehjfra6rkl` FOREIGN KEY (`volunteers`) REFERENCES `volunteers` (`id`),
  CONSTRAINT `FK_sh9m4nkpa7on61wdscsvp4ll9` FOREIGN KEY (`expert_skills`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers_expert_skills`
--

LOCK TABLES `volunteers_expert_skills` WRITE;
/*!40000 ALTER TABLE `volunteers_expert_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteers_expert_skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `volunteers_skills`
--

DROP TABLE IF EXISTS `volunteers_skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volunteers_skills` (
  `volunteers` bigint(20) NOT NULL,
  `skills` bigint(20) NOT NULL,
  PRIMARY KEY (`volunteers`,`skills`),
  KEY `FK_jwt8p6ax7xyb0l7kjpict5808` (`skills`),
  CONSTRAINT `FK_p0wt95reyw9mj8yga8p0uois6` FOREIGN KEY (`volunteers`) REFERENCES `volunteers` (`id`),
  CONSTRAINT `FK_jwt8p6ax7xyb0l7kjpict5808` FOREIGN KEY (`skills`) REFERENCES `skills` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteers_skills`
--

LOCK TABLES `volunteers_skills` WRITE;
/*!40000 ALTER TABLE `volunteers_skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `volunteers_skills` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-31 20:29:42
