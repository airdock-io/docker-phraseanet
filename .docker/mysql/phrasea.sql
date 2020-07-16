-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Jul 02, 2020 at 02:01 PM
-- Server version: 10.4.13-MariaDB-1:10.4.13+maria~focal
-- PHP Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `phrasea`
--
CREATE DATABASE IF NOT EXISTS `phrasea` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phrasea`;

-- --------------------------------------------------------

--
-- Table structure for table `AggregateTokens`
--

CREATE TABLE IF NOT EXISTS `AggregateTokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `value` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_4232BC51A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `AggregateTokens`
--

INSERT INTO `AggregateTokens` (`id`, `user_id`, `value`) VALUES
(1, 1, 'O8Az11Vi2zEo4dcAjSanS1iDijhihtEo5KaG8WC4AyKpzZ5vLODTJ5dQdn1MhfKb');

-- --------------------------------------------------------

--
-- Table structure for table `ApiAccounts`
--

CREATE TABLE IF NOT EXISTS `ApiAccounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `revoked` tinyint(1) NOT NULL DEFAULT 0,
  `api_version` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_account_user_id` (`user_id`),
  KEY `api_account_application_id` (`application_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ApiApplications`
--

CREATE TABLE IF NOT EXISTS `ApiApplications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) DEFAULT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `client_id` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `client_secret` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `nonce` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `redirect_uri` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `activated` tinyint(1) NOT NULL,
  `grant_password` tinyint(1) NOT NULL,
  `webhook_url` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `api_application_creator_id` (`creator_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ApiApplications`
--

INSERT INTO `ApiApplications` (`id`, `creator_id`, `type`, `name`, `description`, `website`, `created`, `updated`, `client_id`, `client_secret`, `nonce`, `redirect_uri`, `activated`, `grant_password`, `webhook_url`) VALUES
(1, NULL, 'desktop', 'phraseanet-navigator', '', 'http://www.phraseanet.com', '2020-07-02 15:38:37', '2020-07-02 15:38:37', '\\alchemy\\phraseanet\\id\\4f981093aebb66.06844599', '\\alchemy\\phraseanet\\secret\\4f9810d4b09799.51622662', 'iS5aif00setS1Cl2/PidyzgmaALKk26Ezuud2FrQHdRoiDKg5t0tUxvJIxRHv0av', 'urn:ietf:wg:oauth:2.0:oob', 1, 1, NULL),
(2, NULL, 'desktop', 'office-plugin', '', 'http://www.phraseanet.com', '2020-07-02 15:38:37', '2020-07-02 15:38:37', '\\alchemy\\phraseanet\\id\\999585175b5fbb6e140efbdfea86c561', '\\alchemy\\phraseanet\\secret\\6d53d0bc74e6c8c1a325541f71da1ea5', 'vNQIbE4FpcqQe/K49ei3QJ0kWQYtCWyr1NqRIGXNMEUlRkZysPnsKbWbKb1OQ9R3', 'urn:ietf:wg:oauth:2.0:oob', 1, 1, NULL),
(3, NULL, 'desktop', 'adobe_cc-plugin', '', 'http://www.phraseanet.com', '2020-07-02 15:38:37', '2020-07-02 15:38:37', '\\alchemy\\phraseanet\\id\\YZWUTqNyq8ObG4b0o4sp7NX50ScudqiV', '\\alchemy\\phraseanet\\secret\\nEpZd3O6Mk2ijQWiXsm7wPNKnFrbv7MO', 'xm8nu+WxTtrVFqvD67pANRJIGGDgkFmIRJ0n12Ylemov4HaCuh6tbTvx32X4Evvo', 'urn:ietf:wg:oauth:2.0:oob', 1, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ApiLogs`
--

CREATE TABLE IF NOT EXISTS `ApiLogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `route` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `method` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `status_code` int(11) DEFAULT NULL,
  `format` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `general` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `aspect` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error_code` int(11) DEFAULT NULL,
  `error_message` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_log_account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ApiOauthCodes`
--

CREATE TABLE IF NOT EXISTS `ApiOauthCodes` (
  `code` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` int(11) NOT NULL,
  `redirect_uri` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `expires` int(11) NOT NULL,
  `scope` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`code`),
  KEY `api_oauth_code_account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ApiOauthRefreshTokens`
--

CREATE TABLE IF NOT EXISTS `ApiOauthRefreshTokens` (
  `refresh_token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` int(11) NOT NULL,
  `expires` int(11) NOT NULL,
  `scope` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`refresh_token`),
  KEY `api_oauth_refresh_token_account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ApiOauthTokens`
--

