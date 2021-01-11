-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Oct 17, 2020 at 01:38 PM
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
(1, 'Recherche alternant dev Full Stack', 'Nous recherchons un alternant dev fullstack', 'Open space, remuneration en Mojito envisageable', '2020-08-29 00:00:00', 1, NULL, NULL),
(2, NULL, 'Mon incroyable offre d\'emploi', NULL, NULL, 2, NULL, NULL);

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
(1, 'Denis Corp', '201 rue des paquerettes', '69001', 'Lyon', '0102030405', 'www.google.fr', 'This is a test company description to see if everything works well', NULL),
(2, 'TestCorp', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

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
(1, 1, 2, 1, NULL, NULL),
(2, 40, 49, 1, NULL, NULL);

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
  `pe_country` varchar(255) DEFAULT NULL,
  `pe_profile_picture` blob,
  `pe_isadmin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`pe_id`, `first_name`, `pe_name`, `pe_address`, `postal_code`, `city`, `pe_number`, `pe_email`, `CV`, `pe_password`, `pe_country`, `pe_profile_picture`, `pe_isadmin`) VALUES
(1, 'Denis', 'Valsons', '05 rue Thisaddressdoesntexist', '69001', 'Lyon', '0123456789', 'denis.test@gmail.com', NULL, '$2b$10$PkfJMtDrhtKka2trP9IqhucyVQwmS1/NnCVihD2lXdPB045qjHhFC', NULL, NULL, NULL),
(2, 'John', 'Smith', '10 rue Ilovesquash', '69007', 'Lyon', '0123456789', 'john.smith.test@gmail.com', NULL, NULL, NULL, NULL, NULL),
(3, 'Denis', 'testotest', '5 rue des champs', 'undefined', 'Palaiseau', 'Denis', 'denis.test.testotron@gmail.com', NULL, '$2b$10$2OsXxQrqwDxUBDZiWHYaGO3f8adi8gRuKKEIqj33CdSGVZNXJEVVy', NULL, NULL, NULL),
(4, 'Testotron', 'Marshall', '5 rue des champs', 'undefined', 'Palaiseau', 'Testotron', 'testotron@gmail.com', NULL, '$2b$10$FCnzjxTgEMj84ZjfcvO0muWGNQjTGf4u4uFvvbYjMTM5CT2joUMwS', NULL, NULL, NULL),
(5, 'Testotron3', 'Marshall', '5 rue des champs', 'undefined', 'Palaiseau', 'Testotron3', 'testotron3@gmail.com', NULL, '$2b$10$bqG/rYuOgnO/RWO2Lp3t0.G/B.YpRrna2fGUo2NqABg5b9MJuJI.G', NULL, NULL, NULL),
(6, 'Testotron4', 'Marshall', NULL, NULL, NULL, NULL, 'testotron4@gmail.com', NULL, '$2b$10$O0bN1f3eenPh4EVdG7b6kehS.LqfuhXfYAyM/tg5u57FqVDfQ4ESG', NULL, NULL, NULL),
(7, 'Testotron5', 'Marshall', NULL, NULL, NULL, NULL, 'testotron5@gmail.com', NULL, '$2b$10$AmkH8MVMNAM0xNTxOaCwOOpyCg4WsZfm0qyMjPBqVnqpDO.m1UH0q', NULL, NULL, NULL),
(9, 'Testotron10', 'Marshall', NULL, NULL, NULL, NULL, 'testotron10@gmail.com', NULL, '$2b$10$av1FWOcnGKj6TlTjnV4urOoVxBD63PANQ7gxcOWSwV3FqzODKQiRu', NULL, NULL, NULL),
(12, 'Testotron10', 'Marshall', NULL, NULL, NULL, NULL, 'testotron9@gmail.com', NULL, '$2b$10$B.DqJBdeGnyQInaJUo4BvuiM5BeGnYTQNYpLfDHtULoC9Gbpth93C', NULL, NULL, NULL),
(17, 'Testotron10', 'Marshall', NULL, NULL, NULL, NULL, 'testotron28@gmail.com', NULL, '$2b$10$kBgP/fwt7k4dvxszY05PPu.UjH/ENsH/rysFfyQjxeYFSxgEb13l.', NULL, NULL, NULL),
(18, 'Testotron10', 'Marshall', NULL, NULL, NULL, NULL, 'testotron29@gmail.com', NULL, '$2b$10$brt8doFw/N1KTUktrqSZM.M/i2Axxg1y67A5.TMlpFvqBXJQpI1eq', NULL, NULL, NULL),
(19, 'undefined', 'denis', NULL, NULL, NULL, NULL, 'denis@gmail.com', NULL, '$2b$10$IpgLL9MG8.pNnZr24Gxahu4jATd7SS6UBjggNqnNB7JeW/aDm2kkW', NULL, NULL, 1),
(20, 'undefined', 'de', NULL, NULL, NULL, NULL, 'de@gmail.com', NULL, '$2b$10$k7w6UTXIyf6jigxNJ8tLLumWLbTYm0rxPOIKKiny6DONU8obuLUke', NULL, NULL, NULL),
(21, 'undefined', 'de', NULL, NULL, NULL, NULL, 'deiii@gmail.com', NULL, '$2b$10$r9/ycc4reynwoPD76k1Bk.6dHdF9tWmucfmG2n9dXzLcXabMBgXCe', NULL, NULL, NULL),
(22, 'undefined', 'de', NULL, NULL, NULL, NULL, 'dei@gmail.com', NULL, '$2b$10$xkSSuCmnNS5k4LsQjugChehYDnqgJzJ4u32zBBlG1lMvegxmikQSm', NULL, NULL, NULL),
(23, 'undefined', 'test', NULL, NULL, NULL, NULL, 'denisttt@gmail.com', NULL, '$2b$10$y2ZNxE8DPl6uWQvb2MG9GOR03rkvmb69ShgRmQWKnKIRGfYO8fZOi', NULL, NULL, NULL),
(24, 'undefined', 'te', NULL, NULL, NULL, NULL, 'de2@gmail.com', NULL, '$2b$10$uyVZL84QhJVsKfPOJQMd7OtVR8.w2wzbZI8zVmZL.T7tphJjSFSNC', NULL, NULL, NULL),
(25, 'undefined', 'te', NULL, NULL, NULL, NULL, 'de3@gmail.com', NULL, '$2b$10$kSC9tSaFZ.EI6Z8Oh/O7H.DvkZVdcP.PyL2SD.JVxCI7W0Bp2Vdp2', NULL, NULL, NULL),
(26, 'undefined', 'te', NULL, NULL, NULL, NULL, 'de4@gmail.com', NULL, '$2b$10$qH1/fpiRBMWPcoel0nvbnOt41V//5nwckJ7hqKzolVDd4TifF0X.G', NULL, NULL, NULL),
(27, 'undefined', 'de', NULL, NULL, NULL, NULL, 'de5@gmail.com', NULL, '$2b$10$XqHPovrPLhHU6OF0aKo.M.aJWLUnSGtroLlpqpk12dDbITkWw6Fgu', NULL, NULL, NULL),
(28, 'undefined', 'te', NULL, NULL, NULL, NULL, 'de6@gmail.com', NULL, '$2b$10$ccNGfEFD5WkCu1.HoVZBMuxrwuH32ipovSk9/WXFl1lego/MEyDg.', NULL, NULL, NULL),
(29, 'undefined', 'te', NULL, NULL, NULL, NULL, 'de8@gmail.com', NULL, '$2b$10$mwglFCf4HheA97AtGwSpeu.5edYZXywqyTdvHx9P1NuNsLTAwRUdC', NULL, NULL, NULL),
(30, 'undefined', 'te', NULL, NULL, NULL, NULL, 'de9@gmail.com', NULL, '$2b$10$2.K.LWojl5VdyvTPBxYeVu76waD.eJ1sRhdF/wytFpcPBHeDLxXUe', NULL, NULL, NULL),
(31, 'undefined', 'te', NULL, NULL, NULL, NULL, 'den1@g.com', NULL, '$2b$10$tGebqT1bPBURdkYuRgTtSuwLwvW6E4BLhJcnY4whj1OFFlRmBSRZm', NULL, NULL, NULL),
(32, 'undefined', 'qwe', NULL, NULL, NULL, NULL, 'qwe@g.com', NULL, '$2b$10$D8VPgAm9eIaqSEm94qu7q.RFuRSgDtEtVvZNpV0MmkWD0XyAEkeUK', NULL, NULL, NULL),
(33, 'undefined', 'asd', NULL, NULL, NULL, NULL, 'dsa@g.com', NULL, '$2b$10$UPU2u0.M0aOLU.Ov6GsPD.PxCs3UkTBxkr8zPdSyONvtcg2dtAWBm', NULL, NULL, NULL),
(34, 'undefined', 'qwe', NULL, NULL, NULL, NULL, 'd1@we.con', NULL, '$2b$10$qwlAVWMWHee.9bRByS65LOAhuXbyY6St1hUzHVg/Y21gfztRGOL56', NULL, NULL, NULL),
(35, 'undefined', 'qwe', NULL, NULL, NULL, NULL, 'tttt@gmail.com', NULL, '$2b$10$w387NzgDsffSXftEAmUBg.dn8f3TFhDkpOtD8l2PdLg28aX2QYOtK', NULL, NULL, NULL),
(36, 'undefined', 'den', NULL, NULL, NULL, NULL, 'den1@gmail.com', NULL, '$2b$10$m1Q9fkS.dzoj2BYg4Sy1ju9ItRZFqZmpZRpnCdVYMIsvB0H2zAup6', NULL, NULL, NULL),
(37, 'undefined', 'admin', NULL, NULL, NULL, NULL, 'admin@admin.com', NULL, '$2b$10$mLUxhWecZacfVXBBaVkbruCwcJ5aeFT3Pjh3pDczcsdZWBN/vajl2', NULL, NULL, NULL),
(38, 'undefined', '312', NULL, NULL, NULL, NULL, 'de26@gmail.com', NULL, '$2b$10$wZjzm47wCi5ZBZRrs0f5ROS5LeImkIEla9xCTRZZW8.wzgH.u6.cu', NULL, NULL, NULL),
(39, 'test', 'denis', NULL, NULL, NULL, NULL, 'd@gmail.com', NULL, '$2b$10$/TYbIyhS.3gEb6LQ0Sh4CuLaCmCp8htuaGtPwDY8zumDz16plUtD6', NULL, NULL, NULL),
(40, 'undefined', 'supervisor', NULL, NULL, NULL, NULL, 'supervisor@supervisor.com', NULL, '$2b$10$VHCEQCcqH11ILS5cDuT/A.i2IfYpvlVPcKGFfsk0J1umiVhu8.ozW', NULL, NULL, NULL),
(41, 'undefined', 'undefined', NULL, NULL, NULL, 'undefined', 'undefined', NULL, 'tempghost', NULL, NULL, NULL),
(43, 'ghost', 'ghost', NULL, NULL, NULL, '0102030405', 'ghost@g.com', NULL, 'tempghost', NULL, NULL, NULL),
(44, 'ghost', 'ghost', NULL, NULL, NULL, '0102030405', 'ghost2@gmail.com', NULL, 'tempghost', NULL, NULL, NULL),
(45, 'ghost3', 'ghost3', NULL, NULL, NULL, '0102030405', 'ghost3@gmail.com', NULL, 'tempghost', NULL, NULL, NULL),
(48, 'ghost3', 'ghost3', NULL, NULL, NULL, '0102030405', 'ghost4@gmail.com', NULL, 'tempghost', NULL, NULL, NULL),
(49, 'ghost3', 'ghost3', NULL, NULL, NULL, '0102030405', 'ghost5@gmail.com', NULL, 'tempghost', NULL, NULL, NULL);

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
(1, 1),
(2, 40);

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
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `application_mail`
--
ALTER TABLE `application_mail`
  MODIFY `id_mail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `co_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `pe_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

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
