-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 08-10-2020 a las 00:05:46
-- Versión del servidor: 8.0.18
-- Versión de PHP: 7.4.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema_inventario`
--

DELIMITER $$
--
-- Procedimientos
--
DROP PROCEDURE IF EXISTS `Consultar_Areas`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Consultar_Areas` (IN `_id_gerencia` INT)  BEGIN
SELECT * FROM tbl_area WHERE id_gerencia = _id_gerencia;
END$$

DROP PROCEDURE IF EXISTS `Consultar_Asignacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Consultar_Asignacion` (IN `_id_gerencia` INT, IN `_id_area` INT, IN `_id_personal` INT)  BEGIN
    IF (_id_area IS NULL OR _id_area = 0) AND (_id_personal IS NULL OR _id_personal=0) THEN
    
    	Select tbl_asignacion.id_asignacion, tbl_asignacion.id_usuario, tbl_asignacion.id_inventario,tbl_bienes.id_bienes, tbl_bienes.nombre as bien,tbl_bienes.codigo, tbl_asignacion.id_personal,tbl_personal.nombre AS personal,tbl_gerencia.id_gerencia,tbl_gerencia.nombre as gerencia, tbl_asignacion.id_area,tbl_area.nombre as area, tbl_asignacion.fecha, tbl_asignacion.disponibilidad 
from tbl_asignacion INNER JOIN tbl_area ON tbl_asignacion.id_area = tbl_area.id_area 
INNER JOIN tbl_gerencia ON tbl_gerencia.id_gerencia = tbl_area.id_gerencia 
INNER JOIN tbl_inventario ON tbl_asignacion.id_inventario=tbl_inventario.id_inventario
INNER JOIN tbl_bienes ON tbl_bienes.id_bienes = tbl_inventario.id_bienes
INNER JOIN tbl_personal ON tbl_personal.id_personal = tbl_asignacion.id_personal WHERE tbl_area.id_gerencia = _id_gerencia;

	ELSEIF (_id_area IS NULL OR _id_area = 0) AND (_id_personal IS NOT NULL OR _id_personal <> 0) THEN
    	Select tbl_asignacion.id_asignacion, tbl_asignacion.id_usuario, tbl_asignacion.id_inventario,tbl_bienes.id_bienes, tbl_bienes.nombre as bien,tbl_bienes.codigo, tbl_asignacion.id_personal,tbl_personal.nombre AS personal,tbl_gerencia.id_gerencia,tbl_gerencia.nombre as gerencia, tbl_asignacion.id_area,tbl_area.nombre as area, tbl_asignacion.fecha, tbl_asignacion.disponibilidad 
from tbl_asignacion INNER JOIN tbl_area ON tbl_asignacion.id_area = tbl_area.id_area 
INNER JOIN tbl_gerencia ON tbl_gerencia.id_gerencia = tbl_area.id_gerencia 
INNER JOIN tbl_inventario ON tbl_asignacion.id_inventario=tbl_inventario.id_inventario
INNER JOIN tbl_bienes ON tbl_bienes.id_bienes = tbl_inventario.id_bienes
INNER JOIN tbl_personal ON tbl_personal.id_personal = tbl_asignacion.id_personal WHERE tbl_asignacion.id_personal = _id_personal AND tbl_area.id_gerencia = _id_gerencia;

	ELSEIF (_id_area IS NOT NULL OR _id_area <> 0) AND (_id_personal IS NULL OR _id_personal = 0) THEN
    	Select tbl_asignacion.id_asignacion, tbl_asignacion.id_usuario, tbl_asignacion.id_inventario,tbl_bienes.id_bienes, tbl_bienes.nombre as bien,tbl_bienes.codigo, tbl_asignacion.id_personal,tbl_personal.nombre AS personal,tbl_gerencia.id_gerencia,tbl_gerencia.nombre as gerencia, tbl_asignacion.id_area,tbl_area.nombre as area, tbl_asignacion.fecha, tbl_asignacion.disponibilidad 
