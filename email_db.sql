-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4306
-- Generation Time: Apr 04, 2022 at 05:51 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `email_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_tokens`
--

CREATE TABLE `api_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `api_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invitations`
--

CREATE TABLE `invitations` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_04_11_000000_create_workspaces_table', 1),
(4, '2017_04_11_100000_create_invitations_table', 1),
(5, '2017_04_11_133343_create_email_service_tables', 1),
(6, '2017_04_12_6000_create_unsubscribed_table', 1),
(7, '2017_04_28_223029_create_campaign_statuses_table', 1),
(8, '2017_04_28_223840_create_subscribers_table', 1),
(9, '2017_04_28_223844_create_segments_table', 1),
(10, '2017_04_28_223854_create_segment_subscriber_table', 1),
(11, '2017_04_28_223906_create_templates_table', 1),
(12, '2017_04_28_223915_create_campaigns_table', 1),
(13, '2017_05_02_104440_create_campaign_segment_table', 1),
(14, '2019_07_10_194325_create_messages_table', 1),
(15, '2019_07_30_153117_create_message_urls_table', 1),
(16, '2019_08_19_000000_create_failed_jobs_table', 1),
(17, '2019_08_24_114758_adjust_users_table', 1),
(18, '2020_01_23_153845_create_message_failures_table', 1),
(19, '2020_06_16_072116_adjust_campaign_content', 1),
(20, '2020_06_16_072137_adjust_template_content', 1),
(21, '2020_07_17_072137_add_cancelled_campaign_status', 1),
(22, '2020_08_04_085127_add_mailjet_email_service', 1),
(23, '2020_10_02_152306_drop_segment_name_unique', 1),
(24, '2020_10_16_092234_prefix_tables', 1),
(25, '2020_11_13_120125_create_api_tokens_table', 1),
(26, '2021_01_26_151747_remove_api_token_from_users_table', 1),
(27, '2021_01_29_121118_rename_segments_to_tags', 1),
(28, '2021_02_26_110520_add_smtp_email_service_type', 1),
(29, '2021_06_08_042814_create_jobs_table', 2),
(30, '2019_12_14_000001_create_personal_access_tokens_table', 3);

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_campaigns`
--

CREATE TABLE `sendportal_campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `template_id` int(10) UNSIGNED DEFAULT NULL,
  `email_service_id` int(10) UNSIGNED DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_open_tracking` tinyint(1) NOT NULL DEFAULT 1,
  `is_click_tracking` tinyint(1) NOT NULL DEFAULT 1,
  `sent_count` mediumint(9) DEFAULT 0,
  `open_count` mediumint(9) DEFAULT 0,
  `click_count` mediumint(9) DEFAULT 0,
  `send_to_all` tinyint(1) NOT NULL DEFAULT 0,
  `save_as_draft` tinyint(1) NOT NULL DEFAULT 1,
  `scheduled_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_campaigns`
--

