-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 15, 2017 at 08:06 AM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `code`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `id` int(8) NOT NULL,
  `address_line_1` varchar(200) NOT NULL,
  `address_line_2` varchar(200) NOT NULL,
  `county` varchar(100) NOT NULL,
  `postcode` varchar(15) NOT NULL,
  `city` varchar(100) NOT NULL,
  `type_id` int(8) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `address_line_1`, `address_line_2`, `county`, `postcode`, `city`, `type_id`, `user_id`) VALUES
(1, 'line 1', 'line 2', 'some region', 'w12 a12', 'some city', 1, 187),
(2, 'line 1', 'line 2', 'some region', 'w12 a12', 'some city', 1, 187),
(3, 'address line 1', 'address line 2', 'county', '570009', 'city', 1, 200),
(4, '7 hills, #18 , 6th main, 3rd cross', 'Saraswatipuram', 'Karnataka', '570009', 'Mysore', 1, 201),
(5, '7 hills, #18 , 6th main, 3rd cross', 'Saraswatipuram', 'Karnataka', '570009', 'Mysore', 1, 202),
(6, '7 hills, #18 , 6th main, 3rd cross', 'Saraswatipuram', 'Karnataka', '570009', 'Mysore', 1, 203),
(7, '7 hills, #18 , 6th main, 3rd cross', 'Saraswatipuram', 'Karnataka', '570009', 'Mysore', 1, 204),
(8, '7 hills, #18 , 6th main, 3rd cross', 'Saraswatipuram', 'Karnataka', '570009', 'Mysore', 1, 205),
(9, 'address line 1', 'addressline 2', 'County', 'N4 G78', 'Hunsur', 1, 206),
(10, '7 burrow close', 'hello', 'herts', 'wd17 4ds', 'watford', 1, 207);

-- --------------------------------------------------------

--
-- Table structure for table `address_proof`
--

