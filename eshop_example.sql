-- phpMyAdmin SQL Dump
-- version 4.6.6deb5ubuntu0.5
-- https://www.phpmyadmin.net/
--
-- 主機: localhost:3306
-- 產生時間： 2021 年 08 月 16 日 17:27
-- 伺服器版本: 10.1.48-MariaDB-0ubuntu0.18.04.1
-- PHP 版本： 7.2.24-0ubuntu0.18.04.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `eshop_example`
--

-- --------------------------------------------------------

--
-- 資料表結構 `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum is', 'lorem-ipsum-is', '/storage/photos/1/Banner/banner-01.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Up to 10%</span></h2>', 'active', '2020-08-14 01:47:38', '2020-08-14 01:48:21'),
(2, 'Lorem Ipsum', 'lorem-ipsum', '/storage/photos/1/Banner/banner-07.jpg', '<p>Up to 90%</p>', 'active', '2020-08-14 01:50:23', '2020-08-14 01:50:23'),
(4, 'Banner', 'banner', '/storage/photos/1/Banner/banner-06.jpg', '<h2><span style=\"color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;\">Up to 40%</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2020-08-17 20:46:59', '2020-08-17 20:46:59');

-- --------------------------------------------------------

--
-- 資料表結構 `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2020-08-14 04:23:00', '2020-08-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2020-08-14 04:23:08', '2020-08-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2020-08-14 04:23:48', '2020-08-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2020-08-14 04:24:08', '2020-08-14 04:24:08'),
(6, 'Brand', 'brand', 'active', '2020-08-17 20:50:31', '2020-08-17 20:50:31');

-- --------------------------------------------------------

--
-- 資料表結構 `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `order_item_status` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `order_item_status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(1, 8, 1, 3, 200.00, 'new', NULL, 2, 400.00, '2020-08-14 07:15:45', '2020-08-14 07:20:45'),
(2, 7, 1, 3, 1939.03, 'new', NULL, 1, 1999.00, '2020-08-14 07:15:59', '2020-08-14 07:20:45'),
(3, 5, 1, 3, 3600.00, 'new', NULL, 3, 12000.00, '2020-08-14 07:16:12', '2020-08-14 07:20:45'),
(4, 7, 2, 2, 1939.03, 'new', NULL, 1, 1939.03, '2020-08-14 22:13:51', '2020-08-14 22:14:59'),
(5, 8, 3, 3, 200.00, 'new', NULL, 1, 200.00, '2020-08-15 06:39:59', '2020-08-15 06:41:00'),
(8, 9, 4, 3, 190.00, 'new', NULL, 2, 380.00, '2020-08-15 07:44:53', '2020-08-15 07:54:53'),
(9, 6, 4, 3, 5820.00, 'new', NULL, 4, 23280.00, '2020-08-15 07:45:29', '2020-08-15 07:54:53'),
(10, 10, NULL, 2, 270.00, 'new', NULL, 1, 270.00, '2020-08-17 21:07:33', '2020-08-17 21:17:03'),
(11, 9, NULL, 2, 190.00, 'new', NULL, 2, 380.00, '2020-08-17 21:08:35', '2020-08-17 21:17:03'),
(12, 3, 5, 30, 2850.00, 'new', NULL, 1, 2850.00, '2021-08-08 20:21:14', '2021-08-09 20:12:11'),
(15, 11, 6, 30, 95.00, 'new', NULL, 3, 285.00, '2021-08-10 22:52:11', '2021-08-11 01:01:09'),
(19, 3, NULL, 36, 2850.00, 'new', NULL, 2, 5700.00, '2021-08-13 01:40:03', '2021-08-13 01:40:08'),
(21, 3, 7, 34, 2850.00, 'new', NULL, 1, 2850.00, '2021-08-15 19:21:12', '2021-08-15 19:22:01'),
(22, 1, NULL, 34, 540.00, 'new', NULL, 2, 1080.00, '2021-08-15 19:29:37', '2021-08-15 19:29:42'),
(23, 3, NULL, 34, 2850.00, 'new', NULL, 1, 3000.00, '2021-08-16 00:43:24', '2021-08-16 00:43:24'),
(24, 9, NULL, 34, 190.00, 'new', NULL, 4, 780.00, '2021-08-16 00:43:46', '2021-08-16 01:09:52');

-- --------------------------------------------------------

