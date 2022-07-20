-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 20, 2022 at 05:03 AM
-- Server version: 8.0.21
-- PHP Version: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `restaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(20) NOT NULL,
  `topic_id` int DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `published` tinyint NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `topic_id` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `price`, `topic_id`, `title`, `image`, `published`, `created_at`) VALUES
(13, '21', '10.99', 2, 'Fresh Orange', 'product-1.png', 0, '2019-11-23 15:56:19'),
(16, '21', '5.9', 3, 'Fresh Onion', 'product-2.png', 1, '2019-11-23 16:02:23'),
(17, '21', '15.9', 3, 'Fresh Meat', 'product-3.png', 1, '2019-11-23 16:02:53'),
(18, '1', '12.5', NULL, 'Fresh Cabbage', 'product-4.png', 0, '2022-05-28 22:41:53'),
(19, '1', '10.3', NULL, 'Fresh Potato', 'product-5.png', 0, '2022-06-04 21:23:52'),
(20, '1', '3.0', NULL, 'Fresh Avocado', 'product-6.png', 1, '2022-06-04 21:25:53'),
(24, '1', '5.6', 5, 'Fresh Carrot', 'product-7.png', 1, '2022-07-16 18:35:04'),
(25, '1', '6.9', 3, 'Green Lemon', 'product-8.png', 0, '2022-07-18 13:04:25');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `image` varchar(50) NOT NULL,
  `sale` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `image`, `sale`) VALUES
(2, 'Vegitables', 'cat-1.png', '45%'),
(3, 'Fresh Fruits', 'cat-2.png', '20%'),
(4, 'Dairy Products', 'cat-3.png', '16%'),
(5, 'Fresh Meat', 'cat-4.png', '30%');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin` tinyint NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `admin`, `username`, `email`, `password`, `created_at`) VALUES
(85, 1, 'SasithaRh', 'ruvishansth1030@gmail.com', '$2y$10$fZlNQsoIgKSt1RUX9z7qJOti5G4Tee.YKXlB7Sna7vIVJHeSGCZze', '2022-05-18 16:54:08');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