CREATE TABLE IF NOT EXISTS `address_proof` (
  `id` int(8) NOT NULL,
  `user_id` int(9) NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `address_type`
--

CREATE TABLE IF NOT EXISTS `address_type` (
  `id` int(8) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address_type`
--

INSERT INTO `address_type` (`id`, `name`) VALUES
(1, 'Home'),
(2, 'Office\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `card`
--

CREATE TABLE IF NOT EXISTS `card` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `card_number` varchar(20) NOT NULL,
  `month` int(2) NOT NULL,
  `year` int(4) NOT NULL,
  `country` varchar(100) NOT NULL,
  `card_name` varchar(50) NOT NULL,
  `user_id` int(3) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `card`
--

INSERT INTO `card` (`id`, `name`, `card_number`, `month`, `year`, `country`, `card_name`, `user_id`) VALUES
(10, 'Ahmed Viquas', '378282246310005', 12, 2034, 'India', 'Card 2', 187),
(11, 'Ahmed Viquas', '4012888888881881', 12, 2032, 'India', 'Card 1', 187),
(12, 'Ahmed Viquas', '378734493671000', 12, 2032, 'County', 'Card 1', 206),
(13, 'Ahmed Viquas', '6331101999990016', 12, 2032, 'India', 'Card 2', 206),
(14, 'x', '378282246310005', 9, 2020, 'uk', 'Card 1', 207),
(15, 'c', '38520000023237', 4, 2019, 'uk', 'Card 2', 207);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `make_id` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `model` varchar(50) NOT NULL,
  `car_category_id` int(8) NOT NULL,
  `information` varchar(300) NOT NULL,
  `transmission_id` int(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `make_id`, `year`, `model`, `car_category_id`, `information`, `transmission_id`) VALUES
(1, 'Bentley Bentayga W12', 2, 2015, '', 3, '', 1),
(2, 'Bentley Flying spur V8', 2, 2015, 'mulliner pack', 1, '', 1),
(7, 'Bentley flying spur V8s', 2, 2015, '', 1, '', 1),
(8, 'BMW 730d', 3, 2015, 'Long', 1, '', 1),
(9, 'Ferrari California T', 9, 2016, '', 4, '', 1),
(10, 'Fiat 500 Abarth', 10, 2015, '', 2, '', 1),
(11, 'Lamborghini Aventador', 4, 2015, 'pirelli edition', 4, '', 1),
(12, 'Lamborghini Hurrcan', 4, 2015, 'pirelli edition', 1, '', 1),
(13, 'Mercedes E220 cdi', 1, 2015, 'coupe', 6, '', 1),
(14, 'Mercedes E220 cdi', 1, 2015, 'saloon', 1, '', 1),
(15, 'Mercedes G63', 1, 2015, '', 1, '', 1),
(16, 'Mercedes S350cdi L', 1, 2015, '', 1, '', 1),
(17, 'Mercedes S400 L', 1, 2015, '', 1, '', 1),
(18, 'Mercedes S500 coupe', 1, 2015, '', 1, '', 1),
(19, 'Mercedes V250 cdi', 1, 2015, 'Extra Long', 1, '', 1),
(20, 'Mini Clubman', 5, 2015, '', 2, '', 1),
(21, 'Porsche Macan 2.0 t', 6, 2015, '', 3, '', 1),
(22, 'Range rover 5.0 ', 8, 2015, 'Long AB', 3, '', 1),
(23, 'Range Rover Sports 5.0', 8, 2015, 'AB', 3, '', 1),
(24, 'Range Rover Sports SVR 5.0', 8, 2015, '', 3, '', 1),
(25, 'Ranger Rover 5.0 L', 8, 2015, 'Long AB', 3, '', 1),
(26, 'Rolls Royce Wraith', 7, 2015, '', 1, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cars_and_type`
--

CREATE TABLE IF NOT EXISTS `cars_and_type` (
  `car_id` int(8) NOT NULL,
  `car_type_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_booking`
--

CREATE TABLE IF NOT EXISTS `car_booking` (
  `id` int(15) NOT NULL,
  `car_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL,
  `from_time` datetime NOT NULL,
  `to_time` datetime NOT NULL,
  `chauffeur` tinyint(1) NOT NULL,
  `pickup_location` varchar(300) NOT NULL,
  `delivery_location` varchar(300) NOT NULL,
  `collection_location` varchar(300) NOT NULL,
  `distance` float NOT NULL,
  `additional_request` varchar(300) NOT NULL,
  `chauffeur_location` varchar(300) NOT NULL,
  `security` int(11) NOT NULL,
  `rent` int(11) NOT NULL,
  `status` int(2) NOT NULL DEFAULT '0',
  `booking_time` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_booking`
--

INSERT INTO `car_booking` (`id`, `car_id`, `user_id`, `from_time`, `to_time`, `chauffeur`, `pickup_location`, `delivery_location`, `collection_location`, `distance`, `additional_request`, `chauffeur_location`, `security`, `rent`, `status`, `booking_time`) VALUES
(1, 1, 187, '2017-04-12 00:00:00', '2017-04-26 07:17:19', 0, '', '', '', 0, '', '', 0, 0, 0, '2017-05-10 13:19:58'),
(2, 1, 187, '2017-04-12 10:10:00', '2017-04-12 11:10:00', 0, '', '', '', 0, '', '', 0, 0, 0, '2017-05-10 13:19:58'),
(4, 1, 187, '0999-09-09 00:12:00', '1212-12-12 00:12:00', 1, '', '', '', 100, 'i need', '', 0, 0, 0, '2017-05-10 13:19:58'),
(5, 1, 206, '2017-05-10 00:00:00', '2017-05-11 00:00:00', 0, '', '', '', 0, '', '', 13, 12, 0, '2017-05-10 13:19:58'),
(6, 1, 187, '2017-05-11 00:00:00', '2017-05-12 00:00:00', 0, '', '', '', 0, '', '', 11, 10, 0, '2017-05-10 13:19:58'),
(7, 2, 187, '2017-05-11 00:00:00', '2017-05-12 00:00:00', 0, '', '', '', 0, '', '', 11, 10, 0, '2017-05-10 13:19:58'),
(8, 7, 207, '2017-05-11 00:00:00', '2017-05-12 00:00:00', 0, '', '7 burrow close, watford, herts, wd17 4ds', '7 burrow close, watford, herts, wd17 4ds', 0, '', '', 14, 14, 0, '2017-05-10 13:19:58'),
(9, 13, 187, '2017-05-12 00:00:00', '2017-05-13 00:00:00', 0, '', '', '', 0, '', '', 11, 10, 0, '2017-05-11 21:03:59'),
(10, 13, 187, '2017-05-24 00:00:00', '2017-05-30 00:00:00', 1, 'Yes', '', '', 0, 'aa', '', 11, 10, 0, '2017-05-12 12:16:15'),
(11, 13, 187, '2017-05-13 00:00:00', '2017-05-14 00:00:00', 1, 'Hello', '', '', 0, 'Hi', '', 11, 10, 0, '2017-05-12 13:29:53'),
(12, 13, 187, '2017-05-16 00:00:00', '2017-05-17 00:00:00', 0, '', '', '', 0, '', '', 11, 10, 0, '2017-05-15 11:13:18'),
(13, 14, 187, '2017-05-16 00:00:00', '2017-05-17 00:00:00', 0, '', '', '', 0, '', '', 11, 10, 0, '2017-05-15 11:14:25'),
(14, 15, 187, '2017-05-16 00:00:00', '2017-05-17 00:00:00', 0, '', '', '', 0, '', '', 11, 10, 0, '2017-05-15 11:18:20'),
(15, 16, 187, '2017-05-16 00:00:00', '2017-05-17 00:00:00', 0, '', '', '', 0, '', '', 11, 10, 0, '2017-05-15 11:18:43'),
(16, 17, 187, '2017-05-16 00:00:00', '2017-05-17 00:00:00', 0, '', '', '', 0, '', '', 11, 10, 0, '2017-05-15 11:20:10');

-- --------------------------------------------------------

--
-- Table structure for table `car_booking_status`
--

CREATE TABLE IF NOT EXISTS `car_booking_status` (
  `id` int(9) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_category`
--

CREATE TABLE IF NOT EXISTS `car_category` (
  `id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_category`
--

INSERT INTO `car_category` (`id`, `name`) VALUES
(1, 'Sedan'),
(2, 'Hatchback'),
(3, 'SUV'),
(4, 'Convertible'),
(5, 'Crossover'),
(6, 'Coupe'),
(7, 'MUV');

-- --------------------------------------------------------

--
-- Table structure for table `car_images`
--

CREATE TABLE IF NOT EXISTS `car_images` (
  `id` int(9) NOT NULL,
  `car_id` int(9) NOT NULL,
  `image_link` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_images`
--

INSERT INTO `car_images` (`id`, `car_id`, `image_link`) VALUES
(9, 1, 'img-20170510-5912e61582183.jpg'),
(10, 1, 'img-20170510-5912e61583125.jpg'),
(11, 1, 'img-20170510-5912e61583a00.jpg'),
(12, 1, 'img-20170510-5912e61584a34.jpg'),
(13, 2, 'img-20170510-5912e68ec436a.jpg'),
(14, 2, 'img-20170510-5912e68ec5e37.jpg'),
(15, 2, 'img-20170510-5912e68ec674f.jpg'),
(16, 2, 'img-20170510-5912e68ec6fd9.jpg'),
(17, 7, 'img-20170510-5912e6a808276.jpg'),
(18, 7, 'img-20170510-5912e6a808e7a.jpg'),
(19, 7, 'img-20170510-5912e6a809674.jpg'),
(20, 7, 'img-20170510-5912e6a809f45.jpg'),
(21, 8, 'img-20170510-5912e6fd377e4.jpg'),
(22, 8, 'img-20170510-5912e6fd39360.jpg'),
(23, 8, 'img-20170510-5912e6fd39cb7.jpg'),
(24, 8, 'img-20170510-5912e6fd3a3b7.jpg'),
(25, 9, 'img-20170510-5912e725b5041.jpg'),
(26, 9, 'img-20170510-5912e725b66c1.jpg'),
(27, 9, 'img-20170510-5912e725b70b4.jpg'),
(28, 9, 'img-20170510-5912e725b7943.jpg'),
(29, 9, 'img-20170510-5912e725b8774.jpg'),
(30, 10, 'img-20170510-5912e783c4f7b.jpg'),
(31, 10, 'img-20170510-5912e783c7547.jpg'),
(32, 10, 'img-20170510-5912e783c806e.jpg'),
(33, 10, 'img-20170510-5912e783c8961.jpg'),
(34, 11, 'img-20170510-5912e83566a34.jpg'),
(35, 11, 'img-20170510-5912e835683e2.jpg'),
(36, 11, 'img-20170510-5912e8356929e.jpg'),
(37, 11, 'img-20170510-5912e83569de6.jpg'),
(38, 12, 'img-20170510-5912e868d9d92.jpg'),
(39, 12, 'img-20170510-5912e868db3ab.jpg'),
(40, 12, 'img-20170510-5912e8c2bcc10.jpg'),
(41, 13, 'img-20170510-5912e8ec9c2da.jpg'),
(42, 13, 'img-20170510-5912e8ec9d13f.jpg'),
(43, 13, 'img-20170510-5912e8ec9e10a.jpg'),
(44, 14, 'img-20170510-5912e91549388.JPG'),
(45, 14, 'img-20170510-5912e9154a202.jpg'),
(46, 14, 'img-20170510-5912e9154ace7.jpg'),
(47, 15, 'img-20170510-5912e94387a88.jpg'),
(48, 15, 'img-20170510-5912e94388d20.jpg'),
(49, 15, 'img-20170510-5912e94389605.jpg'),
(50, 16, 'img-20170510-5912ea6c6c4ea.jpg'),
(51, 16, 'img-20170510-5912ea6c6df16.jpg'),
(52, 16, 'img-20170510-5912ea6c6e78d.jpg'),
(53, 16, 'img-20170510-5912ea6c6f025.jpg'),
(54, 17, 'img-20170510-5912f28433863.jpg'),
(55, 17, 'img-20170510-5912f28b5da2d.jpg'),
(56, 17, 'img-20170510-5912f28b5ebb1.jpg'),
(57, 17, 'img-20170510-5912f28b5ffe2.jpg'),
(58, 18, 'img-20170510-5912f2eb59f80.jpg'),
(59, 18, 'img-20170510-5912f2eb5b2ee.jpg'),
(60, 18, 'img-20170510-5912f2eb5bb3a.jpg'),
(61, 18, 'img-20170510-5912f2eb5c36a.jpg'),
(62, 19, 'img-20170510-5912f31905ecc.jpg'),
(63, 19, 'img-20170510-5912f319075dd.JPG'),
(64, 19, 'img-20170510-5912f31907ef3.jpg'),
(65, 20, 'img-20170510-5912f5c12eabb.jpg'),
(66, 20, 'img-20170510-5912f5c1309b3.jpg'),
(67, 20, 'img-20170510-5912f5c13122a.jpg'),
(68, 22, 'img-20170510-5912f5ec4be57.jpg'),
(69, 22, 'img-20170510-5912f5ec4e4d4.jpg'),
(70, 22, 'img-20170510-5912f5ec4eec5.jpg'),
(71, 22, 'img-20170510-5912f5ec4f80a.jpg'),
(72, 21, 'img-20170510-5912f64782dcb.jpg'),
(73, 21, 'img-20170510-5912f64784118.jpg'),
(74, 23, 'img-20170510-5912f66e5ce75.jpg'),
(75, 23, 'img-20170510-5912f66e5da17.jpg'),
(76, 23, 'img-20170510-5912f66e5e99d.jpg'),
(77, 23, 'img-20170510-5912f66e5f22b.jpg'),
(78, 24, 'img-20170510-5912f6766409c.jpg'),
(79, 24, 'img-20170510-5912f67665a5b.jpg'),
(80, 24, 'img-20170510-5912f6766660d.jpg'),
(81, 24, 'img-20170510-5912f67666b82.jpg'),
(82, 25, 'img-20170510-5912f680f3f31.jpg'),
(83, 25, 'img-20170510-5912f68100b8d.jpg'),
(84, 25, 'img-20170510-5912f681013a9.jpg'),
(85, 25, 'img-20170510-5912f68101c20.jpg'),
(86, 26, 'img-20170510-5912f69e013f4.jpg'),
(87, 26, 'img-20170510-5912f69e02516.jpg'),
(88, 26, 'img-20170510-5912f69e02e3d.jpg'),
(89, 26, 'img-20170510-5912f6a69144f.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `car_insurance`
--

CREATE TABLE IF NOT EXISTS `car_insurance` (
  `car_id` int(8) NOT NULL,
  `insurance_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `car_model`
--

CREATE TABLE IF NOT EXISTS `car_model` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`id`, `name`) VALUES
(1, 'Mercedes'),
(2, 'Bentley'),
(3, 'BMW'),
(4, 'Lamborghini'),
(5, 'Mini'),
(6, 'Porsche'),
(7, 'Rolls Royce'),
(8, 'Range Rover'),
(9, 'Ferrari'),
(10, 'Fiat');

-- --------------------------------------------------------

--
-- Table structure for table `car_specifications`
--

CREATE TABLE IF NOT EXISTS `car_specifications` (
  `id` int(8) NOT NULL,
  `daily_price` float NOT NULL,
  `weekly_price` float NOT NULL,
  `security_deposit` float NOT NULL,
  `car_id` int(8) NOT NULL,
  `location_city` varchar(100) NOT NULL DEFAULT 'London',
  `address` varchar(300) NOT NULL DEFAULT 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK',
  `latitude` float NOT NULL DEFAULT '51.5505',
  `longitude` float NOT NULL DEFAULT '-0.247721',
  `bhp` varchar(30) NOT NULL,
  `acceleration` varchar(30) NOT NULL,
  `speed` varchar(30) NOT NULL,
  `fuel` varchar(30) NOT NULL,
  `seat` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_specifications`
--

INSERT INTO `car_specifications` (`id`, `daily_price`, `weekly_price`, `security_deposit`, `car_id`, `location_city`, `address`, `latitude`, `longitude`, `bhp`, `acceleration`, `speed`, `fuel`, `seat`) VALUES
(1, 120, 800, 5000, 10, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247732, '101', '7', '160', 'Gas', '4'),
(4, 104, 11.9, 10, 1, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UKCygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247732, '600', '3.5', '184', 'Gas', '5'),
(8, 90, 9.9, 90, 2, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247732, '500', '4.2', '183', 'Gas', '5'),
(11, 100, 700, 1000, 7, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247732, '500', '3.8', '185', 'Gas', '5'),
(12, 100, 700, 4500, 8, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '601', '3.4', '190', 'Gas', '5'),
(13, 100, 700, 4500, 9, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '552', '3.3', '196', 'Gas', '2'),
(15, 100, 800, 3000, 11, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '740', '2.7', '217', 'Gas', '2'),
(16, 800, 100, 4000, 12, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '602', '2.1', '201', 'Gas', '2'),
(17, 800, 100, 4000, 13, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '241', '6.5', '154', 'Gas', '5'),
(18, 800, 100, 4000, 14, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '241', '6.5', '154', 'Gas', '5'),
(19, 800, 100, 4000, 15, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '621', '5.1', '140', 'Gas', '5'),
(20, 800, 100, 4000, 16, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '210', '7.8', '162', 'Gas', '5'),
(21, 800, 100, 4000, 17, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '210', '7.1', '168', 'Gas', '5'),
(22, 800, 100, 4000, 18, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '449', '4.5', '179', 'Gas', '5'),
(23, 800, 100, 4000, 19, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '190', '7.8', '124', 'Gas', '7'),
(24, 800, 100, 4000, 20, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '134', '8', '127', 'Gas', '5'),
(25, 800, 100, 4000, 21, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '360', '4.4', '4.4', 'Gas', '5'),
(26, 800, 100, 4000, 22, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '510', '4.6', '133', 'Gas', '5'),
(27, 800, 100, 4000, 23, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '510', '4.6', '133', 'Gas', '5'),
(28, 800, 100, 4000, 24, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '510', '4.6', '133', 'Gas', '5'),
(29, 800, 100, 4000, 25, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '510', '4.6', '133', 'Gas', '5'),
(30, 800, 100, 4000, 26, 'London', 'Cygnus Business Centre, Dalmeyer Rd, Church End & Roundwood, London NW10 2XA, UK', 51.5505, -0.247721, '624', '4.6', '155', 'Gas', '4');

-- --------------------------------------------------------

--
-- Table structure for table `car_type`
--

CREATE TABLE IF NOT EXISTS `car_type` (
  `id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_type`
--

INSERT INTO `car_type` (`id`, `name`) VALUES
(1, 'Sports'),
(2, 'Luxury'),
(3, 'Utility');

-- --------------------------------------------------------

--
-- Table structure for table `chauffeur`
--

CREATE TABLE IF NOT EXISTS `chauffeur` (
  `id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `charges` int(10) NOT NULL,
  `driving_license_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(8) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'England'),
(2, 'Northern Ireland'),
(3, 'Scotland'),
(4, 'Wales');

-- --------------------------------------------------------

--
-- Table structure for table `customers_auth`
--

CREATE TABLE IF NOT EXISTS `customers_auth` (
  `uid` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(200) NOT NULL,
  `dob` date NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_auth`
--

INSERT INTO `customers_auth` (`uid`, `first_name`, `last_name`, `email`, `phone`, `password`, `created`, `image`, `dob`) VALUES
(187, 'Ahmed', ' Viquas', 'ahmedviquas105@gmail.com', '8660810061', '$2a$10$c15aea57b72e5d652cff8O/eNlGXtOycLhR3H9TScVTqnpL5wOm8y', '2017-04-13 04:46:27', 'img-20170508-5910296a29117.png', '0000-00-00'),
(188, 'Sohail ', 'Mohammed', 'sohail@gmail.com', '9898989898', '$2a$10$01a745c01803cbc7b617buI/acN443/BgbkU/ob0zox2GlHD.bcNK', '2017-04-13 11:34:21', '', '0000-00-00'),
(189, 'Ahmed Viquas', 'Viquas', 'ahmedviqus105@gmail.com', '', '$2a$10$58d600a07afa577c11842uEGWlw3YuIQz8lwLExqDxZJcf59kpnx6', '2017-05-08 09:18:22', '', '2017-05-18'),
(190, 'Ahmed Viquas', 'Viquas', 'ahmedviqs105@gmail.com', '', '$2a$10$cf0e078b3839898a82c95uvaWIwvNBT8Q/D8aWP574ugfLVnRxohq', '2017-05-08 09:22:23', '', '2017-05-18'),
(200, 'Ahmed Viquas', 'Viquas', 'suhaili@gmaila.cm', '', '$2a$10$e43429091ab8c99c3a870uM70tvgudlegH38hhcyPTQlM8qZY3g7q', '2017-05-08 09:44:37', '', '2017-05-18'),
(201, 'Ahmed Viquas', 'Viquas', 'ahmedviquas105@gmail.coma', '', '$2a$10$6fb09967d6184f47cb5a0uwvLi8FXFau4ZChdWkni.NhQ7Q60E2PG', '2017-05-08 10:14:33', '', '2017-05-11'),
(202, 'Ahmed Viquas', 'Viquas', 'ahmedviquas105@gail.com', '', '$2a$10$ed41d6631f1d22010978fuillt7OoJHOaFikf7j29YKw0yY8IbtCO', '2017-05-08 10:46:00', '', '2017-05-10'),
(203, 'Ahmed Viquas', 'Viquas', 'ahmedvuas105@gmail.com', '', '$2a$10$7331b2bb1367518da28f2OXWR7zkNt7h8dsTrAWSwvPFEx8L1kvLK', '2017-05-08 10:46:40', '', '2017-05-11'),
(204, 'Ahmed Viquas', 'Viquas', 'ahmdviquas105@gail.com', '', '$2a$10$525174e20876f2cb7244dubwNDOjg0Lk0lKJBwcCRrtQVPu5.KI6a', '2017-05-08 11:03:27', '', '2017-05-04'),
(205, 'Ahmed Viquas', 'Viquas', 'ahas105@gmail.com', '', '$2a$10$9abb2c9d79107f74f601fuQX7i.jBrZY8A25UJvV754HY0PkL1h6u', '2017-05-08 11:09:34', '', '2017-05-03'),
(206, 'Ahmed', 'Viquas', 'ahmedviquas@live.com', '', '$2a$10$aab55b806907e243487afuX3PI3I.EsSEHWpiu2A1cusPe6UHNgpC', '2017-05-09 14:01:38', '', '1990-10-09'),
(207, 'kishan', 'vasani', 'kishan@vasani.org', '', '$2a$10$a6049000e2730cff9a6dcu9gjUVEVAmJj2jCNqXwLpUrT.fGoDpam', '2017-05-10 07:10:46', '', '1981-11-14');

-- --------------------------------------------------------

--
-- Table structure for table `driving_license`
--

CREATE TABLE IF NOT EXISTS `driving_license` (
  `id` int(8) NOT NULL,
  `user_id` int(9) NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driving_license`
--

INSERT INTO `driving_license` (`id`, `user_id`, `image`) VALUES
(1, 187, 'img-20170508-59102a9b00cbb.png'),
(2, 187, 'img-20170508-59102aebf2c66.png'),
(3, 187, 'img-20170508-59102b17d4d59.png'),
(4, 187, 'img-20170508-59102b2fc3c3b.png'),
(5, 203, 'img-20170508-59104c900c2a9.png'),
(6, 204, 'img-20170508-5910507f67ca2.png'),
(7, 205, 'img-20170508-591051ee0ed49.png'),
(8, 206, 'img-20170509-5911cbc33dd75.png'),
(9, 207, 'img-20170510-5912bcf664dde.png');

-- --------------------------------------------------------

--
-- Table structure for table `facebook`
--

CREATE TABLE IF NOT EXISTS `facebook` (
  `id` int(8) NOT NULL,
  `detail` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `google`
--

CREATE TABLE IF NOT EXISTS `google` (
  `id` int(8) NOT NULL,
  `detail` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE IF NOT EXISTS `insurance` (
  `id` int(8) NOT NULL,
  `detail` varchar(100) NOT NULL,
  `insurance_number` varchar(50) NOT NULL,
  `expiry_date` date NOT NULL,
  `company` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `photoid`
--

CREATE TABLE IF NOT EXISTS `photoid` (
  `id` int(8) NOT NULL,
  `type` varchar(100) NOT NULL,
  `number` varchar(100) NOT NULL,
  `image` varchar(200) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `transmission`
--

CREATE TABLE IF NOT EXISTS `transmission` (
  `id` int(8) NOT NULL,
  `type` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `transmission`
--

INSERT INTO `transmission` (`id`, `type`) VALUES
(1, 'Automatic'),
(2, 'Manual');

-- --------------------------------------------------------

--
-- Table structure for table `user_facebook`
--

CREATE TABLE IF NOT EXISTS `user_facebook` (
  `facebook_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_google`
--

CREATE TABLE IF NOT EXISTS `user_google` (
  `google_id` int(8) NOT NULL,
  `user_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_photo_id`
--

CREATE TABLE IF NOT EXISTS `user_photo_id` (
  `user_id` int(8) NOT NULL,
  `photo_id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address_proof`
--
ALTER TABLE `address_proof`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address_type`
--
ALTER TABLE `address_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_id` (`make_id`);

--
-- Indexes for table `cars_and_type`
--
ALTER TABLE `cars_and_type`
  ADD PRIMARY KEY (`car_id`,`car_type_id`);

--
-- Indexes for table `car_booking`
--
ALTER TABLE `car_booking`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `car_booking_status`
--
ALTER TABLE `car_booking_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_category`
--
ALTER TABLE `car_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_images`
--
ALTER TABLE `car_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `car_id` (`car_id`);

--
-- Indexes for table `car_insurance`
--
ALTER TABLE `car_insurance`
  ADD PRIMARY KEY (`car_id`,`insurance_id`);

--
-- Indexes for table `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `car_specifications`
--
ALTER TABLE `car_specifications`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `car_id` (`car_id`);

--
-- Indexes for table `car_type`
--
ALTER TABLE `car_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chauffeur`
--
ALTER TABLE `chauffeur`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers_auth`
--
ALTER TABLE `customers_auth`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `driving_license`
--
ALTER TABLE `driving_license`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `facebook`
--
ALTER TABLE `facebook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google`
--
ALTER TABLE `google`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photoid`
--
ALTER TABLE `photoid`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transmission`
--
ALTER TABLE `transmission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_facebook`
--
ALTER TABLE `user_facebook`
  ADD PRIMARY KEY (`facebook_id`,`user_id`);

--
-- Indexes for table `user_google`
--
ALTER TABLE `user_google`
  ADD PRIMARY KEY (`google_id`,`user_id`);

--
-- Indexes for table `user_photo_id`
--
ALTER TABLE `user_photo_id`
  ADD PRIMARY KEY (`user_id`,`photo_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `address_proof`
--
ALTER TABLE `address_proof`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `address_type`
--
ALTER TABLE `address_type`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `card`
--
ALTER TABLE `card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `car_booking`
--
ALTER TABLE `car_booking`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `car_booking_status`
--
ALTER TABLE `car_booking_status`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `car_category`
--
ALTER TABLE `car_category`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `car_images`
--
ALTER TABLE `car_images`
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=90;
--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `car_specifications`
--
ALTER TABLE `car_specifications`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `car_type`
--
ALTER TABLE `car_type`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `chauffeur`
--
ALTER TABLE `chauffeur`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `customers_auth`
--
ALTER TABLE `customers_auth`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=208;
--
-- AUTO_INCREMENT for table `driving_license`
--
ALTER TABLE `driving_license`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `facebook`
--
ALTER TABLE `facebook`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `google`
--
ALTER TABLE `google`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `insurance`
--
ALTER TABLE `insurance`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `photoid`
--
ALTER TABLE `photoid`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `transmission`
--
ALTER TABLE `transmission`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
