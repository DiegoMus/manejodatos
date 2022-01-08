-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: db
-- Tiempo de generación: 14-12-2021 a las 04:22:27
-- Versión del servidor: 8.0.27
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_salud`
--

CREATE TABLE `area_salud` (
  `idarea_salud` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `distrito_salud`
--

CREATE TABLE `distrito_salud` (
  `iddistrito_salud` int NOT NULL,
  `distrito_saludcol` varchar(45) DEFAULT NULL,
  `area_salud_idarea_salud` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etnia`
--

CREATE TABLE `etnia` (
  `idetnia` int NOT NULL,
  `etniacol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `idevento` int NOT NULL,
  `eventocol` varchar(45) DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `objetivo` varchar(100) DEFAULT NULL,
  `tipo_evento_idtipo_evento` int NOT NULL,
  `modalidad_idmodalidad` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalidad`
--

CREATE TABLE `modalidad` (
  `idmodalidad` int NOT NULL,
  `modalidadcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesion`
--

CREATE TABLE `profesion` (
  `idprofesion` int NOT NULL,
  `profesioncol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registro`
--

CREATE TABLE `registro` (
  `idregistro` int NOT NULL,
  `registrocol` varchar(45) DEFAULT NULL,
  `usuario_idusuario` int NOT NULL,
  `evento_idevento` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sexo`
--

CREATE TABLE `sexo` (
  `idsexo` int NOT NULL,
  `sexocol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_evento`
--

CREATE TABLE `tipo_evento` (
  `idtipo_evento` int NOT NULL,
  `tipo_eventocol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int NOT NULL,
  `cui` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido1` varchar(45) DEFAULT NULL,
  `apellido2` varchar(45) DEFAULT NULL,
  `distrito_salud_iddistrito_salud` int NOT NULL,
  `profesion_idprofesion` int NOT NULL,
  `sexo_idsexo` int NOT NULL,
  `etnia_idetnia` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_salud`
--
ALTER TABLE `area_salud`
  ADD PRIMARY KEY (`idarea_salud`);

--
-- Indices de la tabla `distrito_salud`
--
ALTER TABLE `distrito_salud`
  ADD PRIMARY KEY (`iddistrito_salud`),
  ADD KEY `fk_distrito_salud_area_salud_idx` (`area_salud_idarea_salud`);

--
-- Indices de la tabla `etnia`
--
ALTER TABLE `etnia`
  ADD PRIMARY KEY (`idetnia`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`idevento`),
  ADD KEY `fk_evento_tipo_evento1_idx` (`tipo_evento_idtipo_evento`),
  ADD KEY `fk_evento_modalidad1_idx` (`modalidad_idmodalidad`);

--
-- Indices de la tabla `modalidad`
--
ALTER TABLE `modalidad`
  ADD PRIMARY KEY (`idmodalidad`);

--
-- Indices de la tabla `profesion`
--
ALTER TABLE `profesion`
  ADD PRIMARY KEY (`idprofesion`);

--
-- Indices de la tabla `registro`
--
ALTER TABLE `registro`
  ADD PRIMARY KEY (`idregistro`),
  ADD KEY `fk_registro_usuario1_idx` (`usuario_idusuario`),
  ADD KEY `fk_registro_evento1_idx` (`evento_idevento`);

--
-- Indices de la tabla `sexo`
--
ALTER TABLE `sexo`
  ADD PRIMARY KEY (`idsexo`);

--
-- Indices de la tabla `tipo_evento`
--
ALTER TABLE `tipo_evento`
  ADD PRIMARY KEY (`idtipo_evento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_distrito_salud1_idx` (`distrito_salud_iddistrito_salud`),
  ADD KEY `fk_usuario_profesion1_idx` (`profesion_idprofesion`),
  ADD KEY `fk_usuario_sexo1_idx` (`sexo_idsexo`),
  ADD KEY `fk_usuario_etnia1_idx` (`etnia_idetnia`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `distrito_salud`
--
ALTER TABLE `distrito_salud`
  ADD CONSTRAINT `fk_distrito_salud_area_salud` FOREIGN KEY (`area_salud_idarea_salud`) REFERENCES `area_salud` (`idarea_salud`);

--
-- Filtros para la tabla `evento`
--
ALTER TABLE `evento`
  ADD CONSTRAINT `fk_evento_modalidad1` FOREIGN KEY (`modalidad_idmodalidad`) REFERENCES `modalidad` (`idmodalidad`),
  ADD CONSTRAINT `fk_evento_tipo_evento1` FOREIGN KEY (`tipo_evento_idtipo_evento`) REFERENCES `tipo_evento` (`idtipo_evento`);

--
-- Filtros para la tabla `registro`
--
ALTER TABLE `registro`
  ADD CONSTRAINT `fk_registro_evento1` FOREIGN KEY (`evento_idevento`) REFERENCES `evento` (`idevento`),
  ADD CONSTRAINT `fk_registro_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_distrito_salud1` FOREIGN KEY (`distrito_salud_iddistrito_salud`) REFERENCES `distrito_salud` (`iddistrito_salud`),
  ADD CONSTRAINT `fk_usuario_etnia1` FOREIGN KEY (`etnia_idetnia`) REFERENCES `etnia` (`idetnia`),
  ADD CONSTRAINT `fk_usuario_profesion1` FOREIGN KEY (`profesion_idprofesion`) REFERENCES `profesion` (`idprofesion`),
  ADD CONSTRAINT `fk_usuario_sexo1` FOREIGN KEY (`sexo_idsexo`) REFERENCES `sexo` (`idsexo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
