-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 08-05-2022 a las 23:53:31
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
  `id_user_article` int(11) DEFAULT NULL,
  `titulo_article` varchar(155) NOT NULL,
  `imagen_article` mediumblob,
  `contenido_article` mediumtext NOT NULL,
  `id_category_article` int(11) NOT NULL,
  `meta_article` varchar(155) DEFAULT NULL,
  `status_article` int(1) NOT NULL,
  `date_created_article` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_updated_article` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_article`),
  KEY `fk_usuarios_articulos` (`id_user_article`),
  KEY `fk_categorias_articulos` (`id_category_article`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `articles`
--

INSERT INTO `articles` (`id_article`, `id_user_article`, `titulo_article`, `imagen_article`, `contenido_article`, `id_category_article`, `meta_article`, `status_article`, `date_created_article`, `date_updated_article`) VALUES
(3, 9, 'test', NULL, 'test', 1, NULL, 0, '2022-05-05 10:25:33', '2022-05-05 10:25:33'),
(4, 9, 'test', NULL, 'test', 1, NULL, 0, '2022-05-05 10:25:59', '2022-05-05 10:25:59');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id_category`, `name_category`, `date_created_category`, `date_updated_category`) VALUES
(1, '', '2022-05-05 07:47:54', '2022-05-05 07:47:54'),
(2, 'test', '2022-05-05 07:47:54', '2022-05-05 07:47:54'),
(3, 'test23', '2022-05-05 07:47:54', '2022-05-05 07:47:54'),
(4, 'test24', '2022-05-05 07:47:54', '2022-05-05 07:47:54'),
(5, 'test25', '2022-05-05 07:47:54', '2022-05-05 07:47:54'),
(7, 'test255', '2022-05-05 10:14:37', '2022-05-05 10:14:37'),
(10, 'test2557', '2022-05-05 10:16:21', '2022-05-05 10:16:21'),
(12, 'test25578', '2022-05-05 10:53:23', '2022-05-05 10:53:23'),
(13, 'test289', '2022-05-08 16:12:57', '2022-05-08 16:12:57'),
(19, 'test666', '2022-05-08 22:08:36', '2022-05-08 22:08:36');

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
  `email_user` varchar(45) NOT NULL,
  `foto_user` mediumblob,
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id_user`, `email_user`, `foto_user`, `name_user`, `lastname_user`, `id_usertype_user`, `password_user`, `token_user`, `token_exp_user`, `date_created_user`, `date_updated_user`) VALUES
(2, 'prueba0', NULL, 'Juan', 'Molina', 1, '$2a$07$azybxcags23425sdg23sdeuiZyE5TxUkrcXrZtPfYBFC6APznfwgC', NULL, NULL, '2022-05-05 08:24:31', '2022-05-05 09:30:51'),
(3, 'registro', NULL, 'Juan', 'Molina', 1, '$2a$07$azybxcags23425sdg23sdeuiZyE5TxUkrcXrZtPfYBFC6APznfwgC', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTE5NzY2NzYsImV4cCI6MTY1MjA2MzA3NiwiZGF0YSI6eyJpZCI6IjMiLCJlbWFpbCI6InJlZ2lzdHJvIn19.CuR0nBEopZ0Xm71CSf4-ZbERtbb9TyiIIXAwELgg2vA', '1652063076', '2022-05-05 08:24:31', '2022-05-08 02:24:36'),
(4, 'registro00', NULL, 'Juan', 'Molina', 1, '$2a$07$azybxcags23425sdg23sdelEdOKLMMZ1XZVdRuVIQExCo9D1L3ApK', NULL, NULL, '2022-05-05 08:24:31', '2022-05-05 09:30:51'),
(5, 'registro01', NULL, 'Juan', 'Molina', 1, '$2a$07$azybxcags23425sdg23sdeO6pUILwWEC7BdU3dzNQ8kvmYGxNoFNq', NULL, NULL, '2022-05-05 08:24:31', '2022-05-05 09:30:51'),
(6, 'registro23', NULL, 'Juan', 'Molina', 1, '$2a$07$azybxcags23425sdg23sdeOhavvj0pmtGSWuxPOPM2.ks6uf9H.s2', NULL, NULL, '2022-05-05 08:24:31', '2022-05-05 09:30:51'),
(7, 'registro24', NULL, 'Juan', 'Molina', 1, '$2a$07$azybxcags23425sdg23sdeOhavvj0pmtGSWuxPOPM2.ks6uf9H.s2', NULL, NULL, '2022-05-05 08:24:31', '2022-05-05 09:30:51'),
(8, 'registro699', NULL, 'Juan', 'Molina', 1, '$2a$07$azybxcags23425sdg23sdeuiZyE5TxUkrcXrZtPfYBFC6APznfwgC', NULL, NULL, '2022-05-05 09:12:39', '2022-05-05 09:12:39'),
(9, 'juan', NULL, 'Juan T', 'Molina Gómez', 1, '$2a$07$azybxcags23425sdg23sdeuiZyE5TxUkrcXrZtPfYBFC6APznfwgC', 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTE4ODcxOTEsImV4cCI6MTY1MTk3MzU5MSwiZGF0YSI6eyJpZCI6IjkiLCJlbWFpbCI6Imp1YW4ifX0.9Ssi0RDlGnoypWQpJli9PVd_03ID8l3WLYPfmWHf3Oo', '1651973591', '2022-05-05 10:21:54', '2022-05-07 01:33:11'),
(13, 'juan77', NULL, 'Juan', 'Molina', 1, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTE4ODcxMjIsImV4cCI6MTY1MTk3MzUyMiwiZGF0YSI6eyJpZCI6IjEzIiwiZW1haWwiOiJqdWFuNzcifX0.uL5u6z_xGKD7JUu38EZPcRazTx8LUPFV_l0YUDnru-4', '1651973522', '2022-05-06 00:14:02', '2022-05-07 01:32:02'),
(14, 'juan77@', NULL, 'Juan', 'Molina', 1, NULL, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE2NTIwNDc2NDgsImV4cCI6MTY1MjEzNDA0OCwiZGF0YSI6eyJpZCI6IjE0IiwiZW1haWwiOiJqdWFuNzdAIn19.tASZO463czQ7Q25hTTURc6JotiaZWM11TUTdJauymH8', '1652134048', '2022-05-07 00:58:01', '2022-05-08 22:07:28');

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