from tbl_asignacion INNER JOIN tbl_area ON tbl_asignacion.id_area = tbl_area.id_area 
INNER JOIN tbl_gerencia ON tbl_gerencia.id_gerencia = tbl_area.id_gerencia 
INNER JOIN tbl_inventario ON tbl_asignacion.id_inventario=tbl_inventario.id_inventario
INNER JOIN tbl_bienes ON tbl_bienes.id_bienes = tbl_inventario.id_bienes
INNER JOIN tbl_personal ON tbl_personal.id_personal = tbl_asignacion.id_personal WHERE tbl_asignacion.id_area = _id_area AND tbl_area.id_gerencia = _id_gerencia;

	ELSEIF (_id_area IS NOT NULL OR _id_area <> 0) AND (_id_personal IS NOT NULL OR _id_personal <> 0) THEN
    	Select tbl_asignacion.id_asignacion, tbl_asignacion.id_usuario, tbl_asignacion.id_inventario,tbl_bienes.id_bienes, tbl_bienes.nombre as bien,tbl_bienes.codigo, tbl_asignacion.id_personal,tbl_personal.nombre AS personal,tbl_gerencia.id_gerencia,tbl_gerencia.nombre as gerencia, tbl_asignacion.id_area,tbl_area.nombre as area, tbl_asignacion.fecha, tbl_asignacion.disponibilidad 
from tbl_asignacion INNER JOIN tbl_area ON tbl_asignacion.id_area = tbl_area.id_area 
INNER JOIN tbl_gerencia ON tbl_gerencia.id_gerencia = tbl_area.id_gerencia 
INNER JOIN tbl_inventario ON tbl_asignacion.id_inventario=tbl_inventario.id_inventario
INNER JOIN tbl_bienes ON tbl_bienes.id_bienes = tbl_inventario.id_bienes
INNER JOIN tbl_personal ON tbl_personal.id_personal = tbl_asignacion.id_personal WHERE tbl_asignacion.id_area = _id_area AND tbl_area.id_gerencia = _id_gerencia AND tbl_asignacion.id_personal = _id_personal;
        END IF;
        
        END$$

DROP PROCEDURE IF EXISTS `Consultar_Bien`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Consultar_Bien` (IN `_codigo` VARCHAR(9))  BEGIN
SELECT * FROM tbl_bienes WHERE codigo = _codigo;
END$$

DROP PROCEDURE IF EXISTS `Consultar_Gerencias`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Consultar_Gerencias` ()  BEGIN
SELECT * FROM tbl_gerencia;
END$$

