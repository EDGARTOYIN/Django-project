-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2023 a las 23:23:37
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `django_toolpocket`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add category', 7, 'add_category'),
(26, 'Can change category', 7, 'change_category'),
(27, 'Can delete category', 7, 'delete_category'),
(28, 'Can view category', 7, 'view_category'),
(29, 'Can add product', 8, 'add_product'),
(30, 'Can change product', 8, 'change_product'),
(31, 'Can delete product', 8, 'delete_product'),
(32, 'Can view product', 8, 'view_product'),
(33, 'Can add user profile', 9, 'add_userprofile'),
(34, 'Can change user profile', 9, 'change_userprofile'),
(35, 'Can delete user profile', 9, 'delete_userprofile'),
(36, 'Can view user profile', 9, 'view_userprofile'),
(37, 'Can add profile', 10, 'add_profile'),
(38, 'Can change profile', 10, 'change_profile'),
(39, 'Can delete profile', 10, 'delete_profile'),
(40, 'Can view profile', 10, 'view_profile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$2cXHxqPdrqyaMcxsr11IJc$l7Xxu5fEc0pPeygUt4IEKLA7M0F8EhFP5CEOeuzrm9k=', '2023-04-21 02:41:09.901215', 1, 'EDGARTOYIN', '', '', '', 1, 1, '2023-03-26 13:07:44.336994'),
(5, 'pbkdf2_sha256$390000$dQ1nFQftY5WUIJvyXtTVS5$Cgp8fEJidCEWMZMe8M+6qDB0XTEiIc5h26DzurtStBU=', NULL, 1, 'edgar', '', '', '', 1, 1, '2023-04-06 07:33:24.325557'),
(6, 'pbkdf2_sha256$390000$ODqe7QA62rmFOakOWaXedp$P+AS1Ab9fYrdql8E9O03I2mu5wVWCZO4cS9HC0Dlqmk=', '2023-04-19 06:37:28.863640', 0, 'jokzan123', '', '', 'jokzan@gmail.com', 0, 1, '2023-04-06 07:56:15.559263'),
(8, 'pbkdf2_sha256$390000$bnoI77ZChh85vBpE46AHjZ$n8FAtk5PLTrhTweLZQf+yH1nAiN5hkl8Lti+AFq8Ezk=', '2023-04-06 08:30:01.963270', 0, 'yo123', '', '', 'yo123@gmail.com', 0, 1, '2023-04-06 08:29:55.395036'),
(9, 'pbkdf2_sha256$390000$B9EXstGndDR5zZnrMILz8R$hI0YSIuBKwQklgtukc1m+tB2bw48jmcXfBSNTgi9668=', '2023-04-07 01:38:29.233010', 0, 'Axel1234', '', '', 'axel1234@gmail.com', 0, 1, '2023-04-06 08:43:40.029987'),
(10, 'pbkdf2_sha256$390000$I2prIs9rgDIQjg39dL3OJm$62Oneql+t22hOdLvKzeYkMTg/vb0cGqHRDLHGkAwOj0=', '2023-04-21 02:41:58.251761', 0, 'axel123', '', '', 'axel123@gmail.com', 0, 1, '2023-04-19 06:38:55.369267');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-03-26 18:17:03.113003', '1', 'Game development', 1, '[{\"added\": {}}]', 7, 1),
(2, '2023-03-26 18:20:43.403051', '1', 'Product object (1)', 1, '[{\"added\": {}}]', 8, 1),
(3, '2023-03-26 19:59:06.694972', '1', 'Godot', 2, '[{\"changed\": {\"fields\": [\"Link\", \"Product image\"]}}]', 8, 1),
(4, '2023-03-26 20:27:51.637322', '1', 'Godot', 2, '[]', 8, 1),
(5, '2023-03-26 20:29:46.126888', '2', 'Unreal Engine', 1, '[{\"added\": {}}]', 8, 1),
(6, '2023-03-26 21:26:13.743707', '3', 'Unity', 1, '[{\"added\": {}}]', 8, 1),
(7, '2023-03-26 22:17:01.690405', '2', 'Diseño', 1, '[{\"added\": {}}]', 7, 1),
(8, '2023-03-26 23:20:06.783166', '4', 'Canva', 1, '[{\"added\": {}}]', 8, 1),
(9, '2023-04-04 23:13:36.466040', '1', 'ergar123 Profile', 1, '[{\"added\": {}}]', 10, 1),
(10, '2023-04-04 23:14:01.596019', '2', 'EDGARTOYIN Profile', 1, '[{\"added\": {}}]', 10, 1),
(11, '2023-04-05 00:59:59.768321', '1', 'ergar123 Profile', 3, '', 10, 1),
(12, '2023-04-05 01:04:53.025828', '3', 'ergar123 Profile', 1, '[{\"added\": {}}]', 10, 1),
(13, '2023-04-05 07:51:06.304675', '1', 'ergar123', 1, '[{\"added\": {}}]', 10, 1),
(14, '2023-04-05 08:12:01.045074', '1', 'ergar123', 1, '[{\"added\": {}}]', 10, 1),
(15, '2023-04-06 07:56:57.386005', '4', 'Perfil de jokzan123', 1, '[{\"added\": {}}]', 10, 1),
(16, '2023-04-06 08:21:16.175855', '4', 'Alantoyin123', 3, '', 4, 1),
(17, '2023-04-06 08:21:21.032574', '2', 'ergar123', 3, '', 4, 1),
(18, '2023-04-06 08:21:23.932424', '3', 'ergar1234', 3, '', 4, 1),
(19, '2023-04-06 08:43:12.076840', '7', 'axel123', 3, '', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'toolpocket_app', 'category'),
(8, 'toolpocket_app', 'product'),
(10, 'toolpocket_app', 'profile'),
(9, 'toolpocket_app', 'userprofile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-03-24 07:27:14.471750'),
(2, 'auth', '0001_initial', '2023-03-24 07:27:14.774436'),
(3, 'admin', '0001_initial', '2023-03-24 07:27:14.846510'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-03-24 07:27:14.867529'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-03-24 07:27:14.874535'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-03-24 07:27:14.924581'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-03-24 07:27:14.959430'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-03-24 07:27:14.973443'),
(9, 'auth', '0004_alter_user_username_opts', '2023-03-24 07:27:14.981450'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-03-24 07:27:15.017483'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-03-24 07:27:15.020496'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-03-24 07:27:15.028395'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-03-24 07:27:15.042408'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-03-24 07:27:15.056421'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-03-24 07:27:15.072435'),
(16, 'auth', '0011_update_proxy_permissions', '2023-03-24 07:27:15.079442'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-03-24 07:27:15.093017'),
(18, 'sessions', '0001_initial', '2023-03-24 07:27:15.113036'),
(19, 'toolpocket_app', '0001_initial', '2023-03-26 16:42:37.353324'),
(20, 'toolpocket_app', '0002_product_link', '2023-03-26 19:48:58.126408'),
(24, 'toolpocket_app', '0003_profile', '2023-04-05 08:11:27.852116'),
(25, 'toolpocket_app', '0004_profile_favorite_products', '2023-04-07 03:51:31.728911');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0cwixpqk3sfgtqipu20jgotzkbmemk8n', 'e30:1pkJyp:WXmA4uUai9e6ZuYZ5_FzTPXaV_D6l-e_07lZBUrxssg', '2023-04-20 07:24:23.089443'),
('199x9sep05au2vn95gi26vc7fndik0pf', 'e30:1pkL5j:bmU1BY4XRJVjINhFA_r7rymbZhm1kM4Otj-LcgEnbQw', '2023-04-20 08:35:35.260177'),
('3ajifkoe1767218ghbrp9ptiy27u9crs', '.eJxVjEEOwiAQRe_C2hDGMgVcuvcMzTAwUjU0Ke3KeHfbpAvd_vfef6uB1qUMa8vzMCZ1UWDU6XeMxM9cd5IeVO-T5qku8xj1ruiDNn2bUn5dD_fvoFArW93ZRJED9sDWius6OqMx3APaJIazZAyBBaSP4MX5hHYzYg5AKB6c-nwBCrA4OA:1ppgik:P57GGF6kAqIaCoeXgDQwFZtuusGwQIUD8PMCAYl64nU', '2023-05-05 02:41:58.254681'),
('3btk62kb5v9pg4trgg82i4r7rmmj5xv1', 'e30:1pkJy7:iOhkGom4Ljfp0BkgcQbr17DSMLtPkgTmywJrawaOkwo', '2023-04-20 07:23:39.514416'),
('4ybmbzn9r4fuf7uy61u9pgdo4wjg6mrj', 'e30:1pkL8Y:pRejH8OGgjBiDuCtIlxOWp9_vfdxXcMbXXPxwo-AXJA', '2023-04-20 08:38:30.590423'),
('730e3l4lfyd85277zexb42dae2db1xrs', 'e30:1pkLCd:2YVNr8V4KMQ_zwJIpfcwpMnHA_zrDnn9sjh8tOx9qWM', '2023-04-20 08:42:43.505676'),
('7tcxpm5xq0vn0hjvzv78plcdxgyozhdt', 'e30:1pkK1Y:B7Vyxoo0imcUq76eM5iseiEXI6xTV4-M23bi9P2-69Q', '2023-04-20 07:27:12.337751'),
('8xfbqj1dnaxuwp6eesq5o8wyzrd1l7df', 'e30:1pkL5o:QQ4OBwZgjI6fVXNKdnT3PBTlqbqL1IHcaaLQITf_lG0', '2023-04-20 08:35:40.565994'),
('bbxcf0xxra58km676ev75gcsmepnrw8n', 'e30:1pkKC8:xWK8Y-i8Unvk5-NUzDbdskEaVq6lf98TJoWTP3l_duU', '2023-04-20 07:38:08.603895'),
('nawu94xeebvg47r5w3wqn6wmx44kt63r', 'e30:1pkL68:cN5xLOHAtKnZqzgrjSpkdX_k32-ZBrvGClWiSDJOAG0', '2023-04-20 08:36:00.758334'),
('p0big922eonnhjqmati8tyshkthzbogh', 'e30:1pkJyf:h9nWKIaVMzxBpAUlHUceS3qRUy9E9OFoIbJ3OeYfM1Y', '2023-04-20 07:24:13.998617'),
('tc9y6ufqu9x2hh7d0b338w3kvhnpazsu', '.eJxVjEEOwiAQRe_C2hDGMgVcuvcMzTAwUjU0Ke3KeHfbpAvd_vfef6uB1qUMa8vzMCZ1UWDU6XeMxM9cd5IeVO-T5qku8xj1ruiDNn2bUn5dD_fvoFArW93ZRJED9sDWius6OqMx3APaJIazZAyBBaSP4MX5hHYzYg5AKB6c-nwBCrA4OA:1ppPBS:LsJ3NTaTT1bPB2qMPTAyQXvmkipxphjgGos6VQjh6zg', '2023-05-04 07:58:26.607287'),
('wfv7h982vskgawfntthq0uj3rc7c5sbu', 'e30:1pkKA5:cEl9Ergc0SQRljuk3VJZDpit7MlwlrWKUjfTnTSRZuI', '2023-04-20 07:36:01.555696');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `toolpocket_app_category`
--

CREATE TABLE `toolpocket_app_category` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `small_description` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `trending` tinyint(1) NOT NULL,
  `meta_title` varchar(150) NOT NULL,
  `meta_keywords` varchar(150) NOT NULL,
  `meta_description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `toolpocket_app_category`
--

INSERT INTO `toolpocket_app_category` (`id`, `slug`, `name`, `image`, `description`, `small_description`, `status`, `trending`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`) VALUES
(1, 'Game dev', 'Game development', 'uploads/20230326111703Wavy_Tech-15_Single-11.jpg', 'se enfoca en el desarrollo de videojuegos y el objetivo principal es brindar información y recursos útiles para desarrolladores de videojuegos de cualquier nivel y experiencia.', 'Game engines', 0, 1, 'Game engines', 'game engines, game dev, games', 'game engines, game dev, games', '2023-03-26 18:17:03.112001'),
(2, 'desing', 'Diseño', 'uploads/20230326151701desing.png', 'En esta categoria podras encontrar paginas web relacionadas a la creacion de diseños', 'ecuentra paginas de desing rapido', 0, 1, 'desing', 'desing, creative', 'desing content', '2023-03-26 22:17:01.688403');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `toolpocket_app_product`
--

CREATE TABLE `toolpocket_app_product` (
  `id` bigint(20) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `name` varchar(150) NOT NULL,
  `product_image` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `trending` tinyint(1) NOT NULL,
  `tag` varchar(150) NOT NULL,
  `meta_title` varchar(150) NOT NULL,
  `meta_keywords` varchar(150) NOT NULL,
  `meta_description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `link` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `toolpocket_app_product`
--

INSERT INTO `toolpocket_app_product` (`id`, `slug`, `name`, `product_image`, `description`, `status`, `trending`, `tag`, `meta_title`, `meta_keywords`, `meta_description`, `created_at`, `category_id`, `link`) VALUES
(1, 'godot engine', 'Godot', 'uploads/20230326125906godot.png', 'Godot es un motor de videojuegos de código abierto y gratuito. Es una herramienta para crear juegos 2D y 3D para una variedad de plataformas, incluyendo Windows, Mac, Linux, iOS, Android y consolas de juegos.', 0, 1, 'Free', 'Godot engine', 'game engine, free engine', 'godot engine content', '2023-03-26 18:20:43.401049', 1, 'https://godotengine.org/download/windows/'),
(2, 'unreal engine', 'Unreal Engine', 'uploads/20230326132946unreal.jpg', 'Unreal Engine es un motor de juego desarrollado por la compañía Epic Games. Es utilizado principalmente para crear videojuegos, aunque también puede utilizarse para desarrollar software de visualización, películas y animaciones.', 0, 1, 'Free', 'Unreal engine', 'game engine, free engine', 'unreal engine content', '2023-03-26 20:29:46.125889', 1, 'https://www.unrealengine.com/en-US/download'),
(3, 'unity engine', 'Unity', 'uploads/20230326142613unity.jpg', 'Unity es un motor de videojuegos multiplataforma que permite a los desarrolladores crear juegos en 2D y 3D para diferentes dispositivos, como computadoras, consolas, dispositivos móviles y realidad virtual. Unity proporciona una amplia gama de herramientas y recursos para ayudar a los desarrolladores a crear juegos y aplicaciones interactivas con gráficos impresionantes, física realista, sonido envolvente y una experiencia de usuario inmersiva. Además, Unity es muy popular entre la comunidad de', 0, 1, 'Free', 'unity engine', 'game engine, free engine', 'unity engine content', '2023-03-26 21:26:13.740706', 1, 'https://unity.com/download'),
(4, 'canva desing', 'Canva', 'uploads/20230326162006canva.png', 'Canva es una herramienta de diseño gráfico en línea que permite a los usuarios crear diseños profesionales y atractivos sin necesidad de tener habilidades de diseño avanzadas. Ofrece una amplia gama de plantillas, herramientas de edición, imágenes y fuentes para que los usuarios puedan crear diseños personalizados para diferentes propósitos, como presentaciones, folletos, tarjetas de visita, publicaciones en redes sociales, entre otros.', 0, 1, 'Free', 'Canva desing', 'desing, free', 'free template desing for free', '2023-03-26 23:20:06.781165', 2, 'https://www.canva.com/');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `toolpocket_app_profile`
--

CREATE TABLE `toolpocket_app_profile` (
  `id` bigint(20) NOT NULL,
  `image` varchar(100) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `toolpocket_app_profile`
--

INSERT INTO `toolpocket_app_profile` (`id`, `image`, `user_id`) VALUES
(3, 'user_uploads/default.jpg', 5),
(4, 'user_uploads/20230418172324339962550_1322487094977132_5304467854862931476_n.jpg', 6),
(5, 'user_uploads/default.jpg', 8),
(6, 'user_uploads/20230406182450314437942_658189702609830_8606133823528290896_n.jpg', 9),
(7, 'user_uploads/default.jpg', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `toolpocket_app_profile_favorite_products`
--

CREATE TABLE `toolpocket_app_profile_favorite_products` (
  `id` bigint(20) NOT NULL,
  `profile_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `toolpocket_app_profile_favorite_products`
--

INSERT INTO `toolpocket_app_profile_favorite_products` (`id`, `profile_id`, `product_id`) VALUES
(1, 4, 1),
(4, 4, 2),
(7, 4, 3),
(5, 4, 4),
(8, 7, 1),
(9, 7, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `toolpocket_app_category`
--
ALTER TABLE `toolpocket_app_category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `toolpocket_app_product`
--
ALTER TABLE `toolpocket_app_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `toolpocket_app_produ_category_id_0666cdf8_fk_toolpocke` (`category_id`);

--
-- Indices de la tabla `toolpocket_app_profile`
--
ALTER TABLE `toolpocket_app_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indices de la tabla `toolpocket_app_profile_favorite_products`
--
ALTER TABLE `toolpocket_app_profile_favorite_products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `toolpocket_app_profile_f_profile_id_product_id_d0695660_uniq` (`profile_id`,`product_id`),
  ADD KEY `toolpocket_app_profi_product_id_7b71de3a_fk_toolpocke` (`product_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `toolpocket_app_category`
--
ALTER TABLE `toolpocket_app_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `toolpocket_app_product`
--
ALTER TABLE `toolpocket_app_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `toolpocket_app_profile`
--
ALTER TABLE `toolpocket_app_profile`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `toolpocket_app_profile_favorite_products`
--
ALTER TABLE `toolpocket_app_profile_favorite_products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `toolpocket_app_product`
--
ALTER TABLE `toolpocket_app_product`
  ADD CONSTRAINT `toolpocket_app_produ_category_id_0666cdf8_fk_toolpocke` FOREIGN KEY (`category_id`) REFERENCES `toolpocket_app_category` (`id`);

--
-- Filtros para la tabla `toolpocket_app_profile`
--
ALTER TABLE `toolpocket_app_profile`
  ADD CONSTRAINT `toolpocket_app_profile_user_id_93c7681f_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `toolpocket_app_profile_favorite_products`
--
ALTER TABLE `toolpocket_app_profile_favorite_products`
  ADD CONSTRAINT `toolpocket_app_profi_product_id_7b71de3a_fk_toolpocke` FOREIGN KEY (`product_id`) REFERENCES `toolpocket_app_product` (`id`),
  ADD CONSTRAINT `toolpocket_app_profi_profile_id_e4eb9313_fk_toolpocke` FOREIGN KEY (`profile_id`) REFERENCES `toolpocket_app_profile` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
