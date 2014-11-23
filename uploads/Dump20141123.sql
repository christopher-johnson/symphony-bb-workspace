CREATE DATABASE  IF NOT EXISTS `symphony` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `symphony`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: symphony
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `sym_authors`
--

DROP TABLE IF EXISTS `sym_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_authors` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_seen` datetime DEFAULT '0000-00-00 00:00:00',
  `user_type` enum('author','manager','developer') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'author',
  `primary` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token_active` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `language` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_authors`
--

LOCK TABLES `sym_authors` WRITE;
/*!40000 ALTER TABLE `sym_authors` DISABLE KEYS */;
INSERT INTO `sym_authors` VALUES (1,'christopher','PBKDF2v1|10000|9471dc377cad957432c6|wtUKfxCRnT7mK/0glM+dD37QGi+/k5LHU1oNsIFy8jXqOsitny5EYA==','Christopher','Johnson','christopher.johnson@wikimedia.de','2014-11-23 03:02:11','developer','yes',NULL,'no',NULL);
/*!40000 ALTER TABLE `sym_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_cache`
--

DROP TABLE IF EXISTS `sym_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_cache`
--

LOCK TABLES `sym_cache` WRITE;
/*!40000 ALTER TABLE `sym_cache` DISABLE KEYS */;
INSERT INTO `sym_cache` VALUES (58,'5bed1cab3cf91295c4c133c331f4c9ca',1416702568,1416702868,'eJytkj9rwzAQxfd+CnG7LKehpA1Wtg7ZMnToFmT5sEX0j5OE3G9fBwIpJW2H5njLLe+9+3GdDtaiziZ4Njvr03Y2Eqac41aIWmtT102gUTy27Uq87722ZUBgXjmUIIZeqBiT6G1x6HulJ2CheiQJanDGAxsplChh6BWwiORMSktUkkB1Jn4W7B7YMh1hCoU0XryvlkflVQ7O4HH13D41S8sfQi7btxhO/CwQt3NqoBPPHxHTL8636v/hmzHle3f9wmRBUmjEpCejp7yg2WxemrfXPT/cnZA1/7ukE9cf230C2wzSfw==');
/*!40000 ALTER TABLE `sym_cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries`
--

DROP TABLE IF EXISTS `sym_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  `modification_date` datetime NOT NULL,
  `modification_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`),
  KEY `modification_date` (`modification_date`),
  KEY `modification_date_gmt` (`modification_date_gmt`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries`
--

LOCK TABLES `sym_entries` WRITE;
/*!40000 ALTER TABLE `sym_entries` DISABLE KEYS */;
INSERT INTO `sym_entries` VALUES (1,2,1,'2011-07-21 15:03:54','2011-07-21 05:03:54','2011-07-21 15:03:54','2011-07-21 05:03:54'),(2,2,1,'2011-07-21 15:05:01','2011-07-21 05:05:01','2011-07-21 15:05:01','2011-07-21 05:05:01'),(3,1,1,'2011-07-21 15:05:45','2011-07-21 05:05:45','2014-11-23 01:01:48','2014-11-23 00:01:48'),(4,1,1,'2011-07-21 15:06:00','2011-07-21 05:06:00','2011-07-21 15:06:00','2011-07-21 05:06:00'),(10,5,1,'2014-11-23 01:27:05','2014-11-23 00:27:05','2014-11-23 01:27:05','2014-11-23 00:27:05'),(7,2,1,'2014-11-23 00:57:52','2014-11-22 23:57:52','2014-11-23 00:57:52','2014-11-22 23:57:52'),(8,1,1,'2014-11-23 00:58:38','2014-11-22 23:58:38','2014-11-23 01:27:38','2014-11-23 00:27:38');
/*!40000 ALTER TABLE `sym_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_1`
--

DROP TABLE IF EXISTS `sym_entries_data_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_1`
--

LOCK TABLES `sym_entries_data_1` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_1` DISABLE KEYS */;
INSERT INTO `sym_entries_data_1` VALUES (15,3,'a-primer-to-symphony-2s-default-theme','A primer to Symphony 2\'s default theme'),(11,4,'an-example-draft-article','An example draft article'),(17,8,'blumenbach-tei-datenbank','Blumenbach TEI Datenbank');
/*!40000 ALTER TABLE `sym_entries_data_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_10`
--

DROP TABLE IF EXISTS `sym_entries_data_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_10`
--

LOCK TABLES `sym_entries_data_10` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_10` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_11`
--

DROP TABLE IF EXISTS `sym_entries_data_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_11`
--

LOCK TABLES `sym_entries_data_11` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_11` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_12`
--

DROP TABLE IF EXISTS `sym_entries_data_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_12`
--

LOCK TABLES `sym_entries_data_12` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_12` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_13`
--

DROP TABLE IF EXISTS `sym_entries_data_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_13`
--

LOCK TABLES `sym_entries_data_13` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_13` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_14`
--

DROP TABLE IF EXISTS `sym_entries_data_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_14`
--

LOCK TABLES `sym_entries_data_14` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_14` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_14` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_15`
--

DROP TABLE IF EXISTS `sym_entries_data_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_15`
--

LOCK TABLES `sym_entries_data_15` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_15` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_16`
--

DROP TABLE IF EXISTS `sym_entries_data_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) unsigned NOT NULL,
  `mimetype` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `file` (`file`),
  KEY `mimetype` (`mimetype`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_16`
--

LOCK TABLES `sym_entries_data_16` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_16` DISABLE KEYS */;
INSERT INTO `sym_entries_data_16` VALUES (1,10,'blumenbach.png',17836,'image/png','a:3:{s:8:\"creation\";s:25:\"2014-11-23T01:27:05+01:00\";s:5:\"width\";i:100;s:6:\"height\";i:100;}');
/*!40000 ALTER TABLE `sym_entries_data_16` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_17`
--

DROP TABLE IF EXISTS `sym_entries_data_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_17`
--

LOCK TABLES `sym_entries_data_17` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_17` DISABLE KEYS */;
INSERT INTO `sym_entries_data_17` VALUES (1,10,8);
/*!40000 ALTER TABLE `sym_entries_data_17` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_18`
--

DROP TABLE IF EXISTS `sym_entries_data_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_18`
--

LOCK TABLES `sym_entries_data_18` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_18` DISABLE KEYS */;
INSERT INTO `sym_entries_data_18` VALUES (1,10,'Blumenbach','<p>Blumenbach</p>\n');
/*!40000 ALTER TABLE `sym_entries_data_18` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_19`
--

DROP TABLE IF EXISTS `sym_entries_data_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_19`
--

LOCK TABLES `sym_entries_data_19` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_19` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_19` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_2`
--

DROP TABLE IF EXISTS `sym_entries_data_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_2`
--

LOCK TABLES `sym_entries_data_2` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_2` DISABLE KEYS */;
INSERT INTO `sym_entries_data_2` VALUES (15,3,'Every theme in Symphony has an important mission: to introduce newcomers to Symphony by way of a working example. *Spectrum*, the name of this version\'s default theme, was designed and developed with such a mission in mind by following a set of constraints. A default theme is required to:\r\n\r\n1. be presented in a format that is universally identified and intuitive.\r\n2. have a clear and simple HTML structure.\r\n3. demonstrate the fundamental concepts in Symphony—[sections](http://getsymphony.com/learn/concepts/view/sections/), [fields](http://getsymphony.com/learn/concepts/view/fields/), [data sources](http://getsymphony.com/learn/concepts/view/data-sources/) and [events](http://getsymphony.com/learn/concepts/view/events/)—and their interactions together.\r\n4. avoid functionality that does not have any educational value.\r\n\r\n#### The design ####\r\n\r\nOur first rule states that a default theme needs to be in a format that is instantly recognisable to a user. As a result, all of the themes created in Symphony\'s history have emphasised a weblog structure. *Spectrum* continues this tradition.\r\n\r\n*Cubic*, the name of a previous default theme, followed the teaching mandate very closely. However, the theme took it one step further and removed complex structure and colour in favour of a simplified look and feel. The main design goal for *Spectrum* is to introduce more colours but still follow the philosophy of a simplistic layout.\r\n\r\n#### Features ####\r\n\r\n*Spectrum* has a handful of additional features that you won\'t find in previous default themes. These new features are not only meant to demonstrate the capabilities of the system but also explain some fundamental philosophies in Symphony 2. Below is a list of features:\r\n\r\n- Logged in users will see links to Symphony\'s admin to edit articles, manage comments and add notes.\r\n- Logged in users will see 3 protected menu items, article drafts, the debug page and a link to the Symphony admin.\r\n- Articles on the drafts page sport a button to publish the article.\r\n- Article images take advantage of Symphony\'s build-in image manipulation feature to crop and size the image automatically.\r\n- The contact form on the about page saves the content to the Messages section on the back end and emails the website\'s owner.\r\n\r\n#### Philosophy ####\r\n\r\nAll of the above takes advantage of new features found in version 2. An important concept that is being advocated in Symphony is the practise of creating a tighter connection between the front end and the back end. Developers are encouraged to take advantage of the simplified URL structure of the admin to create a more convenient environment for their users.\r\n\r\nWith the introduction of the Event editor, developers now have even more control when developing a website. For example, the *Publish* button on the [article drafts page](../../drafts/) utilises the event editor to create an interaction between the front end and the back end. This allows the *Publish* button to update the \"Publish this article\" checkbox field from the \"Articles\" section. This feature also compliments and encourages the philosophy of a more seamless environment between the website and the admin interface.','<p>Every theme in Symphony has an important mission: to introduce newcomers to Symphony by way of a working example. <em>Spectrum</em>, the name of this version\'s default theme, was designed and developed with such a mission in mind by following a set of constraints. A default theme is required to:</p>\n\n<ol>\n<li>be presented in a format that is universally identified and intuitive.</li>\n<li>have a clear and simple HTML structure.</li>\n<li>demonstrate the fundamental concepts in Symphony—<a href=\"http://getsymphony.com/learn/concepts/view/sections/\">sections</a>, <a href=\"http://getsymphony.com/learn/concepts/view/fields/\">fields</a>, <a href=\"http://getsymphony.com/learn/concepts/view/data-sources/\">data sources</a> and <a href=\"http://getsymphony.com/learn/concepts/view/events/\">events</a>—and their interactions together.</li>\n<li>avoid functionality that does not have any educational value.</li>\n</ol>\n\n<h4>The design</h4>\n\n<p>Our first rule states that a default theme needs to be in a format that is instantly recognisable to a user. As a result, all of the themes created in Symphony\'s history have emphasised a weblog structure. <em>Spectrum</em> continues this tradition.</p>\n\n<p><em>Cubic</em>, the name of a previous default theme, followed the teaching mandate very closely. However, the theme took it one step further and removed complex structure and colour in favour of a simplified look and feel. The main design goal for <em>Spectrum</em> is to introduce more colours but still follow the philosophy of a simplistic layout.</p>\n\n<h4>Features</h4>\n\n<p><em>Spectrum</em> has a handful of additional features that you won\'t find in previous default themes. These new features are not only meant to demonstrate the capabilities of the system but also explain some fundamental philosophies in Symphony 2. Below is a list of features:</p>\n\n<ul>\n<li>Logged in users will see links to Symphony\'s admin to edit articles, manage comments and add notes.</li>\n<li>Logged in users will see 3 protected menu items, article drafts, the debug page and a link to the Symphony admin.</li>\n<li>Articles on the drafts page sport a button to publish the article.</li>\n<li>Article images take advantage of Symphony\'s build-in image manipulation feature to crop and size the image automatically.</li>\n<li>The contact form on the about page saves the content to the Messages section on the back end and emails the website\'s owner.</li>\n</ul>\n\n<h4>Philosophy</h4>\n\n<p>All of the above takes advantage of new features found in version 2. An important concept that is being advocated in Symphony is the practise of creating a tighter connection between the front end and the back end. Developers are encouraged to take advantage of the simplified URL structure of the admin to create a more convenient environment for their users.</p>\n\n<p>With the introduction of the Event editor, developers now have even more control when developing a website. For example, the <em>Publish</em> button on the <a href=\"../../drafts/\">article drafts page</a> utilises the event editor to create an interaction between the front end and the back end. This allows the <em>Publish</em> button to update the \"Publish this article\" checkbox field from the \"Articles\" section. This feature also compliments and encourages the philosophy of a more seamless environment between the website and the admin interface.</p>\n'),(11,4,'This is an example draft article. Feel free to test the system by pressing the *publish* button.','<p>This is an example draft article. Feel free to test the system by pressing the <em>publish</em> button.</p>\n'),(17,8,'Das Langzeitprojekt  „Johann Friedrich Blumenbach – online“  ist ein Vorhaben im Rahmen des Akademienprogramms der Union der deutschen Akademien der Wissenschaften, angesiedelt bei der Akademie der Wissenschaften zu Göttingen.\r\n      \r\nDas Vorhaben umfasst\r\neine Neuausgabe von Blumenbachs Originaltexten nebst deren Übersetzungen und Folgeauflagen\r\ndie Erschließung seiner Korrespondenz\r\neine Rekonstruktion seiner Sammlung naturhistorischer Objekte\r\neine Dokumentation der zeitgenössischen und späteren Rezeption Blumenbachs\r\ndie Verknüpfung von digitalisierten Texten und Objekten durch Hyperlinks\r\nbiographische Studien zu Blumenbach.','<p>Das Langzeitprojekt  „Johann Friedrich Blumenbach – online“  ist ein Vorhaben im Rahmen des Akademienprogramms der Union der deutschen Akademien der Wissenschaften, angesiedelt bei der Akademie der Wissenschaften zu Göttingen.</p>\n\n<p>Das Vorhaben umfasst\neine Neuausgabe von Blumenbachs Originaltexten nebst deren Übersetzungen und Folgeauflagen\ndie Erschließung seiner Korrespondenz\neine Rekonstruktion seiner Sammlung naturhistorischer Objekte\neine Dokumentation der zeitgenössischen und späteren Rezeption Blumenbachs\ndie Verknüpfung von digitalisierten Texten und Objekten durch Hyperlinks\nbiographische Studien zu Blumenbach.</p>\n');
/*!40000 ALTER TABLE `sym_entries_data_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_20`
--

DROP TABLE IF EXISTS `sym_entries_data_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_20` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_20`
--

LOCK TABLES `sym_entries_data_20` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_20` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_21`
--

DROP TABLE IF EXISTS `sym_entries_data_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_21` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_21`
--

LOCK TABLES `sym_entries_data_21` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_21` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_21` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_22`
--

DROP TABLE IF EXISTS `sym_entries_data_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_22`
--

LOCK TABLES `sym_entries_data_22` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_22` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_22` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_3`
--

DROP TABLE IF EXISTS `sym_entries_data_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_3`
--

LOCK TABLES `sym_entries_data_3` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_3` DISABLE KEYS */;
INSERT INTO `sym_entries_data_3` VALUES (15,3,'2012-03-10T12:21:00+01:00','2012-03-10 11:21:00'),(11,4,'2012-03-10T21:21:00+10:00','2012-03-10 11:21:00'),(17,8,'2014-11-23T00:57:00+01:00','2014-11-22 23:57:00');
/*!40000 ALTER TABLE `sym_entries_data_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_4`
--

DROP TABLE IF EXISTS `sym_entries_data_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_4`
--

LOCK TABLES `sym_entries_data_4` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_4` DISABLE KEYS */;
INSERT INTO `sym_entries_data_4` VALUES (15,3,1),(11,4,2),(17,8,7);
/*!40000 ALTER TABLE `sym_entries_data_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_5`
--

DROP TABLE IF EXISTS `sym_entries_data_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_5`
--

LOCK TABLES `sym_entries_data_5` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_5` DISABLE KEYS */;
INSERT INTO `sym_entries_data_5` VALUES (15,3,'no'),(11,4,'no'),(17,8,'yes');
/*!40000 ALTER TABLE `sym_entries_data_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_6`
--

DROP TABLE IF EXISTS `sym_entries_data_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_6`
--

LOCK TABLES `sym_entries_data_6` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_6` DISABLE KEYS */;
INSERT INTO `sym_entries_data_6` VALUES (1,1,'symphony','Symphony'),(2,2,'announcement','Announcement'),(11,7,'blumenbach-tei-datenbank','Blumenbach TEI Datenbank');
/*!40000 ALTER TABLE `sym_entries_data_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_7`
--

DROP TABLE IF EXISTS `sym_entries_data_7`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_7`
--

LOCK TABLES `sym_entries_data_7` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_7` DISABLE KEYS */;
INSERT INTO `sym_entries_data_7` VALUES (1,1,'All about Symphony, an open source XSLT Content Management System.','<p>All about Symphony, an open source XSLT Content Management System.</p>\n'),(2,2,'Important news and updates.','<p>Important news and updates.</p>\n');
/*!40000 ALTER TABLE `sym_entries_data_7` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_8`
--

DROP TABLE IF EXISTS `sym_entries_data_8`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`),
  KEY `date` (`date`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_8`
--

LOCK TABLES `sym_entries_data_8` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_8` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_8` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_entries_data_9`
--

DROP TABLE IF EXISTS `sym_entries_data_9`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `value_formatted` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_entries_data_9`
--

LOCK TABLES `sym_entries_data_9` WRITE;
/*!40000 ALTER TABLE `sym_entries_data_9` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_entries_data_9` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_extensions`
--

DROP TABLE IF EXISTS `sym_extensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_extensions`
--

LOCK TABLES `sym_extensions` WRITE;
/*!40000 ALTER TABLE `sym_extensions` DISABLE KEYS */;
INSERT INTO `sym_extensions` VALUES (129,'debugdevkit','enabled','1.3.2'),(130,'export_ensemble','enabled','2.1.1'),(131,'selectbox_link_field','enabled','1.32'),(132,'jit_image_manipulation','enabled','1.31'),(133,'maintenance_mode','enabled','1.8.2'),(134,'profiledevkit','enabled','1.5.1'),(135,'markdown','enabled','1.20'),(136,'xssfilter','enabled','1.4'),(137,'remote_datasource','enabled','2.1.1');
/*!40000 ALTER TABLE `sym_extensions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_extensions_delegates`
--

DROP TABLE IF EXISTS `sym_extensions_delegates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM AUTO_INCREMENT=239 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_extensions_delegates`
--

LOCK TABLES `sym_extensions_delegates` WRITE;
/*!40000 ALTER TABLE `sym_extensions_delegates` DISABLE KEYS */;
INSERT INTO `sym_extensions_delegates` VALUES (238,129,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(237,129,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(219,130,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(230,133,'/blueprints/pages/','AppendPageContent','__appendType'),(229,133,'/backend/','AppendPageAlert','__appendAlert'),(228,133,'/system/preferences/','CustomActions','__toggleMaintenanceMode'),(236,134,'/frontend/','ManipulateDevKitNavigation','manipulateDevKitNavigation'),(235,134,'/frontend/','FrontendDevKitResolve','frontendDevKitResolve'),(222,136,'/blueprints/events/new/','AppendEventFilter','appendEventFilter'),(227,133,'/system/preferences/','Save','__SavePreferences'),(233,132,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(226,133,'/system/preferences/','AddCustomPreferenceFieldsets','appendPreferences'),(221,136,'/blueprints/events/','AppendEventFilterDocumentation','appendEventFilterDocumentation'),(220,137,'/system/preferences/','AddCachingOpportunity','addCachingOpportunity'),(223,136,'/blueprints/events/edit/','AppendEventFilter','appendEventFilter'),(224,136,'/frontend/','EventPreSaveFilter','eventPreSaveFilter'),(225,136,'/frontend/','FrontendParamsResolve','frontendParamsResolve'),(231,133,'/frontend/','FrontendPrePageResolve','__checkForMaintenanceMode'),(232,133,'/frontend/','FrontendParamsResolve','__addParam'),(234,132,'/system/preferences/','Save','__SavePreferences');
/*!40000 ALTER TABLE `sym_extensions_delegates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields`
--

DROP TABLE IF EXISTS `sym_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields`
--

LOCK TABLES `sym_fields` WRITE;
/*!40000 ALTER TABLE `sym_fields` DISABLE KEYS */;
INSERT INTO `sym_fields` VALUES (1,'Title','title','input',1,'yes',0,'main','yes'),(2,'Body','body','textarea',1,'yes',1,'main','no'),(3,'Date','date','date',1,'no',2,'sidebar','yes'),(4,'Categories','categories','selectbox_link',1,'yes',3,'sidebar','yes'),(5,'Publish','publish','checkbox',1,'no',4,'sidebar','yes'),(6,'Title','title','input',2,'yes',0,'main','yes'),(7,'Description','description','textarea',2,'no',1,'main','yes'),(8,'Date','date','date',3,'no',0,'main','yes'),(9,'Note','note','textarea',3,'yes',1,'main','yes'),(10,'Author','author','input',4,'yes',0,'main','yes'),(11,'Email','email','input',4,'yes',1,'main','yes'),(12,'Website','website','input',4,'no',2,'main','yes'),(13,'Date','date','date',4,'no',3,'main','yes'),(14,'Article','article','selectbox_link',4,'yes',4,'sidebar','yes'),(15,'Comment','comment','textarea',4,'yes',5,'sidebar','no'),(16,'Image','image','upload',5,'yes',0,'sidebar','yes'),(17,'Article','article','selectbox_link',5,'yes',1,'main','yes'),(18,'Description','description','textarea',5,'yes',2,'sidebar','no'),(19,'Name','name','input',6,'yes',0,'main','yes'),(20,'Email','email','input',6,'yes',1,'main','yes'),(21,'Subject','subject','input',6,'no',2,'main','yes'),(22,'Message','message','textarea',6,'no',3,'sidebar','no');
/*!40000 ALTER TABLE `sym_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_author`
--

DROP TABLE IF EXISTS `sym_fields_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `author_types` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_author`
--

LOCK TABLES `sym_fields_author` WRITE;
/*!40000 ALTER TABLE `sym_fields_author` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_checkbox`
--

DROP TABLE IF EXISTS `sym_fields_checkbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_checkbox`
--

LOCK TABLES `sym_fields_checkbox` WRITE;
/*!40000 ALTER TABLE `sym_fields_checkbox` DISABLE KEYS */;
INSERT INTO `sym_fields_checkbox` VALUES (4,5,'off','Publish this article');
/*!40000 ALTER TABLE `sym_fields_checkbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_date`
--

DROP TABLE IF EXISTS `sym_fields_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_date`
--

LOCK TABLES `sym_fields_date` WRITE;
/*!40000 ALTER TABLE `sym_fields_date` DISABLE KEYS */;
INSERT INTO `sym_fields_date` VALUES (6,3,'now'),(2,8,'now'),(3,13,'now');
/*!40000 ALTER TABLE `sym_fields_date` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_input`
--

DROP TABLE IF EXISTS `sym_fields_input`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_input`
--

LOCK TABLES `sym_fields_input` WRITE;
/*!40000 ALTER TABLE `sym_fields_input` DISABLE KEYS */;
INSERT INTO `sym_fields_input` VALUES (11,1,NULL),(2,6,NULL),(3,10,NULL),(4,11,'/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i'),(5,12,'/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/'),(6,19,NULL),(7,20,'/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i'),(8,21,NULL);
/*!40000 ALTER TABLE `sym_fields_input` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_select`
--

DROP TABLE IF EXISTS `sym_fields_select`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_select`
--

LOCK TABLES `sym_fields_select` WRITE;
/*!40000 ALTER TABLE `sym_fields_select` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_select` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_selectbox_link`
--

DROP TABLE IF EXISTS `sym_fields_selectbox_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  `hide_when_prepopulated` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_selectbox_link`
--

LOCK TABLES `sym_fields_selectbox_link` WRITE;
/*!40000 ALTER TABLE `sym_fields_selectbox_link` DISABLE KEYS */;
INSERT INTO `sym_fields_selectbox_link` VALUES (1,14,'no','1',20,'no'),(5,17,'no','1',20,'no'),(4,4,'no','6',20,'no');
/*!40000 ALTER TABLE `sym_fields_selectbox_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_taglist`
--

DROP TABLE IF EXISTS `sym_fields_taglist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_taglist`
--

LOCK TABLES `sym_fields_taglist` WRITE;
/*!40000 ALTER TABLE `sym_fields_taglist` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_fields_taglist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_textarea`
--

DROP TABLE IF EXISTS `sym_fields_textarea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_textarea`
--

LOCK TABLES `sym_fields_textarea` WRITE;
/*!40000 ALTER TABLE `sym_fields_textarea` DISABLE KEYS */;
INSERT INTO `sym_fields_textarea` VALUES (1,2,'markdown',20),(2,7,'markdown',5),(3,9,'markdown',15),(4,15,'markdown_with_purifier',8),(7,18,'markdown',9),(6,22,NULL,9);
/*!40000 ALTER TABLE `sym_fields_textarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_fields_upload`
--

DROP TABLE IF EXISTS `sym_fields_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_fields_upload`
--

LOCK TABLES `sym_fields_upload` WRITE;
/*!40000 ALTER TABLE `sym_fields_upload` DISABLE KEYS */;
INSERT INTO `sym_fields_upload` VALUES (2,16,'/workspace/uploads','/\\.(?:bmp|gif|jpe?g|png)$/i');
/*!40000 ALTER TABLE `sym_fields_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_forgotpass`
--

DROP TABLE IF EXISTS `sym_forgotpass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_forgotpass` (
  `author_id` int(11) NOT NULL DEFAULT '0',
  `token` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `expiry` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_forgotpass`
--

LOCK TABLES `sym_forgotpass` WRITE;
/*!40000 ALTER TABLE `sym_forgotpass` DISABLE KEYS */;
/*!40000 ALTER TABLE `sym_forgotpass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_pages`
--

DROP TABLE IF EXISTS `sym_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_pages`
--

LOCK TABLES `sym_pages` WRITE;
/*!40000 ALTER TABLE `sym_pages` DISABLE KEYS */;
INSERT INTO `sym_pages` VALUES (64,NULL,'Home','home',NULL,'category','article_images,homepage_articles,logged_in_author,navigation,notes',NULL,1),(66,NULL,'About','about',NULL,NULL,'logged_in_author,navigation,website_owner','save_message',5),(67,NULL,'RSS','rss',NULL,NULL,'rss_articles',NULL,9),(68,NULL,'Archive','archive',NULL,'year','archive,logged_in_author,navigation',NULL,4),(69,NULL,'Articles','articles',NULL,'entry/cat','article,article_images,comments,logged_in_author,navigation','save_comment',2),(70,NULL,'Drafts','drafts',NULL,'entry','article_images,drafts,logged_in_author,navigation','publish_article',3),(75,NULL,'Maintenance','maintenance',NULL,NULL,NULL,NULL,10),(76,NULL,'Page Not Found','page-not-found',NULL,NULL,NULL,NULL,11),(77,78,'Works','works','list','work','navigation,work',NULL,12),(78,NULL,'Bibliographie','list',NULL,NULL,'listwork,navigation',NULL,13),(79,NULL,'Briefregesten','briefregesten',NULL,NULL,'listwork,logged_in_author,navigation',NULL,14);
/*!40000 ALTER TABLE `sym_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_pages_types`
--

DROP TABLE IF EXISTS `sym_pages_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=688 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_pages_types`
--

LOCK TABLES `sym_pages_types` WRITE;
/*!40000 ALTER TABLE `sym_pages_types` DISABLE KEYS */;
INSERT INTO `sym_pages_types` VALUES (659,76,'hidden'),(680,70,'admin'),(656,75,'hidden'),(677,64,'hidden'),(679,69,'hidden'),(463,67,'XML'),(462,67,'hidden'),(678,64,'index'),(657,75,'maintenance'),(658,76,'404'),(685,77,'XML'),(686,78,'XML'),(687,79,'XML');
/*!40000 ALTER TABLE `sym_pages_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sections`
--

DROP TABLE IF EXISTS `sym_sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `filter` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sections`
--

LOCK TABLES `sym_sections` WRITE;
/*!40000 ALTER TABLE `sym_sections` DISABLE KEYS */;
INSERT INTO `sym_sections` VALUES (1,'Articles','articles',1,'no','yes','Content'),(2,'Categories','categories',2,'no','yes','Content'),(3,'Notes','notes',3,'no','yes','Content'),(4,'Comments','comments',4,'no','yes','Content'),(5,'Images','images',5,'yes','yes','Content'),(6,'Messages','messages',6,'no','yes','Content');
/*!40000 ALTER TABLE `sym_sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sections_association`
--

DROP TABLE IF EXISTS `sym_sections_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `interface` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `editor` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sections_association`
--

LOCK TABLES `sym_sections_association` WRITE;
/*!40000 ALTER TABLE `sym_sections_association` DISABLE KEYS */;
INSERT INTO `sym_sections_association` VALUES (1,1,1,4,14,'no',NULL,NULL),(5,1,1,5,17,'no',NULL,NULL),(4,2,6,1,4,'no',NULL,NULL);
/*!40000 ALTER TABLE `sym_sections_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sym_sessions`
--

DROP TABLE IF EXISTS `sym_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sym_sessions` (
  `session` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `session_expires` int(10) unsigned NOT NULL DEFAULT '0',
  `session_data` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`session`),
  KEY `session_expires` (`session_expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sym_sessions`
--

LOCK TABLES `sym_sessions` WRITE;
/*!40000 ALTER TABLE `sym_sessions` DISABLE KEYS */;
INSERT INTO `sym_sessions` VALUES ('ssb4h555q7gikhm5bu9j1rrtu4',1416708131,'sym-|a:3:{s:10:\"xsrf-token\";a:1:{s:27:\"y/TUPqDphUuJe3cYuDxTn9FcK2g\";i:1;}s:8:\"username\";s:11:\"christopher\";s:4:\"pass\";s:92:\"PBKDF2v1|10000|9471dc377cad957432c6|wtUKfxCRnT7mK/0glM+dD37QGi+/k5LHU1oNsIFy8jXqOsitny5EYA==\";}');
/*!40000 ALTER TABLE `sym_sessions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-23  3:04:27