INSERT INTO `sendportal_campaigns` (`id`, `workspace_id`, `name`, `status_id`, `template_id`, `email_service_id`, `subject`, `content`, `from_name`, `from_email`, `is_open_tracking`, `is_click_tracking`, `sent_count`, `open_count`, `click_count`, `send_to_all`, `save_as_draft`, `scheduled_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'Markerting 1', 4, 2, 1, 'gửi test', '<p>aaaaaaaa</p>', 'dainguyen', 'xaynhatrongoihaiphong@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-08 00:44:18', '2021-06-08 00:29:57', '2021-06-08 02:57:23'),
(2, 1, 'markerting 2', 4, 1, 1, 'chiến dịch 2', '<p>ccccccccc</p>', 'form name', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 0, '2021-06-08 00:50:22', '2021-06-08 00:48:46', '2021-06-08 02:57:35'),
(3, 1, 'dainguyen', 4, 1, 1, 'xaynhatrongoihaiphong@gmail.com', NULL, 'dainguyen', 'xaynhatrongoihaiphong@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-08 01:11:21', '2021-06-08 01:10:10', '2021-06-08 02:57:35'),
(4, 1, 'dainguyen001', 4, 2, 1, 'hjgjhkhjkhjkhjkhjk', '<p>cgfgcfgfdgdfgdfgdfgdfgdfgdfgdfgdfg</p>', 'tien', 'xaynhatrongoihaiphong@gmail.com', 0, 0, 0, 0, 0, 1, 0, '2021-06-08 01:28:47', '2021-06-08 01:28:33', '2021-06-08 02:57:52'),
(5, 1, 'assss', 4, 2, 1, 'sdddd', '<p>cccccc</p>', 'dainguyen', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 0, '2021-06-08 01:53:35', '2021-06-08 01:52:30', '2021-06-08 02:57:59'),
(6, 1, 'adsmo', 4, 2, 1, 'test com', '<p>sssssss</p>', 'dainguyen', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 1, 0, '2021-06-08 02:22:03', '2021-06-08 02:20:25', '2021-06-08 02:58:17'),
(7, 1, 'ddd', 4, 1, 1, 'ddd', '<p>ddđ</p>', 'dainguyen', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 0, '2021-06-08 02:44:18', '2021-06-08 02:44:09', '2021-06-08 02:58:22'),
(8, 1, 'test 0906', 4, 2, 1, 'test 0906', '<p>abcccccccc</p>', 'form name', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-08 19:28:36', '2021-06-08 19:28:19', '2021-06-08 19:34:25'),
(9, 1, 'dainguyen', 4, 2, 1, 'addd', '<p>bbbbbb</p>', 'dainguyen', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 0, '2021-06-08 19:39:49', '2021-06-08 19:39:37', '2021-06-08 20:57:21'),
(10, 1, 'sdfsdf', 4, 2, 1, 'abc', '<p>sdfsdf</p>', 'sdfsdf', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-09 01:04:11', '2021-06-09 01:03:55', '2021-06-09 03:07:03'),
(12, 1, 'ccccc', 4, 2, 1, 'cccccc', '<p>cccc</p>', 'cccccc', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-09 03:27:23', '2021-06-09 03:27:16', '2021-06-09 03:38:03'),
(13, 1, 'abc', 4, 2, 1, 'abc', '<p>cccccc</p>', 'abc', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-09 03:42:42', '2021-06-09 03:42:36', '2021-06-09 03:43:02'),
(14, 1, 'bbbb', 4, 2, 1, 'bbbbbbbb', '<p>cccccccc</p>', 'bbbbbbb', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-09 03:47:05', '2021-06-09 03:46:54', '2021-06-09 03:48:02'),
(15, 1, 'nnnnn', 5, 1, 1, 'nnnnnn', '<p>ccccccc</p>', 'nnnnnn', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-09 03:51:52', '2021-06-09 03:51:42', '2021-06-09 04:00:24'),
(16, 1, 'nnnnn - Duplicate', 4, 1, 1, 'nnnnnn', '<p>ccccccc</p>', 'nnnnnn', 'tlead01@gmail.com', 0, 0, 0, 0, 0, 0, 1, '2021-06-09 04:01:36', '2021-06-09 04:00:43', '2021-06-09 04:02:02'),
(17, 1, 'Dat Nguyen', 4, 2, 1, 'ádasdasdasdasdasd', '<p>ádasdasdasdasdasd</p>', 'ádasdsadasdasd', 'hppvtien@gmail.com', 0, 0, 0, 0, 0, 1, 0, '2021-06-09 04:09:53', '2021-06-09 04:09:36', '2021-06-09 04:10:34'),
(18, 1, 'UNISPICE', 4, 2, 1, 'SMALL CAM...BIG PROFIT', '<p>Dear Customers</p>', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', 0, 0, 0, 0, 0, 1, 1, '2021-06-09 04:14:56', '2021-06-09 04:14:24', '2021-06-09 04:15:03'),
(19, 1, 'UNISPICE - Duplicate', 4, 2, 1, 'SMALL CAM...BIG PROFIT', '<p>Dear Customers</p>', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', 0, 0, 0, 0, 0, 1, 0, '2021-06-09 05:47:52', '2021-06-09 05:47:35', '2021-06-09 05:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_campaign_statuses`
--

CREATE TABLE `sendportal_campaign_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_campaign_statuses`
--

INSERT INTO `sendportal_campaign_statuses` (`id`, `name`) VALUES
(1, 'Draft'),
(2, 'Queued'),
(3, 'Sending'),
(4, 'Sent'),
(5, 'Cancelled');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_campaign_tag`
--

CREATE TABLE `sendportal_campaign_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_campaign_tag`
--

INSERT INTO `sendportal_campaign_tag` (`id`, `tag_id`, `campaign_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-06-08 00:44:18', '2021-06-08 00:44:18'),
(2, 1, 2, '2021-06-08 00:50:22', '2021-06-08 00:50:22'),
(3, 2, 3, '2021-06-08 01:11:21', '2021-06-08 01:11:21'),
(4, 2, 5, '2021-06-08 01:53:35', '2021-06-08 01:53:35'),
(5, 2, 6, '2021-06-08 02:22:03', '2021-06-08 02:22:03'),
(6, 2, 7, '2021-06-08 02:44:18', '2021-06-08 02:44:18'),
(7, 2, 8, '2021-06-08 19:28:36', '2021-06-08 19:28:36'),
(8, 2, 9, '2021-06-08 19:39:49', '2021-06-08 19:39:49'),
(9, 2, 10, '2021-06-09 01:04:11', '2021-06-09 01:04:11'),
(10, 2, 12, '2021-06-09 03:27:23', '2021-06-09 03:27:23'),
(11, 2, 13, '2021-06-09 03:42:42', '2021-06-09 03:42:42'),
(12, 2, 14, '2021-06-09 03:47:05', '2021-06-09 03:47:05'),
(13, 2, 15, '2021-06-09 03:51:52', '2021-06-09 03:51:52'),
(14, 2, 16, '2021-06-09 04:01:36', '2021-06-09 04:01:36');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_email_services`
--

CREATE TABLE `sendportal_email_services` (
  `id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_id` int(10) UNSIGNED NOT NULL,
  `settings` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_email_services`
--

INSERT INTO `sendportal_email_services` (`id`, `workspace_id`, `name`, `type_id`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'adsmo', 6, 'eyJpdiI6ImpvMWJKY1dxUGN2eC9ONlpCUWEweGc9PSIsInZhbHVlIjoiKytoYk4vaUEvT0JNTDZkcG5lLzU1MUtxb3N4ZVJUZVc1MHQ3bDlNR1hZR3YyM0ZtVFdObjdrNkwwS29lUjZhT3A1bmZmYkVWSGJRdkpNemNObWdaSUZ4cnUzR0N0SWlDUG91dDhENjJWMnB1Y1JBb2FOYmpMMnFRVThLWHcranlYSDgrRmdvVzJGVm84RFlraXdDN0t3a1RsY2wzZmRZS1h3RlZVTEVSU3NZPSIsIm1hYyI6IjM3ODZjYmMxOGM3ZmExYmYxZWU4ZjIyMTFkNGI3NGU2NjQ4NDg1NGI4MzkwYjEwNGJiOThlYTVjNGM5NzI4MjAifQ==', '2021-06-08 00:19:55', '2021-06-08 00:19:55'),
(2, 1, 'Favicon', 3, 'eyJpdiI6InJRMEQ3MUViYnJab01DY0pJZmlFbWc9PSIsInZhbHVlIjoiU0Vvci8xY3lGeFNDeldoQlNlYjBoOUY0ZXZPV09DSGIyL3RTVjhqdVMwNk1JYkVwVDk4a1dyM3YzNjB0TVdXbWRyR2lobGdITTNscEwwMjBQYXJValE9PSIsIm1hYyI6ImQxM2M3YzUxOGZkNDIxMGUzNmU1ZTBjYTQzNGVhYjRiZmYxN2NmYzEwODQzMzc0M2U5MWQ0YWNjZjY0NmMwM2UiLCJ0YWciOiIifQ==', '2022-03-08 19:36:16', '2022-03-08 19:36:28'),
(3, 1, 'Áo Phông 2019 Phong Cách Mới', 6, 'eyJpdiI6IlBIOTNRUnd4TUV0UzYydFNVQUU0dnc9PSIsInZhbHVlIjoibTMxOVFjSGh0aUtMc25iU3c1cUhwRnV4YXIzWDhWVnhmQnlyNXdtK21BMi9WeVVYc0owdHQxc3RHamxDWWw1UTNhK0Fac0R5b3c1UkFlM3MrT1JNbUFUT3N6dFdKUkQ4MUdFNm5vUjdBSmY3eE4wMUkrVVI4eTZRcnVhYWpDYlFlWjFHSzB1TUlpR3hTNkZJenV0bHZnPT0iLCJtYWMiOiI3MmY5MmY3NWVjZjIyMjVmNjA1ZmNkM2E3OGZkNWI0NzUwMmRmMDVkOTE1MTdmNGZkOWEwNTFiOWMzYTIzNTc4IiwidGFnIjoiIn0=', '2022-03-08 19:37:49', '2022-03-08 19:37:49');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_email_service_types`
--

CREATE TABLE `sendportal_email_service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_email_service_types`
--

INSERT INTO `sendportal_email_service_types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'SES', '2021-06-07 21:27:43', '2021-06-07 21:27:43'),
(2, 'SendGrid', '2021-06-07 21:27:43', '2021-06-07 21:27:43'),
(3, 'Mailgun', '2021-06-07 21:27:43', '2021-06-07 21:27:43'),
(4, 'Postmark', '2021-06-07 21:27:43', '2021-06-07 21:27:43'),
(5, 'Mailjet', '2021-06-07 21:27:46', '2021-06-07 21:27:46'),
(6, 'SMTP', '2021-06-07 21:27:46', '2021-06-07 21:27:46');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_messages`
--

CREATE TABLE `sendportal_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `hash` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `subscriber_id` int(10) UNSIGNED NOT NULL,
  `source_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `recipient_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `open_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `click_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `queued_at` timestamp NULL DEFAULT NULL,
  `sent_at` timestamp NULL DEFAULT NULL,
  `delivered_at` timestamp NULL DEFAULT NULL,
  `bounced_at` timestamp NULL DEFAULT NULL,
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `complained_at` timestamp NULL DEFAULT NULL,
  `opened_at` timestamp NULL DEFAULT NULL,
  `clicked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_messages`
--