DROP PROCEDURE IF EXISTS `Consultar_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `Consultar_Personal` (IN `_id_area` INT)  BEGIN
Select * from tbl_personal where id_area = _id_area;
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Area`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Area` (IN `_id_gerencia` INT, IN `_nombre` VARCHAR(75), IN `_ubicacion` VARCHAR(75), IN `_descripcion` VARCHAR(150))  BEGIN
INSERT into tbl_area(id_gerencia,nombre,ubicacion,descripcion) VALUES(_id_berencia,_nombre,_ubicacion_descripcion);
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Asignacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Asignacion` (IN `_id_usuario` INT, IN `_id_inventario` INT, IN `_id_personal` INT, IN `_id_area` INT, IN `_fecha` DATE)  BEGIN
    INSERT INTO tbl_asignacion(id_usuario, id_inventario, id_personal, id_area, fecha) VALUES(_id_usuario, _id_inventario, _id_personal, _id_area, _fecha);
    END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Bienes` (IN `_id_categoria` INT, IN `_nombre` VARCHAR(50), IN `_descripcion` VARCHAR(200), IN `_codigo` VARCHAR(9), IN `_precio` DOUBLE(11,2), IN `_imagen` VARCHAR(200), IN `_estado` VARCHAR(45), IN `_fecha_ing` DATE, IN `_marca` VARCHAR(45), IN `_color` VARCHAR(45), IN `_modelo` VARCHAR(45), IN `_alto` VARCHAR(45), IN `_ancho` VARCHAR(45), IN `_profundidad` VARCHAR(45))  BEGIN
INSERT INTO tbl_bienes(id_categoria,nombre,descripcion,codigo,precio,imagen,estado,fecha_ing,marca,color,modelo,alto,ancho,profundidad)
VALUES(_id_categoria,_nombre,_descripcion,_codigo,_precio,_imagen,_estado,_fecha_ing,_marca,_color,_modelo,_alto,_ancho,_profundidad);
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Categoria` (IN `_nombre` VARCHAR(45), IN `_descripcion` VARCHAR(200))  BEGIN
INSERT into tbl_categoria(nombre, descripcion) VALUES(_nombre,_descripcion);
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Gerencia` (IN `_nombre` VARCHAR(75), IN `_descripcion` VARCHAR(150), IN `_disponibilidad` TINYINT(1))  BEGIN
    INSERT INTO tbl_gerencia(nombre,descripcion,disponibilidad) VALUES(_nombre,_descripcion_disponibilidad);
    END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Inventario` (IN `_id_bienes` INT, IN `_inventario` VARCHAR(45), IN `_fecha` DATE, IN `_estado` VARCHAR(45))  BEGIN
    INSERT INTO tbl_inventario(id_bienes,inventario,fecha,estado) values(_id_bienes,_inventario,_fecha,_estado);
    END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Personal` (IN `_id_area` INT, IN `_nombre` VARCHAR(80), IN `_cargo` VARCHAR(60), IN `_t_documento` VARCHAR(5), IN `_n_documento` VARCHAR(11), IN `_edad` INT, IN `_sexo` VARCHAR(10), IN `_est_civil` VARCHAR(10), IN `_celular` VARCHAR(15), IN `_direccion` VARCHAR(45), IN `_correo` VARCHAR(45))  BEGIN
INSERT INTO tbl_personal(id_area, nombre, cargo, t_documento,n_documento,edad,sexo,est_civil,celular,direccion,correo) VALUES(_id_area, _nombre, _cargo, _t_documento,_n_documento,_edad,_sexo,_est_civil,_celular,_direccion,_correo);
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Usuario` (IN `_nombre` VARCHAR(80), IN `_usuario` VARCHAR(45), IN `_contrasena` VARCHAR(45), IN `_documento` VARCHAR(5), IN `_n_documento` VARCHAR(11), IN `_correo` VARCHAR(45), IN `_celular` VARCHAR(9), IN `_direccion` VARCHAR(50), IN `_cargo` VARCHAR(45))  BEGIN
INSERT INTO tbl_usuario(nombre, usuario,contrasena,documento,n_documento,correo,celular,direccion,cargo) VALUES(_nombre, _usuario, _contrasena, _documento, _n_documento, _correo, _celular, _direccion, _cargo);
END$$

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Area`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Area` (IN `_id_area` INT)  BEGIN
UPDATE tbl_area SET disponibilidad = 0 WHERE id_area = _id_area;
END$$

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Asignacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Asignacion` (IN `_id_asignacion` INT)  BEGIN
    UPDATE tbl_asignacion SET disponibilidad = 0 WHERE id_asignacion = _id_asignacion;
    END$$

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Bienes` (IN `_id_bienes` INT)  BEGIN
UPDATE tbl_bienes SET disponibilidad = 0 WHERE id_bienes = _id_bienes;
END$$

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Categoria` (IN `_id_categoria` INT)  BEGIN
UPDATE tbl_categoria SET disponibilidad = 0 WHERE id_categoria = _id_categoria;
END$$

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Gerencia` (IN `_id_gerencia` INT)  BEGIN 
 UPDATE tbl_gerencia SET disponibilidad = 0 WHERE id_gerencia = _id_gerencia;
 END$$

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Inventario` (IN `_id_inventario` INT)  BEGIN
    UPDATE tbl_inventario SET disponibilidad = 0 WHERE id_inventario = _id_inventario;
    END$$

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Personal` (IN `_id_personal` INT)  BEGIN 
UPDATE tbl_personal SET disponibilidad = 0 WHERE id_personal = _id_personal; 
END$$

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Usuario` (IN `_id_usuario` INT)  BEGIN
    UPDATE tbl_usuario SET disponibilidad = 0 WHERE 
	id_usuario = _id_usuario;
    END$$

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Bienes` (IN `_id_bienes` INT)  BEGIN
IF EXISTS(SELECT * FROM tbl_bienes)THEN
	SELECT tbl_bienes.id_bienes, tbl_bienes.id_categoria, tbl_categoria.nombre as "categoria", tbl_bienes.nombre, tbl_bienes.descripcion, tbl_bienes.codigo,
    tbl_bienes.precio, tbl_bienes.imagen, tbl_bienes.estado, tbl_bienes.fecha_ing, tbl_bienes.marca, tbl_bienes.color, tbl_bienes.modelo, tbl_bienes.alto,
    tbl_bienes.ancho, tbl_bienes.profundidad FROM tbl_bienes INNER JOIN tbl_categoria ON tbl_bienes.id_categoria = tbl_categoria.id_categoria WHERE tbl_bienes.id_bienes = _id_bienes;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Personal` (IN `_id_personal` INT)  BEGIN
    IF EXISTS(SELECT * FROM tbl_personal) THEN
	SELECT tbl_personal.id_personal, tbl_personal.id_area, tbl_area.nombre as "area", tbl_gerencia.id_gerencia, tbl_gerencia.nombre as 	"gerencia",tbl_personal.nombre, tbl_personal.cargo, tbl_personal.t_documento, tbl_personal.n_documento,tbl_personal.edad, tbl_personal.sexo, tbl_personal.est_civil, tbl_personal.celular,tbl_personal.direccion, tbl_personal.correo FROM tbl_personal INNER JOIN tbl_area on tbl_personal.id_area = tbl_area.id_area INNER JOIN tbl_gerencia on tbl_area.id_gerencia = tbl_gerencia.id_gerencia where tbl_personal.id_personal=_id_personal; 
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Usuario` (IN `_id_usuario` INT)  BEGIN
    IF EXISTS(SELECT * FROM tbl_usuario)THEN
    	SELECT id_usuario, nombre, usuario,contrasena, documento,n_documento,correo,celular,direccion,cargo FROM tbl_usuario WHERE id_usuario = _id_usuario;
    END IF;
    END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Area`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Area` ()  BEGIN
