-- --------------------------------------------------------
-- Хост:                         localhost
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Версия:              9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for web_library
CREATE DATABASE IF NOT EXISTS `web_library` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `web_library`;


-- Dumping structure for table web_library.books
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.books: ~3 rows (approximately)
DELETE FROM `books`;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `title`, `description`, `created_at`, `updated_at`) VALUES
	(33, 'Dracula', 'Some description...', NULL, '2016-10-04 21:04:48'),
	(34, 'PHP for beginners', 'Some description', '2016-10-04 21:05:16', '2016-10-04 21:05:16'),
	(35, 'The Last Mile (Amos Decker Series #2)', 'Convicted murderer Melvin Mars is counting down the last hours before his execution—for the violent killing of his…', '2016-10-05 06:39:42', '2016-10-05 06:39:42'),
	(36, 'The Woman in Cabin 10', 'From Ruth Ware, the New York Times bestselling author of the “twisty-mystery”', '2016-10-05 06:42:11', '2016-10-05 06:42:11');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;


-- Dumping structure for table web_library.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.migrations: ~5 rows (approximately)
DELETE FROM `migrations`;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`migration`, `batch`) VALUES
	('2014_10_12_000000_create_users_table', 1),
	('2014_10_12_100000_create_password_resets_table', 1),
	('2016_07_03_113552_entrust_setup_tables', 1),
	('2016_07_03_142937_create_books_table', 1),
	('2016_10_04_162851_create_requests_table', 2);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


-- Dumping structure for table web_library.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.password_resets: ~0 rows (approximately)
DELETE FROM `password_resets`;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;


-- Dumping structure for table web_library.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.permissions: ~16 rows (approximately)
DELETE FROM `permissions`;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(1, 'role-list', 'role-list', 'Show list', '2016-10-04 12:53:34', '2016-10-04 12:53:34'),
	(2, 'role-create', 'role-create', 'Create permission', '2016-10-04 12:53:53', '2016-10-04 12:53:53'),
	(3, 'role-edit', 'role-edit', 'Edit permission', '2016-10-04 13:05:14', '2016-10-04 13:05:14'),
	(4, 'role-delete', 'role-delete', 'Delete permission', '2016-10-04 13:54:54', '2016-10-04 13:54:55'),
	(5, 'book-list', 'book-list', 'Show list', '2016-10-04 14:37:42', '2016-10-04 14:37:43'),
	(6, 'book-create', 'book-create', 'Create permission', '2016-10-04 14:38:36', '2016-10-04 14:38:36'),
	(7, 'book-edit', 'book-edit', 'Edit permission', '2016-10-04 14:39:19', '2016-10-04 14:39:19'),
	(8, 'book-delete', 'book-delete', 'Delete permission', '2016-10-04 14:41:04', '2016-10-04 14:41:05'),
	(9, 'user-list', 'user-list', 'Show list', '2016-10-04 18:54:52', '2016-10-04 18:54:53'),
	(10, 'user-create', 'user-create', 'Create user', '2016-10-04 18:56:07', '2016-10-04 18:56:08'),
	(11, 'user-edit', 'user-edit', 'Edit user', '2016-10-04 18:56:05', '2016-10-04 18:56:06'),
	(12, 'user-delete', 'user-delete', 'Delete user', '2016-10-04 18:56:03', '2016-10-04 18:56:03'),
	(13, 'request-list', 'request-list', 'Show list', '2016-10-04 20:53:22', '2016-10-04 20:53:23'),
	(14, 'request-create', 'request-create', 'Create request', '2016-10-04 20:53:22', '2016-10-04 20:53:23'),
	(15, 'request-edit', 'request-edit', 'Edit request', '2016-10-04 20:54:06', '2016-10-04 20:54:06'),
	(16, 'request-delete', 'request-delete', 'Delete request', '2016-10-04 20:54:29', '2016-10-04 20:54:29');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;


