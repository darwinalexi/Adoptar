-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-07-2024 a las 02:56:57
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `veterinaria2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `adopciones`
--

CREATE TABLE `adopciones` (
  `id` int NOT NULL,
  `id_adoptante` int DEFAULT NULL,
  `edad` int DEFAULT NULL,
  `id_mascota` int DEFAULT NULL,
  `estado` enum('Adoptado','Por Adoptar','Pendiente') COLLATE utf8mb4_roman_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_roman_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int NOT NULL,
  `nombre` varchar(67) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_roman_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Pequeña'),
(2, 'Grande'),
(3, 'Mediano');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `genero`
--

CREATE TABLE `genero` (
  `id` int NOT NULL,
  `nombre` varchar(67) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_roman_ci;

--
-- Volcado de datos para la tabla `genero`
--

INSERT INTO `genero` (`id`, `nombre`) VALUES
(1, 'Macho'),
(2, 'Hembra');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mascotas`
--

CREATE TABLE `mascotas` (
  `id` int NOT NULL,
  `raza` int NOT NULL,
  `categoria_id` int NOT NULL,
  `foto` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci NOT NULL,
  `genero_id` int NOT NULL,
  `nombre_mas` varchar(34) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci DEFAULT NULL,
  `id_vacuna` enum('Vacunado','No Vacunado') CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci DEFAULT NULL,
  `descripcion` varchar(87) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci DEFAULT NULL,
  `edad` int NOT NULL,
  `usuario` int DEFAULT NULL,
  `estado` enum('Por adoptar','Adoptado','En proceso') CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci DEFAULT 'Por adoptar',
  `historial_medico` varchar(200) COLLATE utf8mb4_roman_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_roman_ci;

--
-- Volcado de datos para la tabla `mascotas`
--

INSERT INTO `mascotas` (`id`, `raza`, `categoria_id`, `foto`, `genero_id`, `nombre_mas`, `id_vacuna`, `descripcion`, `edad`, `usuario`, `estado`, `historial_medico`) VALUES
(59, 2, 2, 'princesa.JPG', 1, 'princesa', 'Vacunado', 'es tuqui tuqui', 5, 2, NULL, 'es saludable con todas lsas vacunas al dia  y se kas pusieron gratis '),
(60, 2, 3, 'rufo.JPG', 1, 'rufo', 'Vacunado', 'es hjhj', 2, 2, 'Por adoptar', 'resta bien vacunado'),
(61, 2, 2, 'princesa.JPG', 1, 'princesa', 'Vacunado', 'es paila buena', 3, 2, 'Por adoptar', NULL),
(62, 2, 3, 'Vainilla.JPG', 2, 'vainilla', 'Vacunado', 'es paila de pi ', 4, 2, 'Adoptado', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `razas`
--

CREATE TABLE `razas` (
  `id` int NOT NULL,
  `nombre_r` varchar(23) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_roman_ci;

--
-- Volcado de datos para la tabla `razas`
--

INSERT INTO `razas` (`id`, `nombre_r`) VALUES
(1, 'Pincher'),
(2, 'Criollo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int NOT NULL,
  `nombre` varchar(54) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci NOT NULL,
  `email` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci NOT NULL,
  `tipo` enum('Administrador','Usuario') CHARACTER SET utf8mb4 COLLATE utf8mb4_roman_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_roman_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`, `tipo`) VALUES
(2, 'Darwin Alexis Guerrero', 'darwin@gmail.com', '1324', 'Administrador'),
(12, 'maria', 'mdb@gmail.com', '123', 'Usuario');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `adopciones`
--
ALTER TABLE `adopciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_adoptante` (`id_adoptante`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `genero`
--
ALTER TABLE `genero`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `raza` (`raza`),
  ADD KEY `categoria_id` (`categoria_id`),
  ADD KEY `genero_id` (`genero_id`),
  ADD KEY `adopcion` (`usuario`),
  ADD KEY `id_vacuna` (`id_vacuna`);

--
-- Indices de la tabla `razas`
--
ALTER TABLE `razas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `adopciones`
--
ALTER TABLE `adopciones`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `genero`
--
ALTER TABLE `genero`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `mascotas`
--
ALTER TABLE `mascotas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `razas`
--
ALTER TABLE `razas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `adopciones`
--
ALTER TABLE `adopciones`
  ADD CONSTRAINT `adopciones_ibfk_1` FOREIGN KEY (`id_adoptante`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `mascotas`
--
ALTER TABLE `mascotas`
  ADD CONSTRAINT `adopcion` FOREIGN KEY (`usuario`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `mascotas_ibfk_1` FOREIGN KEY (`raza`) REFERENCES `razas` (`id`),
  ADD CONSTRAINT `mascotas_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `mascotas_ibfk_3` FOREIGN KEY (`genero_id`) REFERENCES `genero` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