IF EXISTS (SELECT * FROM tbl_area) THEN
SELECT id_area, id_gerencia, nombre,ubicacion, descripcion FROM tbl_area WHERE disponibilidad > 0;
END IF;
end$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Asignacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Asignacion` ()  BEGIN
IF EXISTS (SELECT * from tbl_asignacion)THEN
	SELECT tbl_asignacion.id_asignacion, tbl_asignacion.id_usuario, tbl_asignacion.id_inventario, tbl_inventario.inventario,tbl_asignacion.id_personal, tbl_personal.nombre as "personal", tbl_asignacion.id_area, tbl_area.nombre as "area", tbl_area.id_gerencia, tbl_gerencia.nombre as "gerencia", tbl_asignacion.fecha FROM tbl_asignacion INNER JOIN tbl_inventario ON tbl_asignacion.id_inventario = tbl_inventario.id_inventario INNER JOIN tbl_personal ON tbl_asignacion.id_personal = tbl_personal.id_personal INNER JOIN tbl_area ON tbl_asignacion.id_area = tbl_area.id_area INNER JOIN tbl_gerencia ON tbl_area.id_gerencia = tbl_gerencia.id_gerencia WHERE tbl_asignacion.disponibilidad>0;
    END IF;
    END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Bienes` ()  BEGIN
