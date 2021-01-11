-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 09, 2020 at 08:42 AM
-- Server version: 5.7.26
-- PHP Version: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `advertisement`
--

CREATE TABLE `advertisement` (
  `ad_id` int(11) NOT NULL,
  `ad_name` varchar(255) DEFAULT NULL,
  `ad_desc` mediumtext,
  `detail` mediumtext,
  `ad_date` datetime DEFAULT NULL,
  `co_id` int(11) DEFAULT NULL,
  `ad_country` varchar(255) DEFAULT NULL,
  `ad_contract_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `advertisement`
--

INSERT INTO `advertisement` (`ad_id`, `ad_name`, `ad_desc`, `detail`, `ad_date`, `co_id`, `ad_country`, `ad_contract_type`) VALUES
(1, 'Recherche alternant dev Full Stack', 'Nous recherchons un alternant dev fullstack', 'Open space, remuneration en Mojito envisageable', '2020-08-29 00:00:00', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `application_mail`
--

CREATE TABLE `application_mail` (
  `id_mail` int(11) NOT NULL,
  `su_co_id` int(11) NOT NULL,
  `su_pe_id` int(11) NOT NULL,
  `pe_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `application_mail`
--

INSERT INTO `application_mail` (`id_mail`, `su_co_id`, `su_pe_id`, `pe_id`, `ad_id`) VALUES
(1, 1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `co_id` int(11) NOT NULL,
  `co_name` varchar(50) DEFAULT NULL,
  `co_address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `contact_number` varchar(10) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `comp_desc` mediumtext,
  `co_country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`co_id`, `co_name`, `co_address`, `postal_code`, `city`, `contact_number`, `website`, `comp_desc`, `co_country`) VALUES
(1, 'Denis Corp', '201 rue des paquerettes', '69001', 'Lyon', '0102030405', 'www.google.fr', 'This is a test company description to see if everything works well', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_application`
--

CREATE TABLE `job_application` (
  `su_co_id` int(11) NOT NULL,
  `su_pe_id` int(11) NOT NULL,
  `pe_id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `pe_cv` longblob,
  `pe_cl` longblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `job_application`
--

INSERT INTO `job_application` (`su_co_id`, `su_pe_id`, `pe_id`, `ad_id`, `pe_cv`, `pe_cl`) VALUES
(1, 1, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `pe_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `pe_name` varchar(50) DEFAULT NULL,
  `pe_address` varchar(255) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `pe_number` varchar(10) DEFAULT NULL,
  `pe_email` varchar(100) DEFAULT NULL,
  `CV` longblob,
  `pe_password` varchar(255) DEFAULT NULL,
  `pe_country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`pe_id`, `first_name`, `pe_name`, `pe_address`, `postal_code`, `city`, `pe_number`, `pe_email`, `CV`, `pe_password`, `pe_country`) VALUES
(1, 'Denis', 'Valsons', '05 rue Thisaddressdoesntexist', '69001', 'Lyon', '0123456789', 'denis.test@gmail.com', NULL, '$2b$10$PkfJMtDrhtKka2trP9IqhucyVQwmS1/NnCVihD2lXdPB045qjHhFC', NULL),
(2, 'John', 'Smith', '10 rue Ilovesquash', '69007', 'Lyon', '0123456789', 'john.smith.test@gmail.com', NULL, NULL, NULL),
(3, 'Denis', 'testotest', '5 rue des champs', 'undefined', 'Palaiseau', 'Denis', 'denis.test.testotron@gmail.com', NULL, '$2b$10$2OsXxQrqwDxUBDZiWHYaGO3f8adi8gRuKKEIqj33CdSGVZNXJEVVy', NULL),
(4, 'Testotron', 'Marshall', '5 rue des champs', 'undefined', 'Palaiseau', 'Testotron', 'testotron@gmail.com', NULL, '$2b$10$FCnzjxTgEMj84ZjfcvO0muWGNQjTGf4u4uFvvbYjMTM5CT2joUMwS', NULL),
(5, 'Testotron3', 'Marshall', '5 rue des champs', 'undefined', 'Palaiseau', 'Testotron3', 'testotron3@gmail.com', NULL, '$2b$10$bqG/rYuOgnO/RWO2Lp3t0.G/B.YpRrna2fGUo2NqABg5b9MJuJI.G', NULL),
(6, 'Testotron4', 'Marshall', NULL, NULL, NULL, NULL, 'testotron4@gmail.com', NULL, '$2b$10$O0bN1f3eenPh4EVdG7b6kehS.LqfuhXfYAyM/tg5u57FqVDfQ4ESG', NULL),
(7, 'Testotron5', 'Marshall', NULL, NULL, NULL, NULL, 'testotron5@gmail.com', NULL, '$2b$10$AmkH8MVMNAM0xNTxOaCwOOpyCg4WsZfm0qyMjPBqVnqpDO.m1UH0q', NULL),
(9, 'Testotron10', 'Marshall', NULL, NULL, NULL, NULL, 'testotron10@gmail.com', NULL, '$2b$10$av1FWOcnGKj6TlTjnV4urOoVxBD63PANQ7gxcOWSwV3FqzODKQiRu', NULL),
(12, 'Testotron10', 'Marshall', NULL, NULL, NULL, NULL, 'testotron9@gmail.com', NULL, '$2b$10$B.DqJBdeGnyQInaJUo4BvuiM5BeGnYTQNYpLfDHtULoC9Gbpth93C', NULL),
(17, 'Testotron10', 'Marshall', NULL, NULL, NULL, NULL, 'testotron28@gmail.com', NULL, '$2b$10$kBgP/fwt7k4dvxszY05PPu.UjH/ENsH/rysFfyQjxeYFSxgEb13l.', NULL),
(18, 'Testotron10', 'Marshall', NULL, NULL, NULL, NULL, 'testotron29@gmail.com', NULL, '$2b$10$brt8doFw/N1KTUktrqSZM.M/i2Axxg1y67A5.TMlpFvqBXJQpI1eq', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `people_skill`
--

CREATE TABLE `people_skill` (
  `pe_id` int(11) NOT NULL,
  `sk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `required_skill`
--

CREATE TABLE `required_skill` (
  `ad_id` int(11) NOT NULL,
  `sk_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `required_skill`
--

INSERT INTO `required_skill` (`ad_id`, `sk_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `skill`
--

CREATE TABLE `skill` (
  `sk_id` int(11) NOT NULL,
  `sk_name` varchar(255) DEFAULT NULL,
  `sk_desc` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`sk_id`, `sk_name`, `sk_desc`) VALUES
(1, 'SQL', 'SQL is the language that allow interaction with databases');

-- --------------------------------------------------------

--
-- Table structure for table `supervisor`
--

CREATE TABLE `supervisor` (
  `co_id` int(11) NOT NULL,
  `pe_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supervisor`
--

INSERT INTO `supervisor` (`co_id`, `pe_id`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `co_id` (`co_id`);

--
-- Indexes for table `application_mail`
--
ALTER TABLE `application_mail`
  ADD PRIMARY KEY (`id_mail`,`su_co_id`,`su_pe_id`,`pe_id`,`ad_id`),
  ADD UNIQUE KEY `id_mail` (`id_mail`),
  ADD KEY `su_co_id` (`su_co_id`,`su_pe_id`,`pe_id`,`ad_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`co_id`);

--
-- Indexes for table `job_application`
--
ALTER TABLE `job_application`
  ADD PRIMARY KEY (`su_co_id`,`su_pe_id`,`pe_id`,`ad_id`),
  ADD KEY `pe_id` (`pe_id`),
  ADD KEY `ad_id` (`ad_id`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`pe_id`),
  ADD UNIQUE KEY `pe_email` (`pe_email`);

--
-- Indexes for table `people_skill`
--
ALTER TABLE `people_skill`
  ADD PRIMARY KEY (`pe_id`,`sk_id`),
  ADD KEY `sk_id` (`sk_id`);

--
-- Indexes for table `required_skill`
--
ALTER TABLE `required_skill`
  ADD PRIMARY KEY (`ad_id`,`sk_id`),
  ADD KEY `sk_id` (`sk_id`);

--
-- Indexes for table `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`sk_id`);

--
-- Indexes for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD PRIMARY KEY (`co_id`,`pe_id`),
  ADD KEY `pe_id` (`pe_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `advertisement`
--
ALTER TABLE `advertisement`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `application_mail`
--
ALTER TABLE `application_mail`
  MODIFY `id_mail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `pe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `sk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `advertisement`
--
ALTER TABLE `advertisement`
  ADD CONSTRAINT `advertisement_ibfk_1` FOREIGN KEY (`co_id`) REFERENCES `company` (`co_id`);

--
-- Constraints for table `application_mail`
--
ALTER TABLE `application_mail`
  ADD CONSTRAINT `application_mail_ibfk_1` FOREIGN KEY (`su_co_id`,`su_pe_id`,`pe_id`,`ad_id`) REFERENCES `job_application` (`su_co_id`, `su_pe_id`, `pe_id`, `ad_id`);

--
-- Constraints for table `job_application`
--
ALTER TABLE `job_application`
  ADD CONSTRAINT `job_application_ibfk_1` FOREIGN KEY (`su_co_id`,`su_pe_id`) REFERENCES `supervisor` (`co_id`, `pe_id`),
  ADD CONSTRAINT `job_application_ibfk_2` FOREIGN KEY (`pe_id`) REFERENCES `people` (`pe_id`),
  ADD CONSTRAINT `job_application_ibfk_3` FOREIGN KEY (`ad_id`) REFERENCES `advertisement` (`ad_id`);

--
-- Constraints for table `people_skill`
--
ALTER TABLE `people_skill`
  ADD CONSTRAINT `people_skill_ibfk_1` FOREIGN KEY (`pe_id`) REFERENCES `people` (`pe_id`),
  ADD CONSTRAINT `people_skill_ibfk_2` FOREIGN KEY (`sk_id`) REFERENCES `skill` (`sk_id`);

--
-- Constraints for table `required_skill`
--
ALTER TABLE `required_skill`
  ADD CONSTRAINT `required_skill_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `advertisement` (`ad_id`),
  ADD CONSTRAINT `required_skill_ibfk_2` FOREIGN KEY (`sk_id`) REFERENCES `skill` (`sk_id`);

--
-- Constraints for table `supervisor`
--
ALTER TABLE `supervisor`
  ADD CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`co_id`) REFERENCES `company` (`co_id`),
  ADD CONSTRAINT `supervisor_ibfk_2` FOREIGN KEY (`pe_id`) REFERENCES `people` (`pe_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
