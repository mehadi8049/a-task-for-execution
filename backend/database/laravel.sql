-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 16, 2024 at 05:16 PM
-- Server version: 8.0.37-0ubuntu0.22.04.3
-- PHP Version: 8.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `codes`
--

CREATE TABLE `codes` (
  `id` bigint UNSIGNED NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `codes`
--

INSERT INTO `codes` (`id`, `code`, `created_at`, `updated_at`) VALUES
(1, '১০১', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(2, '১০২', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(3, '১০৩', '2024-07-16 20:49:39', '2024-07-16 20:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fees`
--

CREATE TABLE `fees` (
  `id` bigint UNSIGNED NOT NULL,
  `code_id` bigint UNSIGNED NOT NULL,
  `year_id` bigint UNSIGNED NOT NULL,
  `fee` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fees`
--

INSERT INTO `fees` (`id`, `code_id`, `year_id`, `fee`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 292000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(2, 1, 2, 280000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(3, 1, 3, 268000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(4, 1, 4, 256000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(5, 1, 5, 236000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(6, 1, 6, 216000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(7, 1, 7, 196000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(8, 1, 8, 176000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(9, 1, 9, 156000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(10, 1, 10, 136000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(11, 1, 11, 116000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(12, 1, 12, 96000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(13, 1, 13, 76000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(14, 1, 14, 56000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(15, 1, 15, 36000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(16, 1, 16, 28000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(17, 1, 17, 20000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(18, 1, 18, 12000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(19, 1, 19, 4000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(20, 2, 1, 146000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(21, 2, 2, 140000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(22, 2, 3, 134000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(23, 2, 4, 128000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(24, 2, 5, 118000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(25, 2, 6, 108000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(26, 2, 7, 98000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(27, 2, 8, 88000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(28, 2, 9, 78000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(29, 2, 10, 68000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(30, 2, 11, 58000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(31, 2, 12, 48000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(32, 2, 13, 38000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(33, 2, 14, 28000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(34, 2, 15, 18000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(35, 2, 16, 14000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(36, 2, 17, 10000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(37, 2, 18, 6000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(38, 2, 19, 2000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(39, 3, 1, 146000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(40, 3, 2, 140000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(41, 3, 3, 134000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(42, 3, 4, 128000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(43, 3, 5, 118000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(44, 3, 6, 108000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(45, 3, 7, 98000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(46, 3, 8, 88000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(47, 3, 9, 78000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(48, 3, 10, 68000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(49, 3, 11, 58000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(50, 3, 12, 48000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(51, 3, 13, 38000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(52, 3, 14, 28000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(53, 3, 15, 18000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(54, 3, 16, 14000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(55, 3, 17, 10000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(56, 3, 18, 6000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(57, 3, 19, 2000.00, '2024-07-16 20:49:39', '2024-07-16 20:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2024_07_14_184545_create_codes_table', 1),
(11, '2024_07_14_184609_create_years_table', 1),
(12, '2024_07_14_184617_create_fees_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('3dde8b976067bf8c5a0b0143c9a179b5ad6b3d2d1d6b914918be81f16c322e2a8ca80689b5e9dce4', 1, 1, 'My Token', '[]', 0, '2024-07-16 21:07:52', '2024-07-16 21:07:52', '2025-07-16 17:07:52'),
('57a250d4243bc478bbe3abb0ff1aa3440cb93019d6e945b6be686ce7a9ccaa24f7599ac0d2e3bfce', 1, 1, 'My Token', '[]', 0, '2024-07-16 21:11:00', '2024-07-16 21:11:00', '2025-07-16 17:11:00'),
('e6707cd776aeb14fb5f2def5bcc2605c9e3f5aa0a4357b9055f9cfc2bfa3f54576ce5867dbc5b10c', 1, 1, 'My Token', '[]', 1, '2024-07-16 21:12:34', '2024-07-16 21:12:34', '2025-07-16 17:12:34'),
('ff3bb6cddf0cc6861186000030777d549f78fffc8960f554f7e4adabe3534e4df2f4f7b2ddadf732', 1, 1, 'My Token', '[]', 0, '2024-07-16 21:16:15', '2024-07-16 21:16:15', '2025-07-16 17:16:15');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Laravel Personal Access Client', 'HVhTmBI78yb3dxLyutBtO830LKqtEp2baGM07Tir', NULL, 'http://localhost', 1, 0, 0, '2024-07-16 21:07:19', '2024-07-16 21:07:19'),
(2, NULL, 'Laravel Password Grant Client', 'sbHq43xq32vm9FtqaY8yO6ATWTs4crMmVR6sS4of', 'users', 'http://localhost', 0, 1, 0, '2024-07-16 21:07:19', '2024-07-16 21:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint UNSIGNED NOT NULL,
  `client_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2024-07-16 21:07:19', '2024-07-16 21:07:19');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mehadi Hasan', 'mehadi8049@gmail.com', '2024-07-16 20:49:39', '$2y$10$npIcAK7APorV3ngETebY9u0moRPnybxBtRek/g5M5ccDpfr6TZOg.', 'ameid3ruVQ', '2024-07-16 20:49:39', '2024-07-16 20:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `id` bigint UNSIGNED NOT NULL,
  `year` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `year`, `created_at`, `updated_at`) VALUES
(1, '২০০৬-২০০৭', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(2, '২০০৭-২০০৮', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(3, '২০০৮-২০০৯', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(4, '২০০৯-২০১০', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(5, '২০১০-২০১১', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(6, '২০১১-২০১২', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(7, '২০১২-২০১৩', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(8, '২০১৩-২০১৪', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(9, '২০১৪-২০১৫', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(10, '২০১৫-২০১৬', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(11, '২০১৬-২০১৭', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(12, '২০১৭-২০১৮', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(13, '২০১৮-২০১৯', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(14, '২০১৯-২০২০', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(15, '২০২০-২০২১', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(16, '২০২১-২০২২', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(17, '২০২২-২০২৩', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(18, '২০২৩-২০২৪', '2024-07-16 20:49:39', '2024-07-16 20:49:39'),
(19, '২০২৪-২০২৫', '2024-07-16 20:49:39', '2024-07-16 20:49:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `codes_code_unique` (`code`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fees`
--
ALTER TABLE `fees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fees_code_id_foreign` (`code_id`),
  ADD KEY `fees_year_id_foreign` (`year_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `years_year_unique` (`year`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `codes`
--
ALTER TABLE `codes`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fees`
--
ALTER TABLE `fees`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fees`
--
ALTER TABLE `fees`
  ADD CONSTRAINT `fees_code_id_foreign` FOREIGN KEY (`code_id`) REFERENCES `codes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fees_year_id_foreign` FOREIGN KEY (`year_id`) REFERENCES `years` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
