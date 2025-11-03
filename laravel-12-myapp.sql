-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 03, 2025 at 07:10 AM
-- Server version: 8.0.31
-- PHP Version: 8.1.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laravel-12-myapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_11_02_161649_create_personal_access_tokens_table', 1),
(5, '2025_11_02_163642_create_products_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'web-token', '244eaeeeb78699133a78b58fc3a887eb41a7052ce62dd58da36823e3db0f625a', '[\"*\"]', '2025-11-03 18:12:06', NULL, '2025-11-03 18:12:05', '2025-11-03 18:12:06'),
(2, 'App\\Models\\User', 1, 'web-token', '78f4f981c52484a0168eae048d2254e133ae838ce52f2fe597e5cb3535c8e5cb', '[\"*\"]', '2025-11-03 18:12:08', NULL, '2025-11-03 18:12:08', '2025-11-03 18:12:08'),
(3, 'App\\Models\\User', 1, 'web-token', '810e9613ea5c16f6d5afbf37d26f5f1720b4ba694caba498d1c1f8909cce209a', '[\"*\"]', '2025-11-03 18:26:55', NULL, '2025-11-03 18:26:40', '2025-11-03 18:26:55'),
(4, 'App\\Models\\User', 1, 'web-token', '09b790ce90c76a4574515aeb463dfae115ffe70a3fe784ade732ef7029168165', '[\"*\"]', '2025-11-03 18:27:19', NULL, '2025-11-03 18:27:11', '2025-11-03 18:27:19'),
(5, 'App\\Models\\User', 1, 'web-token', '10ade3c4d7304f46163ffbbdd2635aea4844b0c60b08ef965533659c46981c85', '[\"*\"]', '2025-11-03 18:27:22', NULL, '2025-11-03 18:27:21', '2025-11-03 18:27:22'),
(6, 'App\\Models\\User', 1, 'web-token', 'b50fe052ee61f451a87f43811a4964d033f510398f445c168a206ed7e26e893a', '[\"*\"]', '2025-11-03 18:27:27', NULL, '2025-11-03 18:27:26', '2025-11-03 18:27:27'),
(7, 'App\\Models\\User', 1, 'web-token', '44ee4cb6a2ab0e8a9e4f599ca7faed760036233f90366478e6e9f2bf1ba47e05', '[\"*\"]', '2025-11-03 18:29:10', NULL, '2025-11-03 18:29:10', '2025-11-03 18:29:10'),
(8, 'App\\Models\\User', 1, 'web-token', 'acf6eaa00b42e056acf524066af9880490b8dd79fa90aa269084b8924bff574a', '[\"*\"]', '2025-11-03 18:33:35', NULL, '2025-11-03 18:33:35', '2025-11-03 18:33:35'),
(9, 'App\\Models\\User', 1, 'web-token', '71ea179242f2f355227feae0bb9502c044f33d46a7d059646f8c3e20596821e1', '[\"*\"]', '2025-11-03 18:35:14', NULL, '2025-11-03 18:35:14', '2025-11-03 18:35:14'),
(10, 'App\\Models\\User', 1, 'web-token', 'b32424e32a26c44ae63a547f4b53c620eb31cb6f648e6da7e9e4030a9a63a3b2', '[\"*\"]', '2025-11-03 18:36:05', NULL, '2025-11-03 18:36:05', '2025-11-03 18:36:05'),
(11, 'App\\Models\\User', 1, 'web-token', 'adcccd6cbeffbe2aca204224752b9ea22dbba3444446903e687510490547dcc8', '[\"*\"]', '2025-11-03 18:42:02', NULL, '2025-11-03 18:42:02', '2025-11-03 18:42:02'),
(12, 'App\\Models\\User', 1, 'web-token', '73a3a5ae67bb11ecf5edbd25e2d3c3744fd28643151385bbb55b96ed2651d910', '[\"*\"]', '2025-11-03 18:42:43', NULL, '2025-11-03 18:42:43', '2025-11-03 18:42:43'),
(13, 'App\\Models\\User', 1, 'web-token', '4597d8f1389ca5beb7934bc8f994201297da7800f0fb3812b10d80e1ca1ca6ac', '[\"*\"]', '2025-11-03 18:44:18', NULL, '2025-11-03 18:44:17', '2025-11-03 18:44:18'),
(14, 'App\\Models\\User', 1, 'web-token', '9792137c1f1f9b4eb7572d342acb6a9c46e008b0979f44a5fb1171b7089b1656', '[\"*\"]', '2025-11-03 18:45:47', NULL, '2025-11-03 18:45:47', '2025-11-03 18:45:47'),
(15, 'App\\Models\\User', 1, 'web-token', '899a79834e5e7402645cbe19f4ae9384918a5ee5d0bbf8e1e31c9c0846ec2120', '[\"*\"]', '2025-11-03 18:47:25', NULL, '2025-11-03 18:47:24', '2025-11-03 18:47:25'),
(16, 'App\\Models\\User', 1, 'web-token', 'fc6fd33b214d8625504f04d6053c15b8982b2820df233a53cb881f04a35ccc63', '[\"*\"]', '2025-11-03 18:48:07', NULL, '2025-11-03 18:48:03', '2025-11-03 18:48:07'),
(17, 'App\\Models\\User', 1, 'web-token', '2171bfd2777d73b7c08b0055ddc17c0813ad6b7a2f3df62c43f35b68a2500e32', '[\"*\"]', '2025-11-03 18:48:56', NULL, '2025-11-03 18:48:48', '2025-11-03 18:48:56'),
(18, 'App\\Models\\User', 1, 'web-token', 'f7d290a852409a3aa02dc7f368427afa0799091ebadf49b709c4fdc16b2b06a1', '[\"*\"]', '2025-11-03 18:50:08', NULL, '2025-11-03 18:49:49', '2025-11-03 18:50:08'),
(19, 'App\\Models\\User', 1, 'web-token', '691cbe400b885200748b795dd9c81b9e9544bdf05f3f94f46009f7cb103fe40b', '[\"*\"]', '2025-11-03 19:02:59', NULL, '2025-11-03 19:02:59', '2025-11-03 19:02:59'),
(20, 'App\\Models\\User', 1, 'web-token', 'f285d83d4c66184d3487ca75035d45c907a3bed0bff1598d882033cf50b504f0', '[\"*\"]', '2025-11-03 19:03:30', NULL, '2025-11-03 19:03:29', '2025-11-03 19:03:30'),
(21, 'App\\Models\\User', 1, 'web-token', 'bc21e987bc7b75209a3d187d2d464bf5bd67ead7699ccca49be0996518087bc8', '[\"*\"]', '2025-11-03 19:03:53', NULL, '2025-11-03 19:03:53', '2025-11-03 19:03:53'),
(22, 'App\\Models\\User', 1, 'web-token', 'e1640de660e1ab85b2006ca500170ea7eed93c6002ac0f3ccdcc52129e13ddb2', '[\"*\"]', '2025-11-03 19:04:09', NULL, '2025-11-03 19:04:08', '2025-11-03 19:04:09'),
(23, 'App\\Models\\User', 1, 'web-token', '9a73954a7aea04940fa12537d54c8ee802cb9692f618d8857769c8fa9272e6be', '[\"*\"]', '2025-11-03 19:04:57', NULL, '2025-11-03 19:04:54', '2025-11-03 19:04:57'),
(24, 'App\\Models\\User', 1, 'web-token', '678b0a04a375b8917cfbe84dd0e8a829803a7007de85dc5379b1406913040de2', '[\"*\"]', '2025-11-03 19:05:02', NULL, '2025-11-03 19:05:00', '2025-11-03 19:05:02'),
(25, 'App\\Models\\User', 1, 'web-token', '21206ec96a6c9aad7b013ee2fcb8785f5348b1e9eaaa6f3acc3ccc5786ed2639', '[\"*\"]', '2025-11-03 19:05:05', NULL, '2025-11-03 19:05:05', '2025-11-03 19:05:05'),
(26, 'App\\Models\\User', 1, 'web-token', 'bc4192688144f4abd4b8e7a3bcc612247414070bffc9c76d734c8aadde5a52ed', '[\"*\"]', '2025-11-03 19:05:56', NULL, '2025-11-03 19:05:49', '2025-11-03 19:05:56'),
(27, 'App\\Models\\User', 1, 'web-token', '23f9b0c0946dc0b2c52bc33186959f912fee4d8be6f7bda5ccb1dc36caa79172', '[\"*\"]', '2025-11-03 19:07:48', NULL, '2025-11-03 19:07:47', '2025-11-03 19:07:48'),
(28, 'App\\Models\\User', 1, 'web-token', '30c1253409f7f6d92996cc4d71b324d43fb8ce8da9134237038f95b41fb60c8a', '[\"*\"]', '2025-11-03 19:07:51', NULL, '2025-11-03 19:07:50', '2025-11-03 19:07:51'),
(29, 'App\\Models\\User', 1, 'web-token', '77ef30066048d7bbbd3efa5083dee8014608deda89630350d6fe9fa7e6e63b02', '[\"*\"]', '2025-11-03 19:08:01', NULL, '2025-11-03 19:07:53', '2025-11-03 19:08:01'),
(30, 'App\\Models\\User', 1, 'web-token', 'db45ff6572da32770a603f12bc1c8f4ac64fd9c7b06d15c1355599ac8af0ef32', '[\"*\"]', '2025-11-03 19:08:08', NULL, '2025-11-03 19:08:08', '2025-11-03 19:08:08'),
(31, 'App\\Models\\User', 1, 'web-token', '94939ebdb671b6cc966c7c841527c766445cce6d5018b09cee0ea3dba04c917d', '[\"*\"]', '2025-11-03 19:08:11', NULL, '2025-11-03 19:08:11', '2025-11-03 19:08:11'),
(32, 'App\\Models\\User', 1, 'web-token', 'e1fb63d7d95a0df6f9c077cb970687c5b739da041a15fbbfb80364d92dfe328a', '[\"*\"]', '2025-11-03 19:08:14', NULL, '2025-11-03 19:08:13', '2025-11-03 19:08:14'),
(33, 'App\\Models\\User', 1, 'web-token', '671d0526bc6ad3e2ded70630075f136d7760709141a4d71a65259c01bf977868', '[\"*\"]', '2025-11-03 19:08:25', NULL, '2025-11-03 19:08:25', '2025-11-03 19:08:25'),
(34, 'App\\Models\\User', 1, 'web-token', '9def7d58a960a101f2c4c90b8278444bdb3444cde87a3b4344adc42936abf21e', '[\"*\"]', '2025-11-03 19:08:36', NULL, '2025-11-03 19:08:35', '2025-11-03 19:08:36'),
(35, 'App\\Models\\User', 1, 'web-token', '4441f317a39cd25d3ac91b4e2f9e9a45572d5ff1e2067a474e461fe7c961a966', '[\"*\"]', '2025-11-03 19:10:00', NULL, '2025-11-03 19:10:00', '2025-11-03 19:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `user_id`, `name`, `description`, `image`, `price`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 29, 'ut eum et', 'Perferendis voluptas in reprehenderit excepturi voluptatum voluptatem ratione qui doloremque sunt.', NULL, '767.65', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(2, 19, 'repellendus recusandae nam', 'Accusantium dolorem consequatur omnis facilis numquam quasi qui corporis quasi labore.', NULL, '1234.16', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(3, 5, 'natus sequi odit', 'Et est doloremque sequi pariatur eum molestiae quis adipisci qui enim perspiciatis sed.', NULL, '389.24', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(4, 39, 'fugit sint culpa', 'Consectetur fugiat quia omnis consectetur eligendi velit quia quam incidunt quae expedita nisi at inventore sunt.', NULL, '1937.76', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(5, 19, 'asperiores eius similique', 'Porro aliquam iure quaerat aut molestiae tenetur qui excepturi.', NULL, '3505.24', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(6, 14, 'vero laborum ipsum', 'Maiores accusantium sint quo modi explicabo iste expedita ipsam ipsum laborum maiores alias minus porro doloribus qui.', NULL, '2589.57', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(7, 44, 'animi expedita ut', 'Laboriosam at voluptatem enim architecto voluptatum non delectus voluptatum molestiae.', NULL, '4429.23', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(8, 27, 'sint magnam iste', 'Quae ratione dicta ut quo soluta repellendus sed voluptatum qui.', NULL, '4651.37', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(9, 22, 'tenetur quaerat voluptatem', 'Consequatur quasi hic voluptatibus rerum ea distinctio et eos sit adipisci laboriosam rerum ratione.', NULL, '1736.74', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(10, 31, 'magnam repudiandae qui', 'Consequatur omnis rerum tenetur et recusandae sapiente sit nam quod ipsa.', NULL, '913.06', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(11, 6, 'aliquam debitis sed', 'Quas voluptate et non debitis est incidunt porro et doloremque unde id perspiciatis in voluptatem.', NULL, '3943.89', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(12, 7, 'aliquam numquam laudantium', 'Blanditiis omnis eaque cupiditate dolor illo quibusdam excepturi voluptatem voluptatem.', NULL, '4647.17', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(13, 11, 'in eum aut', 'Soluta consequuntur ad minima veritatis ad est enim.', NULL, '4082.80', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(14, 24, 'quaerat architecto nam', 'Laudantium reprehenderit modi soluta sequi beatae sed iste maxime excepturi.', NULL, '1576.50', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(15, 46, 'nesciunt quis ut', 'Perferendis fugiat non tempora quia sit velit qui fuga et vero.', NULL, '3568.27', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(16, 29, 'ut ut accusantium', 'Consequatur qui cupiditate est nemo qui odit eum sit minus vitae.', NULL, '3568.27', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(17, 48, 'id aperiam ipsam', 'Eos sunt eaque veritatis commodi explicabo dolorem eum omnis impedit vel dolores est odio.', NULL, '2097.10', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(18, 32, 'quia ad molestiae', 'Nobis perspiciatis vel voluptas tempore quod inventore cupiditate consequatur optio officia.', NULL, '3144.93', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(19, 24, 'quo quidem voluptas', 'Earum voluptatum vitae consequatur non aut temporibus enim inventore quisquam quibusdam sed corrupti.', NULL, '1083.90', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(20, 11, 'temporibus et nobis', 'Pariatur odit saepe sit voluptates quia molestiae laborum distinctio sed aspernatur est maxime quia asperiores excepturi.', NULL, '4664.61', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(21, 27, 'ad doloremque et', 'Provident vero itaque neque in veniam ea quia recusandae quis velit distinctio.', NULL, '2762.71', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(22, 20, 'non tempore consequatur', 'Aut quo assumenda eaque possimus aut ea ut voluptates aliquam possimus repellat.', NULL, '3636.82', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(23, 3, 'consequatur voluptas voluptas', 'Fugit modi et magnam beatae quo vitae ratione nulla aspernatur excepturi dolorem corporis error itaque omnis.', NULL, '2426.52', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(24, 3, 'sunt expedita dolor', 'Ut animi reprehenderit id deleniti eligendi adipisci consectetur voluptatem nemo cupiditate est totam deserunt voluptas ut.', NULL, '2224.97', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(25, 38, 'nostrum dolorem dolor', 'Autem nobis deserunt quo vitae quia ea corrupti occaecati sint.', NULL, '3653.82', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(26, 44, 'veritatis velit voluptatibus', 'Alias et dignissimos ut sint consequatur et assumenda voluptatem vel.', NULL, '3665.61', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(27, 34, 'ea at autem', 'Deserunt consectetur et hic rerum voluptatem blanditiis accusamus minima vitae voluptatem autem nemo placeat est.', NULL, '3444.39', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(28, 26, 'voluptatum velit perferendis', 'Voluptas quidem numquam iure sint ut impedit ab tenetur delectus optio est et possimus atque repellat et.', NULL, '1657.14', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(29, 47, 'fuga nisi debitis', 'Harum voluptatem iste tempore fugiat qui ea et omnis neque.', NULL, '3243.25', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(30, 12, 'similique eaque praesentium', 'Illo nemo non fugit pariatur omnis perspiciatis nihil animi iusto.', NULL, '469.54', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(31, 2, 'exercitationem necessitatibus et', 'Occaecati sed quidem nesciunt quod et voluptas molestiae deleniti at nostrum nihil.', NULL, '558.10', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(32, 5, 'et et ducimus', 'Laboriosam occaecati id voluptatem consequatur amet et nemo ut quo nam et impedit.', NULL, '4214.66', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(33, 11, 'magni atque aut', 'Officia maiores qui ab veniam et voluptas minima eum tempore quibusdam distinctio.', NULL, '3191.30', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(34, 13, 'possimus dicta totam', 'Voluptatem quasi natus sint eius fuga quia voluptatum possimus ea pariatur perferendis fugiat et et.', NULL, '217.47', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(35, 31, 'ut nesciunt omnis', 'Saepe quo dolor praesentium est omnis totam aut quibusdam quam ipsum consequatur nihil neque et accusamus qui.', NULL, '1590.91', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(36, 51, 'consequatur quibusdam iusto', 'Iusto iure voluptas sint consequatur distinctio molestias dolor expedita optio.', NULL, '3355.06', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(37, 44, 'non ipsa eius', 'Non aut voluptate in aperiam corrupti sit consectetur molestiae ex reiciendis.', NULL, '357.38', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(38, 10, 'sunt ut dolor', 'Consequatur rem voluptatem eveniet architecto voluptas tempora quis qui ea molestiae expedita voluptatibus quia autem.', NULL, '4078.27', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(39, 48, 'laborum aut eveniet', 'Molestias similique laborum quia excepturi reiciendis aut quasi eum rerum excepturi rerum laborum.', NULL, '3203.32', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(40, 49, 'earum fugit vel', 'Quibusdam repudiandae reiciendis autem similique itaque eos pariatur labore non ratione totam consequatur.', NULL, '3664.03', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(41, 26, 'rerum et iure', 'Sint qui commodi consequatur sed perspiciatis officia cumque eum dolore est ullam nam et.', NULL, '812.77', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(42, 6, 'rem et non', 'Unde cum doloremque numquam rerum voluptas quo maiores ut ea quo repudiandae consequatur maxime pariatur.', NULL, '4357.06', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(43, 14, 'dolorem autem et', 'Nisi quas repudiandae nobis pariatur earum unde et optio.', NULL, '931.72', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(44, 29, 'ea et quia', 'Vel rerum nihil dolorem eveniet id molestias nihil dolorem sunt totam veritatis consectetur doloremque dignissimos facilis.', NULL, '1550.95', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(45, 21, 'fuga laboriosam ea', 'Numquam consectetur vero suscipit cupiditate illo iste doloremque impedit.', NULL, '4848.03', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(46, 51, 'molestias et officiis', 'Similique corporis quo quia veritatis neque ut corrupti aliquid repellat blanditiis qui.', NULL, '879.60', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(47, 44, 'ad assumenda eligendi', 'Sit dolorem voluptatem consequatur delectus qui tempore temporibus.', NULL, '1585.64', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(48, 28, 'et vel expedita', 'Laboriosam eum dolores dolorum voluptates maxime praesentium expedita illum repellendus a voluptatem voluptatibus non quia.', NULL, '2819.82', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(49, 40, 'ex aliquam eum', 'Dolores est facere omnis nemo eligendi laudantium et nemo fugit vero.', NULL, '3405.10', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(50, 1, 'eveniet esse consequatur', 'Aut similique in aut autem quae ea voluptatem doloribus voluptatem.', NULL, '4877.55', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(51, 29, 'magnam adipisci nihil', 'Voluptate dicta deleniti et laboriosam dolore aut non iusto rerum asperiores sed error.', NULL, '655.32', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(52, 26, 'omnis quo voluptas', 'Nisi dignissimos quaerat iusto quaerat animi distinctio aut.', NULL, '2678.52', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(53, 5, 'est beatae quod', 'Quidem dicta temporibus earum qui ipsam nostrum quia vitae vel aut sed quia sit et sunt.', NULL, '4693.31', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(54, 43, 'reprehenderit saepe distinctio', 'Assumenda architecto facilis laborum alias deserunt animi ipsam ex dicta vel.', NULL, '1122.60', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(55, 37, 'quisquam ut quod', 'Consequatur et autem aut consequuntur consequatur sit quod amet voluptas excepturi rerum ullam.', NULL, '403.99', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(56, 23, 'nesciunt eos et', 'Voluptas ratione ducimus ullam ea ut debitis eum sint assumenda culpa autem aliquam voluptatem eaque quas.', NULL, '2061.70', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(57, 5, 'assumenda inventore repellendus', 'Doloremque voluptas quia expedita exercitationem ut aperiam rem nostrum deserunt et dolore et.', NULL, '2686.94', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(58, 51, 'ullam quam dignissimos', 'Ex doloribus totam rerum deserunt eum in incidunt.', NULL, '3278.11', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(59, 50, 'nam ipsam maiores', 'Sit id enim culpa suscipit aut sit incidunt quibusdam.', NULL, '1150.10', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(60, 14, 'commodi rerum aut', 'Nemo repellendus itaque optio dolorem in nam perferendis vel enim aut atque.', NULL, '233.16', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(61, 2, 'maiores quia consequuntur', 'Dicta sint fugiat repellat esse tenetur qui temporibus a illo ipsam repudiandae natus.', NULL, '1895.09', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(62, 40, 'iste qui maiores', 'Sit ducimus sed excepturi pariatur iusto illum occaecati voluptas.', NULL, '2265.27', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(63, 49, 'omnis voluptas ipsam', 'Illo est numquam minus pariatur enim laborum enim eligendi ut voluptates quas aliquid voluptatem et.', NULL, '1911.76', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(64, 28, 'aspernatur sit est', 'Eos magnam ratione laudantium itaque facilis non consequatur.', NULL, '4938.74', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(65, 42, 'veritatis reiciendis ut', 'Perspiciatis vel explicabo dolorum consequatur rem optio eos magnam ab expedita ipsa similique.', NULL, '875.09', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(66, 48, 'deleniti voluptatum fuga', 'Aut earum omnis dolorem consequatur cupiditate esse magni non qui eligendi repellat veniam dolorem voluptas in aspernatur.', NULL, '2121.11', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(67, 10, 'maiores libero maiores', 'Quos corrupti facilis enim sed suscipit itaque eum voluptatum quas a ut et labore hic.', NULL, '2685.37', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(68, 19, 'dolore recusandae non', 'Error dolores non aut sunt laborum est maxime molestias sed dolorum tempore qui.', NULL, '1893.43', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(69, 49, 'cupiditate voluptas quod', 'Ullam sequi voluptatem quod perferendis vitae optio molestiae inventore tempore nam eos porro placeat earum quis est.', NULL, '530.83', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(70, 49, 'nulla blanditiis ratione', 'Quia incidunt quis earum omnis voluptatem quaerat odio est modi ut expedita commodi.', NULL, '1710.54', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(71, 37, 'animi vero dignissimos', 'Et enim voluptatem quis ipsam eum sed id molestiae est aliquam rerum voluptate quia amet.', NULL, '1934.58', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(72, 25, 'ratione voluptas aut', 'Delectus nihil corrupti et est quo alias fugit quidem sed enim animi deserunt.', NULL, '2649.69', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(73, 33, 'vel nisi eveniet', 'Esse et consequuntur veritatis delectus repellendus minus qui et quidem laudantium eum perspiciatis aut animi.', NULL, '4682.42', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(74, 49, 'quo minima laborum', 'Qui nobis cumque facere iusto aliquam vel quidem nihil odit consequatur.', NULL, '2335.51', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(75, 41, 'maiores voluptatum aliquid', 'Quo dicta in eaque omnis nobis inventore necessitatibus nesciunt et temporibus sunt quaerat et.', NULL, '619.59', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(76, 1, 'excepturi suscipit reiciendis', 'Officiis sed voluptatem deserunt nobis dicta magnam qui ullam ea tempore ea numquam enim consectetur.', NULL, '4191.92', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(77, 30, 'minima distinctio et', 'Sapiente iure quia nesciunt quos labore eaque quas aliquam est perspiciatis.', NULL, '4688.65', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(78, 43, 'nihil ut sapiente', 'Culpa eos alias quibusdam saepe voluptate nostrum aut quia.', NULL, '3808.44', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(79, 2, 'velit velit autem', 'Quia et eum eos eaque voluptatem rerum magni est qui consectetur qui in tenetur.', NULL, '2949.82', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(80, 35, 'qui quasi quaerat', 'Delectus qui dicta doloribus inventore id aut et libero fugiat maiores in facere suscipit et autem.', NULL, '3121.85', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(81, 24, 'veniam repellat provident', 'Deleniti nam quidem rerum ratione enim quis ab.', NULL, '3537.45', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(82, 32, 'recusandae sint quod', 'Et magni illo in corporis sit est aut eos sunt officia minus et aut.', NULL, '1063.96', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(83, 20, 'illo et est', 'Aspernatur corporis quisquam provident est voluptate praesentium at voluptate tempore commodi optio omnis praesentium.', NULL, '2927.31', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(84, 13, 'qui dolores quibusdam', 'Earum excepturi nesciunt officiis aliquam recusandae aliquid dolores veritatis soluta autem sunt eaque dolores dolor.', NULL, '1274.17', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(85, 1, 'harum voluptates rerum', 'Dolore consequatur aut ducimus illo excepturi omnis est veritatis qui.', NULL, '253.97', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(86, 19, 'voluptate dolores voluptatibus', 'Sint aut a sit veritatis occaecati nisi sed rerum eos delectus autem sit.', NULL, '1058.25', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(87, 31, 'quibusdam velit corporis', 'Aliquam aut pariatur non quasi incidunt aut provident ab reiciendis ut iure minus odio.', NULL, '4430.76', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(88, 20, 'alias dolorem praesentium', 'Commodi ratione debitis nihil facere ut recusandae velit ad placeat voluptas.', NULL, '1986.05', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(89, 11, 'explicabo atque fugiat', 'Vitae non culpa consequatur ut recusandae rerum dolorem.', NULL, '4096.75', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(90, 33, 'dolore quia illo', 'Quo aperiam vitae libero qui et magni fugiat sed soluta sapiente beatae voluptatem in earum animi porro.', NULL, '2980.98', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(91, 18, 'quibusdam nulla id', 'Qui qui vitae quia sint et perferendis eum eaque rerum est eius sit.', NULL, '706.51', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(92, 24, 'laboriosam nihil reiciendis', 'Nihil cum consequatur eos distinctio autem quaerat voluptatem repellendus quo amet dolorem ad sed.', NULL, '3083.86', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(93, 26, 'rem nesciunt numquam', 'Quas temporibus possimus illum iure ratione et dicta quo itaque.', NULL, '875.36', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(94, 32, 'corporis autem quod', 'Est voluptatem qui ea corrupti cum et deserunt reprehenderit est expedita esse placeat omnis commodi tempora.', NULL, '3786.67', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(95, 3, 'nostrum dolore eum', 'Omnis est ut odit itaque nihil eum hic officia nihil voluptates et necessitatibus ut.', NULL, '4924.26', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(96, 31, 'ab vitae cupiditate', 'Voluptates et dolorem perferendis architecto ea voluptatem quo esse et alias ut dolores consectetur dolorem quia.', NULL, '1817.61', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(97, 1, 'sint eos ut', 'Nihil nihil minima ipsum nesciunt ut quia quos et possimus quo mollitia earum tempore delectus et aut.', NULL, '1377.41', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(98, 15, 'cupiditate molestias doloribus', 'Provident molestiae ab ut placeat dolorum non occaecati id sed et voluptatum ut libero.', NULL, '2717.60', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(99, 26, 'est rerum eos', 'Qui quia sunt itaque laboriosam dignissimos vitae dolor neque ea.', NULL, '4298.40', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(100, 22, 'ut ut corporis', 'Voluptatum quisquam nobis ullam repellat magnam dolor et omnis saepe est sed a vitae ut quo.', NULL, '3913.93', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(101, 2, 'dolores porro quis', 'Qui consectetur repellat perspiciatis eligendi accusamus nemo rerum sit eius officiis est architecto est dolorum repellat.', NULL, '4414.04', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(102, 15, 'asperiores fugiat assumenda', 'Omnis sit voluptatem dolor sapiente soluta molestias vel voluptatem omnis distinctio voluptatem.', NULL, '1506.82', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(103, 37, 'autem tempora iste', 'Sunt culpa blanditiis quidem perspiciatis ipsam saepe nostrum amet temporibus adipisci id commodi aut eaque ut.', NULL, '985.08', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(104, 43, 'a quaerat dolorem', 'Minima unde officia dolores iure maiores ea minus.', NULL, '3148.26', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(105, 41, 'nihil tempore similique', 'Dolorem sit eaque atque ut non ut repellat fugiat qui.', NULL, '4293.71', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(106, 23, 'quibusdam esse atque', 'Repudiandae nobis hic repellendus ipsam quidem facilis laborum facilis saepe.', NULL, '3658.88', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(107, 2, 'omnis voluptatum sunt', 'Suscipit adipisci molestias recusandae qui hic quisquam quae et assumenda similique aut facilis.', NULL, '364.29', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(108, 47, 'nostrum dolor sed', 'Consequatur consequatur laboriosam possimus modi eos officiis sed optio praesentium recusandae accusamus vitae et maiores.', NULL, '443.98', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(109, 50, 'fugit et dolores', 'Culpa quas sint commodi velit nihil laudantium beatae sit nam aliquam sit hic.', NULL, '1286.73', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(110, 27, 'error dolorum ut', 'Voluptatum et fuga cupiditate velit deserunt ipsa commodi molestias nulla et et voluptatem.', NULL, '4863.03', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(111, 4, 'dolorum et est', 'Eaque dolorem quaerat ut minus eum et mollitia et consectetur aliquam ipsa sunt.', NULL, '2624.56', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(112, 2, 'natus tempora cum', 'Rerum ipsa quia animi deleniti impedit iste repellat qui soluta nobis magnam praesentium fuga quia.', NULL, '4893.72', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(113, 6, 'nisi quisquam aut', 'Omnis at explicabo qui recusandae nihil aut consequatur.', NULL, '3724.23', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(114, 27, 'vero earum asperiores', 'Quis sapiente est veniam vero inventore qui voluptatem aliquam culpa dolor reprehenderit cupiditate fuga consequatur.', NULL, '3672.26', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(115, 7, 'aut neque quia', 'Ipsam quo sed vero tenetur qui omnis dolore facere iure ea ut.', NULL, '1187.47', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(116, 9, 'placeat quas deserunt', 'Libero laborum et cum eos dolor ut sit eos non.', NULL, '78.06', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(117, 24, 'quaerat ducimus non', 'Id explicabo et voluptates dolorem velit et adipisci quod minima neque qui autem.', NULL, '376.67', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(118, 12, 'consectetur sequi dolores', 'Beatae excepturi qui ipsa molestias ea error aut est aut.', NULL, '248.82', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(119, 37, 'corrupti ab recusandae', 'Neque recusandae ut possimus expedita dolore officia officiis iste alias quia odit et enim quae.', NULL, '1682.84', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(120, 17, 'reprehenderit ut distinctio', 'Fugit facere cupiditate ducimus eos et quia sequi voluptatem.', NULL, '4539.51', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(121, 23, 'et nihil saepe', 'Error nihil a architecto esse et omnis minima ut.', NULL, '2016.45', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(122, 33, 'voluptates suscipit quia', 'Pariatur ad voluptatem et repellendus sit nam aut iure vero consectetur quo accusamus.', NULL, '1992.85', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(123, 2, 'iste eius libero', 'Quia modi aut sint eos neque dolores cumque est dolor placeat sed consequatur eos pariatur architecto in.', NULL, '117.85', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(124, 50, 'porro doloribus maxime', 'Neque rerum consequuntur voluptatem reprehenderit et sit est voluptatem dolor deserunt assumenda facere esse qui est.', NULL, '4431.35', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(125, 16, 'nulla similique quisquam', 'Veniam quis expedita deserunt occaecati alias ad consequatur.', NULL, '3408.14', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(126, 8, 'sunt voluptas vel', 'Aperiam quam odit qui sunt est mollitia delectus consequuntur incidunt rerum et.', NULL, '1893.29', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(127, 19, 'nisi dolores nulla', 'Voluptatum tempore qui sint nobis beatae sint qui.', NULL, '2903.43', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(128, 7, 'labore sequi blanditiis', 'Recusandae libero quidem repudiandae ab dolore et molestiae odio et nemo praesentium fuga repellat saepe doloremque.', NULL, '4208.25', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(129, 36, 'dolorem quisquam voluptate', 'Eum est eius omnis numquam officia facilis sit et voluptates hic recusandae porro repellat impedit neque et.', NULL, '1718.21', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(130, 40, 'deserunt eaque vero', 'Autem odit non ab nobis optio in consectetur in et ut autem quisquam qui laudantium rerum.', NULL, '4179.17', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(131, 7, 'architecto expedita vel', 'Veritatis occaecati et sapiente vel et rerum ex est explicabo quidem aut aut similique laudantium.', NULL, '427.69', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(132, 3, 'sed ea quod', 'Enim in sapiente recusandae molestias sint possimus beatae dolores consequatur.', NULL, '3450.43', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(133, 47, 'qui ut odio', 'Qui magni et omnis placeat iste facere quibusdam praesentium enim quasi voluptatibus vel sit nostrum.', NULL, '339.35', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(134, 32, 'deserunt voluptatem neque', 'Vel assumenda minus quos qui voluptatem repudiandae ut qui aut nobis et ut fuga earum enim.', NULL, '1062.03', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(135, 22, 'voluptatibus et accusantium', 'Repellendus similique non id deleniti minima tempore quis aut veniam sed.', NULL, '1996.49', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(136, 4, 'nesciunt sit ad', 'Quibusdam minus voluptatem quia consequatur corrupti consequatur porro magnam ut quisquam illum porro voluptas libero dolorum dolor.', NULL, '4452.10', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(137, 34, 'saepe maiores commodi', 'Fugit ut in aut voluptatem quis explicabo tempore perspiciatis voluptatem repellat consequuntur vitae nesciunt.', NULL, '3816.14', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(138, 50, 'laborum molestias soluta', 'Consequatur beatae animi id sint atque fugit non corrupti nostrum perspiciatis non non deleniti vel.', NULL, '1675.76', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(139, 35, 'quisquam beatae itaque', 'Voluptas numquam reprehenderit aut sequi rerum impedit amet et sit exercitationem.', NULL, '2967.42', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(140, 43, 'saepe ut omnis', 'Illo dignissimos odit perspiciatis aliquid rem consequuntur laboriosam ut nihil asperiores.', NULL, '2164.79', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(141, 11, 'aut illum laudantium', 'Suscipit similique sint dolore illum illum ad unde.', NULL, '100.01', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(142, 35, 'corporis sequi velit', 'Qui neque a et consectetur enim eos sapiente quia sequi laudantium sit maxime et et cum possimus.', NULL, '2477.25', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(143, 21, 'delectus placeat nemo', 'In saepe aut inventore voluptatem deleniti facilis deserunt eum ex quas ut alias blanditiis voluptatem non similique.', NULL, '3561.95', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(144, 32, 'dolore qui magni', 'Est adipisci eum est consequatur mollitia dolores sit excepturi.', NULL, '665.13', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(145, 23, 'suscipit enim quia', 'Facere non et hic cumque eum dolore non dolores.', NULL, '191.92', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(146, 35, 'rerum sint et', 'Ipsam ex facilis itaque qui quidem officia odit aliquid at magnam atque ut suscipit et eum odit.', NULL, '1132.25', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(147, 28, 'ipsam ipsam ex', 'Dolorum architecto possimus est quam natus excepturi sed consectetur quidem autem.', NULL, '2265.70', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(148, 4, 'rerum consequuntur eum', 'Est ducimus a officiis soluta excepturi aliquam delectus.', NULL, '1447.12', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(149, 31, 'reprehenderit sint adipisci', 'Aut similique suscipit corrupti voluptatem quis aperiam totam cupiditate.', NULL, '699.82', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(150, 38, 'error blanditiis rerum', 'Reiciendis harum recusandae quae numquam est repellat voluptate eveniet sit qui a culpa dicta ipsa nam ratione.', NULL, '1004.71', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(151, 24, 'itaque qui qui', 'Magnam pariatur iusto labore fuga fugiat sunt nisi sequi quis.', NULL, '2707.64', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(152, 26, 'nisi aspernatur ipsum', 'Sit voluptas sit id et laborum cum rerum exercitationem sit et omnis voluptatem illo.', NULL, '988.67', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(153, 47, 'placeat voluptatum est', 'Quia aut non et aspernatur qui harum sit ipsa quam distinctio reprehenderit dignissimos provident.', NULL, '2982.71', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(154, 16, 'et veniam qui', 'Ipsum occaecati molestiae aut vitae sint explicabo minus iusto deleniti inventore in tempora.', NULL, '3040.88', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(155, 29, 'dicta mollitia beatae', 'Voluptatum consectetur est dolores vel laborum consequatur veritatis dolorem iste voluptatum autem quia.', NULL, '2476.29', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(156, 2, 'temporibus perferendis ut', 'Libero assumenda ratione ut consequuntur at qui illum fugiat labore et nesciunt.', NULL, '3259.09', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(157, 44, 'impedit laboriosam eveniet', 'Eius alias nobis rerum qui consectetur ex dolorum omnis in tenetur laboriosam est consequatur.', NULL, '4701.51', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(158, 14, 'voluptatem deserunt tempore', 'Qui ut fuga id sed doloribus aut consequatur nam aut ipsum eos dolores cumque commodi illum.', NULL, '216.56', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(159, 45, 'magnam inventore animi', 'Reiciendis voluptas eos et aliquid omnis tempora ut at ea nam autem labore non error.', NULL, '2405.13', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(160, 43, 'repudiandae voluptate odit', 'Quam magnam ut corrupti et deserunt quidem velit non aliquam dolor facere inventore.', NULL, '727.00', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(161, 33, 'voluptatem qui harum', 'Cupiditate et odit vitae blanditiis assumenda et quia natus distinctio accusamus minus et itaque et dolores.', NULL, '3768.98', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(162, 51, 'tempora dolorem explicabo', 'Exercitationem nam aliquid impedit quia voluptas labore aut error ut.', NULL, '4721.63', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(163, 6, 'quaerat nobis suscipit', 'Alias provident optio quam sapiente omnis fugit eos et itaque molestiae nisi voluptatibus quis quis.', NULL, '3118.47', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(164, 49, 'et occaecati quam', 'Excepturi velit expedita numquam eligendi at ipsam non quaerat dolorum consequatur iusto in eum et.', NULL, '149.18', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(165, 12, 'ut voluptate eaque', 'Tenetur laborum quidem autem suscipit amet placeat id iure commodi molestias delectus perspiciatis odit.', NULL, '1435.65', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(166, 47, 'sed culpa maiores', 'Voluptas nesciunt non nemo maiores in ab nihil corporis molestias sint ratione.', NULL, '2111.12', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(167, 16, 'fuga dicta sint', 'Perferendis velit commodi temporibus ad sit vitae consequatur et modi incidunt maiores modi officiis nisi.', NULL, '4685.90', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(168, 52, 'atque unde assumenda', 'Soluta quia qui qui temporibus ab nemo magni adipisci dolorem adipisci aspernatur aliquam velit sint earum.', NULL, '2555.86', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(169, 47, 'odio numquam est', 'Fugiat harum neque similique dolore quaerat vitae voluptatem voluptas minus nemo vel est deserunt consequatur nostrum nostrum.', NULL, '4584.39', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(170, 5, 'quam eligendi aliquid', 'Dolorum quae sit dolorem architecto quae aut omnis aut veniam ad totam.', NULL, '1289.31', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(171, 16, 'omnis veniam laborum', 'Quaerat quae aliquid itaque ad quis ut magni ut animi.', NULL, '4131.92', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(172, 21, 'dolorum porro totam', 'Deserunt quidem ducimus neque perspiciatis quam ut qui voluptatem eos qui a recusandae rem distinctio.', NULL, '799.71', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(173, 18, 'ut dolor in', 'Nemo tempore dignissimos eum ullam voluptatem impedit modi laudantium harum velit repellat impedit sit.', NULL, '732.24', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(174, 25, 'sapiente et aut', 'Voluptate eum voluptatum maiores aliquam vero ipsam illo velit non sapiente.', NULL, '2395.51', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(175, 52, 'est iure rerum', 'Rerum harum eaque est explicabo nostrum inventore voluptates velit et laudantium perspiciatis distinctio iure dolorum qui.', NULL, '3169.79', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(176, 1, 'eaque repellat pariatur', 'Error velit iste consequatur autem quis iste sit omnis dolore quam repellendus numquam quaerat vero totam.', NULL, '4730.91', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(177, 16, 'totam accusamus nesciunt', 'Sed et magnam enim dolor neque corporis ipsa culpa culpa veniam mollitia ea nulla ut.', NULL, '1893.15', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(178, 29, 'explicabo ullam deleniti', 'Ducimus illum omnis aliquam temporibus ipsa aut enim fugit explicabo possimus odit quis nesciunt et et sint.', NULL, '2358.76', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(179, 41, 'et nemo architecto', 'Dolores sit blanditiis harum sint rem ratione voluptas aut quia maxime sit odio dolores nisi ea.', NULL, '494.14', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(180, 29, 'et qui error', 'Voluptate culpa sed nesciunt distinctio consequatur officiis ratione modi quia aut qui reprehenderit cupiditate voluptatum.', NULL, '3820.98', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(181, 51, 'enim omnis est', 'Quam voluptates nobis dolores error cum voluptatem itaque cum itaque quis sequi eos blanditiis est.', NULL, '2107.26', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(182, 15, 'voluptatem delectus occaecati', 'Molestiae autem odit non ullam laboriosam vero veniam animi architecto.', NULL, '749.02', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(183, 5, 'corporis porro sunt', 'Sunt debitis voluptatem repellendus molestias eum commodi officiis voluptas modi eius.', NULL, '1187.43', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(184, 13, 'dolores earum officia', 'Quisquam ab non non iure sit enim rem magni esse atque libero et.', NULL, '4923.91', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(185, 34, 'officia numquam quis', 'Minus asperiores magnam beatae qui accusamus eum aut deleniti ea numquam dolor quod nobis.', NULL, '461.49', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(186, 47, 'mollitia dignissimos doloribus', 'Nesciunt asperiores ut consequuntur iusto consequatur corrupti cum impedit voluptatum inventore.', NULL, '4860.36', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(187, 25, 'ullam voluptatem voluptas', 'Doloremque molestias molestiae nisi tempore ut et praesentium quia et et veniam quos sed.', NULL, '2701.08', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(188, 13, 'atque voluptates vel', 'Dolor sunt dolor excepturi distinctio iusto quas velit ullam sint optio est.', NULL, '3979.00', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(189, 26, 'et aperiam sunt', 'Facere non itaque ad rerum tempora quaerat consequatur magnam aut hic nemo.', NULL, '3639.04', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(190, 19, 'ipsa vel hic', 'Minima voluptatem ea dolores eius nihil dolorem et quidem.', NULL, '1827.51', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(191, 11, 'illo laborum tenetur', 'Qui et est est qui exercitationem voluptas veniam maiores provident numquam est eos non esse.', NULL, '590.29', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(192, 15, 'impedit eius doloribus', 'Ea qui in non et labore et ad repellendus.', NULL, '293.67', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(193, 12, 'officiis occaecati ipsam', 'Quibusdam corporis beatae consequatur atque assumenda blanditiis facere dolorem saepe.', NULL, '4609.81', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(194, 20, 'perspiciatis deserunt voluptatem', 'Molestias animi corporis fuga omnis ratione laboriosam aliquam dolor eaque nam magni possimus et.', NULL, '3773.38', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(195, 36, 'voluptatem aut enim', 'Sed officiis commodi impedit earum error id nobis sed repellat fugit.', NULL, '4536.59', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(196, 2, 'omnis nostrum voluptates', 'Et aliquam commodi mollitia tempora ea quia ut delectus dolores.', NULL, '2765.19', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(197, 25, 'rerum in inventore', 'Aperiam voluptates quis veniam consequatur qui veritatis eligendi a enim quibusdam et.', NULL, '2466.63', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(198, 18, 'sunt labore veniam', 'Quia dolor dicta vel id ut et est quia harum perspiciatis consequuntur.', NULL, '4612.89', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(199, 18, 'sint occaecati inventore', 'Et in ullam et molestiae minus nihil consequatur numquam est error.', NULL, '4508.14', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL),
(200, 7, 'qui aperiam facilis', 'Exercitationem et repellat et qui quis nobis natus neque ipsum et ut dolores quos atque id facere.', NULL, '2493.48', '2025-11-03 18:11:38', '2025-11-03 18:11:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('yLht0aIe4vBtQR1gbqy6LQvdQ0yOfoQU6OY9lrtD', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiaVpUV2RFUGo3QTVrdkYzV21oY3ZpTmZrT2ZyOFA4S0REOVVqakp2VyI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL3VzZXJzIjt9czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9wcm9kdWN0cyI7czo1OiJyb3V0ZSI7czoxNDoicHJvZHVjdHMuaW5kZXgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1762153800);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` tinyint NOT NULL DEFAULT '0' COMMENT '0 => User, 1 => Admin',
  `status` tinyint NOT NULL DEFAULT '0' COMMENT '0 => Register, 1 => Active, 2 => Inactive,  3 => Rejected',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `role`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$12$FQz6/jQoAyfvGFMFtlDVDuxWuNTPqS9ROxNzei0ZueRTR5SjcOCby', 1, 1, NULL, '2025-11-03 18:11:26', '2025-11-03 18:11:26'),
(2, 'Murari Singh', 'user@gmail.com', NULL, '$2y$12$cb1iLgLzerFpiV.RH4/oTOTTc65zxxm5R1BbeBMjsO4QaUbex0rRm', 0, 1, NULL, '2025-11-03 18:11:27', '2025-11-03 18:11:27'),
(3, 'Hailie Kub', 'ritchie.darion@example.org', '2025-11-03 18:11:28', '$2y$12$p5NpMdPWCFPOhKn1zKXqp.JKzQ2vY47gzCX8dFFanaFDmcw/oH2Za', 0, 1, 'N1Q4S0zYnR', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(4, 'Bulah Borer DVM', 'howe.berniece@example.net', '2025-11-03 18:11:28', '$2y$12$L8/.MJrifvBIAUz4CZxO6u10A2AuVIi2sOKNRkcM252yx54R0j1rG', 0, 0, 'mDcoWYZPOD', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(5, 'Isobel Batz', 'keebler.mafalda@example.org', '2025-11-03 18:11:28', '$2y$12$3a3u/3uO2MIgttWm1m4Quuzq9YXwyo2e/Ccp0rB/Qsxd7Wqc.O4XS', 0, 3, 'S9Rk4LmmbF', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(6, 'Ms. Helena Ferry Jr.', 'morris.watsica@example.com', '2025-11-03 18:11:28', '$2y$12$AWBsWFkloT2HZTr3z6iAz.OOVZmBlfkOdfCDY1u1NriACFosm7FDi', 0, 1, 'SB8TYkEP3J', '2025-11-03 18:11:38', '2025-11-03 18:50:07'),
(7, 'Prof. Eddie VonRueden DDS', 'cade86@example.org', '2025-11-03 18:11:29', '$2y$12$G9rybKW2Fys7VNRzCP4J2uEAVOrOQbkNvfnWkfWHChliecQvHmulS', 0, 2, 'r8diOa0mCb', '2025-11-03 18:11:38', '2025-11-03 18:48:54'),
(8, 'Maryam Hauck', 'tad.pacocha@example.com', '2025-11-03 18:11:29', '$2y$12$wQkyQj79p92WiY.K0/6.oeSbyrN89vfmcWtgd5CIV3kwbali.rvpe', 0, 1, 'Kz1jT7wawn', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(9, 'Madelyn Torp', 'milan35@example.com', '2025-11-03 18:11:29', '$2y$12$7EtjXNXkuFzuzD8wV1C7SOZ1dZ3Z1xWvGJb/LDee1H3qRsxyZAke.', 0, 1, 'dkERiT7Ga6', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(10, 'Miss Catalina Gaylord V', 'qhoeger@example.net', '2025-11-03 18:11:29', '$2y$12$NGXmq8uT81lKyN..WZMvn.z/N7RkYIMm/9B3xhh8X5m1DB8jzoqri', 0, 0, 'yNkE1YSDn8', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(11, 'Prof. Davonte Kiehn', 'itzel35@example.net', '2025-11-03 18:11:29', '$2y$12$xbex7WqWhcj9BQW2EPgP3uuSyNRFd/Y4y/fzwdgXHtmIMzxDMdr.i', 0, 1, 'XY8F2mOSAh', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(12, 'Margret Bartell DDS', 'tkirlin@example.com', '2025-11-03 18:11:30', '$2y$12$YAgLxtBhcYqBypqmjyJILuY0bKZw2OjpDD7OLEkStXUNRIt1QJ.NS', 0, 1, 'stXeRRW6LB', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(13, 'Emerson Swift', 'malachi01@example.com', '2025-11-03 18:11:30', '$2y$12$MTiqZWYD4hbO2SWn1Kgj..7HRTGkf1riNME54bx67jm5BH5h01SPG', 0, 0, '30VODvhABO', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(14, 'Myrna Moore', 'yshields@example.com', '2025-11-03 18:11:30', '$2y$12$uvgjkkbkqxhdS4hHTMuL/.6S1OzZC4cb3C1OJsDGIi1kvKJjHb7SK', 0, 3, 'uNBagn8y1d', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(15, 'Dr. Jovanny Reilly', 'kayleigh44@example.org', '2025-11-03 18:11:30', '$2y$12$labDPJCeMD62e9S9JItHmuV/Zu/p4zHWHIUmTjdROW9obH3aWYBlK', 0, 1, 'BG0IcpTbGw', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(16, 'Giuseppe Will', 'angel75@example.org', '2025-11-03 18:11:30', '$2y$12$BngpJRuJGhEGM2/MBuNuqOr0nExGXj2MTS4RP5Tx6hqqIyXOPk8hG', 0, 2, 'uXCs2gQZvh', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(17, 'Reva Cormier', 'icassin@example.com', '2025-11-03 18:11:31', '$2y$12$oX3BhTgTBDnxh1/fcqyf8e.dV6ZrqqMUthnAACMytY6fOU3jSH7bG', 0, 3, 'N9nMo15dVh', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(18, 'Melvina Tremblay', 'rafael.klein@example.net', '2025-11-03 18:11:31', '$2y$12$RLciCItW/y2g4Pjnci7O8ehehtyd22Mnzr9vbLgD1rNzscKjeUSQm', 0, 1, 'x787r66POS', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(19, 'Kolby Bosco', 'norbert31@example.net', '2025-11-03 18:11:31', '$2y$12$Q0SDKCnKlDZQiEB9lLPm.eYe3oP/wQ8FhlYynMyPqrrkUZ6/3U0/y', 0, 1, 'DuiOF6uVQW', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(20, 'Noelia Hauck', 'estell.labadie@example.net', '2025-11-03 18:11:31', '$2y$12$qlpX1dY2rqbQJYECSfXWyeuQHI..NaYy8gljadsQBLbE9UhgoeLya', 0, 1, 'oDb8I5mwGT', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(21, 'Mr. Vernon Toy III', 'durgan.louie@example.org', '2025-11-03 18:11:31', '$2y$12$qHohzRZsgBvbbbE4znU8S.51h0NQJOWaOpFwqcOfhbfrxs0kHjpsO', 0, 2, 'VaupyP4VM9', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(22, 'Prof. Schuyler Frami', 'reuben91@example.com', '2025-11-03 18:11:31', '$2y$12$WqZx2C5xnpd5p6BgzfZi7ORak48tRdQ1MlyP.139.Ohj243RmkSNC', 0, 2, 'mzE4XbDR1f', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(23, 'Griffin Altenwerth', 'philip11@example.com', '2025-11-03 18:11:32', '$2y$12$2v6HvxJaYAKDD57cC.N2nefqwhg6wZVHAuRSd8EZ3wi0qsaqTYTua', 0, 2, 'e4C6nv5dqH', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(24, 'Gregory Bartell', 'schaefer.mathias@example.org', '2025-11-03 18:11:32', '$2y$12$hOk0ABvE9oZXFMgdWiBhXeNnZCPiXrz0tPTvHRbI/B//wBu3ixk0G', 0, 2, 'Y3YkJ2K9Yx', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(25, 'Dr. Elliott Kiehn DVM', 'karl45@example.com', '2025-11-03 18:11:32', '$2y$12$5QI93SsxQ9GmV72FB/s.IOHRssBF/lMh/NuqZGtzyaNiJTB8FpLKi', 0, 2, '8ZISJRB2TM', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(26, 'Miss Eleanore Langosh II', 'hschuster@example.org', '2025-11-03 18:11:32', '$2y$12$jJ.ZMJgAG9HamOnZsGo.se/0ZZnPCszcI5826AcsZQEsetlhFsA8u', 0, 3, 'Zjgl13eq0n', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(27, 'Brenden Wolf', 'kaden34@example.org', '2025-11-03 18:11:32', '$2y$12$IZqNttHzID4NAPf7Pz7TMOfkjxLftqGznAneIYifcT0QZbJn0zsOK', 0, 1, '6zB4nnVJLW', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(28, 'Kenyatta Beer', 'gskiles@example.net', '2025-11-03 18:11:33', '$2y$12$QAAB305H3E34bu3Rjjge5uxK5sQYEB8tziPnQQ3kXW4khcjYtMD86', 0, 3, 'lfD3bo3LZZ', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(29, 'Guiseppe Corkery', 'krystal26@example.net', '2025-11-03 18:11:33', '$2y$12$22mK0oRq7tOiCA1V4R7PbOl9MbCH0pvA6kdid7YKaXI0Bz2SWkuL.', 0, 2, 'tzqr2tc3FZ', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(30, 'Dr. Luciano Kunze Sr.', 'lawson96@example.org', '2025-11-03 18:11:33', '$2y$12$QTqoIw47BWsI7/a0XZJdkeKyDNC6jfA4WzDR4Sht0GbD3cDAZiRL6', 0, 2, '7h57DeTpGR', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(31, 'Cletus Bartoletti', 'weber.waylon@example.org', '2025-11-03 18:11:33', '$2y$12$QvA7ACmphb/tTC3xxXu5OO4A7OPt5wBhzv2/YpYYHRJWxsq4L57Vq', 0, 2, 'kSziSIvt4F', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(32, 'Mr. Percy Block II', 'cabernathy@example.com', '2025-11-03 18:11:33', '$2y$12$mqFz9GSDxDgEmvtbE6Fvjuw22wapCtAZaC5dSBKwV1xtKIvYvIVTG', 0, 2, 'KXiIpsuwBP', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(33, 'Kole Bogisich', 'qkrajcik@example.org', '2025-11-03 18:11:34', '$2y$12$CIfi/UhTSOAVILP8z9DKi.95.pFiQCKMm0LWuCqkBJ5i4J/f49k1a', 0, 3, 'd9CnX2QFKv', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(34, 'Olaf Beatty IV', 'wendy.hackett@example.com', '2025-11-03 18:11:34', '$2y$12$7Y.ZPQJPXVLj2Ghqd0vYs.Z3hUyTrL0qlrU/QQaZUeRSiZMjfIode', 0, 0, '7NGKkQsROZ', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(35, 'Prof. Demond Trantow MD', 'prosacco.quentin@example.com', '2025-11-03 18:11:34', '$2y$12$7d7K7KomKS7sDkok08dsY.HDzZMSr7dHy250gykxJFtDG5hQJTI6K', 0, 1, 'DFR4fsVe0V', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(36, 'Miss Corrine Rosenbaum III', 'cbartell@example.org', '2025-11-03 18:11:34', '$2y$12$cpeoo3oB87.UmMWdhz9Nz.vPvjk/zUNnrou3j3BsF0caG0Fgp2xrO', 0, 2, 'bLA55LfWoY', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(37, 'Declan Pacocha MD', 'chanelle.rath@example.org', '2025-11-03 18:11:34', '$2y$12$KeyaHimF8wi4VCcVrIg7C.xU1Bu6Z8ky9Pyap07EKcWAedZOdQL6m', 0, 0, 'YNmDqZ1teD', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(38, 'Jaydon Erdman', 'andrew.rohan@example.org', '2025-11-03 18:11:35', '$2y$12$AWt8smPUWKVDg4yuM7Tp.OAEkiLfBUicULCMxnnKXSMc.MxWl49ZG', 0, 1, '8y9Kr79krF', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(39, 'Grover Bogisich', 'leonor38@example.org', '2025-11-03 18:11:35', '$2y$12$1Z2hSo8HtihPeVebvmVz9ex7OOytZ7UK7lqcmaQNA7Qjr7aTXLSiK', 0, 2, 'yioTSSNoKM', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(40, 'Kim Kuphal', 'pabernathy@example.com', '2025-11-03 18:11:35', '$2y$12$YNumHHCnc6BZrKr/17CpueE5YnrQHeoJLTHjrhfPAeZ1m/s672oQu', 0, 0, 'JgG0mj0efW', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(41, 'Garfield Moen', 'bjohnston@example.org', '2025-11-03 18:11:35', '$2y$12$clBKn1byNSLxjXBD4ishTeOG/RJDrAQZwBY/PI1RBdZVaOWTLItQq', 0, 2, 'Xe1aYPwWfd', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(42, 'Carolanne Frami Jr.', 'romaguera.raul@example.net', '2025-11-03 18:11:35', '$2y$12$l.ZzjXL8sl5lcm7QiCcSm.adCds2q2hjrQRT4udxPnLZMUmeIPxmi', 0, 0, 'W0zOMcT6nG', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(43, 'Bettye Hauck', 'hoppe.dashawn@example.com', '2025-11-03 18:11:36', '$2y$12$6Ia0BYLXjtlCpqnj9l8t4.vEgz0YS9bzXlK2U/BLHZYcmz2genWO.', 0, 1, '3Eycgm5RXI', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(44, 'Chadd Stracke', 'pouros.demetrius@example.org', '2025-11-03 18:11:36', '$2y$12$n3KRNB8no5EEaUCSkPAXI.jea4tQAW7qmPSGT.rDiDU6cqTYdMQDK', 0, 2, 'U9LD2PpWbh', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(45, 'Mrs. Yoshiko Beatty', 'luis96@example.com', '2025-11-03 18:11:36', '$2y$12$SeqfnsdKHeQ1myaatHGFQua/5tfQ7MZKf23x1zU3ubmEyWxTgxGQu', 0, 1, 'TamkZRsxQs', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(46, 'Prof. Daisy Brekke', 'vonrueden.turner@example.net', '2025-11-03 18:11:36', '$2y$12$EbhxcLiiPBVsZ/G0LisZCunLofVHSK35vXmHZ6B5PPJoAWZ4EyMUu', 0, 1, 'ozzaezSlaR', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(47, 'Scot Ward', 'lexus.heller@example.com', '2025-11-03 18:11:36', '$2y$12$gda9EkBDY1BXVnb0kkXPNO1c21sx9u.PwYf7PCUpjlU8QINdJ7NUi', 0, 2, 'IiAFVCIECo', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(48, 'Sabrina Olson', 'reilly.muriel@example.net', '2025-11-03 18:11:37', '$2y$12$x.Ew/3kKLpiwcIviPxcSju.6Ha5XsiU.dFQQLER69cMvh5jU9CTT.', 0, 0, 'PHy6HCkOyc', '2025-11-03 18:11:38', '2025-11-03 18:11:38'),
(49, 'Santos Lesch', 'keshaun98@example.com', '2025-11-03 18:11:37', '$2y$12$rpw0C05qQ/ifqbuXfhjqZeEX2KchzZUHm9avyGguUPtjxdfXYlzPS', 0, 2, 'tlrPssmMVO', '2025-11-03 18:11:38', '2025-11-03 19:08:00');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