IF EXISTS(SELECT * FROM tbl_bienes)THEN
	SELECT tbl_bienes.id_bienes, tbl_bienes.id_categoria, tbl_categoria.nombre as "categoria", tbl_bienes.nombre, tbl_bienes.descripcion, tbl_bienes.codigo,
    tbl_bienes.precio, tbl_bienes.imagen, tbl_bienes.estado, tbl_bienes.fecha_ing, tbl_bienes.marca, tbl_bienes.color, tbl_bienes.modelo, tbl_bienes.alto,
    tbl_bienes.ancho, tbl_bienes.profundidad FROM tbl_bienes INNER JOIN tbl_categoria ON tbl_bienes.id_categoria = tbl_categoria.id_categoria WHERE tbl_bienes.disponibilidad > 0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Categoria` ()  BEGIN
IF EXISTS(SELECT * FROM tbl_categoria) THEN
SELECT nombre, descripcion from tbl_categoria WHERE disponibilidad >0;
END IF;
end$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Gerencia` ()  BEGIN 
  IF EXISTS (SELECT * from tbl_gerencia) THEN
  	SELECT id_gerencia, nombre, descripcion, disponibilidad FROM tbl_gerencia;
  END IF;
  END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Inventario` ()  BEGIN
IF EXISTS(SELECT * FROM tbl_inventario)THEN
	SELECT tbl_inventario.id_inventario, tbl_inventario.id_bienes, tbl_bienes.nombre as "bien", tbl_inventario.inventario, tbl_inventario.fecha, tbl_inventario.estado from tbl_inventario INNER JOIN tbl_bienes on tbl_inventario.id_bienes = tbl_bienes.id_bienes WHERE disponibilidad >0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Personal` ()  BEGIN 
IF EXISTS(SELECT * FROM tbl_personal) THEN
	SELECT tbl_personal.id_personal, tbl_personal.id_area, tbl_area.nombre as "area", tbl_gerencia.id_gerencia, tbl_gerencia.nombre as 	"gerencia",tbl_personal.nombre, tbl_personal.cargo, tbl_personal.t_documento, tbl_personal.n_documento,tbl_personal.edad, tbl_personal.sexo, tbl_personal.est_civil, tbl_personal.celular,tbl_personal.direccion, tbl_personal.correo FROM tbl_personal INNER JOIN tbl_area on tbl_personal.id_area = tbl_area.id_area INNER JOIN tbl_gerencia on tbl_area.id_gerencia = tbl_gerencia.id_gerencia where tbl_personal.disponibilidad >0; 
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Usuario` ()  BEGIN
IF EXISTS (SELECT * FROM tbl_usuario) THEN
 SELECT id_usuario, nombre, usuario,
 documento,n_documento,correo,
 celular,direccion,cargo from tbl_usuario where disponibilidad>0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Area`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Area` (IN `_id_area` INT, IN `_id_gerencia` INT, IN `_nombre` VARCHAR(75), IN `_ubicacion` VARCHAR(75), IN `_descripcion` VARCHAR(150))  BEGIN
    UPDATE tbl_area SET id_gerencia = _id_gerencia, nombre = _nombre, ubicacion = _ubicacion, descripcion = _descripcion WHERE id_area = _id_area;
    END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Asignacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Asignacion` (IN `_id_asignacion` INT, IN `_id_usuario` INT, IN `_id_inventario` INT, IN `_id_personal` INT, IN `_id_area` INT, IN `_fecha` DATE)  BEGIN
