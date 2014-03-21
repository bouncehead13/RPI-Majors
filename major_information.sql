-- phpMyAdmin SQL Dump
-- version 4.0.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 02, 2014 at 06:33 PM
-- Server version: 5.0.96-community
-- PHP Version: 5.3.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hancom_majors`
--

-- --------------------------------------------------------

--
-- Table structure for table `major_information`
--

CREATE TABLE IF NOT EXISTS `major_information` (
  `major_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `major_name` varchar(60) NOT NULL,
  `description` varchar(300) NOT NULL,
  `advisor` varchar(50) NOT NULL,
  `advisor_email` varchar(50) NOT NULL,
  PRIMARY KEY  (`major_id`),
  UNIQUE KEY `major_name` (`major_name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `major_information`
--

INSERT INTO `major_information` (`major_id`, `major_name`, `description`, `advisor`, `advisor_email`) VALUES
(0, 'Computer Science', '', '', ''),
(1, 'Biology', '', '', ''),
(2, 'Architectural Science', '', '', ''),
(3, 'Architectural Acoustics', '', '', ''),
(4, 'Building Conservation', '', '', ''),
(5, 'Built Ecologies', '', '', ''),
(6, 'Lighting', '', '', ''),
(7, 'Sustainability', '', '', ''),
(8, 'Entrepreneurship', '', '', ''),
(9, 'Finance', '', '', ''),
(10, 'International Management', '', '', ''),
(11, 'Information Systems', '', '', ''),
(12, 'Marketing', '', '', ''),
(13, 'Supply Chain Management', '', '', ''),
(14, 'Aeronautical Engineering', '', '', ''),
(15, 'Biomedical Engineering', '', '', ''),
(16, 'Chemical Engineering', '', '', ''),
(17, 'Civil Engineering', '', '', ''),
(18, 'Electrical Engineering', '', '', ''),
(19, 'Computer & Systems Engineering', '', '', ''),
(20, 'Industrial & Management Engineering', '', '', ''),
(21, 'Materials Engineering', '', '', ''),
(22, 'Mechanical Engineering', '', '', ''),
(23, 'Nuclear Engineering', '', '', ''),
(24, 'Accounting', '', '', ''),
(25, 'Business Analytics', '', '', ''),
(26, 'Cognitive Science', '', '', ''),
(27, 'Communication', '', '', ''),
(28, 'Design, Innovation & Society', '', '', ''),
(29, 'Economics', '', '', ''),
(30, 'Electronics Arts', '', '', ''),
(31, 'Electronic Media', '', '', ''),
(32, 'Games & Simulation', '', '', ''),
(33, 'Philosophy', '', '', ''),
(34, 'Psychology', '', '', ''),
(35, 'Science, Technology & Society', '', '', ''),
(36, 'Sustainability Studies', '', '', ''),
(37, 'Arts', '', '', ''),
(38, 'Computer Hardware', '', '', ''),
(39, 'Computer Networking', '', '', ''),
(40, 'Data Science', '', '', ''),
(41, 'Information Security', '', '', ''),
(42, 'Machine Learning', '', '', ''),
(43, 'Management Information Systems', '', '', ''),
(44, 'Mechanical/Aeronautical Engineering', '', '', ''),
(45, 'Medicine', '', '', ''),
(46, 'Pre-Law', '', '', ''),
(47, 'Science Technology Studies', '', '', ''),
(48, 'Science Informatics', '', '', ''),
(49, 'Web Technologies', '', '', ''),
(50, 'Applied Physics', '', '', ''),
(51, 'Biochemistry/Biophysics', '', '', ''),
(52, 'Bioinformatics', '', '', ''),
(53, 'Chemistry', '', '', ''),
(54, 'Environmental Science', '', '', ''),
(55, 'Geology', '', '', ''),
(56, 'Hydrogeology', '', '', ''),
(57, 'IT & Web Science', '', '', ''),
(58, 'Interdisciplinary Science', '', '', ''),
(59, 'Mathematics', '', '', ''),
(60, 'Physics', '', '', '');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;