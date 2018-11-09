-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u8
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 06, 2017 at 09:12 PM
-- Server version: 5.5.55
-- PHP Version: 5.4.45-0+deb7u8

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `WebDiP2016x038`
--

-- --------------------------------------------------------

--
-- Table structure for table `akcija`
--

CREATE TABLE IF NOT EXISTS `akcija` (
  `akcija_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `bodovi` int(11) NOT NULL,
  `opis` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`akcija_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `bira`
--

CREATE TABLE IF NOT EXISTS `bira` (
  `bira_id` int(11) NOT NULL AUTO_INCREMENT,
  `datum_od` date NOT NULL,
  `datum_do` date NOT NULL,
  `bodovi` int(11) NOT NULL,
  `kupon_id` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `kategorija_id` int(11) NOT NULL,
  PRIMARY KEY (`bira_id`),
  KEY `fk_kosarica_kupon1_idx` (`kupon_id`),
  KEY `fk_kosarica_korisnik1_idx` (`korisnik_id`),
  KEY `fk_bira_kategorija1_idx` (`kategorija_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `dnevnik`
--

CREATE TABLE IF NOT EXISTS `dnevnik` (
  `dnevnik_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv_proizvoda` varchar(100) NOT NULL,
  `datum` date NOT NULL,
  `vrijeme` time NOT NULL,
  `korisnik` varchar(50) NOT NULL,
  PRIMARY KEY (`dnevnik_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `dnevnik`
--

INSERT INTO `dnevnik` (`dnevnik_id`, `naziv_proizvoda`, `datum`, `vrijeme`, `korisnik`) VALUES
(1, 'Kuruza', '2017-04-11', '12:26:06', 'Neregistrirani korisnik'),
(2, 'Ispravno unesen proizvod: Cokolada', '2017-05-01', '18:33:27', 'Neregistrirani korisnik'),
(3, 'Ispravno unesen proizvod: Kiviii', '2017-05-01', '18:34:02', 'Neregistrirani korisnik'),
(4, 'Ispravno unesen proizvod: Haljina', '2017-05-02', '14:22:46', 'Neregistrirani korisnik'),
(5, 'Ispravno unesen proizvod: Bananaaaaa', '2017-05-02', '17:24:17', 'admin'),
(6, 'Ispravno unesen proizvod: Kuciste', '2017-05-02', '17:27:35', 'Neregistrirani korisnik'),
(7, 'Ispravno unesen proizvod: Katica ', '2017-05-05', '15:47:22', 'Neregistrirani korisnik'),
(8, 'Ispravno unesen proizvod: Cokoladica', '2017-05-05', '15:48:49', 'Neregistrirani korisnik'),
(9, 'Ispravno unesen proizvod: WebDiP', '2017-05-12', '16:58:13', 'Neregistrirani korisnik'),
(10, 'Ispravno unesen proizvod: Krumpir', '2017-05-19', '13:54:54', 'Neregistrirani korisnik'),
(11, 'Ispravno unesen proizvod: Nestoo', '2017-05-19', '16:54:32', 'Neregistrirani korisnik'),
(12, 'Ispravno unesen proizvod: Kupica', '2017-05-19', '17:53:08', 'Neregistrirani korisnik'),
(13, 'Ispravno unesen proizvod: Nazivas', '2017-05-19', '17:55:00', 'Neregistrirani korisnik'),
(14, 'Ispravno unesen proizvod: Nazivasdsa', '2017-05-19', '17:58:25', 'admin'),
(15, 'Ispravno unesen proizvod: Ananas', '2017-05-21', '00:28:25', 'Neregistrirani korisnik'),
(16, 'Ispravno unesen proizvod: Bananko banana', '2017-05-21', '00:35:28', 'nik123'),
(17, 'Ispravno unesen proizvod: Palacinka', '2017-05-21', '12:27:38', 'nik12');

-- --------------------------------------------------------

--
-- Table structure for table `dokument`
--

CREATE TABLE IF NOT EXISTS `dokument` (
  `dokument_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`dokument_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ima`
--

CREATE TABLE IF NOT EXISTS `ima` (
  `kategorija_id` int(11) NOT NULL,
  `webinar_id` int(11) NOT NULL,
  PRIMARY KEY (`kategorija_id`,`webinar_id`),
  KEY `fk_kategorija_webinara_has_webinar_webinar1_idx` (`webinar_id`),
  KEY `fk_kategorija_webinara_has_webinar_kategorija_webinara1_idx` (`kategorija_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `izgled_stranice`
--

CREATE TABLE IF NOT EXISTS `izgled_stranice` (
  `izgled_stranice_id` int(11) NOT NULL AUTO_INCREMENT,
  `boja_slova` varchar(45) DEFAULT NULL,
  `boja_pozadine` varchar(45) DEFAULT NULL,
  `font_family` varchar(45) DEFAULT NULL,
  `font_size` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`izgled_stranice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kategorija`
--

CREATE TABLE IF NOT EXISTS `kategorija` (
  `kategorija_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(50) NOT NULL,
  `opis` varchar(200) DEFAULT NULL,
  `izgled_stranice_id` int(11) NOT NULL,
  PRIMARY KEY (`kategorija_id`),
  KEY `fk_kategorija_izgled_stranice1_idx` (`izgled_stranice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `konfiguracija`
--

CREATE TABLE IF NOT EXISTS `konfiguracija` (
  `konfiguracija_id` int(11) NOT NULL AUTO_INCREMENT,
  `trajanje_sesije` int(11) DEFAULT NULL,
  `stranicenje` int(11) DEFAULT NULL,
  `pomak_vremena` int(11) DEFAULT NULL,
  `broj_neuspjesnih_prijava` int(11) DEFAULT NULL,
  `trajanje_aktivacije` int(11) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  PRIMARY KEY (`konfiguracija_id`),
  KEY `fk_konfiguracija_korisnik1_idx` (`korisnik_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `konfiguracija`
--

INSERT INTO `konfiguracija` (`konfiguracija_id`, `trajanje_sesije`, `stranicenje`, `pomak_vremena`, `broj_neuspjesnih_prijava`, `trajanje_aktivacije`, `korisnik_id`) VALUES
(1, 0, 10, 1, 3, 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE IF NOT EXISTS `korisnik` (
  `korisnik_id` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(45) NOT NULL,
  `prezime` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `korisnicko_ime` varchar(45) NOT NULL,
  `lozinka` varchar(45) NOT NULL,
  `adresa` varchar(80) DEFAULT NULL,
  `trenutni_bodovi` int(11) DEFAULT NULL,
  `dvorazinska_prijava` tinyint(1) DEFAULT NULL,
  `aktivacijski_link` varchar(255) DEFAULT NULL,
  `broj_pogresnih_prijava` int(11) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `aktiviran` tinyint(1) DEFAULT NULL,
  `kriptirana_lozinka` varchar(255) DEFAULT NULL,
  `datum_isteka_aktivacije` datetime DEFAULT NULL,
  `datum_registracije` datetime DEFAULT NULL,
  `tip_korisnika_id` int(11) NOT NULL,
  PRIMARY KEY (`korisnik_id`),
  KEY `fk_korisnik_tip_korisnika1_idx` (`tip_korisnika_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`korisnik_id`, `ime`, `prezime`, `email`, `korisnicko_ime`, `lozinka`, `adresa`, `trenutni_bodovi`, `dvorazinska_prijava`, `aktivacijski_link`, `broj_pogresnih_prijava`, `token`, `aktiviran`, `kriptirana_lozinka`, `datum_isteka_aktivacije`, `datum_registracije`, `tip_korisnika_id`) VALUES
(5, 'Nikola', 'Fluks', 'flukscro@gmail.com', 'nikfluks', 'NNnn11', '93.139.209.85', NULL, 1, '15b18bf45c3522183c64bdc5d8e6dece9ca20626', 0, '8653', 1, '0e352b9a881b22b4394984b967051cfe4227c71d', '2017-05-27 05:38:57', '2017-05-27 00:40:11', 3),
(6, 'Niko', 'Flu', 'nikfluks@foi.hr', 'nik123', 'NIko12', '93.139.209.85', NULL, 0, '50cc8c8b551e4ab1495ffa664606fadcb21bbffb', 0, NULL, 1, '7c35a4292325643099115316f85a8cf97e69a8ea', '2017-05-27 05:51:15', '2017-05-27 00:54:51', 2),
(7, 'Katarina', 'Edjut', 'lukenac@dnsdeer.com', 'kedjut', 'KKkk11', '93.139.209.85', NULL, 0, 'd28054d3ada3617162c1a0d5201d5a3b0f1d69d7', 0, NULL, 1, '13bb6602e238e8c09b5a8aa8328a7b7b4d5f10b2', '2017-05-27 16:12:11', '2017-05-27 17:15:16', 1),
(8, 'ASD', 'ASD', 'cohiy@lilylee.com', 'asdgf', 'KKkk11', '93.139.209.85', NULL, 0, '768cc31a33ec6ff8730f06c79465408936fb3135', NULL, NULL, 1, '17a7181235ff8895428157dba8983021e6d73a13', '2017-05-27 16:18:53', '2017-05-27 11:19:28', 1),
(9, 'Pero', 'Peric', 'yosam@ipdeer.com', 'asdghj', 'JJjj11', '93.139.209.85', NULL, 0, 'b16af8d6dc547be02a184cc4634c10f5edfdcf42', NULL, NULL, 1, '5811d286c351b78b8436a627dcd640a3d86e5d51', '2017-05-27 16:29:19', '2017-05-27 11:29:56', 1),
(10, 'Marko', 'Markic', 'jotaja@haydoo.com', 'asdo9', 'MMmm11', '93.139.209.85', NULL, 0, '2b1a4c0ff2529d54de949436f6ef9a35bc317be7', NULL, NULL, 1, 'ed29be5eb8bf644ab5baf264708bd3f10d4e227e', '2017-05-27 16:51:00', '2017-05-27 11:54:02', 1),
(11, 'Jozo', 'Bozo', 'redupe@lucyu.com', 'asd867', 'JJjj11', '93.139.209.85', NULL, 0, '43a39022b87af0deb2f8345aaf8dd808006a442e', NULL, NULL, 1, '2373d7137323d73a2a2f3260ee3aa0f9a1cd12fa', '2017-05-27 16:56:54', '2017-05-27 12:00:32', 1),
(12, 'Hghj', 'Kghjk', 'pemihira@haydoo.com', 'kijz', 'LLll11', '93.142.223.228', NULL, 1, '7747ea09e1afe23a0eda67ece80eae4ac4a43adc', -1, NULL, NULL, '24d322152e96495a96eb246b03afa935b07b06d6', '2017-05-27 22:29:30', NULL, 1),
(13, 'Alokin', 'Skulf', 'jetulojes@getapet.net', 'alokin', 'AAaa11', '93.142.223.228', NULL, 1, 'cca774286db708eea069996daf7d2bb634b6a0b5', -1, '4fbb2cca27d0755d2cb7f027d1a8830aa6a6743c', 1, '8d828162ea63a30e2cdb14cfd94f2fe0ecd209d5', '2017-05-27 22:41:02', '2017-05-27 17:41:20', 1),
(14, 'Branko', 'Branic', 'vacu@dnsdeer.com', 'branko', 'BBbb11', '93.142.236.215', NULL, 0, '08a381d23aa11e7f17a206d9447d4697fd5a9c53', NULL, NULL, 1, 'b425a549aa874ac85d17c90ced185848ee433051', '2017-05-30 00:30:02', '2017-05-29 19:34:41', 1),
(15, 'Ivan', 'Goran', 'buxop@lucyu.com', 'kovacic', 'GGgg11', '93.142.23.72', NULL, 1, '441e9bbb9da2b032047cfdbe82080e4d4b20e319', 0, '97f1b1073850ad4655cf024ff485fdb38cc5aae5', 1, 'dcd309eac2ef38de45c4348b25cf432cf198324b', '2017-05-30 21:49:29', '2017-05-30 16:50:28', 1),
(16, 'Drazen', 'Dras', 'sufi@lucyu.com', 'zen', 'SSss11', '93.142.23.72', NULL, 1, 'a8474faf6d057f0bc1d26279c61cb386d787eb4b', 0, '1a3de038b70eb1616a8d4faae6957a66a1442908', 1, '632f80c0fd11c01cda7acede8edf3f6ded2dd083', '2017-05-30 22:37:00', '2017-05-30 17:39:01', 1),
(17, 'alfi', 'alfo', 'alfi@gmail.com', 'mehmek', 'InkaInka5', '77.237.104.145', NULL, 1, '4d3d60416fd52ea4a23c423c5cdafdf774d421bd', NULL, NULL, NULL, 'e10e77b0e4abfb1e8e64bb68a3fbb7c07d00eb39', '2017-05-30 22:53:34', NULL, 1),
(18, 'Tonček', 'Puček', 'tumu@lilylee.com', 'warmachineroxX92', 'PaKajJe100', '95.112.182.41', NULL, 0, '7c0645f11c6d2a98f43cdf7d46ddd91195a8b686', 0, NULL, 1, '703fb5c87185772048279c65f4af72ad3194bd29', '2017-05-31 00:05:40', '2017-05-30 19:05:53', 1),
(19, 'Ana', 'Anić', 'yutudugip@ucylu.com', 'anica', 'AAaa1', '93.142.23.72', NULL, 1, 'd2c673a378f37b63c1bcb1d508e0524a76104272', 0, '4581', 1, '6ee21e709afa85c4cd785c26fe9e0a697dedb115', '2017-05-31 16:13:54', '2017-05-31 11:14:28', 1),
(20, 'Barica', 'Bara', 'yowov@ucylu.com', 'barek', 'BBbb11', '93.142.23.72', NULL, 1, 'ecdfb9f6d179952fa6929149ea6dd26c718d6731', 0, '8000', 1, '7d80aaf63bc216074d248ddb842e81a0289daafe', '2017-06-01 06:30:13', '2017-06-01 01:30:43', 1),
(21, 'Mati', 'Moja', 'nexadivado@lilylee.com', 'mila', 'NNnn11', '93.142.23.72', NULL, 1, '7596beac9a7f03206cda818225dbad76c7b30c52', 0, '6747', 0, 'a83356fff0defc0edf47f546b2222a35fdc9812e', '2017-06-01 18:24:02', '2017-06-01 13:24:29', 1),
(22, 'Žarko', 'Barko', 'fiyux@getapet.net', 'žac', 'BBbb11', '93.142.255.127', NULL, 1, 'd5f97bba084e17456c1deb408e7c519d5dea5fcb', NULL, NULL, 1, '930dab2e1338d0d269b7636b2fe1d259ea210310', '2017-06-03 19:32:44', '0000-00-00 00:00:00', 1),
(23, 'sad', 'gsd', 'wehujobi@lucyu.com', 'gfhj', 'KKkk11', '93.142.255.127', NULL, 1, 'dcc9e89f1879a43c5502c7201281a48bc9dd2ad3', NULL, NULL, NULL, '67545e408a4988a1140b2993e2b224e68d781caa', '2017-06-03 19:50:10', NULL, 1),
(24, 'fd', 'sdf', 'dozimon@ucylu.com', 'sdf', 'LLll1', '93.142.255.127', NULL, 1, 'e531719179a899d9115688b4e303faa04ef522e8', NULL, NULL, 1, '10e164d6107b9fcf963c1e4201aca3cdf5eb65f6', '2017-06-03 20:09:02', '2017-06-03 15:09:45', 1),
(25, 'Andres', 'Iniesta', 'culuvi@refurhost.com', 'andres', 'DOnn11', '93.142.255.127', NULL, 1, 'ad0cd6b63664f344fb96d9a6d6e538463007da1c', 4, '9830', 1, 'd12f0c39c9a15b49ae0b2c27f292f0ae2b65eb31', '2017-06-03 20:24:22', '2017-06-03 15:26:12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `kupon`
--

CREATE TABLE IF NOT EXISTS `kupon` (
  `kupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `kod` varchar(255) NOT NULL,
  `opis_pdf_url` varchar(255) DEFAULT NULL,
  `slika_url` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`kupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE IF NOT EXISTS `log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `sakupljeni_bodovi` int(11) DEFAULT NULL,
  `potroseni_bodovi` int(11) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `vrijeme` time DEFAULT NULL,
  `radnja` varchar(255) DEFAULT NULL,
  `adresa` varchar(20) NOT NULL,
  `skripta` varchar(50) NOT NULL,
  `preglednik` varchar(255) NOT NULL,
  `korisnik_id` int(11) NOT NULL,
  `akcija_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_id`),
  KEY `fk_log_korisnik1_idx` (`korisnik_id`),
  KEY `fk_log_akcija1_idx` (`akcija_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=806 ;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`log_id`, `sakupljeni_bodovi`, `potroseni_bodovi`, `datum`, `vrijeme`, `radnja`, `adresa`, `skripta`, `preglednik`, `korisnik_id`, `akcija_id`) VALUES
(1, NULL, NULL, '2017-05-27', '00:00:00', 'Registracija', '93.139.209.85', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 7, NULL),
(2, NULL, NULL, '2017-05-27', '00:00:00', 'Registracija', '93.139.209.85', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 8, NULL),
(3, NULL, NULL, '2017-05-27', '00:00:00', 'Aktivacija', '93.139.209.85', 'aktivacija.php?aktkod=768cc31a33ec6ff8730f06c79465', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 8, NULL),
(4, NULL, NULL, '2017-05-27', '00:00:00', 'Registracija', '93.139.209.85', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 9, NULL),
(5, NULL, NULL, '2017-05-27', '00:00:00', 'Aktivacija', '93.139.209.85', 'aktivacija.php?aktkod=b16af8d6dc547be02a184cc4634c', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 9, NULL),
(6, NULL, NULL, '2017-05-27', '00:00:00', 'Registracija', '93.139.209.85', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 10, NULL),
(7, NULL, NULL, '2017-05-27', '00:00:00', 'Aktivacija', '93.139.209.85', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 10, NULL),
(8, NULL, NULL, '2017-05-27', '11:56:54', 'Registracija', '93.139.209.85', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 11, NULL),
(9, NULL, NULL, '2017-05-27', '12:00:32', 'Aktivacija', '93.139.209.85', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 11, NULL),
(10, NULL, NULL, '2017-05-27', '14:54:55', 'Neuspješna prijava', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(11, NULL, NULL, '2017-05-27', '15:06:20', 'Neuspješna prijava: pogrešna lozinka', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(12, NULL, NULL, '2017-05-27', '15:08:40', 'Neuspješna prijava: nije aktiviran!', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(13, NULL, NULL, '2017-05-27', '15:09:57', 'Neuspješna prijava: nije aktiviran', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(14, NULL, NULL, '2017-05-27', '15:10:54', 'Neuspješna prijava: pogrešna lozinka', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(15, NULL, NULL, '2017-05-27', '15:11:00', 'Neuspješna prijava: pogrešna lozinka', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(16, NULL, NULL, '2017-05-27', '15:11:02', 'Neuspješna prijava: zaključan', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(17, NULL, NULL, '2017-05-27', '15:11:05', 'Neuspješna prijava: zaključan', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(18, NULL, NULL, '2017-05-27', '15:17:34', 'Neuspješna prijava: pogrešna lozinka', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(19, NULL, NULL, '2017-05-27', '15:19:02', 'Uspješna prijava', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(20, NULL, NULL, '2017-05-27', '16:24:37', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(21, NULL, NULL, '2017-05-27', '16:24:37', 'Neuspješna prijava: pogrešna lozinka', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(22, NULL, NULL, '2017-05-27', '16:28:04', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(23, NULL, NULL, '2017-05-27', '16:28:05', 'Neuspješna prijava: pogrešna lozinka', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(24, NULL, NULL, '2017-05-27', '16:28:05', 'UPDATE', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(25, NULL, NULL, '2017-05-27', '16:48:59', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(26, NULL, NULL, '2017-05-27', '16:48:59', 'UPDATE', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(27, NULL, NULL, '2017-05-27', '16:52:17', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(28, NULL, NULL, '2017-05-27', '16:52:17', 'UPDATE', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(29, NULL, NULL, '2017-05-27', '16:52:17', 'Uspješna prijava', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(31, NULL, NULL, '2017-05-27', '17:29:30', 'INSERT', '93.142.223.228', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 12, NULL),
(32, NULL, NULL, '2017-05-27', '17:29:30', 'Registracija', '93.142.223.228', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 12, NULL),
(33, NULL, NULL, '2017-05-27', '17:41:02', 'SELECT', '93.142.223.228', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(34, NULL, NULL, '2017-05-27', '17:41:02', 'INSERT', '93.142.223.228', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(35, NULL, NULL, '2017-05-27', '17:41:02', 'Registracija', '93.142.223.228', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(36, NULL, NULL, '2017-05-27', '17:41:20', 'SELECT', '93.142.223.228', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(37, NULL, NULL, '2017-05-27', '17:41:20', 'UPDATE', '93.142.223.228', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(38, NULL, NULL, '2017-05-27', '17:41:20', 'Aktivacija', '93.142.223.228', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(39, NULL, NULL, '2017-05-27', '17:41:24', 'SELECT', '93.142.223.228', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(40, NULL, NULL, '2017-05-27', '17:43:43', 'SELECT', '93.142.223.228', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(41, NULL, NULL, '2017-05-27', '17:45:47', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(42, NULL, NULL, '2017-05-27', '17:45:48', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(43, NULL, NULL, '2017-05-27', '17:45:56', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(44, NULL, NULL, '2017-05-27', '17:45:56', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(45, NULL, NULL, '2017-05-27', '17:45:56', 'UPDATE', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(46, NULL, NULL, '2017-05-27', '17:46:12', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(47, NULL, NULL, '2017-05-27', '17:46:13', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(48, NULL, NULL, '2017-05-27', '17:46:13', 'UPDATE', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(49, NULL, NULL, '2017-05-27', '17:46:13', 'Uspješna prijava', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(50, NULL, NULL, '2017-05-27', '17:46:32', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(51, NULL, NULL, '2017-05-27', '17:46:32', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(52, NULL, NULL, '2017-05-27', '17:46:32', 'Neuspješna prijava: pogrešna lozinka', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(53, NULL, NULL, '2017-05-27', '17:46:32', 'UPDATE', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(54, NULL, NULL, '2017-05-27', '18:00:16', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(55, NULL, NULL, '2017-05-27', '18:00:16', 'SELECT', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(56, NULL, NULL, '2017-05-27', '18:00:16', 'UPDATE', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(57, NULL, NULL, '2017-05-27', '18:00:16', 'Neuspješna prijava: pogrešna lozinka', '93.142.223.228', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 13, NULL),
(58, NULL, NULL, '2017-05-29', '19:28:35', 'INSERT', '93.142.236.215', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 14, NULL),
(59, NULL, NULL, '2017-05-29', '19:28:35', 'Registracija', '93.142.236.215', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 14, NULL),
(60, NULL, NULL, '2017-05-29', '19:34:40', 'SELECT', '93.142.236.215', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 14, NULL),
(61, NULL, NULL, '2017-05-29', '19:34:41', 'UPDATE', '93.142.236.215', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 14, NULL),
(62, NULL, NULL, '2017-05-29', '19:34:41', 'Aktivacija', '93.142.236.215', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 14, NULL),
(63, NULL, NULL, '2017-05-29', '21:42:32', 'SELECT', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(64, NULL, NULL, '2017-05-29', '21:42:32', 'UPDATE', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(65, NULL, NULL, '2017-05-29', '21:42:32', 'Neuspješna prijava: pogrešna lozinka', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(66, NULL, NULL, '2017-05-30', '12:17:50', 'SELECT', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(67, NULL, NULL, '2017-05-30', '12:17:51', 'UPDATE', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(68, NULL, NULL, '2017-05-30', '12:17:51', 'Uspješna prijava', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(69, NULL, NULL, '2017-05-30', '12:27:30', 'SELECT', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(70, NULL, NULL, '2017-05-30', '12:27:30', 'UPDATE', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(71, NULL, NULL, '2017-05-30', '12:27:30', 'Uspješna prijava', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(72, NULL, NULL, '2017-05-30', '12:35:37', 'SELECT', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(73, NULL, NULL, '2017-05-30', '12:35:38', 'UPDATE', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(74, NULL, NULL, '2017-05-30', '12:35:38', 'Uspješna prijava', '93.142.236.215', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(75, NULL, NULL, '2017-05-30', '16:49:30', 'INSERT', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(76, NULL, NULL, '2017-05-30', '16:49:30', 'Registracija', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(77, NULL, NULL, '2017-05-30', '16:50:28', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(78, NULL, NULL, '2017-05-30', '16:50:28', 'UPDATE', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(79, NULL, NULL, '2017-05-30', '16:50:28', 'Aktivacija', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(80, NULL, NULL, '2017-05-30', '16:50:54', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(81, NULL, NULL, '2017-05-30', '16:50:54', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(82, NULL, NULL, '2017-05-30', '16:50:54', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(83, NULL, NULL, '2017-05-30', '16:51:15', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(84, NULL, NULL, '2017-05-30', '16:51:38', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(85, NULL, NULL, '2017-05-30', '16:51:38', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(86, NULL, NULL, '2017-05-30', '16:51:38', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(87, NULL, NULL, '2017-05-30', '16:51:44', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(88, NULL, NULL, '2017-05-30', '16:51:44', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(89, NULL, NULL, '2017-05-30', '16:52:28', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(90, NULL, NULL, '2017-05-30', '16:52:28', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(91, NULL, NULL, '2017-05-30', '16:52:28', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 15, NULL),
(92, NULL, NULL, '2017-05-30', '17:20:13', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(93, NULL, NULL, '2017-05-30', '17:20:14', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(94, NULL, NULL, '2017-05-30', '17:20:14', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(95, NULL, NULL, '2017-05-30', '17:27:58', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(96, NULL, NULL, '2017-05-30', '17:27:58', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(97, NULL, NULL, '2017-05-30', '17:27:58', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(98, NULL, NULL, '2017-05-30', '17:37:00', 'INSERT', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(99, NULL, NULL, '2017-05-30', '17:37:00', 'Registracija', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(100, NULL, NULL, '2017-05-30', '17:39:00', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(101, NULL, NULL, '2017-05-30', '17:39:01', 'UPDATE', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(102, NULL, NULL, '2017-05-30', '17:39:01', 'Aktivacija', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(103, NULL, NULL, '2017-05-30', '17:39:03', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(104, NULL, NULL, '2017-05-30', '17:39:06', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(105, NULL, NULL, '2017-05-30', '17:42:11', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(106, NULL, NULL, '2017-05-30', '17:42:19', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(107, NULL, NULL, '2017-05-30', '17:42:19', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(108, NULL, NULL, '2017-05-30', '17:42:19', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(109, NULL, NULL, '2017-05-30', '17:42:25', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(110, NULL, NULL, '2017-05-30', '17:42:25', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(111, NULL, NULL, '2017-05-30', '17:43:33', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(112, NULL, NULL, '2017-05-30', '17:43:33', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(113, NULL, NULL, '2017-05-30', '17:43:33', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(114, NULL, NULL, '2017-05-30', '17:50:59', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 16, NULL),
(115, NULL, NULL, '2017-05-30', '17:53:35', 'INSERT', '77.237.104.145', 'registracija.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 17, NULL),
(116, NULL, NULL, '2017-05-30', '17:53:35', 'Registracija', '77.237.104.145', 'registracija.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 17, NULL),
(117, NULL, NULL, '2017-05-30', '19:05:42', 'INSERT', '95.112.182.41', 'registracija.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 18, NULL),
(118, NULL, NULL, '2017-05-30', '19:05:42', 'Registracija', '95.112.182.41', 'registracija.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 18, NULL),
(119, NULL, NULL, '2017-05-30', '19:05:53', 'SELECT', '95.112.182.41', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 18, NULL),
(120, NULL, NULL, '2017-05-30', '19:05:53', 'UPDATE', '95.112.182.41', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 18, NULL),
(121, NULL, NULL, '2017-05-30', '19:05:53', 'Aktivacija', '95.112.182.41', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 18, NULL),
(122, NULL, NULL, '2017-05-30', '19:06:21', 'SELECT', '95.112.182.41', 'prijava.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 18, NULL),
(123, NULL, NULL, '2017-05-30', '19:06:22', 'UPDATE', '95.112.182.41', 'prijava.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 18, NULL),
(124, NULL, NULL, '2017-05-30', '19:06:22', 'Uspješna prijava', '95.112.182.41', 'prijava.php', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36', 18, NULL),
(125, NULL, NULL, '2017-05-30', '23:43:21', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(126, NULL, NULL, '2017-05-30', '23:43:21', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(127, NULL, NULL, '2017-05-30', '23:43:21', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(128, NULL, NULL, '2017-05-30', '23:57:42', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(129, NULL, NULL, '2017-05-30', '23:57:42', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(130, NULL, NULL, '2017-05-30', '23:57:42', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(131, NULL, NULL, '2017-05-30', '23:59:39', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(132, NULL, NULL, '2017-05-30', '23:59:39', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(133, NULL, NULL, '2017-05-30', '23:59:39', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(134, NULL, NULL, '2017-05-31', '00:07:20', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(135, NULL, NULL, '2017-05-31', '00:07:20', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(136, NULL, NULL, '2017-05-31', '00:07:20', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(137, NULL, NULL, '2017-05-31', '00:07:30', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(138, NULL, NULL, '2017-05-31', '00:07:31', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(139, NULL, NULL, '2017-05-31', '00:07:31', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(140, NULL, NULL, '2017-05-31', '00:09:06', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(141, NULL, NULL, '2017-05-31', '00:09:06', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(142, NULL, NULL, '2017-05-31', '00:09:06', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(143, NULL, NULL, '2017-05-31', '09:29:35', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(144, NULL, NULL, '2017-05-31', '09:29:35', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(145, NULL, NULL, '2017-05-31', '09:29:50', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(146, NULL, NULL, '2017-05-31', '09:29:50', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(147, NULL, NULL, '2017-05-31', '09:29:50', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(148, NULL, NULL, '2017-05-31', '09:48:28', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(149, NULL, NULL, '2017-05-31', '09:48:29', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(150, NULL, NULL, '2017-05-31', '09:48:30', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(151, NULL, NULL, '2017-05-31', '09:49:29', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(152, NULL, NULL, '2017-05-31', '09:49:29', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(153, NULL, NULL, '2017-05-31', '09:49:29', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(154, NULL, NULL, '2017-05-31', '09:49:53', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 7, NULL),
(155, NULL, NULL, '2017-05-31', '09:49:53', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 7, NULL),
(156, NULL, NULL, '2017-05-31', '09:49:53', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 7, NULL),
(157, NULL, NULL, '2017-05-31', '10:12:48', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(158, NULL, NULL, '2017-05-31', '10:12:50', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(159, NULL, NULL, '2017-05-31', '10:14:39', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(160, NULL, NULL, '2017-05-31', '10:14:39', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(161, NULL, NULL, '2017-05-31', '10:14:39', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(162, NULL, NULL, '2017-05-31', '10:19:25', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(163, NULL, NULL, '2017-05-31', '10:19:25', 'Neuspješna prijava: token istekao', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(164, NULL, NULL, '2017-05-31', '11:10:16', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(165, NULL, NULL, '2017-05-31', '11:10:16', 'Neuspješna prijava: token istekao', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(166, NULL, NULL, '2017-05-31', '11:10:31', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(167, NULL, NULL, '2017-05-31', '11:10:31', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(168, NULL, NULL, '2017-05-31', '11:10:31', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(169, NULL, NULL, '2017-05-31', '11:13:54', 'INSERT', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(170, NULL, NULL, '2017-05-31', '11:13:54', 'Registracija', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(171, NULL, NULL, '2017-05-31', '11:14:28', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(172, NULL, NULL, '2017-05-31', '11:14:28', 'UPDATE', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(173, NULL, NULL, '2017-05-31', '11:14:28', 'Aktivacija', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(174, NULL, NULL, '2017-05-31', '11:15:34', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(175, NULL, NULL, '2017-05-31', '11:15:34', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(176, NULL, NULL, '2017-05-31', '11:15:34', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(177, NULL, NULL, '2017-05-31', '11:15:50', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(178, NULL, NULL, '2017-05-31', '11:16:02', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(179, NULL, NULL, '2017-05-31', '11:16:02', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(180, NULL, NULL, '2017-05-31', '11:16:29', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(181, NULL, NULL, '2017-05-31', '11:16:29', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(182, NULL, NULL, '2017-05-31', '11:16:29', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(184, NULL, NULL, '2017-05-31', '11:22:07', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(187, NULL, NULL, '2017-05-31', '11:26:45', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(190, NULL, NULL, '2017-05-31', '11:27:34', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 19, NULL),
(191, NULL, NULL, '2017-05-31', '12:24:29', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(192, NULL, NULL, '2017-05-31', '12:24:29', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(193, NULL, NULL, '2017-05-31', '12:24:29', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(194, NULL, NULL, '2017-05-31', '12:40:25', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(195, NULL, NULL, '2017-05-31', '12:40:25', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(196, NULL, NULL, '2017-05-31', '12:40:25', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(197, NULL, NULL, '2017-05-31', '12:40:30', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(198, NULL, NULL, '2017-05-31', '12:40:30', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(199, NULL, NULL, '2017-05-31', '12:40:30', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(200, NULL, NULL, '2017-05-31', '12:40:37', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(201, NULL, NULL, '2017-05-31', '12:40:37', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(202, NULL, NULL, '2017-05-31', '12:40:37', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(203, NULL, NULL, '2017-05-31', '12:43:30', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(204, NULL, NULL, '2017-05-31', '12:43:31', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(205, NULL, NULL, '2017-05-31', '12:43:31', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(206, NULL, NULL, '2017-05-31', '12:43:33', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(207, NULL, NULL, '2017-05-31', '12:43:33', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(208, NULL, NULL, '2017-05-31', '12:43:33', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(209, NULL, NULL, '2017-05-31', '12:43:35', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(210, NULL, NULL, '2017-05-31', '12:43:35', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(211, NULL, NULL, '2017-05-31', '12:43:35', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(212, NULL, NULL, '2017-05-31', '12:43:39', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(213, NULL, NULL, '2017-05-31', '12:43:39', 'Neuspješna prijava: zaključan', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(214, NULL, NULL, '2017-05-31', '12:44:03', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(215, NULL, NULL, '2017-05-31', '12:44:03', 'Neuspješna prijava: zaključan', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(216, NULL, NULL, '2017-05-31', '15:20:04', 'SELECT', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(217, NULL, NULL, '2017-05-31', '15:20:35', 'SELECT', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(218, NULL, NULL, '2017-05-31', '15:20:35', 'UPDATE', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(219, NULL, NULL, '2017-05-31', '15:20:35', 'Promjena lozinke', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(220, NULL, NULL, '2017-05-31', '15:23:50', 'SELECT', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(221, NULL, NULL, '2017-05-31', '15:23:50', 'UPDATE', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(222, NULL, NULL, '2017-05-31', '15:23:50', 'Promjena lozinke', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(223, NULL, NULL, '2017-05-31', '16:13:11', 'SELECT', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(224, NULL, NULL, '2017-05-31', '16:13:11', 'UPDATE', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(225, NULL, NULL, '2017-05-31', '16:13:11', 'Promjena lozinke', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(226, NULL, NULL, '2017-05-31', '16:14:26', 'SELECT', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(227, NULL, NULL, '2017-05-31', '16:14:26', 'UPDATE', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(228, NULL, NULL, '2017-05-31', '16:14:26', 'Promjena lozinke', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(229, NULL, NULL, '2017-05-31', '16:28:12', 'SELECT', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(230, NULL, NULL, '2017-05-31', '16:28:12', 'UPDATE', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(231, NULL, NULL, '2017-05-31', '16:28:12', 'Promjena lozinke', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(232, NULL, NULL, '2017-05-31', '16:31:22', 'SELECT', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(233, NULL, NULL, '2017-05-31', '16:31:22', 'UPDATE', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(234, NULL, NULL, '2017-05-31', '16:31:22', 'Promjena lozinke', '93.142.23.72', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL);
INSERT INTO `log` (`log_id`, `sakupljeni_bodovi`, `potroseni_bodovi`, `datum`, `vrijeme`, `radnja`, `adresa`, `skripta`, `preglednik`, `korisnik_id`, `akcija_id`) VALUES
(235, NULL, NULL, '2017-05-31', '16:54:20', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(236, NULL, NULL, '2017-05-31', '16:54:20', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(237, NULL, NULL, '2017-05-31', '16:54:48', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(238, NULL, NULL, '2017-05-31', '16:54:48', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(239, NULL, NULL, '2017-05-31', '16:54:48', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(240, NULL, NULL, '2017-05-31', '17:05:52', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(241, NULL, NULL, '2017-05-31', '17:05:52', 'Neuspješna prijava: token istekao', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(242, NULL, NULL, '2017-05-31', '17:05:59', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(243, NULL, NULL, '2017-05-31', '17:05:59', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(244, NULL, NULL, '2017-05-31', '17:06:08', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(245, NULL, NULL, '2017-05-31', '17:06:09', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(246, NULL, NULL, '2017-05-31', '17:06:09', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(247, NULL, NULL, '2017-06-01', '01:30:13', 'INSERT', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(248, NULL, NULL, '2017-06-01', '01:30:13', 'Registracija', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(249, NULL, NULL, '2017-06-01', '01:30:43', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(250, NULL, NULL, '2017-06-01', '01:30:43', 'UPDATE', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(251, NULL, NULL, '2017-06-01', '01:30:43', 'Aktivacija', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(252, NULL, NULL, '2017-06-01', '01:30:46', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(253, NULL, NULL, '2017-06-01', '01:31:09', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(254, NULL, NULL, '2017-06-01', '01:31:09', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(255, NULL, NULL, '2017-06-01', '01:31:20', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(256, NULL, NULL, '2017-06-01', '01:31:20', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(257, NULL, NULL, '2017-06-01', '01:31:20', 'Neuspješna prijava: pogrešna lozinka', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(258, NULL, NULL, '2017-06-01', '01:31:35', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(259, NULL, NULL, '2017-06-01', '01:31:35', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(260, NULL, NULL, '2017-06-01', '01:31:35', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 20, NULL),
(261, NULL, NULL, '2017-06-01', '11:21:47', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(262, NULL, NULL, '2017-06-01', '11:21:47', 'Neuspješna prijava: zaključan', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(263, NULL, NULL, '2017-06-01', '11:22:17', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(264, NULL, NULL, '2017-06-01', '11:22:17', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(265, NULL, NULL, '2017-06-01', '11:22:17', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(266, NULL, NULL, '2017-06-01', '13:24:03', 'INSERT', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(267, NULL, NULL, '2017-06-01', '13:24:04', 'Registracija', '93.142.23.72', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(268, NULL, NULL, '2017-06-01', '13:24:24', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(269, NULL, NULL, '2017-06-01', '13:24:24', 'Neuspješna prijava: nije aktiviran', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(270, NULL, NULL, '2017-06-01', '13:24:29', 'SELECT', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(271, NULL, NULL, '2017-06-01', '13:24:29', 'UPDATE', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(272, NULL, NULL, '2017-06-01', '13:24:29', 'Aktivacija', '93.142.23.72', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(273, NULL, NULL, '2017-06-01', '13:24:39', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(274, NULL, NULL, '2017-06-01', '13:24:51', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(275, NULL, NULL, '2017-06-01', '13:24:51', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(276, NULL, NULL, '2017-06-01', '13:25:16', 'SELECT', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(277, NULL, NULL, '2017-06-01', '13:25:16', 'UPDATE', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(278, NULL, NULL, '2017-06-01', '13:25:16', 'Uspješna prijava', '93.142.23.72', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(279, NULL, NULL, '2017-06-01', '14:40:06', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(280, NULL, NULL, '2017-06-01', '14:40:07', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(281, NULL, NULL, '2017-06-01', '14:40:07', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(282, NULL, NULL, '2017-06-01', '14:44:40', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(283, NULL, NULL, '2017-06-01', '14:44:40', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(284, NULL, NULL, '2017-06-01', '14:44:40', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(285, NULL, NULL, '2017-06-01', '14:50:27', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(286, NULL, NULL, '2017-06-01', '14:50:27', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(287, NULL, NULL, '2017-06-01', '14:50:27', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(288, NULL, NULL, '2017-06-01', '14:50:51', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(289, NULL, NULL, '2017-06-01', '14:50:51', 'Neuspješna prijava: zaključan', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(290, NULL, NULL, '2017-06-01', '14:50:58', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(291, NULL, NULL, '2017-06-01', '14:50:58', 'Neuspješna prijava: zaključan', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(292, NULL, NULL, '2017-06-01', '14:55:44', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(293, NULL, NULL, '2017-06-01', '14:55:44', 'Neuspješna prijava: zaključan', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(294, NULL, NULL, '2017-06-01', '14:56:29', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(295, NULL, NULL, '2017-06-01', '14:56:29', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(296, NULL, NULL, '2017-06-01', '14:56:29', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(297, NULL, NULL, '2017-06-01', '14:57:15', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(298, NULL, NULL, '2017-06-01', '14:57:15', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(299, NULL, NULL, '2017-06-01', '14:57:15', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(300, NULL, NULL, '2017-06-01', '14:58:05', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(301, NULL, NULL, '2017-06-01', '14:58:05', 'Neuspješna prijava: zaključan', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(302, NULL, NULL, '2017-06-01', '14:58:10', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(303, NULL, NULL, '2017-06-01', '14:58:10', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(304, NULL, NULL, '2017-06-01', '14:58:10', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(305, NULL, NULL, '2017-06-01', '14:58:22', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(306, NULL, NULL, '2017-06-01', '14:58:22', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(307, NULL, NULL, '2017-06-01', '14:58:22', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(308, NULL, NULL, '2017-06-01', '14:59:40', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(309, NULL, NULL, '2017-06-01', '14:59:40', 'Neuspješna prijava: nije aktiviran', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 21, NULL),
(310, NULL, NULL, '2017-06-01', '15:00:18', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(311, NULL, NULL, '2017-06-01', '15:00:18', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(312, NULL, NULL, '2017-06-01', '15:00:18', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(313, NULL, NULL, '2017-06-01', '15:00:29', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(314, NULL, NULL, '2017-06-01', '15:00:29', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(315, NULL, NULL, '2017-06-01', '15:00:29', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(316, NULL, NULL, '2017-06-01', '15:00:38', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(317, NULL, NULL, '2017-06-01', '15:00:38', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(318, NULL, NULL, '2017-06-01', '15:00:38', 'Uspješna prijava', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(319, NULL, NULL, '2017-06-01', '15:41:34', 'SELECT', '93.142.27.68', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(320, NULL, NULL, '2017-06-01', '15:41:34', 'UPDATE', '93.142.27.68', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(321, NULL, NULL, '2017-06-01', '15:41:34', 'Promjena lozinke', '93.142.27.68', 'zaboravljena_lozinka.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(322, NULL, NULL, '2017-06-01', '15:51:19', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(323, NULL, NULL, '2017-06-01', '15:51:19', 'Neuspješna prijava: pogrešan token', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(324, NULL, NULL, '2017-06-01', '15:53:19', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(325, NULL, NULL, '2017-06-01', '15:53:19', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(326, NULL, NULL, '2017-06-01', '15:53:19', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(327, NULL, NULL, '2017-06-01', '15:53:29', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(328, NULL, NULL, '2017-06-01', '15:53:29', 'Neuspješna prijava: token istekao', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(329, NULL, NULL, '2017-06-01', '15:54:01', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(330, NULL, NULL, '2017-06-01', '15:54:01', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(331, NULL, NULL, '2017-06-01', '15:54:22', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(332, NULL, NULL, '2017-06-01', '15:54:22', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(333, NULL, NULL, '2017-06-01', '15:54:22', 'Uspješna prijava', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(334, NULL, NULL, '2017-06-01', '16:36:22', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(335, NULL, NULL, '2017-06-01', '16:36:22', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(336, NULL, NULL, '2017-06-01', '16:36:22', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(337, NULL, NULL, '2017-06-01', '16:36:40', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(338, NULL, NULL, '2017-06-01', '16:36:40', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(339, NULL, NULL, '2017-06-01', '16:36:40', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(340, NULL, NULL, '2017-06-01', '16:36:46', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(341, NULL, NULL, '2017-06-01', '16:36:46', 'Neuspješna prijava: token istekao', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(342, NULL, NULL, '2017-06-01', '16:37:08', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(343, NULL, NULL, '2017-06-01', '16:37:09', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(344, NULL, NULL, '2017-06-01', '16:37:09', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(345, NULL, NULL, '2017-06-01', '16:37:18', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(346, NULL, NULL, '2017-06-01', '16:37:18', 'Neuspješna prijava: zaključan', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(347, NULL, NULL, '2017-06-01', '16:48:45', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(348, NULL, NULL, '2017-06-01', '16:48:45', 'Neuspješna prijava: token istekao', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(349, NULL, NULL, '2017-06-01', '16:49:24', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(350, NULL, NULL, '2017-06-01', '16:49:24', 'Neuspješna prijava: token istekao', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(351, NULL, NULL, '2017-06-01', '16:49:57', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(352, NULL, NULL, '2017-06-01', '16:49:57', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(353, NULL, NULL, '2017-06-01', '16:51:56', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(354, NULL, NULL, '2017-06-01', '16:51:56', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(355, NULL, NULL, '2017-06-01', '16:51:56', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(356, NULL, NULL, '2017-06-01', '16:52:02', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(357, NULL, NULL, '2017-06-01', '16:52:02', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(358, NULL, NULL, '2017-06-01', '16:52:40', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(359, NULL, NULL, '2017-06-01', '16:52:40', 'Neuspješna prijava: pogrešan token', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(360, NULL, NULL, '2017-06-01', '16:52:52', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(361, NULL, NULL, '2017-06-01', '16:52:52', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(362, NULL, NULL, '2017-06-01', '16:52:52', 'Neuspješna prijava: pogrešna lozinka', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(363, NULL, NULL, '2017-06-01', '16:53:00', 'SELECT', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(364, NULL, NULL, '2017-06-01', '16:53:00', 'UPDATE', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(365, NULL, NULL, '2017-06-01', '16:53:00', 'Uspješna prijava', '93.142.27.68', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(368, NULL, NULL, '2017-06-01', '17:17:51', 'SELECT', '93.142.27.68', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(369, NULL, NULL, '2017-06-01', '17:18:03', 'SELECT', '93.142.27.68', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(370, NULL, NULL, '2017-06-01', '17:18:23', 'SELECT', '93.142.27.68', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(371, NULL, NULL, '2017-06-01', '17:18:32', 'SELECT', '93.142.27.68', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(387, NULL, NULL, '2064-11-03', '23:05:28', 'INSERT', '93.142.255.127', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 22, NULL),
(388, NULL, NULL, '2064-11-03', '23:05:28', 'Registracija', '93.142.255.127', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 22, NULL),
(389, NULL, NULL, '2064-11-03', '23:06:28', 'SELECT', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 22, NULL),
(390, NULL, NULL, '2064-11-03', '23:06:28', 'UPDATE', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 22, NULL),
(391, NULL, NULL, '2064-11-03', '23:06:28', 'Aktivacija', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 22, NULL),
(392, NULL, NULL, '1970-01-01', '01:33:37', 'INSERT', '93.142.255.127', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 23, NULL),
(393, NULL, NULL, '1970-01-01', '01:33:37', 'Registracija', '93.142.255.127', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 23, NULL),
(394, NULL, NULL, '2064-11-04', '00:18:04', 'INSERT', '93.142.255.127', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 24, NULL),
(395, NULL, NULL, '2064-11-04', '00:18:04', 'Registracija', '93.142.255.127', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 24, NULL),
(396, NULL, NULL, '2064-11-04', '00:19:30', 'SELECT', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 24, NULL),
(397, NULL, NULL, '2064-11-04', '00:19:30', 'UPDATE', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 24, NULL),
(398, NULL, NULL, '2064-11-04', '00:19:30', 'Aktivacija', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 24, NULL),
(399, NULL, NULL, '2064-11-04', '00:19:40', 'SELECT', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 24, NULL),
(400, NULL, NULL, '2017-06-03', '15:24:23', 'INSERT', '93.142.255.127', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(401, NULL, NULL, '2017-06-03', '15:24:23', 'Registracija', '93.142.255.127', 'registracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(402, NULL, NULL, '2017-06-03', '15:26:12', 'SELECT', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(403, NULL, NULL, '2017-06-03', '15:26:12', 'UPDATE', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(404, NULL, NULL, '2017-06-03', '15:26:12', 'Aktivacija', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(405, NULL, NULL, '2017-06-03', '15:26:16', 'SELECT', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(406, NULL, NULL, '2017-06-03', '15:26:18', 'SELECT', '93.142.255.127', 'aktivacija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(407, NULL, NULL, '2017-06-03', '15:30:57', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(408, NULL, NULL, '2017-06-03', '15:31:30', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(409, NULL, NULL, '2017-06-03', '15:31:30', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(410, NULL, NULL, '2017-06-03', '16:14:27', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(411, NULL, NULL, '2017-06-03', '16:14:27', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(412, NULL, NULL, '2017-06-03', '16:14:27', 'Uspješna prijava', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(413, NULL, NULL, '2017-06-03', '16:36:26', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(414, NULL, NULL, '2017-06-03', '16:36:26', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(415, NULL, NULL, '2017-06-03', '16:37:27', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(416, NULL, NULL, '2017-06-03', '16:37:27', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(417, NULL, NULL, '2017-06-03', '16:46:24', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(418, NULL, NULL, '2017-06-03', '16:46:24', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(419, NULL, NULL, '2017-06-03', '16:46:32', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(420, NULL, NULL, '2017-06-03', '16:46:32', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(421, NULL, NULL, '2017-06-03', '16:47:55', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(422, NULL, NULL, '2017-06-03', '16:47:55', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(423, NULL, NULL, '2017-06-03', '16:51:19', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(424, NULL, NULL, '2017-06-03', '16:51:19', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(425, NULL, NULL, '2017-06-03', '16:51:28', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(426, NULL, NULL, '2017-06-03', '16:51:28', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(427, NULL, NULL, '2017-06-03', '16:51:39', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(428, NULL, NULL, '2017-06-03', '16:51:39', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(429, NULL, NULL, '2017-06-03', '16:57:05', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(430, NULL, NULL, '2017-06-03', '16:57:05', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(431, NULL, NULL, '2017-06-03', '16:57:13', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(432, NULL, NULL, '2017-06-03', '16:57:13', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(433, NULL, NULL, '2017-06-03', '16:57:23', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(434, NULL, NULL, '2017-06-03', '16:57:23', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(435, NULL, NULL, '2017-06-03', '16:57:23', 'Uspješna prijava', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(436, NULL, NULL, '2017-06-03', '17:03:52', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(437, NULL, NULL, '2017-06-03', '17:03:52', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(438, NULL, NULL, '2017-06-03', '17:04:02', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(439, NULL, NULL, '2017-06-03', '17:04:02', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(440, NULL, NULL, '2017-06-03', '17:04:10', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(441, NULL, NULL, '2017-06-03', '17:04:10', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(442, NULL, NULL, '2017-06-03', '17:04:10', 'Uspješna prijava', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(443, NULL, NULL, '2017-06-03', '17:38:33', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(444, NULL, NULL, '2017-06-03', '17:39:11', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(445, NULL, NULL, '2017-06-03', '17:39:11', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(446, NULL, NULL, '2017-06-03', '17:39:11', 'Neuspješna prijava: pogrešna lozinka', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(447, NULL, NULL, '2017-06-03', '17:39:13', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(448, NULL, NULL, '2017-06-03', '17:39:13', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(449, NULL, NULL, '2017-06-03', '17:39:13', 'Neuspješna prijava: pogrešna lozinka', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(450, NULL, NULL, '2017-06-03', '17:39:15', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(451, NULL, NULL, '2017-06-03', '17:39:16', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(452, NULL, NULL, '2017-06-03', '17:39:16', 'Neuspješna prijava: pogrešna lozinka', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(453, NULL, NULL, '2017-06-03', '17:39:19', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(454, NULL, NULL, '2017-06-03', '17:39:19', 'Neuspješna prijava: zaključan', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(455, NULL, NULL, '2017-06-03', '17:41:34', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(456, NULL, NULL, '2017-06-03', '17:41:34', 'Neuspješna prijava: nije aktiviran', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(457, NULL, NULL, '2017-06-03', '17:41:40', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(458, NULL, NULL, '2017-06-03', '17:41:40', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(459, NULL, NULL, '2017-06-03', '17:41:40', 'Neuspješna prijava: pogrešna lozinka', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(460, NULL, NULL, '2017-06-03', '17:41:49', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(461, NULL, NULL, '2017-06-03', '17:41:49', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(462, NULL, NULL, '2017-06-03', '17:41:49', 'Neuspješna prijava: pogrešna lozinka', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(463, NULL, NULL, '2017-06-03', '17:41:52', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(464, NULL, NULL, '2017-06-03', '17:41:52', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(465, NULL, NULL, '2017-06-03', '17:41:52', 'Neuspješna prijava: pogrešna lozinka', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(466, NULL, NULL, '2017-06-03', '17:41:57', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(467, NULL, NULL, '2017-06-03', '17:41:57', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(468, NULL, NULL, '2017-06-03', '17:41:57', 'Neuspješna prijava: pogrešna lozinka', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(469, NULL, NULL, '2017-06-03', '17:42:00', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(470, NULL, NULL, '2017-06-03', '17:42:00', 'Neuspješna prijava: zaključan', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 6, NULL),
(471, NULL, NULL, '2017-06-03', '17:43:01', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(472, NULL, NULL, '2017-06-03', '17:43:01', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(473, NULL, NULL, '2017-06-03', '17:43:01', 'Neuspješna prijava: pogrešna lozinka', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(474, NULL, NULL, '2017-06-03', '17:43:03', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(475, NULL, NULL, '2017-06-03', '17:43:05', 'Neuspješna prijava: zaključan', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(476, NULL, NULL, '2017-06-03', '18:03:29', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(477, NULL, NULL, '2017-06-03', '18:03:29', 'Neuspješna prijava: zaključan', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 25, NULL),
(478, NULL, NULL, '2017-06-03', '18:03:42', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL);
INSERT INTO `log` (`log_id`, `sakupljeni_bodovi`, `potroseni_bodovi`, `datum`, `vrijeme`, `radnja`, `adresa`, `skripta`, `preglednik`, `korisnik_id`, `akcija_id`) VALUES
(479, NULL, NULL, '2017-06-03', '18:03:42', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(480, NULL, NULL, '2017-06-03', '18:04:00', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(481, NULL, NULL, '2017-06-03', '18:04:00', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(482, NULL, NULL, '2017-06-03', '18:04:17', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(483, NULL, NULL, '2017-06-03', '18:04:17', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(484, NULL, NULL, '2017-06-03', '18:04:17', 'Uspješna prijava', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(485, NULL, NULL, '2017-06-03', '18:35:02', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(486, NULL, NULL, '2017-06-03', '18:35:02', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(487, NULL, NULL, '2017-06-03', '18:35:10', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(488, NULL, NULL, '2017-06-03', '18:35:10', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(489, NULL, NULL, '2017-06-03', '18:35:19', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(490, NULL, NULL, '2017-06-03', '18:35:19', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(491, NULL, NULL, '2017-06-03', '18:35:19', 'Uspješna prijava', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(492, NULL, NULL, '2017-06-03', '18:37:30', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(493, NULL, NULL, '2017-06-03', '18:37:30', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(494, NULL, NULL, '2017-06-03', '18:37:30', 'Uspješna prijava', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(495, NULL, NULL, '2017-06-03', '18:40:21', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(496, NULL, NULL, '2017-06-03', '18:40:21', 'Neuspješna prijava: token istekao', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(497, NULL, NULL, '2017-06-03', '20:29:56', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(498, NULL, NULL, '2017-06-03', '20:29:56', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(499, NULL, NULL, '2017-06-03', '20:30:07', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(500, NULL, NULL, '2017-06-03', '20:30:07', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(501, NULL, NULL, '2017-06-03', '20:30:07', 'Uspješna prijava', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(502, NULL, NULL, '2017-06-03', '20:48:00', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(503, NULL, NULL, '2017-06-03', '20:48:00', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(504, NULL, NULL, '2017-06-03', '20:48:10', 'SELECT', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(505, NULL, NULL, '2017-06-03', '20:48:10', 'UPDATE', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(506, NULL, NULL, '2017-06-03', '20:48:10', 'Uspješna prijava', '93.142.255.127', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(507, NULL, NULL, '2017-06-03', '22:42:12', 'UPDATE', '93.142.255.127', '', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(508, NULL, NULL, '2017-06-03', '22:43:54', 'UPDATE', '93.142.255.127', 'virtualno_vrijeme.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(509, NULL, NULL, '2017-06-04', '15:05:48', 'SELECT', '93.139.147.20', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(510, NULL, NULL, '2017-06-04', '15:05:48', 'Neuspješna prijava: token istekao', '93.139.147.20', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(511, NULL, NULL, '2017-06-04', '15:06:27', 'SELECT', '93.139.147.20', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(512, NULL, NULL, '2017-06-04', '15:06:27', 'UPDATE', '93.139.147.20', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(513, NULL, NULL, '2017-06-04', '15:06:39', 'SELECT', '93.139.147.20', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(514, NULL, NULL, '2017-06-04', '15:06:39', 'UPDATE', '93.139.147.20', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(515, NULL, NULL, '2017-06-04', '15:06:39', 'Uspješna prijava', '93.139.147.20', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(516, NULL, NULL, '2017-06-04', '15:07:07', 'SELECT', '93.139.147.20', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(517, NULL, NULL, '2017-06-04', '15:07:21', 'SELECT', '93.139.147.20', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(518, NULL, NULL, '2017-06-04', '15:15:19', 'SELECT', '93.139.147.20', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(519, NULL, NULL, '2017-06-04', '15:15:21', 'SELECT', '93.139.147.20', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(520, NULL, NULL, '2017-06-04', '15:41:41', 'SELECT', '93.139.147.20', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(521, NULL, NULL, '2017-06-04', '15:42:00', 'SELECT', '93.139.147.20', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(522, NULL, NULL, '2017-06-04', '15:42:50', 'SELECT', '93.139.147.20', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(523, NULL, NULL, '2017-06-04', '15:43:34', 'SELECT', '93.139.147.20', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(524, NULL, NULL, '2017-06-04', '15:46:27', 'SELECT', '93.139.147.20', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(525, NULL, NULL, '2017-06-04', '15:47:05', 'SELECT', '93.139.147.20', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(526, NULL, NULL, '2017-06-05', '17:43:07', 'SELECT', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(527, NULL, NULL, '2017-06-05', '17:43:07', 'Neuspješna prijava: token istekao', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(528, NULL, NULL, '2017-06-05', '17:43:13', 'SELECT', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(529, NULL, NULL, '2017-06-05', '17:43:13', 'UPDATE', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(530, NULL, NULL, '2017-06-05', '17:43:23', 'SELECT', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(531, NULL, NULL, '2017-06-05', '17:43:23', 'UPDATE', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(532, NULL, NULL, '2017-06-05', '17:43:23', 'Uspješna prijava', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(533, NULL, NULL, '2017-06-05', '17:43:27', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(534, NULL, NULL, '2017-06-05', '17:43:33', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(535, NULL, NULL, '2017-06-05', '17:46:21', 'SELECT', '93.142.210.181', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(536, NULL, NULL, '2017-06-05', '17:51:10', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(537, NULL, NULL, '2017-06-05', '17:56:06', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(538, NULL, NULL, '2017-06-05', '17:56:21', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(539, NULL, NULL, '2017-06-05', '18:02:58', 'SELECT', '93.142.210.181', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(540, NULL, NULL, '2017-06-05', '18:03:19', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(541, NULL, NULL, '2017-06-05', '18:03:37', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(542, NULL, NULL, '2017-06-05', '18:03:48', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(543, NULL, NULL, '2017-06-05', '18:03:59', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(544, NULL, NULL, '2017-06-05', '18:04:03', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(545, NULL, NULL, '2017-06-05', '18:04:58', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(546, NULL, NULL, '2017-06-05', '18:05:01', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(547, NULL, NULL, '2017-06-05', '18:05:11', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(548, NULL, NULL, '2017-06-05', '18:05:14', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(549, NULL, NULL, '2017-06-05', '18:06:20', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(550, NULL, NULL, '2017-06-05', '18:06:26', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(551, NULL, NULL, '2017-06-05', '18:08:44', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(552, NULL, NULL, '2017-06-05', '18:08:51', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(553, NULL, NULL, '2017-06-05', '18:09:28', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(554, NULL, NULL, '2017-06-05', '18:09:34', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(555, NULL, NULL, '2017-06-05', '18:09:51', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(556, NULL, NULL, '2017-06-05', '18:09:59', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(557, NULL, NULL, '2017-06-05', '18:10:07', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(558, NULL, NULL, '2017-06-05', '18:10:56', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(559, NULL, NULL, '2017-06-05', '21:27:14', 'SELECT', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(560, NULL, NULL, '2017-06-05', '21:27:14', 'Neuspješna prijava: token istekao', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(561, NULL, NULL, '2017-06-05', '21:27:58', 'SELECT', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(562, NULL, NULL, '2017-06-05', '21:27:58', 'Neuspješna prijava: token istekao', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(563, NULL, NULL, '2017-06-05', '21:28:19', 'SELECT', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(564, NULL, NULL, '2017-06-05', '21:28:19', 'UPDATE', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(565, NULL, NULL, '2017-06-05', '21:28:45', 'SELECT', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(566, NULL, NULL, '2017-06-05', '21:28:45', 'UPDATE', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(567, NULL, NULL, '2017-06-05', '21:28:45', 'Uspješna prijava', '10.85.11.10', 'prijava.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(568, NULL, NULL, '2017-06-05', '21:28:59', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(569, NULL, NULL, '2017-06-05', '21:29:03', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(570, NULL, NULL, '2017-06-05', '21:29:15', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(571, NULL, NULL, '2017-06-05', '21:29:22', 'SELECT', '10.85.11.10', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(572, NULL, NULL, '2017-06-05', '21:29:39', 'SELECT', '10.85.11.10', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(573, NULL, NULL, '2017-06-05', '21:29:43', 'SELECT', '10.85.11.10', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(574, NULL, NULL, '2017-06-05', '21:30:24', 'SELECT', '10.85.11.10', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(575, NULL, NULL, '2017-06-05', '21:30:42', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(576, NULL, NULL, '2017-06-05', '21:30:46', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(577, NULL, NULL, '2017-06-05', '21:30:49', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(578, NULL, NULL, '2017-06-05', '21:30:49', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(579, NULL, NULL, '2017-06-05', '21:30:56', 'UPDATE', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(580, NULL, NULL, '2017-06-05', '21:30:56', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(581, NULL, NULL, '2017-06-05', '21:31:02', 'SELECT', '10.85.11.10', 'konfiguracija.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(582, NULL, NULL, '2017-06-05', '21:31:04', 'SELECT', '10.85.11.10', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(583, NULL, NULL, '2017-06-05', '21:31:16', 'SELECT', '10.85.11.10', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(584, NULL, NULL, '2017-06-05', '21:31:24', 'SELECT', '10.85.11.10', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Linux; Android 7.0; SM-G920F Build/NRD90M; wv) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/58.0.3029.83 Mobile Safari/537.36 [FB_IAB/MESSENGER;FBAV/119.0.0.18.91;]', 5, NULL),
(585, NULL, NULL, '2017-06-05', '21:35:04', 'SELECT', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(586, NULL, NULL, '2017-06-05', '21:35:04', 'Neuspješna prijava: token istekao', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(587, NULL, NULL, '2017-06-05', '21:35:29', 'SELECT', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(588, NULL, NULL, '2017-06-05', '21:35:29', 'UPDATE', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(589, NULL, NULL, '2017-06-05', '21:35:29', 'Neuspješna prijava: pogrešna lozinka', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(590, NULL, NULL, '2017-06-05', '21:35:36', 'SELECT', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(591, NULL, NULL, '2017-06-05', '21:35:36', 'UPDATE', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(592, NULL, NULL, '2017-06-05', '21:35:45', 'SELECT', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(593, NULL, NULL, '2017-06-05', '21:35:45', 'UPDATE', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(594, NULL, NULL, '2017-06-05', '21:35:45', 'Uspješna prijava', '93.142.210.181', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(595, NULL, NULL, '2017-06-05', '21:35:50', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(596, NULL, NULL, '2017-06-05', '21:35:52', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=ime&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(597, NULL, NULL, '2017-06-05', '21:36:01', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=prezime&vrsta=des', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(598, NULL, NULL, '2017-06-05', '21:36:03', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=korIme&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(599, NULL, NULL, '2017-06-05', '21:36:04', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=email&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(600, NULL, NULL, '2017-06-05', '21:36:05', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=a', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(601, NULL, NULL, '2017-06-05', '21:36:13', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=d', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(602, NULL, NULL, '2017-06-05', '21:36:18', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=korIme&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(603, NULL, NULL, '2017-06-05', '21:36:19', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=korIme&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(604, NULL, NULL, '2017-06-05', '21:36:26', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=korIme&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(605, NULL, NULL, '2017-06-05', '21:36:28', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=korIme&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(606, NULL, NULL, '2017-06-05', '21:37:21', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=korIme&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(607, NULL, NULL, '2017-06-05', '21:37:23', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=korIme&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(608, NULL, NULL, '2017-06-05', '21:37:25', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=korIme&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(609, NULL, NULL, '2017-06-05', '21:37:30', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=a', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(610, NULL, NULL, '2017-06-05', '21:40:14', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=a', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(611, NULL, NULL, '2017-06-05', '21:40:31', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=a', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(612, NULL, NULL, '2017-06-05', '21:40:32', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(613, NULL, NULL, '2017-06-05', '21:40:58', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(614, NULL, NULL, '2017-06-05', '21:41:01', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(615, NULL, NULL, '2017-06-05', '21:41:05', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=a', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(616, NULL, NULL, '2017-06-05', '21:41:07', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=d', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(617, NULL, NULL, '2017-06-05', '21:41:09', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=a', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(618, NULL, NULL, '2017-06-05', '21:41:11', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(619, NULL, NULL, '2017-06-05', '21:50:09', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(620, NULL, NULL, '2017-06-05', '21:54:19', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(621, NULL, NULL, '2017-06-05', '21:59:40', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(622, NULL, NULL, '2017-06-05', '21:59:51', 'UPDATE', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(623, NULL, NULL, '2017-06-05', '21:59:51', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(624, NULL, NULL, '2017-06-05', '22:19:18', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(625, NULL, NULL, '2017-06-05', '22:20:20', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(626, NULL, NULL, '2017-06-05', '22:20:37', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(627, NULL, NULL, '2017-06-05', '22:20:53', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(628, NULL, NULL, '2017-06-05', '22:21:20', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(629, NULL, NULL, '2017-06-05', '22:43:08', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(630, NULL, NULL, '2017-06-05', '22:43:16', 'UPDATE', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(631, NULL, NULL, '2017-06-05', '22:43:16', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(632, NULL, NULL, '2017-06-05', '22:43:27', 'UPDATE', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(633, NULL, NULL, '2017-06-05', '22:43:27', 'SELECT', '93.142.210.181', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(634, NULL, NULL, '2017-06-05', '23:11:04', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(635, NULL, NULL, '2017-06-05', '23:11:04', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(636, NULL, NULL, '2017-06-05', '23:11:13', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(637, NULL, NULL, '2017-06-05', '23:11:13', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(638, NULL, NULL, '2017-06-05', '23:11:13', 'Uspješna prijava', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(639, NULL, NULL, '2017-06-05', '23:11:16', 'SELECT', '93.139.147.149', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(640, NULL, NULL, '2017-06-05', '23:11:18', 'SELECT', '93.139.147.149', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(641, NULL, NULL, '2017-06-06', '00:11:29', 'UPDATE', '93.139.147.149', 'virtualno_vrijeme.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(642, NULL, NULL, '2017-06-05', '20:11:46', 'UPDATE', '93.139.147.149', 'virtualno_vrijeme.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(643, NULL, NULL, '2017-06-05', '20:13:52', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(644, NULL, NULL, '2017-06-05', '20:15:34', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php?sort=ime&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(645, NULL, NULL, '2017-06-05', '20:15:37', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php?sort=ime&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(646, NULL, NULL, '2017-06-05', '20:15:41', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=a', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(647, NULL, NULL, '2017-06-05', '20:23:48', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php?sort=brPrijava&vrsta=a', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(648, NULL, NULL, '2017-06-05', '20:24:25', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(649, NULL, NULL, '2017-06-05', '20:24:38', 'SELECT', '93.139.147.149', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(650, NULL, NULL, '2017-06-05', '20:24:38', 'SELECT', '93.139.147.149', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(651, NULL, NULL, '2017-06-05', '20:24:42', 'SELECT', '93.139.147.149', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(652, NULL, NULL, '2017-06-05', '20:24:44', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(653, NULL, NULL, '2017-06-05', '20:24:51', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(654, NULL, NULL, '2017-06-05', '20:58:16', 'SELECT', '93.139.147.149', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(655, NULL, NULL, '2017-06-05', '21:27:18', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(656, NULL, NULL, '2017-06-05', '21:27:55', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(657, NULL, NULL, '2017-06-05', '21:29:22', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=ime&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(658, NULL, NULL, '2017-06-05', '21:29:25', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=ime&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(659, NULL, NULL, '2017-06-05', '21:30:18', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=ime&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(660, NULL, NULL, '2017-06-05', '21:35:14', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=ime&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(661, NULL, NULL, '2017-06-05', '21:35:27', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(662, NULL, NULL, '2017-06-05', '21:35:32', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(663, NULL, NULL, '2017-06-05', '21:35:35', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(664, NULL, NULL, '2017-06-05', '21:35:38', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=vrijeme&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(665, NULL, NULL, '2017-06-05', '21:35:40', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=vrijeme&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(666, NULL, NULL, '2017-06-05', '21:35:43', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=radnja&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(667, NULL, NULL, '2017-06-05', '21:35:45', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=radnja&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(668, NULL, NULL, '2017-06-05', '21:35:49', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=adresa&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(669, NULL, NULL, '2017-06-05', '21:35:54', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=radnja&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(670, NULL, NULL, '2017-06-05', '21:35:56', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=skripta&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(671, NULL, NULL, '2017-06-05', '21:35:59', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=skripta&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(672, NULL, NULL, '2017-06-05', '21:36:02', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=preglednik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(673, NULL, NULL, '2017-06-05', '21:36:04', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=preglednik&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(674, NULL, NULL, '2017-06-05', '21:36:07', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(675, NULL, NULL, '2017-06-05', '21:36:11', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=preglednik&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(676, NULL, NULL, '2017-06-05', '21:40:14', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=preglednik&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(677, NULL, NULL, '2017-06-05', '21:43:07', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=preglednik&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(678, NULL, NULL, '2017-06-05', '21:43:39', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(679, NULL, NULL, '2017-06-05', '21:43:46', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(680, NULL, NULL, '2017-06-05', '21:44:14', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(681, NULL, NULL, '2017-06-05', '21:44:54', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=skBodovi&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(682, NULL, NULL, '2017-06-05', '21:44:56', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=poBodovi&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(683, NULL, NULL, '2017-06-05', '21:44:58', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(684, NULL, NULL, '2017-06-05', '21:44:59', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(685, NULL, NULL, '2017-06-05', '21:45:00', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=vrijeme&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(686, NULL, NULL, '2017-06-05', '21:45:01', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=vrijeme&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(687, NULL, NULL, '2017-06-05', '21:45:02', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=radnja&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(688, NULL, NULL, '2017-06-05', '21:45:03', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=radnja&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(689, NULL, NULL, '2017-06-05', '21:45:04', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=adresa&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(690, NULL, NULL, '2017-06-05', '21:45:05', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=adresa&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL);
INSERT INTO `log` (`log_id`, `sakupljeni_bodovi`, `potroseni_bodovi`, `datum`, `vrijeme`, `radnja`, `adresa`, `skripta`, `preglednik`, `korisnik_id`, `akcija_id`) VALUES
(691, NULL, NULL, '2017-06-05', '21:45:05', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=skripta&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(692, NULL, NULL, '2017-06-05', '21:45:06', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=skripta&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(693, NULL, NULL, '2017-06-05', '21:45:07', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=preglednik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(694, NULL, NULL, '2017-06-05', '21:45:08', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=preglednik&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(695, NULL, NULL, '2017-06-05', '21:45:09', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(696, NULL, NULL, '2017-06-05', '21:45:12', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(697, NULL, NULL, '2017-06-05', '21:45:13', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=akcija&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(698, NULL, NULL, '2017-06-05', '21:45:16', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=akcija&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(699, NULL, NULL, '2017-06-05', '21:45:18', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(700, NULL, NULL, '2017-06-05', '21:46:07', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(701, NULL, NULL, '2017-06-05', '21:46:10', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=akcija&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(702, NULL, NULL, '2017-06-05', '21:46:11', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=akcija&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(703, NULL, NULL, '2017-06-05', '21:46:13', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(704, NULL, NULL, '2017-06-05', '21:46:15', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(705, NULL, NULL, '2017-06-05', '21:46:17', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(706, NULL, NULL, '2017-06-05', '21:46:34', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(707, NULL, NULL, '2017-06-05', '21:47:34', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(708, NULL, NULL, '2017-06-05', '21:47:41', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=korisnik&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(709, NULL, NULL, '2017-06-05', '21:47:51', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=skripta&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(710, NULL, NULL, '2017-06-05', '21:47:53', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=skripta&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(711, NULL, NULL, '2017-06-05', '21:47:58', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(712, NULL, NULL, '2017-06-05', '21:48:00', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=desc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(713, NULL, NULL, '2017-06-05', '21:48:03', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(714, NULL, NULL, '2017-06-05', '21:51:18', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(715, NULL, NULL, '2017-06-05', '21:52:15', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(716, NULL, NULL, '2017-06-05', '21:54:58', 'SELECT', '93.139.147.149', 'dnevnik.php?sort=datum&vrsta=asc', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(717, NULL, NULL, '2017-06-05', '21:59:28', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(730, NULL, NULL, '2017-06-05', '23:49:18', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(731, NULL, NULL, '2017-06-05', '23:49:18', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(732, NULL, NULL, '2017-06-05', '23:49:28', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(733, NULL, NULL, '2017-06-05', '23:49:28', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(734, NULL, NULL, '2017-06-05', '23:49:28', 'Uspješna prijava', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(735, NULL, NULL, '2017-06-05', '23:49:31', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(736, NULL, NULL, '2017-06-05', '23:52:34', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(737, NULL, NULL, '2017-06-05', '23:52:54', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(738, NULL, NULL, '2017-06-05', '23:53:55', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(739, NULL, NULL, '2017-06-06', '00:06:56', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(740, NULL, NULL, '2017-06-06', '00:08:52', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(741, NULL, NULL, '2017-06-06', '00:10:18', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(742, NULL, NULL, '2017-06-06', '00:11:35', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(743, NULL, NULL, '2017-06-06', '00:12:57', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(774, NULL, NULL, '2017-06-06', '14:05:16', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(775, NULL, NULL, '2017-06-06', '14:05:17', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(776, NULL, NULL, '2017-06-06', '14:05:29', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(777, NULL, NULL, '2017-06-06', '14:05:29', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(778, NULL, NULL, '2017-06-06', '14:05:29', 'Uspješna prijava', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(779, NULL, NULL, '2017-06-06', '14:07:00', 'SELECT', '93.139.147.149', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(780, NULL, NULL, '2017-06-06', '14:07:06', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(781, NULL, NULL, '2017-06-06', '14:52:06', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(782, NULL, NULL, '2017-06-06', '14:52:06', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(783, NULL, NULL, '2017-06-06', '14:52:20', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(784, NULL, NULL, '2017-06-06', '14:52:20', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(785, NULL, NULL, '2017-06-06', '14:52:20', 'Uspješna prijava', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(786, NULL, NULL, '2017-06-06', '16:42:03', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(787, NULL, NULL, '2017-06-06', '16:42:03', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(788, NULL, NULL, '2017-06-06', '16:42:12', 'SELECT', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(789, NULL, NULL, '2017-06-06', '16:42:12', 'UPDATE', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(790, NULL, NULL, '2017-06-06', '16:42:12', 'Uspješna prijava', '93.139.147.149', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(791, NULL, NULL, '2017-06-06', '16:42:52', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(792, NULL, NULL, '2017-06-06', '16:42:52', 'SELECT', '93.139.147.149', 'dnevnik.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(793, NULL, NULL, '2017-06-06', '16:43:11', 'SELECT', '93.139.147.149', 'otkljucavanje_korisnika.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(794, NULL, NULL, '2017-06-06', '20:49:00', 'SELECT', '93.142.234.100', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(795, NULL, NULL, '2017-06-06', '20:49:03', 'UPDATE', '93.142.234.100', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(796, NULL, NULL, '2017-06-06', '20:49:12', 'SELECT', '93.142.234.100', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(797, NULL, NULL, '2017-06-06', '20:49:12', 'UPDATE', '93.142.234.100', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(798, NULL, NULL, '2017-06-06', '20:49:12', 'Uspješna prijava', '93.142.234.100', 'prijava.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(799, NULL, NULL, '2017-06-06', '20:49:33', 'SELECT', '93.142.234.100', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(800, NULL, NULL, '2017-06-06', '20:49:42', 'SELECT', '93.142.234.100', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(801, NULL, NULL, '2017-06-06', '20:49:43', 'SELECT', '93.142.234.100', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(802, NULL, NULL, '2017-06-06', '20:49:43', 'SELECT', '93.142.234.100', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(803, NULL, NULL, '2017-06-06', '20:49:52', 'SELECT', '93.142.234.100', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(804, NULL, NULL, '2017-06-06', '20:49:55', 'SELECT', '93.142.234.100', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL),
(805, NULL, NULL, '2017-06-06', '20:50:10', 'SELECT', '93.142.234.100', 'konfiguracija.php', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3053.4 Safari/537.36', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `materijal`
--

CREATE TABLE IF NOT EXISTS `materijal` (
  `materijal_id` int(11) NOT NULL AUTO_INCREMENT,
  `dokument_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `webinar_id` int(11) NOT NULL,
  PRIMARY KEY (`materijal_id`),
  KEY `fk_materijal_dokument1_idx` (`dokument_id`),
  KEY `fk_materijal_video1_idx` (`video_id`),
  KEY `fk_materijal_webinar1_idx` (`webinar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `moderira`
--

CREATE TABLE IF NOT EXISTS `moderira` (
  `moderira_id` int(11) NOT NULL AUTO_INCREMENT,
  `korisnik_id` int(11) NOT NULL,
  `kategorija_id` int(11) NOT NULL,
  PRIMARY KEY (`moderira_id`),
  KEY `fk_moderira_korisnik1_idx` (`korisnik_id`),
  KEY `fk_moderira_kategorija1_idx` (`kategorija_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ocjenjuje`
--

CREATE TABLE IF NOT EXISTS `ocjenjuje` (
  `korisnik_id` int(11) NOT NULL,
  `webinar_id` int(11) NOT NULL,
  `ocjena` int(11) NOT NULL,
  PRIMARY KEY (`webinar_id`,`korisnik_id`),
  KEY `fk_ocjenjuje_webinar1_idx` (`webinar_id`),
  KEY `fk_ocjenjuje_korisnik1` (`korisnik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posjeduje`
--

CREATE TABLE IF NOT EXISTS `posjeduje` (
  `posjeduje_id` int(11) NOT NULL AUTO_INCREMENT,
  `korisnik_id` int(11) NOT NULL,
  `kupon_id` int(11) NOT NULL,
  PRIMARY KEY (`posjeduje_id`),
  KEY `fk_korisnik_has_kupon_kupon1_idx` (`kupon_id`),
  KEY `fk_korisnik_has_kupon_korisnik1_idx` (`korisnik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pristupa`
--

CREATE TABLE IF NOT EXISTS `pristupa` (
  `korisnik_id` int(11) NOT NULL,
  `webinar_id` int(11) NOT NULL,
  `pristup` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`webinar_id`,`korisnik_id`),
  KEY `fk_korisnik_has_webinar_webinar1_idx` (`webinar_id`),
  KEY `fk_korisnik_has_webinar_korisnik1_idx` (`korisnik_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `proizvod`
--

CREATE TABLE IF NOT EXISTS `proizvod` (
  `proizvod_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `opis` varchar(200) NOT NULL,
  `datum` date NOT NULL,
  `vrijeme` time NOT NULL,
  `kolicina` int(11) NOT NULL,
  `tezina` int(11) NOT NULL,
  `kategorija` varchar(100) NOT NULL,
  PRIMARY KEY (`proizvod_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=66 ;

--
-- Dumping data for table `proizvod`
--

INSERT INTO `proizvod` (`proizvod_id`, `naziv`, `opis`, `datum`, `vrijeme`, `kolicina`, `tezina`, `kategorija`) VALUES
(48, 'Cokolada', 'asd', '2012-12-30', '15:26:00', 22, 48, 'Tehnika;'),
(49, 'Cokolada', 'asd', '2012-12-30', '12:21:00', 22, 30, 'Tehnika;'),
(50, 'Cokolada', 'asd', '2012-12-30', '12:21:00', 22, 30, 'Tehnika;'),
(51, 'Kiviii', 'asdsa', '2016-12-30', '12:21:00', 22, 40, 'Tehnika;Hrana;Piće;'),
(52, 'Haljina', 'Lijepa.', '2016-10-05', '15:44:00', 12, 6, 'Tehnika;'),
(53, 'Bananaaaaa', 'opis', '2012-12-20', '12:12:00', 12, 16, 'Tehnika;'),
(54, 'Kuciste', 'bla', '2014-12-20', '12:34:00', 22, 22, 'Tehnika;'),
(55, 'Palacinka', 'palapesen', '2017-01-30', '15:45:00', 34, 13, 'Hrana;'),
(56, 'Cokoladica', 'cok', '2017-05-05', '12:23:00', 2, 9, 'Tehnika;Hrana;'),
(57, 'WebDiP', 'W', '2017-05-11', '10:00:00', 1, 9, 'Tehnika;'),
(58, 'Krumpir', 'asd', '2012-12-30', '15:45:00', 5, 21, 'Tehnika;'),
(59, 'Nestoo', 'asd', '2017-05-15', '13:54:00', 6, 9, 'Tehnika;'),
(60, 'Kupica', 'asd', '2012-12-30', '12:21:00', 12, 33, 'Tehnika;Hrana;'),
(61, 'Nazivas', 'asd', '2012-12-30', '12:21:00', 2, 0, 'Tehnika;'),
(62, 'Nazivasdsa', 'asd', '2012-12-30', '12:21:00', 2, 29, 'Tehnika;'),
(63, 'Ananas', 'Anaaa', '2016-04-26', '17:26:00', 14, 13, 'Hrana;Piće;'),
(64, 'Bananko banana', 'BamBan', '2017-01-30', '15:45:00', 456, 28, 'Hrana;Piće;'),
(65, 'Palacinka', 'palapesen', '2017-01-30', '15:45:00', 34, 13, 'Hrana;');

-- --------------------------------------------------------

--
-- Table structure for table `radi`
--

CREATE TABLE IF NOT EXISTS `radi` (
  `radi_id` int(11) NOT NULL AUTO_INCREMENT,
  `korisnik_id` int(11) NOT NULL,
  `akcija_id` int(11) NOT NULL,
  PRIMARY KEY (`radi_id`),
  KEY `fk_radi_korisnik1_idx` (`korisnik_id`),
  KEY `fk_radi_akcija1_idx` (`akcija_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tip_korisnika`
--

CREATE TABLE IF NOT EXISTS `tip_korisnika` (
  `tip_korisnika_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  PRIMARY KEY (`tip_korisnika_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tip_korisnika`
--

INSERT INTO `tip_korisnika` (`tip_korisnika_id`, `naziv`) VALUES
(1, 'Registrirani korisnik'),
(2, 'Moderator'),
(3, 'Administrator');

-- --------------------------------------------------------

--
-- Table structure for table `video`
--

CREATE TABLE IF NOT EXISTS `video` (
  `video_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(45) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`video_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `webinar`
--

CREATE TABLE IF NOT EXISTS `webinar` (
  `webinar_id` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(100) NOT NULL,
  `datum_od` date NOT NULL,
  `datum_do` date NOT NULL,
  `max_broj_korisnika` int(11) NOT NULL,
  `trenutni_broj_korisnika` int(11) DEFAULT NULL,
  `prosjecna_ocjena` float DEFAULT NULL,
  PRIMARY KEY (`webinar_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bira`
--
ALTER TABLE `bira`
  ADD CONSTRAINT `fk_kosarica_kupon1` FOREIGN KEY (`kupon_id`) REFERENCES `kupon` (`kupon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kosarica_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bira_kategorija1` FOREIGN KEY (`kategorija_id`) REFERENCES `kategorija` (`kategorija_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ima`
--
ALTER TABLE `ima`
  ADD CONSTRAINT `fk_kategorija_webinara_has_webinar_kategorija_webinara1` FOREIGN KEY (`kategorija_id`) REFERENCES `kategorija` (`kategorija_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_kategorija_webinara_has_webinar_webinar1` FOREIGN KEY (`webinar_id`) REFERENCES `webinar` (`webinar_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `kategorija`
--
ALTER TABLE `kategorija`
  ADD CONSTRAINT `fk_kategorija_izgled_stranice1` FOREIGN KEY (`izgled_stranice_id`) REFERENCES `izgled_stranice` (`izgled_stranice_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `konfiguracija`
--
ALTER TABLE `konfiguracija`
  ADD CONSTRAINT `fk_konfiguracija_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `fk_korisnik_tip_korisnika1` FOREIGN KEY (`tip_korisnika_id`) REFERENCES `tip_korisnika` (`tip_korisnika_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `fk_log_akcija1` FOREIGN KEY (`akcija_id`) REFERENCES `akcija` (`akcija_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_log_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `materijal`
--
ALTER TABLE `materijal`
  ADD CONSTRAINT `fk_materijal_dokument1` FOREIGN KEY (`dokument_id`) REFERENCES `dokument` (`dokument_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materijal_video1` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_materijal_webinar1` FOREIGN KEY (`webinar_id`) REFERENCES `webinar` (`webinar_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `moderira`
--
ALTER TABLE `moderira`
  ADD CONSTRAINT `fk_moderira_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_moderira_kategorija1` FOREIGN KEY (`kategorija_id`) REFERENCES `kategorija` (`kategorija_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `ocjenjuje`
--
ALTER TABLE `ocjenjuje`
  ADD CONSTRAINT `fk_ocjenjuje_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ocjenjuje_webinar1` FOREIGN KEY (`webinar_id`) REFERENCES `webinar` (`webinar_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `posjeduje`
--
ALTER TABLE `posjeduje`
  ADD CONSTRAINT `fk_korisnik_has_kupon_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_korisnik_has_kupon_kupon1` FOREIGN KEY (`kupon_id`) REFERENCES `kupon` (`kupon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pristupa`
--
ALTER TABLE `pristupa`
  ADD CONSTRAINT `fk_korisnik_has_webinar_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_korisnik_has_webinar_webinar1` FOREIGN KEY (`webinar_id`) REFERENCES `webinar` (`webinar_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `radi`
--
ALTER TABLE `radi`
  ADD CONSTRAINT `fk_radi_korisnik1` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`korisnik_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_radi_akcija1` FOREIGN KEY (`akcija_id`) REFERENCES `akcija` (`akcija_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