UPDATE tbl_asignacion SET id_usuario = _id_usuario, id_inventario = _id_inventario, id_personal = _id_personal, id_area = _id_area, fecha = _fecha WHERE id_asignacion = _id_asignacion;
END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Bienes` (IN `_id_bienes` INT, IN `_id_categoria` INT, IN `_nombre` VARCHAR(50), IN `_descripcion` VARCHAR(200), IN `_codigo` VARCHAR(9), IN `_precio` DOUBLE(11,2), IN `_imagen` VARCHAR(200), IN `_estado` VARCHAR(45), IN `_fecha_ing` DATE, IN `_marca` VARCHAR(45), IN `_color` VARCHAR(45), IN `_modelo` VARCHAR(45), IN `_alto` VARCHAR(45), IN `_ancho` VARCHAR(45), IN `_profundidad` VARCHAR(45))  BEGIN
UPDATE tbl_bienes SET id_categoria = _id_categoria, nombre = _nombre, descripcion = _descripcion, codigo = _codigo, precio = _precio, imagen = _imagen,
estado = _estado, fecha_ing = _fecha_ing, marca = _marca, color = _color, modelo = _modelo, alto = _alto, ancho = _ancho, profundidad = _profundidad WHERE id_bienes = _id_bienes;
END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Categoria` (IN `_id_categoria` INT, IN `_nombre` VARCHAR(45), IN `_descripcion` VARCHAR(200))  BEGIN
UPDATE tbl_categoria SET nombre = _nombre, descripcion = _descripcion WHERE id_categoria = _id_categoria;
END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Gerencia` (IN `_id_gerencia` INT, IN `_nombre` VARCHAR(75), IN `_descripcion` VARCHAR(150), IN `_disponibilidad` TINYINT(1))  BEGIN
    UPDATE tbl_gerencia SET nombre = _nombre, descripcion = _descripcion WHERE id_gerencia = _id_gerencia;
    END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Inventario` (IN `_id_inventario` INT, IN `_id_bienes` INT, IN `_inventario` VARCHAR(45), IN `_fecha` DATE, IN `_estado` VARCHAR(45))  BEGIN
    UPDATE tbl_inventario SET id_bienes = _id_bienes, inventario = _inventario, fecha=_fecha, estado = _estado WHERE id_inventario = _id_inventario;
    END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Personal` (IN `_id_personal` INT, IN `_id_area` INT, IN `_nombre` VARCHAR(80), IN `_cargo` VARCHAR(60), IN `_t_documento` VARCHAR(5), IN `_n_documento` VARCHAR(11), IN `_edad` INT, IN `_sexo` VARCHAR(10), IN `_est_civil` VARCHAR(10), IN `_celular` VARCHAR(15), IN `_direccion` VARCHAR(45), IN `_correo` VARCHAR(45))  BEGIN 
UPDATE tbl_personal SET id_area = _id_area, nombre = _nombre, cargo = _cargo, t_documento = _t_documento, n_documento= _n_documento, edad = _edad, est_civil = _est_civil, celular = _celular, direccion = _direccion, correo = _correo WHERE id_personal = _id_personal;
END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Usuario` (IN `_id_usuario` INT, IN `_nombre` VARCHAR(80), IN `_usuario` VARCHAR(45), IN `_contrasena` VARCHAR(45), IN `_documento` VARCHAR(5), IN `_n_documento` VARCHAR(11), IN `_correo` VARCHAR(45), IN `_celular` VARCHAR(9), IN `_direccion` VARCHAR(50), IN `_cargo` VARCHAR(45))  BEGIN
UPDATE tbl_usuario SET nombre=_nombre, usuario=_usuario,contrasena=_contrasena,
documento=_documento,n_documento=_n_documento,correo=_correo,celular=_celular,
direccion=_direccion,cargo=_cargo WHERE id_usuario = _id_usuario;
END$$

DROP PROCEDURE IF EXISTS `SP_V_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_V_Tabla_Usuario` (IN `_usuario` VARCHAR(45), IN `_contrasena` VARCHAR(45))  BEGIN
IF EXISTS (SELECT * FROM tbl_usuario) THEN
 SELECT * FROM tbl_usuario WHERE usuario=_usuario and 
 contrasena = _contrasena and disponibilidad > 0;
