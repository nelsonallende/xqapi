-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2016 at 05:58 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `site`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(9) UNSIGNED NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `comment` varchar(255) NOT NULL,
  `id_location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `username`, `comment`, `id_location`) VALUES
(2, 'test3', 'bla3', '3'),
(3, 'testest', 'blablabla', '3'),
(4, 'bla', 'hello', '6'),
(5, 'bla', 'hello', '6'),
(6, 'sdfa', 'blablabla', '6'),
(7, 'bla', 'hello', '6'),
(8, 'bla', 'hello', '6');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(9) UNSIGNED NOT NULL,
  `user` varchar(100) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `pass` varchar(255) CHARACTER SET latin1 COLLATE latin1_german1_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user`, `email`, `pass`, `created`) VALUES
(15, 'Schi', 'aa@.com', 'd915f4e970e53654202c1cf5c62e60a7280a8219', '2016-06-14 08:15:07'),
(16, 'something', 'nelson@gmail.com', 'd915f4e970e53654202c1cf5c62e60a7280a8219', '2016-06-14 08:17:52'),
(17, 'something', 'nelson@gmail.com', 'd915f4e970e53654202c1cf5c62e60a7280a8219', '2016-06-14 08:18:49'),
(18, 'Allende', 'nelson@gmail.com', 'd915f4e970e53654202c1cf5c62e60a7280a8219', '2016-06-14 08:21:46'),
(19, 'Magda', 'nenene@dssdf.com', '9d1e3c2635ffdace76b6dbce94675c4bbb747825', '2016-06-14 10:13:34'),
(20, 'test', 'test@test.test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '2016-06-14 11:11:36'),
(21, 'something', 'dfdfd', 'd915f4e970e53654202c1cf5c62e60a7280a8219', '2016-06-14 11:44:09'),
(22, 'test', 'test', 'a94a8fe5ccb19ba61c4c0873d391e987982fbbd3', '2016-06-14 12:01:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(9) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