CREATE TABLE IF NOT EXISTS `ApiOauthTokens` (
  `oauth_token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `account_id` int(11) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `expires` int(11) DEFAULT NULL,
  `last_used` datetime NOT NULL,
  `scope` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`oauth_token`),
  KEY `api_oauth_token_account_id` (`account_id`),
  KEY `api_oauth_token_session_id` (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `AuthFailures`
--

CREATE TABLE IF NOT EXISTS `AuthFailures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bas`
--

CREATE TABLE IF NOT EXISTS `bas` (
  `base_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ord` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `active` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `server_coll_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `aliases` text COLLATE utf8_unicode_ci NOT NULL,
  `sbas_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`base_id`),
  UNIQUE KEY `collection` (`sbas_id`,`server_coll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bas`
--

INSERT INTO `bas` (`base_id`, `ord`, `active`, `server_coll_id`, `aliases`, `sbas_id`) VALUES
(1, 1, 1, 1, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `BasketElements`
--

CREATE TABLE IF NOT EXISTS `BasketElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `basket_id` int(11) DEFAULT NULL,
  `record_id` int(11) NOT NULL,
  `sbas_id` int(11) NOT NULL,
  `ord` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_recordcle` (`basket_id`,`sbas_id`,`record_id`),
  KEY `IDX_C0B7ECB71BE1FB52` (`basket_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Baskets`
--

CREATE TABLE IF NOT EXISTS `Baskets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `pusher_id` int(11) DEFAULT NULL,
  `name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `archived` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_13461873A76ED395` (`user_id`),
  KEY `IDX_13461873C2D98306` (`pusher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Baskets`
--

INSERT INTO `Baskets` (`id`, `user_id`, `pusher_id`, `name`, `description`, `is_read`, `archived`, `created`, `updated`) VALUES
(1, 1, NULL, 'Panier par défaut', NULL, 0, 0, '2020-07-02 15:51:06', '2020-07-02 15:51:06');

-- --------------------------------------------------------

--
-- Table structure for table `basusr`
--

CREATE TABLE IF NOT EXISTS `basusr` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `base_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `usr_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `canputinalbum` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `candwnldhd` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `candwnldsubdef` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `candwnldpreview` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `cancmd` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `canadmin` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `actif` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `canreport` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `canpush` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `creationdate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `basusr_infousr` text COLLATE utf8_unicode_ci NOT NULL,
  `mask_and` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `mask_xor` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `restrict_dwnld` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `month_dwnld_max` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `remain_dwnld` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `time_limited` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `limited_from` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `limited_to` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `canaddrecord` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `order_master` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `canmodifrecord` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `candeleterecord` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `chgstatus` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `lastconn` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `imgtools` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `manage` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `modify_struct` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `bas_modify_struct` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `nowatermark` int(1) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unik` (`base_id`,`usr_id`),
  KEY `basid` (`base_id`),
  KEY `usrid` (`usr_id`),
  KEY `canadmin` (`canadmin`),
  KEY `actif` (`actif`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `basusr`
--

INSERT INTO `basusr` (`id`, `base_id`, `usr_id`, `canputinalbum`, `candwnldhd`, `candwnldsubdef`, `candwnldpreview`, `cancmd`, `canadmin`, `actif`, `canreport`, `canpush`, `creationdate`, `basusr_infousr`, `mask_and`, `mask_xor`, `restrict_dwnld`, `month_dwnld_max`, `remain_dwnld`, `time_limited`, `limited_from`, `limited_to`, `canaddrecord`, `order_master`, `canmodifrecord`, `candeleterecord`, `chgstatus`, `lastconn`, `imgtools`, `manage`, `modify_struct`, `bas_modify_struct`, `nowatermark`) VALUES
(1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, '0000-00-00 00:00:00', '', 0, 0, 0, 0, 0, 0, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, 0, 1, 1, 1, '2020-07-02 13:38:36', 1, 1, 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bridge_accounts`
--

CREATE TABLE IF NOT EXISTS `bridge_accounts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `api_id` int(11) UNSIGNED NOT NULL,
  `dist_id` char(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `usr_id` int(11) UNSIGNED NOT NULL,
  `name` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_id` (`api_id`),
  KEY `dist_id` (`dist_id`),
  KEY `usr_id` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_account_settings`
--

CREATE TABLE IF NOT EXISTS `bridge_account_settings` (
  `account_id` int(11) UNSIGNED NOT NULL,
  `key` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`account_id`,`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bridge_apis`
--

CREATE TABLE IF NOT EXISTS `bridge_apis` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(45) COLLATE utf8_unicode_ci NOT NULL,
  `disable` tinyint(1) NOT NULL DEFAULT 0,
  `disable_time` datetime DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bridge_apis`
--

INSERT INTO `bridge_apis` (`id`, `name`, `disable`, `disable_time`, `created_on`, `updated_on`) VALUES
(1, 'youtube', 0, NULL, '2020-07-02 13:38:36', '2020-07-02 13:38:36'),
(2, 'flickr', 0, NULL, '2020-07-02 13:38:36', '2020-07-02 13:38:36'),
(3, 'dailymotion', 0, NULL, '2020-07-02 13:38:36', '2020-07-02 13:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `bridge_elements`
--

CREATE TABLE IF NOT EXISTS `bridge_elements` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `account_id` int(11) UNSIGNED NOT NULL,
  `sbas_id` int(11) UNSIGNED NOT NULL,
  `record_id` int(11) UNSIGNED NOT NULL,
  `dist_id` char(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `connector_status` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `serialized_datas` text COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  `uploaded_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sbas_id` (`sbas_id`),
  KEY `record_id` (`record_id`),
  KEY `dist_id` (`dist_id`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `demand`
--

CREATE TABLE IF NOT EXISTS `demand` (
  `date_modif` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `usr_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `base_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `en_cours` tinyint(3) NOT NULL DEFAULT 0,
  `refuser` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`usr_id`,`base_id`,`en_cours`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dsel`
--

CREATE TABLE IF NOT EXISTS `dsel` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(50) COLLATE utf8_unicode_ci NOT NULL,
  `usr_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `query` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `bases` char(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`usr_id`,`name`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `edit_presets`
--

CREATE TABLE IF NOT EXISTS `edit_presets` (
  `edit_preset_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sbas_id` int(11) UNSIGNED NOT NULL,
  `usr_id` int(11) UNSIGNED NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `title` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `xml` blob NOT NULL,
  PRIMARY KEY (`edit_preset_id`),
  KEY `sbas_id` (`sbas_id`),
  KEY `usr_id` (`usr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FeedEntries`
--

CREATE TABLE IF NOT EXISTS `FeedEntries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `publisher_id` int(11) DEFAULT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `author_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `author_email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5FC892F940C86FCE` (`publisher_id`),
  KEY `IDX_5FC892F951A5BC03` (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FeedItems`
--

CREATE TABLE IF NOT EXISTS `FeedItems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) DEFAULT NULL,
  `record_id` int(11) NOT NULL,
  `sbas_id` int(11) NOT NULL,
  `ord` int(11) NOT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lookup_unique_idx` (`entry_id`,`sbas_id`,`record_id`),
  KEY `IDX_7F9CDFA6BA364942` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FeedPublishers`
--

CREATE TABLE IF NOT EXISTS `FeedPublishers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `owner` tinyint(1) NOT NULL DEFAULT 0,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_31AFAB2A76ED395` (`user_id`),
  KEY `IDX_31AFAB251A5BC03` (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Feeds`
--

CREATE TABLE IF NOT EXISTS `Feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `public` tinyint(1) NOT NULL DEFAULT 0,
  `icon_url` tinyint(1) NOT NULL DEFAULT 0,
  `base_id` int(11) DEFAULT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `subtitle` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FeedTokens`
--

CREATE TABLE IF NOT EXISTS `FeedTokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `feed_id` int(11) DEFAULT NULL,
  `value` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9D1CA848A76ED395` (`user_id`),
  KEY `IDX_9D1CA84851A5BC03` (`feed_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FtpCredential`
--

CREATE TABLE IF NOT EXISTS `FtpCredential` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `address` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `login` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reception_folder` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `repository_prefix_name` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `passive` tinyint(1) NOT NULL DEFAULT 0,
  `tls` tinyint(1) NOT NULL DEFAULT 0,
  `max_retry` int(11) NOT NULL DEFAULT 5,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_62DA9661A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FtpExportElements`
--

CREATE TABLE IF NOT EXISTS `FtpExportElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `export_id` int(11) DEFAULT NULL,
  `record_id` int(11) NOT NULL,
  `base_id` int(11) NOT NULL,
  `subdef` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `folder` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `error` tinyint(1) NOT NULL DEFAULT 0,
  `done` tinyint(1) NOT NULL DEFAULT 0,
  `businessfields` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ftp_export` (`export_id`,`base_id`,`record_id`,`subdef`),
  KEY `IDX_7BF0AE1264CDAF82` (`export_id`),
  KEY `ftp_export_element_done` (`done`),
  KEY `ftp_export_element_error` (`error`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `FtpExports`
--

CREATE TABLE IF NOT EXISTS `FtpExports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `crash` int(11) NOT NULL DEFAULT 0,
  `nbretry` int(11) NOT NULL DEFAULT 3,
  `mail` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `addr` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `use_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `login` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pwd` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passif` tinyint(1) NOT NULL DEFAULT 0,
  `destfolder` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '/',
  `sendermail` varchar(128) COLLATE utf8_unicode_ci DEFAULT '1',
  `text_mail_sender` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `text_mail_receiver` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `foldertocreate` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logfile` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CFCEEE7AA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `LazaretAttributes`
--

CREATE TABLE IF NOT EXISTS `LazaretAttributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lazaret_file_id` int(11) DEFAULT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5FF72F9B4CF84ADD` (`lazaret_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `LazaretChecks`
--

CREATE TABLE IF NOT EXISTS `LazaretChecks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lazaret_file_id` int(11) DEFAULT NULL,
  `checkClassname` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CE873ED44CF84ADD` (`lazaret_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `LazaretFiles`
--

CREATE TABLE IF NOT EXISTS `LazaretFiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lazaret_session_id` int(11) DEFAULT NULL,
  `filename` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `thumbFilename` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `originalName` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `base_id` int(11) NOT NULL,
  `uuid` varchar(36) COLLATE utf8_unicode_ci NOT NULL,
  `sha256` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `forced` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D30BD768EE187C01` (`lazaret_session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `LazaretSessions`
--

CREATE TABLE IF NOT EXISTS `LazaretSessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_40A81317A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `type` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `unread` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `mailed` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `datas` longblob NOT NULL,
  `created_on` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `usr_id` (`usr_id`),
  KEY `unread` (`unread`),
  KEY `created_on` (`created_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `OrderElements`
--

CREATE TABLE IF NOT EXISTS `OrderElements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_master` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `base_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `deny` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_ordercle` (`base_id`,`record_id`,`order_id`),
  KEY `IDX_8C7066C8EE86B303` (`order_master`),
  KEY `IDX_8C7066C88D9F6D38` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE IF NOT EXISTS `Orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `order_usage` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `todo` int(11) DEFAULT NULL,
  `deadline` datetime NOT NULL,
  `created_on` datetime NOT NULL,
  `notification_method` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_E283F8D81BE1FB52` (`basket_id`),
  KEY `IDX_E283F8D8A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Presets`
--

CREATE TABLE IF NOT EXISTS `Presets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sbas_id` int(11) NOT NULL,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1C48F8F3A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `records_rights`
--

CREATE TABLE IF NOT EXISTS `records_rights` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usr_id` int(11) UNSIGNED NOT NULL,
  `sbas_id` int(11) UNSIGNED NOT NULL,
  `record_id` int(11) UNSIGNED NOT NULL,
  `document` tinyint(1) UNSIGNED NOT NULL,
  `preview` tinyint(1) UNSIGNED NOT NULL,
  `case` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `pusher_usr_id` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sbas_record_user` (`sbas_id`,`record_id`,`usr_id`),
  KEY `pusher_usr_id` (`pusher_usr_id`),
  KEY `document` (`document`),
  KEY `preview` (`preview`),
  KEY `usr_id` (`usr_id`),
  KEY `sbas_record` (`sbas_id`,`record_id`),
  KEY `sbas_record_document` (`sbas_id`,`record_id`,`document`),
  KEY `sbas_record_preview` (`sbas_id`,`record_id`,`preview`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Registrations`
--

CREATE TABLE IF NOT EXISTS `Registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `base_id` int(11) NOT NULL,
  `pending` tinyint(1) NOT NULL DEFAULT 1,
  `rejected` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_registration` (`user_id`,`base_id`,`pending`),
  KEY `IDX_E0A01A12A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sbas`
--

CREATE TABLE IF NOT EXISTS `sbas` (
  `sbas_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ord` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `host` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `port` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `dbname` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `sqlengine` char(20) COLLATE utf8_unicode_ci NOT NULL,
  `user` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `pwd` char(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewname` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `indexable` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `label_en` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_fr` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_de` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_nl` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sbas_id`),
  UNIQUE KEY `server` (`host`,`port`,`dbname`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sbas`
--

INSERT INTO `sbas` (`sbas_id`, `ord`, `host`, `port`, `dbname`, `sqlengine`, `user`, `pwd`, `viewname`, `indexable`, `label_en`, `label_fr`, `label_de`, `label_nl`) VALUES
(1, 1, 'mysql', 3306, 'phrasea_data', 'MYSQL', 'root', 'phrasea', NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sbasusr`
--

CREATE TABLE IF NOT EXISTS `sbasusr` (
  `sbasusr_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sbas_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `usr_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `bas_manage` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `bas_modify_struct` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `bas_modif_th` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `bas_chupub` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`sbasusr_id`),
  UNIQUE KEY `unikid` (`usr_id`,`sbas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sbasusr`
--

INSERT INTO `sbasusr` (`sbasusr_id`, `sbas_id`, `usr_id`, `bas_manage`, `bas_modify_struct`, `bas_modif_th`, `bas_chupub`) VALUES
(1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Secrets`
--

CREATE TABLE IF NOT EXISTS `Secrets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `token` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '(DC2Type:binary_string)',
  PRIMARY KEY (`id`),
  KEY `IDX_48F428861220EA6` (`creator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `SessionModules`
--

CREATE TABLE IF NOT EXISTS `SessionModules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `session_id` int(11) DEFAULT NULL,
  `module_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_module` (`session_id`,`module_id`),
  KEY `IDX_BA36EF49613FECDF` (`session_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `SessionModules`
--

INSERT INTO `SessionModules` (`id`, `session_id`, `module_id`, `created`, `updated`) VALUES
(1, 1, 1, '2020-07-02 15:51:06', '2020-07-02 15:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `Sessions`
--

CREATE TABLE IF NOT EXISTS `Sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_agent` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ip_address` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `platform` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `browser_version` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `screen_width` int(11) DEFAULT NULL,
  `screen_height` int(11) DEFAULT NULL,
  `token` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nonce` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6316FF455F37A13B` (`token`),
  KEY `IDX_6316FF45A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Sessions`
--

INSERT INTO `Sessions` (`id`, `user_id`, `user_agent`, `ip_address`, `platform`, `browser_name`, `browser_version`, `screen_width`, `screen_height`, `token`, `nonce`, `created`, `updated`) VALUES
(1, 1, 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', '172.25.0.1', 'Linux', 'Chrome', '83.0.4103.106', NULL, NULL, NULL, NULL, '2020-07-02 15:51:06', '2020-07-02 15:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `sitepreff`
--

CREATE TABLE IF NOT EXISTS `sitepreff` (
  `id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `preffs` longtext COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `maj` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `memcached_update` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `schedstatus` enum('stopped','stopping','started','tostop') CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'stopped',
  `schedqtime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `schedpid` int(11) DEFAULT NULL,
  `schedulerkey` char(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sitepreff`
--

INSERT INTO `sitepreff` (`id`, `preffs`, `version`, `maj`, `memcached_update`, `schedstatus`, `schedqtime`, `schedpid`, `schedulerkey`) VALUES
(1, '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>                                <paramsite>                                    <statuschu>                                        <bit n=\"-1\" link=\"1\" order=\"0\" view=\"0\" label=\"\" wmprev=\"0\" thumbLimit=\"0\"/>                                    </statuschu>                                </paramsite>', '4.1.0-alpha.18a', '0000-00-00 00:00:00', '2020-07-02 13:51:07', 'stopped', '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `StoryWZ`
--

CREATE TABLE IF NOT EXISTS `StoryWZ` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `sbas_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_story` (`user_id`,`sbas_id`,`record_id`),
  KEY `IDX_E0D2CBAEA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Tasks`
--

CREATE TABLE IF NOT EXISTS `Tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `jobId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0,
  `status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'started',
  `crashed` int(11) NOT NULL DEFAULT 0,
  `single_run` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `last_execution` datetime DEFAULT NULL,
  `period` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Tasks`
--

INSERT INTO `Tasks` (`id`, `name`, `jobId`, `settings`, `completed`, `status`, `crashed`, `single_run`, `created`, `updated`, `last_execution`, `period`) VALUES
(1, 'Subviews creation', 'Subdefs', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<tasksettings>\n  <embedded>1</embedded>\n  <sbas>0</sbas>\n  <type_image>1</type_image>\n  <type_video>1</type_video>\n  <type_audio>1</type_audio>\n  <type_document>1</type_document>\n  <type_flash>1</type_flash>\n  <type_unknown>1</type_unknown>\n  <flush>5</flush>\n  <maxrecs>20</maxrecs>\n  <maxmegs>256</maxmegs>\n  <maxduration>3600</maxduration>\n</tasksettings>', 0, 'started', 0, 0, '2020-07-02 15:38:37', '2020-07-02 15:38:37', NULL, 10),
(2, 'Write metadatas', 'WriteMetadata', '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<tasksettings>\n    <cleardoc>0</cleardoc>\n    <mwg>0</mwg>\n</tasksettings>', 0, 'started', 0, 0, '2020-07-02 15:38:37', '2020-07-02 15:38:37', NULL, 10);

-- --------------------------------------------------------

--
-- Table structure for table `Tokens`
--

CREATE TABLE IF NOT EXISTS `Tokens` (
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expiration` datetime DEFAULT NULL,
  PRIMARY KEY (`value`),
  KEY `IDX_ADF614B8A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserNotificationSettings`
--

CREATE TABLE IF NOT EXISTS `UserNotificationSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_index` (`user_id`,`name`),
  KEY `IDX_CFF041AAA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UserQueries`
--

CREATE TABLE IF NOT EXISTS `UserQueries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `query` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5FB80D87A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `UserQueries`
--

INSERT INTO `UserQueries` (`id`, `user_id`, `query`, `created`) VALUES
(1, 1, '', '2020-07-02 15:51:07');

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `last_model` int(11) DEFAULT NULL,
  `model_of` int(11) DEFAULT NULL,
  `login` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '(DC2Type:binary_string)',
  `email` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '(DC2Type:binary_string)',
  `nonce` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL COMMENT '(DC2Type:binary_string)',
  `salted_password` tinyint(1) NOT NULL DEFAULT 1,
  `first_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `last_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gender` smallint(6) DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(64) COLLATE utf8_unicode_ci DEFAULT '',
  `zip_code` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `geoname_id` int(11) DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `job` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activity` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `company` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fax` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `guest` tinyint(1) NOT NULL DEFAULT 0,
  `mail_notifications` tinyint(1) NOT NULL DEFAULT 0,
  `request_notifications` tinyint(1) NOT NULL DEFAULT 0,
  `ldap_created` tinyint(1) NOT NULL DEFAULT 0,
  `push_list` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `can_change_profil` tinyint(1) NOT NULL DEFAULT 1,
  `can_change_ftp_profil` tinyint(1) NOT NULL DEFAULT 1,
  `last_connection` datetime DEFAULT NULL,
  `mail_locked` tinyint(1) NOT NULL DEFAULT 0,
  `deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_unique` (`login`),
  UNIQUE KEY `email_unique` (`email`),
  KEY `IDX_D5428AEDB5DE44C2` (`last_model`),
  KEY `user_model_of` (`model_of`),
  KEY `user_salted_password` (`salted_password`),
  KEY `user_admin` (`admin`),
  KEY `user_guest` (`guest`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `last_model`, `model_of`, `login`, `email`, `password`, `nonce`, `salted_password`, `first_name`, `last_name`, `gender`, `address`, `city`, `country`, `zip_code`, `geoname_id`, `locale`, `timezone`, `job`, `activity`, `company`, `phone`, `fax`, `admin`, `guest`, `mail_notifications`, `request_notifications`, `ldap_created`, `push_list`, `can_change_profil`, `can_change_ftp_profil`, `last_connection`, `mail_locked`, `deleted`, `created`, `updated`) VALUES
(1, NULL, NULL, 'test@domain.name', 'test@domain.name', '9c067020471754e9133e706e0264b08f09420cf1d334745d780caa13d3433106234f87d0e895ca04a7d5cd511fd08003e8740c304171ccc57b5a55b4b8afd03c', '0pdch0EIdJX2wffFa0GJSMqVsIYmBuxld5cDeTUNpyF7oIUIoCUA7t5JYGqZPqVo', 1, '', '', NULL, '', '', '', '', NULL, 'fr', '', '', '', '', '', '', 1, 0, 0, 0, 0, '', 1, 1, NULL, 0, 0, '2020-07-02 15:38:36', '2020-07-02 15:51:06'),
(2, NULL, NULL, 'autoregister', NULL, '7f6b2ad52063ea735e38910372a996cd193b6f42f2cc7e2ca9ba8851e7f24d0652cdf0b9086116c5088c0c109beb6e6e58b5723995f9432a326754dfacae2b3a', 'j5LBs1e1MzNStjLlMIvsMlymbL4piRrIXkO3CfFSd7dT5AS6VAewHnSFbcVVKcWA', 1, '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 1, 1, NULL, 0, 0, '2020-07-02 15:38:36', '2020-07-02 15:38:36'),
(3, NULL, NULL, 'guest', NULL, 'd3a282de02b05e7e277d348e5f7d10adcf70538da2f608ef041063de37ff722512fa8581d732bef9a4766cb4ded284a21aeef97f009b360130cbe0dc71a2063c', 'sHGTk8j/V3lspu3XD5CB88qcjV2KUvFF/Hrh1d7nGTL6CbJiDYeHM53O68wQ8KWP', 1, '', '', NULL, '', '', '', '', NULL, NULL, '', '', '', '', '', '', 0, 0, 0, 0, 0, '', 1, 1, NULL, 0, 0, '2020-07-02 15:38:36', '2020-07-02 15:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `UserSettings`
--

CREATE TABLE IF NOT EXISTS `UserSettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_setting` (`user_id`,`name`),
  KEY `IDX_2847E61CA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UsrAuthProviders`
--

CREATE TABLE IF NOT EXISTS `UsrAuthProviders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `provider` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `distant_id` varchar(192) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_provider_per_user` (`user_id`,`provider`),
  UNIQUE KEY `provider_ids` (`provider`,`distant_id`),
  KEY `IDX_947F003FA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UsrListOwners`
--

CREATE TABLE IF NOT EXISTS `UsrListOwners` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_owner` (`user_id`,`id`),
  KEY `IDX_54E9FE23A76ED395` (`user_id`),
  KEY `IDX_54E9FE233DAE168B` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UsrLists`
--

CREATE TABLE IF NOT EXISTS `UsrLists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `UsrListsContent`
--

CREATE TABLE IF NOT EXISTS `UsrListsContent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `list_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_usr_per_list` (`user_id`,`list_id`),
  KEY `IDX_661B8B9A76ED395` (`user_id`),
  KEY `IDX_661B8B93DAE168B` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ValidationDatas`
--

CREATE TABLE IF NOT EXISTS `ValidationDatas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `participant_id` int(11) DEFAULT NULL,
  `basket_element_id` int(11) DEFAULT NULL,
  `agreement` tinyint(1) DEFAULT NULL,
  `note` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_70E84DDC9D1C3019` (`participant_id`),
  KEY `IDX_70E84DDCE989605` (`basket_element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ValidationParticipants`
--

CREATE TABLE IF NOT EXISTS `ValidationParticipants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `validation_session_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `is_aware` tinyint(1) NOT NULL DEFAULT 0,
  `is_confirmed` tinyint(1) NOT NULL DEFAULT 0,
  `can_agree` tinyint(1) NOT NULL DEFAULT 0,
  `can_see_others` tinyint(1) NOT NULL DEFAULT 0,
  `reminded` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_17850D7BF9669572` (`validation_session_id`),
  KEY `IDX_17850D7BA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ValidationSessions`
--

CREATE TABLE IF NOT EXISTS `ValidationSessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `initiator_id` int(11) NOT NULL,
  `basket_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_5B9DFB061BE1FB52` (`basket_id`),
  KEY `IDX_5B9DFB067DB3B714` (`initiator_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WebhookEventDeliveries`
--

CREATE TABLE IF NOT EXISTS `WebhookEventDeliveries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL,
  `event_id` int(11) NOT NULL,
  `delivered` tinyint(1) NOT NULL DEFAULT 0,
  `deliveryTries` int(11) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_app_delivery` (`application_id`,`event_id`),
  KEY `IDX_B4A8823A3E030ACD` (`application_id`),
  KEY `IDX_B4A8823A71F7E88B` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WebhookEventPayloads`
--

CREATE TABLE IF NOT EXISTS `WebhookEventPayloads` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:guid)',
  `delivery_id` int(11) DEFAULT NULL,
  `request` longtext COLLATE utf8_unicode_ci NOT NULL,
  `response` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `headers` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_B949629612136921` (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `WebhookEvents`
--

CREATE TABLE IF NOT EXISTS `WebhookEvents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `processed` tinyint(1) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `webhook_event_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `AggregateTokens`
--
ALTER TABLE `AggregateTokens`
  ADD CONSTRAINT `FK_4232BC51A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `ApiAccounts`
--
ALTER TABLE `ApiAccounts`
  ADD CONSTRAINT `FK_2C54E6373E030ACD` FOREIGN KEY (`application_id`) REFERENCES `ApiApplications` (`id`),
  ADD CONSTRAINT `FK_2C54E637A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `ApiApplications`
--
ALTER TABLE `ApiApplications`
  ADD CONSTRAINT `FK_53F7BBE661220EA6` FOREIGN KEY (`creator_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `ApiLogs`
--
ALTER TABLE `ApiLogs`
  ADD CONSTRAINT `FK_91E90F309B6B5FBA` FOREIGN KEY (`account_id`) REFERENCES `ApiAccounts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ApiOauthCodes`
--
ALTER TABLE `ApiOauthCodes`
  ADD CONSTRAINT `FK_BE6B11809B6B5FBA` FOREIGN KEY (`account_id`) REFERENCES `ApiAccounts` (`id`);

--
-- Constraints for table `ApiOauthRefreshTokens`
--
ALTER TABLE `ApiOauthRefreshTokens`
  ADD CONSTRAINT `FK_7DA42A5A9B6B5FBA` FOREIGN KEY (`account_id`) REFERENCES `ApiAccounts` (`id`);

--
-- Constraints for table `ApiOauthTokens`
--
ALTER TABLE `ApiOauthTokens`
  ADD CONSTRAINT `FK_4FD469539B6B5FBA` FOREIGN KEY (`account_id`) REFERENCES `ApiAccounts` (`id`);

--
-- Constraints for table `BasketElements`
--
ALTER TABLE `BasketElements`
  ADD CONSTRAINT `FK_C0B7ECB71BE1FB52` FOREIGN KEY (`basket_id`) REFERENCES `Baskets` (`id`);

--
-- Constraints for table `Baskets`
--
ALTER TABLE `Baskets`
  ADD CONSTRAINT `FK_13461873A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `FK_13461873C2D98306` FOREIGN KEY (`pusher_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `FeedEntries`
--
ALTER TABLE `FeedEntries`
  ADD CONSTRAINT `FK_5FC892F940C86FCE` FOREIGN KEY (`publisher_id`) REFERENCES `FeedPublishers` (`id`),
  ADD CONSTRAINT `FK_5FC892F951A5BC03` FOREIGN KEY (`feed_id`) REFERENCES `Feeds` (`id`);

--
-- Constraints for table `FeedItems`
--
ALTER TABLE `FeedItems`
  ADD CONSTRAINT `FK_7F9CDFA6BA364942` FOREIGN KEY (`entry_id`) REFERENCES `FeedEntries` (`id`);

--
-- Constraints for table `FeedPublishers`
--
ALTER TABLE `FeedPublishers`
  ADD CONSTRAINT `FK_31AFAB251A5BC03` FOREIGN KEY (`feed_id`) REFERENCES `Feeds` (`id`),
  ADD CONSTRAINT `FK_31AFAB2A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `FeedTokens`
--
ALTER TABLE `FeedTokens`
  ADD CONSTRAINT `FK_9D1CA84851A5BC03` FOREIGN KEY (`feed_id`) REFERENCES `Feeds` (`id`),
  ADD CONSTRAINT `FK_9D1CA848A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `FtpCredential`
--
ALTER TABLE `FtpCredential`
  ADD CONSTRAINT `FK_62DA9661A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `FtpExportElements`
--
ALTER TABLE `FtpExportElements`
  ADD CONSTRAINT `FK_7BF0AE1264CDAF82` FOREIGN KEY (`export_id`) REFERENCES `FtpExports` (`id`);

--
-- Constraints for table `FtpExports`
--
ALTER TABLE `FtpExports`
  ADD CONSTRAINT `FK_CFCEEE7AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `LazaretAttributes`
--
ALTER TABLE `LazaretAttributes`
  ADD CONSTRAINT `FK_5FF72F9B4CF84ADD` FOREIGN KEY (`lazaret_file_id`) REFERENCES `LazaretFiles` (`id`);

--
-- Constraints for table `LazaretChecks`
--
ALTER TABLE `LazaretChecks`
  ADD CONSTRAINT `FK_CE873ED44CF84ADD` FOREIGN KEY (`lazaret_file_id`) REFERENCES `LazaretFiles` (`id`);

--
-- Constraints for table `LazaretFiles`
--
ALTER TABLE `LazaretFiles`
  ADD CONSTRAINT `FK_D30BD768EE187C01` FOREIGN KEY (`lazaret_session_id`) REFERENCES `LazaretSessions` (`id`);

--
-- Constraints for table `LazaretSessions`
--
ALTER TABLE `LazaretSessions`
  ADD CONSTRAINT `FK_40A81317A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `OrderElements`
--
ALTER TABLE `OrderElements`
  ADD CONSTRAINT `FK_8C7066C88D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `Orders` (`id`),
  ADD CONSTRAINT `FK_8C7066C8EE86B303` FOREIGN KEY (`order_master`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Orders`
--
ALTER TABLE `Orders`
  ADD CONSTRAINT `FK_E283F8D81BE1FB52` FOREIGN KEY (`basket_id`) REFERENCES `Baskets` (`id`),
  ADD CONSTRAINT `FK_E283F8D8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Presets`
--
ALTER TABLE `Presets`
  ADD CONSTRAINT `FK_1C48F8F3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Registrations`
--
ALTER TABLE `Registrations`
  ADD CONSTRAINT `FK_E0A01A12A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Secrets`
--
ALTER TABLE `Secrets`
  ADD CONSTRAINT `FK_48F428861220EA6` FOREIGN KEY (`creator_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `SessionModules`
--
ALTER TABLE `SessionModules`
  ADD CONSTRAINT `FK_BA36EF49613FECDF` FOREIGN KEY (`session_id`) REFERENCES `Sessions` (`id`);

--
-- Constraints for table `Sessions`
--
ALTER TABLE `Sessions`
  ADD CONSTRAINT `FK_6316FF45A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `StoryWZ`
--
ALTER TABLE `StoryWZ`
  ADD CONSTRAINT `FK_E0D2CBAEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Tokens`
--
ALTER TABLE `Tokens`
  ADD CONSTRAINT `FK_ADF614B8A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `UserNotificationSettings`
--
ALTER TABLE `UserNotificationSettings`
  ADD CONSTRAINT `FK_CFF041AAA76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `UserQueries`
--
ALTER TABLE `UserQueries`
  ADD CONSTRAINT `FK_5FB80D87A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `Users`
--
ALTER TABLE `Users`
  ADD CONSTRAINT `FK_D5428AEDB5DE44C2` FOREIGN KEY (`last_model`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `FK_D5428AEDC121714D` FOREIGN KEY (`model_of`) REFERENCES `Users` (`id`);

--
-- Constraints for table `UserSettings`
--
ALTER TABLE `UserSettings`
  ADD CONSTRAINT `FK_2847E61CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `UsrAuthProviders`
--
ALTER TABLE `UsrAuthProviders`
  ADD CONSTRAINT `FK_947F003FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `UsrListOwners`
--
ALTER TABLE `UsrListOwners`
  ADD CONSTRAINT `FK_54E9FE233DAE168B` FOREIGN KEY (`list_id`) REFERENCES `UsrLists` (`id`),
  ADD CONSTRAINT `FK_54E9FE23A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `UsrListsContent`
--
ALTER TABLE `UsrListsContent`
  ADD CONSTRAINT `FK_661B8B93DAE168B` FOREIGN KEY (`list_id`) REFERENCES `UsrLists` (`id`),
  ADD CONSTRAINT `FK_661B8B9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `ValidationDatas`
--
ALTER TABLE `ValidationDatas`
  ADD CONSTRAINT `FK_70E84DDC9D1C3019` FOREIGN KEY (`participant_id`) REFERENCES `ValidationParticipants` (`id`),
  ADD CONSTRAINT `FK_70E84DDCE989605` FOREIGN KEY (`basket_element_id`) REFERENCES `BasketElements` (`id`);

--
-- Constraints for table `ValidationParticipants`
--
ALTER TABLE `ValidationParticipants`
  ADD CONSTRAINT `FK_17850D7BA76ED395` FOREIGN KEY (`user_id`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `FK_17850D7BF9669572` FOREIGN KEY (`validation_session_id`) REFERENCES `ValidationSessions` (`id`);

--
-- Constraints for table `ValidationSessions`
--
ALTER TABLE `ValidationSessions`
  ADD CONSTRAINT `FK_5B9DFB061BE1FB52` FOREIGN KEY (`basket_id`) REFERENCES `Baskets` (`id`),
  ADD CONSTRAINT `FK_5B9DFB067DB3B714` FOREIGN KEY (`initiator_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `WebhookEventDeliveries`
--
ALTER TABLE `WebhookEventDeliveries`
  ADD CONSTRAINT `FK_B4A8823A3E030ACD` FOREIGN KEY (`application_id`) REFERENCES `ApiApplications` (`id`),
  ADD CONSTRAINT `FK_B4A8823A71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `WebhookEvents` (`id`);

--
-- Constraints for table `WebhookEventPayloads`
--
ALTER TABLE `WebhookEventPayloads`
  ADD CONSTRAINT `FK_B949629612136921` FOREIGN KEY (`delivery_id`) REFERENCES `WebhookEventDeliveries` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
