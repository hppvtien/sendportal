-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:4306
-- Thời gian đã tạo: Th12 25, 2021 lúc 11:53 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `email_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `api_tokens`
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
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `invitations`
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

--
-- Đang đổ dữ liệu cho bảng `invitations`
--

INSERT INTO `invitations` (`id`, `workspace_id`, `user_id`, `role`, `email`, `token`, `created_at`, `updated_at`) VALUES
('233c03c9-6cd3-4d91-9ddc-56dd1bdaef27', 1, NULL, 'member', 'hppvtien@gmail.com', 'VVc2UPMjNWPizWczsIQZqLFJuKTpbx97pznJxwX7', '2021-06-09 21:59:52', '2021-06-09 21:59:52'),
('38a737ed-9873-4342-8eeb-ba294c2cea83', 1, NULL, 'member', 'xaynhatrongoihaiphong@gmail.com', '9Vc7uqxwd2vi8F9co8WacvR8wiyZLoQlcDxLlF3b', '2021-06-10 03:27:04', '2021-06-10 03:27:04'),
('5bf1daa9-4004-4d43-9df6-1bb93a46e390', 1, NULL, 'member', 'tien.pham@adsmo.com', 'cufv0UqhsYLlIFum9clZfRqDVhmuhZKrnwS3KKRh', '2021-12-14 21:44:00', '2021-12-14 21:44:00'),
('a0449b3d-653a-468b-9033-7abff2079117', 1, NULL, 'member', 'copywriter.adsmo@gmail.com', 'KNh9bbZ0qM4vTfk8cUEkptrtv6wk0SyWnnuBW8KY', '2021-06-09 21:57:34', '2021-06-09 21:57:34'),
('c57cab60-bc9a-4d16-b14f-a6982f49c156', 1, NULL, 'member', 'quantri.ct01@gmail.com', 'dPY9vPUpuPC7KZcEoFPyeAP8g3m6hNdXkQXMEHPf', '2021-06-09 01:42:23', '2021-06-09 01:42:23');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
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
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
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
(29, '2021_06_08_042814_create_jobs_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sendportal_campaigns`
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
-- Đang đổ dữ liệu cho bảng `sendportal_campaigns`
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
-- Cấu trúc bảng cho bảng `sendportal_campaign_statuses`
--

CREATE TABLE `sendportal_campaign_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sendportal_campaign_statuses`
--

INSERT INTO `sendportal_campaign_statuses` (`id`, `name`) VALUES
(1, 'Draft'),
(2, 'Queued'),
(3, 'Sending'),
(4, 'Sent'),
(5, 'Cancelled');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sendportal_campaign_tag`
--

CREATE TABLE `sendportal_campaign_tag` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `campaign_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sendportal_campaign_tag`
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
-- Cấu trúc bảng cho bảng `sendportal_email_services`
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
-- Đang đổ dữ liệu cho bảng `sendportal_email_services`
--

INSERT INTO `sendportal_email_services` (`id`, `workspace_id`, `name`, `type_id`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'adsmo', 6, 'eyJpdiI6ImpvMWJKY1dxUGN2eC9ONlpCUWEweGc9PSIsInZhbHVlIjoiKytoYk4vaUEvT0JNTDZkcG5lLzU1MUtxb3N4ZVJUZVc1MHQ3bDlNR1hZR3YyM0ZtVFdObjdrNkwwS29lUjZhT3A1bmZmYkVWSGJRdkpNemNObWdaSUZ4cnUzR0N0SWlDUG91dDhENjJWMnB1Y1JBb2FOYmpMMnFRVThLWHcranlYSDgrRmdvVzJGVm84RFlraXdDN0t3a1RsY2wzZmRZS1h3RlZVTEVSU3NZPSIsIm1hYyI6IjM3ODZjYmMxOGM3ZmExYmYxZWU4ZjIyMTFkNGI3NGU2NjQ4NDg1NGI4MzkwYjEwNGJiOThlYTVjNGM5NzI4MjAifQ==', '2021-06-08 00:19:55', '2021-06-08 00:19:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sendportal_email_service_types`
--

CREATE TABLE `sendportal_email_service_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sendportal_email_service_types`
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
-- Cấu trúc bảng cho bảng `sendportal_messages`
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
-- Đang đổ dữ liệu cho bảng `sendportal_messages`
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
-- Cấu trúc bảng cho bảng `sendportal_message_failures`
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
-- Cấu trúc bảng cho bảng `sendportal_message_urls`
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
-- Cấu trúc bảng cho bảng `sendportal_subscribers`
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
-- Đang đổ dữ liệu cho bảng `sendportal_subscribers`
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
-- Cấu trúc bảng cho bảng `sendportal_tags`
--

CREATE TABLE `sendportal_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sendportal_tags`
--