INSERT INTO `sendportal_messages` (`id`, `hash`, `workspace_id`, `subscriber_id`, `source_type`, `source_id`, `recipient_email`, `subject`, `from_name`, `from_email`, `message_id`, `ip`, `open_count`, `click_count`, `queued_at`, `sent_at`, `delivered_at`, `bounced_at`, `unsubscribed_at`, `complained_at`, `opened_at`, `clicked_at`, `created_at`, `updated_at`) VALUES
(1, '5f408b82-71a6-42c2-8b94-578f0be9cea1', 1, 1, 'Sendportal\\Base\\Models\\Campaign', 1, 'tlead02@gmail.com', 'gửi test', 'dainguyen', 'xaynhatrongoihaiphong@gmail.com', NULL, NULL, 0, 0, '2021-06-08 02:57:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:23', '2021-06-08 02:57:23'),
(2, 'ed422000-28b4-4e87-8075-5b881ae547c2', 1, 2, 'Sendportal\\Base\\Models\\Campaign', 1, 'tlead03@gmail.com', 'gửi test', 'dainguyen', 'xaynhatrongoihaiphong@gmail.com', NULL, NULL, 0, 0, '2021-06-08 02:57:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:23', '2021-06-08 02:57:23'),
(3, '490bd530-39d2-492a-a965-a4c9f1ebf83f', 1, 3, 'Sendportal\\Base\\Models\\Campaign', 1, 'copywriter.adsmo@gmail.com', 'gửi test', 'dainguyen', 'xaynhatrongoihaiphong@gmail.com', NULL, NULL, 0, 0, '2021-06-08 02:57:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:23', '2021-06-08 02:57:23'),
(4, '155f1ee9-5002-4e8a-927b-5d89fb653add', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 1, 'hppvtien@gmail.com', 'gửi test', 'dainguyen', 'xaynhatrongoihaiphong@gmail.com', NULL, NULL, 0, 0, '2021-06-08 02:57:23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:23', '2021-06-08 02:57:23'),
(5, '73a1210f-f58f-4527-bb75-d100774d6538', 1, 1, 'Sendportal\\Base\\Models\\Campaign', 2, 'tlead02@gmail.com', 'chiến dịch 2', 'form name', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:26', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:23', '2021-06-08 02:57:26'),
(6, '6a668c18-9538-4e6a-86d5-0a9ba6757ece', 1, 2, 'Sendportal\\Base\\Models\\Campaign', 2, 'tlead03@gmail.com', 'chiến dịch 2', 'form name', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:29', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:26', '2021-06-08 02:57:29'),
(7, '8eb920f2-c265-4815-9d76-95a263a339c0', 1, 3, 'Sendportal\\Base\\Models\\Campaign', 2, 'copywriter.adsmo@gmail.com', 'chiến dịch 2', 'form name', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:32', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:29', '2021-06-08 02:57:32'),
(8, '6f457340-63a9-456e-9782-6e9a1428d558', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 2, 'hppvtien@gmail.com', 'chiến dịch 2', 'form name', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:34', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:32', '2021-06-08 02:57:34'),
(9, 'ea5a6be6-eba8-44d1-a4fa-e6002b0dde39', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 3, 'content.adsmo@gmail.com', 'xaynhatrongoihaiphong@gmail.com', 'dainguyen', 'xaynhatrongoihaiphong@gmail.com', NULL, NULL, 0, 0, '2021-06-08 02:57:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:35', '2021-06-08 02:57:35'),
(10, '66c36de4-d34b-4b00-b649-0cc20fe2da13', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 3, 'hppvtien@gmail.com', 'xaynhatrongoihaiphong@gmail.com', 'dainguyen', 'xaynhatrongoihaiphong@gmail.com', NULL, NULL, 0, 0, '2021-06-08 02:57:35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:35', '2021-06-08 02:57:35'),
(11, '63a2d065-8b51-4354-b173-6c5a4bca61f5', 1, 1, 'Sendportal\\Base\\Models\\Campaign', 4, 'tlead02@gmail.com', 'hjgjhkhjkhjkhjkhjk', 'tien', 'xaynhatrongoihaiphong@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:38', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:35', '2021-06-08 02:57:38'),
(12, '175f7376-b153-49b7-868a-fca57c1a0104', 1, 2, 'Sendportal\\Base\\Models\\Campaign', 4, 'tlead03@gmail.com', 'hjgjhkhjkhjkhjkhjk', 'tien', 'xaynhatrongoihaiphong@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:41', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:38', '2021-06-08 02:57:41'),
(13, '26b0aabc-f7e2-4faa-a42d-4c01ca60e66e', 1, 3, 'Sendportal\\Base\\Models\\Campaign', 4, 'copywriter.adsmo@gmail.com', 'hjgjhkhjkhjkhjkhjk', 'tien', 'xaynhatrongoihaiphong@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:45', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:42', '2021-06-08 02:57:45'),
(14, '0cfbb9d6-e2dd-46c7-b47e-dfbfe002a258', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 4, 'content.adsmo@gmail.com', 'hjgjhkhjkhjkhjkhjk', 'tien', 'xaynhatrongoihaiphong@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:48', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:45', '2021-06-08 02:57:48'),
(15, '012e5468-430d-4e6f-87a4-d8663f84966a', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 4, 'hppvtien@gmail.com', 'hjgjhkhjkhjkhjkhjk', 'tien', 'xaynhatrongoihaiphong@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:52', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:49', '2021-06-08 02:57:52'),
(16, '29b1f06c-4a25-4bca-b863-ce095c9ad24d', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 5, 'content.adsmo@gmail.com', 'sdddd', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:55', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:52', '2021-06-08 02:57:55'),
(17, '16cc8ff8-26ed-4317-9117-79751a57d780', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 5, 'hppvtien@gmail.com', 'sdddd', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:57:59', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:55', '2021-06-08 02:57:59'),
(18, 'faba51e5-cd57-4296-b28c-c32b8fb5d517', 1, 1, 'Sendportal\\Base\\Models\\Campaign', 6, 'tlead02@gmail.com', 'test com', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:58:02', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:57:59', '2021-06-08 02:58:02'),
(19, 'af455e96-19a7-481b-aa5c-e23ccb882bf9', 1, 2, 'Sendportal\\Base\\Models\\Campaign', 6, 'tlead03@gmail.com', 'test com', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:58:06', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:58:02', '2021-06-08 02:58:06'),
(20, 'b4788879-e5f2-4b51-98a1-a1b9bf3d5437', 1, 3, 'Sendportal\\Base\\Models\\Campaign', 6, 'copywriter.adsmo@gmail.com', 'test com', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:58:10', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:58:06', '2021-06-08 02:58:10'),
(21, 'd7c448b3-9e6a-4db9-8dbf-5d76ec739923', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 6, 'content.adsmo@gmail.com', 'test com', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:58:13', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:58:10', '2021-06-08 02:58:13'),
(22, '4ee21290-72eb-4f3d-8092-9eff7ce94522', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 6, 'hppvtien@gmail.com', 'test com', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:58:17', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:58:13', '2021-06-08 02:58:17'),
(23, '6175177e-46bf-4fb5-a55b-8ac9be5705af', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 7, 'content.adsmo@gmail.com', 'ddd', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:58:19', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:58:17', '2021-06-08 02:58:19'),
(24, '02e9b046-9f84-468b-9f27-a68280f2d50f', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 7, 'hppvtien@gmail.com', 'ddd', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 02:58:22', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 02:58:20', '2021-06-08 02:58:22'),
(25, '85f26441-8a60-40d4-b35a-eef568a43f8d', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 8, 'content.adsmo@gmail.com', 'test 0906', 'form name', 'tlead01@gmail.com', NULL, NULL, 0, 0, '2021-06-08 19:34:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 19:34:25', '2021-06-08 19:34:25'),
(26, 'dc4aa49c-d1fe-430f-ae98-7c3481b42a65', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 8, 'hppvtien@gmail.com', 'test 0906', 'form name', 'tlead01@gmail.com', NULL, NULL, 0, 0, '2021-06-08 19:34:25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 19:34:25', '2021-06-08 19:34:25'),
(27, 'ccffe2b0-0144-4cf9-9ad9-167373795a99', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 9, 'xaynhatrongoihaiphong@gmail.com', 'addd', 'dainguyen', 'tlead01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-08 20:57:21', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-08 20:57:16', '2021-06-08 20:57:21'),
(28, '7787ffab-9721-405e-88bb-5d219b6e26c4', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 10, 'xaynhatrongoihaiphong@gmail.com', 'abc', 'sdfsdf', 'tlead01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 03:07:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 03:07:03', '2021-06-09 03:07:03'),
(29, '7e7e341a-2bf3-4d7f-aa72-586e351dc57b', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 12, 'xaynhatrongoihaiphong@gmail.com', 'cccccc', 'cccccc', 'tlead01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 03:38:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 03:38:03', '2021-06-09 03:38:03'),
(30, '174b4090-8f00-458e-82fc-2a4720e8d9f4', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 13, 'xaynhatrongoihaiphong@gmail.com', 'abc', 'abc', 'tlead01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 03:43:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 03:43:02', '2021-06-09 03:43:02'),
(31, '358cd501-2607-41cd-9439-20e1a8134d40', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 14, 'xaynhatrongoihaiphong@gmail.com', 'bbbbbbbb', 'bbbbbbb', 'tlead01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 03:48:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 03:48:02', '2021-06-09 03:48:02'),
(34, '2b69400a-645d-49f2-9112-f3b521f4e496', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 16, 'xaynhatrongoihaiphong@gmail.com', 'nnnnnn', 'nnnnnn', 'tlead01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:02:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:02:02', '2021-06-09 04:02:02'),
(35, '5fc835c0-dcb7-4702-b814-a2b07d360732', 1, 7, 'Sendportal\\Base\\Models\\Campaign', 16, 'nguyenxuandai217@gmail.com', 'nnnnnn', 'nnnnnn', 'tlead01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:02:02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:02:02', '2021-06-09 04:02:02'),
(36, '5ba93e36-fdcb-499c-991f-02c96985a26e', 1, 1, 'Sendportal\\Base\\Models\\Campaign', 17, 'tlead02@gmail.com', 'ádasdasdasdasdasd', 'ádasdsadasdasd', 'hppvtien@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 04:10:08', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:10:04', '2021-06-09 04:10:08'),
(37, 'bc6e3583-d09d-4a7c-907f-08bd3ec41d4d', 1, 2, 'Sendportal\\Base\\Models\\Campaign', 17, 'tlead03@gmail.com', 'ádasdasdasdasdasd', 'ádasdsadasdasd', 'hppvtien@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 04:10:12', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:10:08', '2021-06-09 04:10:12'),
(38, '1b2a6e4a-e5ac-4988-a65d-6d86541f4b4c', 1, 3, 'Sendportal\\Base\\Models\\Campaign', 17, 'copywriter.adsmo@gmail.com', 'ádasdasdasdasdasd', 'ádasdsadasdasd', 'hppvtien@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 04:10:15', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:10:12', '2021-06-09 04:10:15'),
(39, '76e70cbf-b5d9-4ef6-97ae-7612b546225e', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 17, 'content.adsmo@gmail.com', 'ádasdasdasdasdasd', 'ádasdsadasdasd', 'hppvtien@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 04:10:21', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:10:18', '2021-06-09 04:10:21'),
(40, 'e63bb722-d8ae-4815-b161-1132f827af9a', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 17, 'hppvtien@gmail.com', 'ádasdasdasdasdasd', 'ádasdsadasdasd', 'hppvtien@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 04:10:25', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:10:21', '2021-06-09 04:10:25'),
(41, 'f53ad292-a89e-4b20-9616-81e78fd98753', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 17, 'xaynhatrongoihaiphong@gmail.com', 'ádasdasdasdasdasd', 'ádasdsadasdasd', 'hppvtien@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 04:10:28', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:10:25', '2021-06-09 04:10:28'),
(42, '09360b59-761a-48fb-ad40-3a00fe5d2fe9', 1, 7, 'Sendportal\\Base\\Models\\Campaign', 17, 'nguyenxuandai217@gmail.com', 'ádasdasdasdasdasd', 'ádasdsadasdasd', 'hppvtien@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 04:10:32', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:10:29', '2021-06-09 04:10:32'),
(43, '2cb4d9dc-5912-40ef-ac8c-713f065602f0', 1, 1, 'Sendportal\\Base\\Models\\Campaign', 18, 'tlead02@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:15:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:15:03', '2021-06-09 04:15:03'),
(44, 'c26007ce-158e-4da0-930c-04e679729ee6', 1, 2, 'Sendportal\\Base\\Models\\Campaign', 18, 'tlead03@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:15:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:15:03', '2021-06-09 04:15:03'),
(45, 'cb3e5ae9-358f-4a12-b824-d2e7fe97ae15', 1, 3, 'Sendportal\\Base\\Models\\Campaign', 18, 'copywriter.adsmo@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:15:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:15:03', '2021-06-09 04:15:03'),
(46, '0a9c53f7-ffbc-4029-b546-bd6e7606af6a', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 18, 'content.adsmo@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:15:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:15:03', '2021-06-09 04:15:03'),
(47, '3b9f3651-0389-495d-a048-9aabe72262c7', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 18, 'hppvtien@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:15:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:15:03', '2021-06-09 04:15:03'),
(48, 'd17add33-5960-4089-9602-5cb696c2eb16', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 18, 'xaynhatrongoihaiphong@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:15:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:15:03', '2021-06-09 04:15:03'),
(49, '3b75aa51-ea02-492f-841f-2f3fe2166d45', 1, 7, 'Sendportal\\Base\\Models\\Campaign', 18, 'nguyenxuandai217@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', NULL, NULL, 0, 0, '2021-06-09 04:15:03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 04:15:03', '2021-06-09 04:15:03'),
(50, '61b2bddb-2302-4755-aa03-c5f96e009181', 1, 1, 'Sendportal\\Base\\Models\\Campaign', 19, 'tlead02@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 05:48:06', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 05:48:02', '2021-06-09 05:48:06'),
(51, '3fcd8d65-28bb-45b7-aa8f-fe148cbb3e24', 1, 2, 'Sendportal\\Base\\Models\\Campaign', 19, 'tlead03@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 05:48:09', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 05:48:06', '2021-06-09 05:48:09'),
(52, 'f287a9f5-8650-48ca-8389-64c07ab82a74', 1, 3, 'Sendportal\\Base\\Models\\Campaign', 19, 'copywriter.adsmo@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 05:48:13', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 05:48:09', '2021-06-09 05:48:13'),
(53, 'b9e1ef71-7ab1-4d12-a926-5c3cb6891978', 1, 4, 'Sendportal\\Base\\Models\\Campaign', 19, 'content.adsmo@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 05:48:16', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 05:48:13', '2021-06-09 05:48:16'),
(54, '7f1f92c7-6659-4efa-a94f-61976aa71032', 1, 5, 'Sendportal\\Base\\Models\\Campaign', 19, 'hppvtien@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 05:48:19', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 05:48:16', '2021-06-09 05:48:19'),
(55, '50e6c5b1-970d-4d99-b495-7167c863f89b', 1, 6, 'Sendportal\\Base\\Models\\Campaign', 19, 'xaynhatrongoihaiphong@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 05:48:23', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 05:48:20', '2021-06-09 05:48:23'),
(56, '5452bc06-3fa1-4358-9576-3a713ae8969a', 1, 7, 'Sendportal\\Base\\Models\\Campaign', 19, 'nguyenxuandai217@gmail.com', 'SMALL CAM...BIG PROFIT', 'UNISPICE DAN', 'dk.dichvu01@gmail.com', '1', NULL, 0, 0, NULL, '2021-06-09 05:48:26', NULL, NULL, NULL, NULL, NULL, NULL, '2021-06-09 05:48:23', '2021-06-09 05:48:26');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_message_failures`
--

CREATE TABLE `sendportal_message_failures` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_id` int(10) UNSIGNED NOT NULL,
  `severity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `failed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_message_urls`
--

CREATE TABLE `sendportal_message_urls` (
  `id` int(10) UNSIGNED NOT NULL,
  `source_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source_id` int(10) UNSIGNED NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `click_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_subscribers`
--

CREATE TABLE `sendportal_subscribers` (
  `id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `hash` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `unsubscribed_at` timestamp NULL DEFAULT NULL,
  `unsubscribe_event_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_subscribers`
--

INSERT INTO `sendportal_subscribers` (`id`, `workspace_id`, `hash`, `email`, `first_name`, `last_name`, `meta`, `unsubscribed_at`, `unsubscribe_event_id`, `created_at`, `updated_at`) VALUES
(1, 1, '0014b051-81a4-47e7-8227-b742ef7cd1c9', 'tlead02@gmail.com', 'thảo', 'adsmo', NULL, NULL, NULL, '2021-06-08 00:32:27', '2021-06-08 00:32:27'),
(2, 1, '93fe1009-ae74-4ca3-9728-2d8b7c4bf67e', 'tlead03@gmail.com', 'Tuấn', 'Anh', NULL, NULL, NULL, '2021-06-08 00:32:58', '2021-06-08 00:32:58'),
(3, 1, '208b8da4-96a2-4166-a71e-9929072e441d', 'copywriter.adsmo@gmail.com', 'Vân', 'Anh', NULL, NULL, NULL, '2021-06-08 00:33:42', '2021-06-08 00:33:42'),
(4, 1, '4bdcc94d-8501-4f53-b1f3-02027fdb67a2', 'content.adsmo@gmail.com', 'Bich', 'Ngoc', NULL, NULL, NULL, '2021-06-08 00:34:19', '2021-06-08 00:34:19'),
(5, 1, '21a5c835-1225-4242-b066-abdc004d5fd0', 'hppvtien@gmail.com', 'tien', 'pham', NULL, NULL, NULL, '2021-06-08 01:27:13', '2021-06-08 01:27:13'),
(6, 1, 'c96e3677-80d9-48a9-a0c2-0d6f8103bb79', 'xaynhatrongoihaiphong@gmail.com', 'dainguyen', 'dai', NULL, NULL, NULL, '2021-06-08 19:38:32', '2021-06-08 19:38:32'),
(7, 1, 'e6cf1895-767e-49d1-bd06-dbfc87609f53', 'nguyenxuandai217@gmail.com', 'dai', 'nguyen', NULL, NULL, NULL, '2021-06-09 03:51:00', '2021-06-09 03:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_tags`
--

CREATE TABLE `sendportal_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_tags`
--

INSERT INTO `sendportal_tags` (`id`, `workspace_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Email mua hàng', '2021-06-08 00:31:25', '2021-06-08 00:31:25'),
(2, 1, 'Email quảng cáo', '2021-06-08 00:31:49', '2021-06-08 00:31:49');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_tag_subscriber`
--

CREATE TABLE `sendportal_tag_subscriber` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `subscriber_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_tag_subscriber`
--

INSERT INTO `sendportal_tag_subscriber` (`id`, `tag_id`, `subscriber_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2021-06-08 00:32:27', '2021-06-08 00:32:27'),
(3, 1, 3, '2021-06-08 00:33:42', '2021-06-08 00:33:42'),
(5, 1, 2, '2021-06-08 00:37:16', '2021-06-08 00:37:16'),
(6, 1, 5, '2021-06-08 01:27:13', '2021-06-08 01:27:13'),
(9, 1, 4, '2021-06-08 19:38:43', '2021-06-08 19:38:43'),
(10, 2, 6, '2021-06-08 19:38:53', '2021-06-08 19:38:53'),
(11, 2, 7, '2021-06-09 03:51:00', '2021-06-09 03:51:00');

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_templates`
--

CREATE TABLE `sendportal_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_templates`
--

INSERT INTO `sendportal_templates` (`id`, `workspace_id`, `name`, `content`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 'templa don hang', '<table data-gjs-highlightable=\"true\" id=\"iwos\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\"><tbody data-gjs-highlightable=\"true\" id=\"ibdl\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"iq8f\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"i7oe\" data-gjs-type=\"cell\" draggable=\"true\" align=\"center\" valign=\"top\" class=\"\"><div data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_header_image\" data-gjs-type=\"text\" draggable=\"true\">\r\n													</div><font data-gjs-highlightable=\"true\" id=\"iwtj\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n							</font><font data-gjs-highlightable=\"true\" id=\"invv\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n						</font><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_container\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"><tbody data-gjs-highlightable=\"true\" id=\"iwozs\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"iayhb\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"icw6l\" data-gjs-type=\"cell\" draggable=\"true\" align=\"center\" valign=\"top\"><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_header\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody data-gjs-highlightable=\"true\" id=\"i26kc\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"ie2jt\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"m_5063188309675374655header_wrapper\" data-gjs-type=\"cell\" draggable=\"true\" class=\"\"><h1 data-gjs-highlightable=\"true\" id=\"ifrmh\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Cám ơn bạn đã đặt hàng</h1></td></tr></tbody></table></td></tr><tr data-gjs-highlightable=\"true\" id=\"ivw17\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"i6tkj\" data-gjs-type=\"cell\" draggable=\"true\" align=\"center\" valign=\"top\"><font data-gjs-highlightable=\"true\" id=\"isi2j\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n										</font><font data-gjs-highlightable=\"true\" id=\"ilp3h\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n									</font><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_body\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"><tbody data-gjs-highlightable=\"true\" id=\"ilab5\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"isudb\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"m_5063188309675374655body_content\" data-gjs-type=\"cell\" draggable=\"true\" valign=\"top\"><font data-gjs-highlightable=\"true\" id=\"ih3h5\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n													</font><font data-gjs-highlightable=\"true\" id=\"in9gc\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n												</font><table data-gjs-highlightable=\"true\" id=\"i6ji7\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"20\" cellspacing=\"0\" width=\"100%\"><tbody data-gjs-highlightable=\"true\" id=\"i63li\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"i5f9k\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"ioh1v\" data-gjs-type=\"cell\" draggable=\"true\" valign=\"top\" class=\"\"><div data-gjs-highlightable=\"true\" id=\"m_5063188309675374655body_content_inner\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><p data-gjs-highlightable=\"true\" id=\"iksft\" data-gjs-type=\"text\" draggable=\"true\">Xin chào Tien,</p><p data-gjs-highlightable=\"true\" id=\"ioi4f\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Cảm ơn đã đặt hàng. Đơn hàng sẽ bị tạm giữ cho đến khi chúng tôi xác nhận thanh toán hoàn thành. Trong thời gian chờ đợi, đây là lời nhắc về những gì bạn đã đặt hàng:</p><section data-gjs-highlightable=\"true\" id=\"iqd5k\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><h2 data-gjs-highlightable=\"true\" id=\"ifhf5\" data-gjs-type=\"text\" draggable=\"true\">Thông tin chuyển khoản ngân hàng</h2><img id=\"ijpymy\" data-gjs-type=\"image\" draggable=\"true\" src=\"data:image/jpeg;base64,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\" class=\"gjs-selected\"><h3 data-gjs-highlightable=\"true\" id=\"idc2i\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Natico:</h3><ul data-gjs-highlightable=\"true\" id=\"ieyjl\" data-gjs-type=\"default\" draggable=\"true\"><li data-gjs-highlightable=\"true\" id=\"if6b5\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Ngân hàng: <strong id=\"iqcej\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">VietComBank</strong></li><li data-gjs-highlightable=\"true\" id=\"its3t\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Số tài khoản: <strong id=\"iiooo\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">0123456789</strong></li></ul></section><h2 data-gjs-highlightable=\"true\" id=\"iawjl\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">\r\n	[Đơn hàng #2936] (07/06/2021)</h2><div data-gjs-highlightable=\"true\" id=\"ir9wn\" data-gjs-type=\"default\" draggable=\"true\"><table data-gjs-highlightable=\"true\" id=\"iifvt\" data-gjs-type=\"table\" draggable=\"true\" cellspacing=\"0\" cellpadding=\"6\" border=\"1\"><thead data-gjs-highlightable=\"true\" id=\"iimrn\" data-gjs-type=\"thead\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"ivs0b\" data-gjs-type=\"row\" draggable=\"true\"><th data-gjs-highlightable=\"true\" id=\"ixxlr\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"col\">Sản phẩm</th><th data-gjs-highlightable=\"true\" id=\"i7zq4\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"col\">Số lượng</th><th data-gjs-highlightable=\"true\" id=\"ialv7\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"col\">Đơn giá</th></tr></thead><tbody data-gjs-highlightable=\"true\" id=\"ikg0l\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"i8dlg\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"im9mi\" data-gjs-type=\"cell\" draggable=\"true\">\r\n		NHA TRANG - ĐÀ LẠT - HỒ CHÍ MINH		</td><td data-gjs-highlightable=\"true\" id=\"ijdlq\" data-gjs-type=\"cell\" draggable=\"true\">\r\n			1		</td><td data-gjs-highlightable=\"true\" id=\"isgbs\" data-gjs-type=\"cell\" draggable=\"true\"><span data-gjs-highlightable=\"true\" id=\"if3zi\" data-gjs-type=\"text\" draggable=\"true\">6,569,000<span id=\"iu7di\" data-gjs-type=\"text\" draggable=\"true\">₫</span></span></td></tr></tbody><tfoot data-gjs-highlightable=\"true\" id=\"inwgx\" data-gjs-type=\"tfoot\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"i32gb\" data-gjs-type=\"row\" draggable=\"true\"><th data-gjs-highlightable=\"true\" id=\"iduqs\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"row\" colspan=\"2\">Tổng số phụ:</th><td data-gjs-highlightable=\"true\" id=\"iidzo\" data-gjs-type=\"cell\" draggable=\"true\"><span data-gjs-highlightable=\"true\" id=\"iod0j\" data-gjs-type=\"text\" draggable=\"true\">6,569,000<span id=\"i07yb\" data-gjs-type=\"text\" draggable=\"true\">₫</span></span></td></tr><tr data-gjs-highlightable=\"true\" id=\"iwrsi\" data-gjs-type=\"row\" draggable=\"true\"><th data-gjs-highlightable=\"true\" id=\"igou9\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"row\" colspan=\"2\">Phương thức thanh toán:</th><td data-gjs-highlightable=\"true\" id=\"itjnp\" data-gjs-type=\"cell\" draggable=\"true\">Chuyển khoản ngân hàng</td></tr><tr data-gjs-highlightable=\"true\" id=\"iz9ne\" data-gjs-type=\"row\" draggable=\"true\"><th data-gjs-highlightable=\"true\" id=\"i5o6g\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"row\" colspan=\"2\">Tổng tiền:</th><td data-gjs-highlightable=\"true\" id=\"i9poo\" data-gjs-type=\"cell\" draggable=\"true\"><span data-gjs-highlightable=\"true\" id=\"i34i1\" data-gjs-type=\"text\" draggable=\"true\">6,569,000<span id=\"iesd1c\" data-gjs-type=\"text\" draggable=\"true\">₫</span></span></td></tr></tfoot></table></div><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655addresses\" data-gjs-type=\"table\" draggable=\"true\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody data-gjs-highlightable=\"true\" id=\"ihkqij\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"i99nvv\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"ir6t93\" data-gjs-type=\"cell\" draggable=\"true\" valign=\"top\" width=\"50%\"><h2 data-gjs-highlightable=\"true\" id=\"igmq2k\" data-gjs-type=\"text\" draggable=\"true\">Địa chỉ thanh toán</h2><address data-gjs-highlightable=\"true\" id=\"iqis0i\" data-gjs-type=\"text\" draggable=\"true\">\r\n				Tien Pham<br id=\"i3qiuw\" data-gjs-type=\"default\" draggable=\"true\">Nam vfg<br id=\"iwvstr\" data-gjs-type=\"default\" draggable=\"true\">Ha noi<br id=\"iualvs\" data-gjs-type=\"default\" draggable=\"true\">Hai Phong									<br id=\"ihyupa\" data-gjs-type=\"default\" draggable=\"true\"><a id=\"inj0w7\" data-gjs-type=\"link\" draggable=\"true\" href=\"tel:0969938801\" target=\"_blank\">0969938801</a><br id=\"i5xnjn\" data-gjs-type=\"default\" draggable=\"true\"><a id=\"ien8gh\" data-gjs-type=\"link\" draggable=\"true\" href=\"mailto:hppvtien@gmail.com\" target=\"_blank\">hppvtien@gmail.com</a></address></td></tr></tbody></table><p data-gjs-highlightable=\"true\" id=\"ioar7t\" data-gjs-type=\"text\" draggable=\"true\">We look forward to fulfilling your order soon.</p><font data-gjs-highlightable=\"true\" id=\"il3w64\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n															</font></div><font data-gjs-highlightable=\"true\" id=\"i1nhw5\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n														</font></td></tr></tbody></table><font data-gjs-highlightable=\"true\" id=\"i8lqn7\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n												\r\n											</font></td></tr></tbody></table><font data-gjs-highlightable=\"true\" id=\"imlfen\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n									\r\n								</font></td></tr></tbody></table><font data-gjs-highlightable=\"true\" id=\"i1jghy\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n					</font></td></tr><tr data-gjs-highlightable=\"true\" id=\"ie4bcm\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"i131t3\" data-gjs-type=\"cell\" draggable=\"true\" align=\"center\" valign=\"top\"><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_footer\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"600\"><tbody data-gjs-highlightable=\"true\" id=\"ijdiql\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"izqth8\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"ik9juq\" data-gjs-type=\"cell\" draggable=\"true\" valign=\"top\"><table data-gjs-highlightable=\"true\" id=\"iashxe\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"100%\"><tbody data-gjs-highlightable=\"true\" id=\"ivckxi\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"igl82h\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"m_5063188309675374655credit\" data-gjs-type=\"cell\" draggable=\"true\" colspan=\"2\" valign=\"middle\"><p data-gjs-highlightable=\"true\" id=\"isr77i\" data-gjs-type=\"text\" draggable=\"true\">smartmarket</p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', 0, '2021-06-08 00:24:57', '2021-06-08 00:24:57');
INSERT INTO `sendportal_templates` (`id`, `workspace_id`, `name`, `content`, `type`, `created_at`, `updated_at`) VALUES
INSERT INTO `sendportal_templates` (`id`, `workspace_id`, `name`, `content`, `type`, `created_at`, `updated_at`) VALUES
(19, 1, 'Áo Phông 2019 Phong Cách Mớiwwwww', '<table data-gjs-highlightable=\"true\" id=\"iwos\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\"><tbody data-gjs-highlightable=\"true\" id=\"ibdl\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"iq8f\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"i7oe\" data-gjs-type=\"cell\" draggable=\"true\" align=\"center\" valign=\"top\" class=\"\"><div data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_header_image\" data-gjs-type=\"text\" draggable=\"true\">\r\n													</div><font data-gjs-highlightable=\"true\" id=\"iwtj\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n							</font><font data-gjs-highlightable=\"true\" id=\"invv\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n						</font><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_container\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"><tbody data-gjs-highlightable=\"true\" id=\"iwozs\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"iayhb\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"icw6l\" data-gjs-type=\"cell\" draggable=\"true\" align=\"center\" valign=\"top\"><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_header\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\"><tbody data-gjs-highlightable=\"true\" id=\"i26kc\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"ie2jt\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"m_5063188309675374655header_wrapper\" data-gjs-type=\"cell\" draggable=\"true\" class=\"\"><h1 data-gjs-highlightable=\"true\" id=\"ifrmh\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Cám ơn bạn đã đặt hàng</h1></td></tr></tbody></table></td></tr><tr data-gjs-highlightable=\"true\" id=\"ivw17\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"i6tkj\" data-gjs-type=\"cell\" draggable=\"true\" align=\"center\" valign=\"top\"><font data-gjs-highlightable=\"true\" id=\"isi2j\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n										</font><font data-gjs-highlightable=\"true\" id=\"ilp3h\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n									</font><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_body\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\"><tbody data-gjs-highlightable=\"true\" id=\"ilab5\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"isudb\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"m_5063188309675374655body_content\" data-gjs-type=\"cell\" draggable=\"true\" valign=\"top\"><font data-gjs-highlightable=\"true\" id=\"ih3h5\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n													</font><font data-gjs-highlightable=\"true\" id=\"in9gc\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n												</font><table data-gjs-highlightable=\"true\" id=\"i6ji7\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"20\" cellspacing=\"0\" width=\"100%\"><tbody data-gjs-highlightable=\"true\" id=\"i63li\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"i5f9k\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"ioh1v\" data-gjs-type=\"cell\" draggable=\"true\" valign=\"top\" class=\"\"><div data-gjs-highlightable=\"true\" id=\"m_5063188309675374655body_content_inner\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><p data-gjs-highlightable=\"true\" id=\"iksft\" data-gjs-type=\"text\" draggable=\"true\">Xin chào Tien,</p><p data-gjs-highlightable=\"true\" id=\"ioi4f\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Cảm ơn đã đặt hàng. Đơn hàng sẽ bị tạm giữ cho đến khi chúng tôi xác nhận thanh toán hoàn thành. Trong thời gian chờ đợi, đây là lời nhắc về những gì bạn đã đặt hàng:</p><section data-gjs-highlightable=\"true\" id=\"iqd5k\" data-gjs-type=\"default\" draggable=\"true\" class=\"\"><h2 data-gjs-highlightable=\"true\" id=\"ifhf5\" data-gjs-type=\"text\" draggable=\"true\">Thông tin chuyển khoản ngân hàng</h2><img id=\"ijpymy\" data-gjs-type=\"image\" draggable=\"true\" src=\"data:image/jpeg;base64,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\" class=\"gjs-selected\"><h3 data-gjs-highlightable=\"true\" id=\"idc2i\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Natico:</h3><ul data-gjs-highlightable=\"true\" id=\"ieyjl\" data-gjs-type=\"default\" draggable=\"true\"><li data-gjs-highlightable=\"true\" id=\"if6b5\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Ngân hàng: <strong id=\"iqcej\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">VietComBank</strong></li><li data-gjs-highlightable=\"true\" id=\"its3t\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">Số tài khoản: <strong id=\"iiooo\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">0123456789</strong></li></ul></section><h2 data-gjs-highlightable=\"true\" id=\"iawjl\" data-gjs-type=\"text\" draggable=\"true\" class=\"\">\r\n	[Đơn hàng #2936] (07/06/2021)</h2><div data-gjs-highlightable=\"true\" id=\"ir9wn\" data-gjs-type=\"default\" draggable=\"true\"><table data-gjs-highlightable=\"true\" id=\"iifvt\" data-gjs-type=\"table\" draggable=\"true\" cellspacing=\"0\" cellpadding=\"6\" border=\"1\"><thead data-gjs-highlightable=\"true\" id=\"iimrn\" data-gjs-type=\"thead\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"ivs0b\" data-gjs-type=\"row\" draggable=\"true\"><th data-gjs-highlightable=\"true\" id=\"ixxlr\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"col\">Sản phẩm</th><th data-gjs-highlightable=\"true\" id=\"i7zq4\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"col\">Số lượng</th><th data-gjs-highlightable=\"true\" id=\"ialv7\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"col\">Đơn giá</th></tr></thead><tbody data-gjs-highlightable=\"true\" id=\"ikg0l\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"i8dlg\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"im9mi\" data-gjs-type=\"cell\" draggable=\"true\">\r\n		NHA TRANG - ĐÀ LẠT - HỒ CHÍ MINH		</td><td data-gjs-highlightable=\"true\" id=\"ijdlq\" data-gjs-type=\"cell\" draggable=\"true\">\r\n			1		</td><td data-gjs-highlightable=\"true\" id=\"isgbs\" data-gjs-type=\"cell\" draggable=\"true\"><span data-gjs-highlightable=\"true\" id=\"if3zi\" data-gjs-type=\"text\" draggable=\"true\">6,569,000<span id=\"iu7di\" data-gjs-type=\"text\" draggable=\"true\">₫</span></span></td></tr></tbody><tfoot data-gjs-highlightable=\"true\" id=\"inwgx\" data-gjs-type=\"tfoot\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"i32gb\" data-gjs-type=\"row\" draggable=\"true\"><th data-gjs-highlightable=\"true\" id=\"iduqs\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"row\" colspan=\"2\">Tổng số phụ:</th><td data-gjs-highlightable=\"true\" id=\"iidzo\" data-gjs-type=\"cell\" draggable=\"true\"><span data-gjs-highlightable=\"true\" id=\"iod0j\" data-gjs-type=\"text\" draggable=\"true\">6,569,000<span id=\"i07yb\" data-gjs-type=\"text\" draggable=\"true\">₫</span></span></td></tr><tr data-gjs-highlightable=\"true\" id=\"iwrsi\" data-gjs-type=\"row\" draggable=\"true\"><th data-gjs-highlightable=\"true\" id=\"igou9\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"row\" colspan=\"2\">Phương thức thanh toán:</th><td data-gjs-highlightable=\"true\" id=\"itjnp\" data-gjs-type=\"cell\" draggable=\"true\">Chuyển khoản ngân hàng</td></tr><tr data-gjs-highlightable=\"true\" id=\"iz9ne\" data-gjs-type=\"row\" draggable=\"true\"><th data-gjs-highlightable=\"true\" id=\"i5o6g\" data-gjs-type=\"cell\" draggable=\"true\" scope=\"row\" colspan=\"2\">Tổng tiền:</th><td data-gjs-highlightable=\"true\" id=\"i9poo\" data-gjs-type=\"cell\" draggable=\"true\"><span data-gjs-highlightable=\"true\" id=\"i34i1\" data-gjs-type=\"text\" draggable=\"true\">6,569,000<span id=\"iesd1c\" data-gjs-type=\"text\" draggable=\"true\">₫</span></span></td></tr></tfoot></table></div><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655addresses\" data-gjs-type=\"table\" draggable=\"true\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><tbody data-gjs-highlightable=\"true\" id=\"ihkqij\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"i99nvv\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"ir6t93\" data-gjs-type=\"cell\" draggable=\"true\" valign=\"top\" width=\"50%\"><h2 data-gjs-highlightable=\"true\" id=\"igmq2k\" data-gjs-type=\"text\" draggable=\"true\">Địa chỉ thanh toán</h2><address data-gjs-highlightable=\"true\" id=\"iqis0i\" data-gjs-type=\"text\" draggable=\"true\">\r\n				Tien Pham<br id=\"i3qiuw\" data-gjs-type=\"default\" draggable=\"true\">Nam vfg<br id=\"iwvstr\" data-gjs-type=\"default\" draggable=\"true\">Ha noi<br id=\"iualvs\" data-gjs-type=\"default\" draggable=\"true\">Hai Phong									<br id=\"ihyupa\" data-gjs-type=\"default\" draggable=\"true\"><a id=\"inj0w7\" data-gjs-type=\"link\" draggable=\"true\" href=\"tel:0969938801\" target=\"_blank\">0969938801</a><br id=\"i5xnjn\" data-gjs-type=\"default\" draggable=\"true\"><a id=\"ien8gh\" data-gjs-type=\"link\" draggable=\"true\" href=\"mailto:hppvtien@gmail.com\" target=\"_blank\">hppvtien@gmail.com</a></address></td></tr></tbody></table><p data-gjs-highlightable=\"true\" id=\"ioar7t\" data-gjs-type=\"text\" draggable=\"true\">We look forward to fulfilling your order soon.</p><font data-gjs-highlightable=\"true\" id=\"il3w64\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n															</font></div><font data-gjs-highlightable=\"true\" id=\"i1nhw5\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n														</font></td></tr></tbody></table><font data-gjs-highlightable=\"true\" id=\"i8lqn7\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n												\r\n											</font></td></tr></tbody></table><font data-gjs-highlightable=\"true\" id=\"imlfen\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n									\r\n								</font></td></tr></tbody></table><font data-gjs-highlightable=\"true\" id=\"i1jghy\" data-gjs-type=\"text\" draggable=\"true\" color=\"#888888\">\r\n					</font></td></tr><tr data-gjs-highlightable=\"true\" id=\"ie4bcm\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"i131t3\" data-gjs-type=\"cell\" draggable=\"true\" align=\"center\" valign=\"top\"><table data-gjs-highlightable=\"true\" id=\"m_5063188309675374655template_footer\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"600\"><tbody data-gjs-highlightable=\"true\" id=\"ijdiql\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"izqth8\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"ik9juq\" data-gjs-type=\"cell\" draggable=\"true\" valign=\"top\"><table data-gjs-highlightable=\"true\" id=\"iashxe\" data-gjs-type=\"table\" draggable=\"true\" border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"100%\"><tbody data-gjs-highlightable=\"true\" id=\"ivckxi\" data-gjs-type=\"tbody\" draggable=\"true\"><tr data-gjs-highlightable=\"true\" id=\"igl82h\" data-gjs-type=\"row\" draggable=\"true\"><td data-gjs-highlightable=\"true\" id=\"m_5063188309675374655credit\" data-gjs-type=\"cell\" draggable=\"true\" colspan=\"2\" valign=\"middle\"><p data-gjs-highlightable=\"true\" id=\"isr77i\" data-gjs-type=\"text\" draggable=\"true\">smartmarket</p></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table>', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sendportal_unsubscribe_event_types`
--

CREATE TABLE `sendportal_unsubscribe_event_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sendportal_unsubscribe_event_types`
--

INSERT INTO `sendportal_unsubscribe_event_types` (`id`, `name`) VALUES
(1, 'Bounce'),
(2, 'Complaint'),
(3, 'Manual by Admin'),
(4, 'Manual by Subscriber');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `api_token` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_workspace_id` int(10) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locale` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `current_workspace_id`, `remember_token`, `locale`, `created_at`, `updated_at`) VALUES
(1, 'Nguyen Dai', 'admin@gmail.com', '2021-06-09 19:19:10', '$2y$10$6kycM/AMGAq7UOM.cQEHZe5.LFKXAMzHO3B1mAYaMX7OQ5bB0eaS.', NULL, 1, NULL, 'en', '2021-06-09 19:18:44', '2022-02-14 00:09:51'),
(16, 'Tien Van Pham', 'hppvtien@gmail.com', '2022-03-30 19:48:19', '$2y$10$tIMjId6BglUumlkI4tiUYug6mKBQYLppUbawLo4zXr1bblMg8wjFG', NULL, 1, NULL, 'en', '2022-03-30 19:47:56', '2022-03-30 19:48:19');

-- --------------------------------------------------------

--
-- Table structure for table `workspaces`
--

CREATE TABLE `workspaces` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workspaces`
--

INSERT INTO `workspaces` (`id`, `owner_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '2021-06-07 23:52:28', '2021-06-07 23:52:28');

-- --------------------------------------------------------

--
-- Table structure for table `workspace_users`
--

CREATE TABLE `workspace_users` (
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `workspace_users`
--

INSERT INTO `workspace_users` (`workspace_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 1, 'owner', '2021-06-07 23:52:28', '2021-06-07 23:52:28'),
(1, 16, 'member', '2022-03-30 19:47:56', '2022-03-30 19:47:56');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_tokens_api_token_unique` (`api_token`),
  ADD KEY `api_tokens_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invitations_token_unique` (`token`),
  ADD KEY `invitations_workspace_id_index` (`workspace_id`),
  ADD KEY `invitations_user_id_index` (`user_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `sendportal_campaigns`
--
ALTER TABLE `sendportal_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_campaigns_status_id_foreign` (`status_id`),
  ADD KEY `sendportal_campaigns_template_id_foreign` (`template_id`),
  ADD KEY `sendportal_campaigns_email_service_id_foreign` (`email_service_id`),
  ADD KEY `sendportal_campaigns_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `sendportal_campaign_statuses`
--
ALTER TABLE `sendportal_campaign_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sendportal_campaign_tag`
--
ALTER TABLE `sendportal_campaign_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_campaign_segment_campaign_id_foreign` (`campaign_id`),
  ADD KEY `sendportal_campaign_segment_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `sendportal_email_services`
--
ALTER TABLE `sendportal_email_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_email_services_type_id_foreign` (`type_id`),
  ADD KEY `sendportal_email_services_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `sendportal_email_service_types`
--
ALTER TABLE `sendportal_email_service_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sendportal_messages`
--
ALTER TABLE `sendportal_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sendportal_messages_hash_unique` (`hash`),
  ADD KEY `sendportal_messages_workspace_id_index` (`workspace_id`),
  ADD KEY `sendportal_messages_subscriber_id_index` (`subscriber_id`),
  ADD KEY `sendportal_messages_source_type_index` (`source_type`),
  ADD KEY `sendportal_messages_source_id_index` (`source_id`),
  ADD KEY `sendportal_messages_message_id_index` (`message_id`),
  ADD KEY `sendportal_messages_queued_at_index` (`queued_at`),
  ADD KEY `sendportal_messages_sent_at_index` (`sent_at`),
  ADD KEY `sendportal_messages_delivered_at_index` (`delivered_at`),
  ADD KEY `sendportal_messages_bounced_at_index` (`bounced_at`),
  ADD KEY `sendportal_messages_unsubscribed_at_index` (`unsubscribed_at`),
  ADD KEY `sendportal_messages_complained_at_index` (`complained_at`),
  ADD KEY `sendportal_messages_opened_at_index` (`opened_at`),
  ADD KEY `sendportal_messages_clicked_at_index` (`clicked_at`);

--
-- Indexes for table `sendportal_message_failures`
--
ALTER TABLE `sendportal_message_failures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_message_failures_message_id_foreign` (`message_id`);

--
-- Indexes for table `sendportal_message_urls`
--
ALTER TABLE `sendportal_message_urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_message_urls_source_type_index` (`source_type`),
  ADD KEY `sendportal_message_urls_source_id_index` (`source_id`),
  ADD KEY `sendportal_message_urls_hash_index` (`hash`),
  ADD KEY `sendportal_message_urls_url_index` (`url`);

--
-- Indexes for table `sendportal_subscribers`
--
ALTER TABLE `sendportal_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sendportal_subscribers_hash_unique` (`hash`),
  ADD KEY `sendportal_subscribers_created_at_index` (`created_at`),
  ADD KEY `sendportal_subscribers_unsubscribe_event_id_foreign` (`unsubscribe_event_id`),
  ADD KEY `sendportal_subscribers_workspace_id_index` (`workspace_id`),
  ADD KEY `sendportal_subscribers_email_index` (`email`),
  ADD KEY `sendportal_subscribers_unsubscribed_at_index` (`unsubscribed_at`);

--
-- Indexes for table `sendportal_tags`
--
ALTER TABLE `sendportal_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_segments_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `sendportal_tag_subscriber`
--
ALTER TABLE `sendportal_tag_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_segment_subscriber_subscriber_id_foreign` (`subscriber_id`),
  ADD KEY `sendportal_segment_subscriber_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `sendportal_templates`
--
ALTER TABLE `sendportal_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_templates_workspace_id_index` (`workspace_id`);

--
-- Indexes for table `sendportal_unsubscribe_event_types`
--
ALTER TABLE `sendportal_unsubscribe_event_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Indexes for table `workspaces`
--
ALTER TABLE `workspaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspaces_owner_id_index` (`owner_id`);

--
-- Indexes for table `workspace_users`
--
ALTER TABLE `workspace_users`
  ADD UNIQUE KEY `workspace_users_workspace_id_user_id_unique` (`workspace_id`,`user_id`),
  ADD KEY `workspace_users_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_tokens`
--
ALTER TABLE `api_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sendportal_campaigns`
--
ALTER TABLE `sendportal_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sendportal_campaign_statuses`
--
ALTER TABLE `sendportal_campaign_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sendportal_campaign_tag`
--
ALTER TABLE `sendportal_campaign_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `sendportal_email_services`
--
ALTER TABLE `sendportal_email_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sendportal_email_service_types`
--
ALTER TABLE `sendportal_email_service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sendportal_messages`
--
ALTER TABLE `sendportal_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `sendportal_message_failures`
--
ALTER TABLE `sendportal_message_failures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sendportal_message_urls`
--
ALTER TABLE `sendportal_message_urls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sendportal_subscribers`
--
ALTER TABLE `sendportal_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `sendportal_tags`
--
ALTER TABLE `sendportal_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sendportal_tag_subscriber`
--
ALTER TABLE `sendportal_tag_subscriber`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `sendportal_templates`
--
ALTER TABLE `sendportal_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sendportal_unsubscribe_event_types`
--
ALTER TABLE `sendportal_unsubscribe_event_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`);

--
-- Constraints for table `sendportal_campaigns`
--
ALTER TABLE `sendportal_campaigns`
  ADD CONSTRAINT `sendportal_campaigns_email_service_id_foreign` FOREIGN KEY (`email_service_id`) REFERENCES `sendportal_email_services` (`id`),
  ADD CONSTRAINT `sendportal_campaigns_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `sendportal_campaign_statuses` (`id`),
  ADD CONSTRAINT `sendportal_campaigns_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `sendportal_templates` (`id`);

--
-- Constraints for table `sendportal_campaign_tag`
--
ALTER TABLE `sendportal_campaign_tag`
  ADD CONSTRAINT `sendportal_campaign_segment_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `sendportal_campaigns` (`id`),
  ADD CONSTRAINT `sendportal_campaign_segment_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `sendportal_tags` (`id`);

--
-- Constraints for table `sendportal_email_services`
--
ALTER TABLE `sendportal_email_services`
  ADD CONSTRAINT `sendportal_email_services_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `sendportal_email_service_types` (`id`);

--
-- Constraints for table `sendportal_message_failures`
--
ALTER TABLE `sendportal_message_failures`
  ADD CONSTRAINT `sendportal_message_failures_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `sendportal_messages` (`id`);

--
-- Constraints for table `sendportal_subscribers`
--
ALTER TABLE `sendportal_subscribers`
  ADD CONSTRAINT `sendportal_subscribers_unsubscribe_event_id_foreign` FOREIGN KEY (`unsubscribe_event_id`) REFERENCES `sendportal_unsubscribe_event_types` (`id`);

--
-- Constraints for table `sendportal_tag_subscriber`
--
ALTER TABLE `sendportal_tag_subscriber`
  ADD CONSTRAINT `sendportal_segment_subscriber_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `sendportal_subscribers` (`id`),
  ADD CONSTRAINT `sendportal_segment_subscriber_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `sendportal_tags` (`id`);

--
-- Constraints for table `workspace_users`
--
ALTER TABLE `workspace_users`
  ADD CONSTRAINT `workspace_users_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;