-- Dumping structure for table web_library.permission_role
CREATE TABLE IF NOT EXISTS `permission_role` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_role_id_foreign` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.permission_role: ~32 rows (approximately)
DELETE FROM `permission_role`;
/*!40000 ALTER TABLE `permission_role` DISABLE KEYS */;
INSERT INTO `permission_role` (`permission_id`, `role_id`) VALUES
	(1, 2),
	(2, 2),
	(3, 2),
	(4, 2),
	(5, 2),
	(6, 2),
	(7, 2),
	(8, 2),
	(9, 2),
	(10, 2),
	(11, 2),
	(12, 2),
	(13, 2),
	(14, 2),
	(15, 2),
	(16, 2),
	(1, 3),
	(5, 3),
	(9, 3),
	(13, 3),
	(14, 3),
	(16, 3),
	(1, 7),
	(5, 7),
	(6, 7),
	(7, 7),
	(8, 7),
	(9, 7),
	(13, 7),
	(14, 7),
	(15, 7),
	(16, 7);
/*!40000 ALTER TABLE `permission_role` ENABLE KEYS */;


-- Dumping structure for table web_library.requests
CREATE TABLE IF NOT EXISTS `requests` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `approved` int(11) NOT NULL COMMENT '0-No , 1-Yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.requests: ~2 rows (approximately)
DELETE FROM `requests`;
/*!40000 ALTER TABLE `requests` DISABLE KEYS */;
INSERT INTO `requests` (`id`, `user_id`, `book_id`, `approved`, `created_at`, `updated_at`) VALUES
	(9, 6, 32, 0, '2016-10-04 20:51:36', '2016-10-04 20:51:36'),
	(10, 8, 32, 0, '2016-10-04 20:52:34', '2016-10-04 20:52:34'),
	(11, 3, 34, 1, '2016-10-05 06:42:36', '2016-10-05 06:43:16'),
	(12, 3, 36, 0, '2016-10-05 06:42:47', '2016-10-05 06:42:47'),
	(13, 5, 33, 0, '2016-10-05 06:44:42', '2016-10-05 06:49:05'),
	(14, 8, 35, 1, '2016-10-05 06:44:54', '2016-10-05 06:46:05');
/*!40000 ALTER TABLE `requests` ENABLE KEYS */;


-- Dumping structure for table web_library.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.roles: ~3 rows (approximately)
DELETE FROM `roles`;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
	(2, 'admin', 'admin', 'admin', '2016-10-04 12:54:13', '2016-10-04 12:54:13'),
	(3, 'reader', 'reader', 'reader', '2016-10-04 12:55:53', '2016-10-04 12:55:54'),
	(7, 'librarian', 'librarian', 'librarian', '2016-10-04 15:09:41', '2016-10-04 15:09:42');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;


-- Dumping structure for table web_library.role_user
CREATE TABLE IF NOT EXISTS `role_user` (
  `user_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_user_role_id_foreign` (`role_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.role_user: ~4 rows (approximately)
DELETE FROM `role_user`;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;
INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
	(3, 2),
	(6, 3),
	(8, 3),
	(7, 7);
/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;


-- Dumping structure for table web_library.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table web_library.users: ~4 rows (approximately)
DELETE FROM `users`;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(3, 'Peter', 'p_e_t_i_o_1989@abv.bg', '$2y$10$cnqmVKSe5w9BbB0gaf4jg.B5ErNzkvnq8gCJ..LLSUKxpS1hg0rGq', 'haEI8GM2V5ocatUepC9rqXcXqWqma8YzY7ByFVkrpLn1m1TgK2CvQcUK1Dk6', '2016-10-04 11:02:20', '2016-10-05 06:43:55'),
	(6, 'Todor', 'todor@abv.bg', '$2y$10$AhYGN6CDPUmfm1D/moeSAuky98aq.vFEfghjcDdjKbPkYBOE5HkfW', 'xKOO42ZTHayujCHUpzPJCichojjRyEjJOdMRKYcz5r5DuNIw7ha2DHCeFNnA', '2016-10-04 20:39:28', '2016-10-05 06:32:55'),
	(7, 'Ivan', 'ivan@abv.bg', '$2y$10$gsNIPNJV1fGEtF0G2BNCZu7ySDKreOygCxp/E5hirHF7y/S.iaNey', 'DJRKekgH4zbdT6xxFijEZixdYvNCPaFpRWyJ1M0f8LqhwYtTv40QA1Hi3VMd', '2016-10-04 20:42:39', '2016-10-05 06:54:31'),
	(8, 'Boyko', 'boyko@abv.bg', '$2y$10$gsadMQ.OYatY19.r7c2fR.CUINAB.MB9wOJg6TvBbXbR24dJ2ixTO', 'GTHMTfUca9pSUn2EgmCzwpPrBgxfH1HIXAB9zReT14YUYFZlBvjkd8FmoEg8', '2016-10-04 20:52:10', '2016-10-05 06:45:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
