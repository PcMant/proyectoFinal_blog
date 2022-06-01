-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-06-2022 a las 11:28:56
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog`
--
CREATE DATABASE IF NOT EXISTS `blog` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `blog`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_article` int(11) NOT NULL,
  `titulo_article` varchar(155) NOT NULL,
  `imagen_article` varchar(300) DEFAULT NULL,
  `contenido_article` mediumtext NOT NULL,
  `id_category_article` int(11) NOT NULL DEFAULT '1',
  `meta_article` varchar(155) DEFAULT NULL,
  `status_article` int(1) NOT NULL DEFAULT '1',
  `date_created_article` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated_article` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_article`),
  KEY `fk_usuarios_articulos` (`id_user_article`),
  KEY `fk_categorias_articulos` (`id_category_article`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`id_article`, `id_user_article`, `titulo_article`, `imagen_article`, `contenido_article`, `id_category_article`, `meta_article`, `status_article`, `date_created_article`, `date_updated_article`) VALUES
(3, 9, 'Artículo de prueba 1', 'https://as1.ftcdn.net/v2/jpg/04/89/73/56/1000_F_489735696_C02RJ7Qw3xPm16j31QmdDKrCxPvwEU73.jpg', '<p>\n                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet consectetur dui. Vestibulum ac convallis urna, vitae porta massa. Mauris sit amet nisi in metus tempor convallis. Nulla nec euismod turpis. Cras luctus lorem et nisl dapibus aliquet. Curabitur lorem nunc, tristique a felis ac, vehicula laoreet ante. Ut auctor orci turpis. Cras sit amet placerat nulla, feugiat eleifend metus. Mauris nec convallis lectus. In gravida sapien in iaculis vulputate. Aliquam a rhoncus elit, sit amet pretium nisl. Vivamus egestas facilisis viverra. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut vel lorem est. Cras et sapien finibus, mattis est in, condimentum nisl.\n                    </p>\n                    <p>\n                        Aenean vel orci a tellus porttitor eleifend. Integer tincidunt porta fermentum. Aenean vitae enim iaculis, sollicitudin risus in, interdum justo. Donec semper metus ac nibh maximus venenatis. Cras sodales nisl metus, a placerat risus tristique ornare. Ut finibus nisi a ante tincidunt hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eget venenatis augue, id molestie eros. Quisque leo risus, pellentesque mattis libero id, pharetra tempor turpis.\n                    </p>\n                    <p>  \n                        Donec fermentum ligula at ultrices faucibus. Proin facilisis est vitae vehicula finibus. Praesent rutrum eleifend ligula, sit amet molestie dolor interdum nec. Cras sodales odio nec diam posuere, mollis aliquam magna tempus. Fusce lobortis maximus dapibus. Curabitur aliquam vehicula ultricies. Nulla sed vulputate erat. \n                    </p>\n\n                    <p>\n                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet consectetur dui. Vestibulum ac convallis urna, vitae porta massa. Mauris sit amet nisi in metus tempor convallis. Nulla nec euismod turpis. Cras luctus lorem et nisl dapibus aliquet. Curabitur lorem nunc, tristique a felis ac, vehicula laoreet ante. Ut auctor orci turpis. Cras sit amet placerat nulla, feugiat eleifend metus. Mauris nec convallis lectus. In gravida sapien in iaculis vulputate. Aliquam a rhoncus elit, sit amet pretium nisl. Vivamus egestas facilisis viverra. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut vel lorem est. Cras et sapien finibus, mattis est in, condimentum nisl.\n                    </p>\n                    <p>\n                        Aenean vel orci a tellus porttitor eleifend. Integer tincidunt porta fermentum. Aenean vitae enim iaculis, sollicitudin risus in, interdum justo. Donec semper metus ac nibh maximus venenatis. Cras sodales nisl metus, a placerat risus tristique ornare. Ut finibus nisi a ante tincidunt hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eget venenatis augue, id molestie eros. Quisque leo risus, pellentesque mattis libero id, pharetra tempor turpis.\n                    </p>\n                    <p>  \n                        Donec fermentum ligula at ultrices faucibus. Proin facilisis est vitae vehicula finibus. Praesent rutrum eleifend ligula, sit amet molestie dolor interdum nec. Cras sodales odio nec diam posuere, mollis aliquam magna tempus. Fusce lobortis maximus dapibus. Curabitur aliquam vehicula ultricies. Nulla sed vulputate erat. \n                    </p>\n\n                    <p>\n                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas sit amet consectetur dui. Vestibulum ac convallis urna, vitae porta massa. Mauris sit amet nisi in metus tempor convallis. Nulla nec euismod turpis. Cras luctus lorem et nisl dapibus aliquet. Curabitur lorem nunc, tristique a felis ac, vehicula laoreet ante. Ut auctor orci turpis. Cras sit amet placerat nulla, feugiat eleifend metus. Mauris nec convallis lectus. In gravida sapien in iaculis vulputate. Aliquam a rhoncus elit, sit amet pretium nisl. Vivamus egestas facilisis viverra. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Ut vel lorem est. Cras et sapien finibus, mattis est in, condimentum nisl.\n                    </p>\n                    <p>\n                        Aenean vel orci a tellus porttitor eleifend. Integer tincidunt porta fermentum. Aenean vitae enim iaculis, sollicitudin risus in, interdum justo. Donec semper metus ac nibh maximus venenatis. Cras sodales nisl metus, a placerat risus tristique ornare. Ut finibus nisi a ante tincidunt hendrerit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut eget venenatis augue, id molestie eros. Quisque leo risus, pellentesque mattis libero id, pharetra tempor turpis.\n                    </p>\n                    <p>  \n                        Donec fermentum ligula at ultrices faucibus. Proin facilisis est vitae vehicula finibus. Praesent rutrum eleifend ligula, sit amet molestie dolor interdum nec. Cras sodales odio nec diam posuere, mollis aliquam magna tempus. Fusce lobortis maximus dapibus. Curabitur aliquam vehicula ultricies. Nulla sed vulputate erat. \n                    </p>\n', 1, NULL, 0, '2022-05-05 10:25:33', '2022-05-30 10:17:27'),
(4, 9, 'test', 'https://c.pxhere.com/photos/e4/37/code_computer_technology_html_screen-121859.jpg!d', 'test\nEsto funciona?', 1, NULL, 0, '2022-05-05 10:25:59', '2022-05-30 12:25:28'),
(5, 9, 'titulo', '', 'lorem ipsum, hola contenido', 1, NULL, 1, '2022-05-28 18:43:16', '2022-05-30 00:39:55'),
(6, 9, 'titulo', '', 'lorem ipsum, hola contenido', 1, NULL, 1, '2022-05-28 18:43:51', '2022-05-30 12:17:08'),
(7, 9, 'titulo', '', 'lorem ipsum, hola contenido', 1, NULL, 1, '2022-05-28 18:44:23', '2022-05-30 12:17:25'),
(12, 9, 'titulo', NULL, 'lorem ipsum, hola contenido', 1, NULL, 1, '2022-05-31 16:22:23', '2022-05-31 16:22:23'),
(13, 9, 'titulo', NULL, 'lorem ipsum, hola contenido', 1, NULL, 1, '2022-05-31 16:25:11', '2022-05-31 16:25:11'),
(14, 9, 'titulo', NULL, 'lorem ipsum, hola contenido', 1, NULL, 1, '2022-05-31 16:51:43', '2022-05-31 16:51:43'),
(15, 9, 'titulo', NULL, 'lorem ipsum, hola contenido', 1, NULL, 1, '2022-05-31 16:54:07', '2022-05-31 16:54:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name_category` varchar(45) NOT NULL,
  `date_created_category` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated_category` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_category`),
  UNIQUE KEY `nombre_categoria` (`name_category`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`, `date_created_category`, `date_updated_category`) VALUES
(1, 'General', '2022-05-05 07:47:54', '2022-05-31 17:21:14'),
(2, 'test', '2022-05-05 07:47:54', '2022-05-05 07:47:54'),
(3, 'test23', '2022-05-05 07:47:54', '2022-05-05 07:47:54'),
(4, 'test24', '2022-05-05 07:47:54', '2022-05-05 07:47:54'),
(5, 'test25', '2022-05-05 07:47:54', '2022-05-05 07:47:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configsblog`
--

DROP TABLE IF EXISTS `configsblog`;
CREATE TABLE IF NOT EXISTS `configsblog` (
  `id_configblog` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_configblog` varchar(45) NOT NULL,
  `data_configblog` text,
  `date_created_configblog` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated_configblog` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_configblog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `email_user` varchar(255) NOT NULL,
  `foto_user` varchar(255) DEFAULT NULL,
  `name_user` varchar(45) NOT NULL,
  `lastname_user` varchar(145) NOT NULL,
  `id_usertype_user` int(11) NOT NULL,
  `password_user` varchar(60) DEFAULT NULL,
  `token_user` text,
  `token_exp_user` text,
  `date_created_user` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated_user` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_user_UNIQUE` (`email_user`),
  KEY `tipo` (`id_usertype_user`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `email_user`, `foto_user`, `name_user`, `lastname_user`, `id_usertype_user`, `password_user`, `token_user`, `token_exp_user`, `date_created_user`, `date_updated_user`) VALUES
(9, 'juan@pcmant.com', NULL, 'Juan', 'Molina Gómez', 1, '$2a$07$azybxcags23425sdg23sdeuiZyE5TxUkrcXrZtPfYBFC6APznfwgC', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTQwMTc5MjcsImV4cCI6MTY1NDEwNDMyNywiZGF0YSI6eyJpZCI6IjkiLCJlbWFpbCI6Imp1YW5AcGNtYW50LmNvbSJ9fQ.o1NjDzvxeYfcavdV77GbYGF5dfSJx1MwQIFXSm21zXU', '1654104327', '2022-05-05 10:21:54', '2022-05-31 17:25:27'),
(15, 'demo@pcmant.com', NULL, 'Juan', 'Molina', 1, '$2a$07$azybxcags23425sdg23sdeuiZyE5TxUkrcXrZtPfYBFC6APznfwgC', NULL, NULL, '2022-05-31 20:41:43', '2022-05-31 20:41:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usertypes`
--

DROP TABLE IF EXISTS `usertypes`;
CREATE TABLE IF NOT EXISTS `usertypes` (
  `id_usertype` int(11) NOT NULL AUTO_INCREMENT,
  `name_usertype` varchar(45) NOT NULL,
  `date_created_usertype` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated_usertype` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usertype`),
  UNIQUE KEY `name_usertype` (`name_usertype`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usertypes`
--

INSERT INTO `usertypes` (`id_usertype`, `name_usertype`, `date_created_usertype`, `date_updated_usertype`) VALUES
(1, 'admin', '2022-05-05 08:07:02', '2022-05-05 08:07:02');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `fk_id_category_article` FOREIGN KEY (`id_category_article`) REFERENCES `categories` (`id_category`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_id_user_article` FOREIGN KEY (`id_user_article`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_id_usertype_user` FOREIGN KEY (`id_usertype_user`) REFERENCES `usertypes` (`id_usertype`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