--
-- 資料表結構 `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, '男性服飾', 'mens-fashion', NULL, '/storage/photos/1/Category/mini-banner1.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:15', '2020-08-14 04:26:15'),
(2, '女性服飾', 'womens-fashion', NULL, '/storage/photos/1/Category/mini-banner2.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:26:40', '2020-08-14 04:26:40'),
(3, '兒童服飾', 'kids', NULL, '/storage/photos/1/Category/mini-banner3.jpg', 1, NULL, NULL, 'active', '2020-08-14 04:27:10', '2020-08-14 04:27:42'),
(4, 'T-shirt\'s', 't-shirts', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:14', '2020-08-14 04:32:14'),
(5, 'Jeans pants', 'jeans-pants', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:32:49', '2020-08-14 04:32:49'),
(6, 'Sweater & Jackets', 'sweater-jackets', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:33:37', '2020-08-14 04:33:37'),
(7, 'Rain Coats & Trenches', 'rain-coats-trenches', NULL, NULL, 0, 1, NULL, 'active', '2020-08-14 04:34:04', '2020-08-14 04:34:04'),
(8, '運動休閒', 'sport-leisure', NULL, '/storage/photos/1/Category/sport_leisure.jpg', 1, NULL, NULL, 'active', '2021-08-11 19:08:46', '2021-08-11 19:08:46');

-- --------------------------------------------------------

--
-- 資料表結構 `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(198) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_line` int(11) DEFAULT NULL,
  `coupon_amount` int(11) DEFAULT NULL,
  `coupon_type` int(11) DEFAULT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `name`, `coupon_line`, `coupon_amount`, `coupon_type`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(1, 'abc123', NULL, NULL, NULL, NULL, 'fixed', '300.00', 'active', NULL, NULL),
(2, '111111', NULL, NULL, NULL, NULL, 'percent', '10.00', 'active', NULL, NULL),
(5, 'abcd', NULL, NULL, NULL, NULL, 'fixed', '250.00', 'active', '2020-08-17 20:54:58', '2020-08-17 20:54:58'),
(6, '7777', '滿一千現折一百', 1000, 100, 1, 'fixed', '100.00', 'active', NULL, NULL),
(7, '8888', '滿一千送一百購物金', 1000, 100, 2, 'fixed', '100.00', 'active', NULL, NULL),
(8, '22222', '滿兩千現折兩百', 2000, 200, 1, 'fixed', '200.00', 'active', NULL, NULL),
(9, '2223', '滿兩千送兩百', 2000, 200, 2, 'fixed', '200.00', 'active', NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci,
  `order_id` int(11) DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `order_id`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'About price', NULL, 'prajwal.iar@gmail.com', NULL, '9807009999', 'Hello sir i am from kathmandu nepal.', '2020-08-14 08:25:46', '2020-08-14 08:00:01', '2020-08-14 08:25:46'),
(2, 'Prajwal Rai', 'About Price', NULL, 'prajwal.iar@gmail.com', NULL, '9800099000', 'Hello i am Prajwal Rai', '2020-08-18 03:04:15', '2020-08-15 07:52:39', '2020-08-18 03:04:16'),
(3, 'Prajwal Rai', 'lorem ipsum', NULL, 'prajwal.iar@gmail.com', NULL, '1200990009', 'hello sir sdfdfd dfdjf ;dfjd fd ldkfd', NULL, '2020-08-17 21:15:12', '2020-08-17 21:15:12'),
(4, 'ddddd', NULL, NULL, 'ddddd@gmail.com', NULL, NULL, 'dddddddddddddddddddsdfasdf', NULL, '2021-08-11 18:26:14', '2021-08-11 18:26:14'),
(5, '哭哭哭', NULL, NULL, 'cry@gmail.com', NULL, NULL, '我愛大kldjdl;kj d;ld j;ldkj d;lkjd ;', NULL, '2021-08-11 18:29:01', '2021-08-11 18:29:01'),
(6, '哭哭哭', NULL, NULL, 'cry@gmail.com', NULL, NULL, '1223456789', NULL, '2021-08-11 18:46:37', '2021-08-11 18:46:37'),
(7, '哭哭哭ㄅ', NULL, NULL, 'cry@gmail.com', NULL, NULL, '1223456789', NULL, '2021-08-11 18:47:34', '2021-08-11 18:47:34'),
(8, '哭哭哭ㄅ7', NULL, NULL, 'cry@gmail.com', NULL, NULL, '1223456789', NULL, '2021-08-11 18:48:54', '2021-08-11 18:48:54');

-- --------------------------------------------------------

--
-- 資料表結構 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_07_10_021010_create_brands_table', 1),
(5, '2020_07_10_025334_create_banners_table', 1),
(6, '2020_07_10_112147_create_categories_table', 1),
(7, '2020_07_11_063857_create_products_table', 1),
(8, '2020_07_12_073132_create_post_categories_table', 1),
(9, '2020_07_12_073701_create_post_tags_table', 1),
(10, '2020_07_12_083638_create_posts_table', 1),
(11, '2020_07_13_151329_create_messages_table', 1),
(12, '2020_07_14_023748_create_shippings_table', 1),
(13, '2020_07_15_054356_create_orders_table', 1),
(14, '2020_07_15_102626_create_carts_table', 1),
(15, '2020_07_16_041623_create_notifications_table', 1),
(16, '2020_07_16_053240_create_coupons_table', 1),
(17, '2020_07_23_143757_create_wishlists_table', 1),
(18, '2020_07_24_074930_create_product_reviews_table', 1),
(19, '2020_07_24_131727_create_post_comments_table', 1),
(20, '2020_08_01_143408_create_settings_table', 1),
(21, '2021_08_12_034255_create_user_levels_table', 2),
(22, '2021_08_13_014038_create_order_items_table', 3),
(23, '2021_08_13_063509_create_reward_money_histories_table', 4);

-- --------------------------------------------------------

--
-- 資料表結構 `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('2145a8e3-687d-444a-8873-b3b2fb77a342', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:31:21', '2020-08-15 07:31:21'),
('39ec7b71-a7fa-4241-bb29-891a855f49b1', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/7\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-15 19:22:01', '2021-08-15 19:22:01'),
('3af39f84-cab4-4152-9202-d448435c67de', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/4\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
('4a0afdb0-71ad-4ce6-bc70-c92ef491a525', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:51', '2020-08-17 21:13:51'),
('540ca3e9-0ff9-4e2e-9db3-6b5abc823422', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', '2020-08-15 07:30:44', '2020-08-14 07:12:28', '2020-08-15 07:30:44'),
('5da09dd1-3ffc-43b0-aba2-a4260ba4cc76', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-15 07:51:02', '2020-08-15 07:51:02'),
('5e91e603-024e-45c5-b22f-36931fef0d90', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/white-sports-casual-t\",\"fas\":\"fa-star\"}', NULL, '2020-08-15 07:44:07', '2020-08-15 07:44:07'),
('73a3b51a-416a-4e7d-8ca2-53b216d9ad8e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
('8605db5d-1462-496e-8b5f-8b923d88912c', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/1\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-14 07:20:44', '2020-08-14 07:20:44'),
('a6ec5643-748c-4128-92e2-9a9f293f53b5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-17 21:17:03', '2020-08-17 21:17:03'),
('b186a883-42f2-4a05-8fc5-f0d3e10309ff', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/2\",\"fas\":\"fa-file-alt\"}', '2020-08-15 04:17:24', '2020-08-14 22:14:55', '2020-08-15 04:17:24'),
('d2fd7c33-b0fe-47d6-8bc6-f377d404080d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/blog-detail\\/where-can-i-get-some\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-14 07:08:50', '2020-08-14 07:08:50'),
('dff78b90-85c8-42ee-a5b1-de8ad0b21be4', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/e-shop.loc\\/admin\\/order\\/3\",\"fas\":\"fa-file-alt\"}', NULL, '2020-08-15 06:40:54', '2020-08-15 06:40:54'),
('e2070b48-742f-4d38-bf3a-100ee7162d99', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/5\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-09 20:12:11', '2021-08-09 20:12:11'),
('e28b0a73-4819-4016-b915-0e525d4148f5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/lorem-ipsum-is-simply\",\"fas\":\"fa-star\"}', NULL, '2020-08-17 21:08:16', '2020-08-17 21:08:16'),
('f1aa8b13-90b0-41a4-9999-580269c2d386', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2021-08-11 01:01:09', '2021-08-11 01:01:09'),
('ffffa177-c54e-4dfe-ba43-27c466ff1f4b', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/the-standard-lorem-ipsum-passage-used-since-the-1500s\",\"fas\":\"fas fa-comment\"}', NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29');

-- --------------------------------------------------------

--
-- 資料表結構 `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `reward_money` int(11) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `order_status` int(11) NOT NULL DEFAULT '1',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon_id`, `coupon`, `reward_money`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `order_status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(1, 'ORD-PMIQF5MYPK', 3, 14399.00, 1, NULL, 573.90, NULL, 13925.10, 6, 'cod', 'unpaid', 'delivered', 0, 'Prajwal', 'Rai', 'prajwal.iar@gmail.com', '9800887778', 'NP', '44600', 'Koteshwor', 'Kathmandu', '2020-08-14 07:20:44', '2020-08-14 09:37:37'),
(2, 'ORD-YFF8BF0YBK', 2, 1939.03, 1, NULL, NULL, NULL, 2039.03, 1, 'cod', 'unpaid', 'delivered', 0, 'Sandhya', 'Rai', 'user@gmail.com', '90000000990', 'NP', NULL, 'Lalitpur', NULL, '2020-08-14 22:14:49', '2020-08-14 22:15:19'),
(3, 'ORD-1CKWRWTTIK', 3, 200.00, 1, NULL, NULL, NULL, 300.00, 1, 'paypal', 'paid', 'process', 0, 'Prajwal', 'Rai', 'prajwal.iar@gmail.com', '9807009999', 'NP', '44600', 'Kathmandu', 'Kadaghari', '2020-08-15 06:40:49', '2020-08-17 20:52:40'),
(4, 'ORD-HVO0KX0YHW', 3, 23660.00, 3, NULL, 150.00, NULL, 23910.00, 6, 'paypal', 'paid', 'new', 0, 'Prajwal', 'Rai', 'prajwal.iar@gmail.com', '9800098878', 'NP', '44600', 'Pokhara', NULL, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
(5, 'ORD-ZOZJYRUXS0', 30, 2850.00, 1, NULL, NULL, NULL, 2950.00, 1, 'cod', 'unpaid', 'new', 0, 'ziv', 'lee', 'ziv001@gmail.com', '0943434343', 'TW', NULL, 'dfasd2fdfasdf', NULL, '2021-08-09 20:12:11', '2021-08-09 20:12:11'),
(6, 'ORD-CU9VCTQG6N', 30, 285.00, NULL, NULL, NULL, NULL, 285.00, 3, 'cod', 'unpaid', 'new', 0, 'test', 'etest', 'zivtest@gmail.com', '966666662', 'AX', NULL, 'ssseter235', NULL, '2021-08-11 01:01:09', '2021-08-11 01:01:09'),
(7, 'ORD-EXQXRFKLNA', 34, 2850.00, NULL, NULL, 300.00, NULL, 2550.00, 1, 'cod', 'unpaid', 'new', 1, '55555', '55555', '55555@gmail.com', '0955555555555', 'NP', NULL, 'asdklgj;aklsdgj;klf;', NULL, '2021-08-15 19:22:01', '2021-08-15 19:22:01');

-- --------------------------------------------------------

--
-- 資料表結構 `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ziv001@gmail.com', '$2y$10$pWyhihAz/ulhdMnEnA1WheAouBycnp93UWZuLqXCcdUcutKyZegfq', '2021-08-09 21:47:11');

-- --------------------------------------------------------

--
-- 資料表結構 `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `quote` text COLLATE utf8mb4_unicode_ci,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Where does it come from?', 'where-does-it-come-from', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Contrary to popular belief, Lorem Ipsum is not simply random text.&nbsp;</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.</span><br></p>', '/storage/photos/1/Blog/blog1.jpg', '2020,Visit nepal 2020', 1, NULL, 2, 'active', '2020-08-14 01:55:55', '2020-08-14 04:29:56'),
(2, 'Where can I get some?', 'where-can-i-get-some', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\"><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">It is a long established fact that a reader</span><br></h2>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain;\">Why do we use it?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>', NULL, '/storage/photos/1/Blog/blog2.jpg', 'Enjoy', 2, NULL, 1, 'active', '2020-08-14 01:58:52', '2020-08-14 07:08:14'),
(3, 'The standard Lorem Ipsum passage, used since the 1500s', 'the-standard-lorem-ipsum-passage-used-since-the-1500s', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', '', 3, NULL, 3, 'active', '2020-08-14 02:59:33', '2020-08-14 04:29:44'),
(5, 'The standard Lorem Ipsum passage,', 'the-standard-lorem-ipsum-passage', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</span><br></p>', '/storage/photos/1/Blog/blog2.jpg', ',Enjoy,2020,Visit nepal 2020', 1, NULL, 1, 'active', '2020-08-15 06:58:45', '2020-08-15 06:58:45'),
(6, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><hr><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p><h2 style=\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-family: DauphinPlain; font-size: 24px; line-height: 24px;\">What is Lorem Ipsum?</h2><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\"><strong style=\"margin: 0px; padding: 0px;\">Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and</p>', NULL, '/storage/photos/1/Blog/blog3.jpg', 'Enjoy,2020', 2, NULL, 1, 'active', '2020-08-17 20:54:19', '2020-08-17 20:54:19');

-- --------------------------------------------------------

--
-- 資料表結構 `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Travel', 'contrary', 'active', '2020-08-14 01:51:03', '2020-08-14 01:51:39'),
(2, 'Electronics', 'richard', 'active', '2020-08-14 01:51:22', '2020-08-14 01:52:00'),
(3, 'Cloths', 'cloths', 'active', '2020-08-14 01:52:22', '2020-08-14 01:52:22'),
(4, 'enjoy', 'enjoy', 'active', '2020-08-14 03:16:10', '2020-08-14 03:16:10'),
(5, 'Post Category', 'post-category', 'active', '2020-08-15 06:59:04', '2020-08-15 06:59:04');

-- --------------------------------------------------------

--
-- 資料表結構 `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'Testing comment edited', 'active', NULL, NULL, '2020-08-14 07:08:42', '2020-08-15 06:59:58'),
(2, 3, 2, 'testing 2', 'active', NULL, 1, '2020-08-14 07:11:03', '2020-08-14 07:11:03'),
(3, 2, 2, 'That\'s cool', 'active', NULL, 2, '2020-08-14 07:12:27', '2020-08-14 07:12:27'),
(4, 1, 2, 'nice', 'active', NULL, NULL, '2020-08-15 07:31:19', '2020-08-15 07:31:19'),
(5, 3, 5, 'nice blog', 'active', NULL, NULL, '2020-08-15 07:51:01', '2020-08-15 07:51:01'),
(6, 2, 3, 'nice', 'active', NULL, NULL, '2020-08-17 21:13:29', '2020-08-17 21:13:29'),
(7, 2, 3, 'really', 'active', NULL, 6, '2020-08-17 21:13:51', '2020-08-17 21:13:51');

-- --------------------------------------------------------

--
-- 資料表結構 `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Enjoy', 'enjoy', 'active', '2020-08-14 01:53:52', '2020-08-14 01:53:52'),
(2, '2020', '2020', 'active', '2020-08-14 01:54:09', '2020-08-14 01:54:09'),
(3, 'Visit nepal 2020', 'visit-nepal-2020', 'active', '2020-08-14 01:54:33', '2020-08-14 01:54:33'),
(4, 'Tag', 'tag', 'active', '2020-08-15 06:59:31', '2020-08-15 06:59:31');

-- --------------------------------------------------------

--
-- 資料表結構 `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT '1',
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `special_price` int(11) DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `special_price`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Melange Casual Black', 'melange-casual-black', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '/storage/photos/1/Products/405b7-pmtk004t.jpg,/storage/photos/1/Products/43f35-2_2.jpg', 5, 'S,M,XL', 'new', 'active', 600.00, 10.00, 500, 1, 1, 4, 4, '2020-08-14 04:38:26', '2020-08-14 04:42:46'),
(2, 'White Sports Casual T-', 'white-sports-casual-t', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">The standard Lorem Ipsum passage, used since the 1500s</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p>', '/storage/photos/1/Products/1d60f-2.jpg', 3, 'XL', 'hot', 'active', 400.00, 4.00, NULL, 1, 1, 4, 2, '2020-08-14 04:40:21', '2020-08-14 06:26:01'),
(3, 'Summer Round Neck T', 'summer-round-neck-t', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/01bc5-mpd006b.jpg,/storage/photos/1/Products/0122b-wsd000t.jpg', 6, 'S,M', 'hot', 'active', 3000.00, 5.00, NULL, 0, 2, NULL, 2, '2020-08-14 05:57:48', '2020-08-14 05:57:48'),
(4, 'Melange Ethnic Kurthi', 'melange-ethnic-kurthi', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.32 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3>', '/storage/photos/1/Products/0a402-image4xxl-3-.jpg,/storage/photos/1/Products/2282b-wsd008t.jpg,/storage/photos/1/Products/21951-image4xxl.jpg', 5, 'XL', 'default', 'active', 4000.00, 50.00, NULL, 0, 2, NULL, 1, '2020-08-14 06:04:13', '2020-08-14 06:04:13'),
(5, 'Cotton High Quality Kurt', 'cotton-high-quality-kurt', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/086c2-a1.jpg,/storage/photos/1/Products/09a16-mpd000t_6.jpg,/storage/photos/1/Products/0c2d2-wbk012c-royal-blue.jpg', 0, 'M,XL', 'new', 'active', 4000.00, 10.00, NULL, 0, 3, NULL, 3, '2020-08-14 06:10:52', '2020-08-14 09:37:36'),
(6, 'Ladies Cotton Kurti Sha', 'ladies-cotton-kurti-sha', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '/storage/photos/1/Products/6a8b5-wsd013t.jpg,/storage/photos/1/Products/5ded8-image1xxl-5-.jpg,/storage/photos/1/Products/74840-image4xxl-6-.jpg', 6, 'M,L', 'hot', 'active', 6000.00, 3.00, NULL, 1, 3, NULL, 4, '2020-08-14 06:13:20', '2020-08-14 06:31:42'),
(7, 'GRAY BABY ROMPERS', 'gray-baby-rompers', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their du</p>', '/storage/photos/1/Products/08ec9-n3.jpg,/storage/photos/1/Products/07e30-mtk006b.jpg,/storage/photos/1/Products/18b18-wbk003b.jpg', 0, 'L', 'hot', 'active', 1999.00, 3.00, NULL, 0, 3, NULL, 1, '2020-08-14 06:23:33', '2020-08-14 22:15:19'),
(8, 'Baby Girls\' 2-Piece Yell', 'baby-girls-2-piece-yell', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their du</p>', '/storage/photos/1/Products/calvin-klein.jpg,/storage/photos/1/Products/calvin.jpg,/storage/photos/1/Products/d3fdb-image2xxl-4-.jpg', 1, 'S', 'new', 'active', 200.00, 0.00, NULL, 0, 3, NULL, 2, '2020-08-14 06:25:42', '2020-08-14 09:37:36'),
(9, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.</span><br></p>', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">orem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><br></p>', '/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04776-pms000a.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg', 4, 'S,M,XL', 'new', 'active', 200.00, 5.00, NULL, 0, 2, NULL, 3, '2020-08-15 06:52:44', '2020-08-15 06:53:14'),
(10, 'Lorem Ipsum is simply', 'lorem-ipsum-is-simply-2008183507-655', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry.&nbsp;</span><br></p>', '<p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p><p><strong style=\"margin: 0px; padding: 0px; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">Lorem Ipsum</strong><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><br></p>', '/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg', 3, 'L,XL', 'hot', 'active', 300.00, 10.00, NULL, 0, 1, 4, 3, '2020-08-17 20:50:07', '2020-08-17 20:50:07');
INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `special_price`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(11, 'test', 'test', '<p>test<br></p>', '<p align=\"center\">test<br><img style=\"width: 500px;\" src=\"data:image/jpeg;base64,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\" data-filename=\"pexels-photo-212286.jpeg\"></p><p align=\"center\"><img style=\"width: 500px;\" src=\"data:image/jpeg;base64,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\" data-filename=\"pexels-photo-212286.jpeg\"><br></p>', '/storage/photos/1/Products/pexels-photo-212286.jpeg', 100, '', 'default', 'active', 100.00, 5.00, NULL, 1, 1, 7, NULL, '2021-08-10 19:20:25', '2021-08-10 22:56:28');

-- --------------------------------------------------------

--
-- 資料表結構 `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT '0',
  `review` text COLLATE utf8mb4_unicode_ci,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(1, 3, 2, 5, 'nice product', 'active', '2020-08-15 07:44:05', '2020-08-15 07:44:05'),
(2, 2, 9, 5, 'nice', 'active', '2020-08-17 21:08:14', '2020-08-17 21:18:31');

-- --------------------------------------------------------

--
-- 資料表結構 `reward_money_histories`
--

CREATE TABLE `reward_money_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `reward_item` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `reward_money_histories`
--

INSERT INTO `reward_money_histories` (`id`, `user_id`, `reward_item`, `amount`, `total`, `created_at`, `updated_at`) VALUES
(1, 34, '老闆爽給', 500, 500, '2020-08-15 07:54:52', '2020-08-15 07:54:52'),
(2, 34, '訂單 2021081600009 使用', -100, 400, '2020-08-15 07:54:54', '2020-08-15 07:54:54');

-- --------------------------------------------------------

--
-- 資料表結構 `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis unde omnis iste natus error sit voluptatem Excepteu\r\n\r\n                            sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspiciatis Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. sed ut perspi deserunt mollit anim id est laborum. sed ut perspi.', 'Praesent dapibus, neque id cursus ucibus, tortor neque egestas augue, magna eros eu erat. Aliquam erat volutpat. Nam dui mi, tincidunt quis, accumsan porttitor, facilisis luctus, metus.', '/storage/photos/1/zshop-logo.png', '/storage/photos/1/setting/line_qrcode.jpg', 'NO. 342 - London Oxford Street, 012 United Kingdom', '+060 (800) 801-582', 'eshop@gmail.com', NULL, '2021-08-11 01:55:22');

-- --------------------------------------------------------

--
-- 資料表結構 `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Kahtmandu', '100.00', 'active', '2020-08-14 04:22:17', '2020-08-14 04:22:17'),
(2, 'Out of valley', '300.00', 'active', '2020-08-14 04:22:41', '2020-08-14 04:22:41'),
(3, 'Pokhara', '400.00', 'active', '2020-08-15 06:54:04', '2020-08-15 06:54:04'),
(4, 'Dharan', '400.00', 'active', '2020-08-17 20:50:48', '2020-08-17 20:50:48');

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `total_shopping_amount` int(11) DEFAULT NULL,
  `reward_money` int(11) DEFAULT NULL,
  `user_level_id` int(11) DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `phone`, `address`, `photo`, `role`, `total_shopping_amount`, `reward_money`, `user_level_id`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Prajwal Rai', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', NULL, NULL, '/storage/photos/1/users/user1.jpg', 'admin', NULL, NULL, NULL, NULL, NULL, 'active', 'PvcPJB75wpl4sSBd6cp5T9GC84VIaQreVKXwtpSQmksl2I0qXfuNoxORz0E1', NULL, '2020-08-15 06:47:13'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', NULL, NULL, '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, NULL, NULL, NULL, 'active', NULL, NULL, '2020-08-15 07:30:07'),
(3, 'Prajwal Rai', 'prajwal.iar@gmail.com', NULL, '$2y$10$15ZVMgH040v4Ukf9KSAFiucPJcfDwmeRKCaguVJBXplTs93m48F1G', NULL, NULL, '/storage/photos/1/users/user3.jpg', 'user', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2020-08-11 04:20:58', '2020-08-15 07:56:58'),
(4, 'Cynthia Beier', 'ernestina.wehner@example.net', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'fzmQDfEoaP', '2020-08-14 21:18:52', '2020-08-14 21:18:52'),
(5, 'Prof. Maybell Zulauf', 'wolf.harvey@example.org', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'B8cYq4huyT', '2020-08-14 21:18:54', '2020-08-14 21:18:54'),
(6, 'Diego Lind II', 'schroeder.emile@example.net', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'xLUaF26dE1', '2020-08-14 21:18:54', '2020-08-14 21:18:54'),
(7, 'Ian Macejkovic', 'ashlee16@example.com', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'i2ZIKbiM9O', '2020-08-12 21:18:54', '2020-08-14 21:18:54'),
(8, 'Perry McClure DDS', 'mayer.ashlynn@example.org', '2020-08-14 21:18:52', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'VD1MlsvW3I', '2020-08-14 21:18:55', '2020-08-14 21:18:55'),
(9, 'Juana Yost', 'carter47@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'kARxoay0FT', '2020-08-11 21:19:50', '2020-08-14 21:19:50'),
(10, 'Louvenia Will DDS', 'lowell06@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'QkbNNnO7ZG', '2020-08-10 21:19:50', '2020-08-14 21:19:50'),
(11, 'Miss Layla McClure', 'dcummings@example.com', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'DFnCS0bKFa', '2020-08-08 21:19:51', '2020-08-14 21:19:51'),
(12, 'Mrs. Taya Ziemann', 'anderson.luz@example.net', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', '4Xgvb1HnFT', '2020-08-09 21:19:51', '2020-08-14 21:19:51'),
(13, 'Porter Olson', 'jaden24@example.com', '2020-08-14 21:19:50', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', 'gFX2w4WaMj', '2020-08-14 21:19:51', '2020-08-14 21:19:51'),
(29, 'Prajwal Rai', 'rae.prajwal@gmail.com', NULL, NULL, NULL, NULL, NULL, 'user', NULL, NULL, NULL, 'google', '110717103019405487938', 'active', NULL, '2020-08-15 07:36:29', '2020-08-15 07:36:29'),
(30, 'ziv001', 'ziv001@gmail.com', NULL, '$2y$10$E.fGey4Hmq9NWv8Vulb8aOtQDlg6.Dshl8JpQ1.1sM3/5xf7AIFAe', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2021-08-08 20:20:09', '2021-08-08 20:20:09'),
(31, NULL, 'ziv002@gmail.com', NULL, '$2y$10$7EEdtL4qKZoQWc/SeoPhouBY4Y1wEfg4MwvkrlJti3HvvYvEm2DvG', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2021-08-11 22:11:19', '2021-08-11 22:11:19'),
(32, NULL, 'ziv003@gmail.com', NULL, '$2y$10$fSaftKhXmncaIRh80QObq.vANJB7e524oTAsuWFoQh3mIdSfzbqW2', NULL, NULL, NULL, 'user', NULL, NULL, 1, NULL, NULL, 'active', NULL, '2021-08-11 22:14:05', '2021-08-11 22:14:05'),
(33, NULL, 'ziv004@gmail.com', NULL, '$2y$10$soAzOj0UOxdTkwnGw2Z6deFwGgf8BIyvGfFma6bufpKCWp7e/I0E.', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2021-08-11 22:42:36', '2021-08-11 22:42:36'),
(34, '零零五', 'ziv005@gmail.com', NULL, '$2y$10$eDabSTlGf0AoDjRSFxs7ceS89yP.94YALSvZrJuGSFFbYgJBM7SR6', '0955555555', 'asdfgsadfasdfadsfasdf', NULL, 'user', NULL, 400, 1, NULL, NULL, 'active', NULL, '2021-08-11 22:48:48', '2021-08-12 00:29:43'),
(35, NULL, 'ziv006@gmail.com', NULL, '$2y$10$n6LSh/LRIJsv361.LO7Gq.7FfzwFRS9hvspW/EX0ym4eTtuFhmCKS', NULL, NULL, NULL, 'user', NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2021-08-12 00:32:41', '2021-08-12 00:32:41'),
(36, NULL, 'ziv007@gmail.com', NULL, '$2y$10$YT454DdNslNUJcNvnEGAbePVJuHAKITEqWLOX4hXPgZVScFcAqn5.', NULL, NULL, NULL, 'user', NULL, 500, 2, NULL, NULL, 'active', NULL, '2021-08-12 00:41:46', '2021-08-12 00:41:46'),
(37, NULL, 'ziv008@gmail.com', NULL, '$2y$10$/XXVjt2w7KhbbKw510rZvetzVMYxWU43tSEvvasGcbUGpypbLu0Qy', NULL, NULL, NULL, 'user', NULL, 500, NULL, NULL, NULL, 'active', NULL, '2021-08-12 00:42:52', '2021-08-12 00:42:52'),
(38, '零零九', 'ziv009@gmail.com', NULL, '$2y$10$1JBswa1.pSiU0EC0LJbg8uwPl9DcIak7nMiMpmWBzIp2V1lpO/Zwq', '0999999999', 'dfkjkl;dsjag;lj', NULL, 'user', 0, 0, 1, NULL, NULL, 'active', NULL, '2021-08-12 00:44:52', '2021-08-12 01:16:55');

-- --------------------------------------------------------

--
-- 資料表結構 `user_levels`
--

CREATE TABLE `user_levels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level_up_line` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `user_levels`
--

INSERT INTO `user_levels` (`id`, `name`, `level_up_line`, `created_at`, `updated_at`) VALUES
(1, '普通會員', 1000, NULL, NULL),
(2, '黃金會員', 5000, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 資料表的匯出資料 `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(3, 1, 12, 30, 540.00, 1, 540.00, '2021-08-08 20:20:42', '2021-08-08 20:21:14'),
(4, 2, 12, 30, 384.00, 1, 384.00, '2021-08-08 20:21:02', '2021-08-08 20:21:14'),
(5, 1, NULL, 38, 540.00, 1, 540.00, '2021-08-12 01:51:16', '2021-08-12 01:51:16'),
(6, 3, 19, 36, 2850.00, 1, 2850.00, '2021-08-12 19:44:09', '2021-08-13 01:40:03'),
(7, 3, 19, 36, 2850.00, 1, 2850.00, '2021-08-12 19:47:01', '2021-08-13 01:40:03');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- 資料表索引 `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- 資料表索引 `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- 資料表索引 `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- 資料表索引 `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- 資料表索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- 資料表索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- 資料表索引 `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- 資料表索引 `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- 資料表索引 `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- 資料表索引 `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- 資料表索引 `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- 資料表索引 `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- 資料表索引 `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- 資料表索引 `reward_money_histories`
--
ALTER TABLE `reward_money_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reward_money_histories_user_id_foreign` (`user_id`);

--
-- 資料表索引 `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- 資料表索引 `user_levels`
--
ALTER TABLE `user_levels`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用資料表 AUTO_INCREMENT `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- 使用資料表 AUTO_INCREMENT `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用資料表 AUTO_INCREMENT `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- 使用資料表 AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用資料表 AUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- 使用資料表 AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用資料表 AUTO_INCREMENT `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- 使用資料表 AUTO_INCREMENT `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用資料表 AUTO_INCREMENT `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用資料表 AUTO_INCREMENT `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用資料表 AUTO_INCREMENT `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `reward_money_histories`
--
ALTER TABLE `reward_money_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- 使用資料表 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- 使用資料表 AUTO_INCREMENT `user_levels`
--
ALTER TABLE `user_levels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用資料表 AUTO_INCREMENT `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 已匯出資料表的限制(Constraint)
--

--
-- 資料表的 Constraints `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- 資料表的 Constraints `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- 資料表的 Constraints `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- 資料表的 Constraints `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- 資料表的 Constraints `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- 資料表的 Constraints `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- 資料表的 Constraints `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- 資料表的 Constraints `reward_money_histories`
--
ALTER TABLE `reward_money_histories`
  ADD CONSTRAINT `reward_money_histories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- 資料表的 Constraints `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
