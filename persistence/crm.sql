-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-05-2021 a las 10:32:00
-- Versión del servidor: 10.4.18-MariaDB
-- Versión de PHP: 8.0.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `crm`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_department` bigint(20) UNSIGNED NOT NULL,
  `id_township` bigint(20) UNSIGNED NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `dpi` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clients`
--

INSERT INTO `clients` (`id`, `dpi`, `status`, `created_at`, `updated_at`) VALUES
(1, 1234567891203, 'A', '2021-05-09 12:40:51', '2021-05-09 12:40:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departments`
--

CREATE TABLE `departments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `departments`
--

INSERT INTO `departments` (`id`, `name`, `created_at`, `updated_at`) VALUES
(2, 'Alta Verapaz', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(3, 'Baja Verapaz', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(4, 'Chimaltenago', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(5, 'Chiquimula', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(6, 'Guatemala', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(7, 'El Progreso', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(8, 'Escuintla', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(9, 'Huehuetenango', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(10, 'Izabal', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(11, 'Jalapa', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(12, 'Jutiapa', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(13, 'Petén', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(14, 'Quetzaltenango', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(15, 'Quiché', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(16, 'Retalhuleu', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(17, 'Sacatepequez', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(18, 'San Marcos', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(19, 'Santa Rosa', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(20, 'Sololá', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(21, 'Suchitepequez', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(22, 'Totonicapán', '2021-05-09 09:27:15', '2021-05-09 09:27:15'),
(23, 'Zacapa', '2021-05-09 09:27:15', '2021-05-09 09:27:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `details_sales`
--

CREATE TABLE `details_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_sale` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `subtotal` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `details_sales`
--

INSERT INTO `details_sales` (`id`, `id_sale`, `id_product`, `quantity`, `amount`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, 179.00, 358.00, '2021-05-09 13:46:52', '2021-05-09 13:46:52'),
(2, 2, 1, 3, 179.00, 537.00, '2021-05-09 14:03:51', '2021-05-09 14:03:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(78, '2021_05_08_174539_create_township_table', 1),
(88, '2021_05_08_192822_create_twonship_table', 2),
(98, '2021_05_08_174623_create_department_table', 3),
(99, '2021_05_08_174800_create_rol_table', 3),
(100, '2021_05_08_174823_create_product_table', 3),
(158, '2021_05_09_003406_add_status_to_clients', 5),
(159, '2021_05_09_011358_add_age_to_people', 6),
(170, '2021_05_08_201302_create_detail_sales_table', 7),
(174, '2014_10_12_000000_create_users_table', 8),
(175, '2014_10_12_100000_create_password_resets_table', 8),
(176, '2019_08_19_000000_create_failed_jobs_table', 8),
(177, '2021_05_08_200726_create_departments_table', 8),
(178, '2021_05_08_200756_create_townships_table', 8),
(179, '2021_05_08_200821_create_addresses_table', 8),
(180, '2021_05_08_200902_create_products_table', 8),
(181, '2021_05_08_201002_create_rols_table', 8),
(182, '2021_05_08_201033_create_people_table', 8),
(183, '2021_05_08_201055_create_clients_table', 8),
(184, '2021_05_08_201439_create_sales_table', 8),
(185, '2021_05_09_062024_create_detaisl_sales_table', 8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `people`
--

CREATE TABLE `people` (
  `dpi` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `township` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `people`
--

INSERT INTO `people` (`dpi`, `name`, `last_name`, `nit`, `age`, `address`, `department`, `township`, `created_at`, `updated_at`) VALUES
(1234567891203, 'Patrcik', 'Castro', '123456-7', 25, 'Zona 10 3ra. av.', 'San marcos', 'San Marcos', '2021-05-09 12:40:51', '2021-05-09 12:40:51');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Playera Rosa It Girl con Detalle de Aretes', 179.00, 'stilo casual  con terminacion de lettuce, de manga normal y largo hasta la linea del pantalon, hecho 95% rayon 5% spandex el diseño que puedes usar cualquier dia!', '2021-05-09 11:10:18', '2021-05-09 11:10:18'),
(2, 'Crop Top con Zipper Rojo y Azul', 149.00, 'Crop top con zipper color rojo y azul, hecho en 60% Algodon 35% Poliester y 5% Spandex, el diseño casual que te permite usarlo siempre!', '2021-05-09 11:10:18', '2021-05-09 11:10:18'),
(3, 'Top Largo Negro de Manga corta', 199.00, 'perfecta para usar super casual en cualquier dia o con cualquier combinacion que te vaya, hecho en 60% Algodon 35% Poliester y 5% Spandex, el diseño que puedes usar cualquier dia! ', '2021-05-09 11:10:18', '2021-05-09 11:10:18'),
(4, 'Playera Beisbolera Grafica', 134.00, 'Estilo casual  con terminacion de lettuce, de manga normal y largo hasta la linea del pantalon, hecho 95% rayon 5% spandex el diseño que puedes usar cualquier dia!', '2021-05-09 11:10:18', '2021-05-09 11:10:18'),
(5, 'Beisbolera Cuerpo Rojo Mangas Azules', 179.00, 'Beisbolera Cuerpo Rojo Mangas Azules es perfecta para usar super casual en cualquier dia o con cualquier combinacion que te vaya, hecho en 60% Algodon 35% Poliester y 5% Spandex,', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(6, 'Playera Casual Cuello Redondo Mostaza', 127.00, 'Playera diseñada para un look casual con cuello redondo en color blanco para contraste y largo hasta la linea del pantalon, hecho en 95% Rayon y 5% Spandex, el diseño que puedes usar cualquier dia!', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(7, 'Playera Girl Tie DYE Gris', 139.00, 'Diseño premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(8, 'Playera Casual Cuello Redondo Verde', 127.00, 'Diseñada para un look casual con cuello redondo en color blanco para contraste y largo hasta la linea del pantalon, hecho en 95% Rayon y 5% Spandex, el diseño que puedes usar cualquier dia!', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(9, 'Crop Top de Tirantes al Cuello Arcoiris', 117.00, 'Crop Top de tirantes al cuello arcoiris su diseño fresco te hara resaltar! Hecho en 60% Algodon 35% Poliester y 5% Spandex, el diseño que puedes usar cualquier dia!', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(10, 'Playera Casual Cuello Redondo Blanca', 117.00, 'Playera diseñada para un look casual con cuello redondo en color blanco para contraste y largo hasta la linea del pantalon, hecho en 95% Rayon y 5% Spandex, el diseño que puedes usar cualquier dia!', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(11, 'Sudadero CamStyle Street', 299.00, 'El look de calle perfecto libre como vos y lo que representa el camuflage y tu estilo rebelde!', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(12, 'Sudadero Buch Street Negro', 299.00, 'El look de calle perfecto diseñado en algodon pesado y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, ', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(13, 'Sudadero Naranja Dinosaurio Mágico', 299.00, 'Diseñado con algodon pesado y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(14, 'Sudadero con Capucha Negro NR Fush', 299.00, 'Diseñado con algodon y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(15, 'Sudadero Team Dark', 317.00, 'Diseñado con algodon pesado y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(16, 'Sudadero Dresscode502 Slang Amarillo y Negro', 299.00, 'Estilo exclusivo diseñado con algodon pesado y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(17, 'Beisbolera con Zipper Rojo con Blanco', 330.00, 'Diseñado con algodon pesado y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(18, 'Sudadero Dresscode502 Slang Azul y Crema', 299.00, 'Estilo exclusivo diseñado con algodon pesado y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(19, 'Sudadero Command', 249.00, 'Diseñado con algodon pesado y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19'),
(20, 'Sudadero Assassins Creed Azul', 360.00, 'Diseñado con algodon pesado y poliester premium para verdadera comodidad y talle asi tambien con detalles acabados a mano, para asegurarnos la mayor calidad en tu prenda.', '2021-05-09 11:10:19', '2021-05-09 11:10:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rols`
--

CREATE TABLE `rols` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_client` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `total_quantity` int(11) NOT NULL,
  `total_amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `id_client`, `id_user`, `total_quantity`, `total_amount`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 0, 0.00, '2021-05-09 12:57:01', '2021-05-09 12:57:01'),
