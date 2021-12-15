-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-07-2021 a las 20:06:33
-- Versión del servidor: 8.0.23
-- Versión de PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `circo`
--
CREATE DATABASE IF NOT EXISTS `circo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci;
USE `circo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animales`
--

CREATE TABLE `animales` (
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `tipo` varchar(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `anhos` tinyint UNSIGNED DEFAULT NULL,
  `peso` float DEFAULT NULL,
  `estatura` float DEFAULT NULL,
  `nombre_atraccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL,
  `nombre_pista` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `animales`
--

INSERT INTO `animales` (`nombre`, `tipo`, `anhos`, `peso`, `estatura`, `nombre_atraccion`, `nombre_pista`) VALUES
('Berni', 'León', 1, 94, 13.9, 'El gran carnívoro', 'LATERAL2'),
('Caiman', 'Cocodrilo', 1, 71, 14.1, 'El gran carnívoro', 'LATERAL2'),
('Frank', 'Jirafa', 3, 146, 15.14, 'Las jirafas', 'SUPER'),
('Jazinto', 'Mono', 13, NULL, NULL, NULL, NULL),
('Leo', 'León', 3, 121, 14.1, 'El gran felino', 'SUPER'),
('Lucas', 'Cocodrilo', 2, 120.34, NULL, NULL, 'LATERAL2'),
('Peter', 'Mono', 1, 30, 10.7, NULL, NULL),
('Princesa1', 'Jirafa', 2, 100, 12.2, 'Las jirafas', 'LATERAL1'),
('Princesa2', 'Jirafa', 3, 110, 12.3, 'Las jirafas', 'LATERAL1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `animales_artistas`
--

CREATE TABLE `animales_artistas` (
  `nombre_animal` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nif_artista` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `animales_artistas`
--

INSERT INTO `animales_artistas` (`nombre_animal`, `nif_artista`) VALUES
('Caiman', '11111111A'),
('Jazinto', '11111111A'),
('Leo', '11111111A'),
('Princesa1', '11111111A'),
('Caiman', '22222222B'),
('Princesa2', '22222222B'),
('Leo', '44444444D'),
('Berni', '71111111A'),
('Frank', '71111111A'),
('Lucas', '71111111A'),
('Peter', '71111111A');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `artistas`
--

CREATE TABLE `artistas` (
  `nif` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `apellidos` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nombre` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nif_jefe` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `artistas`
--

INSERT INTO `artistas` (`nif`, `apellidos`, `nombre`, `nif_jefe`) VALUES
('00000000A', 'Sanchez', 'Dragó', '11111111A'),
('11111111A', 'Lopez', 'Juan', '88888888F'),
('12345678A', 'San Juan', 'Pedro', NULL),
('22222222B', 'Sanchez', 'Luis', NULL),
('33333333C', 'Perez', 'Carlos', '22222222B'),
('44444444D', 'Lopez', 'Juan', '22222222B'),
('71111111A', 'Ruperez Santo', 'Gabriel', NULL),
('85555555E', 'Sanchez Graz', 'Luis', NULL),
('88888888F', 'Fernandez Ramirez', 'Julio', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atracciones`
--

CREATE TABLE `atracciones` (
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `ganancias` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `atracciones`
--

INSERT INTO `atracciones` (`nombre`, `fecha_inicio`, `ganancias`) VALUES
('El gran carnívoro', '2001-04-01', '43012.00'),
('El gran felino', '1999-11-01', '63121.00'),
('El orangután', NULL, '0.00'),
('La espectacular', '2018-01-01', '0.00'),
('Las jirafas', '2000-04-02', '46035.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atracciones_artistas`
--

CREATE TABLE `atracciones_artistas` (
  `nombre_atraccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `nif_artista` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `atracciones_artistas`
--

INSERT INTO `atracciones_artistas` (`nombre_atraccion`, `nif_artista`, `fecha_inicio`, `fecha_fin`) VALUES
('El gran carnívoro', '33333333C', '2000-03-04', '2000-05-01'),
('El gran carnívoro', '33333333C', '2001-04-01', NULL),
('El gran carnívoro', '44444444D', '2020-03-19', NULL),
('El gran carnívoro', '71111111A', '2020-03-19', NULL),
('El gran carnívoro', '85555555E', '2020-03-19', NULL),
('El gran carnívoro', '88888888F', '2020-03-19', NULL),
('El gran felino', '11111111A', '2000-01-01', '2000-03-01'),
('El gran felino', '22222222B', '1999-01-11', NULL),
('Las jirafas', '11111111A', '2000-04-01', NULL),
('Las jirafas', '22222222B', '2000-08-05', NULL),
('Las jirafas', '33333333C', '2000-07-05', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `atraccion_dia`
--

CREATE TABLE `atraccion_dia` (
  `nombre_atraccion` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `num_espectadores` smallint UNSIGNED DEFAULT NULL,
  `ganancias` decimal(7,2) DEFAULT NULL
) ;

--
-- Volcado de datos para la tabla `atraccion_dia`
--

INSERT INTO `atraccion_dia` (`nombre_atraccion`, `fecha`, `num_espectadores`, `ganancias`) VALUES
('El gran carnívoro', '2001-04-01', 400, '43012.00'),
('El gran felino', '1999-11-01', 100, '11121.00'),
('El gran felino', '2000-01-01', 240, '21000.00'),
('El gran felino', '2000-04-01', 340, '31000.00'),
('Las jirafas', '2000-04-01', 120, '15030.00'),
('Las jirafas', '2000-08-01', 333, '31000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pistas`
--

CREATE TABLE `pistas` (
  `nombre` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_spanish2_ci NOT NULL,
  `aforo` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pistas`
--

INSERT INTO `pistas` (`nombre`, `aforo`) VALUES
('La grande', 350),
('LATERAL1', 300),
('LATERAL2', 550),
('SUPER', 1000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `animales`
--
ALTER TABLE `animales`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `fk_ANIMALES_ATRACCIONES1_idx` (`nombre_atraccion`),
  ADD KEY `fk_ANIMALES_PISTAS1_idx` (`nombre_pista`);

--
-- Indices de la tabla `animales_artistas`
--
ALTER TABLE `animales_artistas`
  ADD PRIMARY KEY (`nombre_animal`,`nif_artista`),
  ADD KEY `fk_ANIMALES_has_ARTISTAS_ARTISTAS1_idx` (`nif_artista`),
  ADD KEY `fk_ANIMALES_has_ARTISTAS_ANIMALES1_idx` (`nombre_animal`);

--
-- Indices de la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD PRIMARY KEY (`nif`),
  ADD KEY `fk_ARTISTAS_JEFEARTISTAS_idx` (`nif_jefe`);

--
-- Indices de la tabla `atracciones`
--
ALTER TABLE `atracciones`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `atracciones_artistas`
--
ALTER TABLE `atracciones_artistas`
  ADD PRIMARY KEY (`nombre_atraccion`,`nif_artista`,`fecha_inicio`),
  ADD KEY `fk_ATRACCIONES_has_ARTISTAS_ARTISTAS1_idx` (`nif_artista`),
  ADD KEY `fk_ATRACCIONES_has_ARTISTAS_ATRACCIONES1_idx` (`nombre_atraccion`);

--
-- Indices de la tabla `atraccion_dia`
--
ALTER TABLE `atraccion_dia`
  ADD PRIMARY KEY (`nombre_atraccion`,`fecha`);

--
-- Indices de la tabla `pistas`
--
ALTER TABLE `pistas`
  ADD PRIMARY KEY (`nombre`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `animales`
--
ALTER TABLE `animales`
  ADD CONSTRAINT `fk_ANIMALES_ATRACCIONES1` FOREIGN KEY (`nombre_atraccion`) REFERENCES `atracciones` (`nombre`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ANIMALES_PISTAS1` FOREIGN KEY (`nombre_pista`) REFERENCES `pistas` (`nombre`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `animales_artistas`
--
ALTER TABLE `animales_artistas`
  ADD CONSTRAINT `fk_ANIMALES_has_ARTISTAS_ANIMALES1` FOREIGN KEY (`nombre_animal`) REFERENCES `animales` (`nombre`),
  ADD CONSTRAINT `fk_ANIMALES_has_ARTISTAS_ARTISTAS1` FOREIGN KEY (`nif_artista`) REFERENCES `artistas` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `artistas`
--
ALTER TABLE `artistas`
  ADD CONSTRAINT `fk_ARTISTAS_JEFEARTISTAS` FOREIGN KEY (`nif_jefe`) REFERENCES `artistas` (`nif`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Filtros para la tabla `atracciones_artistas`
--
ALTER TABLE `atracciones_artistas`
  ADD CONSTRAINT `fk_ATRACCIONES_has_ARTISTAS_ARTISTAS1` FOREIGN KEY (`nif_artista`) REFERENCES `artistas` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ATRACCIONES_has_ARTISTAS_ATRACCIONES1` FOREIGN KEY (`nombre_atraccion`) REFERENCES `atracciones` (`nombre`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `atraccion_dia`
--
ALTER TABLE `atraccion_dia`
  ADD CONSTRAINT `fk_ATRACCIONDIA_ATRACC` FOREIGN KEY (`nombre_atraccion`) REFERENCES `atracciones` (`nombre`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
