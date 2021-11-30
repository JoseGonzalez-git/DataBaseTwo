-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 30-09-2016 a las 18:58:13
-- Versión del servidor: 5.6.33
-- Versión de PHP: 5.6.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `algebra`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno`
--

CREATE TABLE `alumno` (
  `exp` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombreC` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `pID` int(10) UNSIGNED NOT NULL,
  `titulacion` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `alumno`
--

INSERT INTO `alumno` (`exp`, `nombreC`, `pID`, `titulacion`) VALUES
('1010', 'UCC', 7, 'Ing Sistemas'),
('1011', 'UNISINU', 8, 'especialista en redes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro`
--

CREATE TABLE `centro` (
  `nombreC` varchar(80) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `centro`
--

INSERT INTO `centro` (`nombreC`) VALUES
('REMINTON'),
('UCC'),
('UNICOR'),
('UNISINU'),
('UPB');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imparte`
--

CREATE TABLE `imparte` (
  `nombreC` varchar(80) COLLATE utf8_spanish_ci NOT NULL,
  `pID` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `imparte`
--

INSERT INTO `imparte` (`nombreC`, `pID`) VALUES
('UNISINU', 2),
('UCC', 4),
('UCC', 6),
('REMINTON', 10),
('UCC', 10),
('UNICOR', 10),
('UNISINU', 10),
('UPB', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `pID` int(10) UNSIGNED NOT NULL,
  `dir` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `tfno` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`pID`, `dir`, `tfno`, `email`, `nombre`) VALUES
(1, 'cll 53 # 6-60', '7845071', 'jdavilaargel7@gmail.com', 'juan davila'),
(2, 'cll 50 # 6-70', '7822123', 'dayana1503@gmail.com', 'dayana hernandez'),
(3, 'cll 41 # 12-33', '7842532', 'escobar1489@hotmail.com', 'jose escobar'),
(4, 'cll 8 # 6-60', '7842390', 'dariojose7@gmail.com', 'dario sanchez'),
(5, 'cll 20 # 12-44', '7842982', 'yepesnaty77@gmail.com', 'natalia yepes'),
(6, 'cll 22 # 13-45', '7852082', 'palmiro@gmail.com', 'paola miranda'),
(7, 'cll 12 # 11-40', '7802080', 'caritom@gmail.com', 'carolina mora'),
(8, 'cll 10 # 10-45', '7950082', 'cgomez@gmail.com', 'carlos gómez'),
(9, 'Calle 45 # 47 - 67', '322 654 78 90', 'victor.castro@correo.unicor.edu.co', 'Víctor Castro'),
(10, 'Calle 53A # 6 - 77', '305 676 89 00', 'juan.vergara@gmail.com', 'Juan Vergara');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `pID` int(10) UNSIGNED NOT NULL,
  `unidad` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `cat` varchar(40) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`pID`, `unidad`, `cat`) VALUES
(1, 'Gestion Humana', '3'),
(2, 'Planeación', '2'),
(3, 'Dirección', '1'),
(4, 'Coordinación Académica', '4'),
(5, 'Registro y Control', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesor`
--

CREATE TABLE `profesor` (
  `pID` int(10) UNSIGNED NOT NULL,
  `ded` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesor`
--

INSERT INTO `profesor` (`pID`, `ded`) VALUES
(2, 'tiempo parcial'),
(4, 'tiempo parcial'),
(6, 'tiempo indefinido'),
(9, 'tiempo indefinido'),
(10, 'tiempo pacial');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD PRIMARY KEY (`exp`),
  ADD KEY `Alumno_FKIndex1` (`pID`),
  ADD KEY `Alumno_FKIndex2` (`nombreC`);

--
-- Indices de la tabla `centro`
--
ALTER TABLE `centro`
  ADD PRIMARY KEY (`nombreC`);

--
-- Indices de la tabla `imparte`
--
ALTER TABLE `imparte`
  ADD PRIMARY KEY (`nombreC`,`pID`),
  ADD KEY `Profesor_has_centro_FKIndex1` (`pID`),
  ADD KEY `Profesor_has_centro_FKIndex2` (`nombreC`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`pID`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `Personal_FKIndex1` (`pID`);

--
-- Indices de la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD PRIMARY KEY (`pID`),
  ADD KEY `Profesor_FKIndex1` (`pID`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno`
--
ALTER TABLE `alumno`
  ADD CONSTRAINT `alumno_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `persona` (`pID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `alumno_ibfk_2` FOREIGN KEY (`nombreC`) REFERENCES `centro` (`nombreC`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `imparte`
--
ALTER TABLE `imparte`
  ADD CONSTRAINT `imparte_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `profesor` (`pID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `imparte_ibfk_2` FOREIGN KEY (`nombreC`) REFERENCES `centro` (`nombreC`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `personal`
--
ALTER TABLE `personal`
  ADD CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `persona` (`pID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesor`
--
ALTER TABLE `profesor`
  ADD CONSTRAINT `profesor_ibfk_1` FOREIGN KEY (`pID`) REFERENCES `persona` (`pID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
