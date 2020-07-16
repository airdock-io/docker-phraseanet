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
-- Database: `phrasea_data`
--
CREATE DATABASE IF NOT EXISTS `phrasea_data` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `phrasea_data`;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `site_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`site_id`) VALUES
('db');

-- --------------------------------------------------------

--
-- Table structure for table `coll`
--

CREATE TABLE IF NOT EXISTS `coll` (
  `coll_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asciiname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `label_en` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_fr` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_de` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_nl` char(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prefs` text COLLATE utf8_unicode_ci NOT NULL,
  `logo` longblob NOT NULL,
  `majLogo` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `pub_wm` enum('none','wm','stamp') CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'none',
  PRIMARY KEY (`coll_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `coll`
--

INSERT INTO `coll` (`coll_id`, `asciiname`, `label_en`, `label_fr`, `label_de`, `label_nl`, `prefs`, `logo`, `majLogo`, `pub_wm`) VALUES
(1, 'test', NULL, NULL, NULL, NULL, '<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<baseprefs>\n    <status>0</status>\n    <sugestedValues></sugestedValues>\n</baseprefs>', '', '0000-00-00 00:00:00', 'none');

-- --------------------------------------------------------

--
-- Table structure for table `collusr`
--

CREATE TABLE IF NOT EXISTS `collusr` (
  `site` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `usr_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `coll_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `mask_and` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `mask_xor` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `ord` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`site`,`usr_id`,`coll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `collusr`
--

INSERT INTO `collusr` (`site`, `usr_id`, `coll_id`, `mask_and`, `mask_xor`, `ord`) VALUES
('U7prrV804Kj2fudW', 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `sit_session` int(11) UNSIGNED DEFAULT NULL,
  `user` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `usrid` int(11) UNSIGNED DEFAULT NULL,
  `nav` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `os` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `res` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `appli` varbinary(1024) NOT NULL,
  `fonction` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `societe` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activite` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pays` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `site` (`site`),
  KEY `sit_session` (`sit_session`),
  KEY `user` (`user`),
  KEY `date` (`date`),
  KEY `nav` (`nav`),
  KEY `os` (`os`),
  KEY `res` (`res`),
  KEY `version` (`version`),
  KEY `os_nav` (`os`,`nav`),
  KEY `date_site` (`site`,`date`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `date`, `sit_session`, `user`, `site`, `usrid`, `nav`, `version`, `os`, `res`, `ip`, `user_agent`, `appli`, `fonction`, `societe`, `activite`, `pays`) VALUES
(1, '2020-07-02 13:51:06', 1, 'test@domain.name', 'U7prrV804Kj2fudW', 1, 'Chrome', '83.0.4103.106', 'Linux', 'unknown', '172.25.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.106 Safari/537.36', 0x613a313a7b693a303b693a313b7d, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `log_docs`
--

CREATE TABLE IF NOT EXISTS `log_docs` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_id` int(11) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `record_id` int(11) UNSIGNED NOT NULL,
  `action` enum('push','add','validate','edit','collection','status','print','substit','publish','download','mail','ftp','delete','') CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `final` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `coll_id_from` int(11) UNSIGNED DEFAULT NULL,
  `coll_id` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `log_id` (`log_id`),
  KEY `record_id` (`record_id`),
  KEY `coll_id_from` (`coll_id`),
  KEY `coll_id` (`coll_id`),
  KEY `action` (`action`),
  KEY `date` (`date`),
  KEY `final` (`final`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_search`
--

CREATE TABLE IF NOT EXISTS `log_search` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_id` int(11) UNSIGNED NOT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `results` int(11) UNSIGNED DEFAULT 0,
  `coll_id` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `log_id` (`log_id`),
  KEY `search` (`search`),
  KEY `date` (`date`),
  KEY `results` (`results`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_view`
--

CREATE TABLE IF NOT EXISTS `log_view` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `log_id` int(11) UNSIGNED DEFAULT NULL,
  `date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `record_id` int(11) UNSIGNED NOT NULL,
  `referrer` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `site_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `coll_id` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `referrer` (`referrer`),
  KEY `log_id` (`log_id`),
  KEY `date` (`date`),
  KEY `record_id` (`record_id`),
  KEY `site_id` (`site_id`),
  KEY `coll_id` (`coll_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memcached`
--

CREATE TABLE IF NOT EXISTS `memcached` (
  `type` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` int(11) UNSIGNED NOT NULL,
  `site_id` char(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique` (`type`,`value`,`site_id`),
  KEY `type` (`type`),
  KEY `value` (`value`),
  KEY `site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metadatas`
--

CREATE TABLE IF NOT EXISTS `metadatas` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `record_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `meta_struct_id` int(11) UNSIGNED NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `VocabularyType` char(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VocabularyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_struct_id` (`meta_struct_id`),
  KEY `record_id` (`record_id`),
  KEY `index_meta` (`record_id`,`meta_struct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `metadatas_structure`
--

CREATE TABLE IF NOT EXISTS `metadatas_structure` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` char(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `src` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `readonly` int(1) UNSIGNED NOT NULL,
  `required` int(1) UNSIGNED NOT NULL,
  `business` int(1) UNSIGNED NOT NULL,
  `aggregable` int(5) NOT NULL DEFAULT 0,
  `indexable` int(1) UNSIGNED NOT NULL,
  `type` enum('string','date','number') COLLATE utf8_unicode_ci NOT NULL,
  `tbranch` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `separator` char(12) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `thumbtitle` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `multi` tinyint(1) UNSIGNED NOT NULL,
  `report` tinyint(1) UNSIGNED NOT NULL,
  `sorter` int(3) UNSIGNED NOT NULL,
  `dces_element` char(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VocabularyControlType` char(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RestrictToVocabularyControl` tinyint(1) NOT NULL DEFAULT 0,
  `label_en` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_fr` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_de` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_nl` char(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `generate_cterms` int(1) UNSIGNED NOT NULL DEFAULT 1,
  `gui_editable` int(1) UNSIGNED NOT NULL DEFAULT 1,
  `gui_visible` int(1) UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `dces_element` (`dces_element`),
  KEY `indexable` (`indexable`),
  KEY `readonly` (`readonly`),
  KEY `required` (`required`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `metadatas_structure`
--

INSERT INTO `metadatas_structure` (`id`, `name`, `src`, `readonly`, `required`, `business`, `aggregable`, `indexable`, `type`, `tbranch`, `separator`, `thumbtitle`, `multi`, `report`, `sorter`, `dces_element`, `VocabularyControlType`, `RestrictToVocabularyControl`, `label_en`, `label_fr`, `label_de`, `label_nl`, `generate_cterms`, `gui_editable`, `gui_visible`) VALUES
(1, 'Objet', 'IPTC:ObjectName', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 1, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(2, 'Categorie', 'IPTC:Category', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 2, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(3, 'AutresCategories', 'IPTC:SupplementalCategories', 0, 0, 0, 0, 1, 'string', '', ';', '0', 1, 1, 3, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(4, 'MotsCles', 'IPTC:Keywords', 0, 0, 0, 0, 1, 'string', '', ';', '0', 1, 1, 4, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(5, 'Observations', 'IPTC:SpecialInstructions', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 5, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(6, 'Date', 'IPTC:DateCreated', 0, 0, 0, 0, 1, 'date', '', '', '0', 0, 1, 6, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(7, 'Signature', 'IPTC:By-line', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 7, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(8, 'TitreCredits', 'IPTC:By-lineTitle', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 8, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(9, 'Ville', 'IPTC:City', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 9, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(10, 'Province', 'IPTC:Province-State', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 10, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(11, 'Pays', 'IPTC:Country-PrimaryLocationName', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 11, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(12, 'ReferencesOriginales', 'IPTC:OriginalTransmissionReference', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 12, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(13, 'Titre', 'IPTC:Headline', 0, 0, 0, 0, 1, 'string', '', '', '1', 0, 1, 13, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(14, 'Credit', 'IPTC:Credit', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 14, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(15, 'Source', 'IPTC:Source', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 15, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(16, 'Legende', 'IPTC:Caption-Abstract', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 16, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(17, 'Redacteur', 'IPTC:Writer-Editor', 0, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 17, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(18, 'Longitude', 'GPS:GPSLongitude', 1, 0, 0, 0, 1, 'number', '', '', '0', 0, 1, 18, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(19, 'Latitude', 'GPS:GPSLatitude', 1, 0, 0, 0, 1, 'number', '', '', '0', 0, 1, 19, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(20, 'AppareilPhoto', 'IFD0:Model', 1, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 20, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0),
(21, 'NomDeFichier', 'Phraseanet:tf-basename', 1, 0, 0, 0, 1, 'string', '', '', '0', 0, 1, 21, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `permalinks`
--

CREATE TABLE IF NOT EXISTS `permalinks` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subdef_id` int(11) UNSIGNED NOT NULL,
  `token` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `label` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `activated` tinyint(1) UNSIGNED NOT NULL DEFAULT 1,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `subdef_id` (`subdef_id`),
  UNIQUE KEY `token` (`token`),
  KEY `activated` (`activated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pref`
--

CREATE TABLE IF NOT EXISTS `pref` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `prop` char(64) COLLATE utf8_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `locale` char(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `updated_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUE` (`prop`,`locale`),
  KEY `prop` (`prop`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pref`
--

INSERT INTO `pref` (`id`, `prop`, `value`, `locale`, `updated_on`, `created_on`) VALUES
(1, 'thesaurus', '', '', '0000-00-00 00:00:00', '2020-07-02 13:38:36'),
(2, 'structure', '<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"yes\"?>\n<record modification_date=\"20200702153836\">\n  <path>/var/www/app/datas/phrasea_data/documents</path>\n  <subdefs>\n    <subdefgroup name=\"image\">\n      <subdef class=\"preview\" name=\"preview\" downloadable=\"true\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <size>1024</size>\n        <method>resample</method>\n        <dpi>72</dpi>\n        <strip>no</strip>\n        <quality>75</quality>\n        <meta>yes</meta>\n        <devices>screen</devices>\n        <mediatype>image</mediatype>\n        <label lang=\"fr\">Prévisualisation</label>\n        <label lang=\"en\">Preview</label>\n      </subdef>\n      <subdef class=\"thumbnail\" name=\"thumbnail\" downloadable=\"true\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <size>240</size>\n        <method>resample</method>\n        <dpi>72</dpi>\n        <strip>yes</strip>\n        <quality>75</quality>\n        <meta>no</meta>\n        <devices>screen</devices>\n        <mediatype>image</mediatype>\n        <label lang=\"fr\">Vignette</label>\n        <label lang=\"en\">Thumbnail</label>\n      </subdef>\n      <subdef class=\"preview\" name=\"preview_mobile\" downloadable=\"false\">\n        <size>480</size>\n        <resolution>72</resolution>\n        <strip>yes</strip>\n        <quality>75</quality>\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>image</mediatype>\n        <meta>no</meta>\n        <devices>handheld</devices>\n        <label lang=\"fr\">Prévisualisation Mobile</label>\n        <label lang=\"en\">Mobile Preview</label>\n      </subdef>\n      <subdef class=\"thumbnail\" name=\"thumbnail_mobile\" downloadable=\"false\">\n        <size>150</size>\n        <resolution>72</resolution>\n        <strip>yes</strip>\n        <quality>75</quality>\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>image</mediatype>\n        <meta>no</meta>\n        <devices>handheld</devices>\n        <label lang=\"fr\">Vignette mobile</label>\n        <label lang=\"en\">Mobile Thumbnail</label>\n      </subdef>\n    </subdefgroup>\n    <subdefgroup name=\"video\">\n      <subdef class=\"thumbnail\" name=\"thumbnail\" downloadable=\"false\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <size>240</size>\n        <devices>screen</devices>\n        <mediatype>image</mediatype>\n        <writeDatas>no</writeDatas>\n        <label lang=\"fr\">Vignette</label>\n        <label lang=\"en\">Thumbnail</label>\n      </subdef>\n      <subdef class=\"thumbnail\" name=\"thumbnailgif\" downloadable=\"false\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <size>240</size>\n        <mediatype>gif</mediatype>\n        <delay>150</delay>\n        <devices>screen</devices>\n        <writeDatas>no</writeDatas>\n        <label lang=\"fr\">Animation GIF</label>\n        <label lang=\"en\">GIF Animation</label>\n      </subdef>\n      <subdef class=\"preview\" name=\"preview\" downloadable=\"true\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <size>748</size>\n        <mediatype>video</mediatype>\n        <writeDatas>yes</writeDatas>\n        <acodec>libfaac</acodec>\n        <vcodec>libx264</vcodec>\n        <devices>screen</devices>\n        <bitrate>1000</bitrate>\n        <audiobitrate>128</audiobitrate>\n        <audiosamplerate>48000</audiosamplerate>\n        <fps>25</fps>\n        <GOPsize>25</GOPsize>\n        <label lang=\"fr\">Prévisualisation</label>\n        <label lang=\"en\">Preview</label>\n      </subdef>\n      <subdef class=\"preview\" name=\"preview_webm\" downloadable=\"false\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <size>748</size>\n        <mediatype>video</mediatype>\n        <devices>screen</devices>\n        <bitrate>1000</bitrate>\n        <audiobitrate>128</audiobitrate>\n        <audiosamplerate>48000</audiosamplerate>\n        <acodec>libvorbis</acodec>\n        <fps>25</fps>\n        <GOPsize>25</GOPsize>\n        <vcodec>libvpx</vcodec>\n        <label lang=\"fr\">Prévisualisation WebM</label>\n        <label lang=\"en\">WebM Preview</label>\n      </subdef>\n    </subdefgroup>\n    <subdefgroup name=\"audio\">\n      <subdef class=\"thumbnail\" name=\"thumbnail\" downloadable=\"true\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>image</mediatype>\n        <size>240</size>\n        <devices>screen</devices>\n        <writeDatas>no</writeDatas>\n        <label lang=\"fr\">Vignette</label>\n        <label lang=\"en\">Thumbnail</label>\n      </subdef>\n      <subdef class=\"preview\" name=\"preview\" downloadable=\"true\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>audio</mediatype>\n        <writeDatas>yes</writeDatas>\n        <audiobitrate>128</audiobitrate>\n        <audiosamplerate>48000</audiosamplerate>\n        <devices>screen</devices>\n        <label lang=\"fr\">Prévisualisation</label>\n        <label lang=\"en\">Preview</label>\n      </subdef>\n      <subdef class=\"preview\" name=\"preview_mobile\" downloadable=\"false\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>audio</mediatype>\n        <devices>handheld</devices>\n        <label lang=\"fr\">Prévisualisation Mobile</label>\n        <label lang=\"en\">Mobile Preview</label>\n      </subdef>\n    </subdefgroup>\n    <subdefgroup name=\"document\">\n      <subdef class=\"thumbnail\" name=\"thumbnail\" downloadable=\"false\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>image</mediatype>\n        <method>resample</method>\n        <dpi>72</dpi>\n        <size>240</size>\n        <writeDatas>no</writeDatas>\n        <devices>screen</devices>\n        <label lang=\"fr\">Vignette</label>\n        <label lang=\"en\">Thumbnail</label>\n      </subdef>\n      <subdef class=\"preview\" name=\"preview\" downloadable=\"false\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>pdf</mediatype>\n        <writeDatas>no</writeDatas>\n        <devices>screen</devices>\n        <label lang=\"fr\">Prévisualisation</label>\n        <label lang=\"en\">Preview</label>\n      </subdef>\n    </subdefgroup>\n    <subdefgroup name=\"flash\">\n      <subdef class=\"thumbnail\" name=\"thumbnail\" downloadable=\"false\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>image</mediatype>\n        <size>240</size>\n        <writeDatas>no</writeDatas>\n        <method>resample</method>\n        <dpi>72</dpi>\n        <devices>screen</devices>\n        <label lang=\"fr\">Vignette</label>\n        <label lang=\"en\">Thumbnail</label>\n      </subdef>\n      <subdef class=\"preview\" name=\"preview\" downloadable=\"false\">\n        <path>/var/www/app/datas/phrasea_data/subdefs</path>\n        <mediatype>image</mediatype>\n        <size>800</size>\n        <writeDatas>no</writeDatas>\n        <method>resample</method>\n        <dpi>72</dpi>\n        <devices>screen</devices>\n        <label lang=\"fr\">Prévisualisation</label>\n        <label lang=\"en\">Preview</label>\n      </subdef>\n    </subdefgroup>\n  </subdefs>\n  <description>\n    <Objet src=\"IPTC:ObjectName\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"1\" sorter=\"1\"/>\n    <Categorie src=\"IPTC:Category\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"2\" sorter=\"2\"/>\n    <AutresCategories src=\"IPTC:SupplementalCategories\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"1\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" separator=\";\" thumbtitle=\"0\" meta_id=\"3\" sorter=\"3\"/>\n    <MotsCles src=\"IPTC:Keywords\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"1\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" separator=\";\" thumbtitle=\"0\" meta_id=\"4\" sorter=\"4\"/>\n    <Observations src=\"IPTC:SpecialInstructions\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"5\" sorter=\"5\"/>\n    <Date src=\"IPTC:DateCreated\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"date\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"6\" sorter=\"6\"/>\n    <Signature src=\"IPTC:By-line\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"7\" sorter=\"7\"/>\n    <TitreCredits src=\"IPTC:By-lineTitle\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"8\" sorter=\"8\"/>\n    <Ville src=\"IPTC:City\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"9\" sorter=\"9\"/>\n    <Province src=\"IPTC:Province-State\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"10\" sorter=\"10\"/>\n    <Pays src=\"IPTC:Country-PrimaryLocationName\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"11\" sorter=\"11\"/>\n    <ReferencesOriginales src=\"IPTC:OriginalTransmissionReference\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"12\" sorter=\"12\"/>\n    <Titre src=\"IPTC:Headline\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"1\" meta_id=\"13\" sorter=\"13\"/>\n    <Credit src=\"IPTC:Credit\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"14\" sorter=\"14\"/>\n    <Source src=\"IPTC:Source\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"15\" sorter=\"15\"/>\n    <Legende src=\"IPTC:Caption-Abstract\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"16\" sorter=\"16\"/>\n    <Redacteur src=\"IPTC:Writer-Editor\" index=\"1\" readonly=\"0\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"17\" sorter=\"17\"/>\n    <Longitude src=\"GPS:GPSLongitude\" index=\"1\" readonly=\"1\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"number\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"18\" sorter=\"18\"/>\n    <Latitude src=\"GPS:GPSLatitude\" index=\"1\" readonly=\"1\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"number\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"19\" sorter=\"19\"/>\n    <AppareilPhoto src=\"IFD0:Model\" index=\"1\" readonly=\"1\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"20\" sorter=\"20\"/>\n    <NomDeFichier src=\"Phraseanet:tf-basename\" index=\"1\" readonly=\"1\" required=\"0\" multi=\"0\" report=\"1\" business=\"0\" aggregable=\"0\" type=\"string\" tbranch=\"\" generate_cterms=\"0\" gui_editable=\"0\" gui_visible=\"0\" thumbtitle=\"0\" meta_id=\"21\" sorter=\"21\"/>\n  </description>\n  <statbits>\n    <bit n=\"4\">Online</bit>\n  </statbits>\n</record>\n', '', '2020-07-02 15:38:36', '2020-07-02 13:38:36'),
(3, 'cterms', '', '', '0000-00-00 00:00:00', '2020-07-02 13:38:36'),
(4, 'indexes', '1', '', '2020-07-02 13:38:36', '2020-07-02 13:38:36'),
(5, 'ToU', '', 'fr_FR', '0000-00-00 00:00:00', '2020-07-02 13:38:36'),
(6, 'ToU', '', 'ar_SA', '0000-00-00 00:00:00', '2020-07-02 13:38:36'),
(7, 'ToU', '', 'de_DE', '0000-00-00 00:00:00', '2020-07-02 13:38:36'),
(8, 'ToU', '', 'en_GB', '0000-00-00 00:00:00', '2020-07-02 13:38:36'),
(9, 'version', '4.1.0-alpha.18a', '', '2020-07-02 13:38:36', '0000-00-00 00:00:00'),
(10, 'ToU', '', 'de', '2020-07-02 15:47:54', '2020-07-02 13:47:54'),
(11, 'ToU', '', 'en', '2020-07-02 15:47:54', '2020-07-02 13:47:54'),
(12, 'ToU', '', 'fr', '2020-07-02 15:47:54', '2020-07-02 13:47:54'),
(13, 'ToU', '', 'nl', '2020-07-02 15:47:54', '2020-07-02 13:47:54');

-- --------------------------------------------------------

--
-- Table structure for table `record`
--

CREATE TABLE IF NOT EXISTS `record` (
  `coll_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `record_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_record_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `status` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sha256` char(64) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `uuid` char(36) CHARACTER SET ascii DEFAULT NULL,
  `xml` longblob NOT NULL,
  `moddate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `credate` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `work` int(1) UNSIGNED NOT NULL DEFAULT 0,
  `mime` char(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('image','video','audio','document','flash','unknown') CHARACTER SET ascii COLLATE ascii_bin NOT NULL DEFAULT 'unknown',
  `jeton` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `bitly` char(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originalname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `coll_id` (`coll_id`),
  KEY `type` (`type`),
  KEY `record_status` (`status`),
  KEY `jeton` (`jeton`),
  KEY `sha256` (`sha256`),
  KEY `uuid` (`uuid`),
  KEY `bitly` (`bitly`),
  KEY `parent_record_id` (`parent_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regroup`
--

CREATE TABLE IF NOT EXISTS `regroup` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `rid_parent` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `rid_child` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `dateadd` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `ord` int(11) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lien` (`rid_child`,`rid_parent`),
  KEY `rid_parent` (`rid_parent`),
  KEY `rid_child` (`rid_child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subdef`
--

CREATE TABLE IF NOT EXISTS `subdef` (
  `subdef_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `record_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` char(64) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `path` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `file` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `width` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `height` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mime` char(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `substit` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `etag` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dispatched` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_on` datetime NOT NULL,
  `updated_on` datetime NOT NULL,
  PRIMARY KEY (`subdef_id`),
  UNIQUE KEY `unicite` (`record_id`,`name`),
  KEY `name` (`name`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suggest`
--

CREATE TABLE IF NOT EXISTS `suggest` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trigrams` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `freq` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `technical_datas`
--

CREATE TABLE IF NOT EXISTS `technical_datas` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `record_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `name` char(32) CHARACTER SET ascii NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unicite` (`record_id`,`name`),
  KEY `record_index` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
