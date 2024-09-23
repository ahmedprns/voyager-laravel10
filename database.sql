-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2024 at 01:56 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `evalve_lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `order`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'تصنيف 1', 'تصنيف-1', '2024-07-08 19:26:04', '2024-08-13 22:33:31'),
(2, NULL, 1, 'Category 2', 'category-2', '2024-07-08 19:26:04', '2024-07-08 19:26:04');

-- --------------------------------------------------------

--
-- Table structure for table `data_rows`
--

CREATE TABLE `data_rows` (
  `id` int(10) UNSIGNED NOT NULL,
  `data_type_id` int(10) UNSIGNED NOT NULL,
  `field` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_rows`
--

INSERT INTO `data_rows` (`id`, `data_type_id`, `field`, `type`, `display_name`, `required`, `browse`, `read`, `edit`, `add`, `delete`, `details`, `order`) VALUES
(1, 1, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(2, 1, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(3, 1, 'email', 'text', 'Email', 1, 1, 1, 1, 1, 1, NULL, 3),
(4, 1, 'password', 'password', 'Password', 1, 0, 0, 1, 1, 0, NULL, 4),
(5, 1, 'remember_token', 'text', 'Remember Token', 0, 0, 0, 0, 0, 0, NULL, 5),
(6, 1, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 6),
(7, 1, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(8, 1, 'avatar', 'image', 'Avatar', 0, 1, 1, 1, 1, 1, NULL, 8),
(9, 1, 'user_belongsto_role_relationship', 'relationship', 'Role', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', 10),
(10, 1, 'user_belongstomany_role_relationship', 'relationship', 'Roles', 0, 1, 1, 1, 1, 0, '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', 11),
(11, 1, 'settings', 'hidden', 'Settings', 0, 0, 0, 0, 0, 0, NULL, 12),
(12, 2, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(13, 2, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(14, 2, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(15, 2, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(16, 3, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(17, 3, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 2),
(18, 3, 'created_at', 'timestamp', 'Created At', 0, 0, 0, 0, 0, 0, NULL, 3),
(19, 3, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 4),
(20, 3, 'display_name', 'text', 'Display Name', 1, 1, 1, 1, 1, 1, NULL, 5),
(21, 1, 'role_id', 'text', 'Role', 1, 1, 1, 1, 1, 1, NULL, 9),
(22, 4, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(23, 4, 'parent_id', 'select_dropdown', 'Parent', 0, 0, 1, 1, 1, 1, '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', 2),
(24, 4, 'order', 'text', 'Order', 1, 1, 1, 1, 1, 1, '{\"default\":1}', 3),
(25, 4, 'name', 'text', 'Name', 1, 1, 1, 1, 1, 1, NULL, 4),
(26, 4, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"name\"}}', 5),
(27, 4, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, NULL, 6),
(28, 4, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 7),
(29, 5, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(30, 5, 'author_id', 'text', 'Author', 1, 0, 1, 1, 0, 1, NULL, 2),
(31, 5, 'category_id', 'text', 'Category', 1, 0, 1, 1, 1, 0, NULL, 3),
(32, 5, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 4),
(33, 5, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 5),
(34, 5, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 6),
(35, 5, 'image', 'image', 'Post Image', 0, 1, 1, 1, 1, 1, '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', 7),
(36, 5, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', 8),
(37, 5, 'meta_description', 'text_area', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 9),
(38, 5, 'meta_keywords', 'text_area', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 10),
(39, 5, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', 11),
(40, 5, 'created_at', 'timestamp', 'Created At', 0, 1, 1, 0, 0, 0, NULL, 12),
(41, 5, 'updated_at', 'timestamp', 'Updated At', 0, 0, 0, 0, 0, 0, NULL, 13),
(42, 5, 'seo_title', 'text', 'SEO Title', 0, 1, 1, 1, 1, 1, NULL, 14),
(43, 5, 'featured', 'checkbox', 'Featured', 1, 1, 1, 1, 1, 1, NULL, 15),
(44, 6, 'id', 'number', 'ID', 1, 0, 0, 0, 0, 0, NULL, 1),
(45, 6, 'author_id', 'text', 'Author', 1, 0, 0, 0, 0, 0, NULL, 2),
(46, 6, 'title', 'text', 'Title', 1, 1, 1, 1, 1, 1, NULL, 3),
(47, 6, 'excerpt', 'text_area', 'Excerpt', 1, 0, 1, 1, 1, 1, NULL, 4),
(48, 6, 'body', 'rich_text_box', 'Body', 1, 0, 1, 1, 1, 1, NULL, 5),
(49, 6, 'slug', 'text', 'Slug', 1, 0, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', 6),
(50, 6, 'meta_description', 'text', 'Meta Description', 1, 0, 1, 1, 1, 1, NULL, 7),
(51, 6, 'meta_keywords', 'text', 'Meta Keywords', 1, 0, 1, 1, 1, 1, NULL, 8),
(52, 6, 'status', 'select_dropdown', 'Status', 1, 1, 1, 1, 1, 1, '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', 9),
(53, 6, 'created_at', 'timestamp', 'Created At', 1, 1, 1, 0, 0, 0, NULL, 10),
(54, 6, 'updated_at', 'timestamp', 'Updated At', 1, 0, 0, 0, 0, 0, NULL, 11),
(55, 6, 'image', 'image', 'Page Image', 0, 1, 1, 1, 1, 1, NULL, 12),
(56, 7, 'id', 'number', 'مسلسل', 1, 0, 0, 0, 0, 0, '{}', 1),
(57, 7, 'title', 'text', 'العنوان', 1, 1, 1, 1, 1, 1, '{}', 2),
(58, 7, 'excerpt', 'text_area', 'الملخص', 0, 0, 1, 1, 1, 1, '{}', 3),
(59, 7, 'body', 'rich_text_box', 'الموضوع', 0, 0, 1, 1, 1, 1, '{}', 4),
(60, 7, 'image', 'image', 'الصورة', 0, 1, 1, 1, 1, 1, '{}', 5),
(61, 7, 'slug', 'text', 'Slug', 1, 1, 1, 1, 1, 1, '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:news,slug\"}}', 6),
(62, 7, 'created_at', 'timestamp', 'Created At', 0, 0, 1, 0, 0, 0, '{}', 7),
(63, 7, 'updated_at', 'timestamp', 'Updated At', 0, 0, 1, 0, 0, 0, '{}', 8);

-- --------------------------------------------------------

--
-- Table structure for table `data_types`
--

CREATE TABLE `data_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `display_name_singular` varchar(255) NOT NULL,
  `display_name_plural` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `model_name` varchar(255) DEFAULT NULL,
  `policy_name` varchar(255) DEFAULT NULL,
  `controller` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `data_types`
--

INSERT INTO `data_types` (`id`, `name`, `slug`, `display_name_singular`, `display_name_plural`, `icon`, `model_name`, `policy_name`, `controller`, `description`, `generate_permissions`, `server_side`, `details`, `created_at`, `updated_at`) VALUES
(1, 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', 1, 0, NULL, '2024-07-08 19:25:51', '2024-07-08 19:25:51'),
(2, 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', NULL, '', '', 1, 0, NULL, '2024-07-08 19:25:52', '2024-07-08 19:25:52'),
(3, 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', NULL, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', 1, 0, NULL, '2024-07-08 19:25:52', '2024-07-08 19:25:52'),
(4, 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', NULL, '', '', 1, 0, NULL, '2024-07-08 19:26:02', '2024-07-08 19:26:02'),
(5, 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', 1, 0, NULL, '2024-07-08 19:26:05', '2024-07-08 19:26:05'),
(6, 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', NULL, '', '', 1, 0, NULL, '2024-07-08 19:26:07', '2024-07-08 19:26:07'),
(7, 'news', 'news', 'الاخبار', 'الاخبار', 'voyager-news', 'App\\Models\\News', NULL, NULL, NULL, 1, 0, '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null,\"scope\":null}', '2024-08-26 18:09:26', '2024-08-26 18:52:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2024-07-08 19:25:54', '2024-07-08 19:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `menu_id` int(10) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(255) NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `parameters` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `menu_id`, `title`, `url`, `target`, `icon_class`, `color`, `parent_id`, `order`, `created_at`, `updated_at`, `route`, `parameters`) VALUES
(1, 1, 'الرئيسية', '', '_self', 'voyager-dashboard', '#000000', NULL, 1, '2024-07-08 19:25:54', '2024-08-16 00:05:27', 'voyager.dashboard', 'null'),
(2, 1, 'الوسائط', '', '_self', 'voyager-images', '#000000', 5, 2, '2024-07-08 19:25:54', '2024-08-15 22:28:29', 'voyager.media.index', 'null'),
(3, 1, 'المستخدمين', '', '_self', 'voyager-person', '#000000', 14, 1, '2024-07-08 19:25:54', '2024-08-13 22:54:18', 'voyager.users.index', 'null'),
(4, 1, 'الصلاحيات', '', '_self', 'voyager-lock', '#000000', 14, 2, '2024-07-08 19:25:54', '2024-08-13 22:54:18', 'voyager.roles.index', 'null'),
(5, 1, 'الادوات', '', '_self', 'voyager-tools', '#008000', NULL, 6, '2024-07-08 19:25:54', '2024-08-26 19:41:08', NULL, ''),
(6, 1, 'القوائم', '', '_self', 'voyager-list', '#000000', 5, 1, '2024-07-08 19:25:54', '2024-08-15 22:28:29', 'voyager.menus.index', 'null'),
(10, 1, 'الاعدادات العامة', '', '_self', 'voyager-settings', '#000000', 15, 1, '2024-07-08 19:25:54', '2024-08-13 22:52:11', 'voyager.settings.index', 'null'),
(11, 1, 'التصنيفات', '', '_self', 'voyager-categories', '#000000', 16, 2, '2024-07-08 19:26:03', '2024-08-13 22:54:26', 'voyager.categories.index', 'null'),
(12, 1, 'المقالات', '', '_self', 'voyager-news', '#000000', 16, 1, '2024-07-08 19:26:06', '2024-08-13 22:54:22', 'voyager.posts.index', 'null'),
(13, 1, 'الصفحات', '', '_self', 'voyager-file-text', '#000000', NULL, 2, '2024-07-08 19:26:07', '2024-08-15 21:37:07', 'voyager.pages.index', 'null'),
(14, 1, 'الادارة', '', '_self', 'voyager-receipt', '#000000', NULL, 7, '2024-08-13 22:49:15', '2024-08-26 19:41:31', NULL, ''),
(15, 1, 'الاعدادات', '', '_self', 'voyager-settings', '#000000', NULL, 5, '2024-08-13 22:52:03', '2024-08-26 18:46:59', NULL, ''),
(16, 1, 'المقالات', '', '_self', 'voyager-news', '#000000', NULL, 4, '2024-08-13 22:54:03', '2024-08-26 18:46:59', NULL, ''),
(17, 1, 'News', '', '_self', 'voyager-news', '#f9572f', NULL, 3, '2024-08-26 18:09:26', '2024-08-26 18:47:40', 'voyager.news.index', 'null');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_01_01_000000_add_voyager_user_fields', 1),
(4, '2016_01_01_000000_create_data_types_table', 1),
(5, '2016_05_19_173453_create_menu_table', 1),
(6, '2016_10_21_190000_create_roles_table', 1),
(7, '2016_10_21_190000_create_settings_table', 1),
(8, '2016_11_30_135954_create_permission_table', 1),
(9, '2016_11_30_141208_create_permission_role_table', 1),
(10, '2016_12_26_201236_data_types__add__server_side', 1),
(11, '2017_01_13_000000_add_route_to_menu_items_table', 1),
(12, '2017_01_14_005015_create_translations_table', 1),
(13, '2017_01_15_000000_make_table_name_nullable_in_permissions_table', 1),
(14, '2017_03_06_000000_add_controller_to_data_types_table', 1),
(15, '2017_04_21_000000_add_order_to_data_rows_table', 1),
(16, '2017_07_05_210000_add_policyname_to_data_types_table', 1),
(17, '2017_08_05_000000_add_group_to_settings_table', 1),
(18, '2017_11_26_013050_add_user_role_relationship', 1),
(19, '2017_11_26_015000_create_user_roles_table', 1),
(20, '2018_03_11_000000_add_user_settings', 1),
(21, '2018_03_14_000000_add_details_to_data_types_table', 1),
(22, '2018_03_16_000000_make_settings_value_nullable', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(25, '2016_01_01_000000_create_pages_table', 2),
(26, '2016_01_01_000000_create_posts_table', 2),
(27, '2016_02_15_204651_create_categories_table', 2),
(28, '2017_04_11_000000_alter_post_nullable_fields_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `excerpt`, `body`, `image`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'aaaaaaaaaaa', 'asdfasdfasdf\r\nasdfasdfasfddsf', '<p>asdf asdf asdf asdf sdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asd</p>\r\n<p>asdf asdf asdf asdf sdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asd</p>\r\n<p>asdf asdf asdf asdf asdf asdfsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asd</p>\r\n<p>asdf asdf asdf asdf asdf asdfsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asd</p>\r\n<p>asdf asdf asdf asdf sdf asdf asdf asdf asdsdf asdf asdf asdf asd</p>\r\n<p>asdf asdf asdf asdf asdf asdfsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asd</p>\r\n<p>asdf asdf asdf asdf sdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asdsdf asdf asdf asdf asd</p>\r\n<p>asdf asdf asdf asdf asdf asdf</p>', 'news\\August2024\\9zOD8y46fmVDStRGuQh4.jpg', 'aaaaaaaaaaa', '2024-08-26 18:16:00', '2024-08-26 18:17:34'),
(2, 'خبر جديد', 'خبر جديد\nخبر جديد', '<p>خبر جديد</p>\n<p>خبر جديد</p>\n<p>خبر جديد</p>\n<p>خبر جديد</p>\n<p>&nbsp;</p>', 'news\\August2024\\um8MfESCRWuAsvkOHAFe.png', 'khbr-jdyd', '2024-08-26 18:40:29', '2024-08-26 19:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `author_id`, `title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'مرحبا بالعالم', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2024-07-08 19:26:08', '2024-08-26 15:53:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `key`, `table_name`, `created_at`, `updated_at`) VALUES
(1, 'browse_admin', NULL, '2024-07-08 19:25:54', '2024-07-08 19:25:54'),
(2, 'browse_bread', NULL, '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(3, 'browse_database', NULL, '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(4, 'browse_media', NULL, '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(5, 'browse_compass', NULL, '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(6, 'browse_menus', 'menus', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(7, 'read_menus', 'menus', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(8, 'edit_menus', 'menus', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(9, 'add_menus', 'menus', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(10, 'delete_menus', 'menus', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(11, 'browse_roles', 'roles', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(12, 'read_roles', 'roles', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(13, 'edit_roles', 'roles', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(14, 'add_roles', 'roles', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(15, 'delete_roles', 'roles', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(16, 'browse_users', 'users', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(17, 'read_users', 'users', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(18, 'edit_users', 'users', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(19, 'add_users', 'users', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(20, 'delete_users', 'users', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(21, 'browse_settings', 'settings', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(22, 'read_settings', 'settings', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(23, 'edit_settings', 'settings', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(24, 'add_settings', 'settings', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(25, 'delete_settings', 'settings', '2024-07-08 19:25:55', '2024-07-08 19:25:55'),
(26, 'browse_categories', 'categories', '2024-07-08 19:26:04', '2024-07-08 19:26:04'),
(27, 'read_categories', 'categories', '2024-07-08 19:26:04', '2024-07-08 19:26:04'),
(28, 'edit_categories', 'categories', '2024-07-08 19:26:04', '2024-07-08 19:26:04'),
(29, 'add_categories', 'categories', '2024-07-08 19:26:04', '2024-07-08 19:26:04'),
(30, 'delete_categories', 'categories', '2024-07-08 19:26:04', '2024-07-08 19:26:04'),
(31, 'browse_posts', 'posts', '2024-07-08 19:26:06', '2024-07-08 19:26:06'),
(32, 'read_posts', 'posts', '2024-07-08 19:26:06', '2024-07-08 19:26:06'),
(33, 'edit_posts', 'posts', '2024-07-08 19:26:06', '2024-07-08 19:26:06'),
(34, 'add_posts', 'posts', '2024-07-08 19:26:06', '2024-07-08 19:26:06'),
(35, 'delete_posts', 'posts', '2024-07-08 19:26:07', '2024-07-08 19:26:07'),
(36, 'browse_pages', 'pages', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(37, 'read_pages', 'pages', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(38, 'edit_pages', 'pages', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(39, 'add_pages', 'pages', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(40, 'delete_pages', 'pages', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(41, 'browse_news', 'news', '2024-08-26 18:09:26', '2024-08-26 18:09:26'),
(42, 'read_news', 'news', '2024-08-26 18:09:26', '2024-08-26 18:09:26'),
(43, 'edit_news', 'news', '2024-08-26 18:09:26', '2024-08-26 18:09:26'),
(44, 'add_news', 'news', '2024-08-26 18:09:26', '2024-08-26 18:09:26'),
(45, 'delete_news', 'news', '2024-08-26 18:09:26', '2024-08-26 18:09:26');

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_role`
--

INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `seo_title` varchar(255) DEFAULT NULL,
  `excerpt` text DEFAULT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `author_id`, `category_id`, `title`, `seo_title`, `excerpt`, `body`, `image`, `slug`, `meta_description`, `meta_keywords`, `status`, `featured`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, 'Lorem Ipsum Post', NULL, 'This is the excerpt for the Lorem Ipsum Post', '<p>This is the body of the lorem ipsum post</p>', 'posts/post1.jpg', 'lorem-ipsum-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-07-08 19:26:07', '2024-07-08 19:26:07'),
(2, 0, NULL, 'My Sample Post', NULL, 'This is the excerpt for the sample Post', '<p>This is the body for the sample post, which includes the body.</p>\n                <h2>We can use all kinds of format!</h2>\n                <p>And include a bunch of other stuff.</p>', 'posts/post2.jpg', 'my-sample-post', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-07-08 19:26:07', '2024-07-08 19:26:07'),
(3, 0, NULL, 'Latest Post', NULL, 'This is the excerpt for the latest post', '<p>This is the body for the latest post</p>', 'posts/post3.jpg', 'latest-post', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-07-08 19:26:07', '2024-07-08 19:26:07'),
(4, 0, NULL, 'Yarr Post', NULL, 'Reef sails nipperkin bring a spring upon her cable coffer jury mast spike marooned Pieces of Eight poop deck pillage. Clipper driver coxswain galleon hempen halter come about pressgang gangplank boatswain swing the lead. Nipperkin yard skysail swab lanyard Blimey bilge water ho quarter Buccaneer.', '<p>Swab deadlights Buccaneer fire ship square-rigged dance the hempen jig weigh anchor cackle fruit grog furl. Crack Jennys tea cup chase guns pressgang hearties spirits hogshead Gold Road six pounders fathom measured fer yer chains. Main sheet provost come about trysail barkadeer crimp scuttle mizzenmast brig plunder.</p>\n<p>Mizzen league keelhaul galleon tender cog chase Barbary Coast doubloon crack Jennys tea cup. Blow the man down lugsail fire ship pinnace cackle fruit line warp Admiral of the Black strike colors doubloon. Tackle Jack Ketch come about crimp rum draft scuppers run a shot across the bow haul wind maroon.</p>\n<p>Interloper heave down list driver pressgang holystone scuppers tackle scallywag bilged on her anchor. Jack Tar interloper draught grapple mizzenmast hulk knave cable transom hogshead. Gaff pillage to go on account grog aft chase guns piracy yardarm knave clap of thunder.</p>', 'posts/post4.jpg', 'yarr-post', 'this be a meta descript', 'keyword1, keyword2, keyword3', 'PUBLISHED', 0, '2024-07-08 19:26:07', '2024-07-08 19:26:07'),
(5, 1, 1, 'aa', '', '', '<p>aa</p>', NULL, 'aa', '', '', 'PUBLISHED', 0, '2024-08-13 10:38:45', '2024-08-13 10:38:45');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', '2024-07-08 19:25:54', '2024-07-08 19:25:54'),
(2, 'user', 'Normal User', '2024-07-08 19:25:54', '2024-07-08 19:25:54');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `display_name` varchar(255) NOT NULL,
  `value` text DEFAULT NULL,
  `details` text DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `display_name`, `value`, `details`, `type`, `order`, `group`) VALUES
(1, 'site.title', 'Site Title', 'عراق اوتوكار', '', 'text', 1, 'Site'),
(2, 'site.description', 'Site Description', 'IQ Auto Cars', '', 'text', 2, 'Site'),
(3, 'site.logo', 'Site Logo', 'settings\\August2024\\CVrbnaXV4l04ghVfHwfk.png', '', 'image', 3, 'Site'),
(4, 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', NULL, '', 'text', 4, 'Site'),
(5, 'admin.bg_image', 'Admin Background Image', '', '', 'image', 5, 'Admin'),
(6, 'admin.title', 'Admin Title', 'عراق اوتوكار', '', 'text', 1, 'Admin'),
(7, 'admin.description', 'Admin Description', 'IQ Auto Cars', '', 'text', 2, 'Admin'),
(8, 'admin.loader', 'Admin Loader', 'settings\\August2024\\Do52q1CYUqCI36p3Ljmq.png', '', 'image', 3, 'Admin'),
(9, 'admin.icon_image', 'Admin Icon Image', 'settings\\August2024\\cUw3kXansjcmbzOh9gUE.png', '', 'image', 4, 'Admin'),
(10, 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', NULL, '', 'text', 1, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `translations`
--

CREATE TABLE `translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `table_name` varchar(255) NOT NULL,
  `column_name` varchar(255) NOT NULL,
  `foreign_key` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `translations`
--

INSERT INTO `translations` (`id`, `table_name`, `column_name`, `foreign_key`, `locale`, `value`, `created_at`, `updated_at`) VALUES
(1, 'data_types', 'display_name_singular', 5, 'pt', 'Post', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(2, 'data_types', 'display_name_singular', 6, 'pt', 'Página', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(3, 'data_types', 'display_name_singular', 1, 'pt', 'Utilizador', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(4, 'data_types', 'display_name_singular', 4, 'pt', 'Categoria', '2024-07-08 19:26:08', '2024-07-08 19:26:08'),
(5, 'data_types', 'display_name_singular', 2, 'pt', 'Menu', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(6, 'data_types', 'display_name_singular', 3, 'pt', 'Função', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(7, 'data_types', 'display_name_plural', 5, 'pt', 'Posts', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(8, 'data_types', 'display_name_plural', 6, 'pt', 'Páginas', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(9, 'data_types', 'display_name_plural', 1, 'pt', 'Utilizadores', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(10, 'data_types', 'display_name_plural', 4, 'pt', 'Categorias', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(11, 'data_types', 'display_name_plural', 2, 'pt', 'Menus', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(12, 'data_types', 'display_name_plural', 3, 'pt', 'Funções', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(13, 'categories', 'slug', 1, 'pt', 'categoria-1', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(14, 'categories', 'name', 1, 'pt', 'Categoria 1', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(15, 'categories', 'slug', 2, 'pt', 'categoria-2', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(16, 'categories', 'name', 2, 'pt', 'Categoria 2', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(17, 'pages', 'title', 1, 'pt', 'Olá Mundo', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(18, 'pages', 'slug', 1, 'pt', 'ola-mundo', '2024-07-08 19:26:09', '2024-07-08 19:26:09'),
(19, 'pages', 'body', 1, 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(20, 'menu_items', 'title', 1, 'pt', 'Painel de Controle', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(21, 'menu_items', 'title', 2, 'pt', 'Media', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(22, 'menu_items', 'title', 12, 'pt', 'Publicações', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(23, 'menu_items', 'title', 3, 'pt', 'Utilizadores', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(24, 'menu_items', 'title', 11, 'pt', 'Categorias', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(25, 'menu_items', 'title', 13, 'pt', 'Páginas', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(26, 'menu_items', 'title', 4, 'pt', 'Funções', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(27, 'menu_items', 'title', 5, 'pt', 'Ferramentas', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(28, 'menu_items', 'title', 6, 'pt', 'Menus', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(29, 'menu_items', 'title', 7, 'pt', 'Base de dados', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(30, 'menu_items', 'title', 10, 'pt', 'Configurações', '2024-07-08 19:26:10', '2024-07-08 19:26:10'),
(31, 'posts', 'title', 5, 'ar', 'مقالة', '2024-08-13 10:39:25', '2024-08-13 10:39:25'),
(32, 'posts', 'body', 5, 'ar', '<p>مقالة</p>', '2024-08-13 10:39:25', '2024-08-13 10:39:25'),
(33, 'posts', 'slug', 5, 'ar', 'mqalh', '2024-08-13 10:39:25', '2024-08-13 10:39:25'),
(34, 'categories', 'name', 1, 'en', 'Category 1', '2024-08-13 22:33:31', '2024-08-13 22:33:31'),
(35, 'categories', 'slug', 1, 'en', 'category-1', '2024-08-13 22:33:31', '2024-08-13 22:33:31'),
(36, 'menu_items', 'title', 1, 'en', 'Dashboard', '2024-08-13 22:43:51', '2024-08-13 22:43:51'),
(37, 'menu_items', 'title', 4, 'en', 'Roles', '2024-08-13 22:44:18', '2024-08-13 22:44:18'),
(38, 'menu_items', 'title', 3, 'en', 'Users', '2024-08-13 22:44:31', '2024-08-13 22:44:31'),
(39, 'menu_items', 'title', 2, 'en', 'Media', '2024-08-13 22:44:41', '2024-08-13 22:44:41'),
(40, 'menu_items', 'title', 12, 'en', 'Posts', '2024-08-13 22:44:55', '2024-08-13 22:44:55'),
(41, 'menu_items', 'title', 13, 'en', 'Pages', '2024-08-13 22:45:09', '2024-08-13 22:45:09'),
(42, 'menu_items', 'title', 11, 'en', 'Categories', '2024-08-13 22:45:21', '2024-08-13 22:45:21'),
(43, 'menu_items', 'title', 10, 'en', 'General Settings', '2024-08-13 22:45:33', '2024-08-15 22:40:02'),
(44, 'menu_items', 'title', 5, 'en', 'Tools', '2024-08-13 22:45:54', '2024-08-13 22:45:54'),
(45, 'menu_items', 'title', 6, 'en', 'Menu Builder', '2024-08-13 22:46:05', '2024-08-13 22:46:05'),
(47, 'menu_items', 'title', 16, 'en', 'Posts', '2024-08-15 22:39:16', '2024-08-15 22:39:16'),
(48, 'menu_items', 'title', 15, 'en', 'Settings', '2024-08-15 22:39:40', '2024-08-15 22:39:40'),
(49, 'menu_items', 'title', 14, 'en', 'Management', '2024-08-15 22:40:53', '2024-08-15 22:40:53'),
(50, 'pages', 'title', 1, 'en', 'Hello World', '2024-08-26 15:53:34', '2024-08-26 15:53:34'),
(51, 'pages', 'body', 1, 'en', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2024-08-26 15:53:34', '2024-08-26 15:53:34'),
(52, 'pages', 'slug', 1, 'en', 'hello-world', '2024-08-26 15:53:34', '2024-08-26 15:53:34'),
(53, 'data_rows', 'display_name', 56, 'en', 'ID', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(54, 'data_rows', 'display_name', 57, 'en', 'Title', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(55, 'data_rows', 'display_name', 58, 'en', 'Excerpt', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(56, 'data_rows', 'display_name', 59, 'en', 'Body', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(57, 'data_rows', 'display_name', 60, 'en', 'Image', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(58, 'data_rows', 'display_name', 61, 'en', 'Slug', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(59, 'data_rows', 'display_name', 62, 'en', 'Created At', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(60, 'data_rows', 'display_name', 63, 'en', 'Updated At', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(61, 'data_types', 'display_name_singular', 7, 'en', 'News', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(62, 'data_types', 'display_name_plural', 7, 'en', 'News', '2024-08-26 18:11:02', '2024-08-26 18:11:02'),
(63, 'menu_items', 'title', 17, 'en', 'News', '2024-08-26 18:47:39', '2024-08-26 18:47:39'),
(64, 'news', 'title', 2, 'en', 'jg fg fg', '2024-08-26 19:26:13', '2024-08-26 19:26:13'),
(65, 'news', 'excerpt', 2, 'en', 'ghg fg000', '2024-08-26 19:26:13', '2024-08-26 19:26:13'),
(66, 'news', 'body', 2, 'en', '<p>gh bj00</p>', '2024-08-26 19:26:13', '2024-08-26 19:26:13'),
(67, 'news', 'slug', 2, 'en', 'jg-fg-fg', '2024-08-26 19:26:13', '2024-08-26 19:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `settings` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `settings`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin', 'admin@admin.com', 'users\\August2024\\yTJxFxcMayfR5N7rm13D.png', NULL, '$2y$12$d/1zOCs/6FBrIKDSjXF2buwdm0A7QOx9TdMomVFaC4X5f.EmcC9lO', '1lJtU0TK0unhA3zblsEP6vslEXEDcrL0Qg25lz7PlwWJSlZnJnM9fkVT89Hc', '{\"locale\":\"en\"}', '2024-07-08 19:26:05', '2024-08-26 18:53:59');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `data_rows_data_type_id_foreign` (`data_type_id`);

--
-- Indexes for table `data_types`
--
ALTER TABLE `data_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `data_types_name_unique` (`name`),
  ADD UNIQUE KEY `data_types_slug_unique` (`slug`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_name_unique` (`name`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `menu_items_menu_id_foreign` (`menu_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `news_slug_unique` (`slug`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permissions_key_index` (`key`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_permission_id_index` (`permission_id`),
  ADD KEY `permission_role_role_id_index` (`role_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `translations`
--
ALTER TABLE `translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `user_roles_user_id_index` (`user_id`),
  ADD KEY `user_roles_role_id_index` (`role_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `data_rows`
--
ALTER TABLE `data_rows`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `data_types`
--
ALTER TABLE `data_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `translations`
--
ALTER TABLE `translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `data_rows`
--
ALTER TABLE `data_rows`
  ADD CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
