-- phpMyAdmin SQL Dump
-- version 4.4.3
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: May 01, 2017 at 01:46 PM
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
  `Region` varchar(100) NOT NULL,
  `postcode` varchar(15) NOT NULL,
  `Country_id` int(8) NOT NULL,
  `city` varchar(100) NOT NULL,
  `type_id` int(8) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `address_line_1`, `address_line_2`, `Region`, `postcode`, `Country_id`, `city`, `type_id`, `user_id`) VALUES
(1, 'line 1', 'line 2', 'some region', 'w12 a12', 1, 'some city', 1, 187),
(2, 'line 1', 'line 2', 'some region', 'w12 a12', 1, 'some city', 1, 187);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `name`, `make_id`, `year`, `model`, `car_category_id`, `information`, `transmission_id`) VALUES
(1, 'Mercedes-Benz CLA', 1, 2016, 'new', 1, 'akjha', 1),
(2, 'Audi A3', 1, 2015, 'A3', 1, 'Good car', 2),
(3, 'hj', 1, 2012, 'hj', 2, '', 2),
(4, 'm', 1, 1990, 'm', 7, 'mmm', 2),
(5, 'm', 1, 2016, 'm', 7, 'm', 2),
(6, 'm', 1, 1990, 'm', 7, 'm', 2),
(7, 'Audi R8', 2, 2015, 'R8', 3, 'New car good performence', 2);

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
  `chauffeur_location` varchar(300) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_booking`
--

INSERT INTO `car_booking` (`id`, `car_id`, `user_id`, `from_time`, `to_time`, `chauffeur`, `pickup_location`, `delivery_location`, `collection_location`, `distance`, `additional_request`, `chauffeur_location`) VALUES
(1, 1, 187, '2017-04-12 05:15:16', '2017-04-26 07:17:19', 0, '', '', '', 0, '', ''),
(2, 1, 187, '2017-04-12 10:10:00', '2017-04-12 11:10:00', 0, '', '', '', 0, '', ''),
(3, 1, 187, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 0, '', '', '', 0, '', ''),
(4, 1, 187, '0999-09-09 00:12:00', '1212-12-12 00:12:00', 1, '', '', '', 100, 'i need', ''),
(5, 1, 187, '0000-00-00 00:00:00', '0000-00-00 00:00:00', 1, '', '', '', 100, 'some info', 'addressq');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_images`
--

INSERT INTO `car_images` (`id`, `car_id`, `image_link`) VALUES
(1, 2, 'audi1.jpg'),
(2, 2, 'audi2.jpg'),
(4, 1, 'img-20170418-58f60254d2c16.png');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`id`, `name`) VALUES
(1, 'Mercedes'),
(2, 'Audi');

-- --------------------------------------------------------

--
-- Table structure for table `car_specifications`
--

CREATE TABLE IF NOT EXISTS `car_specifications` (
  `id` int(8) NOT NULL,
  `daily_price` float NOT NULL,
  `weekly_price` float NOT NULL,
  `security_deposit` float NOT NULL,
  `car_id` int(8) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_specifications`
--

INSERT INTO `car_specifications` (`id`, `daily_price`, `weekly_price`, `security_deposit`, `car_id`) VALUES
(1, 99, 10.9, 10, 10),
(4, 104, 11.9, 10, 1),
(8, 90, 9.9, 90, 2),
(10, 100, 100, 100, 3),
(11, 1000, 1000, 1000, 7);

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
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers_auth`
--

INSERT INTO `customers_auth` (`uid`, `name`, `email`, `phone`, `password`, `created`, `image`) VALUES
(187, 'Ahmed Viquas', 'ahmedviquas105@gmail.com', '8660810061', '$2a$10$c15aea57b72e5d652cff8O/eNlGXtOycLhR3H9TScVTqnpL5wOm8y', '2017-04-13 04:46:27', 'ahmed8797923987.jpg'),
(188, 'Sohail Mohammed', 'sohail@gmail.com', '9898989898', '$2a$10$01a745c01803cbc7b617buI/acN443/BgbkU/ob0zox2GlHD.bcNK', '2017-04-13 11:34:21', '');

-- --------------------------------------------------------

--
-- Table structure for table `driving_license`
--

CREATE TABLE IF NOT EXISTS `driving_license` (
  `id` int(8) NOT NULL,
  `user_id` int(9) NOT NULL,
  `image` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Indexes for table `address_type`
--
ALTER TABLE `address_type`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `address_type`
--
ALTER TABLE `address_type`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `car_booking`
--
ALTER TABLE `car_booking`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
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
  MODIFY `id` int(9) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `car_specifications`
--
ALTER TABLE `car_specifications`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
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
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=189;
--
-- AUTO_INCREMENT for table `driving_license`
--
ALTER TABLE `driving_license`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;
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
