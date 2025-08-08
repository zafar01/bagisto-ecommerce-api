-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 08, 2025 at 04:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bagisto-ecommerce-api3`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` int(10) UNSIGNED NOT NULL,
  `address_type` varchar(255) NOT NULL,
  `parent_address_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'null if guest checkout',
  `cart_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'only for cart_addresses',
  `order_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'only for order_addresses',
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `vat_id` varchar(255) DEFAULT NULL,
  `default_address` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'only for customer_addresses',
  `use_for_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `address_type`, `parent_address_id`, `customer_id`, `cart_id`, `order_id`, `first_name`, `last_name`, `gender`, `company_name`, `address`, `city`, `state`, `country`, `postcode`, `email`, `phone`, `vat_id`, `default_address`, `use_for_shipping`, `additional`, `created_at`, `updated_at`) VALUES
(1, 'cart_billing', NULL, 1, 1, NULL, 'Zafar', 'Husain', NULL, 'funkysouq', '83/146, Q.No. 5 Parampurwa', 'Kanpur', 'UP', 'IN', '208014', 'mcazafar@gmail.com', '9795075367', NULL, 0, 0, NULL, '2025-08-07 07:51:59', '2025-08-07 07:51:59'),
(2, 'cart_shipping', NULL, 1, 1, NULL, 'Zafar', 'Husain', NULL, 'funkysouq', '819  Farnum Road', 'Kanpur', 'UP', 'IN', '208014', 'mcazafar@gmail.com', '9795075367', NULL, 0, 0, NULL, '2025-08-07 07:51:59', '2025-08-07 07:51:59'),
(3, 'cart_billing', NULL, NULL, 3, NULL, 'Zafar', 'Husain', NULL, 'funkysouq', '83/146, Q.No. 5 Parampurwa', 'Kanpur', 'UP', 'IN', '208014', 'mcazafar@gmail.com', '9795075367', NULL, 0, 0, NULL, '2025-08-07 11:01:22', '2025-08-07 11:01:22'),
(4, 'cart_shipping', NULL, NULL, 3, NULL, 'Zafar', 'Husain', NULL, 'funkysouq', '819  Farnum Road', 'Kanpur', 'UP', 'IN', '208014', 'mcazafar@gmail.com', '9795075367', NULL, 0, 0, NULL, '2025-08-07 11:01:22', '2025-08-07 11:01:22'),
(5, 'order_shipping', NULL, NULL, NULL, 1, 'Zafar', 'Husain', NULL, 'funkysouq', '819  Farnum Road', 'Kanpur', 'UP', 'IN', '208014', 'mcazafar@gmail.com', '9795075367', NULL, 0, 0, NULL, '2025-08-07 11:09:42', '2025-08-07 11:09:42'),
(6, 'order_billing', NULL, NULL, NULL, 1, 'Zafar', 'Husain', NULL, 'funkysouq', '83/146, Q.No. 5 Parampurwa', 'Kanpur', 'UP', 'IN', '208014', 'mcazafar@gmail.com', '9795075367', NULL, 0, 0, NULL, '2025-08-07 11:09:42', '2025-08-07 11:09:42'),
(7, 'cart_billing', NULL, 1, 4, NULL, 'Zafar', 'Husain', NULL, 'funkysouq', '83/146, Q.No. 5 Parampurwa', 'Kanpur', 'UP', 'IN', '208014', 'mcazafar@gmail.com', '9795075367', NULL, 0, 0, NULL, '2025-08-08 14:43:37', '2025-08-08 14:43:37'),
(8, 'order_billing', NULL, NULL, NULL, 2, 'Zafar', 'Husain', NULL, 'funkysouq', '83/146, Q.No. 5 Parampurwa', 'Kanpur', 'UP', 'IN', '208014', 'mcazafar@gmail.com', '9795075367', NULL, 0, 0, NULL, '2025-08-08 14:46:20', '2025-08-08 14:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `role_id` int(10) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `api_token`, `status`, `role_id`, `image`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'funkysouq', 'mcazafar@gmail.com', '$2y$12$PQim13M5jx1MVpcsBONGVuBVI04HEAUb3obrlBeaz2xEfk9kC1aqq', 'KiQDSAqIciJDHevAuQ2esVI39uDfFi4n0azq51jwQcBXE1IGRNCNzglG5ZXU5P3OOBLAopcGQB3xLjaO', 1, 1, NULL, NULL, '2025-08-07 04:01:56', '2025-08-07 08:30:58');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `swatch_type` varchar(255) DEFAULT NULL,
  `validation` varchar(255) DEFAULT NULL,
  `regex` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 0,
  `is_unique` tinyint(1) NOT NULL DEFAULT 0,
  `is_filterable` tinyint(1) NOT NULL DEFAULT 0,
  `is_comparable` tinyint(1) NOT NULL DEFAULT 0,
  `is_configurable` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_visible_on_front` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_locale` tinyint(1) NOT NULL DEFAULT 0,
  `value_per_channel` tinyint(1) NOT NULL DEFAULT 0,
  `default_value` int(11) DEFAULT NULL,
  `enable_wysiwyg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attributes`
--

INSERT INTO `attributes` (`id`, `code`, `admin_name`, `type`, `swatch_type`, `validation`, `regex`, `position`, `is_required`, `is_unique`, `is_filterable`, `is_comparable`, `is_configurable`, `is_user_defined`, `is_visible_on_front`, `value_per_locale`, `value_per_channel`, `default_value`, `enable_wysiwyg`, `created_at`, `updated_at`) VALUES
(1, 'sku', 'SKU', 'text', NULL, NULL, NULL, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(2, 'name', 'Name', 'text', NULL, NULL, NULL, 3, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(3, 'url_key', 'URL Key', 'text', NULL, NULL, NULL, 4, 1, 1, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(4, 'tax_category_id', 'Tax Category', 'select', NULL, NULL, NULL, 5, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(5, 'new', 'New', 'boolean', NULL, NULL, NULL, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(6, 'featured', 'Featured', 'boolean', NULL, NULL, NULL, 7, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(7, 'visible_individually', 'Visible Individually', 'boolean', NULL, NULL, NULL, 9, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(8, 'status', 'Status', 'boolean', NULL, NULL, NULL, 10, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(9, 'short_description', 'Short Description', 'textarea', NULL, NULL, NULL, 11, 1, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 1, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(10, 'description', 'Description', 'textarea', NULL, NULL, NULL, 12, 1, 0, 0, 1, 0, 0, 0, 1, 0, NULL, 1, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(11, 'price', 'Price', 'price', NULL, 'decimal', NULL, 13, 1, 0, 1, 1, 0, 0, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(12, 'cost', 'Cost', 'price', NULL, 'decimal', NULL, 14, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(13, 'special_price', 'Special Price', 'price', NULL, 'decimal', NULL, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(14, 'special_price_from', 'Special Price From', 'date', NULL, NULL, NULL, 16, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(15, 'special_price_to', 'Special Price To', 'date', NULL, NULL, NULL, 17, 0, 0, 0, 0, 0, 0, 0, 0, 1, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(16, 'meta_title', 'Meta Title', 'textarea', NULL, NULL, NULL, 18, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(17, 'meta_keywords', 'Meta Keywords', 'textarea', NULL, NULL, NULL, 20, 0, 0, 0, 0, 0, 0, 0, 1, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(18, 'meta_description', 'Meta Description', 'textarea', NULL, NULL, NULL, 21, 0, 0, 0, 0, 0, 1, 0, 1, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(19, 'length', 'Length', 'text', NULL, 'decimal', NULL, 22, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(20, 'width', 'Width', 'text', NULL, 'decimal', NULL, 23, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(21, 'height', 'Height', 'text', NULL, 'decimal', NULL, 24, 0, 0, 0, 0, 0, 1, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(22, 'weight', 'Weight', 'text', NULL, 'decimal', NULL, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(23, 'color', 'Color', 'select', NULL, NULL, NULL, 26, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(24, 'size', 'Size', 'select', NULL, NULL, NULL, 27, 0, 0, 1, 0, 1, 1, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(25, 'brand', 'Brand', 'select', NULL, NULL, NULL, 28, 0, 0, 1, 0, 0, 1, 1, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(26, 'guest_checkout', 'Guest Checkout', 'boolean', NULL, NULL, NULL, 8, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(27, 'product_number', 'Product Number', 'text', NULL, NULL, NULL, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0, NULL, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38'),
(28, 'manage_stock', 'Manage Stock', 'boolean', NULL, NULL, NULL, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, '2025-08-07 04:01:38', '2025-08-07 04:01:38');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_families`
--

CREATE TABLE `attribute_families` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_families`
--

INSERT INTO `attribute_families` (`id`, `code`, `name`, `status`, `is_user_defined`) VALUES
(1, 'default', 'Default', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_groups`
--

CREATE TABLE `attribute_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `column` int(11) NOT NULL DEFAULT 1,
  `position` int(11) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_groups`
--

INSERT INTO `attribute_groups` (`id`, `code`, `attribute_family_id`, `name`, `column`, `position`, `is_user_defined`) VALUES
(1, 'general', 1, 'General', 1, 1, 0),
(2, 'description', 1, 'Description', 1, 2, 0),
(3, 'meta_description', 1, 'Meta Description', 1, 3, 0),
(4, 'price', 1, 'Price', 2, 1, 0),
(5, 'shipping', 1, 'Shipping', 2, 2, 0),
(6, 'settings', 1, 'Settings', 2, 3, 0),
(7, 'inventories', 1, 'Inventories', 2, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_group_mappings`
--

CREATE TABLE `attribute_group_mappings` (
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `attribute_group_id` int(10) UNSIGNED NOT NULL,
  `position` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_group_mappings`
--

INSERT INTO `attribute_group_mappings` (`attribute_id`, `attribute_group_id`, `position`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 4),
(4, 1, 5),
(5, 6, 1),
(6, 6, 2),
(7, 6, 3),
(8, 6, 4),
(9, 2, 1),
(10, 2, 2),
(11, 4, 1),
(12, 4, 2),
(13, 4, 3),
(14, 4, 4),
(15, 4, 5),
(16, 3, 1),
(17, 3, 2),
(18, 3, 3),
(19, 5, 1),
(20, 5, 2),
(21, 5, 3),
(22, 5, 4),
(23, 1, 6),
(24, 1, 7),
(25, 1, 8),
(26, 6, 5),
(27, 1, 2),
(28, 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_options`
--

CREATE TABLE `attribute_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `admin_name` varchar(255) DEFAULT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `swatch_value` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_options`
--

INSERT INTO `attribute_options` (`id`, `attribute_id`, `admin_name`, `sort_order`, `swatch_value`) VALUES
(1, 23, 'Red', 1, NULL),
(2, 23, 'Green', 2, NULL),
(3, 23, 'Yellow', 3, NULL),
(4, 23, 'Black', 4, NULL),
(5, 23, 'White', 5, NULL),
(6, 24, 'S', 1, NULL),
(7, 24, 'M', 2, NULL),
(8, 24, 'L', 3, NULL),
(9, 24, 'XL', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `attribute_option_translations`
--

CREATE TABLE `attribute_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_option_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `label` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_option_translations`
--

INSERT INTO `attribute_option_translations` (`id`, `attribute_option_id`, `locale`, `label`) VALUES
(1, 1, 'en', 'Red'),
(2, 2, 'en', 'Green'),
(3, 3, 'en', 'Yellow'),
(4, 4, 'en', 'Black'),
(5, 5, 'en', 'White'),
(6, 6, 'en', 'S'),
(7, 7, 'en', 'M'),
(8, 8, 'en', 'L'),
(9, 9, 'en', 'XL');

-- --------------------------------------------------------

--
-- Table structure for table `attribute_translations`
--

CREATE TABLE `attribute_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `attribute_translations`
--

INSERT INTO `attribute_translations` (`id`, `attribute_id`, `locale`, `name`) VALUES
(1, 1, 'en', 'SKU'),
(2, 2, 'en', 'Name'),
(3, 3, 'en', 'URL Key'),
(4, 4, 'en', 'Tax Category'),
(5, 5, 'en', 'New'),
(6, 6, 'en', 'Featured'),
(7, 7, 'en', 'Visible Individually'),
(8, 8, 'en', 'Status'),
(9, 9, 'en', 'Short Description'),
(10, 10, 'en', 'Description'),
(11, 11, 'en', 'Price'),
(12, 12, 'en', 'Cost'),
(13, 13, 'en', 'Special Price'),
(14, 14, 'en', 'Special Price From'),
(15, 15, 'en', 'Special Price To'),
(16, 16, 'en', 'Meta Title'),
(17, 17, 'en', 'Meta Keywords'),
(18, 18, 'en', 'Meta Description'),
(19, 19, 'en', 'Length'),
(20, 20, 'en', 'Width'),
(21, 21, 'en', 'Height'),
(22, 22, 'en', 'Weight'),
(23, 23, 'en', 'Color'),
(24, 24, 'en', 'Size'),
(25, 25, 'en', 'Brand'),
(26, 26, 'en', 'Guest Checkout'),
(27, 27, 'en', 'Product Number'),
(28, 28, 'en', 'Manage Stock');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `qty` int(11) DEFAULT 0,
  `from` int(11) DEFAULT NULL,
  `to` int(11) DEFAULT NULL,
  `booking_product_event_ticket_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_products`
--

CREATE TABLE `booking_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `qty` int(11) DEFAULT 0,
  `location` varchar(255) DEFAULT NULL,
  `show_location` tinyint(1) NOT NULL DEFAULT 0,
  `available_every_week` tinyint(1) DEFAULT NULL,
  `available_from` datetime DEFAULT NULL,
  `available_to` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_appointment_slots`
--

CREATE TABLE `booking_product_appointment_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_product_id` int(10) UNSIGNED NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`slots`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_default_slots`
--

CREATE TABLE `booking_product_default_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_product_id` int(10) UNSIGNED NOT NULL,
  `booking_type` varchar(255) NOT NULL,
  `duration` int(11) DEFAULT NULL,
  `break_time` int(11) DEFAULT NULL,
  `slots` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`slots`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_event_tickets`
--

CREATE TABLE `booking_product_event_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_product_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(12,4) DEFAULT 0.0000,
  `qty` int(11) DEFAULT 0,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` datetime DEFAULT NULL,
  `special_price_to` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_event_ticket_translations`
--

CREATE TABLE `booking_product_event_ticket_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_product_event_ticket_id` bigint(20) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_rental_slots`
--

CREATE TABLE `booking_product_rental_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_product_id` int(10) UNSIGNED NOT NULL,
  `renting_type` varchar(255) NOT NULL,
  `daily_price` decimal(12,4) DEFAULT 0.0000,
  `hourly_price` decimal(12,4) DEFAULT 0.0000,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`slots`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_product_table_slots`
--

CREATE TABLE `booking_product_table_slots` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `booking_product_id` int(10) UNSIGNED NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `guest_limit` int(11) NOT NULL DEFAULT 0,
  `duration` int(11) NOT NULL,
  `break_time` int(11) NOT NULL,
  `prevent_scheduling_before` int(11) NOT NULL,
  `same_slot_all_days` tinyint(1) DEFAULT NULL,
  `slots` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`slots`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_first_name` varchar(255) DEFAULT NULL,
  `customer_last_name` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `items_count` int(11) DEFAULT NULL,
  `items_qty` decimal(12,4) DEFAULT NULL,
  `exchange_rate` decimal(12,4) DEFAULT NULL,
  `global_currency_code` varchar(255) DEFAULT NULL,
  `base_currency_code` varchar(255) DEFAULT NULL,
  `channel_currency_code` varchar(255) DEFAULT NULL,
  `cart_currency_code` varchar(255) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `tax_total` decimal(12,4) DEFAULT 0.0000,
  `base_tax_total` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `checkout_method` varchar(255) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `applied_cart_rule_ids` varchar(255) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `coupon_code`, `is_gift`, `items_count`, `items_qty`, `exchange_rate`, `global_currency_code`, `base_currency_code`, `channel_currency_code`, `cart_currency_code`, `grand_total`, `base_grand_total`, `sub_total`, `base_sub_total`, `tax_total`, `base_tax_total`, `discount_amount`, `base_discount_amount`, `shipping_amount`, `base_shipping_amount`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `checkout_method`, `is_guest`, `is_active`, `applied_cart_rule_ids`, `customer_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'zafarhusain.husain02@gmail.com', 'zafar', 'Husain', 'flatrate_flatrate', NULL, 0, 2, 9.0000, NULL, 'USD', 'USD', 'USD', 'USD', 218.0000, 218.0000, 128.0000, 128.0000, 0.0000, 0.0000, 0.0000, 0.0000, 90.0000, 90.0000, 90.0000, 90.0000, 128.0000, 128.0000, NULL, 0, 0, NULL, 1, 1, '2025-08-07 04:06:25', '2025-08-07 11:10:07'),
(3, 'mcazafar@gmail.com', 'Zafar', 'Husain', 'flatrate_flatrate', NULL, 0, 1, 2.0000, NULL, 'USD', 'USD', 'USD', 'USD', 54.0000, 54.0000, 34.0000, 34.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, 20.0000, 20.0000, 34.0000, 34.0000, NULL, 1, 1, NULL, NULL, 1, '2025-08-07 10:58:17', '2025-08-07 11:02:54'),
(4, 'zafarhusain.husain02@gmail.com', 'zafar', 'Husain', 'flatrate_flatrate', NULL, 0, 1, 1.0000, NULL, 'USD', 'USD', 'USD', 'USD', 152.0000, 152.0000, 152.0000, 152.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 152.0000, 152.0000, NULL, 0, 0, NULL, 1, 1, '2025-08-08 14:43:11', '2025-08-08 14:46:42');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sku` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_weight` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `custom_price` decimal(12,4) DEFAULT NULL,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(255) DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `cart_id` int(10) UNSIGNED NOT NULL,
  `tax_category_id` int(10) UNSIGNED DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `quantity`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `base_total_weight`, `price`, `base_price`, `custom_price`, `total`, `base_total`, `tax_percent`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `applied_tax_rate`, `parent_id`, `product_id`, `cart_id`, `tax_category_id`, `applied_cart_rule_ids`, `additional`, `created_at`, `updated_at`) VALUES
(1, 5, 'SP-001', 'simple', 'Arctic Cozy Knit Unisex Beanie', NULL, 1.2300, 6.1500, 6.1500, 12.0000, 12.0000, NULL, 60.0000, 60.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12.0000, 12.0000, 60.0000, 60.0000, NULL, NULL, 1, 1, NULL, NULL, '{\"cart_id\":1,\"quantity\":5,\"product_id\":1}', '2025-08-07 04:06:25', '2025-08-07 07:38:51'),
(3, 4, 'SP-003', 'simple', 'Arctic Touchscreen Winter Gloves', NULL, 1.0000, 4.0000, 4.0000, 17.0000, 17.0000, NULL, 68.0000, 68.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 17.0000, 17.0000, 68.0000, 68.0000, NULL, NULL, 3, 1, NULL, NULL, '{\"cart_id\":1,\"product_id\":3,\"quantity\":4}', '2025-08-07 07:28:51', '2025-08-07 11:05:24'),
(4, 2, 'SP-003', 'simple', 'Arctic Touchscreen Winter Gloves', NULL, 1.0000, 2.0000, 2.0000, 17.0000, 17.0000, NULL, 34.0000, 34.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 17.0000, 17.0000, 34.0000, 34.0000, NULL, NULL, 3, 3, NULL, NULL, '{\"cart_id\":3,\"product_id\":3,\"quantity\":2}', '2025-08-07 10:58:18', '2025-08-07 10:58:20'),
(5, 1, 'M002', 'virtual', 'Men Regular Fit Solid Spread Collar Casual Shirt', NULL, 0.0000, 0.0000, 0.0000, 152.0000, 152.0000, NULL, 152.0000, 152.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 152.0000, 152.0000, 152.0000, 152.0000, NULL, NULL, 17, 4, NULL, NULL, '{\"cart_id\":4,\"product_id\":17,\"quantity\":1}', '2025-08-08 14:43:12', '2025-08-08 14:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `cart_item_inventories`
--

CREATE TABLE `cart_item_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) UNSIGNED DEFAULT NULL,
  `cart_item_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_payment`
--

CREATE TABLE `cart_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `method` varchar(255) NOT NULL,
  `method_title` varchar(255) DEFAULT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_payment`
--

INSERT INTO `cart_payment` (`id`, `method`, `method_title`, `cart_id`, `created_at`, `updated_at`) VALUES
(1, 'cashondelivery', 'Cash On Delivery', 1, '2025-08-07 11:09:25', '2025-08-07 11:09:25'),
(2, 'cashondelivery', 'Cash On Delivery', 4, '2025-08-08 14:46:08', '2025-08-08 14:46:08');

-- --------------------------------------------------------

--
-- Table structure for table `cart_rules`
--

CREATE TABLE `cart_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `coupon_type` int(11) NOT NULL DEFAULT 1,
  `use_auto_generation` tinyint(1) NOT NULL DEFAULT 0,
  `usage_per_customer` int(11) NOT NULL DEFAULT 0,
  `uses_per_coupon` int(11) NOT NULL DEFAULT 0,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `uses_attribute_conditions` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_quantity` int(11) NOT NULL DEFAULT 1,
  `discount_step` varchar(255) NOT NULL DEFAULT '1',
  `apply_to_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `free_shipping` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_channels`
--

CREATE TABLE `cart_rule_channels` (
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupons`
--

CREATE TABLE `cart_rule_coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `usage_limit` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `usage_per_customer` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `times_used` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `expired_at` date DEFAULT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_coupon_usage`
--

CREATE TABLE `cart_rule_coupon_usage` (
  `id` int(10) UNSIGNED NOT NULL,
  `times_used` int(11) NOT NULL DEFAULT 0,
  `cart_rule_coupon_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customers`
--

CREATE TABLE `cart_rule_customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `times_used` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_customer_groups`
--

CREATE TABLE `cart_rule_customer_groups` (
  `cart_rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_rule_translations`
--

CREATE TABLE `cart_rule_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `label` text DEFAULT NULL,
  `cart_rule_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_shipping_rates`
--

CREATE TABLE `cart_shipping_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `carrier` varchar(255) NOT NULL,
  `carrier_title` varchar(255) NOT NULL,
  `method` varchar(255) NOT NULL,
  `method_title` varchar(255) NOT NULL,
  `method_description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT 0,
  `base_price` double DEFAULT 0,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_percent` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `applied_tax_rate` varchar(255) DEFAULT NULL,
  `is_calculate_tax` tinyint(1) NOT NULL DEFAULT 1,
  `cart_address_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cart_shipping_rates`
--

INSERT INTO `cart_shipping_rates` (`id`, `carrier`, `carrier_title`, `method`, `method_title`, `method_description`, `price`, `base_price`, `discount_amount`, `base_discount_amount`, `tax_percent`, `tax_amount`, `base_tax_amount`, `price_incl_tax`, `base_price_incl_tax`, `applied_tax_rate`, `is_calculate_tax`, `cart_address_id`, `created_at`, `updated_at`, `cart_id`) VALUES
(11, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 20, 20, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 20.0000, 20.0000, NULL, 1, 4, '2025-08-07 11:01:43', '2025-08-07 11:01:43', 3),
(12, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 4, '2025-08-07 11:01:43', '2025-08-07 11:01:43', 3),
(19, 'flatrate', 'Flat Rate', 'flatrate_flatrate', 'Flat Rate', 'Flat Rate Shipping', 90, 90, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 90.0000, 90.0000, NULL, 1, 2, '2025-08-07 11:07:34', '2025-08-07 11:07:34', 1),
(20, 'free', 'Free Shipping', 'free_free', 'Free Shipping', 'Free Shipping', 0, 0, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, NULL, 1, 2, '2025-08-07 11:07:34', '2025-08-07 11:07:34', 1);

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rules`
--

CREATE TABLE `catalog_rules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `starts_from` date DEFAULT NULL,
  `ends_till` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `condition_type` tinyint(1) NOT NULL DEFAULT 1,
  `conditions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`conditions`)),
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_channels`
--

CREATE TABLE `catalog_rule_channels` (
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_customer_groups`
--

CREATE TABLE `catalog_rule_customer_groups` (
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_products`
--

CREATE TABLE `catalog_rule_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `end_other_rules` tinyint(1) NOT NULL DEFAULT 0,
  `action_type` varchar(255) DEFAULT NULL,
  `discount_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sort_order` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `catalog_rule_product_prices`
--

CREATE TABLE `catalog_rule_product_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `rule_date` date NOT NULL,
  `starts_from` datetime DEFAULT NULL,
  `ends_till` datetime DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED NOT NULL,
  `catalog_rule_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `logo_path` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `display_mode` varchar(255) DEFAULT 'products_and_description',
  `_lft` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `_rgt` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `banner_path` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `position`, `logo_path`, `status`, `display_mode`, `_lft`, `_rgt`, `parent_id`, `additional`, `banner_path`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'products_and_description', 1, 18, NULL, NULL, NULL, '2025-08-07 04:01:40', '2025-08-07 04:01:40'),
(2, 1, NULL, 1, 'products_and_description', 2, 9, 1, NULL, NULL, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(3, 1, NULL, 1, 'products_and_description', 3, 4, 2, NULL, NULL, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(4, 2, NULL, 1, 'products_and_description', 10, 17, 1, NULL, NULL, '2025-08-07 11:34:26', '2025-08-07 11:35:50'),
(5, 2, NULL, 1, 'products_and_description', 5, 6, 2, NULL, NULL, '2025-08-07 11:38:02', '2025-08-07 11:38:02'),
(6, 3, NULL, 1, 'products_and_description', 7, 8, 2, NULL, NULL, '2025-08-07 11:39:05', '2025-08-07 11:39:22'),
(7, 1, NULL, 1, 'products_and_description', 11, 12, 4, NULL, NULL, '2025-08-07 11:40:12', '2025-08-07 11:40:13'),
(8, 2, NULL, 1, 'products_and_description', 15, 16, 4, NULL, NULL, '2025-08-07 11:40:49', '2025-08-07 11:42:10'),
(9, 3, NULL, 1, 'products_and_description', 13, 14, 4, NULL, NULL, '2025-08-07 11:41:29', '2025-08-07 11:41:29');

-- --------------------------------------------------------

--
-- Table structure for table `category_filterable_attributes`
--

CREATE TABLE `category_filterable_attributes` (
  `category_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_filterable_attributes`
--

INSERT INTO `category_filterable_attributes` (`category_id`, `attribute_id`) VALUES
(2, 11),
(2, 23),
(2, 24),
(2, 25),
(3, 11),
(3, 23),
(3, 24),
(3, 25),
(4, 11),
(4, 23),
(4, 24),
(4, 25),
(5, 11),
(5, 23),
(6, 11),
(6, 23),
(7, 11),
(7, 24),
(7, 25),
(8, 11),
(8, 23),
(9, 11),
(9, 23);

-- --------------------------------------------------------

--
-- Table structure for table `category_translations`
--

CREATE TABLE `category_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `slug` varchar(255) NOT NULL,
  `url_path` varchar(2048) NOT NULL,
  `description` text DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale_id` int(10) UNSIGNED DEFAULT NULL,
  `locale` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_translations`
--

INSERT INTO `category_translations` (`id`, `category_id`, `name`, `slug`, `url_path`, `description`, `meta_title`, `meta_description`, `meta_keywords`, `locale_id`, `locale`) VALUES
(1, 1, 'Root', 'root', '', 'Root Category Description', '', '', '', NULL, 'en'),
(2, 2, 'Men', 'men', '', 'Men Category Description', 'Men Category Meta Title', 'Men Category Meta Description', 'Men Category Meta Keywords', NULL, 'en'),
(3, 3, 'Shirts', 'shirts', '', '<p>Shirts Category Description</p>', 'Shirts Category Meta Title', 'Shirts Category Meta Description', 'Shirts Category Meta Keywords', NULL, 'en'),
(4, 4, 'Women', 'women', '', '<p>Women Products</p>', '', '', '', 1, 'en'),
(5, 5, 'TShirts', 'tshirts', '', '<p>TShirts Category</p>', 'TShirts', 'TShirts', 'TShirts', 1, 'en'),
(6, 6, 'Pants', 'pants', '', '<p>Pants Category</p>', 'Pants', 'Pants', 'Pants', 1, 'en'),
(7, 7, 'Women Dresses', 'women-dresses', '', '<p>Women Dresses</p>', 'Women Dresses', 'Women Dresses', 'Women Dresses', 1, 'en'),
(8, 8, 'Co-ords', 'co-ords', '', '<p>Co-ords</p>', 'Co-ords', 'Co-ords', 'Co-ords', 1, 'en'),
(9, 9, 'Tops', 'tops', '', '<p>Tops</p>', 'Tops', 'Tops', 'Tops', 1, 'en');

-- --------------------------------------------------------

--
-- Table structure for table `channels`
--

CREATE TABLE `channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `timezone` varchar(255) DEFAULT NULL,
  `theme` varchar(255) DEFAULT NULL,
  `hostname` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `favicon` varchar(255) DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `is_maintenance_on` tinyint(1) NOT NULL DEFAULT 0,
  `allowed_ips` text DEFAULT NULL,
  `root_category_id` int(10) UNSIGNED DEFAULT NULL,
  `default_locale_id` int(10) UNSIGNED NOT NULL,
  `base_currency_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channels`
--

INSERT INTO `channels` (`id`, `code`, `timezone`, `theme`, `hostname`, `logo`, `favicon`, `home_seo`, `is_maintenance_on`, `allowed_ips`, `root_category_id`, `default_locale_id`, `base_currency_id`, `created_at`, `updated_at`) VALUES
(1, 'default', NULL, 'default', 'http://localhost', NULL, NULL, NULL, 0, NULL, 1, 1, 1, '2025-08-07 04:01:47', '2025-08-07 04:01:47');

-- --------------------------------------------------------

--
-- Table structure for table `channel_currencies`
--

CREATE TABLE `channel_currencies` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_currencies`
--

INSERT INTO `channel_currencies` (`channel_id`, `currency_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_inventory_sources`
--

CREATE TABLE `channel_inventory_sources` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `inventory_source_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_inventory_sources`
--

INSERT INTO `channel_inventory_sources` (`channel_id`, `inventory_source_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_locales`
--

CREATE TABLE `channel_locales` (
  `channel_id` int(10) UNSIGNED NOT NULL,
  `locale_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_locales`
--

INSERT INTO `channel_locales` (`channel_id`, `locale_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `channel_translations`
--

CREATE TABLE `channel_translations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `maintenance_mode_text` text DEFAULT NULL,
  `home_seo` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`home_seo`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `channel_translations`
--

INSERT INTO `channel_translations` (`id`, `channel_id`, `locale`, `name`, `description`, `maintenance_mode_text`, `home_seo`, `created_at`, `updated_at`) VALUES
(1, 1, 'en', 'Default', NULL, NULL, '{\"meta_title\":\"Demo store\",\"meta_description\":\"Demo store meta description\",\"meta_keywords\":\"Demo store meta keyword\"}', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cms_pages`
--

CREATE TABLE `cms_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `layout` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_pages`
--

INSERT INTO `cms_pages` (`id`, `layout`, `created_at`, `updated_at`) VALUES
(1, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(2, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(3, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(4, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(5, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(6, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(7, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(8, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(9, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52'),
(10, NULL, '2025-08-07 04:01:52', '2025-08-07 04:01:52');

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_channels`
--

CREATE TABLE `cms_page_channels` (
  `cms_page_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_page_channels`
--

INSERT INTO `cms_page_channels` (`cms_page_id`, `channel_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cms_page_translations`
--

CREATE TABLE `cms_page_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_title` varchar(255) NOT NULL,
  `url_key` varchar(255) NOT NULL,
  `html_content` longtext DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  `cms_page_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cms_page_translations`
--

INSERT INTO `cms_page_translations` (`id`, `page_title`, `url_key`, `html_content`, `meta_title`, `meta_description`, `meta_keywords`, `locale`, `cms_page_id`) VALUES
(1, 'About Us', 'about-us', '<div class=\"static-container\"><div class=\"mb-5\">About Us Page Content</div></div>', 'about us', '', 'aboutus', 'en', 1),
(2, 'Return Policy', 'return-policy', '<div class=\"static-container\"><div class=\"mb-5\">Return Policy Page Content</div></div>', 'return policy', '', 'return, policy', 'en', 2),
(3, 'Refund Policy', 'refund-policy', '<div class=\"static-container\"><div class=\"mb-5\">Refund Policy Page Content</div></div>', 'Refund policy', '', 'refund, policy', 'en', 3),
(4, 'Terms & Conditions', 'terms-conditions', '<div class=\"static-container\"><div class=\"mb-5\">Terms & Conditions Page Content</div></div>', 'Terms & Conditions', '', 'term, conditions', 'en', 4),
(5, 'Terms of Use', 'terms-of-use', '<div class=\"static-container\"><div class=\"mb-5\">Terms of Use Page Content</div></div>', 'Terms of use', '', 'term, use', 'en', 5),
(6, 'Customer Service', 'customer-service', '<div class=\"static-container\"><div class=\"mb-5\">Customer Service Page Content</div></div>', 'Customer Service', '', 'customer, service', 'en', 6),
(7, 'What\'s New', 'whats-new', '<div class=\"static-container\"><div class=\"mb-5\">What\'s New page content</div></div>', 'What\'s New', '', 'new', 'en', 7),
(8, 'Payment Policy', 'payment-policy', '<div class=\"static-container\"><div class=\"mb-5\">Payment Policy Page Content</div></div>', 'Payment Policy', '', 'payment, policy', 'en', 8),
(9, 'Shipping Policy', 'shipping-policy', '<div class=\"static-container\"><div class=\"mb-5\">Shipping Policy Page Content</div></div>', 'Shipping Policy', '', 'shipping, policy', 'en', 9),
(10, 'Privacy Policy', 'privacy-policy', '<div class=\"static-container\"><div class=\"mb-5\">Privacy Policy Page Content</div></div>', 'Privacy Policy', '', 'privacy, policy', 'en', 10);

-- --------------------------------------------------------

--
-- Table structure for table `compare_items`
--

CREATE TABLE `compare_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `core_config`
--

CREATE TABLE `core_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `channel_code` varchar(255) DEFAULT NULL,
  `locale_code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `core_config`
--

INSERT INTO `core_config` (`id`, `code`, `value`, `channel_code`, `locale_code`, `created_at`, `updated_at`) VALUES
(1, 'sales.checkout.shopping_cart.allow_guest_checkout', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(2, 'emails.general.notifications.emails.general.notifications.verification', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(3, 'emails.general.notifications.emails.general.notifications.registration', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(4, 'emails.general.notifications.emails.general.notifications.customer_registration_confirmation_mail_to_admin', '0', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(5, 'emails.general.notifications.emails.general.notifications.customer_account_credentials', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(6, 'emails.general.notifications.emails.general.notifications.new_order', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(7, 'emails.general.notifications.emails.general.notifications.new_order_mail_to_admin', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(8, 'emails.general.notifications.emails.general.notifications.new_invoice', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(9, 'emails.general.notifications.emails.general.notifications.new_invoice_mail_to_admin', '0', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(10, 'emails.general.notifications.emails.general.notifications.new_refund', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(11, 'emails.general.notifications.emails.general.notifications.new_refund_mail_to_admin', '0', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(12, 'emails.general.notifications.emails.general.notifications.new_shipment', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(13, 'emails.general.notifications.emails.general.notifications.new_shipment_mail_to_admin', '0', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(14, 'emails.general.notifications.emails.general.notifications.new_inventory_source', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(15, 'emails.general.notifications.emails.general.notifications.cancel_order', '1', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(16, 'emails.general.notifications.emails.general.notifications.cancel_order_mail_to_admin', '0', NULL, NULL, '2025-08-07 04:01:49', '2025-08-07 04:01:49'),
(17, 'customer.settings.social_login.enable_facebook', '1', 'default', NULL, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(18, 'customer.settings.social_login.enable_twitter', '1', 'default', NULL, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(19, 'customer.settings.social_login.enable_google', '1', 'default', NULL, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(20, 'customer.settings.social_login.enable_linkedin', '1', 'default', NULL, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(21, 'customer.settings.social_login.enable_github', '1', 'default', NULL, '2025-08-07 04:01:53', '2025-08-07 04:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `code`, `name`) VALUES
(1, 'AF', 'Afghanistan'),
(2, 'AX', 'Åland Islands'),
(3, 'AL', 'Albania'),
(4, 'DZ', 'Algeria'),
(5, 'AS', 'American Samoa'),
(6, 'AD', 'Andorra'),
(7, 'AO', 'Angola'),
(8, 'AI', 'Anguilla'),
(9, 'AQ', 'Antarctica'),
(10, 'AG', 'Antigua & Barbuda'),
(11, 'AR', 'Argentina'),
(12, 'AM', 'Armenia'),
(13, 'AW', 'Aruba'),
(14, 'AC', 'Ascension Island'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia & Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BR', 'Brazil'),
(32, 'IO', 'British Indian Ocean Territory'),
(33, 'VG', 'British Virgin Islands'),
(34, 'BN', 'Brunei'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CA', 'Canada'),
(41, 'IC', 'Canary Islands'),
(42, 'CV', 'Cape Verde'),
(43, 'BQ', 'Caribbean Netherlands'),
(44, 'KY', 'Cayman Islands'),
(45, 'CF', 'Central African Republic'),
(46, 'EA', 'Ceuta & Melilla'),
(47, 'TD', 'Chad'),
(48, 'CL', 'Chile'),
(49, 'CN', 'China'),
(50, 'CX', 'Christmas Island'),
(51, 'CC', 'Cocos (Keeling) Islands'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoros'),
(54, 'CG', 'Congo - Brazzaville'),
(55, 'CD', 'Congo - Kinshasa'),
(56, 'CK', 'Cook Islands'),
(57, 'CR', 'Costa Rica'),
(58, 'CI', 'Côte d’Ivoire'),
(59, 'HR', 'Croatia'),
(60, 'CU', 'Cuba'),
(61, 'CW', 'Curaçao'),
(62, 'CY', 'Cyprus'),
(63, 'CZ', 'Czechia'),
(64, 'DK', 'Denmark'),
(65, 'DG', 'Diego Garcia'),
(66, 'DJ', 'Djibouti'),
(67, 'DM', 'Dominica'),
(68, 'DO', 'Dominican Republic'),
(69, 'EC', 'Ecuador'),
(70, 'EG', 'Egypt'),
(71, 'SV', 'El Salvador'),
(72, 'GQ', 'Equatorial Guinea'),
(73, 'ER', 'Eritrea'),
(74, 'EE', 'Estonia'),
(75, 'ET', 'Ethiopia'),
(76, 'EZ', 'Eurozone'),
(77, 'FK', 'Falkland Islands'),
(78, 'FO', 'Faroe Islands'),
(79, 'FJ', 'Fiji'),
(80, 'FI', 'Finland'),
(81, 'FR', 'France'),
(82, 'GF', 'French Guiana'),
(83, 'PF', 'French Polynesia'),
(84, 'TF', 'French Southern Territories'),
(85, 'GA', 'Gabon'),
(86, 'GM', 'Gambia'),
(87, 'GE', 'Georgia'),
(88, 'DE', 'Germany'),
(89, 'GH', 'Ghana'),
(90, 'GI', 'Gibraltar'),
(91, 'GR', 'Greece'),
(92, 'GL', 'Greenland'),
(93, 'GD', 'Grenada'),
(94, 'GP', 'Guadeloupe'),
(95, 'GU', 'Guam'),
(96, 'GT', 'Guatemala'),
(97, 'GG', 'Guernsey'),
(98, 'GN', 'Guinea'),
(99, 'GW', 'Guinea-Bissau'),
(100, 'GY', 'Guyana'),
(101, 'HT', 'Haiti'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong SAR China'),
(104, 'HU', 'Hungary'),
(105, 'IS', 'Iceland'),
(106, 'IN', 'India'),
(107, 'ID', 'Indonesia'),
(108, 'IR', 'Iran'),
(109, 'IQ', 'Iraq'),
(110, 'IE', 'Ireland'),
(111, 'IM', 'Isle of Man'),
(112, 'IL', 'Israel'),
(113, 'IT', 'Italy'),
(114, 'JM', 'Jamaica'),
(115, 'JP', 'Japan'),
(116, 'JE', 'Jersey'),
(117, 'JO', 'Jordan'),
(118, 'KZ', 'Kazakhstan'),
(119, 'KE', 'Kenya'),
(120, 'KI', 'Kiribati'),
(121, 'XK', 'Kosovo'),
(122, 'KW', 'Kuwait'),
(123, 'KG', 'Kyrgyzstan'),
(124, 'LA', 'Laos'),
(125, 'LV', 'Latvia'),
(126, 'LB', 'Lebanon'),
(127, 'LS', 'Lesotho'),
(128, 'LR', 'Liberia'),
(129, 'LY', 'Libya'),
(130, 'LI', 'Liechtenstein'),
(131, 'LT', 'Lithuania'),
(132, 'LU', 'Luxembourg'),
(133, 'MO', 'Macau SAR China'),
(134, 'MK', 'Macedonia'),
(135, 'MG', 'Madagascar'),
(136, 'MW', 'Malawi'),
(137, 'MY', 'Malaysia'),
(138, 'MV', 'Maldives'),
(139, 'ML', 'Mali'),
(140, 'MT', 'Malta'),
(141, 'MH', 'Marshall Islands'),
(142, 'MQ', 'Martinique'),
(143, 'MR', 'Mauritania'),
(144, 'MU', 'Mauritius'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'Mexico'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldova'),
(149, 'MC', 'Monaco'),
(150, 'MN', 'Mongolia'),
(151, 'ME', 'Montenegro'),
(152, 'MS', 'Montserrat'),
(153, 'MA', 'Morocco'),
(154, 'MZ', 'Mozambique'),
(155, 'MM', 'Myanmar (Burma)'),
(156, 'NA', 'Namibia'),
(157, 'NR', 'Nauru'),
(158, 'NP', 'Nepal'),
(159, 'NL', 'Netherlands'),
(160, 'NC', 'New Caledonia'),
(161, 'NZ', 'New Zealand'),
(162, 'NI', 'Nicaragua'),
(163, 'NE', 'Niger'),
(164, 'NG', 'Nigeria'),
(165, 'NU', 'Niue'),
(166, 'NF', 'Norfolk Island'),
(167, 'KP', 'North Korea'),
(168, 'MP', 'Northern Mariana Islands'),
(169, 'NO', 'Norway'),
(170, 'OM', 'Oman'),
(171, 'PK', 'Pakistan'),
(172, 'PW', 'Palau'),
(173, 'PS', 'Palestinian Territories'),
(174, 'PA', 'Panama'),
(175, 'PG', 'Papua New Guinea'),
(176, 'PY', 'Paraguay'),
(177, 'PE', 'Peru'),
(178, 'PH', 'Philippines'),
(179, 'PN', 'Pitcairn Islands'),
(180, 'PL', 'Poland'),
(181, 'PT', 'Portugal'),
(182, 'PR', 'Puerto Rico'),
(183, 'QA', 'Qatar'),
(184, 'RE', 'Réunion'),
(185, 'RO', 'Romania'),
(186, 'RU', 'Russia'),
(187, 'RW', 'Rwanda'),
(188, 'WS', 'Samoa'),
(189, 'SM', 'San Marino'),
(190, 'ST', 'São Tomé & Príncipe'),
(191, 'SA', 'Saudi Arabia'),
(192, 'SN', 'Senegal'),
(193, 'RS', 'Serbia'),
(194, 'SC', 'Seychelles'),
(195, 'SL', 'Sierra Leone'),
(196, 'SG', 'Singapore'),
(197, 'SX', 'Sint Maarten'),
(198, 'SK', 'Slovakia'),
(199, 'SI', 'Slovenia'),
(200, 'SB', 'Solomon Islands'),
(201, 'SO', 'Somalia'),
(202, 'ZA', 'South Africa'),
(203, 'GS', 'South Georgia & South Sandwich Islands'),
(204, 'KR', 'South Korea'),
(205, 'SS', 'South Sudan'),
(206, 'ES', 'Spain'),
(207, 'LK', 'Sri Lanka'),
(208, 'BL', 'St. Barthélemy'),
(209, 'SH', 'St. Helena'),
(210, 'KN', 'St. Kitts & Nevis'),
(211, 'LC', 'St. Lucia'),
(212, 'MF', 'St. Martin'),
(213, 'PM', 'St. Pierre & Miquelon'),
(214, 'VC', 'St. Vincent & Grenadines'),
(215, 'SD', 'Sudan'),
(216, 'SR', 'Suriname'),
(217, 'SJ', 'Svalbard & Jan Mayen'),
(218, 'SZ', 'Swaziland'),
(219, 'SE', 'Sweden'),
(220, 'CH', 'Switzerland'),
(221, 'SY', 'Syria'),
(222, 'TW', 'Taiwan'),
(223, 'TJ', 'Tajikistan'),
(224, 'TZ', 'Tanzania'),
(225, 'TH', 'Thailand'),
(226, 'TL', 'Timor-Leste'),
(227, 'TG', 'Togo'),
(228, 'TK', 'Tokelau'),
(229, 'TO', 'Tonga'),
(230, 'TT', 'Trinidad & Tobago'),
(231, 'TA', 'Tristan da Cunha'),
(232, 'TN', 'Tunisia'),
(233, 'TR', 'Turkey'),
(234, 'TM', 'Turkmenistan'),
(235, 'TC', 'Turks & Caicos Islands'),
(236, 'TV', 'Tuvalu'),
(237, 'UM', 'U.S. Outlying Islands'),
(238, 'VI', 'U.S. Virgin Islands'),
(239, 'UG', 'Uganda'),
(240, 'UA', 'Ukraine'),
(241, 'AE', 'United Arab Emirates'),
(242, 'GB', 'United Kingdom'),
(244, 'US', 'United States'),
(245, 'UY', 'Uruguay'),
(246, 'UZ', 'Uzbekistan'),
(247, 'VU', 'Vanuatu'),
(248, 'VA', 'Vatican City'),
(249, 'VE', 'Venezuela'),
(250, 'VN', 'Vietnam'),
(251, 'WF', 'Wallis & Futuna'),
(252, 'EH', 'Western Sahara'),
(253, 'YE', 'Yemen'),
(254, 'ZM', 'Zambia'),
(255, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `country_states`
--

CREATE TABLE `country_states` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `default_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_states`
--

INSERT INTO `country_states` (`id`, `country_id`, `country_code`, `code`, `default_name`) VALUES
(1, 244, 'US', 'AL', 'Alabama'),
(2, 244, 'US', 'AK', 'Alaska'),
(3, 244, 'US', 'AS', 'American Samoa'),
(4, 244, 'US', 'AZ', 'Arizona'),
(5, 244, 'US', 'AR', 'Arkansas'),
(6, 244, 'US', 'AE', 'Armed Forces Africa'),
(7, 244, 'US', 'AA', 'Armed Forces Americas'),
(8, 244, 'US', 'AE', 'Armed Forces Canada'),
(9, 244, 'US', 'AE', 'Armed Forces Europe'),
(10, 244, 'US', 'AE', 'Armed Forces Middle East'),
(11, 244, 'US', 'AP', 'Armed Forces Pacific'),
(12, 244, 'US', 'CA', 'California'),
(13, 244, 'US', 'CO', 'Colorado'),
(14, 244, 'US', 'CT', 'Connecticut'),
(15, 244, 'US', 'DE', 'Delaware'),
(16, 244, 'US', 'DC', 'District of Columbia'),
(17, 244, 'US', 'FM', 'Federated States Of Micronesia'),
(18, 244, 'US', 'FL', 'Florida'),
(19, 244, 'US', 'GA', 'Georgia'),
(20, 244, 'US', 'GU', 'Guam'),
(21, 244, 'US', 'HI', 'Hawaii'),
(22, 244, 'US', 'ID', 'Idaho'),
(23, 244, 'US', 'IL', 'Illinois'),
(24, 244, 'US', 'IN', 'Indiana'),
(25, 244, 'US', 'IA', 'Iowa'),
(26, 244, 'US', 'KS', 'Kansas'),
(27, 244, 'US', 'KY', 'Kentucky'),
(28, 244, 'US', 'LA', 'Louisiana'),
(29, 244, 'US', 'ME', 'Maine'),
(30, 244, 'US', 'MH', 'Marshall Islands'),
(31, 244, 'US', 'MD', 'Maryland'),
(32, 244, 'US', 'MA', 'Massachusetts'),
(33, 244, 'US', 'MI', 'Michigan'),
(34, 244, 'US', 'MN', 'Minnesota'),
(35, 244, 'US', 'MS', 'Mississippi'),
(36, 244, 'US', 'MO', 'Missouri'),
(37, 244, 'US', 'MT', 'Montana'),
(38, 244, 'US', 'NE', 'Nebraska'),
(39, 244, 'US', 'NV', 'Nevada'),
(40, 244, 'US', 'NH', 'New Hampshire'),
(41, 244, 'US', 'NJ', 'New Jersey'),
(42, 244, 'US', 'NM', 'New Mexico'),
(43, 244, 'US', 'NY', 'New York'),
(44, 244, 'US', 'NC', 'North Carolina'),
(45, 244, 'US', 'ND', 'North Dakota'),
(46, 244, 'US', 'MP', 'Northern Mariana Islands'),
(47, 244, 'US', 'OH', 'Ohio'),
(48, 244, 'US', 'OK', 'Oklahoma'),
(49, 244, 'US', 'OR', 'Oregon'),
(50, 244, 'US', 'PW', 'Palau'),
(51, 244, 'US', 'PA', 'Pennsylvania'),
(52, 244, 'US', 'PR', 'Puerto Rico'),
(53, 244, 'US', 'RI', 'Rhode Island'),
(54, 244, 'US', 'SC', 'South Carolina'),
(55, 244, 'US', 'SD', 'South Dakota'),
(56, 244, 'US', 'TN', 'Tennessee'),
(57, 244, 'US', 'TX', 'Texas'),
(58, 244, 'US', 'UT', 'Utah'),
(59, 244, 'US', 'VT', 'Vermont'),
(60, 244, 'US', 'VI', 'Virgin Islands'),
(61, 244, 'US', 'VA', 'Virginia'),
(62, 244, 'US', 'WA', 'Washington'),
(63, 244, 'US', 'WV', 'West Virginia'),
(64, 244, 'US', 'WI', 'Wisconsin'),
(65, 244, 'US', 'WY', 'Wyoming'),
(66, 40, 'CA', 'AB', 'Alberta'),
(67, 40, 'CA', 'BC', 'British Columbia'),
(68, 40, 'CA', 'MB', 'Manitoba'),
(69, 40, 'CA', 'NL', 'Newfoundland and Labrador'),
(70, 40, 'CA', 'NB', 'New Brunswick'),
(71, 40, 'CA', 'NS', 'Nova Scotia'),
(72, 40, 'CA', 'NT', 'Northwest Territories'),
(73, 40, 'CA', 'NU', 'Nunavut'),
(74, 40, 'CA', 'ON', 'Ontario'),
(75, 40, 'CA', 'PE', 'Prince Edward Island'),
(76, 40, 'CA', 'QC', 'Quebec'),
(77, 40, 'CA', 'SK', 'Saskatchewan'),
(78, 40, 'CA', 'YT', 'Yukon Territory'),
(79, 88, 'DE', 'NDS', 'Niedersachsen'),
(80, 88, 'DE', 'BAW', 'Baden-Württemberg'),
(81, 88, 'DE', 'BAY', 'Bayern'),
(82, 88, 'DE', 'BER', 'Berlin'),
(83, 88, 'DE', 'BRG', 'Brandenburg'),
(84, 88, 'DE', 'BRE', 'Bremen'),
(85, 88, 'DE', 'HAM', 'Hamburg'),
(86, 88, 'DE', 'HES', 'Hessen'),
(87, 88, 'DE', 'MEC', 'Mecklenburg-Vorpommern'),
(88, 88, 'DE', 'NRW', 'Nordrhein-Westfalen'),
(89, 88, 'DE', 'RHE', 'Rheinland-Pfalz'),
(90, 88, 'DE', 'SAR', 'Saarland'),
(91, 88, 'DE', 'SAS', 'Sachsen'),
(92, 88, 'DE', 'SAC', 'Sachsen-Anhalt'),
(93, 88, 'DE', 'SCN', 'Schleswig-Holstein'),
(94, 88, 'DE', 'THE', 'Thüringen'),
(95, 16, 'AT', 'WI', 'Wien'),
(96, 16, 'AT', 'NO', 'Niederösterreich'),
(97, 16, 'AT', 'OO', 'Oberösterreich'),
(98, 16, 'AT', 'SB', 'Salzburg'),
(99, 16, 'AT', 'KN', 'Kärnten'),
(100, 16, 'AT', 'ST', 'Steiermark'),
(101, 16, 'AT', 'TI', 'Tirol'),
(102, 16, 'AT', 'BL', 'Burgenland'),
(103, 16, 'AT', 'VB', 'Vorarlberg'),
(104, 220, 'CH', 'AG', 'Aargau'),
(105, 220, 'CH', 'AI', 'Appenzell Innerrhoden'),
(106, 220, 'CH', 'AR', 'Appenzell Ausserrhoden'),
(107, 220, 'CH', 'BE', 'Bern'),
(108, 220, 'CH', 'BL', 'Basel-Landschaft'),
(109, 220, 'CH', 'BS', 'Basel-Stadt'),
(110, 220, 'CH', 'FR', 'Freiburg'),
(111, 220, 'CH', 'GE', 'Genf'),
(112, 220, 'CH', 'GL', 'Glarus'),
(113, 220, 'CH', 'GR', 'Graubünden'),
(114, 220, 'CH', 'JU', 'Jura'),
(115, 220, 'CH', 'LU', 'Luzern'),
(116, 220, 'CH', 'NE', 'Neuenburg'),
(117, 220, 'CH', 'NW', 'Nidwalden'),
(118, 220, 'CH', 'OW', 'Obwalden'),
(119, 220, 'CH', 'SG', 'St. Gallen'),
(120, 220, 'CH', 'SH', 'Schaffhausen'),
(121, 220, 'CH', 'SO', 'Solothurn'),
(122, 220, 'CH', 'SZ', 'Schwyz'),
(123, 220, 'CH', 'TG', 'Thurgau'),
(124, 220, 'CH', 'TI', 'Tessin'),
(125, 220, 'CH', 'UR', 'Uri'),
(126, 220, 'CH', 'VD', 'Waadt'),
(127, 220, 'CH', 'VS', 'Wallis'),
(128, 220, 'CH', 'ZG', 'Zug'),
(129, 220, 'CH', 'ZH', 'Zürich'),
(130, 206, 'ES', 'A Coruсa', 'A Coruña'),
(131, 206, 'ES', 'Alava', 'Alava'),
(132, 206, 'ES', 'Albacete', 'Albacete'),
(133, 206, 'ES', 'Alicante', 'Alicante'),
(134, 206, 'ES', 'Almeria', 'Almeria'),
(135, 206, 'ES', 'Asturias', 'Asturias'),
(136, 206, 'ES', 'Avila', 'Avila'),
(137, 206, 'ES', 'Badajoz', 'Badajoz'),
(138, 206, 'ES', 'Baleares', 'Baleares'),
(139, 206, 'ES', 'Barcelona', 'Barcelona'),
(140, 206, 'ES', 'Burgos', 'Burgos'),
(141, 206, 'ES', 'Caceres', 'Caceres'),
(142, 206, 'ES', 'Cadiz', 'Cadiz'),
(143, 206, 'ES', 'Cantabria', 'Cantabria'),
(144, 206, 'ES', 'Castellon', 'Castellon'),
(145, 206, 'ES', 'Ceuta', 'Ceuta'),
(146, 206, 'ES', 'Ciudad Real', 'Ciudad Real'),
(147, 206, 'ES', 'Cordoba', 'Cordoba'),
(148, 206, 'ES', 'Cuenca', 'Cuenca'),
(149, 206, 'ES', 'Girona', 'Girona'),
(150, 206, 'ES', 'Granada', 'Granada'),
(151, 206, 'ES', 'Guadalajara', 'Guadalajara'),
(152, 206, 'ES', 'Guipuzcoa', 'Guipuzcoa'),
(153, 206, 'ES', 'Huelva', 'Huelva'),
(154, 206, 'ES', 'Huesca', 'Huesca'),
(155, 206, 'ES', 'Jaen', 'Jaen'),
(156, 206, 'ES', 'La Rioja', 'La Rioja'),
(157, 206, 'ES', 'Las Palmas', 'Las Palmas'),
(158, 206, 'ES', 'Leon', 'Leon'),
(159, 206, 'ES', 'Lleida', 'Lleida'),
(160, 206, 'ES', 'Lugo', 'Lugo'),
(161, 206, 'ES', 'Madrid', 'Madrid'),
(162, 206, 'ES', 'Malaga', 'Malaga'),
(163, 206, 'ES', 'Melilla', 'Melilla'),
(164, 206, 'ES', 'Murcia', 'Murcia'),
(165, 206, 'ES', 'Navarra', 'Navarra'),
(166, 206, 'ES', 'Ourense', 'Ourense'),
(167, 206, 'ES', 'Palencia', 'Palencia'),
(168, 206, 'ES', 'Pontevedra', 'Pontevedra'),
(169, 206, 'ES', 'Salamanca', 'Salamanca'),
(170, 206, 'ES', 'Santa Cruz de Tenerife', 'Santa Cruz de Tenerife'),
(171, 206, 'ES', 'Segovia', 'Segovia'),
(172, 206, 'ES', 'Sevilla', 'Sevilla'),
(173, 206, 'ES', 'Soria', 'Soria'),
(174, 206, 'ES', 'Tarragona', 'Tarragona'),
(175, 206, 'ES', 'Teruel', 'Teruel'),
(176, 206, 'ES', 'Toledo', 'Toledo'),
(177, 206, 'ES', 'Valencia', 'Valencia'),
(178, 206, 'ES', 'Valladolid', 'Valladolid'),
(179, 206, 'ES', 'Vizcaya', 'Vizcaya'),
(180, 206, 'ES', 'Zamora', 'Zamora'),
(181, 206, 'ES', 'Zaragoza', 'Zaragoza'),
(182, 81, 'FR', '1', 'Ain'),
(183, 81, 'FR', '2', 'Aisne'),
(184, 81, 'FR', '3', 'Allier'),
(185, 81, 'FR', '4', 'Alpes-de-Haute-Provence'),
(186, 81, 'FR', '5', 'Hautes-Alpes'),
(187, 81, 'FR', '6', 'Alpes-Maritimes'),
(188, 81, 'FR', '7', 'Ardèche'),
(189, 81, 'FR', '8', 'Ardennes'),
(190, 81, 'FR', '9', 'Ariège'),
(191, 81, 'FR', '10', 'Aube'),
(192, 81, 'FR', '11', 'Aude'),
(193, 81, 'FR', '12', 'Aveyron'),
(194, 81, 'FR', '13', 'Bouches-du-Rhône'),
(195, 81, 'FR', '14', 'Calvados'),
(196, 81, 'FR', '15', 'Cantal'),
(197, 81, 'FR', '16', 'Charente'),
(198, 81, 'FR', '17', 'Charente-Maritime'),
(199, 81, 'FR', '18', 'Cher'),
(200, 81, 'FR', '19', 'Corrèze'),
(201, 81, 'FR', '2A', 'Corse-du-Sud'),
(202, 81, 'FR', '2B', 'Haute-Corse'),
(203, 81, 'FR', '21', 'Côte-d\'Or'),
(204, 81, 'FR', '22', 'Côtes-d\'Armor'),
(205, 81, 'FR', '23', 'Creuse'),
(206, 81, 'FR', '24', 'Dordogne'),
(207, 81, 'FR', '25', 'Doubs'),
(208, 81, 'FR', '26', 'Drôme'),
(209, 81, 'FR', '27', 'Eure'),
(210, 81, 'FR', '28', 'Eure-et-Loir'),
(211, 81, 'FR', '29', 'Finistère'),
(212, 81, 'FR', '30', 'Gard'),
(213, 81, 'FR', '31', 'Haute-Garonne'),
(214, 81, 'FR', '32', 'Gers'),
(215, 81, 'FR', '33', 'Gironde'),
(216, 81, 'FR', '34', 'Hérault'),
(217, 81, 'FR', '35', 'Ille-et-Vilaine'),
(218, 81, 'FR', '36', 'Indre'),
(219, 81, 'FR', '37', 'Indre-et-Loire'),
(220, 81, 'FR', '38', 'Isère'),
(221, 81, 'FR', '39', 'Jura'),
(222, 81, 'FR', '40', 'Landes'),
(223, 81, 'FR', '41', 'Loir-et-Cher'),
(224, 81, 'FR', '42', 'Loire'),
(225, 81, 'FR', '43', 'Haute-Loire'),
(226, 81, 'FR', '44', 'Loire-Atlantique'),
(227, 81, 'FR', '45', 'Loiret'),
(228, 81, 'FR', '46', 'Lot'),
(229, 81, 'FR', '47', 'Lot-et-Garonne'),
(230, 81, 'FR', '48', 'Lozère'),
(231, 81, 'FR', '49', 'Maine-et-Loire'),
(232, 81, 'FR', '50', 'Manche'),
(233, 81, 'FR', '51', 'Marne'),
(234, 81, 'FR', '52', 'Haute-Marne'),
(235, 81, 'FR', '53', 'Mayenne'),
(236, 81, 'FR', '54', 'Meurthe-et-Moselle'),
(237, 81, 'FR', '55', 'Meuse'),
(238, 81, 'FR', '56', 'Morbihan'),
(239, 81, 'FR', '57', 'Moselle'),
(240, 81, 'FR', '58', 'Nièvre'),
(241, 81, 'FR', '59', 'Nord'),
(242, 81, 'FR', '60', 'Oise'),
(243, 81, 'FR', '61', 'Orne'),
(244, 81, 'FR', '62', 'Pas-de-Calais'),
(245, 81, 'FR', '63', 'Puy-de-Dôme'),
(246, 81, 'FR', '64', 'Pyrénées-Atlantiques'),
(247, 81, 'FR', '65', 'Hautes-Pyrénées'),
(248, 81, 'FR', '66', 'Pyrénées-Orientales'),
(249, 81, 'FR', '67', 'Bas-Rhin'),
(250, 81, 'FR', '68', 'Haut-Rhin'),
(251, 81, 'FR', '69', 'Rhône'),
(252, 81, 'FR', '70', 'Haute-Saône'),
(253, 81, 'FR', '71', 'Saône-et-Loire'),
(254, 81, 'FR', '72', 'Sarthe'),
(255, 81, 'FR', '73', 'Savoie'),
(256, 81, 'FR', '74', 'Haute-Savoie'),
(257, 81, 'FR', '75', 'Paris'),
(258, 81, 'FR', '76', 'Seine-Maritime'),
(259, 81, 'FR', '77', 'Seine-et-Marne'),
(260, 81, 'FR', '78', 'Yvelines'),
(261, 81, 'FR', '79', 'Deux-Sèvres'),
(262, 81, 'FR', '80', 'Somme'),
(263, 81, 'FR', '81', 'Tarn'),
(264, 81, 'FR', '82', 'Tarn-et-Garonne'),
(265, 81, 'FR', '83', 'Var'),
(266, 81, 'FR', '84', 'Vaucluse'),
(267, 81, 'FR', '85', 'Vendée'),
(268, 81, 'FR', '86', 'Vienne'),
(269, 81, 'FR', '87', 'Haute-Vienne'),
(270, 81, 'FR', '88', 'Vosges'),
(271, 81, 'FR', '89', 'Yonne'),
(272, 81, 'FR', '90', 'Territoire-de-Belfort'),
(273, 81, 'FR', '91', 'Essonne'),
(274, 81, 'FR', '92', 'Hauts-de-Seine'),
(275, 81, 'FR', '93', 'Seine-Saint-Denis'),
(276, 81, 'FR', '94', 'Val-de-Marne'),
(277, 81, 'FR', '95', 'Val-d\'Oise'),
(278, 185, 'RO', 'AB', 'Alba'),
(279, 185, 'RO', 'AR', 'Arad'),
(280, 185, 'RO', 'AG', 'Argeş'),
(281, 185, 'RO', 'BC', 'Bacău'),
(282, 185, 'RO', 'BH', 'Bihor'),
(283, 185, 'RO', 'BN', 'Bistriţa-Năsăud'),
(284, 185, 'RO', 'BT', 'Botoşani'),
(285, 185, 'RO', 'BV', 'Braşov'),
(286, 185, 'RO', 'BR', 'Brăila'),
(287, 185, 'RO', 'B', 'Bucureşti'),
(288, 185, 'RO', 'BZ', 'Buzău'),
(289, 185, 'RO', 'CS', 'Caraş-Severin'),
(290, 185, 'RO', 'CL', 'Călăraşi'),
(291, 185, 'RO', 'CJ', 'Cluj'),
(292, 185, 'RO', 'CT', 'Constanţa'),
(293, 185, 'RO', 'CV', 'Covasna'),
(294, 185, 'RO', 'DB', 'Dâmboviţa'),
(295, 185, 'RO', 'DJ', 'Dolj'),
(296, 185, 'RO', 'GL', 'Galaţi'),
(297, 185, 'RO', 'GR', 'Giurgiu'),
(298, 185, 'RO', 'GJ', 'Gorj'),
(299, 185, 'RO', 'HR', 'Harghita'),
(300, 185, 'RO', 'HD', 'Hunedoara'),
(301, 185, 'RO', 'IL', 'Ialomiţa'),
(302, 185, 'RO', 'IS', 'Iaşi'),
(303, 185, 'RO', 'IF', 'Ilfov'),
(304, 185, 'RO', 'MM', 'Maramureş'),
(305, 185, 'RO', 'MH', 'Mehedinţi'),
(306, 185, 'RO', 'MS', 'Mureş'),
(307, 185, 'RO', 'NT', 'Neamţ'),
(308, 185, 'RO', 'OT', 'Olt'),
(309, 185, 'RO', 'PH', 'Prahova'),
(310, 185, 'RO', 'SM', 'Satu-Mare'),
(311, 185, 'RO', 'SJ', 'Sălaj'),
(312, 185, 'RO', 'SB', 'Sibiu'),
(313, 185, 'RO', 'SV', 'Suceava'),
(314, 185, 'RO', 'TR', 'Teleorman'),
(315, 185, 'RO', 'TM', 'Timiş'),
(316, 185, 'RO', 'TL', 'Tulcea'),
(317, 185, 'RO', 'VS', 'Vaslui'),
(318, 185, 'RO', 'VL', 'Vâlcea'),
(319, 185, 'RO', 'VN', 'Vrancea'),
(320, 80, 'FI', 'Lappi', 'Lappi'),
(321, 80, 'FI', 'Pohjois-Pohjanmaa', 'Pohjois-Pohjanmaa'),
(322, 80, 'FI', 'Kainuu', 'Kainuu'),
(323, 80, 'FI', 'Pohjois-Karjala', 'Pohjois-Karjala'),
(324, 80, 'FI', 'Pohjois-Savo', 'Pohjois-Savo'),
(325, 80, 'FI', 'Etelä-Savo', 'Etelä-Savo'),
(326, 80, 'FI', 'Etelä-Pohjanmaa', 'Etelä-Pohjanmaa'),
(327, 80, 'FI', 'Pohjanmaa', 'Pohjanmaa'),
(328, 80, 'FI', 'Pirkanmaa', 'Pirkanmaa'),
(329, 80, 'FI', 'Satakunta', 'Satakunta'),
(330, 80, 'FI', 'Keski-Pohjanmaa', 'Keski-Pohjanmaa'),
(331, 80, 'FI', 'Keski-Suomi', 'Keski-Suomi'),
(332, 80, 'FI', 'Varsinais-Suomi', 'Varsinais-Suomi'),
(333, 80, 'FI', 'Etelä-Karjala', 'Etelä-Karjala'),
(334, 80, 'FI', 'Päijät-Häme', 'Päijät-Häme'),
(335, 80, 'FI', 'Kanta-Häme', 'Kanta-Häme'),
(336, 80, 'FI', 'Uusimaa', 'Uusimaa'),
(337, 80, 'FI', 'Itä-Uusimaa', 'Itä-Uusimaa'),
(338, 80, 'FI', 'Kymenlaakso', 'Kymenlaakso'),
(339, 80, 'FI', 'Ahvenanmaa', 'Ahvenanmaa'),
(340, 74, 'EE', 'EE-37', 'Harjumaa'),
(341, 74, 'EE', 'EE-39', 'Hiiumaa'),
(342, 74, 'EE', 'EE-44', 'Ida-Virumaa'),
(343, 74, 'EE', 'EE-49', 'Jõgevamaa'),
(344, 74, 'EE', 'EE-51', 'Järvamaa'),
(345, 74, 'EE', 'EE-57', 'Läänemaa'),
(346, 74, 'EE', 'EE-59', 'Lääne-Virumaa'),
(347, 74, 'EE', 'EE-65', 'Põlvamaa'),
(348, 74, 'EE', 'EE-67', 'Pärnumaa'),
(349, 74, 'EE', 'EE-70', 'Raplamaa'),
(350, 74, 'EE', 'EE-74', 'Saaremaa'),
(351, 74, 'EE', 'EE-78', 'Tartumaa'),
(352, 74, 'EE', 'EE-82', 'Valgamaa'),
(353, 74, 'EE', 'EE-84', 'Viljandimaa'),
(354, 74, 'EE', 'EE-86', 'Võrumaa'),
(355, 125, 'LV', 'LV-DGV', 'Daugavpils'),
(356, 125, 'LV', 'LV-JEL', 'Jelgava'),
(357, 125, 'LV', 'Jēkabpils', 'Jēkabpils'),
(358, 125, 'LV', 'LV-JUR', 'Jūrmala'),
(359, 125, 'LV', 'LV-LPX', 'Liepāja'),
(360, 125, 'LV', 'LV-LE', 'Liepājas novads'),
(361, 125, 'LV', 'LV-REZ', 'Rēzekne'),
(362, 125, 'LV', 'LV-RIX', 'Rīga'),
(363, 125, 'LV', 'LV-RI', 'Rīgas novads'),
(364, 125, 'LV', 'Valmiera', 'Valmiera'),
(365, 125, 'LV', 'LV-VEN', 'Ventspils'),
(366, 125, 'LV', 'Aglonas novads', 'Aglonas novads'),
(367, 125, 'LV', 'LV-AI', 'Aizkraukles novads'),
(368, 125, 'LV', 'Aizputes novads', 'Aizputes novads'),
(369, 125, 'LV', 'Aknīstes novads', 'Aknīstes novads'),
(370, 125, 'LV', 'Alojas novads', 'Alojas novads'),
(371, 125, 'LV', 'Alsungas novads', 'Alsungas novads'),
(372, 125, 'LV', 'LV-AL', 'Alūksnes novads'),
(373, 125, 'LV', 'Amatas novads', 'Amatas novads'),
(374, 125, 'LV', 'Apes novads', 'Apes novads'),
(375, 125, 'LV', 'Auces novads', 'Auces novads'),
(376, 125, 'LV', 'Babītes novads', 'Babītes novads'),
(377, 125, 'LV', 'Baldones novads', 'Baldones novads'),
(378, 125, 'LV', 'Baltinavas novads', 'Baltinavas novads'),
(379, 125, 'LV', 'LV-BL', 'Balvu novads'),
(380, 125, 'LV', 'LV-BU', 'Bauskas novads'),
(381, 125, 'LV', 'Beverīnas novads', 'Beverīnas novads'),
(382, 125, 'LV', 'Brocēnu novads', 'Brocēnu novads'),
(383, 125, 'LV', 'Burtnieku novads', 'Burtnieku novads'),
(384, 125, 'LV', 'Carnikavas novads', 'Carnikavas novads'),
(385, 125, 'LV', 'Cesvaines novads', 'Cesvaines novads'),
(386, 125, 'LV', 'Ciblas novads', 'Ciblas novads'),
(387, 125, 'LV', 'LV-CE', 'Cēsu novads'),
(388, 125, 'LV', 'Dagdas novads', 'Dagdas novads'),
(389, 125, 'LV', 'LV-DA', 'Daugavpils novads'),
(390, 125, 'LV', 'LV-DO', 'Dobeles novads'),
(391, 125, 'LV', 'Dundagas novads', 'Dundagas novads'),
(392, 125, 'LV', 'Durbes novads', 'Durbes novads'),
(393, 125, 'LV', 'Engures novads', 'Engures novads'),
(394, 125, 'LV', 'Garkalnes novads', 'Garkalnes novads'),
(395, 125, 'LV', 'Grobiņas novads', 'Grobiņas novads'),
(396, 125, 'LV', 'LV-GU', 'Gulbenes novads'),
(397, 125, 'LV', 'Iecavas novads', 'Iecavas novads'),
(398, 125, 'LV', 'Ikšķiles novads', 'Ikšķiles novads'),
(399, 125, 'LV', 'Ilūkstes novads', 'Ilūkstes novads'),
(400, 125, 'LV', 'Inčukalna novads', 'Inčukalna novads'),
(401, 125, 'LV', 'Jaunjelgavas novads', 'Jaunjelgavas novads'),
(402, 125, 'LV', 'Jaunpiebalgas novads', 'Jaunpiebalgas novads'),
(403, 125, 'LV', 'Jaunpils novads', 'Jaunpils novads'),
(404, 125, 'LV', 'LV-JL', 'Jelgavas novads'),
(405, 125, 'LV', 'LV-JK', 'Jēkabpils novads'),
(406, 125, 'LV', 'Kandavas novads', 'Kandavas novads'),
(407, 125, 'LV', 'Kokneses novads', 'Kokneses novads'),
(408, 125, 'LV', 'Krimuldas novads', 'Krimuldas novads'),
(409, 125, 'LV', 'Krustpils novads', 'Krustpils novads'),
(410, 125, 'LV', 'LV-KR', 'Krāslavas novads'),
(411, 125, 'LV', 'LV-KU', 'Kuldīgas novads'),
(412, 125, 'LV', 'Kārsavas novads', 'Kārsavas novads'),
(413, 125, 'LV', 'Lielvārdes novads', 'Lielvārdes novads'),
(414, 125, 'LV', 'LV-LM', 'Limbažu novads'),
(415, 125, 'LV', 'Lubānas novads', 'Lubānas novads'),
(416, 125, 'LV', 'LV-LU', 'Ludzas novads'),
(417, 125, 'LV', 'Līgatnes novads', 'Līgatnes novads'),
(418, 125, 'LV', 'Līvānu novads', 'Līvānu novads'),
(419, 125, 'LV', 'LV-MA', 'Madonas novads'),
(420, 125, 'LV', 'Mazsalacas novads', 'Mazsalacas novads'),
(421, 125, 'LV', 'Mālpils novads', 'Mālpils novads'),
(422, 125, 'LV', 'Mārupes novads', 'Mārupes novads'),
(423, 125, 'LV', 'Naukšēnu novads', 'Naukšēnu novads'),
(424, 125, 'LV', 'Neretas novads', 'Neretas novads'),
(425, 125, 'LV', 'Nīcas novads', 'Nīcas novads'),
(426, 125, 'LV', 'LV-OG', 'Ogres novads'),
(427, 125, 'LV', 'Olaines novads', 'Olaines novads'),
(428, 125, 'LV', 'Ozolnieku novads', 'Ozolnieku novads'),
(429, 125, 'LV', 'LV-PR', 'Preiļu novads'),
(430, 125, 'LV', 'Priekules novads', 'Priekules novads'),
(431, 125, 'LV', 'Priekuļu novads', 'Priekuļu novads'),
(432, 125, 'LV', 'Pārgaujas novads', 'Pārgaujas novads'),
(433, 125, 'LV', 'Pāvilostas novads', 'Pāvilostas novads'),
(434, 125, 'LV', 'Pļaviņu novads', 'Pļaviņu novads'),
(435, 125, 'LV', 'Raunas novads', 'Raunas novads'),
(436, 125, 'LV', 'Riebiņu novads', 'Riebiņu novads'),
(437, 125, 'LV', 'Rojas novads', 'Rojas novads'),
(438, 125, 'LV', 'Ropažu novads', 'Ropažu novads'),
(439, 125, 'LV', 'Rucavas novads', 'Rucavas novads'),
(440, 125, 'LV', 'Rugāju novads', 'Rugāju novads'),
(441, 125, 'LV', 'Rundāles novads', 'Rundāles novads'),
(442, 125, 'LV', 'LV-RE', 'Rēzeknes novads'),
(443, 125, 'LV', 'Rūjienas novads', 'Rūjienas novads'),
(444, 125, 'LV', 'Salacgrīvas novads', 'Salacgrīvas novads'),
(445, 125, 'LV', 'Salas novads', 'Salas novads'),
(446, 125, 'LV', 'Salaspils novads', 'Salaspils novads'),
(447, 125, 'LV', 'LV-SA', 'Saldus novads'),
(448, 125, 'LV', 'Saulkrastu novads', 'Saulkrastu novads'),
(449, 125, 'LV', 'Siguldas novads', 'Siguldas novads'),
(450, 125, 'LV', 'Skrundas novads', 'Skrundas novads'),
(451, 125, 'LV', 'Skrīveru novads', 'Skrīveru novads'),
(452, 125, 'LV', 'Smiltenes novads', 'Smiltenes novads'),
(453, 125, 'LV', 'Stopiņu novads', 'Stopiņu novads'),
(454, 125, 'LV', 'Strenču novads', 'Strenču novads'),
(455, 125, 'LV', 'Sējas novads', 'Sējas novads'),
(456, 125, 'LV', 'LV-TA', 'Talsu novads'),
(457, 125, 'LV', 'LV-TU', 'Tukuma novads'),
(458, 125, 'LV', 'Tērvetes novads', 'Tērvetes novads'),
(459, 125, 'LV', 'Vaiņodes novads', 'Vaiņodes novads'),
(460, 125, 'LV', 'LV-VK', 'Valkas novads'),
(461, 125, 'LV', 'LV-VM', 'Valmieras novads'),
(462, 125, 'LV', 'Varakļānu novads', 'Varakļānu novads'),
(463, 125, 'LV', 'Vecpiebalgas novads', 'Vecpiebalgas novads'),
(464, 125, 'LV', 'Vecumnieku novads', 'Vecumnieku novads'),
(465, 125, 'LV', 'LV-VE', 'Ventspils novads'),
(466, 125, 'LV', 'Viesītes novads', 'Viesītes novads'),
(467, 125, 'LV', 'Viļakas novads', 'Viļakas novads'),
(468, 125, 'LV', 'Viļānu novads', 'Viļānu novads'),
(469, 125, 'LV', 'Vārkavas novads', 'Vārkavas novads'),
(470, 125, 'LV', 'Zilupes novads', 'Zilupes novads'),
(471, 125, 'LV', 'Ādažu novads', 'Ādažu novads'),
(472, 125, 'LV', 'Ērgļu novads', 'Ērgļu novads'),
(473, 125, 'LV', 'Ķeguma novads', 'Ķeguma novads'),
(474, 125, 'LV', 'Ķekavas novads', 'Ķekavas novads'),
(475, 131, 'LT', 'LT-AL', 'Alytaus Apskritis'),
(476, 131, 'LT', 'LT-KU', 'Kauno Apskritis'),
(477, 131, 'LT', 'LT-KL', 'Klaipėdos Apskritis'),
(478, 131, 'LT', 'LT-MR', 'Marijampolės Apskritis'),
(479, 131, 'LT', 'LT-PN', 'Panevėžio Apskritis'),
(480, 131, 'LT', 'LT-SA', 'Šiaulių Apskritis'),
(481, 131, 'LT', 'LT-TA', 'Tauragės Apskritis'),
(482, 131, 'LT', 'LT-TE', 'Telšių Apskritis'),
(483, 131, 'LT', 'LT-UT', 'Utenos Apskritis'),
(484, 131, 'LT', 'LT-VL', 'Vilniaus Apskritis'),
(485, 31, 'BR', 'AC', 'Acre'),
(486, 31, 'BR', 'AL', 'Alagoas'),
(487, 31, 'BR', 'AP', 'Amapá'),
(488, 31, 'BR', 'AM', 'Amazonas'),
(489, 31, 'BR', 'BA', 'Bahia'),
(490, 31, 'BR', 'CE', 'Ceará'),
(491, 31, 'BR', 'ES', 'Espírito Santo'),
(492, 31, 'BR', 'GO', 'Goiás'),
(493, 31, 'BR', 'MA', 'Maranhão'),
(494, 31, 'BR', 'MT', 'Mato Grosso'),
(495, 31, 'BR', 'MS', 'Mato Grosso do Sul'),
(496, 31, 'BR', 'MG', 'Minas Gerais'),
(497, 31, 'BR', 'PA', 'Pará'),
(498, 31, 'BR', 'PB', 'Paraíba'),
(499, 31, 'BR', 'PR', 'Paraná'),
(500, 31, 'BR', 'PE', 'Pernambuco'),
(501, 31, 'BR', 'PI', 'Piauí'),
(502, 31, 'BR', 'RJ', 'Rio de Janeiro'),
(503, 31, 'BR', 'RN', 'Rio Grande do Norte'),
(504, 31, 'BR', 'RS', 'Rio Grande do Sul'),
(505, 31, 'BR', 'RO', 'Rondônia'),
(506, 31, 'BR', 'RR', 'Roraima'),
(507, 31, 'BR', 'SC', 'Santa Catarina'),
(508, 31, 'BR', 'SP', 'São Paulo'),
(509, 31, 'BR', 'SE', 'Sergipe'),
(510, 31, 'BR', 'TO', 'Tocantins'),
(511, 31, 'BR', 'DF', 'Distrito Federal'),
(512, 59, 'HR', 'HR-01', 'Zagrebačka županija'),
(513, 59, 'HR', 'HR-02', 'Krapinsko-zagorska županija'),
(514, 59, 'HR', 'HR-03', 'Sisačko-moslavačka županija'),
(515, 59, 'HR', 'HR-04', 'Karlovačka županija'),
(516, 59, 'HR', 'HR-05', 'Varaždinska županija'),
(517, 59, 'HR', 'HR-06', 'Koprivničko-križevačka županija'),
(518, 59, 'HR', 'HR-07', 'Bjelovarsko-bilogorska županija'),
(519, 59, 'HR', 'HR-08', 'Primorsko-goranska županija'),
(520, 59, 'HR', 'HR-09', 'Ličko-senjska županija'),
(521, 59, 'HR', 'HR-10', 'Virovitičko-podravska županija'),
(522, 59, 'HR', 'HR-11', 'Požeško-slavonska županija'),
(523, 59, 'HR', 'HR-12', 'Brodsko-posavska županija'),
(524, 59, 'HR', 'HR-13', 'Zadarska županija'),
(525, 59, 'HR', 'HR-14', 'Osječko-baranjska županija'),
(526, 59, 'HR', 'HR-15', 'Šibensko-kninska županija'),
(527, 59, 'HR', 'HR-16', 'Vukovarsko-srijemska županija'),
(528, 59, 'HR', 'HR-17', 'Splitsko-dalmatinska županija'),
(529, 59, 'HR', 'HR-18', 'Istarska županija'),
(530, 59, 'HR', 'HR-19', 'Dubrovačko-neretvanska županija'),
(531, 59, 'HR', 'HR-20', 'Međimurska županija'),
(532, 59, 'HR', 'HR-21', 'Grad Zagreb'),
(533, 106, 'IN', 'AN', 'Andaman and Nicobar Islands'),
(534, 106, 'IN', 'AP', 'Andhra Pradesh'),
(535, 106, 'IN', 'AR', 'Arunachal Pradesh'),
(536, 106, 'IN', 'AS', 'Assam'),
(537, 106, 'IN', 'BR', 'Bihar'),
(538, 106, 'IN', 'CH', 'Chandigarh'),
(539, 106, 'IN', 'CT', 'Chhattisgarh'),
(540, 106, 'IN', 'DN', 'Dadra and Nagar Haveli'),
(541, 106, 'IN', 'DD', 'Daman and Diu'),
(542, 106, 'IN', 'DL', 'Delhi'),
(543, 106, 'IN', 'GA', 'Goa'),
(544, 106, 'IN', 'GJ', 'Gujarat'),
(545, 106, 'IN', 'HR', 'Haryana'),
(546, 106, 'IN', 'HP', 'Himachal Pradesh'),
(547, 106, 'IN', 'JK', 'Jammu and Kashmir'),
(548, 106, 'IN', 'JH', 'Jharkhand'),
(549, 106, 'IN', 'KA', 'Karnataka'),
(550, 106, 'IN', 'KL', 'Kerala'),
(551, 106, 'IN', 'LD', 'Lakshadweep'),
(552, 106, 'IN', 'MP', 'Madhya Pradesh'),
(553, 106, 'IN', 'MH', 'Maharashtra'),
(554, 106, 'IN', 'MN', 'Manipur'),
(555, 106, 'IN', 'ML', 'Meghalaya'),
(556, 106, 'IN', 'MZ', 'Mizoram'),
(557, 106, 'IN', 'NL', 'Nagaland'),
(558, 106, 'IN', 'OR', 'Odisha'),
(559, 106, 'IN', 'PY', 'Puducherry'),
(560, 106, 'IN', 'PB', 'Punjab'),
(561, 106, 'IN', 'RJ', 'Rajasthan'),
(562, 106, 'IN', 'SK', 'Sikkim'),
(563, 106, 'IN', 'TN', 'Tamil Nadu'),
(564, 106, 'IN', 'TG', 'Telangana'),
(565, 106, 'IN', 'TR', 'Tripura'),
(566, 106, 'IN', 'UP', 'Uttar Pradesh'),
(567, 106, 'IN', 'UT', 'Uttarakhand'),
(568, 106, 'IN', 'WB', 'West Bengal'),
(569, 176, 'PY', 'PY-16', 'Alto Paraguay'),
(570, 176, 'PY', 'PY-10', 'Alto Paraná'),
(571, 176, 'PY', 'PY-13', 'Amambay'),
(572, 176, 'PY', 'PY-ASU', 'Asunción'),
(573, 176, 'PY', 'PY-19', 'Boquerón'),
(574, 176, 'PY', 'PY-5', 'Caaguazú'),
(575, 176, 'PY', 'PY-6', 'Caazapá'),
(576, 176, 'PY', 'PY-14', 'Canindeyú'),
(577, 176, 'PY', 'PY-11', 'Central'),
(578, 176, 'PY', 'PY-1', 'Concepción'),
(579, 176, 'PY', 'PY-3', 'Cordillera'),
(580, 176, 'PY', 'PY-4', 'Guairá'),
(581, 176, 'PY', 'PY-7', 'Itapúa'),
(582, 176, 'PY', 'PY-8', 'Misiones'),
(583, 176, 'PY', 'PY-9', 'Paraguarí'),
(584, 176, 'PY', 'PY-15', 'Presidente Hayes'),
(585, 176, 'PY', 'PY-2', 'San Pedro'),
(586, 176, 'PY', 'PY-12', 'Ñeembucú');

-- --------------------------------------------------------

--
-- Table structure for table `country_state_translations`
--

CREATE TABLE `country_state_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_state_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `default_name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `country_translations`
--

CREATE TABLE `country_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `name` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `decimal` int(10) UNSIGNED NOT NULL DEFAULT 2,
  `group_separator` varchar(255) NOT NULL DEFAULT ',',
  `decimal_separator` varchar(255) NOT NULL DEFAULT '.',
  `currency_position` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `decimal`, `group_separator`, `decimal_separator`, `currency_position`, `created_at`, `updated_at`) VALUES
(1, 'USD', 'United States Dollar', '$', 2, ',', '.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currency_exchange_rates`
--

CREATE TABLE `currency_exchange_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `rate` decimal(24,12) NOT NULL,
  `target_currency` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `password` varchar(255) DEFAULT NULL,
  `api_token` varchar(80) DEFAULT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `subscribed_to_news_letter` tinyint(1) NOT NULL DEFAULT 0,
  `is_verified` tinyint(1) NOT NULL DEFAULT 0,
  `is_suspended` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `token` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `gender`, `date_of_birth`, `email`, `phone`, `image`, `status`, `password`, `api_token`, `customer_group_id`, `channel_id`, `subscribed_to_news_letter`, `is_verified`, `is_suspended`, `token`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'zafar', 'Husain', NULL, NULL, 'zafarhusain.husain02@gmail.com', NULL, NULL, 1, '$2y$12$ZMT6zo0dS7iZpiIx3xvz9.lCirmke7e0va.Rycz8BCr088W5iNL5W', 'PvCbWGR5hrS6RMVADsroOWMP4tKZsY7Gl9n1YeEORBqtefcVrT6lKvTBQFj5HJkcOi3cdCid4PFRzxl2', 1, 1, 0, 1, 0, '8ac469b1d725cab3882c1f244b8379bf', NULL, '2025-08-07 04:30:11', '2025-08-07 04:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `customer_groups`
--

CREATE TABLE `customer_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customer_groups`
--

INSERT INTO `customer_groups` (`id`, `code`, `name`, `is_user_defined`, `created_at`, `updated_at`) VALUES
(1, 'guest', 'Guest', 0, NULL, NULL),
(2, 'general', 'General', 0, NULL, NULL),
(3, 'wholesale', 'Wholesale', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer_notes`
--

CREATE TABLE `customer_notes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `note` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_password_resets`
--

CREATE TABLE `customer_password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_social_accounts`
--

CREATE TABLE `customer_social_accounts` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `provider_name` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `datagrid_saved_filters`
--

CREATE TABLE `datagrid_saved_filters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `src` varchar(255) NOT NULL,
  `applied` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`applied`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `downloadable_link_purchased`
--

CREATE TABLE `downloadable_link_purchased` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `download_bought` int(11) NOT NULL DEFAULT 0,
  `download_used` int(11) NOT NULL DEFAULT 0,
  `status` varchar(255) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_item_id` int(10) UNSIGNED NOT NULL,
  `download_canceled` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `gdpr_data_request`
--

CREATE TABLE `gdpr_data_request` (
  `id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `message` varchar(500) NOT NULL,
  `revoked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `imports`
--

CREATE TABLE `imports` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'pending',
  `process_in_queue` tinyint(1) NOT NULL DEFAULT 1,
  `type` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `validation_strategy` varchar(255) NOT NULL,
  `allowed_errors` int(11) NOT NULL DEFAULT 0,
  `processed_rows_count` int(11) NOT NULL DEFAULT 0,
  `invalid_rows_count` int(11) NOT NULL DEFAULT 0,
  `errors_count` int(11) NOT NULL DEFAULT 0,
  `errors` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`errors`)),
  `field_separator` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `images_directory_path` varchar(255) DEFAULT NULL,
  `error_file_path` varchar(255) DEFAULT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `import_batches`
--

CREATE TABLE `import_batches` (
  `id` int(10) UNSIGNED NOT NULL,
  `state` varchar(255) NOT NULL DEFAULT 'pending',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`data`)),
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`summary`)),
  `import_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_sources`
--

CREATE TABLE `inventory_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `contact_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `contact_fax` varchar(255) DEFAULT NULL,
  `country` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `street` varchar(255) NOT NULL,
  `postcode` varchar(255) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT 0,
  `latitude` decimal(10,5) DEFAULT NULL,
  `longitude` decimal(10,5) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_sources`
--

INSERT INTO `inventory_sources` (`id`, `code`, `name`, `description`, `contact_name`, `contact_email`, `contact_number`, `contact_fax`, `country`, `state`, `city`, `street`, `postcode`, `priority`, `latitude`, `longitude`, `status`, `created_at`, `updated_at`) VALUES
(1, 'default', 'Default', NULL, 'Default', 'warehouse@example.com', '1234567899', NULL, 'US', 'MI', 'Detroit', '12th Street', '48127', 0, NULL, NULL, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(255) DEFAULT NULL,
  `channel_currency_code` varchar(255) DEFAULT NULL,
  `order_currency_code` varchar(255) DEFAULT NULL,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `reminders` int(11) NOT NULL DEFAULT 0,
  `next_reminder_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `increment_id`, `state`, `email_sent`, `total_qty`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `sub_total`, `base_sub_total`, `grand_total`, `base_grand_total`, `shipping_amount`, `base_shipping_amount`, `tax_amount`, `base_tax_amount`, `discount_amount`, `base_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `order_id`, `transaction_id`, `reminders`, `next_reminder_at`, `created_at`, `updated_at`) VALUES
(1, '1', 'paid', 1, 9, 'USD', 'USD', 'USD', 128.0000, 128.0000, 218.0000, 218.0000, 90.0000, 90.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 128.0000, 128.0000, 90.0000, 90.0000, 1, NULL, 0, NULL, '2025-08-07 11:30:25', '2025-08-07 11:30:37');

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `invoice_items`
--

INSERT INTO `invoice_items` (`id`, `parent_id`, `name`, `description`, `sku`, `qty`, `price`, `base_price`, `total`, `base_total`, `tax_amount`, `base_tax_amount`, `discount_percent`, `discount_amount`, `base_discount_amount`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_item_id`, `invoice_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Arctic Cozy Knit Unisex Beanie', NULL, 'SP-001', 5, 12.0000, 12.0000, 60.0000, 60.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12.0000, 12.0000, 60.0000, 60.0000, 1, 'Webkul\\Product\\Models\\Product', 1, 1, '{\"cart_id\":1,\"quantity\":5,\"product_id\":1,\"locale\":\"en\"}', '2025-08-07 11:30:25', '2025-08-07 11:30:25'),
(2, NULL, 'Arctic Touchscreen Winter Gloves', NULL, 'SP-003', 4, 17.0000, 17.0000, 68.0000, 68.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 17.0000, 17.0000, 68.0000, 68.0000, 3, 'Webkul\\Product\\Models\\Product', 2, 1, '{\"cart_id\":1,\"product_id\":3,\"quantity\":4,\"locale\":\"en\"}', '2025-08-07 11:30:26', '2025-08-07 11:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` text NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locales`
--

CREATE TABLE `locales` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `direction` enum('ltr','rtl') NOT NULL DEFAULT 'ltr',
  `logo_path` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locales`
--

INSERT INTO `locales` (`id`, `code`, `name`, `direction`, `logo_path`, `created_at`, `updated_at`) VALUES
(1, 'en', 'English', 'ltr', 'locales/yMaYCuONlq8FXQNxmfcvo4D9ObG2C2ppfWvRGRlf.png', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_campaigns`
--

CREATE TABLE `marketing_campaigns` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `type` varchar(255) NOT NULL,
  `mail_to` varchar(255) NOT NULL,
  `spooling` varchar(255) DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_template_id` int(10) UNSIGNED DEFAULT NULL,
  `marketing_event_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `marketing_events`
--

CREATE TABLE `marketing_events` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `marketing_events`
--

INSERT INTO `marketing_events` (`id`, `name`, `description`, `date`, `created_at`, `updated_at`) VALUES
(1, 'Birthday', 'Birthday', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `marketing_templates`
--

CREATE TABLE `marketing_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(2, '2014_10_12_100000_create_admin_password_resets_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2018_06_12_111907_create_admins_table', 1),
(5, '2018_06_13_055341_create_roles_table', 1),
(6, '2018_07_05_130148_create_attributes_table', 1),
(7, '2018_07_05_132854_create_attribute_translations_table', 1),
(8, '2018_07_05_135150_create_attribute_families_table', 1),
(9, '2018_07_05_135152_create_attribute_groups_table', 1),
(10, '2018_07_05_140832_create_attribute_options_table', 1),
(11, '2018_07_05_140856_create_attribute_option_translations_table', 1),
(12, '2018_07_05_142820_create_categories_table', 1),
(13, '2018_07_10_055143_create_locales_table', 1),
(14, '2018_07_20_054426_create_countries_table', 1),
(15, '2018_07_20_054502_create_currencies_table', 1),
(16, '2018_07_20_054542_create_currency_exchange_rates_table', 1),
(17, '2018_07_20_064849_create_channels_table', 1),
(18, '2018_07_21_142836_create_category_translations_table', 1),
(19, '2018_07_23_110040_create_inventory_sources_table', 1),
(20, '2018_07_24_082635_create_customer_groups_table', 1),
(21, '2018_07_24_082930_create_customers_table', 1),
(22, '2018_07_27_065727_create_products_table', 1),
(23, '2018_07_27_070011_create_product_attribute_values_table', 1),
(24, '2018_07_27_092623_create_product_reviews_table', 1),
(25, '2018_07_27_113941_create_product_images_table', 1),
(26, '2018_07_27_113956_create_product_inventories_table', 1),
(27, '2018_08_30_064755_create_tax_categories_table', 1),
(28, '2018_08_30_065042_create_tax_rates_table', 1),
(29, '2018_08_30_065840_create_tax_mappings_table', 1),
(30, '2018_09_05_150444_create_cart_table', 1),
(31, '2018_09_05_150915_create_cart_items_table', 1),
(32, '2018_09_11_064045_customer_password_resets', 1),
(33, '2018_09_19_093453_create_cart_payment', 1),
(34, '2018_09_19_093508_create_cart_shipping_rates_table', 1),
(35, '2018_09_20_060658_create_core_config_table', 1),
(36, '2018_09_27_113154_create_orders_table', 1),
(37, '2018_09_27_113207_create_order_items_table', 1),
(38, '2018_09_27_115022_create_shipments_table', 1),
(39, '2018_09_27_115029_create_shipment_items_table', 1),
(40, '2018_09_27_115135_create_invoices_table', 1),
(41, '2018_09_27_115144_create_invoice_items_table', 1),
(42, '2018_10_01_095504_create_order_payment_table', 1),
(43, '2018_10_03_025230_create_wishlist_table', 1),
(44, '2018_10_12_101803_create_country_translations_table', 1),
(45, '2018_10_12_101913_create_country_states_table', 1),
(46, '2018_10_12_101923_create_country_state_translations_table', 1),
(47, '2018_11_16_173504_create_subscribers_list_table', 1),
(48, '2018_11_21_144411_create_cart_item_inventories_table', 1),
(49, '2018_12_06_185202_create_product_flat_table', 1),
(50, '2018_12_24_123812_create_channel_inventory_sources_table', 1),
(51, '2018_12_26_165327_create_product_ordered_inventories_table', 1),
(52, '2019_05_13_024321_create_cart_rules_table', 1),
(53, '2019_05_13_024322_create_cart_rule_channels_table', 1),
(54, '2019_05_13_024323_create_cart_rule_customer_groups_table', 1),
(55, '2019_05_13_024324_create_cart_rule_translations_table', 1),
(56, '2019_05_13_024325_create_cart_rule_customers_table', 1),
(57, '2019_05_13_024326_create_cart_rule_coupons_table', 1),
(58, '2019_05_13_024327_create_cart_rule_coupon_usage_table', 1),
(59, '2019_06_17_180258_create_product_downloadable_samples_table', 1),
(60, '2019_06_17_180314_create_product_downloadable_sample_translations_table', 1),
(61, '2019_06_17_180325_create_product_downloadable_links_table', 1),
(62, '2019_06_17_180346_create_product_downloadable_link_translations_table', 1),
(63, '2019_06_21_202249_create_downloadable_link_purchased_table', 1),
(64, '2019_07_02_180307_create_booking_products_table', 1),
(65, '2019_07_05_154415_create_booking_product_default_slots_table', 1),
(66, '2019_07_05_154429_create_booking_product_appointment_slots_table', 1),
(67, '2019_07_05_154440_create_booking_product_event_tickets_table', 1),
(68, '2019_07_05_154451_create_booking_product_rental_slots_table', 1),
(69, '2019_07_05_154502_create_booking_product_table_slots_table', 1),
(70, '2019_07_30_153530_create_cms_pages_table', 1),
(71, '2019_07_31_143339_create_category_filterable_attributes_table', 1),
(72, '2019_08_02_105320_create_product_grouped_products_table', 1),
(73, '2019_08_20_170510_create_product_bundle_options_table', 1),
(74, '2019_08_20_170520_create_product_bundle_option_translations_table', 1),
(75, '2019_08_20_170528_create_product_bundle_option_products_table', 1),
(76, '2019_09_11_184511_create_refunds_table', 1),
(77, '2019_09_11_184519_create_refund_items_table', 1),
(78, '2019_12_03_184613_create_catalog_rules_table', 1),
(79, '2019_12_03_184651_create_catalog_rule_channels_table', 1),
(80, '2019_12_03_184732_create_catalog_rule_customer_groups_table', 1),
(81, '2019_12_06_101110_create_catalog_rule_products_table', 1),
(82, '2019_12_06_110507_create_catalog_rule_product_prices_table', 1),
(83, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(84, '2020_01_14_191854_create_cms_page_translations_table', 1),
(85, '2020_01_15_130209_create_cms_page_channels_table', 1),
(86, '2020_02_18_165639_create_bookings_table', 1),
(87, '2020_02_21_121201_create_booking_product_event_ticket_translations_table', 1),
(88, '2020_04_16_185147_add_table_addresses', 1),
(89, '2020_05_06_171638_create_order_comments_table', 1),
(90, '2020_05_21_171500_create_product_customer_group_prices_table', 1),
(91, '2020_06_25_162154_create_customer_social_accounts_table', 1),
(92, '2020_08_07_174804_create_gdpr_data_request_table', 1),
(93, '2020_11_19_112228_create_product_videos_table', 1),
(94, '2020_11_26_141455_create_marketing_templates_table', 1),
(95, '2020_11_26_150534_create_marketing_events_table', 1),
(96, '2020_11_26_150644_create_marketing_campaigns_table', 1),
(97, '2020_12_21_000200_create_channel_translations_table', 1),
(98, '2020_12_27_121950_create_jobs_table', 1),
(99, '2021_03_11_212124_create_order_transactions_table', 1),
(100, '2021_04_07_132010_create_product_review_images_table', 1),
(101, '2021_12_15_104544_notifications', 1),
(102, '2022_03_15_160510_create_failed_jobs_table', 1),
(103, '2022_04_01_094622_create_sitemaps_table', 1),
(104, '2022_10_03_144232_create_product_price_indices_table', 1),
(105, '2022_10_04_144444_create_job_batches_table', 1),
(106, '2022_10_08_134150_create_product_inventory_indices_table', 1),
(107, '2023_05_26_213105_create_wishlist_items_table', 1),
(108, '2023_05_26_213120_create_compare_items_table', 1),
(109, '2023_06_27_163529_rename_product_review_images_to_product_review_attachments', 1),
(110, '2023_07_06_140013_add_logo_path_column_to_locales', 1),
(111, '2023_07_10_184256_create_theme_customizations_table', 1),
(112, '2023_07_12_181722_remove_home_page_and_footer_content_column_from_channel_translations_table', 1),
(113, '2023_07_20_185324_add_column_column_in_attribute_groups_table', 1),
(114, '2023_07_25_145943_add_regex_column_in_attributes_table', 1),
(115, '2023_07_25_165945_drop_notes_column_from_customers_table', 1),
(116, '2023_07_25_171058_create_customer_notes_table', 1),
(117, '2023_07_31_125232_rename_image_and_category_banner_columns_from_categories_table', 1),
(118, '2023_09_15_170053_create_theme_customization_translations_table', 1),
(119, '2023_09_20_102031_add_default_value_column_in_attributes_table', 1),
(120, '2023_09_20_102635_add_inventories_group_in_attribute_groups_table', 1),
(121, '2023_09_26_155709_add_columns_to_currencies', 1),
(122, '2023_10_05_163612_create_visits_table', 1),
(123, '2023_10_12_090446_add_tax_category_id_column_in_order_items_table', 1),
(124, '2023_11_08_054614_add_code_column_in_attribute_groups_table', 1),
(125, '2023_11_08_140116_create_search_terms_table', 1),
(126, '2023_11_09_162805_create_url_rewrites_table', 1),
(127, '2023_11_17_150401_create_search_synonyms_table', 1),
(128, '2023_12_11_054614_add_channel_id_column_in_product_price_indices_table', 1),
(129, '2024_01_11_154640_create_imports_table', 1),
(130, '2024_01_11_154741_create_import_batches_table', 1),
(131, '2024_01_19_170350_add_unique_id_column_in_product_attribute_values_table', 1),
(132, '2024_01_19_170350_add_unique_id_column_in_product_customer_group_prices_table', 1),
(133, '2024_01_22_170814_add_unique_index_in_mapping_tables', 1),
(134, '2024_02_26_153000_add_columns_to_addresses_table', 1),
(135, '2024_03_07_193421_rename_address1_column_in_addresses_table', 1),
(136, '2024_04_16_144400_add_cart_id_column_in_cart_shipping_rates_table', 1),
(137, '2024_04_19_102939_add_incl_tax_columns_in_orders_table', 1),
(138, '2024_04_19_135405_add_incl_tax_columns_in_cart_items_table', 1),
(139, '2024_04_19_144641_add_incl_tax_columns_in_order_items_table', 1),
(140, '2024_04_23_133154_add_incl_tax_columns_in_cart_table', 1),
(141, '2024_04_23_150945_add_incl_tax_columns_in_cart_shipping_rates_table', 1),
(142, '2024_04_24_102939_add_incl_tax_columns_in_invoices_table', 1),
(143, '2024_04_24_102939_add_incl_tax_columns_in_refunds_table', 1),
(144, '2024_04_24_144641_add_incl_tax_columns_in_invoice_items_table', 1),
(145, '2024_04_24_144641_add_incl_tax_columns_in_refund_items_table', 1),
(146, '2024_04_24_144641_add_incl_tax_columns_in_shipment_items_table', 1),
(147, '2024_05_10_152848_create_saved_filters_table', 1),
(148, '2024_06_03_174128_create_product_channels_table', 1),
(149, '2024_06_04_130527_add_channel_id_column_in_customers_table', 1),
(150, '2024_06_04_134403_add_channel_id_column_in_visits_table', 1),
(151, '2024_06_13_184426_add_theme_column_into_theme_customizations_table', 1),
(152, '2024_07_17_172645_add_additional_column_to_sitemaps_table', 1),
(153, '2024_10_11_135010_create_product_customizable_options_table', 1),
(154, '2024_10_11_135110_create_product_customizable_option_translations_table', 1),
(155, '2024_10_11_135228_create_product_customizable_option_prices_table', 1),
(156, '2025_05_07_121250_update_total_weight_columns_in_shipments_and_weight_shipment_items_tables', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `read` tinyint(1) NOT NULL DEFAULT 0,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `read`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 'order', 0, 1, '2025-08-07 11:10:02', '2025-08-07 11:10:02'),
(2, 'order', 0, 2, '2025-08-08 14:46:37', '2025-08-08 14:46:37');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `channel_name` varchar(255) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_first_name` varchar(255) DEFAULT NULL,
  `customer_last_name` varchar(255) DEFAULT NULL,
  `shipping_method` varchar(255) DEFAULT NULL,
  `shipping_title` varchar(255) DEFAULT NULL,
  `shipping_description` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `is_gift` tinyint(1) NOT NULL DEFAULT 0,
  `total_item_count` int(11) DEFAULT NULL,
  `total_qty_ordered` int(11) DEFAULT NULL,
  `base_currency_code` varchar(255) DEFAULT NULL,
  `channel_currency_code` varchar(255) DEFAULT NULL,
  `order_currency_code` varchar(255) DEFAULT NULL,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_invoiced` decimal(12,4) DEFAULT 0.0000,
  `sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total_refunded` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_invoiced` decimal(12,4) DEFAULT 0.0000,
  `shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_refunded` decimal(12,4) DEFAULT 0.0000,
  `shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_type` varchar(255) DEFAULT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `applied_cart_rule_ids` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `increment_id`, `status`, `channel_name`, `is_guest`, `customer_email`, `customer_first_name`, `customer_last_name`, `shipping_method`, `shipping_title`, `shipping_description`, `coupon_code`, `is_gift`, `total_item_count`, `total_qty_ordered`, `base_currency_code`, `channel_currency_code`, `order_currency_code`, `grand_total`, `base_grand_total`, `grand_total_invoiced`, `base_grand_total_invoiced`, `grand_total_refunded`, `base_grand_total_refunded`, `sub_total`, `base_sub_total`, `sub_total_invoiced`, `base_sub_total_invoiced`, `sub_total_refunded`, `base_sub_total_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `shipping_amount`, `base_shipping_amount`, `shipping_invoiced`, `base_shipping_invoiced`, `shipping_refunded`, `base_shipping_refunded`, `shipping_discount_amount`, `base_shipping_discount_amount`, `shipping_tax_amount`, `base_shipping_tax_amount`, `shipping_tax_refunded`, `base_shipping_tax_refunded`, `sub_total_incl_tax`, `base_sub_total_incl_tax`, `shipping_amount_incl_tax`, `base_shipping_amount_incl_tax`, `customer_id`, `customer_type`, `channel_id`, `channel_type`, `cart_id`, `applied_cart_rule_ids`, `created_at`, `updated_at`) VALUES
(1, '1', 'processing', 'Default', 0, 'zafarhusain.husain02@gmail.com', 'zafar', 'Husain', 'flatrate_flatrate', 'Flat Rate - Flat Rate', 'Flat Rate Shipping', NULL, 0, 2, 9, 'USD', 'USD', 'USD', 218.0000, 218.0000, 218.0000, 218.0000, 0.0000, 0.0000, 128.0000, 128.0000, 128.0000, 128.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 90.0000, 90.0000, 90.0000, 90.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 128.0000, 128.0000, 90.0000, 90.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 1, NULL, '2025-08-07 11:09:42', '2025-08-07 11:30:27'),
(2, '2', 'pending', 'Default', 0, 'zafarhusain.husain02@gmail.com', 'zafar', 'Husain', NULL, NULL, NULL, NULL, 0, 1, 1, 'USD', 'USD', 'USD', 152.0000, 152.0000, 0.0000, 0.0000, 0.0000, 0.0000, 152.0000, 152.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 152.0000, 152.0000, 0.0000, 0.0000, 1, 'Webkul\\Customer\\Models\\Customer', 1, 'Webkul\\Core\\Models\\Channel', 4, NULL, '2025-08-08 14:46:20', '2025-08-08 14:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_comments`
--

CREATE TABLE `order_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `comment` text NOT NULL,
  `customer_notified` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `coupon_code` varchar(255) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT 0.0000,
  `total_weight` decimal(12,4) DEFAULT 0.0000,
  `qty_ordered` int(11) DEFAULT 0,
  `qty_shipped` int(11) DEFAULT 0,
  `qty_invoiced` int(11) DEFAULT 0,
  `qty_canceled` int(11) DEFAULT 0,
  `qty_refunded` int(11) DEFAULT 0,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_invoiced` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_amount_refunded` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_discount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_discount_refunded` decimal(12,4) DEFAULT 0.0000,
  `tax_percent` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_invoiced` decimal(12,4) DEFAULT 0.0000,
  `tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount_refunded` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_category_id` int(10) UNSIGNED DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `sku`, `type`, `name`, `coupon_code`, `weight`, `total_weight`, `qty_ordered`, `qty_shipped`, `qty_invoiced`, `qty_canceled`, `qty_refunded`, `price`, `base_price`, `total`, `base_total`, `total_invoiced`, `base_total_invoiced`, `amount_refunded`, `base_amount_refunded`, `discount_percent`, `discount_amount`, `base_discount_amount`, `discount_invoiced`, `base_discount_invoiced`, `discount_refunded`, `base_discount_refunded`, `tax_percent`, `tax_amount`, `base_tax_amount`, `tax_amount_invoiced`, `base_tax_amount_invoiced`, `tax_amount_refunded`, `base_tax_amount_refunded`, `price_incl_tax`, `base_price_incl_tax`, `total_incl_tax`, `base_total_incl_tax`, `product_id`, `product_type`, `order_id`, `tax_category_id`, `parent_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, 'SP-001', 'simple', 'Arctic Cozy Knit Unisex Beanie', NULL, 1.2300, 6.1500, 5, 0, 5, 0, 0, 12.0000, 12.0000, 60.0000, 60.0000, 60.0000, 60.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 12.0000, 12.0000, 60.0000, 60.0000, 1, 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '{\"cart_id\":1,\"quantity\":5,\"product_id\":1,\"locale\":\"en\"}', '2025-08-07 11:09:43', '2025-08-07 11:30:26'),
(2, 'SP-003', 'simple', 'Arctic Touchscreen Winter Gloves', NULL, 1.0000, 4.0000, 4, 0, 4, 0, 0, 17.0000, 17.0000, 68.0000, 68.0000, 68.0000, 68.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 17.0000, 17.0000, 68.0000, 68.0000, 3, 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, '{\"cart_id\":1,\"product_id\":3,\"quantity\":4,\"locale\":\"en\"}', '2025-08-07 11:09:43', '2025-08-07 11:30:27'),
(3, 'M002', 'virtual', 'Men Regular Fit Solid Spread Collar Casual Shirt', NULL, 0.0000, 0.0000, 1, 0, 0, 0, 0, 152.0000, 152.0000, 152.0000, 152.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 0.0000, 152.0000, 152.0000, 152.0000, 152.0000, 17, 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, '{\"cart_id\":4,\"product_id\":17,\"quantity\":1,\"locale\":\"en\"}', '2025-08-08 14:46:21', '2025-08-08 14:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `order_payment`
--

CREATE TABLE `order_payment` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `method` varchar(255) NOT NULL,
  `method_title` varchar(255) DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_payment`
--

INSERT INTO `order_payment` (`id`, `order_id`, `method`, `method_title`, `additional`, `created_at`, `updated_at`) VALUES
(1, 1, 'cashondelivery', 'Cash On Delivery', NULL, '2025-08-07 11:09:42', '2025-08-07 11:09:42'),
(2, 2, 'cashondelivery', 'Cash On Delivery', NULL, '2025-08-08 14:46:20', '2025-08-08 14:46:20');

-- --------------------------------------------------------

--
-- Table structure for table `order_transactions`
--

CREATE TABLE `order_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `amount` decimal(12,4) DEFAULT 0.0000,
  `payment_method` varchar(255) DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`data`)),
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'Webkul\\Customer\\Models\\Customer', 1, 'customer-token', '75488f01f88247eff383e46af11c3674849e46a53ea7ea45285b8f3939c02ddb', '[\"*\"]', NULL, NULL, '2025-08-07 10:56:37', '2025-08-07 10:56:37'),
(2, 'Webkul\\Customer\\Models\\Customer', 1, 'customer-token', 'ca80b62653cc092c34e98a40101ffdd2a42bf23d8c0cac4e969f2e63421566b3', '[\"*\"]', NULL, NULL, '2025-08-08 14:39:55', '2025-08-08 14:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `sku`, `type`, `parent_id`, `attribute_family_id`, `additional`, `created_at`, `updated_at`) VALUES
(1, 'SP-001', 'simple', NULL, 1, NULL, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(2, 'SP-002', 'simple', NULL, 1, NULL, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(3, 'SP-003', 'simple', NULL, 1, NULL, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(4, 'SP-004', 'simple', NULL, 1, NULL, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(5, 'GP-001', 'grouped', NULL, 1, NULL, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(6, 'BP-001', 'bundle', NULL, 1, NULL, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(13, 'P002', 'virtual', NULL, 1, NULL, '2025-08-07 11:54:10', '2025-08-07 11:54:10'),
(15, 'P004', 'virtual', NULL, 1, NULL, '2025-08-07 12:12:35', '2025-08-07 12:12:35'),
(16, 'M001', 'virtual', NULL, 1, NULL, '2025-08-07 12:52:56', '2025-08-07 12:52:56'),
(17, 'M002', 'virtual', NULL, 1, NULL, '2025-08-07 12:58:02', '2025-08-07 12:58:02'),
(18, 'F004', 'virtual', NULL, 1, NULL, '2025-08-07 13:00:06', '2025-08-07 13:00:06');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute_values`
--

CREATE TABLE `product_attribute_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `text_value` text DEFAULT NULL,
  `boolean_value` tinyint(1) DEFAULT NULL,
  `integer_value` int(11) DEFAULT NULL,
  `float_value` decimal(12,4) DEFAULT NULL,
  `datetime_value` datetime DEFAULT NULL,
  `date_value` date DEFAULT NULL,
  `json_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`json_value`)),
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `unique_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_attribute_values`
--

INSERT INTO `product_attribute_values` (`id`, `locale`, `channel`, `text_value`, `boolean_value`, `integer_value`, `float_value`, `datetime_value`, `date_value`, `json_value`, `product_id`, `attribute_id`, `unique_id`) VALUES
(1, NULL, NULL, 'SP-001', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '1|1'),
(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 27, '1|27'),
(3, 'en', NULL, 'Arctic Cozy Knit Unisex Beanie', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 'en|1|2'),
(4, 'en', NULL, 'Embrace the chilly days in style with our Arctic Cozy Knit Beanie. Crafted from a soft and durable blend of acrylic, this classic beanie offers warmth and versatility. Suitable for both men and women, it\'s the ideal accessory for casual or outdoor wear. Elevate your winter wardrobe or gift someone special with this essential beanie cap.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 9, 'en|1|9'),
(5, 'en', NULL, 'The Arctic Cozy Knit Beanie is your go-to solution for staying warm, comfortable, and stylish during the colder months. Crafted from a soft and durable blend of acrylic knit, this beanie is designed to provide a cozy and snug fit. The classic design makes it suitable for both men and women, offering a versatile accessory that complements various styles. Whether you\'re heading out for a casual day in town or embracing the great outdoors, this beanie adds a touch of comfort and warmth to your ensemble. The soft and breathable material ensures that you stay cozy without sacrificing style. The Arctic Cozy Knit Beanie isn\'t just an accessory; it\'s a statement of winter fashion. Its simplicity makes it easy to pair with different outfits, making it a staple in your winter wardrobe. Ideal for gifting or as a treat for yourself, this beanie is a thoughtful addition to any winter ensemble. It\'s a versatile accessory that goes beyond functionality, adding a touch of warmth and style to your look. Embrace the essence of winter with the Arctic Cozy Knit Beanie. Whether you\'re enjoying a casual day out or facing the elements, let this beanie be your companion for comfort and style. Elevate your winter wardrobe with this classic accessory that effortlessly combines warmth with a timeless sense of fashion.', NULL, NULL, NULL, NULL, NULL, NULL, 1, 10, 'en|1|10'),
(6, 'en', NULL, 'arctic-cozy-knit-unisex-beanie', NULL, NULL, NULL, NULL, NULL, NULL, 1, 3, 'en|1|3'),
(7, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 5, '1|5'),
(8, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 6, '1|6'),
(9, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 8, 'default|1|8'),
(10, 'en', NULL, 'Meta Title', NULL, NULL, NULL, NULL, NULL, NULL, 1, 16, 'en|1|16'),
(11, 'en', NULL, 'meta1, meta2, meta3', NULL, NULL, NULL, NULL, NULL, NULL, 1, 17, 'en|1|17'),
(12, 'en', NULL, 'meta description', NULL, NULL, NULL, NULL, NULL, NULL, 1, 18, 'en|1|18'),
(13, NULL, NULL, NULL, NULL, NULL, 14.0000, NULL, NULL, NULL, 1, 11, '1|11'),
(14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 13, '1|13'),
(15, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 14, 'default|1|14'),
(16, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 15, 'default|1|15'),
(17, NULL, NULL, '1.23', NULL, NULL, NULL, NULL, NULL, NULL, 1, 22, '1|22'),
(18, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 1, 7, '1|7'),
(19, NULL, NULL, 'SP-002', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, '2|1'),
(20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 27, '2|27'),
(21, 'en', NULL, 'Arctic Bliss Stylish Winter Scarf', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 'en|2|2'),
(22, 'en', NULL, 'Experience the embrace of warmth and style with our Arctic Bliss Winter Scarf. Crafted from a luxurious blend of acrylic and wool, this cozy scarf is designed to keep you snug during the coldest days. Its stylish and versatile design, combined with an extra-long length, offers customizable styling options. Elevate your winter wardrobe or delight someone special with this essential winter accessory.', NULL, NULL, NULL, NULL, NULL, NULL, 2, 9, 'en|2|9'),
(23, 'en', NULL, 'The Arctic Bliss Winter Scarf is more than just a cold-weather accessory; it\'s a statement of warmth, comfort, and style for the winter season. Crafted with care from a luxurious blend of acrylic and wool, this scarf is designed to keep you cozy and snug even in the chilliest temperatures. The soft and plush texture not only provides insulation against the cold but also adds a touch of luxury to your winter wardrobe. The design of the Arctic Bliss Winter Scarf is both stylish and versatile, making it a perfect addition to a variety of winter outfits. Whether you\'re dressing up for a special occasion or adding a chic layer to your everyday look, this scarf complements your style effortlessly. The extra-long length of the scarf offers customizable styling options. Wrap it around for added warmth, drape it loosely for a casual look, or experiment with different knots to express your unique style. This versatility makes it a must-have accessory for the winter season. Looking for the perfect gift? The Arctic Bliss Winter Scarf is an ideal choice. Whether you\'re surprising a loved one or treating yourself, this scarf is a timeless and practical gift that will be cherished throughout the winter months. Embrace the winter with the Arctic Bliss Winter Scarf, where warmth meets style in perfect harmony. Elevate your winter wardrobe with this essential accessory that not only keeps you warm but also adds a touch of sophistication to your cold-weather ensemble.', NULL, NULL, NULL, NULL, NULL, NULL, 2, 10, 'en|2|10'),
(24, 'en', NULL, 'arctic-bliss-stylish-winter-scarf', NULL, NULL, NULL, NULL, NULL, NULL, 2, 3, 'en|2|3'),
(25, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 5, '2|5'),
(26, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 6, '2|6'),
(27, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 8, 'default|2|8'),
(28, 'en', NULL, 'Meta Title', NULL, NULL, NULL, NULL, NULL, NULL, 2, 16, 'en|2|16'),
(29, 'en', NULL, 'meta1, meta2, meta3', NULL, NULL, NULL, NULL, NULL, NULL, 2, 17, 'en|2|17'),
(30, 'en', NULL, 'meta description', NULL, NULL, NULL, NULL, NULL, NULL, 2, 18, 'en|2|18'),
(31, NULL, NULL, NULL, NULL, NULL, 17.0000, NULL, NULL, NULL, 2, 11, '2|11'),
(32, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 13, '2|13'),
(33, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 14, 'default|2|14'),
(34, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 15, 'default|2|15'),
(35, NULL, NULL, '1.23', NULL, NULL, NULL, NULL, NULL, NULL, 2, 22, '2|22'),
(36, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 2, 7, '2|7'),
(37, NULL, NULL, 'SP-003', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, '3|1'),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 27, '3|27'),
(39, 'en', NULL, 'Arctic Touchscreen Winter Gloves', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 'en|3|2'),
(40, 'en', NULL, 'Stay connected and warm with our Arctic Touchscreen Winter Gloves. These gloves are not only crafted from high-quality acrylic for warmth and durability but also feature a touchscreen-compatible design. With an insulated lining, elastic cuffs for a secure fit, and a stylish look, these gloves are perfect for daily wear in chilly conditions.', NULL, NULL, NULL, NULL, NULL, NULL, 3, 9, 'en|3|9'),
(41, 'en', NULL, 'Introducing the Arctic Touchscreen Winter Gloves – where warmth, style, and connectivity meet to enhance your winter experience. Crafted from high-quality acrylic, these gloves are designed to provide exceptional warmth and durability. The touchscreen-compatible fingertips allow you to stay connected without exposing your hands to the cold. Answer calls, send messages, and navigate your devices effortlessly, all while keeping your hands snug. The insulated lining adds an extra layer of coziness, making these gloves your go-to choice for facing the winter chill. Whether you\'re commuting, running errands, or enjoying outdoor activities, these gloves provide the warmth and protection you need. Elastic cuffs ensure a secure fit, preventing cold drafts and keeping the gloves in place during your daily activities. The stylish design adds a touch of flair to your winter ensemble, making these gloves as fashionable as they are functional. Ideal for gifting or as a treat for yourself, the Arctic Touchscreen Winter Gloves are a must-have accessory for the modern individual. Say goodbye to the inconvenience of removing your gloves to use your devices and embrace the seamless blend of warmth, style, and connectivity. Stay connected, stay warm, and stay stylish with the Arctic Touchscreen Winter Gloves – your reliable companion for conquering the winter season with confidence.', NULL, NULL, NULL, NULL, NULL, NULL, 3, 10, 'en|3|10'),
(42, 'en', NULL, 'arctic-touchscreen-winter-gloves', NULL, NULL, NULL, NULL, NULL, NULL, 3, 3, 'en|3|3'),
(43, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 5, '3|5'),
(44, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 6, '3|6'),
(45, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 8, 'default|3|8'),
(46, 'en', NULL, 'Meta Title', NULL, NULL, NULL, NULL, NULL, NULL, 3, 16, 'en|3|16'),
(47, 'en', NULL, 'meta1, meta2, meta3', NULL, NULL, NULL, NULL, NULL, NULL, 3, 17, 'en|3|17'),
(48, 'en', NULL, 'meta description', NULL, NULL, NULL, NULL, NULL, NULL, 3, 18, 'en|3|18'),
(49, NULL, NULL, NULL, NULL, NULL, 21.0000, NULL, NULL, NULL, 3, 11, '3|11'),
(50, NULL, NULL, NULL, NULL, NULL, 17.0000, NULL, NULL, NULL, 3, 13, '3|13'),
(51, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-08-07', NULL, 3, 14, 'default|3|14'),
(52, NULL, 'default', NULL, NULL, NULL, NULL, NULL, '2025-08-08', NULL, 3, 15, 'default|3|15'),
(53, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 3, 22, '3|22'),
(54, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 3, 7, '3|7'),
(55, NULL, NULL, 'SP-004', NULL, NULL, NULL, NULL, NULL, NULL, 4, 1, '4|1'),
(56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 27, '4|27'),
(57, 'en', NULL, 'Arctic Warmth Wool Blend Socks', NULL, NULL, NULL, NULL, NULL, NULL, 4, 2, 'en|4|2'),
(58, 'en', NULL, 'Experience the unmatched warmth and comfort of our Arctic Warmth Wool Blend Socks. Crafted from a blend of Merino wool, acrylic, nylon, and spandex, these socks offer ultimate coziness for cold weather. With a reinforced heel and toe for durability, these versatile and stylish socks are perfect for various occasions.', NULL, NULL, NULL, NULL, NULL, NULL, 4, 9, 'en|4|9'),
(59, 'en', NULL, 'Introducing the Arctic Warmth Wool Blend Socks – your essential companion for cozy and comfortable feet during the colder seasons. Crafted from a premium blend of Merino wool, acrylic, nylon, and spandex, these socks are designed to provide unparalleled warmth and comfort. The wool blend ensures that your feet stay toasty even in the coldest temperatures, making these socks the perfect choice for winter adventures or simply staying snug at home. The soft and cozy texture of the socks offers a luxurious feel against your skin. Say goodbye to chilly feet as you embrace the plush warmth provided by these wool blend socks. Designed for durability, the socks feature a reinforced heel and toe, adding extra strength to high-wear areas. This ensures that your socks withstand the test of time, providing long-lasting comfort and coziness. The breathable nature of the material prevents overheating, allowing your feet to stay comfortable and dry throughout the day. Whether you\'re heading outdoors for a winter hike or relaxing indoors, these socks offer the perfect balance of warmth and breathability. Versatile and stylish, these wool blend socks are suitable for various occasions. Pair them with your favorite boots for a fashionable winter look or wear them around the house for ultimate comfort. Elevate your winter wardrobe and prioritize comfort with the Arctic Warmth Wool Blend Socks. Treat your feet to the luxury they deserve and step into a world of coziness that lasts all season long.', NULL, NULL, NULL, NULL, NULL, NULL, 4, 10, 'en|4|10'),
(60, 'en', NULL, 'arctic-warmth-wool-blend-socks', NULL, NULL, NULL, NULL, NULL, NULL, 4, 3, 'en|4|3'),
(61, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 5, '4|5'),
(62, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 4, 6, '4|6'),
(63, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 8, 'default|4|8'),
(64, 'en', NULL, 'Meta Title', NULL, NULL, NULL, NULL, NULL, NULL, 4, 16, 'en|4|16'),
(65, 'en', NULL, 'meta1, meta2, meta3', NULL, NULL, NULL, NULL, NULL, NULL, 4, 17, 'en|4|17'),
(66, 'en', NULL, 'meta description', NULL, NULL, NULL, NULL, NULL, NULL, 4, 18, 'en|4|18'),
(67, NULL, NULL, NULL, NULL, NULL, 21.0000, NULL, NULL, NULL, 4, 11, '4|11'),
(68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 13, '4|13'),
(69, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 14, 'default|4|14'),
(70, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 15, 'default|4|15'),
(71, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 4, 22, '4|22'),
(72, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 4, 7, '4|7'),
(73, NULL, NULL, 'GP-001', NULL, NULL, NULL, NULL, NULL, NULL, 5, 1, '5|1'),
(74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 27, '5|27'),
(75, 'en', NULL, 'Arctic Frost Winter Accessories', NULL, NULL, NULL, NULL, NULL, NULL, 5, 2, 'en|5|2'),
(76, 'en', NULL, 'Embrace the winter chill with our Arctic Frost Winter Accessories Bundle. This curated set includes a luxurious scarf, a cozy beanie, touchscreen-compatible gloves and wool Blend Socks. Stylish and functional, this ensemble is crafted from high-quality materials, ensuring both durability and comfort. Elevate your winter wardrobe or delight someone special with this perfect gifting option.', NULL, NULL, NULL, NULL, NULL, NULL, 5, 9, 'en|5|9'),
(77, 'en', NULL, 'Introducing the Arctic Frost Winter Accessories Bundle, your go-to solution for staying warm, stylish, and connected during the chilly winter days. This thoughtfully curated set brings together Four essential winter accessories to create a harmonious ensemble. The luxurious scarf, woven from a blend of acrylic and wool, not only adds a layer of warmth but also brings a touch of elegance to your winter wardrobe. The soft knit beanie, crafted with care, promises to keep you cozy while adding a fashionable flair to your look. But it doesn\'t end there – our bundle also includes touchscreen-compatible gloves. Stay connected without sacrificing warmth as you navigate your devices effortlessly. Whether you\'re answering calls, sending messages, or capturing winter moments on your smartphone, these gloves ensure convenience without compromising style. The soft and cozy texture of the socks offers a luxurious feel against your skin. Say goodbye to chilly feet as you embrace the plush warmth provided by these wool blend socks. The Arctic Frost Winter Accessories Bundle is not just about functionality; it\'s a statement of winter fashion. Each piece is designed not only to protect you from the cold but also to elevate your style during the frosty season. The materials chosen for this bundle prioritize both durability and comfort, ensuring that you can enjoy the winter wonderland in style. Whether you\'re treating yourself or searching for the perfect gift, the Arctic Frost Winter Accessories Bundle is a versatile choice. Delight someone special during the holiday season or elevate your own winter wardrobe with this stylish and functional ensemble. Embrace the frost with confidence, knowing that you have the perfect accessories to keep you warm and chic.', NULL, NULL, NULL, NULL, NULL, NULL, 5, 10, 'en|5|10'),
(78, 'en', NULL, 'arctic-frost-winter-accessories', NULL, NULL, NULL, NULL, NULL, NULL, 5, 3, 'en|5|3'),
(79, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 5, '5|5'),
(80, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 5, 6, '5|6'),
(81, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 8, 'default|5|8'),
(82, 'en', NULL, 'Meta Title', NULL, NULL, NULL, NULL, NULL, NULL, 5, 16, 'en|5|16'),
(83, 'en', NULL, 'meta1, meta2, meta3', NULL, NULL, NULL, NULL, NULL, NULL, 5, 17, 'en|5|17'),
(84, 'en', NULL, 'meta description', NULL, NULL, NULL, NULL, NULL, NULL, 5, 18, 'en|5|18'),
(85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 11, '5|11'),
(86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 13, '5|13'),
(87, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 14, 'default|5|14'),
(88, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, 15, 'default|5|15'),
(89, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 5, 22, '5|22'),
(90, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 5, 7, '5|7'),
(91, NULL, NULL, 'BP-001', NULL, NULL, NULL, NULL, NULL, NULL, 6, 1, '6|1'),
(92, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 27, '6|27'),
(93, 'en', NULL, 'Arctic Frost Winter Accessories Bundle', NULL, NULL, NULL, NULL, NULL, NULL, 6, 2, 'en|6|2'),
(94, 'en', NULL, 'Embrace the winter chill with our Arctic Frost Winter Accessories Bundle. This curated set includes a luxurious scarf, a cozy beanie, touchscreen-compatible gloves and wool Blend Socks. Stylish and functional, this ensemble is crafted from high-quality materials, ensuring both durability and comfort. Elevate your winter wardrobe or delight someone special with this perfect gifting option.', NULL, NULL, NULL, NULL, NULL, NULL, 6, 9, 'en|6|9'),
(95, 'en', NULL, 'Introducing the Arctic Frost Winter Accessories Bundle, your go-to solution for staying warm, stylish, and connected during the chilly winter days. This thoughtfully curated set brings together Four essential winter accessories to create a harmonious ensemble. The luxurious scarf, woven from a blend of acrylic and wool, not only adds a layer of warmth but also brings a touch of elegance to your winter wardrobe. The soft knit beanie, crafted with care, promises to keep you cozy while adding a fashionable flair to your look. But it doesn\'t end there – our bundle also includes touchscreen-compatible gloves. Stay connected without sacrificing warmth as you navigate your devices effortlessly. Whether you\'re answering calls, sending messages, or capturing winter moments on your smartphone, these gloves ensure convenience without compromising style. The soft and cozy texture of the socks offers a luxurious feel against your skin. Say goodbye to chilly feet as you embrace the plush warmth provided by these wool blend socks. The Arctic Frost Winter Accessories Bundle is not just about functionality; it\'s a statement of winter fashion. Each piece is designed not only to protect you from the cold but also to elevate your style during the frosty season. The materials chosen for this bundle prioritize both durability and comfort, ensuring that you can enjoy the winter wonderland in style. Whether you\'re treating yourself or searching for the perfect gift, the Arctic Frost Winter Accessories Bundle is a versatile choice. Delight someone special during the holiday season or elevate your own winter wardrobe with this stylish and functional ensemble. Embrace the frost with confidence, knowing that you have the perfect accessories to keep you warm and chic.', NULL, NULL, NULL, NULL, NULL, NULL, 6, 10, 'en|6|10'),
(96, 'en', NULL, 'arctic-frost-winter-accessories-bundle', NULL, NULL, NULL, NULL, NULL, NULL, 6, 3, 'en|6|3'),
(97, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 5, '6|5'),
(98, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 6, 6, '6|6'),
(99, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 8, 'default|6|8'),
(100, 'en', NULL, 'Meta Title', NULL, NULL, NULL, NULL, NULL, NULL, 6, 16, 'en|6|16'),
(101, 'en', NULL, 'meta1, meta2, meta3', NULL, NULL, NULL, NULL, NULL, NULL, 6, 17, 'en|6|17'),
(102, 'en', NULL, 'meta description', NULL, NULL, NULL, NULL, NULL, NULL, 6, 18, 'en|6|18'),
(103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 11, '6|11'),
(104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 13, '6|13'),
(105, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 14, 'default|6|14'),
(106, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 6, 15, 'default|6|15'),
(107, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, 6, 22, '6|22'),
(108, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 6, 7, '6|7'),
(229, 'en', NULL, '<div class=\"_9GQWrZ\">Delicate Pattern</div>\r\n<div class=\"AoD2-N\">\r\n<p>Showcasing a delicate floral printed pattern, this women&rsquo;s dress brings an elegant and ageless touch to your wardrobe. The attractive flowers create a lively look, while the strategic arrangement adds visual interest. Thus, ideal for various occasions, the print enhances the overall appeal of this dress, offering a stylish and fresh appearance.</p>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 9, 'en|13|9'),
(230, 'en', NULL, '<div class=\"_9GQWrZ\">Important Details</div>\r\n<div class=\"AoD2-N\">\r\n<p>Sporting a U-neckline and short, flared sleeves, this dress delivers a chic yet comfortable fit. The U-neckline provides a balanced and flattering look, while the practical length adds a sense of sophistication. The flared sleeves offer convenient coverage while maintaining a light and airy feel. Furthermore, the fit-and-flare silhouette with a tie-up detail enhances this dress&rsquo;s flow, allowing both adjustability and freedom of movement.</p>\r\n</div>', NULL, NULL, NULL, NULL, NULL, NULL, 13, 10, 'en|13|10'),
(231, NULL, NULL, 'P002', NULL, NULL, NULL, NULL, NULL, NULL, 13, 1, '13|1'),
(232, 'en', NULL, 'Women Fit and Flare Pink, Grey, Red Maxi/Full Length Dress', NULL, NULL, NULL, NULL, NULL, NULL, 13, 2, 'en|13|2'),
(233, 'en', NULL, 'women-fit-and-flare-pink-grey-red-maxifull-length-dress', NULL, NULL, NULL, NULL, NULL, NULL, 13, 3, 'en|13|3'),
(234, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 13, 23, '13|23'),
(235, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 13, 24, '13|24'),
(236, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 27, '13|27'),
(237, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 28, 'default|13|28'),
(238, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 16, 'en|13|16'),
(239, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 17, 'en|13|17'),
(240, 'en', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 13, 18, 'en|13|18'),
(241, NULL, NULL, NULL, NULL, NULL, 350.0000, NULL, NULL, NULL, 13, 11, '13|11'),
(242, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 12, '13|12'),
(243, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 13, '13|13'),
(244, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 14, 'default|13|14'),
(245, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 13, 15, 'default|13|15'),
(246, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 5, '13|5'),
(247, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 6, '13|6'),
(248, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 7, '13|7'),
(249, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 8, 'default|13|8'),
(250, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 13, 26, '13|26'),
(273, 'en', NULL, '<p>Tanip- This Casual Shirt has a Standard collar , long sleeves with button cuffs , full buttoned placket on the front, yoke on the back, curved hem. Pair this along with a good pair of denim or chinos and loafers / Espadrilles for a Sharp and Dapper look .This material comes with 100 % Premium Cotton.Cotton rich fabric for crisp Casual look.Wash care : Machine Wash/Hand Wash. Fit - Regular Fit.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 9, 'en|15|9'),
(274, 'en', NULL, '<p>Tanip- This Casual Shirt has a Standard collar , long sleeves with button cuffs , full buttoned placket on the front, yoke on the back, curved hem. Pair this along with a good pair of denim or chinos and loafers / Espadrilles for a Sharp and Dapper look .This material comes with 100 % Premium Cotton.Cotton rich fabric for crisp Casual look.Wash care : Machine Wash/Hand Wash. Fit - Regular Fit.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 15, 10, 'en|15|10'),
(275, NULL, NULL, 'P004', NULL, NULL, NULL, NULL, NULL, NULL, 15, 1, '15|1'),
(276, 'en', NULL, 'Men Slim Fit Checkered Spread Collar Casual Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 15, 2, 'en|15|2'),
(277, 'en', NULL, 'men-slim-fit-checkered-spread-collar-casual-shirt', NULL, NULL, NULL, NULL, NULL, NULL, 15, 3, 'en|15|3'),
(278, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 15, 23, '15|23'),
(279, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 15, 24, '15|24'),
(280, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 15, 27, '15|27'),
(281, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 28, 'default|15|28'),
(282, 'en', NULL, 'Men Slim Fit Checkered Spread Collar Casual Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 15, 16, 'en|15|16'),
(283, 'en', NULL, 'Men Slim Fit Checkered Spread Collar Casual Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 15, 17, 'en|15|17'),
(284, 'en', NULL, 'Men Slim Fit Checkered Spread Collar Casual Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 15, 18, 'en|15|18'),
(285, NULL, NULL, NULL, NULL, NULL, 250.0000, NULL, NULL, NULL, 15, 11, '15|11'),
(286, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 12, '15|12'),
(287, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 13, '15|13'),
(288, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 14, 'default|15|14'),
(289, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 15, 15, 'default|15|15'),
(290, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 5, '15|5'),
(291, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 6, '15|6'),
(292, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 7, '15|7'),
(293, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 8, 'default|15|8'),
(294, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 15, 26, '15|26'),
(295, 'en', NULL, '<p>Step into sophistication and style with Gibbonte\'s Men\'s Lycra Blend Stylish Slim Fit Trousers, the epitome of modern elegance designed for both office and party settings. Crafted with meticulous attention to detail, these trousers boast a slim-fit silhouette that accentuates your physique, providing a sleek and contemporary look that sets you apart from the crowd. Whether you\'re attending a formal business meeting or enjoying a night out with friends, these trousers are your ultimate wardrobe staple, effortlessly blending versatility with sophistication. The slim-fit design of these trousers ensures a tailored appearance, embracing your legs with precision to create a streamlined silhouette that exudes confidence and charm. Featuring belt loops, they offer practicality and refinement, allowing you to effortlessly accessorize with a belt while maintaining a polished ensemble, especially when paired with shirts that require tucking in. Crafted from a premium Lycra blend material, these trousers deliver on both style and comfort. The cotton blend fabric offers durability, ensuring longevity for everyday wear, while the added Lycra provides stretch and flexibility, allowing for unrestricted movement and all-day comfort. Their soft and breathable quality keeps you cool and dry, even during sweltering conditions, making them ideal for extended wear. Not only do these trousers prioritize style and comfort, but they also excel in convenience. Their machine-wash-friendly nature simplifies maintenance, allowing for easy cleaning after each wear, saving you time and effort in your daily routine.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 9, 'en|16|9'),
(296, 'en', NULL, '<p>Step into sophistication and style with Gibbonte\'s Men\'s Lycra Blend Stylish Slim Fit Trousers, the epitome of modern elegance designed for both office and party settings. Crafted with meticulous attention to detail, these trousers boast a slim-fit silhouette that accentuates your physique, providing a sleek and contemporary look that sets you apart from the crowd. Whether you\'re attending a formal business meeting or enjoying a night out with friends, these trousers are your ultimate wardrobe staple, effortlessly blending versatility with sophistication. The slim-fit design of these trousers ensures a tailored appearance, embracing your legs with precision to create a streamlined silhouette that exudes confidence and charm. Featuring belt loops, they offer practicality and refinement, allowing you to effortlessly accessorize with a belt while maintaining a polished ensemble, especially when paired with shirts that require tucking in. Crafted from a premium Lycra blend material, these trousers deliver on both style and comfort. The cotton blend fabric offers durability, ensuring longevity for everyday wear, while the added Lycra provides stretch and flexibility, allowing for unrestricted movement and all-day comfort. Their soft and breathable quality keeps you cool and dry, even during sweltering conditions, making them ideal for extended wear. Not only do these trousers prioritize style and comfort, but they also excel in convenience. Their machine-wash-friendly nature simplifies maintenance, allowing for easy cleaning after each wear, saving you time and effort in your daily routine.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 16, 10, 'en|16|10'),
(297, NULL, NULL, 'M001', NULL, NULL, NULL, NULL, NULL, NULL, 16, 1, '16|1'),
(298, 'en', NULL, 'Men Slim Fit Blue Lycra Blend Trousers', NULL, NULL, NULL, NULL, NULL, NULL, 16, 2, 'en|16|2'),
(299, 'en', NULL, 'men-slim-fit-blue-lycra-blend-trousers', NULL, NULL, NULL, NULL, NULL, NULL, 16, 3, 'en|16|3'),
(300, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 16, 23, '16|23'),
(301, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 16, 24, '16|24'),
(302, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 16, 27, '16|27'),
(303, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 28, 'default|16|28'),
(304, 'en', NULL, 'Men Slim Fit Blue Lycra Blend Trousers', NULL, NULL, NULL, NULL, NULL, NULL, 16, 16, 'en|16|16'),
(305, 'en', NULL, 'Men Slim Fit Blue Lycra Blend Trousers', NULL, NULL, NULL, NULL, NULL, NULL, 16, 17, 'en|16|17'),
(306, 'en', NULL, 'Men Slim Fit Blue Lycra Blend Trousers', NULL, NULL, NULL, NULL, NULL, NULL, 16, 18, 'en|16|18'),
(307, NULL, NULL, NULL, NULL, NULL, 295.0000, NULL, NULL, NULL, 16, 11, '16|11'),
(308, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 12, '16|12'),
(309, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 13, '16|13'),
(310, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 14, 'default|16|14'),
(311, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 16, 15, 'default|16|15'),
(312, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 5, '16|5'),
(313, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 6, '16|6'),
(314, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 7, '16|7'),
(315, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 8, 'default|16|8'),
(316, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 16, 26, '16|26'),
(317, 'en', NULL, '<p>This shirts is one of the top selling product from premium quality shirts collection exclusively manufactured by METRONAUT brand. Long lasting fabric and trendy colors make it evergreen for casual and formal usage. You can use it on jeans as well as it is appropriate as formal office wear. Acurate stitching by skilled workers gives it authentic classic look. You will love to wear it for multi purpose use as shirts boys men, shirt for men look, shirts for men stylish, formal shirt, shirts for men stylish look branded.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 9, 'en|17|9'),
(318, 'en', NULL, '<p>This shirts is one of the top selling product from premium quality shirts collection exclusively manufactured by METRONAUT brand. Long lasting fabric and trendy colors make it evergreen for casual and formal usage. You can use it on jeans as well as it is appropriate as formal office wear. Acurate stitching by skilled workers gives it authentic classic look. You will love to wear it for multi purpose use as shirts boys men, shirt for men look, shirts for men stylish, formal shirt, shirts for men stylish look branded.</p>', NULL, NULL, NULL, NULL, NULL, NULL, 17, 10, 'en|17|10'),
(319, NULL, NULL, 'M002', NULL, NULL, NULL, NULL, NULL, NULL, 17, 1, '17|1'),
(320, 'en', NULL, 'Men Regular Fit Solid Spread Collar Casual Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 17, 2, 'en|17|2'),
(321, 'en', NULL, 'men-regular-fit-solid-spread-collar-casual-shirt', NULL, NULL, NULL, NULL, NULL, NULL, 17, 3, 'en|17|3'),
(322, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 17, 23, '17|23'),
(323, NULL, NULL, NULL, NULL, 7, NULL, NULL, NULL, NULL, 17, 24, '17|24'),
(324, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 17, 27, '17|27'),
(325, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 28, 'default|17|28'),
(326, 'en', NULL, 'Men Regular Fit Solid Spread Collar Casual Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 17, 16, 'en|17|16'),
(327, 'en', NULL, 'Men Regular Fit Solid Spread Collar Casual Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 17, 17, 'en|17|17'),
(328, 'en', NULL, 'Men Regular Fit Solid Spread Collar Casual Shirt', NULL, NULL, NULL, NULL, NULL, NULL, 17, 18, 'en|17|18'),
(329, NULL, NULL, NULL, NULL, NULL, 152.0000, NULL, NULL, NULL, 17, 11, '17|11'),
(330, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 12, '17|12'),
(331, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 13, '17|13'),
(332, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 14, 'default|17|14'),
(333, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 17, 15, 'default|17|15'),
(334, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 5, '17|5'),
(335, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 6, '17|6'),
(336, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 7, '17|7'),
(337, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 8, 'default|17|8'),
(338, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 17, 26, '17|26'),
(339, 'en', NULL, '<p>Presenting a full-length gown design, this dress exudes elegance and sophistication. The gown silhouette elongates the figure, creating a graceful and timeless look. The full-length style adds a touch of glamour, making it suitable for special occasions where a more formal or dressed-up attire is desired. The flowing lines of the gown not only contribute to the overall aesthetic but also allow for freedom of movement</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 9, 'en|18|9'),
(340, 'en', NULL, '<p>Presenting a full-length gown design, this dress exudes elegance and sophistication. The gown silhouette elongates the figure, creating a graceful and timeless look. The full-length style adds a touch of glamour, making it suitable for special occasions where a more formal or dressed-up attire is desired. The flowing lines of the gown not only contribute to the overall aesthetic but also allow for freedom of movement</p>', NULL, NULL, NULL, NULL, NULL, NULL, 18, 10, 'en|18|10'),
(341, NULL, NULL, 'F004', NULL, NULL, NULL, NULL, NULL, NULL, 18, 1, '18|1'),
(342, 'en', NULL, 'Women Fit and Flare Blue Ankle Length Dress', NULL, NULL, NULL, NULL, NULL, NULL, 18, 2, 'en|18|2'),
(343, 'en', NULL, 'women-fit-and-flare-blue-ankle-length-dress', NULL, NULL, NULL, NULL, NULL, NULL, 18, 3, 'en|18|3'),
(344, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 18, 23, '18|23'),
(345, NULL, NULL, NULL, NULL, 8, NULL, NULL, NULL, NULL, 18, 24, '18|24'),
(346, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, 18, 27, '18|27'),
(347, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 28, 'default|18|28'),
(348, 'en', NULL, 'Women Fit and Flare Blue Ankle Length Dress', NULL, NULL, NULL, NULL, NULL, NULL, 18, 16, 'en|18|16'),
(349, 'en', NULL, 'Women Fit and Flare Blue Ankle Length Dress', NULL, NULL, NULL, NULL, NULL, NULL, 18, 17, 'en|18|17'),
(350, 'en', NULL, 'Women Fit and Flare Blue Ankle Length Dress', NULL, NULL, NULL, NULL, NULL, NULL, 18, 18, 'en|18|18'),
(351, NULL, NULL, NULL, NULL, NULL, 222.0000, NULL, NULL, NULL, 18, 11, '18|11'),
(352, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 12, '18|12'),
(353, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 13, '18|13'),
(354, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 14, 'default|18|14'),
(355, NULL, 'default', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 18, 15, 'default|18|15'),
(356, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 5, '18|5'),
(357, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 6, '18|6'),
(358, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 7, '18|7'),
(359, NULL, 'default', NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 8, 'default|18|8'),
(360, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 18, 26, '18|26');

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_options`
--

CREATE TABLE `product_bundle_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_bundle_options`
--

INSERT INTO `product_bundle_options` (`id`, `product_id`, `type`, `is_required`, `sort_order`) VALUES
(1, 6, 'radio', 1, 0),
(2, 6, 'radio', 1, 1),
(3, 6, 'checkbox', 1, 2),
(4, 6, 'checkbox', 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_products`
--

CREATE TABLE `product_bundle_option_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `product_bundle_option_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `is_user_defined` tinyint(1) NOT NULL DEFAULT 1,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_bundle_option_products`
--

INSERT INTO `product_bundle_option_products` (`id`, `product_id`, `product_bundle_option_id`, `qty`, `is_user_defined`, `is_default`, `sort_order`) VALUES
(1, 1, 1, 1, 1, 0, 0),
(2, 2, 2, 2, 1, 1, 1),
(3, 3, 3, 1, 1, 1, 2),
(4, 4, 4, 2, 1, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_bundle_option_translations`
--

CREATE TABLE `product_bundle_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `product_bundle_option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_bundle_option_translations`
--

INSERT INTO `product_bundle_option_translations` (`id`, `locale`, `label`, `product_bundle_option_id`) VALUES
(1, 'en', 'Bundle Option 1', 1),
(2, 'en', 'Bundle Option 1', 2),
(3, 'en', 'Bundle Option 2', 3),
(4, 'en', 'Bundle Option 2', 4);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`product_id`, `category_id`) VALUES
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(6, 3),
(13, 4),
(13, 7),
(13, 8),
(15, 2),
(15, 3),
(16, 2),
(16, 6),
(17, 2),
(17, 3),
(17, 5),
(18, 4),
(18, 7),
(18, 8);

-- --------------------------------------------------------

--
-- Table structure for table `product_channels`
--

CREATE TABLE `product_channels` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_channels`
--

INSERT INTO `product_channels` (`product_id`, `channel_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(13, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_cross_sells`
--

CREATE TABLE `product_cross_sells` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_cross_sells`
--

INSERT INTO `product_cross_sells` (`parent_id`, `child_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 4),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_customer_group_prices`
--

CREATE TABLE `product_customer_group_prices` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `value_type` varchar(255) NOT NULL,
  `value` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unique_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_customer_group_prices`
--

INSERT INTO `product_customer_group_prices` (`id`, `qty`, `value_type`, `value`, `product_id`, `customer_group_id`, `created_at`, `updated_at`, `unique_id`) VALUES
(1, 2, 'fixed', 12.0000, 1, 1, '2025-08-07 04:02:50', '2025-08-07 04:02:50', '002|1|1'),
(2, 2, 'fixed', 12.0000, 1, 2, '2025-08-07 04:02:50', '2025-08-07 04:02:50', '002|1|2'),
(3, 2, 'fixed', 12.0000, 1, 3, '2025-08-07 04:02:50', '2025-08-07 04:02:50', '002|1|3'),
(4, 3, 'fixed', 50.0000, 1, 1, '2025-08-07 04:02:50', '2025-08-07 04:02:50', '003|1|1'),
(5, 3, 'fixed', 50.0000, 1, 2, '2025-08-07 04:02:50', '2025-08-07 04:02:50', '003|1|2'),
(6, 3, 'fixed', 50.0000, 1, 3, '2025-08-07 04:02:50', '2025-08-07 04:02:50', '003|1|3');

-- --------------------------------------------------------

--
-- Table structure for table `product_customizable_options`
--

CREATE TABLE `product_customizable_options` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL,
  `is_required` tinyint(1) NOT NULL DEFAULT 1,
  `max_characters` text DEFAULT NULL,
  `supported_file_extensions` text DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_customizable_option_prices`
--

CREATE TABLE `product_customizable_option_prices` (
  `id` int(10) UNSIGNED NOT NULL,
  `label` text DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_customizable_option_id` int(10) UNSIGNED NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_customizable_option_translations`
--

CREATE TABLE `product_customizable_option_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `label` text DEFAULT NULL,
  `product_customizable_option_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_links`
--

CREATE TABLE `product_downloadable_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sample_url` varchar(255) DEFAULT NULL,
  `sample_file` varchar(255) DEFAULT NULL,
  `sample_file_name` varchar(255) DEFAULT NULL,
  `sample_type` varchar(255) DEFAULT NULL,
  `downloads` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_link_translations`
--

CREATE TABLE `product_downloadable_link_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_downloadable_link_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_samples`
--

CREATE TABLE `product_downloadable_samples` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `sort_order` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_downloadable_sample_translations`
--

CREATE TABLE `product_downloadable_sample_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_downloadable_sample_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `title` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_flat`
--

CREATE TABLE `product_flat` (
  `id` int(10) UNSIGNED NOT NULL,
  `sku` varchar(255) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `product_number` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `short_description` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url_key` varchar(255) DEFAULT NULL,
  `new` tinyint(1) DEFAULT NULL,
  `featured` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `meta_title` text DEFAULT NULL,
  `meta_keywords` text DEFAULT NULL,
  `meta_description` text DEFAULT NULL,
  `price` decimal(12,4) DEFAULT NULL,
  `special_price` decimal(12,4) DEFAULT NULL,
  `special_price_from` date DEFAULT NULL,
  `special_price_to` date DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `channel` varchar(255) DEFAULT NULL,
  `attribute_family_id` int(10) UNSIGNED DEFAULT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `visible_individually` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_flat`
--

INSERT INTO `product_flat` (`id`, `sku`, `type`, `product_number`, `name`, `short_description`, `description`, `url_key`, `new`, `featured`, `status`, `meta_title`, `meta_keywords`, `meta_description`, `price`, `special_price`, `special_price_from`, `special_price_to`, `weight`, `created_at`, `locale`, `channel`, `attribute_family_id`, `product_id`, `updated_at`, `parent_id`, `visible_individually`) VALUES
(1, 'SP-001', 'simple', NULL, 'Arctic Cozy Knit Unisex Beanie', 'Embrace the chilly days in style with our Arctic Cozy Knit Beanie. Crafted from a soft and durable blend of acrylic, this classic beanie offers warmth and versatility. Suitable for both men and women, it\'s the ideal accessory for casual or outdoor wear. Elevate your winter wardrobe or gift someone special with this essential beanie cap.', 'The Arctic Cozy Knit Beanie is your go-to solution for staying warm, comfortable, and stylish during the colder months. Crafted from a soft and durable blend of acrylic knit, this beanie is designed to provide a cozy and snug fit. The classic design makes it suitable for both men and women, offering a versatile accessory that complements various styles. Whether you\'re heading out for a casual day in town or embracing the great outdoors, this beanie adds a touch of comfort and warmth to your ensemble. The soft and breathable material ensures that you stay cozy without sacrificing style. The Arctic Cozy Knit Beanie isn\'t just an accessory; it\'s a statement of winter fashion. Its simplicity makes it easy to pair with different outfits, making it a staple in your winter wardrobe. Ideal for gifting or as a treat for yourself, this beanie is a thoughtful addition to any winter ensemble. It\'s a versatile accessory that goes beyond functionality, adding a touch of warmth and style to your look. Embrace the essence of winter with the Arctic Cozy Knit Beanie. Whether you\'re enjoying a casual day out or facing the elements, let this beanie be your companion for comfort and style. Elevate your winter wardrobe with this classic accessory that effortlessly combines warmth with a timeless sense of fashion.', 'arctic-cozy-knit-unisex-beanie', 1, 1, 1, 'Meta Title', 'meta1, meta2, meta3', 'meta description', 14.0000, NULL, NULL, NULL, 1.2300, '2025-08-07 09:32:50', 'en', 'default', 1, 1, '2025-08-07 09:32:50', NULL, 1),
(2, 'SP-002', 'simple', NULL, 'Arctic Bliss Stylish Winter Scarf', 'Experience the embrace of warmth and style with our Arctic Bliss Winter Scarf. Crafted from a luxurious blend of acrylic and wool, this cozy scarf is designed to keep you snug during the coldest days. Its stylish and versatile design, combined with an extra-long length, offers customizable styling options. Elevate your winter wardrobe or delight someone special with this essential winter accessory.', 'The Arctic Bliss Winter Scarf is more than just a cold-weather accessory; it\'s a statement of warmth, comfort, and style for the winter season. Crafted with care from a luxurious blend of acrylic and wool, this scarf is designed to keep you cozy and snug even in the chilliest temperatures. The soft and plush texture not only provides insulation against the cold but also adds a touch of luxury to your winter wardrobe. The design of the Arctic Bliss Winter Scarf is both stylish and versatile, making it a perfect addition to a variety of winter outfits. Whether you\'re dressing up for a special occasion or adding a chic layer to your everyday look, this scarf complements your style effortlessly. The extra-long length of the scarf offers customizable styling options. Wrap it around for added warmth, drape it loosely for a casual look, or experiment with different knots to express your unique style. This versatility makes it a must-have accessory for the winter season. Looking for the perfect gift? The Arctic Bliss Winter Scarf is an ideal choice. Whether you\'re surprising a loved one or treating yourself, this scarf is a timeless and practical gift that will be cherished throughout the winter months. Embrace the winter with the Arctic Bliss Winter Scarf, where warmth meets style in perfect harmony. Elevate your winter wardrobe with this essential accessory that not only keeps you warm but also adds a touch of sophistication to your cold-weather ensemble.', 'arctic-bliss-stylish-winter-scarf', 1, 1, 1, 'Meta Title', 'meta1, meta2, meta3', 'meta description', 17.0000, NULL, NULL, NULL, 1.2300, '2025-08-07 09:32:50', 'en', 'default', 1, 2, '2025-08-07 09:32:50', NULL, 1),
(3, 'SP-003', 'simple', NULL, 'Arctic Touchscreen Winter Gloves', 'Stay connected and warm with our Arctic Touchscreen Winter Gloves. These gloves are not only crafted from high-quality acrylic for warmth and durability but also feature a touchscreen-compatible design. With an insulated lining, elastic cuffs for a secure fit, and a stylish look, these gloves are perfect for daily wear in chilly conditions.', 'Introducing the Arctic Touchscreen Winter Gloves – where warmth, style, and connectivity meet to enhance your winter experience. Crafted from high-quality acrylic, these gloves are designed to provide exceptional warmth and durability. The touchscreen-compatible fingertips allow you to stay connected without exposing your hands to the cold. Answer calls, send messages, and navigate your devices effortlessly, all while keeping your hands snug. The insulated lining adds an extra layer of coziness, making these gloves your go-to choice for facing the winter chill. Whether you\'re commuting, running errands, or enjoying outdoor activities, these gloves provide the warmth and protection you need. Elastic cuffs ensure a secure fit, preventing cold drafts and keeping the gloves in place during your daily activities. The stylish design adds a touch of flair to your winter ensemble, making these gloves as fashionable as they are functional. Ideal for gifting or as a treat for yourself, the Arctic Touchscreen Winter Gloves are a must-have accessory for the modern individual. Say goodbye to the inconvenience of removing your gloves to use your devices and embrace the seamless blend of warmth, style, and connectivity. Stay connected, stay warm, and stay stylish with the Arctic Touchscreen Winter Gloves – your reliable companion for conquering the winter season with confidence.', 'arctic-touchscreen-winter-gloves', 1, 1, 1, 'Meta Title', 'meta1, meta2, meta3', 'meta description', 21.0000, 17.0000, '2025-08-07', '2025-08-08', 1.0000, '2025-08-07 09:32:50', 'en', 'default', 1, 3, '2025-08-07 09:32:50', NULL, 1),
(4, 'SP-004', 'simple', NULL, 'Arctic Warmth Wool Blend Socks', 'Experience the unmatched warmth and comfort of our Arctic Warmth Wool Blend Socks. Crafted from a blend of Merino wool, acrylic, nylon, and spandex, these socks offer ultimate coziness for cold weather. With a reinforced heel and toe for durability, these versatile and stylish socks are perfect for various occasions.', 'Introducing the Arctic Warmth Wool Blend Socks – your essential companion for cozy and comfortable feet during the colder seasons. Crafted from a premium blend of Merino wool, acrylic, nylon, and spandex, these socks are designed to provide unparalleled warmth and comfort. The wool blend ensures that your feet stay toasty even in the coldest temperatures, making these socks the perfect choice for winter adventures or simply staying snug at home. The soft and cozy texture of the socks offers a luxurious feel against your skin. Say goodbye to chilly feet as you embrace the plush warmth provided by these wool blend socks. Designed for durability, the socks feature a reinforced heel and toe, adding extra strength to high-wear areas. This ensures that your socks withstand the test of time, providing long-lasting comfort and coziness. The breathable nature of the material prevents overheating, allowing your feet to stay comfortable and dry throughout the day. Whether you\'re heading outdoors for a winter hike or relaxing indoors, these socks offer the perfect balance of warmth and breathability. Versatile and stylish, these wool blend socks are suitable for various occasions. Pair them with your favorite boots for a fashionable winter look or wear them around the house for ultimate comfort. Elevate your winter wardrobe and prioritize comfort with the Arctic Warmth Wool Blend Socks. Treat your feet to the luxury they deserve and step into a world of coziness that lasts all season long.', 'arctic-warmth-wool-blend-socks', 0, 0, 1, 'Meta Title', 'meta1, meta2, meta3', 'meta description', 21.0000, NULL, NULL, NULL, 1.0000, '2025-08-07 09:32:50', 'en', 'default', 1, 4, '2025-08-07 09:32:50', NULL, 1),
(5, 'GP-001', 'grouped', NULL, 'Arctic Frost Winter Accessories', 'Embrace the winter chill with our Arctic Frost Winter Accessories Bundle. This curated set includes a luxurious scarf, a cozy beanie, touchscreen-compatible gloves and wool Blend Socks. Stylish and functional, this ensemble is crafted from high-quality materials, ensuring both durability and comfort. Elevate your winter wardrobe or delight someone special with this perfect gifting option.', 'Introducing the Arctic Frost Winter Accessories Bundle, your go-to solution for staying warm, stylish, and connected during the chilly winter days. This thoughtfully curated set brings together Four essential winter accessories to create a harmonious ensemble. The luxurious scarf, woven from a blend of acrylic and wool, not only adds a layer of warmth but also brings a touch of elegance to your winter wardrobe. The soft knit beanie, crafted with care, promises to keep you cozy while adding a fashionable flair to your look. But it doesn\'t end there – our bundle also includes touchscreen-compatible gloves. Stay connected without sacrificing warmth as you navigate your devices effortlessly. Whether you\'re answering calls, sending messages, or capturing winter moments on your smartphone, these gloves ensure convenience without compromising style. The soft and cozy texture of the socks offers a luxurious feel against your skin. Say goodbye to chilly feet as you embrace the plush warmth provided by these wool blend socks. The Arctic Frost Winter Accessories Bundle is not just about functionality; it\'s a statement of winter fashion. Each piece is designed not only to protect you from the cold but also to elevate your style during the frosty season. The materials chosen for this bundle prioritize both durability and comfort, ensuring that you can enjoy the winter wonderland in style. Whether you\'re treating yourself or searching for the perfect gift, the Arctic Frost Winter Accessories Bundle is a versatile choice. Delight someone special during the holiday season or elevate your own winter wardrobe with this stylish and functional ensemble. Embrace the frost with confidence, knowing that you have the perfect accessories to keep you warm and chic.', 'arctic-frost-winter-accessories', 0, 0, 1, 'Meta Title', 'meta1, meta2, meta3', 'meta description', NULL, NULL, NULL, NULL, 1.0000, '2025-08-07 09:32:50', 'en', 'default', 1, 5, '2025-08-07 09:32:50', NULL, 1),
(6, 'BP-001', 'bundle', NULL, 'Arctic Frost Winter Accessories Bundle', 'Embrace the winter chill with our Arctic Frost Winter Accessories Bundle. This curated set includes a luxurious scarf, a cozy beanie, touchscreen-compatible gloves and wool Blend Socks. Stylish and functional, this ensemble is crafted from high-quality materials, ensuring both durability and comfort. Elevate your winter wardrobe or delight someone special with this perfect gifting option.', 'Introducing the Arctic Frost Winter Accessories Bundle, your go-to solution for staying warm, stylish, and connected during the chilly winter days. This thoughtfully curated set brings together Four essential winter accessories to create a harmonious ensemble. The luxurious scarf, woven from a blend of acrylic and wool, not only adds a layer of warmth but also brings a touch of elegance to your winter wardrobe. The soft knit beanie, crafted with care, promises to keep you cozy while adding a fashionable flair to your look. But it doesn\'t end there – our bundle also includes touchscreen-compatible gloves. Stay connected without sacrificing warmth as you navigate your devices effortlessly. Whether you\'re answering calls, sending messages, or capturing winter moments on your smartphone, these gloves ensure convenience without compromising style. The soft and cozy texture of the socks offers a luxurious feel against your skin. Say goodbye to chilly feet as you embrace the plush warmth provided by these wool blend socks. The Arctic Frost Winter Accessories Bundle is not just about functionality; it\'s a statement of winter fashion. Each piece is designed not only to protect you from the cold but also to elevate your style during the frosty season. The materials chosen for this bundle prioritize both durability and comfort, ensuring that you can enjoy the winter wonderland in style. Whether you\'re treating yourself or searching for the perfect gift, the Arctic Frost Winter Accessories Bundle is a versatile choice. Delight someone special during the holiday season or elevate your own winter wardrobe with this stylish and functional ensemble. Embrace the frost with confidence, knowing that you have the perfect accessories to keep you warm and chic.', 'arctic-frost-winter-accessories-bundle', 0, 0, 1, 'Meta Title', 'meta1, meta2, meta3', 'meta description', NULL, NULL, NULL, NULL, 1.0000, '2025-08-07 09:32:50', 'en', 'default', 1, 6, '2025-08-07 09:32:50', NULL, 1),
(13, 'P002', 'virtual', '', 'Women Fit and Flare Pink, Grey, Red Maxi/Full Length Dress', '<div class=\"_9GQWrZ\">Delicate Pattern</div>\r\n<div class=\"AoD2-N\">\r\n<p>Showcasing a delicate floral printed pattern, this women&rsquo;s dress brings an elegant and ageless touch to your wardrobe. The attractive flowers create a lively look, while the strategic arrangement adds visual interest. Thus, ideal for various occasions, the print enhances the overall appeal of this dress, offering a stylish and fresh appearance.</p>\r\n</div>', '<div class=\"_9GQWrZ\">Important Details</div>\r\n<div class=\"AoD2-N\">\r\n<p>Sporting a U-neckline and short, flared sleeves, this dress delivers a chic yet comfortable fit. The U-neckline provides a balanced and flattering look, while the practical length adds a sense of sophistication. The flared sleeves offer convenient coverage while maintaining a light and airy feel. Furthermore, the fit-and-flare silhouette with a tie-up detail enhances this dress&rsquo;s flow, allowing both adjustability and freedom of movement.</p>\r\n</div>', 'women-fit-and-flare-pink-grey-red-maxifull-length-dress', 1, 1, 1, '', '', '', 350.0000, NULL, NULL, NULL, NULL, '2025-08-07 17:24:11', 'en', 'default', 1, 13, '2025-08-07 17:25:54', NULL, 1),
(15, 'P004', 'virtual', '', 'Men Slim Fit Checkered Spread Collar Casual Shirt', '<p>Tanip- This Casual Shirt has a Standard collar , long sleeves with button cuffs , full buttoned placket on the front, yoke on the back, curved hem. Pair this along with a good pair of denim or chinos and loafers / Espadrilles for a Sharp and Dapper look .This material comes with 100 % Premium Cotton.Cotton rich fabric for crisp Casual look.Wash care : Machine Wash/Hand Wash. Fit - Regular Fit.</p>', '<p>Tanip- This Casual Shirt has a Standard collar , long sleeves with button cuffs , full buttoned placket on the front, yoke on the back, curved hem. Pair this along with a good pair of denim or chinos and loafers / Espadrilles for a Sharp and Dapper look .This material comes with 100 % Premium Cotton.Cotton rich fabric for crisp Casual look.Wash care : Machine Wash/Hand Wash. Fit - Regular Fit.</p>', 'men-slim-fit-checkered-spread-collar-casual-shirt', 1, 1, 1, 'Men Slim Fit Checkered Spread Collar Casual Shirt', 'Men Slim Fit Checkered Spread Collar Casual Shirt', 'Men Slim Fit Checkered Spread Collar Casual Shirt', 250.0000, NULL, NULL, NULL, NULL, '2025-08-07 17:42:36', 'en', 'default', 1, 15, '2025-08-07 17:44:00', NULL, 1),
(16, 'M001', 'virtual', '', 'Men Slim Fit Blue Lycra Blend Trousers', '<p>Step into sophistication and style with Gibbonte\'s Men\'s Lycra Blend Stylish Slim Fit Trousers, the epitome of modern elegance designed for both office and party settings. Crafted with meticulous attention to detail, these trousers boast a slim-fit silhouette that accentuates your physique, providing a sleek and contemporary look that sets you apart from the crowd. Whether you\'re attending a formal business meeting or enjoying a night out with friends, these trousers are your ultimate wardrobe staple, effortlessly blending versatility with sophistication. The slim-fit design of these trousers ensures a tailored appearance, embracing your legs with precision to create a streamlined silhouette that exudes confidence and charm. Featuring belt loops, they offer practicality and refinement, allowing you to effortlessly accessorize with a belt while maintaining a polished ensemble, especially when paired with shirts that require tucking in. Crafted from a premium Lycra blend material, these trousers deliver on both style and comfort. The cotton blend fabric offers durability, ensuring longevity for everyday wear, while the added Lycra provides stretch and flexibility, allowing for unrestricted movement and all-day comfort. Their soft and breathable quality keeps you cool and dry, even during sweltering conditions, making them ideal for extended wear. Not only do these trousers prioritize style and comfort, but they also excel in convenience. Their machine-wash-friendly nature simplifies maintenance, allowing for easy cleaning after each wear, saving you time and effort in your daily routine.</p>', '<p>Step into sophistication and style with Gibbonte\'s Men\'s Lycra Blend Stylish Slim Fit Trousers, the epitome of modern elegance designed for both office and party settings. Crafted with meticulous attention to detail, these trousers boast a slim-fit silhouette that accentuates your physique, providing a sleek and contemporary look that sets you apart from the crowd. Whether you\'re attending a formal business meeting or enjoying a night out with friends, these trousers are your ultimate wardrobe staple, effortlessly blending versatility with sophistication. The slim-fit design of these trousers ensures a tailored appearance, embracing your legs with precision to create a streamlined silhouette that exudes confidence and charm. Featuring belt loops, they offer practicality and refinement, allowing you to effortlessly accessorize with a belt while maintaining a polished ensemble, especially when paired with shirts that require tucking in. Crafted from a premium Lycra blend material, these trousers deliver on both style and comfort. The cotton blend fabric offers durability, ensuring longevity for everyday wear, while the added Lycra provides stretch and flexibility, allowing for unrestricted movement and all-day comfort. Their soft and breathable quality keeps you cool and dry, even during sweltering conditions, making them ideal for extended wear. Not only do these trousers prioritize style and comfort, but they also excel in convenience. Their machine-wash-friendly nature simplifies maintenance, allowing for easy cleaning after each wear, saving you time and effort in your daily routine.</p>', 'men-slim-fit-blue-lycra-blend-trousers', 1, 1, 1, 'Men Slim Fit Blue Lycra Blend Trousers', 'Men Slim Fit Blue Lycra Blend Trousers', 'Men Slim Fit Blue Lycra Blend Trousers', 295.0000, NULL, NULL, NULL, NULL, '2025-08-07 18:22:59', 'en', 'default', 1, 16, '2025-08-07 18:25:29', NULL, 1),
(17, 'M002', 'virtual', '', 'Men Regular Fit Solid Spread Collar Casual Shirt', '<p>This shirts is one of the top selling product from premium quality shirts collection exclusively manufactured by METRONAUT brand. Long lasting fabric and trendy colors make it evergreen for casual and formal usage. You can use it on jeans as well as it is appropriate as formal office wear. Acurate stitching by skilled workers gives it authentic classic look. You will love to wear it for multi purpose use as shirts boys men, shirt for men look, shirts for men stylish, formal shirt, shirts for men stylish look branded.</p>', '<p>This shirts is one of the top selling product from premium quality shirts collection exclusively manufactured by METRONAUT brand. Long lasting fabric and trendy colors make it evergreen for casual and formal usage. You can use it on jeans as well as it is appropriate as formal office wear. Acurate stitching by skilled workers gives it authentic classic look. You will love to wear it for multi purpose use as shirts boys men, shirt for men look, shirts for men stylish, formal shirt, shirts for men stylish look branded.</p>', 'men-regular-fit-solid-spread-collar-casual-shirt', 1, 1, 1, 'Men Regular Fit Solid Spread Collar Casual Shirt', 'Men Regular Fit Solid Spread Collar Casual Shirt', 'Men Regular Fit Solid Spread Collar Casual Shirt', 152.0000, NULL, NULL, NULL, NULL, '2025-08-07 18:28:03', 'en', 'default', 1, 17, '2025-08-07 18:29:09', NULL, 1),
(18, 'F004', 'virtual', '', 'Women Fit and Flare Blue Ankle Length Dress', '<p>Presenting a full-length gown design, this dress exudes elegance and sophistication. The gown silhouette elongates the figure, creating a graceful and timeless look. The full-length style adds a touch of glamour, making it suitable for special occasions where a more formal or dressed-up attire is desired. The flowing lines of the gown not only contribute to the overall aesthetic but also allow for freedom of movement</p>', '<p>Presenting a full-length gown design, this dress exudes elegance and sophistication. The gown silhouette elongates the figure, creating a graceful and timeless look. The full-length style adds a touch of glamour, making it suitable for special occasions where a more formal or dressed-up attire is desired. The flowing lines of the gown not only contribute to the overall aesthetic but also allow for freedom of movement</p>', 'women-fit-and-flare-blue-ankle-length-dress', 1, 1, 1, 'Women Fit and Flare Blue Ankle Length Dress', 'Women Fit and Flare Blue Ankle Length Dress', 'Women Fit and Flare Blue Ankle Length Dress', 222.0000, NULL, NULL, NULL, NULL, '2025-08-07 18:30:06', 'en', 'default', 1, 18, '2025-08-07 18:32:01', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_grouped_products`
--

CREATE TABLE `product_grouped_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `associated_product_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `sort_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_grouped_products`
--

INSERT INTO `product_grouped_products` (`id`, `product_id`, `associated_product_id`, `qty`, `sort_order`) VALUES
(1, 5, 1, 5, 1),
(2, 5, 3, 5, 2),
(3, 5, 4, 5, 3);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `type`, `path`, `product_id`, `position`) VALUES
(1, 'image', 'product/1/9SIb2YwLUFuJqx4DZZxtOa8xYQUxdQBQW4N39aHS.webp', 1, 1),
(2, 'image', 'product/2/ZvO0iYvIW4qjiAqAi0qRFg9ftmfLlRk6EOIMC0iq.webp', 2, 1),
(3, 'image', 'product/3/CbNsDN5CTDMJi1YTV0UCZSPqwA0uVUGsKeZoXVVI.webp', 3, 1),
(4, 'image', 'product/4/dqCcunVcXK12s9D0KemgzOuqkvytWsUjjKivp56z.webp', 4, 1),
(5, 'image', 'product/5/5pWBpyYZ1vZsqPk4yHdeR4MFWf0AoI4lxhBbPhHF.webp', 5, 1),
(6, 'image', 'product/6/acDA8dsg8kvhzbuUsshsjEpG7ILGNtsPZSN9M94D.webp', 6, 1),
(19, 'images', 'product/13/g5bCdB1E6DYPLC40GnrWB5ObuUPH83dzAHurErfw.webp', 13, 1),
(21, 'images', 'product/15/HyEX6RaIp5wzPv4ZkLVhcYDjvW8yRde2wunlQ3Mo.webp', 15, 1),
(22, 'images', 'product/16/snh8BUEFcfqbZx5po8c0TEh1TUVp4iaJw8o8vsCI.webp', 16, 1),
(23, 'images', 'product/17/Huu10URNgFWhfsl1zA7KPWoE3ymljj0z4iTyiMJg.webp', 17, 1),
(24, 'images', 'product/18/yvAwxoCzUNckJCkT9IsOYoLGpna2412Jeo1s7IXt.webp', 18, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventories`
--

CREATE TABLE `product_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `vendor_id` int(11) NOT NULL DEFAULT 0,
  `inventory_source_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_inventories`
--

INSERT INTO `product_inventories` (`id`, `qty`, `product_id`, `vendor_id`, `inventory_source_id`) VALUES
(1, 100, 1, 0, 1),
(2, 100, 2, 0, 1),
(3, 100, 3, 0, 1),
(4, 100, 4, 0, 1),
(9, 20, 13, 0, 1),
(10, 20, 15, 0, 1),
(11, 20, 16, 0, 1),
(12, 20, 17, 0, 1),
(13, 20, 18, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_inventory_indices`
--

CREATE TABLE `product_inventory_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_inventory_indices`
--

INSERT INTO `product_inventory_indices` (`id`, `qty`, `product_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 95, 1, 1, '2025-08-07 04:02:50', '2025-08-07 11:10:04'),
(2, 100, 2, 1, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(3, 96, 3, 1, '2025-08-07 04:02:50', '2025-08-07 11:10:04'),
(4, 100, 4, 1, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(11, 20, 13, 1, NULL, '2025-08-08 13:56:34'),
(13, 20, 15, 1, NULL, '2025-08-08 13:53:58'),
(14, 20, 16, 1, NULL, '2025-08-08 13:55:47'),
(15, 19, 17, 1, NULL, '2025-08-08 14:46:38'),
(16, 20, 18, 1, NULL, '2025-08-08 13:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `product_ordered_inventories`
--

CREATE TABLE `product_ordered_inventories` (
  `id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL DEFAULT 0,
  `product_id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_ordered_inventories`
--

INSERT INTO `product_ordered_inventories` (`id`, `qty`, `product_id`, `channel_id`) VALUES
(1, 5, 1, 1),
(2, 4, 3, 1),
(3, 1, 17, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_price_indices`
--

CREATE TABLE `product_price_indices` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_group_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_min_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `regular_max_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_price_indices`
--

INSERT INTO `product_price_indices` (`id`, `product_id`, `customer_group_id`, `channel_id`, `min_price`, `regular_min_price`, `max_price`, `regular_max_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(2, 1, 2, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(3, 1, 3, 1, 14.0000, 14.0000, 14.0000, 14.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(4, 2, 1, 1, 17.0000, 17.0000, 17.0000, 17.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(5, 2, 2, 1, 17.0000, 17.0000, 17.0000, 17.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(6, 2, 3, 1, 17.0000, 17.0000, 17.0000, 17.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(7, 3, 1, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(8, 3, 2, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(9, 3, 3, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(10, 4, 1, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(11, 4, 2, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(12, 4, 3, 1, 21.0000, 21.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(13, 5, 1, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(14, 5, 2, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(15, 5, 3, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(16, 6, 1, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(17, 6, 2, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(18, 6, 3, 1, 14.0000, 14.0000, 21.0000, 21.0000, '2025-08-07 04:02:50', '2025-08-07 04:02:50'),
(37, 13, 1, 1, 350.0000, 350.0000, 350.0000, 350.0000, NULL, NULL),
(38, 13, 2, 1, 350.0000, 350.0000, 350.0000, 350.0000, NULL, NULL),
(39, 13, 3, 1, 350.0000, 350.0000, 350.0000, 350.0000, NULL, NULL),
(43, 15, 1, 1, 250.0000, 250.0000, 250.0000, 250.0000, NULL, NULL),
(44, 15, 2, 1, 250.0000, 250.0000, 250.0000, 250.0000, NULL, NULL),
(45, 15, 3, 1, 250.0000, 250.0000, 250.0000, 250.0000, NULL, NULL),
(46, 16, 1, 1, 295.0000, 295.0000, 295.0000, 295.0000, NULL, NULL),
(47, 16, 2, 1, 295.0000, 295.0000, 295.0000, 295.0000, NULL, NULL),
(48, 16, 3, 1, 295.0000, 295.0000, 295.0000, 295.0000, NULL, NULL),
(49, 17, 1, 1, 152.0000, 152.0000, 152.0000, 152.0000, NULL, NULL),
(50, 17, 2, 1, 152.0000, 152.0000, 152.0000, 152.0000, NULL, NULL),
(51, 17, 3, 1, 152.0000, 152.0000, 152.0000, 152.0000, NULL, NULL),
(52, 18, 1, 1, 222.0000, 222.0000, 222.0000, 222.0000, NULL, NULL),
(53, 18, 2, 1, 222.0000, 222.0000, 222.0000, 222.0000, NULL, NULL),
(54, 18, 3, 1, 222.0000, 222.0000, 222.0000, 222.0000, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_relations`
--

CREATE TABLE `product_relations` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_relations`
--

INSERT INTO `product_relations` (`parent_id`, `child_id`) VALUES
(1, 4),
(2, 1),
(3, 1),
(3, 2),
(4, 1),
(4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_review_attachments`
--

CREATE TABLE `product_review_attachments` (
  `id` int(10) UNSIGNED NOT NULL,
  `review_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'image',
  `mime_type` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_super_attributes`
--

CREATE TABLE `product_super_attributes` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_up_sells`
--

CREATE TABLE `product_up_sells` (
  `parent_id` int(10) UNSIGNED NOT NULL,
  `child_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_up_sells`
--

INSERT INTO `product_up_sells` (`parent_id`, `child_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 4),
(4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_videos`
--

CREATE TABLE `product_videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `path` varchar(255) NOT NULL,
  `position` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refunds`
--

CREATE TABLE `refunds` (
  `id` int(10) UNSIGNED NOT NULL,
  `increment_id` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `total_qty` int(11) DEFAULT NULL,
  `base_currency_code` varchar(255) DEFAULT NULL,
  `channel_currency_code` varchar(255) DEFAULT NULL,
  `order_currency_code` varchar(255) DEFAULT NULL,
  `adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_refund` decimal(12,4) DEFAULT 0.0000,
  `adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `base_adjustment_fee` decimal(12,4) DEFAULT 0.0000,
  `sub_total` decimal(12,4) DEFAULT 0.0000,
  `base_sub_total` decimal(12,4) DEFAULT 0.0000,
  `grand_total` decimal(12,4) DEFAULT 0.0000,
  `base_grand_total` decimal(12,4) DEFAULT 0.0000,
  `shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `base_shipping_amount` decimal(12,4) DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_tax_amount` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_sub_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_shipping_amount_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund_items`
--

CREATE TABLE `refund_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `tax_amount` decimal(12,4) DEFAULT 0.0000,
  `base_tax_amount` decimal(12,4) DEFAULT 0.0000,
  `discount_percent` decimal(12,4) DEFAULT 0.0000,
  `discount_amount` decimal(12,4) DEFAULT 0.0000,
  `base_discount_amount` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_total_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `refund_id` int(10) UNSIGNED DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `permission_type` varchar(255) NOT NULL,
  `permissions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`permissions`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `permission_type`, `permissions`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'This role users will have all the access', 'all', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `search_synonyms`
--

CREATE TABLE `search_synonyms` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `terms` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `search_terms`
--

CREATE TABLE `search_terms` (
  `id` int(10) UNSIGNED NOT NULL,
  `term` varchar(255) NOT NULL,
  `results` int(11) NOT NULL DEFAULT 0,
  `uses` int(11) NOT NULL DEFAULT 0,
  `redirect_url` varchar(255) DEFAULT NULL,
  `display_in_suggested_terms` tinyint(1) NOT NULL DEFAULT 0,
  `locale` varchar(255) NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_qty` int(11) DEFAULT NULL,
  `total_weight` decimal(12,4) DEFAULT NULL,
  `carrier_code` varchar(255) DEFAULT NULL,
  `carrier_title` varchar(255) DEFAULT NULL,
  `track_number` text DEFAULT NULL,
  `email_sent` tinyint(1) NOT NULL DEFAULT 0,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `customer_type` varchar(255) DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `order_address_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_source_id` int(10) UNSIGNED DEFAULT NULL,
  `inventory_source_name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipment_items`
--

CREATE TABLE `shipment_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `weight` decimal(12,4) DEFAULT NULL,
  `price` decimal(12,4) DEFAULT 0.0000,
  `base_price` decimal(12,4) DEFAULT 0.0000,
  `total` decimal(12,4) DEFAULT 0.0000,
  `base_total` decimal(12,4) DEFAULT 0.0000,
  `price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `base_price_incl_tax` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `order_item_id` int(10) UNSIGNED DEFAULT NULL,
  `shipment_id` int(10) UNSIGNED NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sitemaps`
--

CREATE TABLE `sitemaps` (
  `id` int(10) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `generated_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers_list`
--

CREATE TABLE `subscribers_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `is_subscribed` tinyint(1) NOT NULL DEFAULT 0,
  `token` varchar(255) DEFAULT NULL,
  `customer_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories`
--

CREATE TABLE `tax_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_categories_tax_rates`
--

CREATE TABLE `tax_categories_tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_category_id` int(10) UNSIGNED NOT NULL,
  `tax_rate_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_rates`
--

CREATE TABLE `tax_rates` (
  `id` int(10) UNSIGNED NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `is_zip` tinyint(1) NOT NULL DEFAULT 0,
  `zip_code` varchar(255) DEFAULT NULL,
  `zip_from` varchar(255) DEFAULT NULL,
  `zip_to` varchar(255) DEFAULT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `tax_rate` decimal(12,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `theme_customizations`
--

CREATE TABLE `theme_customizations` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_code` varchar(255) DEFAULT 'default',
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theme_customizations`
--

INSERT INTO `theme_customizations` (`id`, `theme_code`, `type`, `name`, `sort_order`, `status`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'default', 'image_carousel', 'Image Carousel', 1, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(2, 'default', 'static_content', 'Offer Information', 2, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(3, 'default', 'category_carousel', 'Categories Collections', 3, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(4, 'default', 'product_carousel', 'New Products', 4, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(5, 'default', 'static_content', 'Top Collections', 5, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(6, 'default', 'static_content', 'Bold Collections', 6, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(7, 'default', 'product_carousel', 'Featured Collections', 7, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(8, 'default', 'static_content', 'Game Container', 8, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(9, 'default', 'product_carousel', 'All Products', 9, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(10, 'default', 'static_content', 'Bold Collections', 10, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(11, 'default', 'footer_links', 'Footer Links', 11, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53'),
(12, 'default', 'services_content', 'Services Content', 12, 1, 1, '2025-08-07 04:01:53', '2025-08-07 04:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `theme_customization_translations`
--

CREATE TABLE `theme_customization_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `theme_customization_id` int(10) UNSIGNED NOT NULL,
  `locale` varchar(255) NOT NULL,
  `options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`options`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `theme_customization_translations`
--

INSERT INTO `theme_customization_translations` (`id`, `theme_customization_id`, `locale`, `options`) VALUES
(1, 1, 'en', '{\"images\":[{\"title\":\"Get Ready For New Collection\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/OVgc49NZgodfofg6ltgdIaOKT33APGQXpPjgieM3.webp\"},{\"title\":\"Get Ready For New Collection\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/7eNj6N6bWlk4QPRmkbfUWZ6cyML9KECZscD50sBH.webp\"},{\"title\":\"Get Ready For New Collection\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/xpuxGTBuX60WVBJV7yCMHDgKAHDdS997r2WmtmYq.webp\"},{\"title\":\"Get Ready For New Collection\",\"link\":\"\",\"image\":\"storage\\/theme\\/1\\/EjgQDfE1i40BuA8fDsYn0ZzZncmYPtfEyCdjrYyi.webp\"}]}'),
(2, 2, 'en', '{\"html\":\"<div class=\\\"home-offer\\\"><h1>Get UPTO 40% OFF on your 1st order SHOP NOW<\\/h1><\\/div>\",\"css\":\".home-offer h1 {display: block;font-weight: 500;text-align: center;font-size: 22px;font-family: DM Serif Display;background-color: #E8EDFE;padding-top: 20px;padding-bottom: 20px;}@media (max-width:768px){.home-offer h1 {font-size:18px;padding-top: 10px;padding-bottom: 10px;}@media (max-width:525px) {.home-offer h1 {font-size:14px;padding-top: 6px;padding-bottom: 6px;}}\"}'),
(3, 3, 'en', '{\"filters\":{\"parent_id\":1,\"sort\":\"asc\",\"limit\":10}}'),
(4, 4, 'en', '{\"title\":\"New Products\",\"filters\":{\"new\":1,\"sort\":\"name-asc\",\"limit\":12}}'),
(5, 5, 'en', '{\"html\":\"<div class=\\\"top-collection-container\\\"><div class=\\\"top-collection-header\\\"><h2>The game with our new additions!<\\/h2><\\/div><div class=\\\"top-collection-grid container\\\"><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/DpULRtMd20Ehvb7891mEIZUSZ640Qj0XqGypqWRN.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/LgTSgzFcZLrcu2clHlkpO1tln22DSoxlZml4400A.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/ZmfkAMVBgdavJmCHDF9VCEPq2HfxOJF84phH6Iql.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/TWm9kJ9VDsve68RbQEIQE4ch6c1PRAbJ5zbBJF5y.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/Ecv61w2q9PchywkqzsPubMLbLp7M8LenrW9VWJL7.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections<\\/h3><\\/div><div class=\\\"top-collection-card\\\"><img src=\\\"\\\" data-src=\\\"storage\\/theme\\/5\\/WGAJpJJ6tnPWVdpxgckpKr0ihs5sHrtTaMeJs6YT.webp\\\" class=\\\"lazy\\\" width=\\\"396\\\" height=\\\"396\\\" alt=\\\"The game with our new additions!\\\"><h3>Our Collections<\\/h3><\\/div><\\/div><\\/div>\",\"css\":\".top-collection-container {overflow: hidden;}.top-collection-header {padding-left: 15px;padding-right: 15px;text-align: center;font-size: 70px;line-height: 90px;color: #060C3B;margin-top: 80px;}.top-collection-header h2 {max-width: 595px;margin-left: auto;margin-right: auto;font-family: DM Serif Display;}.top-collection-grid {display: flex;flex-wrap: wrap;gap: 32px;justify-content: center;margin-top: 60px;width: 100%;margin-right: auto;margin-left: auto;padding-right: 90px;padding-left: 90px;}.top-collection-card {position: relative;background: #f9fafb;overflow:hidden;border-radius:20px;}.top-collection-card img {border-radius: 16px;max-width: 100%;text-indent:-9999px;transition: transform 300ms ease;transform: scale(1);}.top-collection-card:hover img {transform: scale(1.05);transition: all 300ms ease;}.top-collection-card h3 {color: #060C3B;font-size: 30px;font-family: DM Serif Display;transform: translateX(-50%);width: max-content;left: 50%;bottom: 30px;position: absolute;margin: 0;font-weight: inherit;}@media not all and (min-width: 525px) {.top-collection-header {margin-top: 28px;font-size: 20px;line-height: 1.5;}.top-collection-grid {gap: 10px}}@media not all and (min-width: 768px) {.top-collection-header {margin-top: 30px;font-size: 28px;line-height: 3;}.top-collection-header h2 {line-height:2; margin-bottom:20px;} .top-collection-grid {gap: 14px}} @media not all and (min-width: 1024px) {.top-collection-grid {padding-left: 30px;padding-right: 30px;}}@media (max-width: 768px) {.top-collection-grid { row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 0px;} .top-collection-card{width:48%} .top-collection-card img {width:100%;} .top-collection-card h3 {font-size:24px; bottom: 16px;}}@media (max-width:520px) { .top-collection-grid{padding-left: 15px;padding-right: 15px;} .top-collection-card h3 {font-size:18px; bottom: 10px;}}\"}'),
(6, 6, 'en', '{\"html\":\"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/6\\/TDYDN7k5I1cKBvqMb9Dhdx1nxWxQ3mFRTGLA3m3j.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> <\\/div> <div class=\\\"inline-col-content-wrapper\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! <\\/h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!<\\/p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections<\\/button> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}} @media (max-width:768px){.inline-col-wrapper .inline-col-image-wrapper img {width:100%;} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:28px !important;line-height:normal !important}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px !important;} .inline-col-description{font-size:16px} .inline-col-wrapper{grid-gap:10px}}\"}'),
(7, 7, 'en', '{\"title\":\"Featured Products\",\"filters\":{\"featured\":1,\"sort\":\"name-desc\",\"limit\":12}}'),
(8, 8, 'en', '{\"html\":\"<div class=\\\"section-game\\\"><div class=\\\"section-title\\\"> <h2>The game with our new additions!<\\/h2> <\\/div> <div class=\\\"section-gap container\\\"> <div class=\\\"collection-card-wrapper\\\"> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/NEh2QVpCGknqyR2OB6EMz6yoJwf0lJMI3ZySij5C.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\">Our Collections<\\/h3> <\\/div> <div class=\\\"single-collection-card\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/8\\/JWE3NwGzOvZbiyaaUO8Gd2nNlOcIVA7pmEugLXC4.webp\\\" class=\\\"lazy\\\" width=\\\"615\\\" height=\\\"600\\\" alt=\\\"The game with our new additions!\\\"> <h3 class=\\\"overlay-text\\\"> Our Collections <\\/h3> <\\/div> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-game {overflow: hidden;}.section-title,.section-title h2{font-weight:400;font-family:DM Serif Display}.section-title{margin-top:80px;padding-left:15px;padding-right:15px;text-align:center;line-height:90px}.section-title h2{font-size:70px;color:#060c3b;max-width:595px;margin:auto}.collection-card-wrapper{display:flex;flex-wrap:wrap;justify-content:center;gap:30px}.collection-card-wrapper .single-collection-card{position:relative}.collection-card-wrapper .single-collection-card img{border-radius:16px;background-color:#f5f5f5;max-width:100%;height:auto;text-indent:-9999px}.collection-card-wrapper .single-collection-card .overlay-text{font-size:50px;font-weight:400;max-width:234px;font-style:italic;color:#060c3b;font-family:DM Serif Display;position:absolute;bottom:30px;left:30px;margin:0}@media (max-width:1024px){.section-title{padding:0 30px}}@media (max-width:991px){.collection-card-wrapper{flex-wrap:wrap}}@media (max-width:768px) {.collection-card-wrapper .single-collection-card .overlay-text{font-size:32px; bottom:20px}.section-title{margin-top:32px}.section-title h2{font-size:28px;line-height:normal}} @media (max-width:525px){.collection-card-wrapper .single-collection-card .overlay-text{font-size:18px; bottom:10px} .section-title{margin-top:28px}.section-title h2{font-size:20px;} .collection-card-wrapper{gap:10px; 15px; row-gap:15px; column-gap:0px;justify-content: space-between;margin-top: 15px;} .collection-card-wrapper .single-collection-card {width:48%;}}\"}'),
(9, 9, 'en', '{\"title\":\"All Products\",\"filters\":{\"sort\":\"name-desc\",\"limit\":12}}'),
(10, 10, 'en', '{\"html\":\"<div class=\\\"section-gap bold-collections container\\\"> <div class=\\\"inline-col-wrapper direction-rtl\\\"> <div class=\\\"inline-col-image-wrapper\\\"> <img src=\\\"\\\" data-src=\\\"storage\\/theme\\/10\\/CEpU8WfgcYD6lf3dbRWCRHWLDPUwu8bJbmJuvc6I.webp\\\" class=\\\"lazy\\\" width=\\\"632\\\" height=\\\"510\\\" alt=\\\"Get Ready for our new Bold Collections!\\\"> <\\/div> <div class=\\\"inline-col-content-wrapper direction-ltr\\\"> <h2 class=\\\"inline-col-title\\\"> Get Ready for our new Bold Collections! <\\/h2> <p class=\\\"inline-col-description\\\">Introducing Our New Bold Collections! Elevate your style with daring designs and vibrant statements. Explore striking patterns and bold colors that redefine your wardrobe. Get ready to embrace the extraordinary!<\\/p> <button class=\\\"primary-button max-md:rounded-lg max-md:px-4 max-md:py-2.5 max-md:text-sm\\\">View Collections<\\/button> <\\/div> <\\/div> <\\/div>\",\"css\":\".section-gap{margin-top:80px}.direction-ltr{direction:ltr}.direction-rtl{direction:rtl}.inline-col-wrapper{display:grid;grid-template-columns:auto 1fr;grid-gap:60px;align-items:center}.inline-col-wrapper .inline-col-image-wrapper{overflow:hidden}.inline-col-wrapper .inline-col-image-wrapper img{max-width:100%;height:auto;border-radius:16px;text-indent:-9999px}.inline-col-wrapper .inline-col-content-wrapper{display:flex;flex-wrap:wrap;gap:20px;max-width:464px}.inline-col-wrapper .inline-col-content-wrapper .inline-col-title{max-width:442px;font-size:60px;font-weight:400;color:#060c3b;line-height:70px;font-family:DM Serif Display;margin:0}.inline-col-wrapper .inline-col-content-wrapper .inline-col-description{margin:0;font-size:18px;color:#6e6e6e;font-family:Poppins}@media (max-width:991px){.inline-col-wrapper{grid-template-columns:1fr;grid-gap:16px}.inline-col-wrapper .inline-col-content-wrapper{gap:10px}}@media (max-width:768px) {.inline-col-wrapper .inline-col-image-wrapper img {max-width:100%;}.inline-col-wrapper .inline-col-content-wrapper{max-width:100%;justify-content:center; text-align:center} .section-gap{padding:0 30px; gap:20px;margin-top:24px} .bold-collections{margin-top:32px;}} @media (max-width:525px){.inline-col-wrapper .inline-col-content-wrapper{gap:10px} .inline-col-wrapper .inline-col-content-wrapper .inline-col-title{font-size:20px;line-height:normal} .section-gap{padding:0 15px; gap:15px;margin-top:10px} .bold-collections{margin-top:28px;}  .inline-col-description{font-size:16px !important} .inline-col-wrapper{grid-gap:15px}\"}'),
(11, 11, 'en', '{\"column_1\":[{\"url\":\"http:\\/\\/localhost\\/page\\/about-us\",\"title\":\"About Us\",\"sort_order\":1},{\"url\":\"http:\\/\\/localhost\\/contact-us\",\"title\":\"Contact Us\",\"sort_order\":2},{\"url\":\"http:\\/\\/localhost\\/page\\/customer-service\",\"title\":\"Customer Service\",\"sort_order\":3},{\"url\":\"http:\\/\\/localhost\\/page\\/whats-new\",\"title\":\"What\'s New\",\"sort_order\":4},{\"url\":\"http:\\/\\/localhost\\/page\\/terms-of-use\",\"title\":\"Terms of Use\",\"sort_order\":5},{\"url\":\"http:\\/\\/localhost\\/page\\/terms-conditions\",\"title\":\"Terms & Conditions\",\"sort_order\":6}],\"column_2\":[{\"url\":\"http:\\/\\/localhost\\/page\\/privacy-policy\",\"title\":\"Privacy Policy\",\"sort_order\":1},{\"url\":\"http:\\/\\/localhost\\/page\\/payment-policy\",\"title\":\"Payment Policy\",\"sort_order\":2},{\"url\":\"http:\\/\\/localhost\\/page\\/shipping-policy\",\"title\":\"Shipping Policy\",\"sort_order\":3},{\"url\":\"http:\\/\\/localhost\\/page\\/refund-policy\",\"title\":\"Refund Policy\",\"sort_order\":4},{\"url\":\"http:\\/\\/localhost\\/page\\/return-policy\",\"title\":\"Return Policy\",\"sort_order\":5}]}'),
(12, 12, 'en', '{\"services\":[{\"title\":\"Free Shipping\",\"description\":\"Enjoy free shipping on all orders\",\"service_icon\":\"icon-truck\"},{\"title\":\"Product Replace\",\"description\":\"Easy Product Replacement Available!\",\"service_icon\":\"icon-product\"},{\"title\":\"Emi Available\",\"description\":\"No cost EMI available on all major credit cards\",\"service_icon\":\"icon-dollar-sign\"},{\"title\":\"24\\/7 Support\",\"description\":\"Dedicated 24\\/7 support via chat and email\",\"service_icon\":\"icon-support\"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `url_rewrites`
--

CREATE TABLE `url_rewrites` (
  `id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(255) NOT NULL,
  `request_path` varchar(255) NOT NULL,
  `target_path` varchar(255) NOT NULL,
  `redirect_type` varchar(255) DEFAULT NULL,
  `locale` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `url_rewrites`
--

INSERT INTO `url_rewrites` (`id`, `entity_type`, `request_path`, `target_path`, `redirect_type`, `locale`, `created_at`, `updated_at`) VALUES
(1, 'category', 'winter-wear', 'shirts', '301', 'en', '2025-08-07 11:37:02', '2025-08-07 11:37:02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `visits`
--

CREATE TABLE `visits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method` varchar(255) DEFAULT NULL,
  `request` mediumtext DEFAULT NULL,
  `url` mediumtext DEFAULT NULL,
  `referer` mediumtext DEFAULT NULL,
  `languages` text DEFAULT NULL,
  `useragent` text DEFAULT NULL,
  `headers` text DEFAULT NULL,
  `device` text DEFAULT NULL,
  `platform` text DEFAULT NULL,
  `browser` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `visitable_type` varchar(255) DEFAULT NULL,
  `visitable_id` bigint(20) UNSIGNED DEFAULT NULL,
  `visitor_type` varchar(255) DEFAULT NULL,
  `visitor_id` bigint(20) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `visits`
--

INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(1, 'GET', '[]', 'http://127.0.0.1:8000', NULL, '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"none\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-08-07 04:05:02', '2025-08-07 04:05:02'),
(2, 'GET', '[]', 'http://127.0.0.1:8000/arctic-touchscreen-winter-gloves', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InBwajJyOXZOc2ZsdktHM3BhMDVTS2c9PSIsInZhbHVlIjoicEJHM013WFBEMTdEV01maFV6dlg4dVlTeVFneDZpejJQODJzNEVQT2l2ekNreXc1bzZCaUZYVTFMSDZob3I0TGZBbUJIaWRNK0lqSjFmMEZRb3BORTJ5UDdVSGpKa0h6Rm9vaDN1aEZDdE9GdjRna3F6a0drV3ZxaFd5RFcvMWQiLCJtYWMiOiI2NzQ2ZmY3NmQ2MzQ5NzBjN2Q2OTcyYjU5MGVkMGY4NGFmNDIxNTY1NjQzMmZkMDdlNzRlNWNiN2ExZWU2ZjE5IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6Ik14T1dtc3Y1elliUGd5VVpia3ZRNWc9PSIsInZhbHVlIjoib0Y4Zi90UzJ0TFNoSkNac0FJMjZranVoZ3Q1RjJ4MDRjb3Z4ZHBML3RmVS9ObmJCNExreGNVUUgvSC9oWEkrVlo2T1ptZ3M4OGNrbXN6QnFhaHNCZ29tczdTUXRkYTF2dG1YWGdDaWlKRldmdXBIM0M1N3FnbXllZHpJZmhOeFkiLCJtYWMiOiIwMTZiMjFjNTEwOTczYTk3OTFkNjUyZTJmYjFmMTU5OWNjOWEwNjMxZGFlY2MwMjczYmIwZjAyZTM5YTQxODY2IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 3, NULL, NULL, 1, '2025-08-07 04:05:52', '2025-08-07 04:05:52'),
(3, 'GET', '[]', 'http://127.0.0.1:8000/arctic-cozy-knit-unisex-beanie', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkpqRm5lRmhmUXBFYmhqT0MyblRiTWc9PSIsInZhbHVlIjoiYlhHSUZIcHZ5UUZ4ZkpJOVJoVkN2K3pxTElQb0xEL3p2MjZ2VnJRMThwZXl6M0U2T0Vkb3dobzNjMWRHUlNYZWh1Y2ltSTBBcXAxd2M3TWFidUpiWHl1bjQxYm5mWFpwMWNXQ0djazRnMGFNMWVYbGhqQ09tNHRGS0RVbnFhNEoiLCJtYWMiOiJlOTA5YjQ5NjkxOGY0ZjcwZmI0NDQ4NjE1Y2VhYmM0MjE5ZmM1NDc1MWY5NjgwZmVkNzMwMmVhYjA4YmNhYzRlIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IitHL2txdWNoK0dLMUhIWXgyNTIxOGc9PSIsInZhbHVlIjoid3RHeUZWSU5zUy9JUDVVakZBZFpXd2RSU0ZVeHJkNy9NZmdVaG9IN0s3bVowVU84R2lodHRkd1VsWi9YckpBYnI4L3I5MXdRaEdNVFlySVA0anAzRllyT3doemtzM3hleEw3b2FmcWY3UU83enBNNGpqcThHOUxDSWVzeU9RS1EiLCJtYWMiOiJiYmVmOTUwOGEyN2M5M2Y3OGJkYzU2ZDkyMzE4M2Q3MDEyNWU4MzAyZDUxZjJiZjVjNWVjYTc5Y2ZiYzZjNmY5IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-08-07 04:06:14', '2025-08-07 04:06:14'),
(4, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/customer/login', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/customer\\/login\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjE3UVRDU0xES1YyelZ3eGZFVzIvaFE9PSIsInZhbHVlIjoiWms5WVVBNzVLOVFkVk5ncHVadllsNEo5RFpJeVlFOGtxdDl4cEVVSGkxRVlEemMyQmgrYU5peWl6aEFkUTJ3TXFRMUtkQi9pc0dxN1JDTk50YkdwUjlQVUhSeWpHb3pvY25Hamhha1FsTWlMWEpqaUJLYVgyblc1dVV0b2FYdkkiLCJtYWMiOiI3ZmVlNTEzMmNkZjcwOWRhNjc0NWVkNTc2YTY0ZGQwYjJkMjE1ZGJiOWUxNWQxMjE3MTQ2YzFkMDIwM2U1YjY4IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IlV5M3QySzVJbjFEL1VMa1U4RmZCN3c9PSIsInZhbHVlIjoiQ1I1MDFpNTdzT0FYQ1ZiRWw3OE9OQy85NEVTUElrUWMyMFV6c3I4VXpFY3VmSUFSWGFqcnN2eUV6WThjYWNIVy9YdFFtdll5QkxOdktma1FSMHFoS252bUZwYk1XQ3ZHaTU3S2tYTlRXOVRETWMreXE5SHpxR0NhY1dULzJpaTEiLCJtYWMiOiIxOWQxZTFkNmFmZjJmMzk2MWEyNmQzYmYxMDAwMzAwMjA1MjA1OGU3MzYwY2FkNGJkNjI4MTVlNTA4OWVmYTg0IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-08-07 04:32:14', '2025-08-07 04:32:14'),
(5, 'GET', '[]', 'http://127.0.0.1:8000/api/shop/I%20am%20getting%20419%20error%20with%20add%20cart', 'http://127.0.0.1:8000/api/shop/documentation', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"x-csrf-token\":[\"\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"accept\":[\"application\\/json,*\\/*\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"cors\"],\"sec-fetch-dest\":[\"empty\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/api\\/shop\\/documentation\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlkzTHJNTXI2aENTdldMM2d5Z1N5R3c9PSIsInZhbHVlIjoiVGJLL09NVVQrcjJmSVlHK0ZSbG9QNTZpQnVubEhYZk43WVc4emJzeUUvMmp6SnFiNW1hRS9OK1IrOU9JazdDUTE1a010NTkwYkxsOG5KRXNtSVBRZ2FiU21oelZRL2oxeDZSTGJlblFLN1JzcVRydmFQTDVlU3p5SlVUR3BZYzQiLCJtYWMiOiJjYTEyYTEyNDcyYmRjZTU4ODQxNjgyMjBjYTg2ZjgyOWFjZjQwMWQyMDE5NTJjY2I1NDkxYmU5NmVkNmJjMWM5IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6InVRY3NLSFFnekIvaFo0aW1pU2VHZ2c9PSIsInZhbHVlIjoiZHZsbnRSMW9lcXgwd0lkaXJPbW9lcGJES2p4WWxheWQrN1JDNnU1aVZqUFpyc3Z0TXJBNzBHY2QzNUJ3bUxmSWNYbjlwcEwyUHdqNnp2TG9tdDl6TVUzeGFDcW5rbEQ2TW4yQWpzcUxQRFM5eVhVMDlYZTV5WlBmNkJUYVFpelkiLCJtYWMiOiI4OTMwNTc1MjFlMWJmMTAxYzI4MmE2MTM5ZDI2NDhiODcxMjViMWY3NDVkNjljOTI1YWZkZmEyYjIzNzVjYmI4IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, 'Webkul\\Customer\\Models\\Customer', 1, 1, '2025-08-07 05:29:57', '2025-08-07 05:29:57'),
(6, 'GET', '[]', 'http://127.0.0.1:8000/men', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlpiTzErVkpoNDdvZWJiRUNDMFBmUmc9PSIsInZhbHVlIjoiVURBaExZWjVobE44QVFUdTFGemk3amFKaWVqbWMwM1hTZVordHk4WHhLVTRLZjU3L2lDRG02WloyQ2o1MUNyS2RLWlg3NUcvN0dmNmgrRzMwQ0krNWIwR1RYWDFPNWJnbU12Q0lETDFsb3B3dVBXODhxMDhFNVE4eE9mQW02VDkiLCJtYWMiOiI0NGJjYzdkNmY1MmFiODQxOGVmZjJkMzg5OWY1ZjJmZjI2OWM2Nzc5N2I5ZjI1ODAyMTQyNWFmZjRiOTQ2NWUxIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6ImErR0xTMmVvWVNkZS9zMDBGV1N3MVE9PSIsInZhbHVlIjoiUlNMc3lDSVBEaHRpNm9zVFYvUE1vTUpsQ01nblhGQmc1N0NGMWFJQS9RdE9FV0R1LzVuTnNaM3h6VG5HTytYWTR3MmpVaW9QK2JoenJxc2dDenErSDQzR3JzNGphTDJFVWcvOU9TNFpSa215TTNOMml4bFUzaDNCN0swT2tqdm4iLCJtYWMiOiI4NjIwMGY0MDNmNjViMTM1YTE3MTU1NjBmYTNmNDQ3ZWI3YTBkZTg3NzZhZWU5Y2RiYzBkZGEwYmNhMGRkZGVkIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2025-08-07 11:34:59', '2025-08-07 11:34:59'),
(7, 'GET', '[]', 'http://127.0.0.1:8000/women', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InRRTnZUQlQ1RHJxMXVaZFB1dlNGeGc9PSIsInZhbHVlIjoibE4xWlJxSDYxUHc5bWk0NUttbG9qK1hJTGN3a3M3WTRhNFdQbVhEcTlOemMxYnpaVmN1YXZCNGRGZlNqSGZEUXVuUEExa2o2TmNIRTlzZEc2R0Y3c0UxaDZ4Mm9rQ1hTZWo0Sy96Tm9oaFR4RHBRajBTSzc5ZmYzRkgzdDVFRGciLCJtYWMiOiI5YmE2NjMwNWU5ZjkxZDdmMzg0NzA5Nzk0YjI1MWM1MTQwZGEzZDQ1YWFlMWY1NGI0NTk2YmQ5NzM4YzMyNmY1IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IitSQ3RZK0NZQUJjZnJXL0tWc2pKdWc9PSIsInZhbHVlIjoiSWk5aGtvOUFZc0dDcUJmR2twOGZwdkREVWFrT3ZkZ3pCM3phSDE4c0JzVzFXRHY5OFRUVXVnRWIzL1lQWkVXSis1L0dUT2RLVm1vUWlRL0ZkaExKVlA4cGl1SEtyT0lMVWxLTkNDektubi9iRmJYbngyV2ZzVENTRWNGV1pJVWciLCJtYWMiOiI5ZWYyOTZkMDRmMDE4MjQ4NGI5NGQzMjg4MWU3YmU2OTllMDc4OGIzYTM4NzBhMWYyZWE2N2UyNWZhM2YxMzE1IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 4, NULL, NULL, 1, '2025-08-07 11:36:10', '2025-08-07 11:36:10'),
(8, 'GET', '[]', 'http://127.0.0.1:8000/shirts', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjE5RXJ0ZGVKL2dJSmhGclM5SWZGNHc9PSIsInZhbHVlIjoiTVd3QUV4Q3pIRVJKTEp3aGN4VldvZW5SazN4a0tRV21XWDBNaE9vR2w2S2tFNXpzRWlkSVFhREpGY3ltU3Q0NU9vVHBSWXdGbzUzOW9CR1UxNXBMQmJxWnZmdnc1SC9BUXFtQW1MeHhkak9xRUVtWDV2L2JkbGY5cm1kMzJkV1kiLCJtYWMiOiI2ZGIzZWZiOTJkMTQ1ZjFiZTFjYWZkZWQ1NWNiYmY4NWZmMTA0NWJjOTc5NGNmNTY0OGZhZTJhM2I0MmUwODY2IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IlZQaWJ6Vy9GdzJ0QldmcWt6S0wvY1E9PSIsInZhbHVlIjoibVZKbkNrZ25GNTdUUXZxNnZzckhvbmpFS2hsNm1KaFJydVc0UkpsQXAzdzFabUR3bUlaU1U0UmlGQ0ZHdFlVY0lXUFdtSmFFc3ZWYU9mcEVqU1hHb0IrMHh1TDdXcFowQUUwN2M5N0hqSGJHbVM0Rm9GTEttRFRJYUpKdkpad3QiLCJtYWMiOiIxNTBkNjA2YzNkMDUwYmY2ZDA3NDUzNTM1Y2ZmZTJiNDA0ZGVmMzk4MTYxMDU5Y2ExNTRhMTcyZGEwMmQ1MjE1IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2025-08-07 11:38:28', '2025-08-07 11:38:28'),
(9, 'GET', '[]', 'http://127.0.0.1:8000/tshirts', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImpmdmJ0YktTYU5YdEg0R2s5eE9KaEE9PSIsInZhbHVlIjoiSHVsUmlGeWxOUXpuaitVeDdWQkJKeENLM0NUTENzSGFJNXVrdGp1UXhla1h1dm8yd0FTQUZ3UUhzQmxMWVVJTzQ3c2xQclJBVGF2STEvbWY5RWg1a0d3Z3ZYQll0UUlJanVOSXJKdHUvQmxtbVIxUStIZk56VHJaUU4rN2ZUNEQiLCJtYWMiOiI5YzlkN2RiMDNiYzQ5MzhkY2IxMmUzODliYmRiYmE1MWMxOTkwMjQ2NWJiZDFmNDRhZjEzODQxYmNmNWFmNDYyIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IjVtWTlLOHplbXRpMjQzRVhKVUd1RWc9PSIsInZhbHVlIjoiTm5vS2pMQk5ucnFQWThPRlBjaEE2OC8xSjEvTTZ2Uy9DUHZ4bFh6NS9FY3FGc1JSbitsZDQ2bVdNQmhSQ2pvL2E1SUJ1N0tYWEFUNUNYaWxJdjlIcXo0OCswaG5hY1BnMTNmUXJNdHBhT09zWWxZR0xVa0MvZmo4V0RZaC9PZjMiLCJtYWMiOiIyMmYyZDRkNDE2MTQzZGI3YzNmZGMwNjdhNDg1ZTJkNTAwZGE3N2VmYmUxODI1Zjc3Nzc1MmU4OTUwNzFmZWMzIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 5, NULL, NULL, 1, '2025-08-07 11:40:26', '2025-08-07 11:40:26'),
(10, 'GET', '[]', 'http://127.0.0.1:8000/co-ords', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjFoTFpMeGZCUjlyTkFHbVppdnoydlE9PSIsInZhbHVlIjoiYnRYQ1dldlpMaVdhbTYvc3dzYnJKQktpeFJyQXNBT1RObDFZWUdLaGVHeDdUd0dKK2ptQTNEb05oRlNPTWlTbmx0Z2FrSEJocWZERGdCMWdBZW5JU0MvNXNkVHRicXdjbERiWFZmaGVvL05ZYjFDdVFpYlN3cDhUcG13SG5RbGMiLCJtYWMiOiI4ZTBiNDBmNTU1N2ZmMGI4ZTAxYzEwOTI5ZTFjZGMxNTZiNjQ3NjU3NzJlZDNhYWIzZGQ0ZTJjNjJlZmQ2YTQ5IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IlFWcUREdTBoS1ZPSmI3N0tEanFPMUE9PSIsInZhbHVlIjoiMjY5RCtXWm1NUmR4T2k4Mml4RFJWVUE5dUhwV2Rnc2M5L053MXdmMkhRdU52UW55RTh0K2RHQzdwSzJVL3VGYW9iaXQySzBocFNHc2JLTnRINi9xbGQ1WVZDVEpjZkZrMHNYbHpudGVTc3JtcnZRUmJBUnArZ21HdENDK1NleDYiLCJtYWMiOiIzMTgyOTA1YTMzOTVjMTk4OGU1NjI3YjI4Yzk2ZTdlNTE5ODBmODUyYTMwMTUyMjE4OTA0YWIzNWZmOTVlYjJkIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 8, NULL, NULL, 1, '2025-08-07 11:42:42', '2025-08-07 11:42:42'),
(11, 'GET', '[]', 'http://127.0.0.1:8000/women-dresses', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InZvSHBSb0pZRGZFYlRPSWNoNzE2RGc9PSIsInZhbHVlIjoiZ2dRdmJ4d2N0ME1FUnNZWVlrSWhMYjRZK0lLWXhXeExyUk5DbHA5eE8vdjllRnJXNCtzQVdPdTRpdnhnenNETXRCLzA2NFRkVExobTFrWDNybXViZmVoMFF1VGJ2UlN0Qmw2TUw4R3pNdHptVWdTT2orVFpRb2lrYWpGaWVsd3ciLCJtYWMiOiJhZjJiNDM4YjYyNTNmMDFiNmM2ZGZiMTQ5ZDc0OTUwYTExNDk3N2Q3Y2YwZDZkZTVjOTQ1YTgzZWM4YTliOGIzIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6Ik9BZi9DTjVHanBlMUEyZ0FUdWdBSEE9PSIsInZhbHVlIjoieTNGYXRQc2w1VzNRbSt6c2hIOUgxaFUzb3Bva09YRzFzSHU2Z2FNejlpb0xtMWZFajd2U1VlWTAvMFRMZzZzdXNOcHUzczlTcTRWMVFvalhBbFVQU3E1OHZ6YUllRURlWFFlWkNZRGl6RElMbG5CYUJGbVozcTQveUk2a0lXc2oiLCJtYWMiOiJlNGVkMGRiZWNhM2M3MjI1MDYxOTkyNTBjMTBlYmY0NTljM2FlNzIwNjFkYTM2OWUyYmYyODE0MzQ4Nzc0YzIzIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, 1, '2025-08-07 11:42:57', '2025-08-07 11:42:57'),
(12, 'GET', '[]', 'http://127.0.0.1:8000/tops', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkFWeFZnaUd0OVNUS3E0SFdDRkN5MkE9PSIsInZhbHVlIjoiWmRMWVFCc0xRSGRIVTNma0RkMFFMK0FCUXlDZG9XdTd6UUpBaWFSaUlCTXR6R21oeERyMEhBRStQbkM5QnFkTDlDMFFNSTlkMmNwWmZ3K3c5ZjUxU1RMWnFJNlhLSVV1LzBrNXFEcGJCSHpLWTRRcHhjUDBSOFEwTCtFemtKYXoiLCJtYWMiOiI1M2Y1MmY1ZTY3ODFjYTM0NjNmNGQ2ODEzMmE0OWU1MmZkNWU4ZmY4YWM5NjIyOWQxZmY0NTE3MWI0ZDQzYmI3IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IlRCOHo1TldNZG1IRnFwWHpKVzgwWVE9PSIsInZhbHVlIjoiQnIzMXQ0a1pLTHdMN09nNG9YWTVqS1JmYkIzeU51a1pWcmg0dXBsa1JKUGtyZm45WWFoU29UUVIzUXpFalV3L2d4cDRncUxxM0x5RzB5YlNvU2dxUDBOdG5ZWkZUNTJ2bW8xckZyQkZxOGh2d1A4bVdLeXVBQWRMOHhQcklOSXkiLCJtYWMiOiJiMmZlNjEzYzA0MjdmNjhmNzIxMzc4NTFkYTQ3M2I3NDFkYjMxYjkzODFmYTU4ZWJjZjY3Y2QwYWIyNzYxM2YwIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 9, NULL, NULL, 1, '2025-08-07 11:51:11', '2025-08-07 11:51:11'),
(13, 'GET', '[]', 'http://127.0.0.1:8000/casual-regular-sleeves-printed-women-multicolor-top', 'http://127.0.0.1:8000/tops', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/tops\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6InFyaDdjQW5xKzkvaTF1UFhQdmNDMWc9PSIsInZhbHVlIjoibVFINWtmR1BaRjI0TDUxeGVrT1hZajJDUEsrQ2tBZWk0dk9WUHBReVhHVzlkYkhxZjl5VC80VGVhMXp4dXVOVjhWaTRwN01Ha2hVeFZtVnh4K0dqemtqb01ZVkJqOE1ZUTl1UHF3cUUra2hwNTVPZExRQUtLYjlVNkpDSS9VclUiLCJtYWMiOiIxYTA3ZDM3NjNkMjViMmFhYmY1NjBjNjE0MjkyNmE2YTNmYjQxNzVjOGJlODk3NDNiYTMyMmFkMjhjNDNkYzJkIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IkJLL0VSdXh5bXc0WERYM0FTUjlQMUE9PSIsInZhbHVlIjoiRXRHaC84aG5RenVYSmRSaGNrdTNvclEvTUlib2N1aEVMQlFiRkkycFBFSmxnamFoR1RaNFl1ekpSRFd2R0pBVUhOd2I2TURPSy9wNTVadWpVRG8xaE81OFdLYzAxMWZmcHBXeFZXTzBHMkxQbjFOVmdkNEVvV0NXZENDOGpheVkiLCJtYWMiOiJiNDQ3ZGQ0ZWVhNGY2NTI3MmE1MTFlYjRkYmE3YjU4ZDI3YTE2Y2M4NGE3MjkwOWYxODMwZmEzOWVjNjYwZmRjIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 12, NULL, NULL, 1, '2025-08-07 11:52:16', '2025-08-07 11:52:16'),
(14, 'GET', '[]', 'http://127.0.0.1:8000/women-fit-and-flare-pink-grey-red-maxifull-length-dress', 'http://127.0.0.1:8000/women-dresses', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/women-dresses\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Indoa0dFSllnb1JXQ2ZRY0FFL3JqeUE9PSIsInZhbHVlIjoiSG1qcHpsOXd4SDUrNmV3T053c0xGT2t3cGxva3JteENLZ2NPY0UwSTdaRUJLdTZnblE3MkdPWllyMklSMGkwOXlhTkxmb3VsVm13N0JDZi9FcEQyZVh5bnRSWFNHZExtTVZieklNeE12emcrT0FaM0g3SDl4TXh4MkQ4SFVoYVkiLCJtYWMiOiJmYTE3Y2U4NDNiZTI1NGRiNzA0MmM0MWZiMjBhMDJhYTZlYzY0ZDYwMDJkNjllN2YwMjg3N2NmOTIzMjM1ODhlIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IlhYT0l6RXF3eFdKN1FiZHpZVXdEa0E9PSIsInZhbHVlIjoiOUI3Ty9HZ1poNEM4dXk1eHlyNlJGMkdEd3VSM2NPSlN0eElCcjVITTVJaWlLM2p1Z2VwaDlwd3J4c2ROc2IvTmlVR3NoNUJlUnBNMnF4Vmgrd0llZWpnbS9DaEplRkhpL3JyNmJTSTZRclFRNkpvTzRHTVpGLzVCengzeTNoVWEiLCJtYWMiOiJhYjdlMmQ2ZDBiMjI0Zjg1NzU0NWQzZDA0MjAzYWQwY2NjOGY5ZjdmOGNiM2MwNzdkNTYyMGI3NGI3OWZjMjI1IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 13, NULL, NULL, 1, '2025-08-07 11:56:25', '2025-08-07 11:56:25'),
(15, 'GET', '[]', 'http://127.0.0.1:8000/men-slim-fit-checkered-spread-collar-casual-shirt', 'http://127.0.0.1:8000/shirts', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/shirts\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IngxK09WTlpPZCtSSmsweVRZdjRRZHc9PSIsInZhbHVlIjoiMFJKUHhqM2FZQ0ZyT1hYdndUMEdVKzZtdkIxN1orRkp6bXZ3Y0dqZVppaDZneDczeUN6RjdkR0xFNHNteDhRWFNHeHBFMjRId3MxWDlweHZNdUxyb1N6cytQb0dMd3RMdVZ0akM1Y1cvTWRmak5nU1N3ZC9QQ0x2NlhoalNiRkMiLCJtYWMiOiI4ZGMyYjUzMDE1ZjNjM2M2NzJjNWY0NzMzY2NhNDcxMWNhOWJmZjcwZGNmNGIwOTI5ZDNiYTE4ODJmMTNhY2FlIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6Ikg3TnR0eEZablVCa3Q0WGlOVVVOVkE9PSIsInZhbHVlIjoid0IzcnFweU1INDRoUklwSVVKOTYwSmhNa00rVU0yK1ZKbldvWFI1dkg2Zml3eHNlWlV2YUtscm9NdUhhWTkxcjIrTnZPUEQrWlc4QnZIVFJDZnpJanZkcHRxWWx5Vnl2Y1AyaWhaeXhoWXZ5T1R2ekRsa1hUd2dZVWMzLzBLVmsiLCJtYWMiOiJlZmUxMDBjMGQ2ZDE3NzBiNjEzNDI2ZGE0ZDhkOWIzZTIzOGI1NGNkMDE3YTMxZmQ0Yzg5ZmY4ZmEzY2JjNmMxIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 14, NULL, NULL, 1, '2025-08-07 12:05:50', '2025-08-07 12:05:50'),
(16, 'GET', '[]', 'http://127.0.0.1:8000/arctic-bliss-stylish-winter-scarf', 'http://127.0.0.1:8000/arctic-touchscreen-winter-gloves', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/arctic-touchscreen-winter-gloves\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjU5SWw5NWRGWG9QTjFQUVVoaVRHNGc9PSIsInZhbHVlIjoiaVFJZnRXYmdDTlYrTDBUMnF6VVFtZWM3ZGlobFhFZmFoNWVmSkl1c2Eydlh3T1lWUnhRbWYvaHF3VUlhMDczMVE1WXlQWngyOUZVeFd1ekQyckY5QUxwYVhlSXpBbTlhelFSOXpURHpwQTI4ODVSK2lBNFZDQjUveEFMZWpzbGoiLCJtYWMiOiIzZDVjYTVjYzUyNzM2YmY3ZDA0YTE5MjAxNjM5Yjg5NGQxMTc2Y2QyZDY1NzBjNTA4ZWJjMDMwOWE2ZmQ2OGU0IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IlNwU3pPVkg3eGZlZkcvaUVWc2tERmc9PSIsInZhbHVlIjoiK0UvRHhxQ3lES1dFby9lRWY3MFdHOXlNMU9tbzZtcS93NzdhRURTNk9yTlg0OHc0RCticTlyejZRcURWcnVsenBISVdIdERJTWJ3OHRHRDkrRzB1RzVuS0t6ZWRpZC9yTU9LaFE4Z0FuSWVSbkFZcmJTblNUR1UyWnZiUkJjb3UiLCJtYWMiOiI1NTcxNzA1YWZhMmY5NGRlYjhiMTE4OGUzNmQxNGYwMjQ3ODg3MmQyMGIzOTkzMDIxMzU0OTI0MzY4OTc4ZTgwIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, 1, '2025-08-07 12:11:28', '2025-08-07 12:11:28'),
(17, 'GET', '[]', 'http://127.0.0.1:8000/arctic-warmth-wool-blend-socks', 'http://127.0.0.1:8000/shirts', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/shirts\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImFrWm8rTWsyWitIUno1Y0RIMk1iOWc9PSIsInZhbHVlIjoicHZjWk1NSld0WTB0QWRGRys4Q0FUcll4VG5DSi9hYkFwOHdLNTR0aDljeGhvZklmQ2VpLzBVeWZkZHpqNndHVFpocnlPZGRSQkVNaXFmVHpzeDlwUzg2VGdRMnNkT3o0WEgwa0t2U0s2SXhGRFA0bmIrRk8wcElLVkFFSGorcU4iLCJtYWMiOiJiZGNlZTdhMmY4ZTlkNzk1Zjg0NjQ5ZDhjMDJkYTIzOTEyYWMxZGVmNjMzODE3MjYwNzg0OTkwMGJlNzg5MDMyIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6InNvWGZGVSs0TVZqL3hhdDVLcTNHNEE9PSIsInZhbHVlIjoiZG1iUHZHeDN0c2VjS1I0TE0vb2VuYnJ5Z09wK05BQm4zUk9QQzQzb0tPR0tKWXdPS1FtWllqaWdDK0dkRnBDbW9pekdjSDdwVlVMUCtIMWF5QktCVkZZY1dSbnZsKytGWGNBRTVTNmR1dFlPVVEzN1ZhbldzdUczOHI0UUhnM2wiLCJtYWMiOiI1YmJlYjU5N2ZiZWQxM2JhOTVmOTk1MDIzN2IzMzZhOWNkNzFkMTMyNDAwNzgzYTg2MDY3MmViMjU5YWZmZjY0IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 4, NULL, NULL, 1, '2025-08-07 12:15:01', '2025-08-07 12:15:01'),
(18, 'GET', '[]', 'http://127.0.0.1:8000/pants', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not)A;Brand\\\";v=\\\"8\\\", \\\"Chromium\\\";v=\\\"138\\\", \\\"Google Chrome\\\";v=\\\"138\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/138.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImhPZ2FUNGMvL2hxUml4b2YyU1grNlE9PSIsInZhbHVlIjoidDhnOSs5SXRNcEpmaklzMkRYd2RncVZZbFROK29OUkZSMmdacGVhRm9KS0lqcFpuVGcybzR0MVhOeE5GTkMreEkwQkx1d0lBaDZxd3gvbHU4L3ZEelN0VXFNL2N5OGF4bVlSSXAwZkVkM0JTaWRFaGFrb1IvZDZjU01aZ2o3SnYiLCJtYWMiOiJkOTAwZGUxM2I5OWI2NDhjNGFiZWM4MWIxMjE4YTQ2YTQ4M2UyZmQyNWMzZGI5NTNiMjRjMmI5NjliMzUxY2MwIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6Im90VFJpVXp5cUtZRStXSUlpUW1hVEE9PSIsInZhbHVlIjoiVkVJNVZGUHZEUjdLRkVCaXVpTHlLOE55VitGT1UwZjhCOW5BaVdYZmJZY3MwbENzTzVXdUJpYlhCSzNJZjRDcERtZXdxUWhNWVc2eUdHdTI4N1dZUFdYTXhhUkJ5S3dLU2FWcHo5TEtjN1VBQkRYOTFTSzhFZVptMk45Y1NRN0IiLCJtYWMiOiIyYmI5YjI2ZDE4YzkwY2EwZWM3NTY3ODAxZjJkYTBlZjM0NDhhNzIyMDdhMDJiYTMzOGRlN2IyN2VkNWMzNTNmIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, 1, '2025-08-07 12:56:09', '2025-08-07 12:56:09'),
(19, 'GET', '[]', 'http://127.0.0.1:8000', 'http://127.0.0.1:8000/shirts', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"cache-control\":[\"max-age=0\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/shirts\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImE4dmoyb0lYTnNpdnVxUHBtbzM4M2c9PSIsInZhbHVlIjoiVjAwRmhhSmhqV0d2MnZMakZ1UmJoM1JzdWRDSFFhRlRkUk9idFhZbG1Peko0S3RtWHF4SFlrY2R5WXRRVUkzUjRQNloydzFFLzF3RUhNajZxc3dFZ1Z4ZDNLdFU0cHJLWTgvKzh2UzBPZms5VGNYT2x4K0IxcU5ZUTViWkYwM2oiLCJtYWMiOiIzM2RmMzM0NTBkZjkzZDhkZjRjNzIxNjZiNGRkZDcyNDFlOTBlMzFhMDk2ZmExMDA5ZmQ4ODcxMGQxMjdmYjc0IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6Ik9WQ1dDdzFoT3pmUWw2SitLVG54WUE9PSIsInZhbHVlIjoiWmNTOHo1SERyS1BCWHpoQWZ0L2xkWU5ZV01Pdk9PRnZQeEdCSHIxSm1FaG9DUXlNa3JBK1d5MVd4NTZNZVpnY3k2Si82SVdBMWxhc1RMWks3SDJEOWpFc0dpYkF1NkV5bVdIWDVGNTJhQ0tjM01QTVdJNVVFbEhZSTlJQnBQdWUiLCJtYWMiOiI0ZmEzZGU5ZDJlODgwOGU4MDg0YzQxYTkyMTIyODY3NGUzNDliZjFjOGMwY2UzZDFhZDQ5Njg2ZTAwZDg0MzhiIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-08-08 13:44:25', '2025-08-08 13:44:25'),
(20, 'GET', '[]', 'http://127.0.0.1:8000/women', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImVpY1BrQXJXdmN5UGlMY1U1MW13ZkE9PSIsInZhbHVlIjoiUHVDQVYzc2VORWEvY1ZaaDVDNVJPTURUWG9WdWNmcjA0N1lLRWplbjh3MHREclkreDhKaUk1RG85Uk9LVitFZ0RnYkJvc0ZnVnlqejJPMTgreUkxUTFXQlBsOUFSMEF0OU1wRnVjZmhQNFE3RnhCUGpJQXZTczZNY1RKRTRpWHkiLCJtYWMiOiIxM2E1NDQ0OWI4MmJkNTMyNWE3ZTFmZDU4Mjk3MzkwN2EzNmVlNDEzNWJhYWRjNzQ1MzA1OTZmMjg5MzE4ZDcxIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IlhaeGdSdmxHU2RWZVN3SnBaMTF6Mmc9PSIsInZhbHVlIjoieVBWVUhMOGZxVUdNbVp4eVlpdWxnVnFGS0NrMHpac3RJZGorRWlYS2xETmF0NmJCak1RTU9OeEdUYm5ONE9LSnNWNm92Um9mbEJBMktTSnV5cmFYdVhPSWhRbW1iTk1vM3lRcENZd3Y0SGtmZGtGNk9GNk1sYVNXOWlCVFo0ZmIiLCJtYWMiOiJlZGU4ZWFmZGIyY2IyNTE5YTE3ZmM2ZjM5NTU0ZGM5ZTFkY2NiMWJlZDMwYTliZmM3ZGIxZTY3ZDM3YTY0MzJiIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 4, NULL, NULL, 1, '2025-08-08 13:44:57', '2025-08-08 13:44:57'),
(21, 'GET', '[]', 'http://127.0.0.1:8000/women-dresses', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImFONmNRc2NNMjBCT3NNamtjVzdHc0E9PSIsInZhbHVlIjoiNkVEeGdJalVONXZhN1BIdlRocW1rb2o1cGIzWlJuN2JPZExoS0JKSUFkaERzd1I3M0hBTnJDdlFZWGQ2QVlvTVJUUlNWSmZmTit4UW1LVU9EaWE4UlBqbjUyK2hmRzNTWXJ0eFFMeVhIdWVjVytsRlROUkxCZi9VMW5LRmM5dnQiLCJtYWMiOiI5ZjQ5YmE5ZTJiOWU5N2UwNDM0Y2YyMGM0NDBiNjUxOGIzY2Q5MWY4MDRhNjUxZWZkNDcyYWRmMDJmN2UyZjk3IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IjlOMjRxY1lwM1p3alVDVmNNL056UWc9PSIsInZhbHVlIjoiV2JmYjhMK3dFQlFLOHJtRmVJNFh5TW9mTERCVW4xNUQ3T3JHbmJCMHc4dDFwcnFZWS9pMExVblQ1VC9qcjZHdU1JWnozeis2aTY2OWZETzlkcGtodFphLzViREUvT1YwbGxCS3pIZlU1aC9iZDFmd3NScUpkUW0yS3A1ZzI1WTMiLCJtYWMiOiI2Y2RiMmQxMzkzMjhmYjRlNTBlNzMyNjQwNjBjOGYwYzA0M2RjNzE5YmE2YTM0NjEzOTE4YTRmZTliZDUxZDQ5IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 7, NULL, NULL, 1, '2025-08-08 13:45:01', '2025-08-08 13:45:01'),
(22, 'GET', '[]', 'http://127.0.0.1:8000/women-fit-and-flare-pink-grey-red-maxifull-length-dress', 'http://127.0.0.1:8000/women-dresses', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/women-dresses\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IkNlRmJzSkQ5NzZReUNGWW1oSmVRTUE9PSIsInZhbHVlIjoiYXhrcXlSREVZZEFTbExYVEVvS2lLWndpeUFWeDlOSGJOdkI0MUI3N2p6Uk50aGR3dFZpSmN3YnhFVUN3ZzZMRmh0SVRVVzNyT1NqVEtpVkplZjlmRnpYOU9uRFl3TXdXMEkwUHpZaTIrbFZnY1pNWDlPV3pEUGJUUmFodG83NDYiLCJtYWMiOiJhNThjNDZlMDI4MjAwNjRjMDZhMTQ1NGVhOWE2ZmQ4ZDExMGM4YjFmNGIzZTY3OWU5MDg1Mzk2ZGQzNDQyODhlIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IkRvWnU1VHQxdHRUWkRPSWZvNkZtV0E9PSIsInZhbHVlIjoiZGFoNDZTVlhaeGFsV0dYeWF1bXB2L0xXa2RNaE9VNXJIcU1IbmxUQUtFUVdMbG1uMEVDaklFSnkxVXYwdmozZkROKzExTjFYRnN3QksrK0g3TnpYNmlEdjVMaTRDRmRXMGRyWktHZ3lvV29EL25JajVkU1hrcEwrRkx4VXI3Q0giLCJtYWMiOiI4N2RkYjMxOWM4OWE2NThmNThkYWY4Zjk3YTU2YjkwZWM5YTA2M2EyMGY2YWRjODM4NTkyOGI2NGRiN2VkZTk3IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 13, NULL, NULL, 1, '2025-08-08 13:45:38', '2025-08-08 13:45:38'),
(23, 'GET', '[]', 'http://127.0.0.1:8000/women-fit-and-flare-blue-ankle-length-dress', 'http://127.0.0.1:8000/women-dresses', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/women-dresses\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjBxVUUrZGgxNzJOUVF0ZTBQRzZnYXc9PSIsInZhbHVlIjoiTDc1cTZFZkg4bmFFaXVYOVdaREduekw2QVVsVFp3Y2R5Z2hIQzZjVDVZMXFhUFY2WVRkbFpiNEJmUUNZRi9TUE8rTW9NVEZoMFd4dWx1d1JpTzVvdmNKeVg4K1J0eTFiTHVaQUlLVmxscFZDZWpIaENlQWo3ejU5dDltR2ZLc0wiLCJtYWMiOiIzNjgzZDc3NzBhMGQyZmUyOWFiZmMxMGJhY2U4MjhmYWEyZDMxOWExYzFhZGViNTYwYjZlNGJkOGFlM2EyODg1IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IisyZTZqcUJid2xleThrV3p2RlZtSUE9PSIsInZhbHVlIjoiVVN2Ri9CZjFWSCsvUzAyZnp5TzlRMHdBSDBzVkRvUjVpRHFKTWlDQ2NPYi9ibUNQRUFBOVk0ckV2N3U1N0ZFc0habE5XVG04WnNrRUJSTkNLa2lPYWZBWXVBWFBhWEhkRStQMWJublNVUm0vK3RGT0pIUWJmdU13Vm42Y3VXT0siLCJtYWMiOiIzMTRiODE3NDQ5MjMyZDRkZmQ0OWM0NjYxMjgwYTRiYWQyNzkwMTJjZjE5NzY5YjQ2N2IwMDA0YjE2ZmE1NWIxIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 18, NULL, NULL, 1, '2025-08-08 13:46:10', '2025-08-08 13:46:10'),
(24, 'GET', '[]', 'http://127.0.0.1:8000/arctic-cozy-knit-unisex-beanie', 'http://127.0.0.1:8000/', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IitaU1BvcTZhbWFiR1Q5ZmVsZkpyNFE9PSIsInZhbHVlIjoiVDlBM3dBdkZuTTdGZUg2SUlzSjNybVFLSGNsTFJLZnB6eWp4K0MyK1kxM2pudkwwaXV2TjVrK1FTNXAvUDlOb1VpelA2Q1pUU2xZRTJ3VUVNOVArYktyK0ZSOVFJQ0wrenRQOGtLdWc5bmdQREVPQnQvb3BTUVNqMGpkdVdzbm0iLCJtYWMiOiIwZGZlMzNkMTgxNzk0MzZkMjg2ZmFmNGZiZGEzMWY1N2M2YzE5Y2YwYjlmMjU0NTM2ZjhmMGFlOGFmZDFjYzY4IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6Im1Oa1VVdUNpK2QxazhjU2xHRlZWQXc9PSIsInZhbHVlIjoiOXVZSE5mMTNBR085SC9TY0srcytrbE8xbC9wQ3NjTHllOW0yajExejNXemNEMjhWNlhDa0JLSmc3Y3dpcU9meXpNazZwUFJmQTJLZkZoVWtJTDROM3BDakU4enV4UklBeCtLeUNUTWQ0azk3QllvS0lyM3JSV1dMeGdrd3JrWSsiLCJtYWMiOiI3ZDYwMDJhZGFiM2JiODAyOTIyYWIwM2Q1OGRhNzMxNTNjMGRjM2JiYzRiMjU0OTIwZTFlZTJiNzUwNzI1ZGQyIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 1, NULL, NULL, 1, '2025-08-08 13:48:28', '2025-08-08 13:48:28');
INSERT INTO `visits` (`id`, `method`, `request`, `url`, `referer`, `languages`, `useragent`, `headers`, `device`, `platform`, `browser`, `ip`, `visitable_type`, `visitable_id`, `visitor_type`, `visitor_id`, `channel_id`, `created_at`, `updated_at`) VALUES
(25, 'GET', '[]', 'http://127.0.0.1:8000/men', 'http://127.0.0.1:8000/women-dresses', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/women-dresses\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImRiS1RIazBaUyswT2FBcE45THF6dXc9PSIsInZhbHVlIjoicE8reHdPSFZsKytlaFhCekJZczc5N1BvUDh6U2MvNER6Y2ZvRktRcjJ3VXUwdjFyTnAyY1RORG1SMlVPb2tlWFVwaGVHQitIWVRVUDdDWXlXZ0g4cUdtSUs0Y2lQSzFxbmVwdEduMkdyMWdzMTJJQ2V4YWlZNTNCV2ZoY1F3ZmgiLCJtYWMiOiJhODJkYTkyNzgwYjM4MGRhNjBhMDNjYzBkYTk5Y2QxZWZlZjJmZjBiYjE3NmE3Y2IyZGFkMTNmM2ZiZDQ4NzJlIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IkN2Z25JN3pKbzBacy9QYWI1aW9ObWc9PSIsInZhbHVlIjoiS3Q5WkJ1NFplOXhla3ZZY29yVnhnMGlaTzIrVFdadWtOdHUvczJjdlRzQTFXeVpYdHBlN3hTck9POE85M0dRQXhNZ0tXaTBYN3I3eVRCVDFuVmdEVE9pSG00ZFRJMUIzTzI3KzF6eVo3RkZPbENua0xvU1VEb0t2eE5wK1lCdXYiLCJtYWMiOiIxMDc4MWJmZDRmNDRiMzU0MWMyZTUxZjVhODE0ZmRiNzY5NWE5MmI2NjZjMGNmZGY2NWQ5ZmIwZmZlNzgxODRmIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 2, NULL, NULL, 1, '2025-08-08 13:50:48', '2025-08-08 13:50:48'),
(26, 'GET', '[]', 'http://127.0.0.1:8000/shirts', 'http://127.0.0.1:8000/women-dresses', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/women-dresses\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6ImRiS1RIazBaUyswT2FBcE45THF6dXc9PSIsInZhbHVlIjoicE8reHdPSFZsKytlaFhCekJZczc5N1BvUDh6U2MvNER6Y2ZvRktRcjJ3VXUwdjFyTnAyY1RORG1SMlVPb2tlWFVwaGVHQitIWVRVUDdDWXlXZ0g4cUdtSUs0Y2lQSzFxbmVwdEduMkdyMWdzMTJJQ2V4YWlZNTNCV2ZoY1F3ZmgiLCJtYWMiOiJhODJkYTkyNzgwYjM4MGRhNjBhMDNjYzBkYTk5Y2QxZWZlZjJmZjBiYjE3NmE3Y2IyZGFkMTNmM2ZiZDQ4NzJlIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IkN2Z25JN3pKbzBacy9QYWI1aW9ObWc9PSIsInZhbHVlIjoiS3Q5WkJ1NFplOXhla3ZZY29yVnhnMGlaTzIrVFdadWtOdHUvczJjdlRzQTFXeVpYdHBlN3hTck9POE85M0dRQXhNZ0tXaTBYN3I3eVRCVDFuVmdEVE9pSG00ZFRJMUIzTzI3KzF6eVo3RkZPbENua0xvU1VEb0t2eE5wK1lCdXYiLCJtYWMiOiIxMDc4MWJmZDRmNDRiMzU0MWMyZTUxZjVhODE0ZmRiNzY5NWE5MmI2NjZjMGNmZGY2NWQ5ZmIwZmZlNzgxODRmIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 3, NULL, NULL, 1, '2025-08-08 13:50:53', '2025-08-08 13:50:53'),
(27, 'GET', '[]', 'http://127.0.0.1:8000/arctic-bliss-stylish-winter-scarf', 'http://127.0.0.1:8000/shirts', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/shirts\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlJXQzdyR0treGplVzZ4SmV5RDJhUVE9PSIsInZhbHVlIjoib09NdXMvdnh6UllvanovRldsZjRrTlRvblJvbHljc0tVTVpMaEsxanBJMms4dUFja1VkZDNwNGJoQzJCRFlDdWtjVk5sMlJRYnZyQnlyZjkrQUVweWhQYmNFK00yb1VMT1NBamswTzFMN2V1TGFuenlPUjVHZTNhNzZndkdHbXgiLCJtYWMiOiIxNTlhNGIwNmUxNzA4ZDJiMmUyYjVjYWFjZWM2MTY2MDU0NDI4YjA5ZTNjY2JkZTNkOTQ0NjU4OTI3NGQxYjllIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6InN5YkV2MkFId3FHZEE4c0E1TnpNaHc9PSIsInZhbHVlIjoiOHlYRUZtOENXMXpMVWcwNEdNcHpUTnF3VU90QU1tOXJyWVlnY2lHbUVlcG5udW1rTU5OUUYxTnlFQ0x0QUUzV0x5WHpzWGRxTmYxWG5PMGU1YWhBOUVrY2JlSWN3MGF2emNPK3VzandKd2ZFSDRhZ3ArWUtVbTQ5czJIYnJzZjEiLCJtYWMiOiJiNGQ2MDkzM2MzZDQxMjI1MDU2ZGE5OGM0ZWZmYjA3NTlmYzU3YWIwODlmNjFmMzI1NWU0MmFiMTU3N2FlYjQ2IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 2, NULL, NULL, 1, '2025-08-08 13:51:29', '2025-08-08 13:51:29'),
(28, 'GET', '[]', 'http://127.0.0.1:8000/men-regular-fit-solid-spread-collar-casual-shirt', 'http://127.0.0.1:8000/shirts', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/shirts\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IitCcml2MmkvdHJvdEVzNnJvcXhQNnc9PSIsInZhbHVlIjoiU2VDa2JXQm5EYnlFRHRiNXdjVjJJN0lucFdWaHdETWNQeHRmTjM2MmtPQXRxWnJsNEhqM3N0ZENPSWc3WHd4MEJhQXk2NjM3eFIxelVYR1JHaVNEUS9NNXJZZHNyZWVDWFpYZTNKQ2pReFhhN1duNks1ZXNKcldDVEkwQ203Q3QiLCJtYWMiOiIyZTIxMzYzMWM5N2FkMTkwYjJhZjhmOWZjN2Q4ZDY5ZjgzOGFmYmRhODhhNWYzODA5OGIzZWJhOGFmY2IwNWYzIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6Iko2eUJCc0ZQTlBEWnRvdEc3NE1VNmc9PSIsInZhbHVlIjoiZU93QzdPc281WlFranZHaHQ0ZDM1ZHhwZ0lMeTVaemlRRVZ6a0c4WDhYbHcxNFpGcnV3azRjdFd1bGFnSWcrM3lLMWlVNnYxd05sTVBpMXdtOVVrTkJJNHNJTXJUa1BUdC92cU4zN3B1SUY4eHNjZ2l5S1hEeVVVNm82NHg4ZjMiLCJtYWMiOiJiZGZlN2JlZDNkYmQwMjcyNGY4Y2MwMWEzNGUyMjk0ZWMzYzgwMzRlZmI3OGZlZDYzM2FkMzJkYjM5NDU2NzUzIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 17, NULL, NULL, 1, '2025-08-08 13:51:39', '2025-08-08 13:51:39'),
(29, 'GET', '[]', 'http://127.0.0.1:8000/.well-known/appspecific/com.chrome.devtools.json', NULL, '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"no-cors\"],\"sec-fetch-dest\":[\"empty\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IitCcml2MmkvdHJvdEVzNnJvcXhQNnc9PSIsInZhbHVlIjoiU2VDa2JXQm5EYnlFRHRiNXdjVjJJN0lucFdWaHdETWNQeHRmTjM2MmtPQXRxWnJsNEhqM3N0ZENPSWc3WHd4MEJhQXk2NjM3eFIxelVYR1JHaVNEUS9NNXJZZHNyZWVDWFpYZTNKQ2pReFhhN1duNks1ZXNKcldDVEkwQ203Q3QiLCJtYWMiOiIyZTIxMzYzMWM5N2FkMTkwYjJhZjhmOWZjN2Q4ZDY5ZjgzOGFmYmRhODhhNWYzODA5OGIzZWJhOGFmY2IwNWYzIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6Iko2eUJCc0ZQTlBEWnRvdEc3NE1VNmc9PSIsInZhbHVlIjoiZU93QzdPc281WlFranZHaHQ0ZDM1ZHhwZ0lMeTVaemlRRVZ6a0c4WDhYbHcxNFpGcnV3azRjdFd1bGFnSWcrM3lLMWlVNnYxd05sTVBpMXdtOVVrTkJJNHNJTXJUa1BUdC92cU4zN3B1SUY4eHNjZ2l5S1hEeVVVNm82NHg4ZjMiLCJtYWMiOiJiZGZlN2JlZDNkYmQwMjcyNGY4Y2MwMWEzNGUyMjk0ZWMzYzgwMzRlZmI3OGZlZDYzM2FkMzJkYjM5NDU2NzUzIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', NULL, NULL, NULL, NULL, 1, '2025-08-08 13:51:43', '2025-08-08 13:51:43'),
(30, 'GET', '[]', 'http://127.0.0.1:8000/men-slim-fit-checkered-spread-collar-casual-shirt', 'http://127.0.0.1:8000/shirts', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/shirts\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Ik51RjNnR2pTZXNZeXM3TGtCR2R2RUE9PSIsInZhbHVlIjoiSmxBZllScEhNQ0FRREN2eWtBbkdkdVgwL05RZXBDTUw0RDFqMmlEaDdHN1ZuL3hXV3FmdnlBVUh2WWhmQUlZOHR6bUF4bHcvVlNlMENoZUZKRUZYWm9CUGdzZjFnOERFK0UrOExLR1doUXRXcVliZXFqRFhjc2NrTk53S2VwcHQiLCJtYWMiOiIxYWMwNjdiNTQwM2ZlZWM4ODdiYmNjOWNjNDYwNzY3YzA0ZjRlYWJhNjMzZmUxNmM4YzU4ZWE0ZDI3YjI5MGFmIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IkxlNEhQWVVxQVpDc25HNUE1SEJiL1E9PSIsInZhbHVlIjoicXM0eGcyalV2S1JmMjdHdWVpOE9CdXYrRWk4dFA1Zk9qQ2cwZ1VGOW16TkdiQ3NzUGlhTnhNdXdpd09BL0Y0VXNNS005Z1RlY1dGanVNK2ZLRTRjRmJISEVEMElnOGFUTmRMdERNVDk3bjdwTE9ROXlNWkNNNTQ3THY4MlZoK3IiLCJtYWMiOiJhNTg0MTVhN2Q1YWQwZjRkMTc2ZWU0NmUyMjE5MWUwMDczOGQzYjgwMTQzMjNmMjVmNzExZDI0YTM5MzU3NWFjIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 15, NULL, NULL, 1, '2025-08-08 13:53:20', '2025-08-08 13:53:20'),
(31, 'GET', '[]', 'http://127.0.0.1:8000/pants', 'http://127.0.0.1:8000/shirts', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/shirts\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Ik51RjNnR2pTZXNZeXM3TGtCR2R2RUE9PSIsInZhbHVlIjoiSmxBZllScEhNQ0FRREN2eWtBbkdkdVgwL05RZXBDTUw0RDFqMmlEaDdHN1ZuL3hXV3FmdnlBVUh2WWhmQUlZOHR6bUF4bHcvVlNlMENoZUZKRUZYWm9CUGdzZjFnOERFK0UrOExLR1doUXRXcVliZXFqRFhjc2NrTk53S2VwcHQiLCJtYWMiOiIxYWMwNjdiNTQwM2ZlZWM4ODdiYmNjOWNjNDYwNzY3YzA0ZjRlYWJhNjMzZmUxNmM4YzU4ZWE0ZDI3YjI5MGFmIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IkxlNEhQWVVxQVpDc25HNUE1SEJiL1E9PSIsInZhbHVlIjoicXM0eGcyalV2S1JmMjdHdWVpOE9CdXYrRWk4dFA1Zk9qQ2cwZ1VGOW16TkdiQ3NzUGlhTnhNdXdpd09BL0Y0VXNNS005Z1RlY1dGanVNK2ZLRTRjRmJISEVEMElnOGFUTmRMdERNVDk3bjdwTE9ROXlNWkNNNTQ3THY4MlZoK3IiLCJtYWMiOiJhNTg0MTVhN2Q1YWQwZjRkMTc2ZWU0NmUyMjE5MWUwMDczOGQzYjgwMTQzMjNmMjVmNzExZDI0YTM5MzU3NWFjIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 6, NULL, NULL, 1, '2025-08-08 13:53:25', '2025-08-08 13:53:25'),
(32, 'GET', '[]', 'http://127.0.0.1:8000/arctic-frost-winter-accessories-bundle', 'http://127.0.0.1:8000/shirts', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/shirts\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6Ik51RjNnR2pTZXNZeXM3TGtCR2R2RUE9PSIsInZhbHVlIjoiSmxBZllScEhNQ0FRREN2eWtBbkdkdVgwL05RZXBDTUw0RDFqMmlEaDdHN1ZuL3hXV3FmdnlBVUh2WWhmQUlZOHR6bUF4bHcvVlNlMENoZUZKRUZYWm9CUGdzZjFnOERFK0UrOExLR1doUXRXcVliZXFqRFhjc2NrTk53S2VwcHQiLCJtYWMiOiIxYWMwNjdiNTQwM2ZlZWM4ODdiYmNjOWNjNDYwNzY3YzA0ZjRlYWJhNjMzZmUxNmM4YzU4ZWE0ZDI3YjI5MGFmIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IkxlNEhQWVVxQVpDc25HNUE1SEJiL1E9PSIsInZhbHVlIjoicXM0eGcyalV2S1JmMjdHdWVpOE9CdXYrRWk4dFA1Zk9qQ2cwZ1VGOW16TkdiQ3NzUGlhTnhNdXdpd09BL0Y0VXNNS005Z1RlY1dGanVNK2ZLRTRjRmJISEVEMElnOGFUTmRMdERNVDk3bjdwTE9ROXlNWkNNNTQ3THY4MlZoK3IiLCJtYWMiOiJhNTg0MTVhN2Q1YWQwZjRkMTc2ZWU0NmUyMjE5MWUwMDczOGQzYjgwMTQzMjNmMjVmNzExZDI0YTM5MzU3NWFjIiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 6, NULL, NULL, 1, '2025-08-08 13:53:33', '2025-08-08 13:53:33'),
(33, 'GET', '[]', 'http://127.0.0.1:8000/men-slim-fit-blue-lycra-blend-trousers', 'http://127.0.0.1:8000/pants', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"sec-purpose\":[\"prefetch;prerender\"],\"purpose\":[\"prefetch\"],\"sec-speculation-tags\":[\"null\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/pants\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IjFvd0pRWXhFNU5OZU9CcG9Sc1Y4U3c9PSIsInZhbHVlIjoiMDNtT3JqdnRBUld6VFFZb2o5dTVVVjlSamlWUlFEaFQ5WTFreGE0SkRmYVFuWGxjOHo0VmVsNUhJaGx1aFc4bDBCMVUyUDlDbWdwekFGbDIrNm9SWlJNejdRTXplWGRiWDM5cWZyRFpxYmlGT1RUMllrNjBoNVFxV25iaExPUjciLCJtYWMiOiIwYjI1MTE1MzU3MmNlYjJmZGVmMTdlYmJiOTMxYzgxMjk3MjE3ODE1Y2E5ZjkwMTNmYmVhNDA4YTk2NjEyOGE3IiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6InRkdk5EblpvMG5KbjFTR1hjOFFROFE9PSIsInZhbHVlIjoiUXlkTzdubG0rcWxMRGVCcWdRcytzOGt4U01FYmNkVnpMVDN5TGdsbzFMemxqYkl1bG9lVytjN1hvZXZSQ3lTT0RmN0hsNVJaUHovSG5YQ2pqL29rUHZOZVhDd0hnRTljZ2hYMHJCenFlL2hSYWs5c29yTkRaMHc0K0w0d1ZiZEYiLCJtYWMiOiI0ZTViODE4ZDAwYmI2MzJkZGI2NzcxZGJlYWI2Mjg1NmE3YjMyNTQ0YTdjYjQzODBmZjYzMzRkYTdmYWEwOWQ4IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Product\\Models\\Product', 16, NULL, NULL, 1, '2025-08-08 13:55:23', '2025-08-08 13:55:24'),
(34, 'GET', '[]', 'http://127.0.0.1:8000/co-ords', 'http://127.0.0.1:8000/pants', '[]', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36', '{\"host\":[\"127.0.0.1:8000\"],\"connection\":[\"keep-alive\"],\"sec-ch-ua\":[\"\\\"Not;A=Brand\\\";v=\\\"99\\\", \\\"Google Chrome\\\";v=\\\"139\\\", \\\"Chromium\\\";v=\\\"139\\\"\"],\"sec-ch-ua-mobile\":[\"?0\"],\"sec-ch-ua-platform\":[\"\\\"Windows\\\"\"],\"upgrade-insecure-requests\":[\"1\"],\"user-agent\":[\"Mozilla\\/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/139.0.0.0 Safari\\/537.36\"],\"accept\":[\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/avif,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.7\"],\"sec-fetch-site\":[\"same-origin\"],\"sec-fetch-mode\":[\"navigate\"],\"sec-fetch-user\":[\"?1\"],\"sec-fetch-dest\":[\"document\"],\"referer\":[\"http:\\/\\/127.0.0.1:8000\\/pants\"],\"accept-encoding\":[\"gzip, deflate, br, zstd\"],\"accept-language\":[\"en-US,en;q=0.9\"],\"cookie\":[\"XSRF-TOKEN=eyJpdiI6IlByL0xZTzVtUUJ4Nm5DTHRZQUtvdFE9PSIsInZhbHVlIjoiQ1dpV0duWFp0S281M3Z5enpnR1A5dXdGdTRnTHNhazZvakttWFIyblQ3NlQyOHovUmVRNS91TTA5VDJtcW9ITEJxWHlvMzZmRlR6M1ZWY0kzaHhTa0x0bmtPMzNoM0lVVnR0MFhPY0ZjQS9ERDJtMUpJOVVJdUZxYjIvZW9QOC8iLCJtYWMiOiIxYTU3ZmQ3NTE5MGZhNTRhOTZiNWQxNDkwY2JhNWY4NzljYTRkMjIwZDVkY2M4ODU4Y2I2YjM4NDg5ZjUxZTcyIiwidGFnIjoiIn0%3D; funkysouq_session=eyJpdiI6IngycVUvMDJ2cDBVbGdCWlBVY0lxRnc9PSIsInZhbHVlIjoiTUxrMElpYkxHVUFxYU94LzI0TUk1clloNHkyU2xkVExaNWd4dGlrdngyaXdRTzA2QlFNS2tLWHh4ZjVLN2N1T0tLMGh3ejF5LzFqK05XMUg1dDhwdHhHbkd4OG1qWGkrQUlDVlVBMUxRaWFOMjhtUlFWU2xEMlJmdGErOXp4Wk0iLCJtYWMiOiJlNzhjZTNhOTMwYjIyNmE1NGU1MDI0N2FjNjNiOWMxZTNmMTlhMzcwMzk4NzdkZTM4NjA1YzVmNTM5YTI1NmI2IiwidGFnIjoiIn0%3D\"]}', '', 'Windows', 'Chrome', '127.0.0.1', 'Webkul\\Category\\Models\\Category', 8, NULL, NULL, 1, '2025-08-08 13:56:52', '2025-08-08 13:56:52');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `item_options` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`item_options`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `time_of_moving` date DEFAULT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `channel_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `customer_id` int(10) UNSIGNED NOT NULL,
  `additional` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`additional`)),
  `moved_to_cart` date DEFAULT NULL,
  `shared` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_customer_id_foreign` (`customer_id`),
  ADD KEY `addresses_cart_id_foreign` (`cart_id`),
  ADD KEY `addresses_order_id_foreign` (`order_id`),
  ADD KEY `addresses_parent_address_id_foreign` (`parent_address_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_api_token_unique` (`api_token`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attributes_code_unique` (`code`);

--
-- Indexes for table `attribute_families`
--
ALTER TABLE `attribute_families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_groups_attribute_family_id_name_unique` (`attribute_family_id`,`name`);

--
-- Indexes for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD PRIMARY KEY (`attribute_id`,`attribute_group_id`),
  ADD KEY `attribute_group_mappings_attribute_group_id_foreign` (`attribute_group_id`);

--
-- Indexes for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_options_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_option_locale_unique` (`attribute_option_id`,`locale`);

--
-- Indexes for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_translations_attribute_id_locale_unique` (`attribute_id`,`locale`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_order_item_id_foreign` (`order_item_id`),
  ADD KEY `bookings_booking_product_event_ticket_id_foreign` (`booking_product_event_ticket_id`),
  ADD KEY `bookings_order_id_foreign` (`order_id`),
  ADD KEY `bookings_product_id_foreign` (`product_id`);

--
-- Indexes for table `booking_products`
--
ALTER TABLE `booking_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_products_product_id_foreign` (`product_id`);

--
-- Indexes for table `booking_product_appointment_slots`
--
ALTER TABLE `booking_product_appointment_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_appointment_slots_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `booking_product_default_slots`
--
ALTER TABLE `booking_product_default_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_default_slots_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `booking_product_event_tickets`
--
ALTER TABLE `booking_product_event_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_event_tickets_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `booking_product_event_ticket_translations`
--
ALTER TABLE `booking_product_event_ticket_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bpet_locale_unique` (`booking_product_event_ticket_id`,`locale`);

--
-- Indexes for table `booking_product_rental_slots`
--
ALTER TABLE `booking_product_rental_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_rental_slots_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `booking_product_table_slots`
--
ALTER TABLE `booking_product_table_slots`
  ADD PRIMARY KEY (`id`),
  ADD KEY `booking_product_table_slots_booking_product_id_foreign` (`booking_product_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_customer_id_foreign` (`customer_id`),
  ADD KEY `cart_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_items_parent_id_foreign` (`parent_id`),
  ADD KEY `cart_items_product_id_foreign` (`product_id`),
  ADD KEY `cart_items_cart_id_foreign` (`cart_id`),
  ADD KEY `cart_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_payment_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `cart_rules`
--
ALTER TABLE `cart_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD PRIMARY KEY (`cart_rule_id`,`channel_id`),
  ADD KEY `cart_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupons_cart_rule_id_foreign` (`cart_rule_id`);

--
-- Indexes for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` (`cart_rule_coupon_id`),
  ADD KEY `cart_rule_coupon_usage_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_rule_customers_cart_rule_id_foreign` (`cart_rule_id`),
  ADD KEY `cart_rule_customers_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD PRIMARY KEY (`cart_rule_id`,`customer_group_id`),
  ADD KEY `cart_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cart_rule_translations_cart_rule_id_locale_unique` (`cart_rule_id`,`locale`);

--
-- Indexes for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_shipping_rates_cart_id_foreign` (`cart_id`);

--
-- Indexes for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD PRIMARY KEY (`catalog_rule_id`,`channel_id`),
  ADD KEY `catalog_rule_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD PRIMARY KEY (`catalog_rule_id`,`customer_group_id`),
  ADD KEY `catalog_rule_customer_groups_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_products_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_products_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_products_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_products_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `catalog_rule_product_prices_product_id_foreign` (`product_id`),
  ADD KEY `catalog_rule_product_prices_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `catalog_rule_product_prices_catalog_rule_id_foreign` (`catalog_rule_id`),
  ADD KEY `catalog_rule_product_prices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories__lft__rgt_parent_id_index` (`_lft`,`_rgt`,`parent_id`);

--
-- Indexes for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD KEY `category_filterable_attributes_category_id_foreign` (`category_id`),
  ADD KEY `category_filterable_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_translations_category_id_slug_locale_unique` (`category_id`,`slug`,`locale`),
  ADD KEY `category_translations_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channels`
--
ALTER TABLE `channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channels_root_category_id_foreign` (`root_category_id`),
  ADD KEY `channels_default_locale_id_foreign` (`default_locale_id`),
  ADD KEY `channels_base_currency_id_foreign` (`base_currency_id`);

--
-- Indexes for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD PRIMARY KEY (`channel_id`,`currency_id`),
  ADD KEY `channel_currencies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD UNIQUE KEY `channel_inventory_source_unique` (`channel_id`,`inventory_source_id`),
  ADD KEY `channel_inventory_sources_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD PRIMARY KEY (`channel_id`,`locale_id`),
  ADD KEY `channel_locales_locale_id_foreign` (`locale_id`);

--
-- Indexes for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `channel_translations_channel_id_locale_unique` (`channel_id`,`locale`),
  ADD KEY `channel_translations_locale_index` (`locale`);

--
-- Indexes for table `cms_pages`
--
ALTER TABLE `cms_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD UNIQUE KEY `cms_page_channels_cms_page_id_channel_id_unique` (`cms_page_id`,`channel_id`),
  ADD KEY `cms_page_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cms_page_translations_cms_page_id_url_key_locale_unique` (`cms_page_id`,`url_key`,`locale`);

--
-- Indexes for table `compare_items`
--
ALTER TABLE `compare_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `compare_items_product_id_foreign` (`product_id`),
  ADD KEY `compare_items_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `core_config`
--
ALTER TABLE `core_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `country_states`
--
ALTER TABLE `country_states`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_states_country_id_foreign` (`country_id`);

--
-- Indexes for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_state_translations_country_state_id_foreign` (`country_state_id`);

--
-- Indexes for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `country_translations_country_id_foreign` (`country_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `currency_exchange_rates_target_currency_unique` (`target_currency`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customers_email_unique` (`email`),
  ADD UNIQUE KEY `customers_phone_unique` (`phone`),
  ADD UNIQUE KEY `customers_api_token_unique` (`api_token`),
  ADD KEY `customers_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `customers_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `customer_groups`
--
ALTER TABLE `customer_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_groups_code_unique` (`code`);

--
-- Indexes for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_notes_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `customer_password_resets`
--
ALTER TABLE `customer_password_resets`
  ADD KEY `customer_password_resets_email_index` (`email`);

--
-- Indexes for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_social_accounts_provider_id_unique` (`provider_id`),
  ADD KEY `customer_social_accounts_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `datagrid_saved_filters`
--
ALTER TABLE `datagrid_saved_filters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `datagrid_saved_filters_user_id_name_src_unique` (`user_id`,`name`,`src`);

--
-- Indexes for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD PRIMARY KEY (`id`),
  ADD KEY `downloadable_link_purchased_customer_id_foreign` (`customer_id`),
  ADD KEY `downloadable_link_purchased_order_id_foreign` (`order_id`),
  ADD KEY `downloadable_link_purchased_order_item_id_foreign` (`order_item_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gdpr_data_request`
--
ALTER TABLE `gdpr_data_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gdpr_data_request_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `imports`
--
ALTER TABLE `imports`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_batches`
--
ALTER TABLE `import_batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_batches_import_id_foreign` (`import_id`);

--
-- Indexes for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_sources_code_unique` (`code`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_order_id_foreign` (`order_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `locales`
--
ALTER TABLE `locales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `locales_code_unique` (`code`);

--
-- Indexes for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `marketing_campaigns_channel_id_foreign` (`channel_id`),
  ADD KEY `marketing_campaigns_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `marketing_campaigns_marketing_template_id_foreign` (`marketing_template_id`),
  ADD KEY `marketing_campaigns_marketing_event_id_foreign` (`marketing_event_id`);

--
-- Indexes for table `marketing_events`
--
ALTER TABLE `marketing_events`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_order_id_foreign` (`order_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_increment_id_unique` (`increment_id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`),
  ADD KEY `orders_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_comments_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_parent_id_foreign` (`parent_id`),
  ADD KEY `order_items_tax_category_id_foreign` (`tax_category_id`);

--
-- Indexes for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_payment_order_id_foreign` (`order_id`);

--
-- Indexes for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_transactions_order_id_foreign` (`order_id`);

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
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`),
  ADD KEY `products_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `products_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `chanel_locale_attribute_value_index_unique` (`channel`,`locale`,`attribute_id`,`product_id`),
  ADD UNIQUE KEY `product_attribute_values_unique_id_unique` (`unique_id`),
  ADD KEY `product_attribute_values_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_values_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_bundle_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bundle_option_products_product_id_bundle_option_id_unique` (`product_id`,`product_bundle_option_id`),
  ADD KEY `product_bundle_option_id_foreign` (`product_bundle_option_id`);

--
-- Indexes for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_bundle_option_translations_option_id_locale_unique` (`product_bundle_option_id`,`locale`),
  ADD UNIQUE KEY `bundle_option_translations_locale_label_bundle_option_id_unique` (`locale`,`label`,`product_bundle_option_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD UNIQUE KEY `product_categories_product_id_category_id_unique` (`product_id`,`category_id`),
  ADD KEY `product_categories_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_channels`
--
ALTER TABLE `product_channels`
  ADD UNIQUE KEY `product_channels_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_channels_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD UNIQUE KEY `product_cross_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_cross_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_customer_group_prices_unique_id_unique` (`unique_id`),
  ADD KEY `product_customer_group_prices_product_id_foreign` (`product_id`),
  ADD KEY `product_customer_group_prices_customer_group_id_foreign` (`customer_group_id`);

--
-- Indexes for table `product_customizable_options`
--
ALTER TABLE `product_customizable_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_customizable_options_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_customizable_option_prices`
--
ALTER TABLE `product_customizable_option_prices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pcop_product_customizable_option_id_foreign` (`product_customizable_option_id`);

--
-- Indexes for table `product_customizable_option_translations`
--
ALTER TABLE `product_customizable_option_translations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_customizable_option_id_locale_unique` (`product_customizable_option_id`,`locale`);

--
-- Indexes for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_links_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `link_translations_link_id_foreign` (`product_downloadable_link_id`);

--
-- Indexes for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_downloadable_samples_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sample_translations_sample_id_foreign` (`product_downloadable_sample_id`);

--
-- Indexes for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_flat_unique_index` (`product_id`,`channel`,`locale`),
  ADD KEY `product_flat_attribute_family_id_foreign` (`attribute_family_id`),
  ADD KEY `product_flat_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `grouped_products_product_id_associated_product_id_unique` (`product_id`,`associated_product_id`),
  ADD KEY `product_grouped_products_associated_product_id_foreign` (`associated_product_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_images_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_source_vendor_index_unique` (`product_id`,`inventory_source_id`,`vendor_id`),
  ADD KEY `product_inventories_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_inventory_indices_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_inventory_indices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_ordered_inventories_product_id_channel_id_unique` (`product_id`,`channel_id`),
  ADD KEY `product_ordered_inventories_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `price_indices_product_id_customer_group_id_channel_id_unique` (`product_id`,`customer_group_id`,`channel_id`),
  ADD KEY `product_price_indices_customer_group_id_foreign` (`customer_group_id`),
  ADD KEY `product_price_indices_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD UNIQUE KEY `product_relations_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_relations_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Indexes for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_review_images_review_id_foreign` (`review_id`);

--
-- Indexes for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD UNIQUE KEY `product_super_attributes_product_id_attribute_id_unique` (`product_id`,`attribute_id`),
  ADD KEY `product_super_attributes_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD UNIQUE KEY `product_up_sells_parent_id_child_id_unique` (`parent_id`,`child_id`),
  ADD KEY `product_up_sells_child_id_foreign` (`child_id`);

--
-- Indexes for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_videos_product_id_foreign` (`product_id`);

--
-- Indexes for table `refunds`
--
ALTER TABLE `refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refunds_order_id_foreign` (`order_id`);

--
-- Indexes for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refund_items_parent_id_foreign` (`parent_id`),
  ADD KEY `refund_items_order_item_id_foreign` (`order_item_id`),
  ADD KEY `refund_items_refund_id_foreign` (`refund_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_synonyms`
--
ALTER TABLE `search_synonyms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `search_terms`
--
ALTER TABLE `search_terms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `search_terms_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_order_id_foreign` (`order_id`),
  ADD KEY `shipments_inventory_source_id_foreign` (`inventory_source_id`);

--
-- Indexes for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipment_items_shipment_id_foreign` (`shipment_id`);

--
-- Indexes for table `sitemaps`
--
ALTER TABLE `sitemaps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subscribers_list_customer_id_foreign` (`customer_id`),
  ADD KEY `subscribers_list_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `tax_categories`
--
ALTER TABLE `tax_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_categories_code_unique` (`code`);

--
-- Indexes for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_map_index_unique` (`tax_category_id`,`tax_rate_id`),
  ADD KEY `tax_categories_tax_rates_tax_rate_id_foreign` (`tax_rate_id`);

--
-- Indexes for table `tax_rates`
--
ALTER TABLE `tax_rates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tax_rates_identifier_unique` (`identifier`);

--
-- Indexes for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customizations_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_customization_id_foreign` (`theme_customization_id`);

--
-- Indexes for table `url_rewrites`
--
ALTER TABLE `url_rewrites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visits_visitable_type_visitable_id_index` (`visitable_type`,`visitable_id`),
  ADD KEY `visits_visitor_type_visitor_id_index` (`visitor_type`,`visitor_id`),
  ADD KEY `visits_channel_id_foreign` (`channel_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlist_items_channel_id_foreign` (`channel_id`),
  ADD KEY `wishlist_items_product_id_foreign` (`product_id`),
  ADD KEY `wishlist_items_customer_id_foreign` (`customer_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `attribute_families`
--
ALTER TABLE `attribute_families`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `attribute_options`
--
ALTER TABLE `attribute_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_products`
--
ALTER TABLE `booking_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_product_appointment_slots`
--
ALTER TABLE `booking_product_appointment_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_default_slots`
--
ALTER TABLE `booking_product_default_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `booking_product_event_tickets`
--
ALTER TABLE `booking_product_event_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_event_ticket_translations`
--
ALTER TABLE `booking_product_event_ticket_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_rental_slots`
--
ALTER TABLE `booking_product_rental_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `booking_product_table_slots`
--
ALTER TABLE `booking_product_table_slots`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_item_inventories`
--
ALTER TABLE `cart_item_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_payment`
--
ALTER TABLE `cart_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cart_rules`
--
ALTER TABLE `cart_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `catalog_rules`
--
ALTER TABLE `catalog_rules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `category_translations`
--
ALTER TABLE `category_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `channels`
--
ALTER TABLE `channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `channel_translations`
--
ALTER TABLE `channel_translations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cms_pages`
--
ALTER TABLE `cms_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `compare_items`
--
ALTER TABLE `compare_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `core_config`
--
ALTER TABLE `core_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `country_states`
--
ALTER TABLE `country_states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `country_translations`
--
ALTER TABLE `country_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customer_groups`
--
ALTER TABLE `customer_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer_notes`
--
ALTER TABLE `customer_notes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `datagrid_saved_filters`
--
ALTER TABLE `datagrid_saved_filters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gdpr_data_request`
--
ALTER TABLE `gdpr_data_request`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `imports`
--
ALTER TABLE `imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `import_batches`
--
ALTER TABLE `import_batches`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory_sources`
--
ALTER TABLE `inventory_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locales`
--
ALTER TABLE `locales`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `marketing_events`
--
ALTER TABLE `marketing_events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `marketing_templates`
--
ALTER TABLE `marketing_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_comments`
--
ALTER TABLE `order_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_payment`
--
ALTER TABLE `order_payment`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `order_transactions`
--
ALTER TABLE `order_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `product_customizable_options`
--
ALTER TABLE `product_customizable_options`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_customizable_option_prices`
--
ALTER TABLE `product_customizable_option_prices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_customizable_option_translations`
--
ALTER TABLE `product_customizable_option_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_flat`
--
ALTER TABLE `product_flat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `product_inventories`
--
ALTER TABLE `product_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product_videos`
--
ALTER TABLE `product_videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refunds`
--
ALTER TABLE `refunds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `refund_items`
--
ALTER TABLE `refund_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `search_synonyms`
--
ALTER TABLE `search_synonyms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `search_terms`
--
ALTER TABLE `search_terms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shipment_items`
--
ALTER TABLE `shipment_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sitemaps`
--
ALTER TABLE `sitemaps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories`
--
ALTER TABLE `tax_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_rates`
--
ALTER TABLE `tax_rates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `url_rewrites`
--
ALTER TABLE `url_rewrites`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `visits`
--
ALTER TABLE `visits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `addresses_parent_address_id_foreign` FOREIGN KEY (`parent_address_id`) REFERENCES `addresses` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `attribute_groups`
--
ALTER TABLE `attribute_groups`
  ADD CONSTRAINT `attribute_groups_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_group_mappings`
--
ALTER TABLE `attribute_group_mappings`
  ADD CONSTRAINT `attribute_group_mappings_attribute_group_id_foreign` FOREIGN KEY (`attribute_group_id`) REFERENCES `attribute_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `attribute_group_mappings_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_options`
--
ALTER TABLE `attribute_options`
  ADD CONSTRAINT `attribute_options_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_option_translations`
--
ALTER TABLE `attribute_option_translations`
  ADD CONSTRAINT `attribute_option_translations_attribute_option_id_foreign` FOREIGN KEY (`attribute_option_id`) REFERENCES `attribute_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `attribute_translations`
--
ALTER TABLE `attribute_translations`
  ADD CONSTRAINT `attribute_translations_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_booking_product_event_ticket_id_foreign` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bookings_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bookings_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `bookings_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `booking_products`
--
ALTER TABLE `booking_products`
  ADD CONSTRAINT `booking_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_appointment_slots`
--
ALTER TABLE `booking_product_appointment_slots`
  ADD CONSTRAINT `booking_product_appointment_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_default_slots`
--
ALTER TABLE `booking_product_default_slots`
  ADD CONSTRAINT `booking_product_default_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_event_tickets`
--
ALTER TABLE `booking_product_event_tickets`
  ADD CONSTRAINT `booking_product_event_tickets_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_event_ticket_translations`
--
ALTER TABLE `booking_product_event_ticket_translations`
  ADD CONSTRAINT `bpet_translations_fk` FOREIGN KEY (`booking_product_event_ticket_id`) REFERENCES `booking_product_event_tickets` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_rental_slots`
--
ALTER TABLE `booking_product_rental_slots`
  ADD CONSTRAINT `booking_product_rental_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `booking_product_table_slots`
--
ALTER TABLE `booking_product_table_slots`
  ADD CONSTRAINT `booking_product_table_slots_booking_product_id_foreign` FOREIGN KEY (`booking_product_id`) REFERENCES `booking_products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `cart_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `cart_payment`
--
ALTER TABLE `cart_payment`
  ADD CONSTRAINT `cart_payment_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_channels`
--
ALTER TABLE `cart_rule_channels`
  ADD CONSTRAINT `cart_rule_channels_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupons`
--
ALTER TABLE `cart_rule_coupons`
  ADD CONSTRAINT `cart_rule_coupons_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_coupon_usage`
--
ALTER TABLE `cart_rule_coupon_usage`
  ADD CONSTRAINT `cart_rule_coupon_usage_cart_rule_coupon_id_foreign` FOREIGN KEY (`cart_rule_coupon_id`) REFERENCES `cart_rule_coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_coupon_usage_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customers`
--
ALTER TABLE `cart_rule_customers`
  ADD CONSTRAINT `cart_rule_customers_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customers_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_customer_groups`
--
ALTER TABLE `cart_rule_customer_groups`
  ADD CONSTRAINT `cart_rule_customer_groups_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_rule_translations`
--
ALTER TABLE `cart_rule_translations`
  ADD CONSTRAINT `cart_rule_translations_cart_rule_id_foreign` FOREIGN KEY (`cart_rule_id`) REFERENCES `cart_rules` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cart_shipping_rates`
--
ALTER TABLE `cart_shipping_rates`
  ADD CONSTRAINT `cart_shipping_rates_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_channels`
--
ALTER TABLE `catalog_rule_channels`
  ADD CONSTRAINT `catalog_rule_channels_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_customer_groups`
--
ALTER TABLE `catalog_rule_customer_groups`
  ADD CONSTRAINT `catalog_rule_customer_groups_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_customer_groups_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_products`
--
ALTER TABLE `catalog_rule_products`
  ADD CONSTRAINT `catalog_rule_products_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `catalog_rule_product_prices`
--
ALTER TABLE `catalog_rule_product_prices`
  ADD CONSTRAINT `catalog_rule_product_prices_catalog_rule_id_foreign` FOREIGN KEY (`catalog_rule_id`) REFERENCES `catalog_rules` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `catalog_rule_product_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_filterable_attributes`
--
ALTER TABLE `category_filterable_attributes`
  ADD CONSTRAINT `category_filterable_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_filterable_attributes_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `category_translations`
--
ALTER TABLE `category_translations`
  ADD CONSTRAINT `category_translations_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_translations_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channels`
--
ALTER TABLE `channels`
  ADD CONSTRAINT `channels_base_currency_id_foreign` FOREIGN KEY (`base_currency_id`) REFERENCES `currencies` (`id`),
  ADD CONSTRAINT `channels_default_locale_id_foreign` FOREIGN KEY (`default_locale_id`) REFERENCES `locales` (`id`),
  ADD CONSTRAINT `channels_root_category_id_foreign` FOREIGN KEY (`root_category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `channel_currencies`
--
ALTER TABLE `channel_currencies`
  ADD CONSTRAINT `channel_currencies_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_currencies_currency_id_foreign` FOREIGN KEY (`currency_id`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_inventory_sources`
--
ALTER TABLE `channel_inventory_sources`
  ADD CONSTRAINT `channel_inventory_sources_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_inventory_sources_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_locales`
--
ALTER TABLE `channel_locales`
  ADD CONSTRAINT `channel_locales_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `channel_locales_locale_id_foreign` FOREIGN KEY (`locale_id`) REFERENCES `locales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `channel_translations`
--
ALTER TABLE `channel_translations`
  ADD CONSTRAINT `channel_translations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_channels`
--
ALTER TABLE `cms_page_channels`
  ADD CONSTRAINT `cms_page_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cms_page_channels_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cms_page_translations`
--
ALTER TABLE `cms_page_translations`
  ADD CONSTRAINT `cms_page_translations_cms_page_id_foreign` FOREIGN KEY (`cms_page_id`) REFERENCES `cms_pages` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `compare_items`
--
ALTER TABLE `compare_items`
  ADD CONSTRAINT `compare_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `compare_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `country_states`
--
ALTER TABLE `country_states`
  ADD CONSTRAINT `country_states_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_state_translations`
--
ALTER TABLE `country_state_translations`
  ADD CONSTRAINT `country_state_translations_country_state_id_foreign` FOREIGN KEY (`country_state_id`) REFERENCES `country_states` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `country_translations`
--
ALTER TABLE `country_translations`
  ADD CONSTRAINT `country_translations_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `currency_exchange_rates`
--
ALTER TABLE `currency_exchange_rates`
  ADD CONSTRAINT `currency_exchange_rates_target_currency_foreign` FOREIGN KEY (`target_currency`) REFERENCES `currencies` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `customers_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `customer_notes`
--
ALTER TABLE `customer_notes`
  ADD CONSTRAINT `customer_notes_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `customer_social_accounts`
--
ALTER TABLE `customer_social_accounts`
  ADD CONSTRAINT `customer_social_accounts_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `downloadable_link_purchased`
--
ALTER TABLE `downloadable_link_purchased`
  ADD CONSTRAINT `downloadable_link_purchased_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `downloadable_link_purchased_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gdpr_data_request`
--
ALTER TABLE `gdpr_data_request`
  ADD CONSTRAINT `gdpr_data_request_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `import_batches`
--
ALTER TABLE `import_batches`
  ADD CONSTRAINT `import_batches_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `imports` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD CONSTRAINT `invoice_items_invoice_id_foreign` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `invoice_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `invoice_items` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `marketing_campaigns`
--
ALTER TABLE `marketing_campaigns`
  ADD CONSTRAINT `marketing_campaigns_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_event_id_foreign` FOREIGN KEY (`marketing_event_id`) REFERENCES `marketing_events` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `marketing_campaigns_marketing_template_id_foreign` FOREIGN KEY (`marketing_template_id`) REFERENCES `marketing_templates` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `order_comments`
--
ALTER TABLE `order_comments`
  ADD CONSTRAINT `order_comments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`);

--
-- Constraints for table `order_payment`
--
ALTER TABLE `order_payment`
  ADD CONSTRAINT `order_payment_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_transactions`
--
ALTER TABLE `order_transactions`
  ADD CONSTRAINT `order_transactions_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  ADD CONSTRAINT `products_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_attribute_values`
--
ALTER TABLE `product_attribute_values`
  ADD CONSTRAINT `product_attribute_values_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_attribute_values_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_options`
--
ALTER TABLE `product_bundle_options`
  ADD CONSTRAINT `product_bundle_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_products`
--
ALTER TABLE `product_bundle_option_products`
  ADD CONSTRAINT `product_bundle_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_bundle_option_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_bundle_option_translations`
--
ALTER TABLE `product_bundle_option_translations`
  ADD CONSTRAINT `product_bundle_option_translations_option_id_foreign` FOREIGN KEY (`product_bundle_option_id`) REFERENCES `product_bundle_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_categories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_channels`
--
ALTER TABLE `product_channels`
  ADD CONSTRAINT `product_channels_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_channels_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_cross_sells`
--
ALTER TABLE `product_cross_sells`
  ADD CONSTRAINT `product_cross_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_cross_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_customer_group_prices`
--
ALTER TABLE `product_customer_group_prices`
  ADD CONSTRAINT `product_customer_group_prices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_customer_group_prices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_customizable_options`
--
ALTER TABLE `product_customizable_options`
  ADD CONSTRAINT `product_customizable_options_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_customizable_option_prices`
--
ALTER TABLE `product_customizable_option_prices`
  ADD CONSTRAINT `pcop_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_customizable_option_translations`
--
ALTER TABLE `product_customizable_option_translations`
  ADD CONSTRAINT `pcot_product_customizable_option_id_foreign` FOREIGN KEY (`product_customizable_option_id`) REFERENCES `product_customizable_options` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_links`
--
ALTER TABLE `product_downloadable_links`
  ADD CONSTRAINT `product_downloadable_links_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_link_translations`
--
ALTER TABLE `product_downloadable_link_translations`
  ADD CONSTRAINT `link_translations_link_id_foreign` FOREIGN KEY (`product_downloadable_link_id`) REFERENCES `product_downloadable_links` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_samples`
--
ALTER TABLE `product_downloadable_samples`
  ADD CONSTRAINT `product_downloadable_samples_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_downloadable_sample_translations`
--
ALTER TABLE `product_downloadable_sample_translations`
  ADD CONSTRAINT `sample_translations_sample_id_foreign` FOREIGN KEY (`product_downloadable_sample_id`) REFERENCES `product_downloadable_samples` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_flat`
--
ALTER TABLE `product_flat`
  ADD CONSTRAINT `product_flat_attribute_family_id_foreign` FOREIGN KEY (`attribute_family_id`) REFERENCES `attribute_families` (`id`),
  ADD CONSTRAINT `product_flat_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `product_flat` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_flat_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_grouped_products`
--
ALTER TABLE `product_grouped_products`
  ADD CONSTRAINT `product_grouped_products_associated_product_id_foreign` FOREIGN KEY (`associated_product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_grouped_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventories`
--
ALTER TABLE `product_inventories`
  ADD CONSTRAINT `product_inventories_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_inventory_indices`
--
ALTER TABLE `product_inventory_indices`
  ADD CONSTRAINT `product_inventory_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_inventory_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_ordered_inventories`
--
ALTER TABLE `product_ordered_inventories`
  ADD CONSTRAINT `product_ordered_inventories_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_ordered_inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_price_indices`
--
ALTER TABLE `product_price_indices`
  ADD CONSTRAINT `product_price_indices_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_customer_group_id_foreign` FOREIGN KEY (`customer_group_id`) REFERENCES `customer_groups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_price_indices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_relations`
--
ALTER TABLE `product_relations`
  ADD CONSTRAINT `product_relations_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_relations_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_review_attachments`
--
ALTER TABLE `product_review_attachments`
  ADD CONSTRAINT `product_review_images_review_id_foreign` FOREIGN KEY (`review_id`) REFERENCES `product_reviews` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_super_attributes`
--
ALTER TABLE `product_super_attributes`
  ADD CONSTRAINT `product_super_attributes_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`),
  ADD CONSTRAINT `product_super_attributes_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_up_sells`
--
ALTER TABLE `product_up_sells`
  ADD CONSTRAINT `product_up_sells_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_up_sells_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_videos`
--
ALTER TABLE `product_videos`
  ADD CONSTRAINT `product_videos_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refunds`
--
ALTER TABLE `refunds`
  ADD CONSTRAINT `refunds_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `refund_items`
--
ALTER TABLE `refund_items`
  ADD CONSTRAINT `refund_items_order_item_id_foreign` FOREIGN KEY (`order_item_id`) REFERENCES `order_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `refund_items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `refund_items_refund_id_foreign` FOREIGN KEY (`refund_id`) REFERENCES `refunds` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `search_terms`
--
ALTER TABLE `search_terms`
  ADD CONSTRAINT `search_terms_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_inventory_source_id_foreign` FOREIGN KEY (`inventory_source_id`) REFERENCES `inventory_sources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `shipments_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `shipment_items`
--
ALTER TABLE `shipment_items`
  ADD CONSTRAINT `shipment_items_shipment_id_foreign` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscribers_list`
--
ALTER TABLE `subscribers_list`
  ADD CONSTRAINT `subscribers_list_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `subscribers_list_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `tax_categories_tax_rates`
--
ALTER TABLE `tax_categories_tax_rates`
  ADD CONSTRAINT `tax_categories_tax_rates_tax_category_id_foreign` FOREIGN KEY (`tax_category_id`) REFERENCES `tax_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tax_categories_tax_rates_tax_rate_id_foreign` FOREIGN KEY (`tax_rate_id`) REFERENCES `tax_rates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_customizations`
--
ALTER TABLE `theme_customizations`
  ADD CONSTRAINT `theme_customizations_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `theme_customization_translations`
--
ALTER TABLE `theme_customization_translations`
  ADD CONSTRAINT `theme_customization_id_foreign` FOREIGN KEY (`theme_customization_id`) REFERENCES `theme_customizations` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `visits`
--
ALTER TABLE `visits`
  ADD CONSTRAINT `visits_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD CONSTRAINT `wishlist_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_channel_id_foreign` FOREIGN KEY (`channel_id`) REFERENCES `channels` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlist_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
