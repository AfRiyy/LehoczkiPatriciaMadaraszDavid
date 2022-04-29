-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Ápr 29. 10:32
-- Kiszolgáló verziója: 10.4.21-MariaDB
-- PHP verzió: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `shelter`
--
CREATE DATABASE IF NOT EXISTS `shelter` CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `adoptions`
--

DROP TABLE IF EXISTS `adoptions`;
CREATE TABLE IF NOT EXISTS `adoptions` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `pets_id` bigint(20) UNSIGNED NOT NULL,
  `users_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `adoptions_pets_id_foreign` (`pets_id`),
  KEY `adoptions_users_id_foreign` (`users_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `adoptions`
--

INSERT INTO `adoptions` (`id`, `date`, `pets_id`, `users_id`, `created_at`, `updated_at`) VALUES
(1, '2022-04-27', 3, 1, '2022-04-27 06:30:33', '2022-04-27 06:30:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `breeds`
--

DROP TABLE IF EXISTS `breeds`;
CREATE TABLE IF NOT EXISTS `breeds` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `bname` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `species_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `breeds_species_id_foreign` (`species_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `breeds`
--

INSERT INTO `breeds` (`id`, `bname`, `species_id`, `created_at`, `updated_at`) VALUES
(1, 'beagle', 2, '2022-04-27 06:22:53', '2022-04-27 06:22:53'),
(2, 'labrador', 2, '2022-04-27 06:23:06', '2022-04-27 06:23:06'),
(3, 'perzsa', 1, '2022-04-27 06:24:04', '2022-04-27 06:24:04');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_01_25_153653_create_species_table', 1),
(6, '2022_01_25_153704_create_breeds_table', 1),
(7, '2022_01_25_153799_create_shelters_table', 1),
(8, '2022_01_25_153800_create_pets_table', 1),
(9, '2022_01_25_153801_create_adoptions_table', 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- A tábla adatainak kiíratása `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'adoptme', '1766b9d63626ab035c4b7bc43677563982a72724cd3de077cc2266a6ba9b6954', '[\"*\"]', '2022-04-29 06:30:33', '2022-04-29 06:22:06', '2022-04-29 06:30:33');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `pets`
--

DROP TABLE IF EXISTS `pets`;
CREATE TABLE IF NOT EXISTS `pets` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `breeds_id` bigint(20) UNSIGNED NOT NULL,
  `age` int(11) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `adopted` tinyint(1) NOT NULL,
  `shelters_id` bigint(20) UNSIGNED NOT NULL,
  `picture_path` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `neutered` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pets_breeds_id_foreign` (`breeds_id`),
  KEY `pets_shelters_id_foreign` (`shelters_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `pets`
--

INSERT INTO `pets` (`id`, `name`, `breeds_id`, `age`, `gender`, `adopted`, `shelters_id`, `picture_path`, `neutered`, `created_at`, `updated_at`) VALUES
(1, 'Zina', 2, 1, 1, 0, 1, 'storage/images/Zina/Zina.jpg', 1, '2022-04-27 06:26:23', '2022-04-27 06:26:23'),
(2, 'Cirmi', 3, 2, 0, 0, 1, 'storage/images/Cirmi/Cirmi.jpg', 0, '2022-04-27 06:28:00', '2022-04-27 06:28:00'),
(3, 'Alma', 1, 3, 1, 1, 1, '', 1, '2022-04-27 06:28:24', '2022-04-27 06:28:24');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `shelters`
--

DROP TABLE IF EXISTS `shelters`;
CREATE TABLE IF NOT EXISTS `shelters` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `shelter_name` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `shelter_zip` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_city` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_street_address` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_phone` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_website` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `shelter_facebook` varchar(255) COLLATE utf8mb4_hungarian_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `shelters`
--

INSERT INTO `shelters` (`id`, `shelter_name`, `shelter_zip`, `shelter_city`, `shelter_street_address`, `shelter_phone`, `shelter_website`, `shelter_facebook`, `created_at`, `updated_at`) VALUES
(1, 'Menhely', '0000', 'Város', 'Cím', '+00 00 000 000', 'www.menhely.hu', 'facebook.com/menhely', '2022-04-27 06:24:45', '2022-04-27 06:24:45');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `species`
--

DROP TABLE IF EXISTS `species`;
CREATE TABLE IF NOT EXISTS `species` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `sname` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `species`
--

INSERT INTO `species` (`id`, `sname`, `created_at`, `updated_at`) VALUES
(1, 'házi macska', '2022-04-27 06:22:21', '2022-04-27 06:22:21'),
(2, 'kutya', '2022-04-27 06:22:32', '2022-04-27 06:22:32');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `birth` date NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_hungarian_ci NOT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_hungarian_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_unique` (`user`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- A tábla adatainak kiíratása `users`
--

INSERT INTO `users` (`id`, `user`, `birth`, `email`, `email_verified_at`, `password`, `admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '2000-01-01', 'admin@example.lan', NULL, '$2y$10$XMY1cvJWX9nu11.26aBkgOI5itq2qZWXLhywHWX01OornPCrI4wyi', 1, NULL, '2022-04-27 06:21:25', '2022-04-27 06:21:25');

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `adoptions`
--
ALTER TABLE `adoptions`
  ADD CONSTRAINT `adoptions_pets_id_foreign` FOREIGN KEY (`pets_id`) REFERENCES `pets` (`id`),
  ADD CONSTRAINT `adoptions_users_id_foreign` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`);

--
-- Megkötések a táblához `breeds`
--
ALTER TABLE `breeds`
  ADD CONSTRAINT `breeds_species_id_foreign` FOREIGN KEY (`species_id`) REFERENCES `species` (`id`);

--
-- Megkötések a táblához `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_breeds_id_foreign` FOREIGN KEY (`breeds_id`) REFERENCES `breeds` (`id`),
  ADD CONSTRAINT `pets_shelters_id_foreign` FOREIGN KEY (`shelters_id`) REFERENCES `shelters` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