(2, 1, 1, 0, 0.00, '2021-05-09 14:03:22', '2021-05-09 14:03:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `townships`
--

CREATE TABLE `townships` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_department` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `townships`
--

INSERT INTO `townships` (`id`, `id_department`, `name`, `created_at`, `updated_at`) VALUES
(1, 2, 'Coban', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(2, 2, 'Santa Cruz Verapaz', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(3, 2, 'San Cristobal Verapaz', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(4, 2, 'Tactic', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(5, 2, 'Tamahu', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(6, 2, 'San Migel Tucuru', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(7, 2, 'Panzos', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(8, 2, 'Senahu', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(9, 2, 'San Pedro Carcha', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(10, 3, 'Salama', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(11, 3, 'San Miguel Chicaj', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(12, 3, 'Cubulco', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(13, 3, 'Granados', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(14, 3, 'Santa Cruz el Chol', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(15, 3, 'San Jeronimo', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(16, 3, 'Purulaha', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(17, 4, 'Chimaltenango', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(18, 4, 'San jose Poaquil', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(19, 4, 'San Martin Jilotepeque', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(20, 4, 'Tecpan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(21, 4, 'Patzun', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(22, 4, 'San Miguel Pochuta', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(23, 4, 'Patzicia', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(24, 4, 'Acatenango', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(25, 4, 'San pedro Yepocapa', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(26, 5, 'Chiquimulilla', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(27, 5, 'Jocotan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(28, 5, 'Camotan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(29, 5, 'Quetzaltepeque', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(30, 5, 'Olopa', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(31, 5, 'Ipala', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(32, 5, 'San Juan Hermita', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(33, 5, 'Concepcipion las Minas', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(34, 5, 'San jacinto', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(35, 6, 'Santa Catarina Pinula', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(36, 6, 'Guatemala', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(37, 6, 'San Jose del Golfo', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(38, 6, 'Palencia', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(39, 6, 'Chinautla', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(40, 6, 'San Pedroayampuc', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(41, 6, 'Mixco', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(42, 6, 'San pedro Sactepeques', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(43, 6, 'San Raymundo', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(44, 7, 'El Jicaro', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(45, 7, 'Morazan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(46, 7, 'San Agustin acasaguaztlan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(47, 7, 'Sanarate', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(48, 7, 'Guastatoya', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(49, 7, 'Sansare', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(50, 8, 'Escuintla', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(51, 8, 'Santa Lucia Cotzumalguapa', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(52, 8, 'La Democracia', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(53, 8, 'Siquinala', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(54, 8, 'Masagua', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(55, 8, 'Tiquisate', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(56, 8, 'La Gomera', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(57, 8, 'San Jose', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(58, 8, 'Iztapa', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(59, 9, 'Huehuetenango', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(60, 9, 'Chiantla', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(61, 9, 'Malacantancito', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(62, 9, 'Cuilco', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(63, 9, 'Soloma', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(64, 9, 'la libertad', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(65, 9, 'La democracia', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(66, 9, 'San Miguel acatan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(67, 9, 'Todos los santos cuchumatanes', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(68, 10, 'Moralez', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(69, 10, 'Los amantes', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(70, 10, 'Livingston', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(71, 10, 'el estor', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(72, 10, 'Puerto Barrios', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(73, 11, 'Jalapa', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(74, 11, 'San pedro pinula', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(75, 11, 'San luiz Jilotepeque', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(76, 11, 'San manuel Chaparron', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(77, 11, 'Monjas', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(78, 11, 'Mataquescuintla', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(79, 11, 'San carlos alzatate', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(80, 12, 'Jutiapa', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(81, 12, 'Santa Catarina Mita', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(82, 12, 'yupiletepeque', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(83, 12, 'Jerez', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(84, 12, 'el adelanto', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(85, 12, 'Zapotitlan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(86, 12, 'Comapa', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(87, 12, 'Agua Blanca', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(88, 12, 'Jalpatagua', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(89, 13, 'Flores', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(90, 13, 'San jose', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(91, 13, 'San Benito', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(92, 13, 'La Libertad', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(93, 13, 'Santa ana', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(94, 13, 'Dolores', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(95, 13, 'Sayaxche', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(96, 13, 'Melchor de mencos', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(97, 13, 'Poptun', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(98, 14, 'Quetzaltenengo', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(99, 14, 'San Juan Olintepeque', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(100, 14, 'San Carlos Sija', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(101, 14, 'Sibilia', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(102, 14, 'Cabrican', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(103, 14, 'San Mateo', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(104, 14, 'Coatepeque', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(105, 14, 'Almolonga', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(106, 14, 'La ezperanza', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(107, 15, 'Santa Cruz del quiche', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(108, 15, 'Chiche', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(109, 15, 'Chajul', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(110, 15, 'Patzite', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(111, 15, 'cunen', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(112, 15, 'san juan cotzal', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(113, 15, 'zacualpa', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(114, 15, 'san pedro jocopilaz', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(115, 15, 'Scapula', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(116, 16, 'Retalhuleu', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(117, 16, 'Santa Cruz Mulua', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(118, 16, 'San Martin Zapotitlan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(119, 16, 'San Felipe', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(120, 16, 'San Andres Villa Seca', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(121, 16, 'Champerico', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(122, 16, 'Nuevo San Carlos', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(123, 16, 'El Asintal', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(124, 17, 'Antigua Guatemala', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(125, 17, 'Jocotenango', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(126, 17, 'San Bartolome milpas altas', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(127, 17, 'Sumpango', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(128, 17, 'Magadalena Milpas altas', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(129, 17, 'San Miguel Dueñas', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(130, 17, 'Ciudad Vieja', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(131, 17, 'San juan alotenango', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(132, 17, 'santa maria de jesus', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(133, 18, 'San marcos', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(134, 18, 'Ayutla', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(135, 18, 'Catarina', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(136, 18, 'Comitancillo', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(137, 18, 'El Quetzal', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(138, 18, 'El Rodeo', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(139, 18, 'Malacatan', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(140, 18, 'Pajapita', '2021-05-09 11:38:31', '2021-05-09 11:38:31'),
(141, 18, 'Ocos', '2021-05-09 11:38:31', '2021-05-09 11:38:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@mail.com', NULL, '$2y$10$XP3s9J0UQUwoHYPEfLzwvOXQSEDQpFqLkIPlRDG347TD7h7ftg2jq', NULL, '2021-05-09 12:36:43', '2021-05-09 12:36:43');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_id_department_foreign` (`id_department`),
  ADD KEY `addresses_id_township_foreign` (`id_township`);

--
-- Indices de la tabla `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_dpi_foreign` (`dpi`);

--
-- Indices de la tabla `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `details_sales`
--
ALTER TABLE `details_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `detaisl_sales_id_sale_foreign` (`id_sale`),
  ADD KEY `detaisl_sales_id_product_foreign` (`id_product`);

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `people`
--
ALTER TABLE `people`
  ADD UNIQUE KEY `people_dpi_unique` (`dpi`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `rols`
--
ALTER TABLE `rols`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_id_client_foreign` (`id_client`),
  ADD KEY `sales_id_user_foreign` (`id_user`);

--
-- Indices de la tabla `townships`
--
ALTER TABLE `townships`
  ADD PRIMARY KEY (`id`),
  ADD KEY `townships_id_department_foreign` (`id_department`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `departments`
--
ALTER TABLE `departments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `details_sales`
--
ALTER TABLE `details_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `rols`
--
ALTER TABLE `rols`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `townships`
--
ALTER TABLE `townships`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_id_department_foreign` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`),
  ADD CONSTRAINT `addresses_id_township_foreign` FOREIGN KEY (`id_township`) REFERENCES `townships` (`id`);

--
-- Filtros para la tabla `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_dpi_foreign` FOREIGN KEY (`dpi`) REFERENCES `people` (`dpi`);

--
-- Filtros para la tabla `details_sales`
--
ALTER TABLE `details_sales`
  ADD CONSTRAINT `detaisl_sales_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `detaisl_sales_id_sale_foreign` FOREIGN KEY (`id_sale`) REFERENCES `sales` (`id`);

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `sales_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `townships`
--
ALTER TABLE `townships`
  ADD CONSTRAINT `townships_id_department_foreign` FOREIGN KEY (`id_department`) REFERENCES `departments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
