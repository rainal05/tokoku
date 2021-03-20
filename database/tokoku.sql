-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 08, 2019 at 10:27 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokoku`
--

-- --------------------------------------------------------

--
-- Table structure for table `measure`
--

DROP TABLE IF EXISTS `measure`;
CREATE TABLE IF NOT EXISTS `measure` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `measure`
--

INSERT INTO `measure` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'sak', '2019-11-08 03:20:21', '2019-11-08 03:20:21'),
(2, 'dus', '2019-11-08 03:20:21', '2019-11-08 03:20:21'),
(3, 'rol', '2019-11-08 03:20:21', '2019-11-08 03:20:21'),
(4, 'mm', '2019-11-08 03:20:21', '2019-11-08 03:20:21'),
(5, 'kg', '2019-11-08 03:20:21', '2019-11-08 03:20:21'),
(6, 'inci', '2019-11-08 03:20:21', '2019-11-08 03:20:21'),
(7, 'buah', '2019-11-08 03:20:21', '2019-11-08 03:20:21'),
(8, 'meter', '2019-11-08 03:20:21', '2019-11-08 03:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2019_03_14_074237_create_measure_table', 1),
('2019_03_14_074237_create_periode_table', 1),
('2019_03_14_074237_create_product_table', 1),
('2019_03_14_074237_create_store_table', 1),
('2019_03_14_074237_create_transaction_table', 1),
('2019_03_14_074237_create_warehouse_table', 1),
('2019_03_14_074247_create_foreign_keys', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `periode`
--

DROP TABLE IF EXISTS `periode`;
CREATE TABLE IF NOT EXISTS `periode` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `active` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `measure_id` int(10) UNSIGNED NOT NULL,
  `price` bigint(20) NOT NULL,
  `warn_stock` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `product_code_unique` (`code`),
  KEY `product_measure_id_foreign` (`measure_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
CREATE TABLE IF NOT EXISTS `store` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE IF NOT EXISTS `transaction` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` int(10) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `price` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `type` enum('S','B','SO') COLLATE utf8_unicode_ci NOT NULL,
  `warehouse_id` int(10) UNSIGNED DEFAULT NULL,
  `periode_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `transaction_product_id_foreign` (`product_id`),
  KEY `transaction_warehouse_id_foreign` (`warehouse_id`),
  KEY `transaction_periode_id_foreign` (`periode_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('SU','U') COLLATE utf8_unicode_ci NOT NULL,
  `blocked` enum('N','Y') COLLATE utf8_unicode_ci NOT NULL,
  `last_login_at` datetime DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `blocked`, `last_login_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'User', 'user@example.com', '$2y$10$YuSB8jR4mXP5Azl8oHp1Vu8InMVf3RMay1TCoZuqH/1GiSE8EMUQm', 'U', 'N', NULL, 'JkHcn6DCja0UE0HqA7xHYQjk5AUnzAa5qsfN2pWR1vNzqObGdU6Ta2X9K6He', '2019-11-08 03:20:21', '2019-11-08 03:23:01'),
(2, 'Moch Diki Widianto', 'dikiwidia@live.com', '$2y$10$Kd1QWpH5bo3L9lMRnEYO4O1wuYBtvDbjYf72gqV1pHD79bfOdJHlq', 'SU', 'N', NULL, NULL, '2019-11-08 03:20:21', '2019-11-08 03:20:21');

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
