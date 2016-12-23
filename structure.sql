-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: ebdb
-- ------------------------------------------------------
-- Server version	5.6.26

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
-- Table structure for table `account_children`
--

DROP TABLE IF EXISTS `account_children`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_children` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account_managers`
--

DROP TABLE IF EXISTS `account_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_managers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT 'Usually a business name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `activeusers`
--

DROP TABLE IF EXISTS `activeusers`;
/*!50001 DROP VIEW IF EXISTS `activeusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activeusers` AS SELECT 
 1 AS `id`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `name`,
 1 AS `gender`,
 1 AS `timestamp_created`,
 1 AS `num_orders`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `activeusersinlawithpush`
--

DROP TABLE IF EXISTS `activeusersinlawithpush`;
/*!50001 DROP VIEW IF EXISTS `activeusersinlawithpush`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activeusersinlawithpush` AS SELECT 
 1 AS `id`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `timestamp_created`,
 1 AS `arn_endpoint`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `activeuserswithpush`
--

DROP TABLE IF EXISTS `activeuserswithpush`;
/*!50001 DROP VIEW IF EXISTS `activeuserswithpush`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `activeuserswithpush` AS SELECT 
 1 AS `id`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `timestamp_created`,
 1 AS `arn_endpoint`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `api_keys`
--

DROP TABLE IF EXISTS `api_keys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `api_keys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` varchar(255) NOT NULL,
  `api_key` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL COMMENT 'standard or referral',
  `value` int(11) NOT NULL DEFAULT '0' COMMENT 'if type is standard, the value of the discount in cents',
  `owner_user_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'if this is a referral, then the user id of the origin account',
  `used_by_license_plates` mediumtext NOT NULL COMMENT 'comma-separated list of license plates',
  `used_by_user_ids` mediumtext NOT NULL COMMENT 'comma-separated list of user ids',
  `max_uses` int(11) NOT NULL DEFAULT '1999999999',
  `only_for_first_orders` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'All coupons can only be used once, but coupons with this field as TRUE can only be used on vehicles that have never been part of an order',
  `zip_codes` text NOT NULL,
  `expiration_time` int(11) NOT NULL DEFAULT '1999999999' COMMENT 'coupon can''t be used after this point in time',
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `couriers`
--

DROP TABLE IF EXISTS `couriers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `couriers` (
  `id` varchar(255) NOT NULL COMMENT 'should match id of ''user'' this corresponds to',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `on_duty` tinyint(1) NOT NULL DEFAULT '0',
  `connected` tinyint(1) NOT NULL DEFAULT '0',
  `busy` tinyint(1) NOT NULL DEFAULT '0',
  `zones` mediumtext NOT NULL COMMENT 'zones they are servicing. ONLY USE ZONE NUMBERS THAT ARE DEFINED IN zones TABLE, or fatal error',
  `gallons_87` double NOT NULL DEFAULT '0',
  `gallons_91` double NOT NULL DEFAULT '0',
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  `last_ping` int(11) NOT NULL DEFAULT '0' COMMENT 'unix time of last ping',
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dashboard_users`
--

DROP TABLE IF EXISTS `dashboard_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dashboard_users` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL DEFAULT '',
  `reset_key` varchar(255) NOT NULL DEFAULT '',
  `permissions` text COMMENT 'comma-seperated permissions',
  `event_log` text,
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fleet_accounts`
--

DROP TABLE IF EXISTS `fleet_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fleet_accounts` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address_zip` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fleet_deliveries`
--

DROP TABLE IF EXISTS `fleet_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fleet_deliveries` (
  `id` varchar(255) NOT NULL,
  `fleet_location_id` varchar(255) NOT NULL,
  `courier_id` varchar(255) NOT NULL,
  `vin` varchar(255) NOT NULL DEFAULT '',
  `license_plate` varchar(255) NOT NULL DEFAULT '',
  `gas_type` varchar(255) NOT NULL,
  `is_top_tier` tinyint(1) NOT NULL DEFAULT '1',
  `gallons` double NOT NULL DEFAULT '0',
  `gas_price` int(11) NOT NULL DEFAULT '0',
  `service_fee` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `courier_id` (`courier_id`),
  KEY `vin` (`vin`),
  KEY `license_plate` (`license_plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fleet_locations`
--

DROP TABLE IF EXISTS `fleet_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fleet_locations` (
  `id` varchar(255) NOT NULL,
  `account_id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address_zip` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `inactiveusers`
--

DROP TABLE IF EXISTS `inactiveusers`;
/*!50001 DROP VIEW IF EXISTS `inactiveusers`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `inactiveusers` AS SELECT 
 1 AS `id`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `name`,
 1 AS `gender`,
 1 AS `timestamp_created`,
 1 AS `num_orders`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `inactiveuserswithpush`
--

DROP TABLE IF EXISTS `inactiveuserswithpush`;
/*!50001 DROP VIEW IF EXISTS `inactiveuserswithpush`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `inactiveuserswithpush` AS SELECT 
 1 AS `id`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `timestamp_created`,
 1 AS `arn_endpoint`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `mailchimpcsv`
--

DROP TABLE IF EXISTS `mailchimpcsv`;
/*!50001 DROP VIEW IF EXISTS `mailchimpcsv`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `mailchimpcsv` AS SELECT 
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `name`,
 1 AS `gender`,
 1 AS `timestamp_created`,
 1 AS `Orders`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT '',
  `user_id` varchar(255) NOT NULL DEFAULT '',
  `courier_id` varchar(255) NOT NULL DEFAULT '',
  `vehicle_id` varchar(255) NOT NULL DEFAULT '',
  `license_plate` varchar(255) NOT NULL DEFAULT '' COMMENT 'license plate of the vehicle at the time the order was made',
  `target_time_start` int(11) NOT NULL DEFAULT '0',
  `target_time_end` int(11) NOT NULL DEFAULT '0',
  `gallons` double DEFAULT NULL,
  `is_fillup` tinyint(1) NOT NULL DEFAULT '0',
  `gas_type` varchar(255) NOT NULL DEFAULT '',
  `is_top_tier` tinyint(1) NOT NULL DEFAULT '1',
  `tire_pressure_check` tinyint(1) NOT NULL DEFAULT '0',
  `special_instructions` text NOT NULL,
  `lat` double NOT NULL DEFAULT '0',
  `lng` double NOT NULL DEFAULT '0',
  `address_street` varchar(255) NOT NULL DEFAULT '',
  `address_city` varchar(255) NOT NULL DEFAULT '',
  `address_state` varchar(255) NOT NULL DEFAULT '',
  `address_zip` varchar(50) NOT NULL DEFAULT '',
  `referral_gallons_used` double NOT NULL DEFAULT '0',
  `coupon_code` varchar(255) NOT NULL DEFAULT '',
  `subscription_id` int(11) NOT NULL DEFAULT '0' COMMENT 'the subscription id that was used on this order - i.e., the subscription_id that the user had at the time they made the order',
  `subscription_discount` int(11) NOT NULL DEFAULT '0' COMMENT 'negative amount of cents; the total discount due to any subscription used',
  `gas_price` int(11) NOT NULL DEFAULT '0' COMMENT 'cents',
  `service_fee` int(11) NOT NULL DEFAULT '0' COMMENT 'cents',
  `total_price` int(11) NOT NULL DEFAULT '0' COMMENT 'cents',
  `paid` tinyint(1) DEFAULT '0',
  `stripe_charge_id` varchar(255) DEFAULT '',
  `stripe_refund_id` varchar(255) DEFAULT '',
  `stripe_customer_id_charged` varchar(255) DEFAULT '',
  `stripe_balance_transaction_id` varchar(255) DEFAULT '',
  `time_paid` int(11) DEFAULT '0',
  `payment_info` text,
  `number_rating` int(11) DEFAULT NULL COMMENT '0-5 stars',
  `text_rating` text,
  `event_log` mediumtext,
  `admin_event_log` text,
  `notes` text,
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `source` varchar(100) DEFAULT '',
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `api_key_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2951 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `state_log`
--

DROP TABLE IF EXISTS `state_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `state_log` (
  `data` mediumtext NOT NULL,
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `station_blacklist`
--

DROP TABLE IF EXISTS `station_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `station_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `station_id` varchar(255) NOT NULL,
  `creator_user_id` varchar(255) NOT NULL,
  `until` int(11) NOT NULL DEFAULT '1999999999' COMMENT 'station will be blacklisted until this unix time',
  `reason` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `station_id` (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `price` int(11) NOT NULL COMMENT 'cost in cents for every period (use -1 for subscriptions that can''t be purchased by normal users)',
  `period` int(11) NOT NULL DEFAULT '2592000',
  `num_free_one_hour` int(11) NOT NULL DEFAULT '0',
  `num_free_three_hour` int(11) NOT NULL DEFAULT '0',
  `num_free_five_hour` int(11) NOT NULL DEFAULT '0',
  `num_free_tire_pressure_check` int(11) NOT NULL DEFAULT '0',
  `discount_one_hour` int(11) NOT NULL DEFAULT '0' COMMENT 'discount in cents after the free deliveries are used per a period (should be a negative amount)',
  `discount_three_hour` int(11) NOT NULL DEFAULT '0',
  `discount_five_hour` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'native, facebook, or google',
  `password_hash` varchar(255) NOT NULL DEFAULT '',
  `reset_key` varchar(255) NOT NULL DEFAULT '',
  `phone_number` varchar(50) NOT NULL DEFAULT '',
  `phone_number_verified` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `gender` varchar(20) DEFAULT '',
  `saved_locations` text,
  `referral_code` varchar(255) NOT NULL DEFAULT '',
  `referral_gallons` double NOT NULL DEFAULT '0',
  `is_courier` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'if ''true'', there should be an entry with this id in the ''couriers'' table',
  `subscription_id` int(11) NOT NULL DEFAULT '0' COMMENT '0 means no subscription',
  `subscription_period_start_time` int(11) DEFAULT NULL COMMENT 'not necessarily equal to subscription_expiration_time - [the subscription''s period]',
  `subscription_expiration_time` int(11) DEFAULT NULL,
  `subscription_auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `subscription_payment_log` text,
  `stripe_customer_id` varchar(255) DEFAULT '',
  `stripe_cards` text,
  `stripe_default_card` varchar(255) DEFAULT NULL,
  `apns_token` varchar(255) NOT NULL DEFAULT '',
  `arn_endpoint` varchar(255) NOT NULL DEFAULT '',
  `os` varchar(255) DEFAULT '',
  `app_version` varchar(50) DEFAULT '',
  `sift_score` int(11) DEFAULT NULL COMMENT 'most recent sift score to determine if fraudulent user',
  `admin_event_log` text,
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `users augmented`
--

DROP TABLE IF EXISTS `users augmented`;
/*!50001 DROP VIEW IF EXISTS `users augmented`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `users augmented` AS SELECT 
 1 AS `id`,
 1 AS `email`,
 1 AS `phone_number`,
 1 AS `name`,
 1 AS `gender`,
 1 AS `timestamp_created`,
 1 AS `Orders`,
 1 AS `Referral Gallons Unused`,
 1 AS `Referral Gallons Used`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vehicles`
--

DROP TABLE IF EXISTS `vehicles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vehicles` (
  `id` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `user_id` varchar(255) NOT NULL,
  `year` varchar(50) NOT NULL,
  `make` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `gas_type` varchar(255) NOT NULL,
  `only_top_tier` tinyint(1) NOT NULL DEFAULT '1',
  `license_plate` varchar(255) NOT NULL,
  `vin` varchar(255) DEFAULT NULL,
  `photo` mediumtext NOT NULL,
  `timestamp_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_2` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zctas`
--

DROP TABLE IF EXISTS `zctas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zctas` (
  `zip` int(5) unsigned zerofill NOT NULL,
  `coordinates` text NOT NULL COMMENT 'zcta boundary coordinates',
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='zcta boundary coordinates using cb_2014_us_zcta510_500k.kml';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zips`
--

DROP TABLE IF EXISTS `zips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zips` (
  `zip` varchar(20) NOT NULL COMMENT 'the zip code',
  `zones` varchar(2000) DEFAULT NULL COMMENT 'comm-separated list of zone ids that this zip is a member of',
  PRIMARY KEY (`zip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `zones`
--

DROP TABLE IF EXISTS `zones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(1) NOT NULL,
  `color` varchar(20) NOT NULL DEFAULT '#DBDCDD',
  `config` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=339 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `activeusers`
--

/*!50001 DROP VIEW IF EXISTS `activeusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`purplemaster`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activeusers` AS select `ebdb`.`users`.`id` AS `id`,`ebdb`.`users`.`email` AS `email`,`ebdb`.`users`.`phone_number` AS `phone_number`,`ebdb`.`users`.`name` AS `name`,`ebdb`.`users`.`gender` AS `gender`,`ebdb`.`users`.`timestamp_created` AS `timestamp_created`,(select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) AS `num_orders` from `users` where ((select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) > 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `activeusersinlawithpush`
--

/*!50001 DROP VIEW IF EXISTS `activeusersinlawithpush`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`purplemaster`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activeusersinlawithpush` AS select `ebdb`.`users`.`id` AS `id`,`ebdb`.`users`.`email` AS `email`,`ebdb`.`users`.`phone_number` AS `phone_number`,`ebdb`.`users`.`timestamp_created` AS `timestamp_created`,`ebdb`.`users`.`arn_endpoint` AS `arn_endpoint` from `users` where ((`ebdb`.`users`.`arn_endpoint` <> '') and ((select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete') and (`ebdb`.`orders`.`address_zip` regexp '^9[01].*$'))) > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `activeuserswithpush`
--

/*!50001 DROP VIEW IF EXISTS `activeuserswithpush`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`purplemaster`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `activeuserswithpush` AS select `ebdb`.`users`.`id` AS `id`,`ebdb`.`users`.`email` AS `email`,`ebdb`.`users`.`phone_number` AS `phone_number`,`ebdb`.`users`.`timestamp_created` AS `timestamp_created`,`ebdb`.`users`.`arn_endpoint` AS `arn_endpoint` from `users` where ((`ebdb`.`users`.`arn_endpoint` <> '') and ((select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) > 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inactiveusers`
--

/*!50001 DROP VIEW IF EXISTS `inactiveusers`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`purplemaster`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `inactiveusers` AS select `ebdb`.`users`.`id` AS `id`,`ebdb`.`users`.`email` AS `email`,`ebdb`.`users`.`phone_number` AS `phone_number`,`ebdb`.`users`.`name` AS `name`,`ebdb`.`users`.`gender` AS `gender`,`ebdb`.`users`.`timestamp_created` AS `timestamp_created`,(select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) AS `num_orders` from `users` where ((select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inactiveuserswithpush`
--

/*!50001 DROP VIEW IF EXISTS `inactiveuserswithpush`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`purplemaster`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `inactiveuserswithpush` AS select `ebdb`.`users`.`id` AS `id`,`ebdb`.`users`.`email` AS `email`,`ebdb`.`users`.`phone_number` AS `phone_number`,`ebdb`.`users`.`timestamp_created` AS `timestamp_created`,`ebdb`.`users`.`arn_endpoint` AS `arn_endpoint` from `users` where ((`ebdb`.`users`.`arn_endpoint` <> '') and ((select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `mailchimpcsv`
--

/*!50001 DROP VIEW IF EXISTS `mailchimpcsv`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`purplemaster`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `mailchimpcsv` AS select `ebdb`.`users`.`email` AS `email`,`ebdb`.`users`.`phone_number` AS `phone_number`,`ebdb`.`users`.`name` AS `name`,`ebdb`.`users`.`gender` AS `gender`,`ebdb`.`users`.`timestamp_created` AS `timestamp_created`,(select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) AS `Orders` from `users` where 1 order by (select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `users augmented`
--

/*!50001 DROP VIEW IF EXISTS `users augmented`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`purplemaster`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `users augmented` AS select `ebdb`.`users`.`id` AS `id`,`ebdb`.`users`.`email` AS `email`,`ebdb`.`users`.`phone_number` AS `phone_number`,`ebdb`.`users`.`name` AS `name`,`ebdb`.`users`.`gender` AS `gender`,`ebdb`.`users`.`timestamp_created` AS `timestamp_created`,(select count(0) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) AS `Orders`,`ebdb`.`users`.`referral_gallons` AS `Referral Gallons Unused`,(select sum(`ebdb`.`orders`.`referral_gallons_used`) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) AS `Referral Gallons Used` from `users` where 1 order by (select sum(`ebdb`.`orders`.`referral_gallons_used`) from `orders` where ((`ebdb`.`users`.`id` = `ebdb`.`orders`.`user_id`) and (`ebdb`.`orders`.`status` = 'complete'))) desc */;
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

-- Dump completed on 2016-12-23  0:56:49
