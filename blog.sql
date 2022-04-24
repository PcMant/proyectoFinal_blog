-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-04-2022 a las 23:43:02
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
-- Estructura de tabla para la tabla `articulos`
--

DROP TABLE IF EXISTS `articulos`;
CREATE TABLE IF NOT EXISTS `articulos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) DEFAULT NULL,
  `titulo` varchar(155) NOT NULL,
  `imagen` mediumblob NOT NULL,
  `contenido` mediumtext NOT NULL,
  `categoria` varchar(45) NOT NULL,
  `meta` varchar(155) NOT NULL,
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_usuarios_articulos` (`usuario`),
  KEY `fk_categorias_articulos` (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuraciones_blog`
--

DROP TABLE IF EXISTS `configuraciones_blog`;
CREATE TABLE IF NOT EXISTS `configuraciones_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_conf` varchar(45) NOT NULL,
  `data` varchar(155) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `nick` varchar(45) NOT NULL,
  `foto` mediumblob NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellidos` varchar(145) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `pass` varchar(40) NOT NULL,
  `token` varchar(40) NOT NULL,
  PRIMARY KEY (`nick`),
  KEY `tipo` (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tipos`
--

DROP TABLE IF EXISTS `usuario_tipos`;
CREATE TABLE IF NOT EXISTS `usuario_tipos` (
  `tipo` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `articulos`
--
ALTER TABLE `articulos`
  ADD CONSTRAINT `fk_categorias_articulos` FOREIGN KEY (`categoria`) REFERENCES `categorias` (`categoria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuarios_articulos` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`nick`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `usuario_tipos` (`tipo`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