END IF;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_area`
--

DROP TABLE IF EXISTS `tbl_area`;
CREATE TABLE IF NOT EXISTS `tbl_area` (
  `id_area` int(11) NOT NULL AUTO_INCREMENT,
  `id_gerencia` int(11) NOT NULL,
  `nombre` varchar(75) NOT NULL,
  `ubicacion` varchar(75) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_area`),
  KEY `fk_gerencia_idx` (`id_gerencia`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_area`
--

INSERT INTO `tbl_area` (`id_area`, `id_gerencia`, `nombre`, `ubicacion`, `descripcion`, `disponibilidad`) VALUES
(1, 1, 'Sub Gerencia de Contabilidad', 'Segundo Piso del Centro Civico', 'Area encargada de la contabilidad de la Municipalidad', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asignacion`
--

DROP TABLE IF EXISTS `tbl_asignacion`;
CREATE TABLE IF NOT EXISTS `tbl_asignacion` (
  `id_asignacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  `id_area` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_asignacion`),
  KEY `fk_t_com_usuario_idx` (`id_usuario`),
  KEY `fk_asignacion_inventario_idx` (`id_inventario`),
  KEY `fk_asignacion_personal_idx` (`id_personal`),
  KEY `fk_asignacion_area_idx` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_asignacion`
--

INSERT INTO `tbl_asignacion` (`id_asignacion`, `id_usuario`, `id_inventario`, `id_personal`, `id_area`, `fecha`, `disponibilidad`) VALUES
(1, 1, 1, 1, 1, '2020-09-27', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bienes`
--

DROP TABLE IF EXISTS `tbl_bienes`;
CREATE TABLE IF NOT EXISTS `tbl_bienes` (
  `id_bienes` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `codigo` varchar(9) NOT NULL,
  `precio` double(11,2) NOT NULL,
  `imagen` varchar(200) DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  `fecha_ing` date DEFAULT NULL,
  `marca` varchar(45) NOT NULL,
  `color` varchar(45) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `alto` varchar(45) DEFAULT NULL,
  `ancho` varchar(45) DEFAULT NULL,
  `profundidad` varchar(45) DEFAULT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_bienes`),
  KEY `fk_categoria_idx` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_bienes`
--

INSERT INTO `tbl_bienes` (`id_bienes`, `id_categoria`, `nombre`, `descripcion`, `codigo`, `precio`, `imagen`, `estado`, `fecha_ing`, `marca`, `color`, `modelo`, `alto`, `ancho`, `profundidad`, `disponibilidad`) VALUES
(1, 1, 'Mesa de Escritorio con 4 cajones', 'Tiene un agujero debajo de un cajon', '454', 150.00, '', '1', '2020-10-07', 'No especifica', 'Cedro', 'Normal', '1 metro', '2 metros', '1 metro', 1),
(2, 1, 'Aminoclorito', 'Pastillas para el estomago', 'TFZE', 5.00, '', '2', '2020-10-07', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 0),
(3, 1, 'Aminoclorito', 'Pastillas para el estomago', 'TFZE', 5.00, '', '2', '2020-10-07', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 'asdf', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_categoria`
--

DROP TABLE IF EXISTS `tbl_categoria`;
CREATE TABLE IF NOT EXISTS `tbl_categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`id_categoria`, `nombre`, `descripcion`, `disponibilidad`) VALUES
(1, 'Muebles', 'Todos los mobiliarios en madera', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_gerencia`
--

DROP TABLE IF EXISTS `tbl_gerencia`;
CREATE TABLE IF NOT EXISTS `tbl_gerencia` (
  `id_gerencia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(75) NOT NULL,
  `descripcion` varchar(150) DEFAULT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_gerencia`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_gerencia`
--

INSERT INTO `tbl_gerencia` (`id_gerencia`, `nombre`, `descripcion`, `disponibilidad`) VALUES
(1, 'Gerencia de Administrac', 'Gerencia Responsable de la Admini Municipal', 1),
(2, 'Gerencia de Servicios Publicos', 'Gerencia encargada de los servicios públicos', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

DROP TABLE IF EXISTS `tbl_inventario`;
CREATE TABLE IF NOT EXISTS `tbl_inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `id_bienes` int(11) NOT NULL,
  `inventario` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_inventario`),
  KEY `fk_inventario_bienes_idx` (`id_bienes`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_inventario`
--

INSERT INTO `tbl_inventario` (`id_inventario`, `id_bienes`, `inventario`, `fecha`, `estado`, `disponibilidad`) VALUES
(1, 1, '2018', '2020-09-27', 'ubicado', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_personal`
--

DROP TABLE IF EXISTS `tbl_personal`;
CREATE TABLE IF NOT EXISTS `tbl_personal` (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `id_area` int(11) NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `cargo` varchar(60) NOT NULL,
  `t_documento` varchar(5) NOT NULL,
  `n_documento` varchar(11) NOT NULL,
  `edad` int(11) DEFAULT NULL,
  `sexo` varchar(10) NOT NULL,
  `est_civil` varchar(10) DEFAULT NULL,
  `celular` varchar(15) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_personal`),
  KEY `fk_area_idx` (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_personal`
--

INSERT INTO `tbl_personal` (`id_personal`, `id_area`, `nombre`, `cargo`, `t_documento`, `n_documento`, `edad`, `sexo`, `est_civil`, `celular`, `direccion`, `correo`, `disponibilidad`) VALUES
(1, 1, 'Branco Churampi Rosales', 'gerente', 'DNI', '47839405', 27, 'masculino', 'soltero', '4444', 'Av. Circunvalación S/N', 'branco_937@hotmail.com', 1),
(2, 1, 'Aminoclorito Ramirez', 'gerente', 'DNI', '12345678', 25, 'masculino', 'soltero', '96464', 'Av. Circunvalación S/N', 'la@hotmail.com', 1),
(3, 1, 'Analgésicos Rosales', 'gerente', 'DNI', '12345678', 25, 'masculino', 'soltero', '964647537', 'Av. Circunvalación S/N', 'sdfg', 1),
(4, 1, 'Karoline Churampi', 'gerente', 'DNI', '12345678', 24, 'masculino', 'soltero', '964758954', 'Av. Circunvalación S/N', 'la@hotmail.com', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

DROP TABLE IF EXISTS `tbl_usuario`;
CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `contrasena` varchar(45) NOT NULL,
  `documento` varchar(5) NOT NULL,
  `n_documento` varchar(11) NOT NULL,
  `correo` varchar(45) NOT NULL,
  `celular` varchar(9) DEFAULT NULL,
  `direccion` varchar(50) NOT NULL,
  `cargo` varchar(45) NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `nombre`, `usuario`, `contrasena`, `documento`, `n_documento`, `correo`, `celular`, `direccion`, `cargo`, `disponibilidad`) VALUES
(1, 'Branco Churampi Rosales', 'branco', '123456', 'DNI', '47839405', 'branco_937@hotmail.com', '964647537', 'Av. Circunvalación S/N', 'administrador', 1),
(2, 'Karoline Churampi', 'rocio', 'fgbdfgh', 'DNI', '47859452', 'sdfg', '964758954', 'Av. Los Girasoles N° 135 - Satipo', 'administrador', 0),
(3, 'Toto', 'EDIMBALG', 'asdf', 'DNI', '123456789', 'la@hotmail.com', '964758954', 'Av. Circunvalación S/N', 'asistente', 1);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD CONSTRAINT `fk_area_gerencia` FOREIGN KEY (`id_gerencia`) REFERENCES `tbl_gerencia` (`id_gerencia`);

--
-- Filtros para la tabla `tbl_asignacion`
--
ALTER TABLE `tbl_asignacion`
  ADD CONSTRAINT `fk_asignacion_area` FOREIGN KEY (`id_area`) REFERENCES `tbl_area` (`id_area`),
  ADD CONSTRAINT `fk_asignacion_inventario` FOREIGN KEY (`id_inventario`) REFERENCES `tbl_inventario` (`id_inventario`),
  ADD CONSTRAINT `fk_asignacion_personal` FOREIGN KEY (`id_personal`) REFERENCES `tbl_personal` (`id_personal`),
  ADD CONSTRAINT `fk_asignacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Filtros para la tabla `tbl_bienes`
--
ALTER TABLE `tbl_bienes`
  ADD CONSTRAINT `fk_bienes_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`);

--
-- Filtros para la tabla `tbl_inventario`
--
ALTER TABLE `tbl_inventario`
  ADD CONSTRAINT `fk_inventario_bienes` FOREIGN KEY (`id_bienes`) REFERENCES `tbl_bienes` (`id_bienes`);

--
-- Filtros para la tabla `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD CONSTRAINT `fk_personal_area` FOREIGN KEY (`id_area`) REFERENCES `tbl_area` (`id_area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