INSERT INTO `sendportal_tags` (`id`, `workspace_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Email mua hàng', '2021-06-08 00:31:25', '2021-06-08 00:31:25'),
(2, 1, 'Email quảng cáo', '2021-06-08 00:31:49', '2021-06-08 00:31:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sendportal_tag_subscriber`
--

CREATE TABLE `sendportal_tag_subscriber` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `subscriber_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sendportal_tag_subscriber`
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
-- Cấu trúc bảng cho bảng `sendportal_templates`
--

CREATE TABLE `sendportal_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sendportal_templates`
--

INSERT INTO `sendportal_templates` (`id`, `workspace_id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'templa don hang', '<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" height=\"100%\" width=\"100%\">\r\n				<tbody><tr>\r\n					<td align=\"center\" valign=\"top\">\r\n						<div id=\"m_5063188309675374655template_header_image\">\r\n													</div>\r\n						<font color=\"#888888\">\r\n							</font><font color=\"#888888\">\r\n						</font><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"m_5063188309675374655template_container\" style=\"background-color:#ffffff;border:1px solid #dedede;border-radius:3px\">\r\n							<tbody><tr>\r\n								<td align=\"center\" valign=\"top\">\r\n									\r\n									<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" id=\"m_5063188309675374655template_header\" style=\"background-color:#96588a;color:#ffffff;border-bottom:0;font-weight:bold;line-height:100%;vertical-align:middle;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;border-radius:3px 3px 0 0\">\r\n										<tbody><tr>\r\n											<td id=\"m_5063188309675374655header_wrapper\" style=\"padding:36px 48px;display:block\">\r\n												<h1 style=\"font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:30px;font-weight:300;line-height:150%;margin:0;text-align:left;color:#ffffff;background-color:inherit\">Cám ơn bạn đã đặt hàng</h1>\r\n											</td>\r\n										</tr>\r\n									</tbody></table>\r\n									\r\n								</td>\r\n							</tr>\r\n							<tr>\r\n								<td align=\"center\" valign=\"top\">\r\n									\r\n									<font color=\"#888888\">\r\n										</font><font color=\"#888888\">\r\n									</font><table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"600\" id=\"m_5063188309675374655template_body\">\r\n										<tbody><tr>\r\n											<td valign=\"top\" id=\"m_5063188309675374655body_content\" style=\"background-color:#ffffff\">\r\n												\r\n												<font color=\"#888888\">\r\n													</font><font color=\"#888888\">\r\n												</font><table border=\"0\" cellpadding=\"20\" cellspacing=\"0\" width=\"100%\">\r\n													<tbody><tr>\r\n														<td valign=\"top\" style=\"padding:48px 48px 32px\">\r\n															<div id=\"m_5063188309675374655body_content_inner\" style=\"color:#636363;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:14px;line-height:150%;text-align:left\">\r\n\r\n<p style=\"margin:0 0 16px\">Xin chào Tien,</p>\r\n<p style=\"margin:0 0 16px\">Cảm ơn đã đặt hàng. Đơn hàng sẽ bị tạm giữ cho đến khi chúng tôi xác nhận thanh toán hoàn thành. Trong thời gian chờ đợi, đây là lời nhắc về những gì bạn đã đặt hàng:</p>\r\n\r\n<section><h2 style=\"color:#96588a;display:block;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:130%;margin:0 0 18px;text-align:left\">Thông tin chuyển khoản ngân hàng</h2>\r\n<h3 style=\"color:#96588a;display:block;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:16px;font-weight:bold;line-height:130%;margin:16px 0 8px;text-align:left\">Natico:</h3>\r\n<ul>\r\n<li>Ngân hàng: <strong>VietComBank</strong>\r\n</li>\r\n<li>Số tài khoản: <strong>0123456789</strong>\r\n</li>\r\n</ul></section>\r\n<h2 style=\"color:#96588a;display:block;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:130%;margin:0 0 18px;text-align:left\">\r\n	[Đơn hàng #2936] (07/06/2021)</h2>\r\n\r\n<div style=\"margin-bottom:40px\">\r\n	<table cellspacing=\"0\" cellpadding=\"6\" border=\"1\" style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;width:100%;font-family:\'Helvetica Neue\',Helvetica,Roboto,Arial,sans-serif\">\r\n		<thead>\r\n			<tr>\r\n				<th scope=\"col\" style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">Sản phẩm</th>\r\n				<th scope=\"col\" style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">Số lượng</th>\r\n				<th scope=\"col\" style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">Đơn giá</th>\r\n			</tr>\r\n		</thead>\r\n		<tbody>\r\n				<tr>\r\n		<td style=\"color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:\'Helvetica Neue\',Helvetica,Roboto,Arial,sans-serif;word-wrap:break-word\">\r\n		NHA TRANG - ĐÀ LẠT - HỒ CHÍ MINH		</td>\r\n		<td style=\"color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:\'Helvetica Neue\',Helvetica,Roboto,Arial,sans-serif\">\r\n			1		</td>\r\n		<td style=\"color:#636363;border:1px solid #e5e5e5;padding:12px;text-align:left;vertical-align:middle;font-family:\'Helvetica Neue\',Helvetica,Roboto,Arial,sans-serif\">\r\n			<span>6,569,000<span>₫</span></span>		</td>\r\n	</tr>\r\n	\r\n		</tbody>\r\n		<tfoot>\r\n								<tr>\r\n						<th scope=\"row\" colspan=\"2\" style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left;border-top-width:4px\">Tổng số phụ:</th>\r\n						<td style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left;border-top-width:4px\"><span>6,569,000<span>₫</span></span></td>\r\n					</tr>\r\n										<tr>\r\n						<th scope=\"row\" colspan=\"2\" style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">Phương thức thanh toán:</th>\r\n						<td style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">Chuyển khoản ngân hàng</td>\r\n					</tr>\r\n										<tr>\r\n						<th scope=\"row\" colspan=\"2\" style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\">Tổng tiền:</th>\r\n						<td style=\"color:#636363;border:1px solid #e5e5e5;vertical-align:middle;padding:12px;text-align:left\"><span>6,569,000<span>₫</span></span></td>\r\n					</tr>\r\n							</tfoot>\r\n	</table>\r\n</div>\r\n\r\n\r\n<table id=\"m_5063188309675374655addresses\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"width:100%;vertical-align:top;margin-bottom:40px;padding:0\">\r\n	<tbody><tr>\r\n<td valign=\"top\" width=\"50%\" style=\"text-align:left;font-family:\'Helvetica Neue\',Helvetica,Roboto,Arial,sans-serif;border:0;padding:0\">\r\n			<h2 style=\"color:#96588a;display:block;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:18px;font-weight:bold;line-height:130%;margin:0 0 18px;text-align:left\">Địa chỉ thanh toán</h2>\r\n\r\n			<address style=\"padding:12px;color:#636363;border:1px solid #e5e5e5\">\r\n				Tien Pham<br>Nam vfg<br>Ha noi<br>Hai Phong									<br><a href=\"tel:0969938801\" style=\"color:#96588a;font-weight:normal;text-decoration:underline\" target=\"_blank\">0969938801</a>													<br><a href=\"mailto:hppvtien@gmail.com\" target=\"_blank\">hppvtien@gmail.com</a>							</address>\r\n		</td>\r\n			</tr>\r\n</tbody></table>\r\n<p style=\"margin:0 0 16px\">We look forward to fulfilling your order soon.</p><font color=\"#888888\">\r\n															</font></div><font color=\"#888888\">\r\n														</font></td></tr></tbody></table><font color=\"#888888\">\r\n												\r\n											</font></td></tr></tbody></table><font color=\"#888888\">\r\n									\r\n								</font></td></tr></tbody></table><font color=\"#888888\">\r\n					</font></td></tr>\r\n				<tr>\r\n					<td align=\"center\" valign=\"top\">\r\n						\r\n						<table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"600\" id=\"m_5063188309675374655template_footer\">\r\n							<tbody><tr>\r\n								<td valign=\"top\" style=\"padding:0;border-radius:6px\">\r\n									<table border=\"0\" cellpadding=\"10\" cellspacing=\"0\" width=\"100%\">\r\n										<tbody><tr>\r\n											<td colspan=\"2\" valign=\"middle\" id=\"m_5063188309675374655credit\" style=\"border-radius:6px;border:0;color:#8a8a8a;font-family:&quot;Helvetica Neue&quot;,Helvetica,Roboto,Arial,sans-serif;font-size:12px;line-height:150%;text-align:center;padding:24px 0\">\r\n												<p style=\"margin:0 0 16px\">smartmarket</p>\r\n											</td>\r\n										</tr>\r\n									</tbody></table>\r\n								</td>\r\n							</tr>\r\n						</tbody></table>\r\n						\r\n					</td>\r\n				</tr>\r\n			</tbody></table>', '2021-06-08 00:24:57', '2021-06-08 00:24:57');
INSERT INTO `sendportal_templates` (`id`, `workspace_id`, `name`, `content`, `created_at`, `updated_at`) VALUES
(2, 1, 'email marketing adsmo', '<table border=\"0\" align=\"center\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#f9fafc\" style=\"background-color:rgb(249,250,252);border-collapse:collapse;border-spacing:0\">\r\n\r\n    <tbody><tr style=\"display:none!important;font-size:1px;border-collapse:collapse\"><td style=\"border-collapse:collapse\"></td><td style=\"border-collapse:collapse\"></td></tr><tr style=\"border-collapse:collapse\">\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n        \r\n            <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"590\" style=\"max-width:590px!important;width:590px;border-collapse:collapse;border-spacing:0\">\r\n        <tbody><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n                \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:590px;border-collapse:collapse;border-spacing:0\" name=\"Layout_6\" id=\"m_1842117675456983400m_-6882562584090903807Layout_6\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"min-width:590px;border-collapse:collapse\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_6\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"background-color:rgb(255,255,255);border-radius:0px;padding-left:0px;padding-right:0px;border-collapse:separate;border-spacing:0\">\r\n                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                <td height=\"0\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                    <table width=\"100%\" cellpadding=\"0\" border=\"0\" align=\"center\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <td valign=\"top\" align=\"center\" style=\"border-collapse:collapse\">\r\n                                                <table cellpadding=\"0\" border=\"0\" align=\"left\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\"> \r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td valign=\"middle\" align=\"center\" style=\"line-height:1px;border-collapse:collapse\">\r\n                                                            <div style=\"border-top:0px None #9c9c9c;border-right:0px None #9c9c9c;border-bottom:0px None #9c9c9c;border-left:0px None #9c9c9c;display:inline-block\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\"><div><a style=\"text-decoration:none\" href=\"https://adsmo.vn/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/&amp;source=gmail&amp;ust=1623224292529000&amp;usg=AFQjCNHAnzGv-DMjGFnAWBScKk0muYqi2A\"><img width=\"590\" vspace=\"0\" hspace=\"0\" border=\"0\" alt=\"CÔNG TY TNHH UNIKERY\" style=\"float:left;max-width:590px\" src=\"https://ci6.googleusercontent.com/proxy/0LK0K2qPGJv78fNbfh6GuSbh2coDw3XcvQV4SDi-Al3NWU4E1wmoG6FJQPhgS-xFEj67hgv75CKLl6ZIn1QpdijzDhFp0vaTcsHkSWAdTfD9b4ZYuRjv50R9iwYbpwResZdVpfdO=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf8b02494767a7c71f8d7e.png\" class=\"CToWUd\"></a></div>\r\n                                                            </div></td>\r\n                                                    </tr>\r\n                                                </tbody></table>\r\n                                                </td>\r\n                                        </tr>\r\n                                    </tbody></table></td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td height=\"0\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                        </tbody></table>\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n            \r\n                \r\n                \r\n            \r\n        </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n                \r\n                \r\n                \r\n                \r\n            \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" name=\"Layout_10\" id=\"m_1842117675456983400m_-6882562584090903807Layout_10\" style=\"border-collapse:collapse;border-spacing:0\"><tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\"><a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_10\"></a>\r\n                        <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"height:0px;background-color:rgb(255,255,255);border-radius:0px;border-collapse:separate;padding-left:20px;padding-right:20px;border-spacing:0\"><tbody><tr style=\"border-collapse:collapse\">\r\n                                <td>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"margin:auto;border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n\r\n                                            <th align=\"center\" style=\"text-align:center;font-weight:normal\">\r\n\r\n                                                <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"border-collapse:collapse\"></td>\r\n                                                    </tr>\r\n\r\n                                                    <tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-family:Arial,Helvetica,sans-serif;color:#3c4858;text-align:center;border-collapse:collapse\">\r\n\r\n                                                            <span style=\"color:#3c4858\"><span style=\"color:#008080\"><strong><span style=\"font-size:24px\">Công ty TNHH Unikery &amp; thương hiệu ADSMO</span></strong></span></span>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    <tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"border-collapse:collapse\"></td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n                                                </th></tr>\r\n                                    </tbody></table></td>\r\n                            </tr>\r\n\r\n                        </tbody></table>\r\n\r\n                    </td>\r\n                </tr>\r\n\r\n            </tbody></table>\r\n                \r\n                \r\n            \r\n        </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n            \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;border-collapse:collapse;border-spacing:0\" name=\"Layout_20\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse;min-width:0!important\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_20\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"background-color:rgb(255,255,255);padding-left:20px;padding-right:20px;border-collapse:separate;border-radius:0px;border-bottom:0px none rgb(200,200,200);border-spacing:0\">\r\n\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <td height=\"0\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                        </tr>\r\n                                        <tr style=\"border-collapse:collapse\">\r\n                                            <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <th style=\"text-align:left;font-weight:normal;padding-right:0px\" valign=\"top\">\r\n\r\n                                                            <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" align=\"left\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                                <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                    <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\"><div style=\"text-align:center;display:list-item;list-style-type:none\">Xin gửi lời chào và lời chúc sức khỏe tới quý công ty.</div>\r\n\r\n<div style=\"text-align:center;display:list-item;list-style-type:none\">Chúc quý công ty luôn phát triển và thành công.</div>\r\n</td>\r\n                                                                </tr>\r\n                                                                </tbody></table>\r\n\r\n                                                            </th></tr>\r\n                                                </tbody></table></td>\r\n                                        </tr>\r\n                                        <tr style=\"border-collapse:collapse\">\r\n                                            <td height=\"0\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n                \r\n                \r\n\r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n                \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;border-collapse:collapse;border-spacing:0\" name=\"Layout_13\" id=\"m_1842117675456983400m_-6882562584090903807Layout_13\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse;min-width:0!important\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_13\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"max-width:100%;min-width:100%;table-layout:fixed;background-color:rgb(255,255,255);border-radius:0px;border-collapse:separate;padding:13px 20px 20px;border-spacing:0\">\r\n                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n\r\n                                            <th style=\"text-align:left;font-weight:normal;padding-right:20px\" valign=\"top\" width=\"265\">\r\n\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"265\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td width=\"100%\" style=\"line-height:auto;border-collapse:collapse\" valign=\"top\" align=\"left\">\r\n                                                            <div style=\"border-top:0px none #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;display:inline-block\"><div><img alt=\"\" border=\"0\" hspace=\"0\" vspace=\"0\" width=\"265\" style=\"vertical-align:top;float:left;width:265px;max-width:4477px!important\" src=\"https://ci4.googleusercontent.com/proxy/fLO4Kta2kstd8dhVkWJFkTHtVAJaxQjAeywpJOE37BgrBodSwaV4WqLRnA-cLqSmOoF-oPGLT592bZ-HcgqTSk_GYP4Ndx-UKTaozVmnCzqiFTD5suUnVnyuIAibzK4lIlbM02Fp=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf8e9e494767a86f6ce77e.jpg\" class=\"CToWUd a6T\" tabindex=\"0\"><div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 694.773px; top: 634.539px;\"><div id=\":s0\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" role=\"button\" tabindex=\"0\" aria-label=\"Tải xuống tệp đính kèm \" data-tooltip-class=\"a1V\" data-tooltip=\"Tải xuống\"><div class=\"akn\"><div class=\"aSK J-J5-Ji aYr\"></div></div></div></div></div><div style=\"clear:both\"></div></div></td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n                                                </th><th style=\"text-align:left;font-weight:normal\" valign=\"top\">\r\n\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" width=\"265\" align=\"left\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif;color:#3c4858;float:right;width:265px;line-height:21px;border-collapse:collapse\"><div>Theo ước tính mỗi giờ có hơn 3 tỷ người làm việc và hoạt động trên nền tảng số hóa.</div>\r\n\r\n<div>Việc tiếp cận , giới thiệu sản phẩm trên nền tảng số hóa là chìa khóa dẫn đến thành công của doanh nghiệp.</div>\r\n</td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n                                                </th>\r\n\r\n                                            </tr></tbody></table></td>\r\n                            </tr>\r\n                        </tbody></table>\r\n\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n            \r\n\r\n                \r\n            \r\n        </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n                \r\n                \r\n                \r\n                \r\n            \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" name=\"Layout_15\" id=\"m_1842117675456983400m_-6882562584090903807Layout_15\" style=\"border-collapse:collapse;border-spacing:0\"><tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\"><a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_15\"></a>\r\n                        <table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"height:0px;background-color:rgb(255,255,255);border-radius:0px;border-collapse:separate;padding-left:20px;padding-right:20px;border-spacing:0\"><tbody><tr style=\"border-collapse:collapse\">\r\n                                <td>\r\n\r\n                                    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" align=\"center\" style=\"margin:auto;border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n\r\n                                            <th align=\"center\" style=\"text-align:center;font-weight:normal\">\r\n\r\n                                                <table border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"border-collapse:collapse\"></td>\r\n                                                    </tr>\r\n\r\n                                                    <tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-family:Arial,Helvetica,sans-serif;color:#3c4858;text-align:center;border-collapse:collapse\">\r\n\r\n                                                            <span style=\"color:#3c4858\"><span style=\"color:#008080\"><span style=\"font-size:21px\"><strong>NÊN SỬ DỤNG ỨNG DỤNG MẠNG XÃ HỘI SẴN CÓ HAY TẠO DỰNG MỘT WEBSITE CHO RIÊNG MÌNH???</strong></span></span></span>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    <tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"border-collapse:collapse\"></td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n                                                </th></tr>\r\n                                    </tbody></table></td>\r\n                            </tr>\r\n\r\n                        </tbody></table>\r\n\r\n                    </td>\r\n                </tr>\r\n\r\n            </tbody></table>\r\n                \r\n                \r\n            \r\n        </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255)\">\r\n                \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;line-height:10px;border-collapse:collapse;border-spacing:0\" name=\"Layout_18\" id=\"m_1842117675456983400m_-6882562584090903807Layout_18\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td valign=\"top\" align=\"center\" style=\"min-width:590px;border-collapse:collapse\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_18\"></a>\r\n                        <table width=\"100%\" cellpadding=\"0\" border=\"0\" bgcolor=\"#ffffff\" align=\"center\" cellspacing=\"0\" style=\"background-color:rgb(255,255,255);border-collapse:collapse;border-spacing:0\">\r\n                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                <td valign=\"top\" align=\"center\" style=\"border-collapse:collapse\">\r\n                                    <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <td style=\"border-collapse:collapse\">\r\n                                                <div style=\"display:inherit;border-radius:5px;width:590;max-width:1280px!important;border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;border-collapse:separate;border-radius:0px\">\r\n                                                    <div><a style=\"text-decoration:none\" href=\"https://adsmo.vn/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/&amp;source=gmail&amp;ust=1623224292529000&amp;usg=AFQjCNHAnzGv-DMjGFnAWBScKk0muYqi2A\"><img border=\"0\" hspace=\"0\" vspace=\"0\" width=\"590\" alt=\"\" style=\"display:block;float:left;border-radius:5px;max-width:590px\" src=\"https://ci4.googleusercontent.com/proxy/I6TICvYUGsT7m0gCKAEZBaLNxH-LNEmGMAKy4aNmngj6bDI_T1m67s5Jk0TG1xRGrUtZyxOSndlO8ifNazyGtJAEu0Rs0tqDRFBXG2qoowBK_kXMsV9KJYpw2oxhmDKV_EjkLOKE=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf928c494767b02908e8cc.jpg\" class=\"CToWUd\"></a></div><div style=\"clear:both\"></div>\r\n                                                    </div></td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n\r\n                                </td>\r\n                            </tr>\r\n                        </tbody></table>\r\n                    </td>\r\n                </tr></tbody></table>\r\n            \r\n                \r\n                \r\n            \r\n        </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n            \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;border-collapse:collapse;border-spacing:0\" name=\"Layout_11\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse;min-width:0!important\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_11\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"background-color:rgb(255,255,255);padding-left:20px;padding-right:20px;border-collapse:separate;border-radius:0px;border-bottom:0px none rgb(200,200,200);border-spacing:0\">\r\n\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <td height=\"15\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                        </tr>\r\n                                        <tr style=\"border-collapse:collapse\">\r\n                                            <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <th style=\"text-align:left;font-weight:normal;padding-right:0px\" valign=\"top\">\r\n\r\n                                                            <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" align=\"left\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                                <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                    <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\"><div style=\"display:list-item;list-style-type:none\"><span style=\"font-size:16px\"><strong><a href=\"https://adsmo.vn/giai-phap/marketing-online/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/giai-phap/marketing-online/&amp;source=gmail&amp;ust=1623224292529000&amp;usg=AFQjCNFIHj3XPkOZTEQga60cWnpkCaJTzw\"><u><span style=\"color:#008080\">GIẢI PHÁP THƯƠNG HIỆU ADSMO</span></u></a></strong> <span style=\"color:#000000\">được thành lập với mục đích mang đến cho các công ty tại Hải Phòng (đặc biệt khu vực Thủy Nguyên) các giải pháp - dịch vụ xây dựng thương hiệu trên nền tảng số với chất lượng tốt và chi phí cạnh tranh.</span></span></div>\r\n</td>\r\n                                                                </tr>\r\n                                                                </tbody></table>\r\n\r\n                                                            </th></tr>\r\n                                                </tbody></table></td>\r\n                                        </tr>\r\n                                        <tr style=\"border-collapse:collapse\">\r\n                                            <td height=\"8\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n                \r\n                \r\n\r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255)\">\r\n                \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;line-height:10px;border-collapse:collapse;border-spacing:0\" name=\"Layout_17\" id=\"m_1842117675456983400m_-6882562584090903807Layout_17\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td valign=\"top\" align=\"center\" style=\"min-width:590px;border-collapse:collapse\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_17\"></a>\r\n                        <table width=\"100%\" cellpadding=\"0\" border=\"0\" bgcolor=\"#ffffff\" align=\"center\" cellspacing=\"0\" style=\"background-color:rgb(255,255,255);border-collapse:collapse;border-spacing:0\">\r\n                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                <td valign=\"top\" align=\"center\" style=\"border-collapse:collapse\">\r\n                                    <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <td style=\"border-collapse:collapse\">\r\n                                                <div style=\"display:inherit;border-radius:5px;width:590;max-width:1000px!important;border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;border-collapse:separate;border-radius:5px\">\r\n                                                    <div><a style=\"text-decoration:none\" href=\"https://adsmo.vn/giai-phap/thiet-ke-web-theo-nhu-cau/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/giai-phap/thiet-ke-web-theo-nhu-cau/&amp;source=gmail&amp;ust=1623224292529000&amp;usg=AFQjCNFDd55Kb3EiHgT_o9RawpJTXj5yyA\"><img border=\"0\" hspace=\"0\" vspace=\"0\" width=\"590\" alt=\"\" style=\"display:block;float:left;border-radius:5px;max-width:590px\" src=\"https://ci3.googleusercontent.com/proxy/nzVSHXXaBLcd0H-AwlrEo3J8P8Is4uVL3pIcI59jFtiw6Wnf6aG9iQTr1wzDmMe5z8q2shhOpHhbFkggA_duHejPP4gO4zHojg8TB-U2-lFcBND7RLbfsOhA6fak7Z8mRPGj4Fvp=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf9603f903a09f3729c196.jpg\" class=\"CToWUd\"></a></div><div style=\"clear:both\"></div>\r\n                                                    </div></td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n\r\n                                </td>\r\n                            </tr>\r\n                        </tbody></table>\r\n                    </td>\r\n                </tr></tbody></table>\r\n            \r\n                \r\n                \r\n            \r\n        </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n            \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;border-collapse:collapse;border-spacing:0\" name=\"Layout_21\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse;min-width:0!important\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_21\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"background-color:rgb(255,255,255);padding-left:20px;padding-right:20px;border-collapse:separate;border-radius:0px;border-bottom:0px none rgb(200,200,200);border-spacing:0\">\r\n\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <td height=\"15\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                        </tr>\r\n                                        <tr style=\"border-collapse:collapse\">\r\n                                            <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <th style=\"text-align:left;font-weight:normal;padding-right:0px\" valign=\"top\">\r\n\r\n                                                            <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" align=\"left\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                                <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                    <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\"><div style=\"text-align:center;display:list-item;list-style-type:none\"><span style=\"font-size:16px\"><strong><span style=\"color:#008080\">ADSMO</span></strong> đã phát triển website cho :</span></div>\r\n\r\n<ul style=\"margin:0px!important\">\r\n	<li style=\"text-align:left\"><span style=\"font-size:16px\">&nbsp;Khách hàng dùng website với mục đích bán, cung cấp sản phẩm và dịch vụ.</span></li>\r\n	<li style=\"text-align:left\">&nbsp;<span style=\"font-size:16px\">Khách hàng doanh nghiệp với mục đích giới thiệu về công ty, sản phẩm, dịch vụ.</span></li>\r\n</ul>\r\n\r\n<div style=\"text-align:center;display:list-item;list-style-type:none\"><span style=\"font-size:16px\">Một số mẫu Website được <span style=\"color:#008080\"><strong>Adsmo</strong></span> thiết kế :&nbsp;</span></div>\r\n</td>\r\n                                                                </tr>\r\n                                                                </tbody></table>\r\n\r\n                                                            </th></tr>\r\n                                                </tbody></table></td>\r\n                                        </tr>\r\n                                        <tr style=\"border-collapse:collapse\">\r\n                                            <td height=\"15\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n                \r\n                \r\n\r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n                \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;border-collapse:collapse;border-spacing:0\" name=\"Layout_23\" id=\"m_1842117675456983400m_-6882562584090903807Layout_23\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse;min-width:0!important\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_23\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"max-width:100%;min-width:100%;table-layout:fixed;background-color:rgb(255,255,255);border-radius:0px;border-collapse:separate;padding-left:20px;padding-right:20px;border-spacing:0\">\r\n                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <th style=\"text-align:left;font-weight:normal;padding-right:20px\" width=\"170\" valign=\"top\">\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"170\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                                            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"border-collapse:collapse\">\r\n                                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                                        <table style=\"display:inline-block;border-collapse:collapse;border-spacing:0\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                <td style=\"border-collapse:collapse\">\r\n                                                                        <div style=\"border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;display:inline-block\">\r\n                                                                            <div><a href=\"https://adsmo.vn/mau-web/mau-website-logistics-dndv74/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/mau-web/mau-website-logistics-dndv74/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNH3x8JgT9u3TQL4iOzwbQd0MIBbLA\">\r\n                                                                            <img width=\"170\" border=\"0\" hspace=\"0\" vspace=\"0\" alt=\"\" src=\"https://ci5.googleusercontent.com/proxy/A-Ji-I2CpnS8j7NIdZVM7RU3pDojidRny1EcX8GayWZ0sgcfMnNkU3Bay06CpMAeVUfQ-H3z7Up0vq28KJuUe-ImggqMql_Mede7tMXfU49V12XRnHxvKrQqc5b-M85l2m7AUVDQ=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf9a80f903a0a3f118c5c1.jpg\" style=\"vertical-align:top;max-width:472px;float:left\" class=\"CToWUd\"></a></div><div style=\"clear:both\"></div>\r\n                                                                            </div></td>\r\n                                                                            </tr>\r\n                                                                        </tbody></table>\r\n\r\n                                                                    </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                                </table></td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\">\r\n                                                            <div><div style=\"text-align:center\"><span style=\"font-size:16px\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/dich-vu-bao-duong/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/dich-vu-bao-duong/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNEY2kPsRjGd90wq7fGQYUh-Ly1-8Q\"><span style=\"color:#008080\"><u>Dịch vụ vận tải </u></span></a></span></div>\r\n\r\n<div style=\"text-align:center\"><span style=\"font-size:16px\"><span style=\"text-decoration:underline;color:rgb(0,128,128)\"><u><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/dich-vu-bao-duong/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/dich-vu-bao-duong/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNEY2kPsRjGd90wq7fGQYUh-Ly1-8Q\">-</a></u></span></span><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/dich-vu-bao-duong/\" style=\"font-size:16px;text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/dich-vu-bao-duong/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNEY2kPsRjGd90wq7fGQYUh-Ly1-8Q\"><span style=\"color:#008080\"><u>xuất nhập khẩu :</u></span></a></div>\r\n</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n\r\n                                                </th><th style=\"text-align:left;font-weight:normal;padding-right:20px\" width=\"170\" valign=\"top\">\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"170\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                                            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"border-collapse:collapse\">\r\n                                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                                        <table style=\"display:inline-block;border-collapse:collapse;border-spacing:0\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                <td style=\"border-collapse:collapse\">\r\n                                                                        <div style=\"border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;display:inline-block\">\r\n                                                                            <div><a href=\"https://adsmo.vn/mau-web/mau-website-noi-that-bhnd9/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/mau-web/mau-website-noi-that-bhnd9/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNHWoEPgg-oWEX6QgBMcB9NTOvTx3g\">\r\n                                                                            <img width=\"170\" border=\"0\" hspace=\"0\" vspace=\"0\" alt=\"\" src=\"https://ci5.googleusercontent.com/proxy/SbRxjgA9ZxQiPQLslAQ1jBLLoloSYqq9swJlN9kgch3jj-1s9XkLHAQVsVPIEMIHD_T8WrZL-ieQNPqhqJrM0MGr1-tsh_UYWw89R9mwt2KwY5e9SuA73QEYTFMc4GT0JJ1CGoGw=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf9a8cf903a0a4b644736e.jpg\" style=\"vertical-align:top;max-width:472px;float:left\" class=\"CToWUd\"></a></div><div style=\"clear:both\"></div>\r\n                                                                            </div></td>\r\n                                                                            </tr>\r\n                                                                        </tbody></table>\r\n\r\n                                                                    </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                                </table></td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\">\r\n                                                            <div><div style=\"text-align:center\"><span style=\"color:#008080\">&nbsp;</span><u><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/bat-dong-san-va-kien-truc/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/bat-dong-san-va-kien-truc/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNFUe50Prwa5Shrwb3owPcTzCl4B8g\"><span style=\"color:#008080\"><span style=\"font-size:15px\"><span style=\"background-color:transparent\">&nbsp;Bất Động Sản </span></span></span></a></u></div>\r\n\r\n<div style=\"text-align:center\"><u><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/bat-dong-san-va-kien-truc/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/bat-dong-san-va-kien-truc/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNFUe50Prwa5Shrwb3owPcTzCl4B8g\"><span style=\"color:#008080\"><span style=\"font-size:15px\"><span style=\"background-color:transparent\">– Kiến Trúc – Vật Liệu</span></span></span></a></u></div>\r\n\r\n<div style=\"text-align:center\"><u><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/bat-dong-san-va-kien-truc/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/bat-dong-san-va-kien-truc/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNFUe50Prwa5Shrwb3owPcTzCl4B8g\"><span style=\"color:#008080\"><span style=\"background-color:transparent;font-size:15px\">– Xây Dựng</span></span></a></u></div>\r\n\r\n<div style=\"text-align:center\">&nbsp;</div>\r\n</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n\r\n                                                </th><th style=\"text-align:left;font-weight:normal;padding-right:0px\" width=\"170\" valign=\"top\">\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"170\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                                            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"border-collapse:collapse\">\r\n                                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                                        <table style=\"display:inline-block;border-collapse:collapse;border-spacing:0\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                <td style=\"border-collapse:collapse\">\r\n                                                                        <div style=\"border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;display:inline-block\">\r\n                                                                            <div><a href=\"https://adsmo.vn/mau-web/thiet-ke-mau-web-nha-hang-bhtp20/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/mau-web/thiet-ke-mau-web-nha-hang-bhtp20/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGgUBrCgwmOC97LI6agdTmCIAq29A\">\r\n                                                                            <img width=\"170\" border=\"0\" hspace=\"0\" vspace=\"0\" alt=\"\" src=\"https://ci3.googleusercontent.com/proxy/vuiHH0o_hQB-xeIKov7gbwpstzIOe5tzA49sKulLMJlSFz2LapTqXlbsGESwKsdfNG7E4vLkixH_6dMcXBPP-tXdgVoBBuFulrdeWyQsnkKXG7lk3JhVD7odHci_BLqszFNxPtD8=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf9a8cf45cf5acb3740a1e.jpg\" style=\"vertical-align:top;max-width:472px;float:left\" class=\"CToWUd\"></a></div><div style=\"clear:both\"></div>\r\n                                                                            </div></td>\r\n                                                                            </tr>\r\n                                                                        </tbody></table>\r\n\r\n                                                                    </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                                </table></td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\">\r\n                                                            <div><div style=\"text-align:center\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/am-thuc-du-lich-khach-san/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/am-thuc-du-lich-khach-san/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGv9QL_hEeSBI7DPuZvFK02yIFPmQ\"><u><span style=\"color:#008080\"><span style=\"font-size:16px\">Ẩm Thực – Du Lịch </span></span></u></a></div>\r\n\r\n<div style=\"text-align:center\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/am-thuc-du-lich-khach-san/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/am-thuc-du-lich-khach-san/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGv9QL_hEeSBI7DPuZvFK02yIFPmQ\"><u><span style=\"color:#008080\"><span style=\"font-size:16px\">– Khách Sạn</span></span></u></a></div>\r\n</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n\r\n                                                </th></tr>\r\n                                    </tbody></table></td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td height=\"3\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                        </tbody></table>\r\n\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n                \r\n                \r\n                \r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n                \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;border-collapse:collapse;border-spacing:0\" name=\"Layout_24\" id=\"m_1842117675456983400m_-6882562584090903807Layout_24\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse;min-width:0!important\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_24\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"max-width:100%;min-width:100%;table-layout:fixed;background-color:rgb(255,255,255);border-radius:0px;border-collapse:separate;padding-left:20px;padding-right:20px;border-spacing:0\">\r\n                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <th style=\"text-align:left;font-weight:normal;padding-right:20px\" width=\"170\" valign=\"top\">\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"170\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                                            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"border-collapse:collapse\">\r\n                                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                                        <table style=\"display:inline-block;border-collapse:collapse;border-spacing:0\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                <td style=\"border-collapse:collapse\">\r\n                                                                        <div style=\"border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;display:inline-block\">\r\n                                                                            <div><a href=\"https://adsmo.vn/mau-web/mau-website-dnnt61/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/mau-web/mau-website-dnnt61/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGmTaycHUOGAzwOPHLMYC1cPF9_4Q\">\r\n                                                                            <img width=\"170\" border=\"0\" hspace=\"0\" vspace=\"0\" alt=\"\" src=\"https://ci3.googleusercontent.com/proxy/ocCJlhZ-5zbnDLdpheuAomJUj3CJP9WvQ0VrQ7fGjCTC8oCdsrUiMNaOlq3aFLXGonU3zD3rO0s7Y8DewjqzVbr4kkmLCJpjfHQ-rRKGCMt7535Djfz9FqGjGleZSWRyChYmPrpc=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf9a8c494767b99070f435.jpg\" style=\"vertical-align:top;max-width:472px;float:left\" class=\"CToWUd\"></a></div><div style=\"clear:both\"></div>\r\n                                                                            </div></td>\r\n                                                                            </tr>\r\n                                                                        </tbody></table>\r\n\r\n                                                                    </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                                </table></td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\">\r\n                                                            <div><div>\r\n<div style=\"text-align:center\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/tu-van-dao-tao/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/tu-van-dao-tao/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGezOd-vgw9ToA0AXng4C6p3AFqrQ\"><u><span style=\"color:#008080\"><span style=\"font-size:16px\">Tư Vấn – Đào Tạo &amp;</span></span></u></a></div>\r\n\r\n<div style=\"text-align:center\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/tu-van-dao-tao/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/tu-van-dao-tao/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGezOd-vgw9ToA0AXng4C6p3AFqrQ\"><u><span style=\"color:#008080\"><span style=\"font-size:16px\">Nghệ Thuật – Giáo Dục</span></span></u></a></div>\r\n</div>\r\n</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n\r\n                                                </th><th style=\"text-align:left;font-weight:normal;padding-right:20px\" width=\"170\" valign=\"top\">\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"170\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                                            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"border-collapse:collapse\">\r\n                                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                                        <table style=\"display:inline-block;border-collapse:collapse;border-spacing:0\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                <td style=\"border-collapse:collapse\">\r\n                                                                        <div style=\"border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;display:inline-block\">\r\n                                                                            <div><a href=\"https://adsmo.vn/mau-web/thiet-ke-mau-web-nha-hang-bhtp20/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/mau-web/thiet-ke-mau-web-nha-hang-bhtp20/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGgUBrCgwmOC97LI6agdTmCIAq29A\">\r\n                                                                            <img width=\"170\" border=\"0\" hspace=\"0\" vspace=\"0\" alt=\"\" src=\"https://ci4.googleusercontent.com/proxy/03bbOxQ5SlHpYia7skh38BT9SDlWRW6kO9eWSugT8IaszlBBRbXvnvNFFpGh1JguuWv1HzqiZBm4tfPoQLUpD3tEDBqNjKrPqC3Xe6r-rYj2XnlB-kHuy73549BgnBSNm0Kf7a2k=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf9a8c494767ba62708345.jpg\" style=\"vertical-align:top;max-width:472px;float:left\" class=\"CToWUd\"></a></div><div style=\"clear:both\"></div>\r\n                                                                            </div></td>\r\n                                                                            </tr>\r\n                                                                        </tbody></table>\r\n\r\n                                                                    </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                                </table></td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\">\r\n                                                            <div><div style=\"text-align:center\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/tu-van-dao-tao/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/tu-van-dao-tao/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGezOd-vgw9ToA0AXng4C6p3AFqrQ\"><span style=\"color:#008080\"><u><span style=\"font-size:16px\">Dịch Vụ Sức Khỏe </span></u></span></a></div>\r\n\r\n<div style=\"text-align:center\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/tu-van-dao-tao/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/tu-van-dao-tao/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGezOd-vgw9ToA0AXng4C6p3AFqrQ\"><span style=\"color:#008080\"><u><span style=\"font-size:16px\">–&nbsp;</span><span style=\"font-size:16px;background-color:transparent\">Sắc Đẹp</span></u></span></a></div>\r\n</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n\r\n                                                </th><th style=\"text-align:left;font-weight:normal;padding-right:0px\" width=\"170\" valign=\"top\">\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"170\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                                            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                                <tbody>\r\n                                                                    <tr style=\"border-collapse:collapse\">\r\n                                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                                        <table style=\"display:inline-block;border-collapse:collapse;border-spacing:0\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                <td style=\"border-collapse:collapse\">\r\n                                                                        <div style=\"border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;display:inline-block\">\r\n                                                                            <div><a href=\"https://adsmo.vn/mau-web/mau-website-o-to-bhot18/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/mau-web/mau-website-o-to-bhot18/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNFCkS67cozCarZ3uDOYad1mW0yRMw\">\r\n                                                                            <img width=\"170\" border=\"0\" hspace=\"0\" vspace=\"0\" alt=\"\" src=\"https://ci6.googleusercontent.com/proxy/9tGUv00DX9Fh3lIqKYTHyh3KHFOqzBKLd68nyS6ut6LNUnnKzMdxoVRLIvhSbL3k-LiYH4kK1vsOAmbmZVg7npHkdBKE0_3rd-cAqGPZZ-Ha7uTO2cD1IQsNARf6sIGTE8TrOeKl=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf9a8c494767ba0d02723f.jpg\" style=\"vertical-align:top;max-width:472px;float:left\" class=\"CToWUd\"></a></div><div style=\"clear:both\"></div>\r\n                                                                            </div></td>\r\n                                                                            </tr>\r\n                                                                        </tbody></table>\r\n\r\n                                                                    </td>\r\n                                                                    </tr>\r\n                                                                </tbody>\r\n                                                                </table></td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\">\r\n                                                            <div><div>\r\n<div style=\"text-align:center\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/o-to-xe-may/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/o-to-xe-may/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNHl1bd-Knhoyrt_RkB-xUUrlOlGAQ\"><span style=\"color:#008080\"><u><span style=\"font-size:16px\">Ô Tô - Xe Máy &amp;</span></u></span></a></div>\r\n\r\n<div style=\"text-align:center\"><a href=\"https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/o-to-xe-may/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/danh-muc-mau/web-doanh-nghiep/o-to-xe-may/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNHl1bd-Knhoyrt_RkB-xUUrlOlGAQ\"><span style=\"color:#008080\"><u><span style=\"font-size:16px\">Dịch Vụ - Bảo Dưỡng</span></u></span></a></div>\r\n</div>\r\n</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n\r\n                                                </th></tr>\r\n                                    </tbody></table></td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                        </tbody></table>\r\n\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n                \r\n                \r\n                \r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n                \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:590px;border-collapse:collapse;border-spacing:0\" name=\"Layout_25\" id=\"m_1842117675456983400m_-6882562584090903807Layout_25\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"min-width:590px;border-collapse:collapse\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_25\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"background-color:rgb(255,255,255);border-radius:0px;padding-left:20px;padding-right:20px;border-collapse:separate;border-spacing:0\">\r\n                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                <td height=\"20\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <th valign=\"top\">\r\n\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" width=\"550\" align=\"center\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td valign=\"top\" style=\"border-collapse:collapse\">\r\n                                                            <table cellpadding=\"0\" border=\"0\" align=\"right\" cellspacing=\"0\" style=\"margin:auto;border-collapse:separate;border-spacing:0\">\r\n                                                                <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                    <td width=\"auto\" valign=\"middle\" bgcolor=\"#13698f\" align=\"center\" height=\"26\" style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif;color:#ffffff;font-weight:normal;padding-left:20px;padding-right:20px;vertical-align:middle;background-color:#13698f;border-radius:7px;border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;border-collapse:collapse\">\r\n                                                                        <span style=\"color:#ffffff;font-weight:normal\">\r\n                                                                                <a style=\"text-decoration:none;color:#ffffff;font-weight:normal\" href=\"https://adsmo.vn/kho-web/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/kho-web/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNHpKzyDIkKJYWFTQOcnMrVUXiMCKA\"><u><em>Xem thêm các mẫu khác tại đây</em></u></a>\r\n                                                                            </span>\r\n                                                                    </td>\r\n                                                                </tr></tbody></table>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n                                                </th>\r\n                                        </tr>\r\n                                    </tbody></table></td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td height=\"20\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                        </tbody></table>\r\n\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n            \r\n                \r\n                \r\n                \r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n                \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;border-collapse:collapse;border-spacing:0\" name=\"Layout_27\" id=\"m_1842117675456983400m_-6882562584090903807Layout_27\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse;min-width:0!important\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_27\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"max-width:100%;min-width:100%;table-layout:fixed;background-color:rgb(255,255,255);border-radius:0px;border-collapse:separate;padding-left:20px;padding-right:20px;border-spacing:0\">\r\n                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                    <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <th style=\"text-align:left;font-weight:normal;padding-right:0px\" width=\"550\" valign=\"top\">\r\n                                                <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" align=\"left\" width=\"550\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                                            <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                            <tbody>\r\n                                                                <tr style=\"border-collapse:collapse\">\r\n                                                                    <td width=\"100%\" valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n                                                                        <table style=\"display:inline-block;border-collapse:collapse;border-spacing:0\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                <td style=\"border-collapse:collapse\">\r\n                                                                                    <div style=\"border-top:0px None #000;border-right:0px None #000;border-bottom:0px None #000;border-left:0px None #000;display:inline-block\"><div><img border=\"0\" width=\"550\" hspace=\"0\" vspace=\"0\" alt=\"\" src=\"https://ci6.googleusercontent.com/proxy/FoLGX5WJihhIlWIFJH8gnWWjF7HFJb6mFQfVe6NjGZb_KCIB1Z8z4O9b6aJWmrWbzduHESNUIdaNGa2NUvAQhYrsa79dVl2dytDzpbHkGoGcW3qapokvfm6HWFTFAa68QuZ_5R0Z=s0-d-e1-ft#https://img.mailinblue.com/2872039/images/rnb/original/5ebf9f8cf45cf5b300395fd6.jpg\" style=\"vertical-align:top;max-width:2560px;float:left\" class=\"CToWUd a6T\" tabindex=\"0\"><div class=\"a6S\" dir=\"ltr\" style=\"opacity: 0.01; left: 979.773px; top: 2596.24px;\"><div id=\":s1\" class=\"T-I J-J5-Ji aQv T-I-ax7 L3 a5q\" title=\"Tải xuống\" role=\"button\" tabindex=\"0\" aria-label=\"Tải xuống tệp đính kèm \" data-tooltip-class=\"a1V\"><div class=\"akn\"><div class=\"aSK J-J5-Ji aYr\"></div></div></div></div></div><div style=\"clear:both\"></div>\r\n                                                                                    </div>\r\n                                                                            </td>\r\n                                                                            </tr>\r\n                                                                        </tbody></table>\r\n\r\n                                                                    </td>\r\n                                                                </tr>\r\n                                                            </tbody>\r\n                                                        </table></td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td height=\"10\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                                    </tr><tr style=\"border-collapse:collapse\">\r\n                                                        <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\">\r\n                                                            <div><ul style=\"margin:0px!important\">\r\n	<li style=\"text-align:left\"><a href=\"https://adsmo.vn/kho-web/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/kho-web/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNHpKzyDIkKJYWFTQOcnMrVUXiMCKA\"><span style=\"color:#008080\"><u><span style=\"font-size:16px\">Thiết kế Web theo mẫu sẵn có</span></u></span></a></li>\r\n	<li style=\"text-align:left\"><span style=\"color:#008080\"><u><span style=\"font-size:16px\">&nbsp;</span></u></span><u><span style=\"font-size:16px\"><a href=\"https://adsmo.vn/giai-phap/marketing-online/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/giai-phap/marketing-online/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGXhu14wtHv_CFxJ2MM203Klem58A\"><span style=\"color:#008080\">Marketing Online</span></a></span></u></li>\r\n	<li style=\"text-align:left\"><a href=\"https://adsmo.vn/giai-phap/thiet-ke-web-theo-nhu-cau/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/giai-phap/thiet-ke-web-theo-nhu-cau/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNGNiz_i_Tncd5P-M2upE10huRkVBQ\"><span style=\"color:#008080\"><u><span style=\"font-size:16px\">&nbsp;Thiết kế website theo yêu cầu</span></u></span></a></li>\r\n	<li style=\"text-align:left\"><a href=\"https://adsmo.vn/giai-phap/dich-vu-kem-theo/#1571229481795-c2bade2b-5229\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/giai-phap/dich-vu-kem-theo/%231571229481795-c2bade2b-5229&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNFXta3W06WqRR5TkgtOHoU1BUmCnA\"><span style=\"color:#008080\"><u><span style=\"font-size:16px\">&nbsp;Dịch vụ kèm theo</span></u></span></a></li>\r\n</ul>\r\n</div>\r\n                                                        </td>\r\n                                                    </tr>\r\n                                                    </tbody></table>\r\n\r\n                                                </th></tr>\r\n                                    </tbody></table></td>\r\n                            </tr>\r\n                            <tr style=\"border-collapse:collapse\">\r\n                                <td height=\"8\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                            </tr>\r\n                        </tbody></table>\r\n\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n                \r\n                \r\n                \r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(255,255,255);border-radius:0px\">\r\n            \r\n                \r\n                \r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:100%;border-collapse:collapse;border-spacing:0\" name=\"Layout_29\">\r\n                <tbody><tr style=\"border-collapse:collapse\">\r\n                    <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse;min-width:0!important\">\r\n                        <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_29\"></a>\r\n                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" bgcolor=\"#ffffff\" style=\"background-color:rgb(255,255,255);padding-left:20px;padding-right:20px;border-collapse:separate;border-radius:0px;border-bottom:0px none rgb(200,200,200);border-spacing:0\">\r\n\r\n                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                            <td height=\"15\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                        </tr>\r\n                                        <tr style=\"border-collapse:collapse\">\r\n                                            <td valign=\"top\" align=\"left\" style=\"border-collapse:collapse\">\r\n\r\n                                                <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                        <th style=\"text-align:left;font-weight:normal;padding-right:0px\" valign=\"top\">\r\n\r\n                                                            <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" width=\"100%\" align=\"left\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                                <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                    <td style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif,sans-serif;color:#3c4858;line-height:21px;border-collapse:collapse\"><div style=\"text-align:justify;display:list-item;list-style-type:none\"><span style=\"font-size:16px\"><span style=\"color:#000000\">Quý công ty có thể tham khảo các gói dịch vụ và chi phí dự toán tại website </span>: <a href=\"https://adsmo.vn/\" style=\"text-decoration:underline;color:rgb(0,146,255)\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://adsmo.vn/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNH4WFWqORqOj1z64uuxBJnyb4Nn-A\"><span style=\"color:#008080\">https://adsmo.vn/&nbsp;</span></a></span></div>\r\n\r\n<div style=\"text-align:justify;display:list-item;list-style-type:none\"><span style=\"color:#000000\"><span style=\"font-size:16px\">Nếu quý công ty cần thêm thông tin xin vui lòng liên hệ hotline : </span></span><span style=\"color:#008080\"><span style=\"font-size:16px\">0356.105.488</span></span><span style=\"color:#000000\"><span style=\"font-size:16px\"> để được tư vấn chi tiết.</span></span></div>\r\n\r\n<div style=\"text-align:justify;display:list-item;list-style-type:none\"><span style=\"color:#000000\"><span style=\"font-size:16px\">Nếu thư này làm phiền quý công ty, xin hãy báo lại chúng tôi để chúng tôi xin lỗi và ẩn địa chỉ của quý công ty khỏi danh sách khách hàng.<span style=\"text-align:center;background-color:transparent\">Cảm ơn quý công ty đã dành thời gian để đọc và phản hồi thư này.</span></span></span></div>\r\n\r\n<div style=\"text-align:justify;display:list-item;list-style-type:none\"><span style=\"color:#008080\"><span style=\"font-size:18px\">&nbsp;Phòng Marketing Công ty TNHH UNIKERY – ADSMO</span></span></div>\r\n</td>\r\n                                                                </tr>\r\n                                                                </tbody></table>\r\n\r\n                                                            </th></tr>\r\n                                                </tbody></table></td>\r\n                                        </tr>\r\n                                        <tr style=\"border-collapse:collapse\">\r\n                                            <td height=\"15\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                        </tr>\r\n                                    </tbody></table>\r\n                    </td>\r\n                </tr>\r\n            </tbody></table>\r\n                \r\n                \r\n\r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(249,250,252)\">\r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:590px;border-collapse:collapse;border-spacing:0;width:100%!important\" name=\"Layout_\" id=\"m_1842117675456983400m_-6882562584090903807Layout_\">\r\n                    <tbody><tr style=\"border-collapse:collapse\">\r\n                        <td align=\"center\" valign=\"top\" bgcolor=\"#f9fafc\" style=\"min-width:590px;background-color:rgb(249,250,252);border-collapse:collapse\">\r\n                            <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_\"></a>\r\n                            <table width=\"590\" cellpadding=\"0\" border=\"0\" align=\"center\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                <tbody><tr style=\"border-collapse:collapse\">\r\n                                    <td height=\"20\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                </tr>\r\n                                <tr style=\"border-collapse:collapse\">\r\n                                    <td valign=\"top\" style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif;color:#888888;border-collapse:collapse\" align=\"left\">\r\n\r\n                                        <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                <th style=\"padding-right:20px;padding-left:20px;font-weight:normal\" valign=\"top\">\r\n\r\n                                                    <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" width=\"264\" align=\"left\" style=\"border-bottom:0;border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                                            <td valign=\"top\" style=\"border-collapse:collapse\">\r\n                                                                <table cellpadding=\"0\" border=\"0\" align=\"left\" cellspacing=\"0\" style=\"border-collapse:collapse;border-spacing:0\">\r\n                                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                        <td valign=\"middle\" align=\"left\" style=\"font-size:14px;font-family:Arial,Helvetica,sans-serif;color:#888888;line-height:16px;border-collapse:collapse\">\r\n                                                                            <div><div>UNIKERY Ltd,<br>\r\n22 Phố Mới, Thủy Sơn<br>\r\nThủy Nguyên, Hải Phòng.<br>\r\n<a href=\"#m_1842117675456983400_m_-6882562584090903807_\" style=\"text-decoration:underline;color:rgb(102,102,102)\">kinhdoanh@adsmo.vn</a></div>\r\n</div>\r\n                                                                        </td></tr>\r\n                                                                </tbody></table>\r\n                                                            </td>\r\n                                                        </tr>\r\n                                                        </tbody></table>\r\n                                                    </th><th valign=\"top\" style=\"padding-right:15px\">\r\n\r\n                                                    <table border=\"0\" valign=\"top\" cellspacing=\"0\" cellpadding=\"0\" width=\"246\" align=\"right\" style=\"border-collapse:collapse;border-spacing:0\">\r\n\r\n                                                        <tbody><tr style=\"border-collapse:collapse\">\r\n                                                            <td valign=\"top\" style=\"border-collapse:collapse\">\r\n                                                                <table cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"float:right;border-collapse:collapse;border-spacing:0\" align=\"right\">\r\n                                                                    <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                        <td valign=\"middle\" width=\"125\" align=\"right\" style=\"border-collapse:collapse\">\r\n                                                                            <div>\r\n                                                                            <table align=\"left\" style=\"float:left;display:inline-block;border-collapse:collapse;border-spacing:0\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                    <td style=\"padding:0px 5px 5px 0px;border-collapse:collapse\" align=\"left\">\r\n                                                                            <span style=\"color:#ffffff;font-weight:normal\">\r\n                                                                                <a href=\"https://www.facebook.com/adsmo.vn/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://www.facebook.com/adsmo.vn/&amp;source=gmail&amp;ust=1623224292530000&amp;usg=AFQjCNHT7LwzA3fkYtwgOhI3fn_dzdKlXQ\"><img alt=\"Facebook\" border=\"0\" hspace=\"0\" vspace=\"0\" style=\"vertical-align:top\" src=\"https://ci3.googleusercontent.com/proxy/Go7I5X93_y3BBrg5InZvwMlv8saLlT5GRp89KnTsy7eArTEzoImBmMDN9V9dWH190keF5BIyFeFCMBsrfVEURTDx1mmakQdsadiJoQfzNcQgcg=s0-d-e1-ft#https://img.mailinblue.com/new_images/rnb/theme1/rnb_ico_fb.png\" class=\"CToWUd\"></a></span>\r\n                                                                            </td></tr></tbody></table>\r\n                                                                            </div><div>\r\n                                                                            <table align=\"left\" style=\"float:left;display:inline-block;border-collapse:collapse;border-spacing:0\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                    <td style=\"padding:0px 5px 5px 0px;border-collapse:collapse\" align=\"left\">\r\n                                                                            <span style=\"color:#ffffff;font-weight:normal\">\r\n                                                                                <a href=\"https://twitter.com/unikerycompany\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://twitter.com/unikerycompany&amp;source=gmail&amp;ust=1623224292531000&amp;usg=AFQjCNGQdnBaYZ5QeEi7aoKTRQ70gR5pwQ\"><img alt=\"Twitter\" border=\"0\" hspace=\"0\" vspace=\"0\" style=\"vertical-align:top\" src=\"https://ci4.googleusercontent.com/proxy/eEihIFeeV0QPsNbZqfBU7SlLhkSaqr7xqlhcljm-ukugdcou6IeavWgTFXoJpL1YSUQ8mcY5vucLf6KVn2yjpilFYxR_lrVdXt5s3Tmv8Mp1dw=s0-d-e1-ft#https://img.mailinblue.com/new_images/rnb/theme1/rnb_ico_tw.png\" class=\"CToWUd\"></a></span>\r\n                                                                            </td></tr></tbody></table>\r\n                                                                            </div><div>\r\n                                                                            <table align=\"left\" style=\"float:left;display:inline-block;border-collapse:collapse;border-spacing:0\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n                                                                            <tbody><tr style=\"border-collapse:collapse\">\r\n                                                                                    <td style=\"padding:0px 5px 5px 0px;border-collapse:collapse\" align=\"left\">\r\n                                                                            <span style=\"color:#ffffff;font-weight:normal\">\r\n                                                                                <a href=\"https://www.linkedin.com/in/unikery-company-196b55198/\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=https://www.linkedin.com/in/unikery-company-196b55198/&amp;source=gmail&amp;ust=1623224292531000&amp;usg=AFQjCNFQgLriEAn1PCjV1n4jrKwbbgKbmw\"><img alt=\"LinkedIn\" border=\"0\" hspace=\"0\" vspace=\"0\" style=\"vertical-align:top\" src=\"https://ci6.googleusercontent.com/proxy/hmrzvykI3-qf_MDVOj2NL6LY6IRwvgTfg_278I9XxNbgNYBPFAFXOTQfi2JMt5CO760gAxzuluhelS3hiuzOdEg8QB3bkwrloVxC9tbGLcaUyg=s0-d-e1-ft#https://img.mailinblue.com/new_images/rnb/theme1/rnb_ico_in.png\" class=\"CToWUd\"></a></span>\r\n                                                                            </td></tr></tbody></table>\r\n                                                                            </div></td>\r\n                                                                    </tr>\r\n                                                                </tbody></table>\r\n                                                            </td>\r\n                                                        </tr>\r\n                                                        </tbody></table>\r\n                                                    </th></tr>\r\n                                        </tbody></table></td>\r\n                                </tr>\r\n                                <tr style=\"border-collapse:collapse\">\r\n                                    <td height=\"20\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                </tr>\r\n                            </tbody></table>\r\n\r\n                        </td>\r\n                    </tr></tbody></table>\r\n                \r\n            </div></td>\r\n    </tr><tr style=\"border-collapse:collapse\">\r\n\r\n        \r\n\r\n\r\n        <td align=\"center\" valign=\"top\" style=\"border-collapse:collapse\">\r\n\r\n            <div style=\"background-color:rgb(249,250,252)\">\r\n                \r\n                <table width=\"100%\" cellpadding=\"0\" border=\"0\" cellspacing=\"0\" style=\"min-width:590px;border-collapse:collapse;border-spacing:0;width:100%!important\" name=\"Layout_4\" id=\"m_1842117675456983400m_-6882562584090903807Layout_4\">\r\n                    <tbody><tr style=\"border-collapse:collapse\">\r\n                        <td align=\"center\" valign=\"top\" style=\"min-width:590px;border-collapse:collapse\">\r\n                            <a href=\"#m_1842117675456983400_m_-6882562584090903807_\" name=\"m_1842117675456983400_m_-6882562584090903807_Layout_4\"></a>\r\n                            <table width=\"100%\" cellpadding=\"0\" border=\"0\" align=\"center\" cellspacing=\"0\" bgcolor=\"#f9fafc\" style=\"padding-right:20px;padding-left:20px;background-color:rgb(249,250,252);border-collapse:collapse;border-spacing:0\">\r\n                                <tbody><tr style=\"border-collapse:collapse\">\r\n                                    <td height=\"20\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                </tr>\r\n                                <tr style=\"border-collapse:collapse\">\r\n                                    <td style=\"font-size:14px;color:#888888;font-weight:normal;text-align:center;font-family:Arial,Helvetica,sans-serif;border-collapse:collapse\">\r\n                                        <div>© 2020 CÔNG TY TNHH UNIKERY</div>\r\n                                    </td></tr>\r\n                                <tr style=\"border-collapse:collapse\">\r\n                                    <td height=\"20\" style=\"font-size:1px;line-height:0px;border-collapse:collapse\">&nbsp;</td>\r\n                                </tr>\r\n                            </tbody></table>\r\n                        </td>\r\n                    </tr>\r\n                </tbody></table>\r\n                \r\n            </div></td>\r\n    </tr></tbody></table>\r\n            \r\n                        </td>\r\n        </tr>\r\n        </tbody></table>', '2021-06-08 00:41:36', '2021-06-08 00:41:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sendportal_unsubscribe_event_types`
--

CREATE TABLE `sendportal_unsubscribe_event_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `sendportal_unsubscribe_event_types`
--

INSERT INTO `sendportal_unsubscribe_event_types` (`id`, `name`) VALUES
(1, 'Bounce'),
(2, 'Complaint'),
(3, 'Manual by Admin'),
(4, 'Manual by Subscriber');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `api_token`, `current_workspace_id`, `remember_token`, `locale`, `created_at`, `updated_at`) VALUES
(1, 'dainguyen', 'hppvtien@gmail.com', '2021-06-07 23:52:28', '$2y$10$FlQ1SlSgDykZw.St0Uqi.ue1CLvlKmfZjXOWh.5pkinEBxmRjpiri', NULL, 1, NULL, 'en', '2021-06-07 23:52:28', '2021-12-14 21:46:55'),
(6, 'dainguyenabc', 'admin@gmail.com', '2021-06-09 19:19:10', '$2y$10$FlQ1SlSgDykZw.St0Uqi.ue1CLvlKmfZjXOWh.5pkinEBxmRjpiri', NULL, 1, NULL, 'en', '2021-06-09 19:18:44', '2021-06-09 19:19:10'),
(7, 'DAN SPICE', 'pvtien@gmail.com', '2021-06-10 04:09:54', '$2y$10$FlQ1SlSgDykZw.St0Uqi.ue1CLvlKmfZjXOWh.5pkinEBxmRjpiri', NULL, 2, NULL, 'en', '2021-06-10 04:09:22', '2021-06-10 04:09:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `workspaces`
--

CREATE TABLE `workspaces` (
  `id` int(10) UNSIGNED NOT NULL,
  `owner_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `workspaces`
--

INSERT INTO `workspaces` (`id`, `owner_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 'adsmo', '2021-06-07 23:52:28', '2021-06-07 23:52:28'),
(2, 7, 'Tien', '2021-06-10 04:09:22', '2021-12-10 02:49:14'),
(3, 1, 'wp2', '2021-12-10 02:51:04', '2021-12-10 02:51:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `workspace_users`
--

CREATE TABLE `workspace_users` (
  `workspace_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `workspace_users`
--

INSERT INTO `workspace_users` (`workspace_id`, `user_id`, `role`, `created_at`, `updated_at`) VALUES
(1, 1, 'owner', '2021-06-07 23:52:28', '2021-06-07 23:52:28'),
(1, 6, 'member', '2021-06-09 19:18:44', '2021-06-09 19:18:44'),
(2, 7, 'member', '2021-06-10 04:09:22', '2021-06-10 04:09:22'),
(3, 1, 'owner', '2021-12-10 02:51:04', '2021-12-10 02:51:04');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `api_tokens`
--
ALTER TABLE `api_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `api_tokens_api_token_unique` (`api_token`),
  ADD KEY `api_tokens_workspace_id_index` (`workspace_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invitations`
--
ALTER TABLE `invitations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invitations_token_unique` (`token`),
  ADD KEY `invitations_workspace_id_index` (`workspace_id`),
  ADD KEY `invitations_user_id_index` (`user_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `sendportal_campaigns`
--
ALTER TABLE `sendportal_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_campaigns_status_id_foreign` (`status_id`),
  ADD KEY `sendportal_campaigns_template_id_foreign` (`template_id`),
  ADD KEY `sendportal_campaigns_email_service_id_foreign` (`email_service_id`),
  ADD KEY `sendportal_campaigns_workspace_id_index` (`workspace_id`);

--
-- Chỉ mục cho bảng `sendportal_campaign_statuses`
--
ALTER TABLE `sendportal_campaign_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sendportal_campaign_tag`
--
ALTER TABLE `sendportal_campaign_tag`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_campaign_segment_campaign_id_foreign` (`campaign_id`),
  ADD KEY `sendportal_campaign_segment_tag_id_foreign` (`tag_id`);

--
-- Chỉ mục cho bảng `sendportal_email_services`
--
ALTER TABLE `sendportal_email_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_email_services_type_id_foreign` (`type_id`),
  ADD KEY `sendportal_email_services_workspace_id_index` (`workspace_id`);

--
-- Chỉ mục cho bảng `sendportal_email_service_types`
--
ALTER TABLE `sendportal_email_service_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sendportal_messages`
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
-- Chỉ mục cho bảng `sendportal_message_failures`
--
ALTER TABLE `sendportal_message_failures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_message_failures_message_id_foreign` (`message_id`);

--
-- Chỉ mục cho bảng `sendportal_message_urls`
--
ALTER TABLE `sendportal_message_urls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_message_urls_source_type_index` (`source_type`),
  ADD KEY `sendportal_message_urls_source_id_index` (`source_id`),
  ADD KEY `sendportal_message_urls_hash_index` (`hash`),
  ADD KEY `sendportal_message_urls_url_index` (`url`);

--
-- Chỉ mục cho bảng `sendportal_subscribers`
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
-- Chỉ mục cho bảng `sendportal_tags`
--
ALTER TABLE `sendportal_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_segments_workspace_id_index` (`workspace_id`);

--
-- Chỉ mục cho bảng `sendportal_tag_subscriber`
--
ALTER TABLE `sendportal_tag_subscriber`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_segment_subscriber_subscriber_id_foreign` (`subscriber_id`),
  ADD KEY `sendportal_segment_subscriber_tag_id_foreign` (`tag_id`);

--
-- Chỉ mục cho bảng `sendportal_templates`
--
ALTER TABLE `sendportal_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sendportal_templates_workspace_id_index` (`workspace_id`);

--
-- Chỉ mục cho bảng `sendportal_unsubscribe_event_types`
--
ALTER TABLE `sendportal_unsubscribe_event_types`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- Chỉ mục cho bảng `workspaces`
--
ALTER TABLE `workspaces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `workspaces_owner_id_index` (`owner_id`);

--
-- Chỉ mục cho bảng `workspace_users`
--
ALTER TABLE `workspace_users`
  ADD UNIQUE KEY `workspace_users_workspace_id_user_id_unique` (`workspace_id`,`user_id`),
  ADD KEY `workspace_users_user_id_index` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `api_tokens`
--
ALTER TABLE `api_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `sendportal_campaigns`
--
ALTER TABLE `sendportal_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `sendportal_campaign_statuses`
--
ALTER TABLE `sendportal_campaign_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `sendportal_campaign_tag`
--
ALTER TABLE `sendportal_campaign_tag`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `sendportal_email_services`
--
ALTER TABLE `sendportal_email_services`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `sendportal_email_service_types`
--
ALTER TABLE `sendportal_email_service_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `sendportal_messages`
--
ALTER TABLE `sendportal_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT cho bảng `sendportal_message_failures`
--
ALTER TABLE `sendportal_message_failures`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sendportal_message_urls`
--
ALTER TABLE `sendportal_message_urls`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `sendportal_subscribers`
--
ALTER TABLE `sendportal_subscribers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `sendportal_tags`
--
ALTER TABLE `sendportal_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sendportal_tag_subscriber`
--
ALTER TABLE `sendportal_tag_subscriber`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `sendportal_templates`
--
ALTER TABLE `sendportal_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `sendportal_unsubscribe_event_types`
--
ALTER TABLE `sendportal_unsubscribe_event_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `workspaces`
--
ALTER TABLE `workspaces`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `invitations`
--
ALTER TABLE `invitations`
  ADD CONSTRAINT `invitations_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`);

--
-- Các ràng buộc cho bảng `sendportal_campaigns`
--
ALTER TABLE `sendportal_campaigns`
  ADD CONSTRAINT `sendportal_campaigns_email_service_id_foreign` FOREIGN KEY (`email_service_id`) REFERENCES `sendportal_email_services` (`id`),
  ADD CONSTRAINT `sendportal_campaigns_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `sendportal_campaign_statuses` (`id`),
  ADD CONSTRAINT `sendportal_campaigns_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `sendportal_templates` (`id`);

--
-- Các ràng buộc cho bảng `sendportal_campaign_tag`
--
ALTER TABLE `sendportal_campaign_tag`
  ADD CONSTRAINT `sendportal_campaign_segment_campaign_id_foreign` FOREIGN KEY (`campaign_id`) REFERENCES `sendportal_campaigns` (`id`),
  ADD CONSTRAINT `sendportal_campaign_segment_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `sendportal_tags` (`id`);

--
-- Các ràng buộc cho bảng `sendportal_email_services`
--
ALTER TABLE `sendportal_email_services`
  ADD CONSTRAINT `sendportal_email_services_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `sendportal_email_service_types` (`id`);

--
-- Các ràng buộc cho bảng `sendportal_message_failures`
--
ALTER TABLE `sendportal_message_failures`
  ADD CONSTRAINT `sendportal_message_failures_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `sendportal_messages` (`id`);

--
-- Các ràng buộc cho bảng `sendportal_subscribers`
--
ALTER TABLE `sendportal_subscribers`
  ADD CONSTRAINT `sendportal_subscribers_unsubscribe_event_id_foreign` FOREIGN KEY (`unsubscribe_event_id`) REFERENCES `sendportal_unsubscribe_event_types` (`id`);

--
-- Các ràng buộc cho bảng `sendportal_tag_subscriber`
--
ALTER TABLE `sendportal_tag_subscriber`
  ADD CONSTRAINT `sendportal_segment_subscriber_subscriber_id_foreign` FOREIGN KEY (`subscriber_id`) REFERENCES `sendportal_subscribers` (`id`),
  ADD CONSTRAINT `sendportal_segment_subscriber_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `sendportal_tags` (`id`);

--
-- Các ràng buộc cho bảng `workspace_users`
--
ALTER TABLE `workspace_users`
  ADD CONSTRAINT `workspace_users_workspace_id_foreign` FOREIGN KEY (`workspace_id`) REFERENCES `workspaces` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
