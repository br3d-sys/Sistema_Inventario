-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 22-10-2020 a las 01:43:43
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

DROP PROCEDURE IF EXISTS `SP_B_Tabla_Area`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_B_Tabla_Area` (IN `_nombre` VARCHAR(75), IN `_id_gerencia` INT)  BEGIN
IF EXISTS (SELECT * FROM tbl_area) THEN
SELECT tbl_area.id_area, tbl_area.id_gerencia, tbl_gerencia.nombre as "gerencia", tbl_area.nombre,tbl_area.ubicacion, tbl_area.descripcion FROM tbl_area INNER JOIN tbl_gerencia ON tbl_area.id_gerencia = tbl_gerencia.id_gerencia WHERE tbl_area.nombre LIKE CONCAT("%",_nombre,"%") AND tbl_area.id_gerencia LIKE CONCAT("%",_id_gerencia,"%") AND tbl_area.disponibilidad > 0;
END IF;
end$$

DROP PROCEDURE IF EXISTS `SP_B_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_B_Tabla_Bienes` (IN `_nombre` VARCHAR(50), IN `_codigo` VARCHAR(9), IN `_id_categoria` INT)  BEGIN
    IF EXISTS(SELECT * FROM tbl_bienes)THEN
	SELECT tbl_bienes.id_bienes, tbl_bienes.id_categoria, tbl_categoria.nombre as "categoria", tbl_bienes.nombre, tbl_bienes.descripcion, tbl_bienes.codigo,
    tbl_bienes.precio, tbl_bienes.imagen, tbl_bienes.estado, tbl_bienes.fecha_ing, tbl_bienes.marca, tbl_bienes.color, tbl_bienes.modelo, tbl_bienes.alto,
    tbl_bienes.ancho, tbl_bienes.profundidad FROM tbl_bienes INNER JOIN tbl_categoria ON tbl_bienes.id_categoria = tbl_categoria.id_categoria WHERE tbl_bienes.nombre LIKE CONCAT('%',_nombre,'%') and tbl_bienes.codigo LIKE CONCAT('%',_codigo,'%') and tbl_bienes.id_categoria LIKE CONCAT('%',_id_categoria,'%') and tbl_bienes.disponibilidad>0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_B_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_B_Tabla_Categoria` (IN `_nombre` VARCHAR(45))  BEGIN
IF EXISTS(SELECT * FROM tbl_categoria) THEN
SELECT id_categoria, nombre, descripcion from tbl_categoria WHERE nombre LIKE CONCAT("%",_nombre,"%") AND disponibilidad >0;
END IF;
end$$

DROP PROCEDURE IF EXISTS `SP_B_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_B_Tabla_Gerencia` (IN `_nombre` VARCHAR(75))  BEGIN
IF EXISTS(SELECT * FROM tbl_gerencia) THEN
SELECT id_gerencia, nombre, descripcion from tbl_gerencia WHERE nombre LIKE CONCAT("%",_nombre,"%") AND disponibilidad >0;
END IF;
end$$

DROP PROCEDURE IF EXISTS `SP_B_Tabla_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_B_Tabla_Personal` (IN `_nombre` VARCHAR(80), IN `_id_gerencia` INT, IN `_id_area` INT)  BEGIN 
IF EXISTS(SELECT * FROM tbl_personal) THEN
	SELECT tbl_personal.id_personal, tbl_personal.id_area, tbl_area.nombre as "area", tbl_gerencia.id_gerencia, tbl_gerencia.nombre as 	"gerencia",tbl_personal.nombre, tbl_personal.cargo, tbl_personal.t_documento, tbl_personal.n_documento,tbl_personal.edad, tbl_personal.sexo, tbl_personal.est_civil, tbl_personal.celular,tbl_personal.direccion, tbl_personal.correo FROM tbl_personal INNER JOIN tbl_area on tbl_personal.id_area = tbl_area.id_area INNER JOIN tbl_gerencia on tbl_area.id_gerencia = tbl_gerencia.id_gerencia where tbl_personal.id_area LIKE CONCAT('%',_id_area,'%') and tbl_gerencia.id_gerencia LIKE CONCAT('%',_id_gerencia,'%') and tbl_personal.nombre LIKE CONCAT('%',_nombre,'%') and tbl_personal.disponibilidad >0; 
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_B_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_B_Tabla_Usuario` (IN `_nombre` VARCHAR(80), IN `_n_documento` VARCHAR(11))  BEGIN
IF EXISTS (SELECT * FROM tbl_usuario) THEN
 SELECT id_usuario, nombre,
 documento,n_documento,correo,
 celular,direccion,cargo from tbl_usuario where nombre LIKE CONCAT('%',_nombre,'%') and n_documento LIKE CONCAT('%',_n_documento,'%') and disponibilidad>0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Area`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Area` (IN `_id_gerencia` INT, IN `_nombre` VARCHAR(75), IN `_ubicacion` VARCHAR(75), IN `_descripcion` VARCHAR(150))  BEGIN
INSERT into tbl_area(id_gerencia,nombre,ubicacion,descripcion) VALUES(_id_gerencia,_nombre,_ubicacion,_descripcion);
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Asignacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Asignacion` (IN `_id_usuario` INT, IN `_id_encontrado` INT, IN `_id_personal` INT, IN `_id_area` INT, IN `_fecha` DATE)  BEGIN
    INSERT INTO tbl_asignacion(id_usuario, id_encontrado, id_personal, id_area, fecha) VALUES(_id_usuario, _id_encontrado, _id_personal, _id_area, _fecha);
    END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Bienes` (IN `_id_categoria` INT, IN `_nombre` VARCHAR(50), IN `_descripcion` VARCHAR(200), IN `_codigo` VARCHAR(9), IN `_precio` DOUBLE(11,2), IN `_imagen` VARCHAR(200), IN `_estado` VARCHAR(45), IN `_fecha_ing` DATE, IN `_marca` VARCHAR(45), IN `_color` VARCHAR(45), IN `_modelo` INT(11), IN `_alto` INT(11), IN `_ancho` INT(11), IN `_profundidad` VARCHAR(45), IN `_serie` VARCHAR(20))  BEGIN
INSERT INTO tbl_bienes(id_categoria,nombre,serie,descripcion,codigo,precio,imagen,estado,fecha_ing,marca,color,modelo,alto,ancho,profundidad)
VALUES(_id_categoria,_nombre,_serie,_descripcion,_codigo,_precio,_imagen,_estado,_fecha_ing,_marca,_color,_modelo,_alto,_ancho,_profundidad);
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Categoria` (IN `_nombre` VARCHAR(45), IN `_descripcion` VARCHAR(200))  BEGIN
INSERT into tbl_categoria(nombre, descripcion) VALUES(_nombre,_descripcion);
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Encontrado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Encontrado` (IN `_id_bienes` INT, IN `_id_inventario` INT, IN `_fecha` DATE, IN `_estado` VARCHAR(45), IN `_imagen` LONGBLOB)  BEGIN
    INSERT INTO tbl_encontrado(id_bienes,id_inventario,fecha,estado,imagen) values(_id_bienes,_id_inventario,_fecha,_estado,_imagen);
    END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Gerencia` (IN `_nombre` VARCHAR(75), IN `_descripcion` VARCHAR(150))  BEGIN
    INSERT INTO tbl_gerencia(nombre,descripcion) VALUES(_nombre,_descripcion);
    END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Inventario` (IN `_nombre` VARCHAR(45), IN `_fecha_ini` DATE, IN `_fecha_fin` DATE)  BEGIN
    INSERT INTO tbl_inventario(nombre,fecha_ini,fecha_fin) values(_nombre,_fecha_ini,_fecha_fin);
    END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Personal` (IN `_id_area` INT, IN `_nombre` VARCHAR(80), IN `_cargo` VARCHAR(60), IN `_t_documento` VARCHAR(5), IN `_n_documento` VARCHAR(11), IN `_edad` INT, IN `_sexo` VARCHAR(10), IN `_est_civil` VARCHAR(10), IN `_celular` VARCHAR(15), IN `_direccion` VARCHAR(45), IN `_correo` VARCHAR(45))  BEGIN
INSERT INTO tbl_personal(id_area, nombre, cargo, t_documento,n_documento,edad,sexo,est_civil,celular,direccion,correo) VALUES(_id_area, _nombre, _cargo, _t_documento,_n_documento,_edad,_sexo,_est_civil,_celular,_direccion,_correo);
END$$

DROP PROCEDURE IF EXISTS `SP_C_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Usuario` (IN `_nombre` VARCHAR(80), IN `_contrasena` VARCHAR(45), IN `_documento` VARCHAR(5), IN `_n_documento` VARCHAR(11), IN `_correo` VARCHAR(45), IN `_celular` VARCHAR(9), IN `_direccion` VARCHAR(50), IN `_cargo` VARCHAR(45))  BEGIN
INSERT INTO tbl_usuario(nombre,contrasena,documento,n_documento,correo,celular,direccion,cargo) VALUES(_nombre, _contrasena, _documento, _n_documento, _correo, _celular, _direccion, _cargo);
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

DROP PROCEDURE IF EXISTS `SP_D_Tabla_Encontrado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_D_Tabla_Encontrado` (IN `_id_encontrado` INT)  BEGIN
    UPDATE tbl_encontrado SET disponibilidad = 0 WHERE id_encontrado = _id_encontrado;
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

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Area`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Area` (IN `_id_area` INT)  BEGIN 
IF EXISTS (SELECT * FROM tbl_area) THEN
    SELECT tbl_area.id_area, tbl_area.id_gerencia, tbl_gerencia.nombre as "gerencia", tbl_area.nombre,tbl_area.ubicacion, tbl_area.descripcion FROM tbl_area 	INNER JOIN tbl_gerencia ON tbl_area.id_gerencia = tbl_gerencia.id_gerencia WHERE tbl_area.id_area = _id_area AND tbl_area.disponibilidad > 0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Bienes` (IN `_id_bienes` INT)  BEGIN
IF EXISTS(SELECT * FROM tbl_bienes)THEN
	SELECT tbl_bienes.id_bienes, tbl_bienes.id_categoria, tbl_categoria.nombre as "categoria", tbl_bienes.nombre,tbl_bienes.serie, tbl_bienes.descripcion, tbl_bienes.codigo,
    tbl_bienes.precio, tbl_bienes.imagen, tbl_bienes.estado, tbl_bienes.fecha_ing, tbl_bienes.marca, tbl_bienes.color, tbl_bienes.modelo, tbl_bienes.alto,
    tbl_bienes.ancho, tbl_bienes.profundidad FROM tbl_bienes INNER JOIN tbl_categoria ON tbl_bienes.id_categoria = tbl_categoria.id_categoria WHERE tbl_bienes.id_bienes = _id_bienes;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Categoria` (IN `_id_categoria` INT)  BEGIN
SELECT id_categoria,nombre,descripcion FROM tbl_categoria WHERE id_categoria = _id_categoria;
END$$

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Encontrado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Encontrado` (IN `_id_encontrado` INT)  BEGIN
IF EXISTS(SELECT * FROM tbl_encontrado)THEN
	SELECT tbl_encontrado.id_encontrado,tbl_encontrado.id_inventario,tbl_inventario.nombre as "inventario", tbl_encontrado.id_bienes, tbl_bienes.nombre as "bien",tbl_bienes.codigo, tbl_encontrado.fecha, tbl_encontrado.estado, tbl_encontrado.imagen from tbl_encontrado INNER JOIN tbl_bienes on tbl_encontrado.id_bienes = tbl_bienes.id_bienes INNER JOIN tbl_inventario ON tbl_encontrado.id_inventario = tbl_inventario.id_inventario WHERE tbl_encontrado.id_encontrado = _id_encontrado AND tbl_encontrado.disponibilidad >0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Gerencia` (IN `_id_gerencia` INT)  BEGIN
SELECT id_gerencia,nombre,descripcion FROM tbl_gerencia WHERE id_gerencia = _id_gerencia;
END$$

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Inventario` (IN `_id_inventario` INT)  BEGIN
    IF EXISTS(SELECT * FROM tbl_inventario)THEN
    	SELECT id_inventario, nombre, fecha_ini, fecha_fin from tbl_inventario WHERE id_inventario = _id_inventario AND disponibilidad >0;
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
    	SELECT id_usuario, nombre,contrasena, documento,n_documento,correo,celular,direccion,cargo FROM tbl_usuario WHERE id_usuario = _id_usuario;
    END IF;
    END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Area`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Area` ()  BEGIN
IF EXISTS (SELECT * FROM tbl_area) THEN
SELECT tbl_area.id_area, tbl_area.id_gerencia, tbl_gerencia.nombre as "gerencia", tbl_area.nombre,tbl_area.ubicacion, tbl_area.descripcion FROM tbl_area INNER JOIN tbl_gerencia ON tbl_area.id_gerencia = tbl_gerencia.id_gerencia WHERE tbl_area.disponibilidad > 0;
END IF;
end$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Asignacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Asignacion` ()  BEGIN
IF EXISTS (SELECT * from tbl_asignacion)THEN
	SELECT tbl_asignacion.id_asignacion, tbl_asignacion.id_usuario, tbl_asignacion.id_encontrado, tbl_encontrado.id_inventario,tbl_encontrado.id_bienes, tbl_bienes.nombre,tbl_bienes.codigo, tbl_inventario.nombre as "inventario",tbl_asignacion.id_personal, tbl_personal.nombre as "personal", tbl_asignacion.id_area, tbl_area.nombre as "area", tbl_area.id_gerencia, tbl_gerencia.nombre as "gerencia", tbl_asignacion.fecha FROM tbl_asignacion INNER JOIN tbl_encontrado ON tbl_asignacion.id_encontrado = tbl_encontrado.id_encontrado INNER JOIN tbl_personal ON tbl_asignacion.id_personal = tbl_personal.id_personal INNER JOIN tbl_area ON tbl_asignacion.id_area = tbl_area.id_area INNER JOIN tbl_gerencia ON tbl_area.id_gerencia = tbl_gerencia.id_gerencia INNER JOIN tbl_bienes ON tbl_encontrado.id_bienes = tbl_bienes.id_bienes INNER JOIN tbl_inventario ON tbl_encontrado.id_inventario = tbl_inventario.id_inventario WHERE tbl_asignacion.disponibilidad>0;
    END IF;
    END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Bienes`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Bienes` ()  BEGIN
IF EXISTS(SELECT * FROM tbl_bienes)THEN
	SELECT tbl_bienes.id_bienes, tbl_bienes.id_categoria, tbl_categoria.nombre as "categoria", tbl_bienes.nombre,tbl_bienes.serie, tbl_bienes.descripcion, tbl_bienes.codigo,
    tbl_bienes.precio, tbl_bienes.imagen, tbl_bienes.estado, tbl_bienes.fecha_ing, tbl_bienes.marca, tbl_bienes.color, tbl_bienes.modelo, tbl_bienes.alto,
    tbl_bienes.ancho, tbl_bienes.profundidad FROM tbl_bienes INNER JOIN tbl_categoria ON tbl_bienes.id_categoria = tbl_categoria.id_categoria WHERE tbl_bienes.disponibilidad > 0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Categoria` ()  BEGIN
IF EXISTS(SELECT * FROM tbl_categoria) THEN
SELECT id_categoria, nombre, descripcion from tbl_categoria WHERE disponibilidad >0;
END IF;
end$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Encontrado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Encontrado` ()  BEGIN
IF EXISTS(SELECT * FROM tbl_encontrado)THEN
	SELECT tbl_encontrado.id_encontrado,tbl_encontrado.id_inventario,tbl_inventario.nombre as "inventario", tbl_encontrado.id_bienes, tbl_bienes.nombre as "bien",tbl_bienes.codigo, tbl_encontrado.fecha, tbl_encontrado.estado, tbl_encontrado.imagen from tbl_encontrado INNER JOIN tbl_bienes on tbl_encontrado.id_bienes = tbl_bienes.id_bienes INNER JOIN tbl_inventario ON tbl_encontrado.id_inventario = tbl_inventario.id_inventario WHERE tbl_encontrado.disponibilidad >0;
END IF;
END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Gerencia` ()  BEGIN 
  IF EXISTS (SELECT * from tbl_gerencia) THEN
  	SELECT id_gerencia, nombre, descripcion, disponibilidad FROM tbl_gerencia WHERE disponibilidad>0;
  END IF;
  END$$

DROP PROCEDURE IF EXISTS `SP_R_Tabla_Inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_R_Tabla_Inventario` ()  BEGIN
IF EXISTS(SELECT * FROM tbl_inventario)THEN
	SELECT id_inventario, nombre, fecha_ini, fecha_fin from tbl_inventario WHERE disponibilidad >0;
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
 SELECT id_usuario, nombre,
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Bienes` (IN `_id_bienes` INT, IN `_id_categoria` INT, IN `_nombre` VARCHAR(50), IN `_descripcion` VARCHAR(200), IN `_codigo` VARCHAR(9), IN `_precio` DOUBLE(11,2), IN `_imagen` VARCHAR(200), IN `_estado` VARCHAR(45), IN `_fecha_ing` DATE, IN `_marca` VARCHAR(45), IN `_color` VARCHAR(45), IN `_modelo` VARCHAR(45), IN `_alto` INT(11), IN `_ancho` INT(11), IN `_profundidad` INT(11), IN `_serie` VARCHAR(20))  BEGIN
UPDATE tbl_bienes SET id_categoria = _id_categoria, nombre = _nombre,serie=_serie, descripcion = _descripcion, codigo = _codigo, precio = _precio, imagen = _imagen,
estado = _estado, fecha_ing = _fecha_ing, marca = _marca, color = _color, modelo = _modelo, alto = _alto, ancho = _ancho, profundidad = _profundidad WHERE id_bienes = _id_bienes;
END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Categoria`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Categoria` (IN `_id_categoria` INT, IN `_nombre` VARCHAR(45), IN `_descripcion` VARCHAR(200))  BEGIN
UPDATE tbl_categoria SET nombre = _nombre, descripcion = _descripcion WHERE id_categoria = _id_categoria;
END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Encontrado`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Encontrado` (IN `_id_encontrado` INT, IN `_id_bienes` INT, IN `_id_inventario` INT, IN `_fecha` DATE, IN `_estado` VARCHAR(45), IN `_imagen` LONGBLOB)  BEGIN
    UPDATE tbl_encontrado SET id_bienes = _id_bienes, id_inventario = _id_inventario, fecha=_fecha, estado = _estado , imagen = _imagen WHERE id_encontrado = _id_encontrado;
    END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Gerencia`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Gerencia` (IN `_id_gerencia` INT, IN `_nombre` VARCHAR(75), IN `_descripcion` VARCHAR(150), IN `_disponibilidad` TINYINT(1))  BEGIN
    UPDATE tbl_gerencia SET nombre = _nombre, descripcion = _descripcion WHERE id_gerencia = _id_gerencia;
    END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Inventario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Inventario` (IN `_id_inventario` INT, IN `_nombre` VARCHAR(45), IN `_fecha_ini` DATE, IN `_fecha_fin` DATE)  BEGIN
    UPDATE tbl_inventario SET nombre=_nombre, fecha_ini = _fecha_ini, fecha_fin = _fecha_fin WHERE id_inventario = _id_inventario;
    END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Personal`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Personal` (IN `_id_personal` INT, IN `_id_area` INT, IN `_nombre` VARCHAR(80), IN `_cargo` VARCHAR(60), IN `_t_documento` VARCHAR(5), IN `_n_documento` VARCHAR(11), IN `_edad` INT, IN `_sexo` VARCHAR(10), IN `_est_civil` VARCHAR(10), IN `_celular` VARCHAR(15), IN `_direccion` VARCHAR(45), IN `_correo` VARCHAR(45))  BEGIN 
UPDATE tbl_personal SET id_area = _id_area, nombre = _nombre, cargo = _cargo, t_documento = _t_documento, n_documento= _n_documento, edad = _edad, est_civil = _est_civil, celular = _celular, direccion = _direccion, correo = _correo WHERE id_personal = _id_personal;
END$$

DROP PROCEDURE IF EXISTS `SP_U_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Usuario` (IN `_id_usuario` INT, IN `_nombre` VARCHAR(80), IN `_contrasena` VARCHAR(45), IN `_documento` VARCHAR(5), IN `_n_documento` VARCHAR(11), IN `_correo` VARCHAR(45), IN `_celular` VARCHAR(9), IN `_direccion` VARCHAR(50), IN `_cargo` VARCHAR(45))  BEGIN
UPDATE tbl_usuario SET nombre=_nombre,contrasena=_contrasena,
documento=_documento,n_documento=_n_documento,correo=_correo,celular=_celular,
direccion=_direccion,cargo=_cargo WHERE id_usuario = _id_usuario;
END$$

DROP PROCEDURE IF EXISTS `SP_V_Tabla_Usuario`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_V_Tabla_Usuario` (IN `_correo` VARCHAR(45), IN `_contrasena` VARCHAR(45))  BEGIN
IF EXISTS (SELECT * FROM tbl_usuario) THEN
 SELECT * FROM tbl_usuario WHERE correo=_correo and 
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_area`
--

INSERT INTO `tbl_area` (`id_area`, `id_gerencia`, `nombre`, `ubicacion`, `descripcion`, `disponibilidad`) VALUES
(1, 1, 'Sub Gerencia de Patrimonio', 'Segundo Piso', 'Oficina de control Patrimonial', 1),
(2, 1, 'Aminoclorito', 'Segundo Piso', 'utiles', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_asignacion`
--

DROP TABLE IF EXISTS `tbl_asignacion`;
CREATE TABLE IF NOT EXISTS `tbl_asignacion` (
  `id_asignacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_encontrado` int(11) NOT NULL,
  `id_personal` int(11) DEFAULT NULL,
  `id_area` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_asignacion`),
  KEY `fk_t_com_usuario_idx` (`id_usuario`),
  KEY `fk_asignacion_inventario_idx` (`id_encontrado`),
  KEY `fk_asignacion_personal_idx` (`id_personal`),
  KEY `fk_asignacion_area_idx` (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_bienes`
--

DROP TABLE IF EXISTS `tbl_bienes`;
CREATE TABLE IF NOT EXISTS `tbl_bienes` (
  `id_bienes` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `serie` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_bienes`
--

INSERT INTO `tbl_bienes` (`id_bienes`, `id_categoria`, `nombre`, `serie`, `descripcion`, `codigo`, `precio`, `imagen`, `estado`, `fecha_ing`, `marca`, `color`, `modelo`, `alto`, `ancho`, `profundidad`, `disponibilidad`) VALUES
(1, 1, 'Mesa de Madera', '123456789', 'Mesa', '12345678', 15.00, '123456', 'Nuevo', '2020-10-14', 'No especifica', 'Cedro', 'Normal', '1', '1', '1', 1);

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
(1, 'Muebles', 'Todo Bien hecho de madera', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_encontrado`
--

DROP TABLE IF EXISTS `tbl_encontrado`;
CREATE TABLE IF NOT EXISTS `tbl_encontrado` (
  `id_encontrado` int(11) NOT NULL AUTO_INCREMENT,
  `id_bienes` int(11) NOT NULL,
  `id_inventario` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(45) NOT NULL,
  `imagen` longblob,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_encontrado`),
  KEY `fk_inventario_bienes_idx` (`id_bienes`),
  KEY `fk_encontrado_inventario_idx` (`id_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_encontrado`
--

INSERT INTO `tbl_encontrado` (`id_encontrado`, `id_bienes`, `id_inventario`, `fecha`, `estado`, `imagen`, `disponibilidad`) VALUES
(1, 1, 2, '2020-10-21', 'Recuperado', 0xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108007000c803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f7fa28a2800a28a8a7b886da3324f2a4683ab31c0a00968ae62efc696484ada46f3e0e37636afe1508f1b478e6d0e7fdff00feb5572b3275e9a76b9d6d15cdc3e2eb794e3ecd2e3d4115717c4566472241f80ace538c5d9b37a709545782ba3628acb1afd89fe361ff0001a9e1d52d6e1b6c52163fee9a4aa45ecca952a9157699768a60953fbd4be62ff787e756663a8a4dcbea28cd002d1499a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00f2df167c56161a85d693a5b5ac3750398de6bddf80c3d02839fa935e74752d5f54d505e6a7e21b3bb2bc85fb4e157e8a700553f89766b07c4ed495c1f2e49524207a32826b0ce9f165b7496eaa01e559c1fc8d6a9238aa4e4ee99e8d05e4cf8d9342f9fee4e87f91ad4850a8dd29673edc8af1cd3722fe1ebf7abb4d3addaf2f62b71218c31e5b3d00e4fe35e4e6189ab09aa70ea7d470fe5187c4509626a3d62faaf2b9dda6a7127cbf20c762315721d5ccaeb146b1bb1e155464d71da9691369d04b22de4c648db953c0dbbca8e73d78fd6a0d0ef2e06af06667ea4727dabc9a95ea51bb91f45f50a35693a94ddd23d4ecb4591f125d6501e4460f3f89ad948445184440aa3a015c6adfde28e2e1ff3a946af7cbd276fceb3a59f61e0ace9bfbcf9baf81c45577735e875c564c60647d2946f0a7ef13db9eb5ca8d76fd7fe5a83f502a45f115e8ebb0ffc06ba639fe13aa92febd4e5796622dd0e8435de3e651d7b37ff005a944b77803cae78c9dc315803c4d723ef4319fcea55f1437f15b0fc1aba239e605f56be4ccde5b895d3f2379a79524c6c9187aa8ffebd245a879b26c02656ff006948ac51e288bf8add87d1aa45f13599fbc928fc056f1cdf04f69fe666f01895f64dff003a4fef1a3ed320fe2fd2b157c43a79eaeebf55a906b5a7b74b903ea0d6f1cc30b2daa2fbccde1abc778bfb8d6fb6483d3f2a3edce3b03594da9da146f2ae212f8f9433e066ab0bfb969982c76ed16de184c324fa62b68d7a52f8649fccca50a91dd336e5d504113cb2280a8a598e7a015674ebd8f51d3adef62ff573c6245fa119ae1fc5d3bcfa62e9b6e489af0ec2c3a227f11aed347b74b5d1acede31848a14451ec0015519f349a411bf52ed14515a14145145001451450078afc4ef03ebbab78b8ea9a55a09a36850122450c1978e84fd2b8a9742f18da8713e9372c1bef1f20383c63b57d19ac37976e653bbe5c13b4e0f5ace4be68aea78e65768c4830e00c2820633594f190a525097f5bff00911f56954bca3fd7f573e698f4bbfb5bb8ccf6571161c643c4477aec2da6b18e354b8d3f7b0eae2420d7b87daadceedc7a49e51c8fe2a89a3d2ae25f2648ad5e4ce36b202735cb8b842bc9494d27b1ec6538f781a72a738369bbe8da3c80dfe9f2c661963bc1096dc544db813ebcf7a86cfecabacdb9b53218cb01fbcc641fc2bd764f0e68570486d3ed4919ced503f95539bc23e1eb61f6a36a63119dd9476e3f5af3ebe5d5254dfbd1fc8f62967d8549c5464afd3739fa5c57509a058cf12c9134caac3233ff00d714c6f0c47fc172df8ad782f21c65af149fcce3fed2c3decdb5f239ae292b7dfc31363e4b843f504540fe1bbd5e8636fa35612ca31b1de9bfccd638ec3bfb463119a4c569b687a827fcb0cfd18540fa6dea7deb6947fc0735cf2c26221f141fdccda388a4f692fbca245348ab0d6f2a67744ebf5535115c75ac5a71dd1b2927b32222a48e658e364312b67b9ea2908a6115509b8bba1ca2a4acc9bcfb72a435bf241e47e355a57889f9015181d7d6908a630ad1d47256611a514f41da649236baaa18954818907a7247f857addb0db6b12fa20fe55e55a526ed4188f451fad7ac46308a3d057dc6510e5c245f73e5b1d2e6c54fc87514515ea1ca145145001451450053d4205b8b76898901c15c8acab8d39dbcddb3aaa4aaaafb97d3bd6d5c83e51dbd7b561248e74e959a75964f2f718dc02548ebf8570e2d527a4d5dd9f96dff000e694dcd6b17fd7f482e2c6e77c82108d1bc89264b608231fe150489234d770470967332b8718c2743cd5b97509e3790aa46d1468b21ce7241f4a4b77946ab76c518aec0c0291c8c71c7ad70d48d09c9460deaecfd3dedbe77378caa28de56d17f910bd9becd499636f359be561dd78240a82448a582f23b7ddf675883819202b8adbb6bb4b82ebb191d31b95bb67e958faceb93da6ab1699656d6f2ccf119a56b89bcb455ce00e9c926b7580a75637a72d35e9ebfe7afa193c4ca0fde5dbf4ff22495a7492da085e5da61de30e0127ea7afd2a533debcb6b10758de48c96f943722abea9aac56b6d6115ce9af3de5d1c476b090c410327e6e06053e0d63493a59d4df75ac7664c5224830d13742a40efd2afea55949da5a3b75f4ff0083d45f58a6d6ab5d4963d46792ded9512333cacca49e17e5ea6aed95c9b98df7a85923628e01e322b334d9f4cd5adcae9f72e2481cbfcca55d0b7aa903835ab69662d6371bd9d9d8b331ee6af0f0c546a2f68eeadafddf7dee2a92a2e2f93fafe913628c7b53b1495e89cc34a8f4a8dede17fbd1237d541a9a92a5c53dd0d36b6293e9764fd6d62fc171555f41d39ffe5863e8c6b5a908ac6583c3cbe282fb91a4711563b49fde60bf862c5bee9957e8d55a4f09c27ee5cb8faa835d2d34d734b29c1cbfe5da368e3f131da6ce36c2c3ec7aec96dbbccc3a7cd8c7bd7a20e95c4d92eff155c31ef3003f0515db035d3429c69c3923b2307394e4e72dd8b451456c30a28a2800a28a280192f319acb3b43beeb4fbc30cca3a8ad490e10d66b6a56c8e52466423fbc871f9d1ca9ee88936b620ff0043915815750e9e5f43f769c21b795a4d9390cf188bafeb56a3b9b59b849a27f60c29ff006784b06f2d739ce40acde1e93fb20aa4d752958d835b4ccfbe32ac81708b8e9deb23c41a119f5983555d3a3d455606825b67201c1390cb9e32391f8d741f618b2c50b231eea69a2ca452365cc817d29d1a30a31e486c2a92751de471f0697a969967a1ea1716f248f612ca24850ef7485f20018fbc578aa3796f717fa7ebba8c56d38b56be82e111e32acea98de769e7ff00d55dfa47768083223fcbc6477a04972377990a95009183d6b6b99f22399b6bdb5bef88104da74c9346da7b79ed19c81f37cb9f7ad0f136a57fa7be991d8344b25d5d080995490320fa55d86486d9d9a3d3fc9dc7e7644033efff00eba2ed34ed467b65b8c9782612c5c91871d295cab3398ff84b359b4b7bd96e6d2ce58b4fba16f70e8ecacf92065579c751d4d6a6a1e2e4b1bdbc8869f3cd0d8a2bdccaaca3606191804e4d177a16997965a95b2dccb17dbe613c8dd70c08e9c7a8ae735fd36e1fc417d793d9f9f0f9718b7492092549801d014fbbcf620d568c9d51e81693fdaad22b8f2da3f31436c6c6467e952e2a0d3a5927d36da59adcdb48f1a9684ff01c74fc2ac9a92c61a4a71a43400c229a6a434c3ef401c82ddf9379773a1e5646fe78ab90f89645fbd584d2058a624e3cc918fe6c4d4359537745c558ed20f1246e406ef5b96d389e30e2b81d2ac9ae6e178e01aefad6110c4aa3b0ab289e8a28a0028a28a00423350bda4527de406a7a2803365d1ada4eb18fcaabff006318b9826923ff007588adaa280314dbea517dcb8de3d1d41a4fb56a317df82393e9915b749b41ed401909aae389ada54fa722a65d52cdbacbb7fde522af3428dd54542f6103f54140b95024f049f72546fa30a5312120ed5241c838aab268d6effc20543fd90f1ffaa9e44fa31a05ca5c6b484823cb033dc7d735247188d150670a30327359de46a717dcb92c3fda50693ed5a947f7e18dfe9914c5cacd3c566eb17d3594502db2234d7132c29e613b549cf271f4a41abbaffadb3907fba41a8eeaf34dd42030dd2b852723729054fa823a1a89a6e2d4772e972c669cd5d11477b7f637d6f6ba979332dc92b1cd08dbb580ce0a9edc75abe97d049b4abf0dd091818c673cf6aceb4b1b137515c4da9cb772439f284d20c2718e9c64e3b9abc74db6922118772814aa80d900118c0ace9fb44b536aae8b6bf1b2b2fbbee241796ec630b2ab798484da739c75a5b8758eda5918e1510b13f41556e348491e49124d8cc1f69dbf74b00323f2fd6aaded9c96be1ed4a159412f149e59c602e5703f5ad14a5f6918ca30b5e2f53caeef5a17d32496cdfb832054e31900727f5ae92d11a60800c935c6e9760cd750db20cac236e4773dcd7ace81a39015dd7a74a9a4ef0bf72a51e57635b44d3c5bc2188e4d6d5351422803b53ab42428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a003149b41ed4b450046d0a37551513d8c0fd50559a2803324d1ad9ff00805566d0554e627643fec9c56e51401cfb69fa8c5feaaf24ff00811cff003aa97706b13db496ef246cae304ecc1aeae9303d280b1c6e89e118ecdc3baf3d6baf8a258902a8c629f814b4005145140051451401ffd9, 1);

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
(1, 'Gerencia de Administración', 'Administración', 1),
(2, 'Gerencia de Administración Tributaria', 'Gerencia', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventario`
--

DROP TABLE IF EXISTS `tbl_inventario`;
CREATE TABLE IF NOT EXISTS `tbl_inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fecha_ini` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_inventario`
--

INSERT INTO `tbl_inventario` (`id_inventario`, `nombre`, `fecha_ini`, `fecha_fin`, `disponibilidad`) VALUES
(1, 's', '2020-10-07', '2020-10-14', 0),
(2, 's2', '2020-10-21', '2020-10-22', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_personal`
--

INSERT INTO `tbl_personal` (`id_personal`, `id_area`, `nombre`, `cargo`, `t_documento`, `n_documento`, `edad`, `sexo`, `est_civil`, `celular`, `direccion`, `correo`, `disponibilidad`) VALUES
(1, 1, 'Branco Churampi', 'Sub Gerente', 'DNI', '47839405', 25, 'Masculino', 'Soltero', '964647537', 'Av. Circunvalación S/N', 'branco_937@hotmail.com', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `nombre`, `usuario`, `contrasena`, `documento`, `n_documento`, `correo`, `celular`, `direccion`, `cargo`, `disponibilidad`) VALUES
(1, 'Branco Churampi', '', '123456', 'DNI', '47839405', 'branco_937@hotmail.com', '964647537', 'Av. Circunvalación S/N', 'Administrador', 1);

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
  ADD CONSTRAINT `fk_asignacion_encontrado` FOREIGN KEY (`id_encontrado`) REFERENCES `tbl_encontrado` (`id_encontrado`),
  ADD CONSTRAINT `fk_asignacion_personal` FOREIGN KEY (`id_personal`) REFERENCES `tbl_personal` (`id_personal`),
  ADD CONSTRAINT `fk_asignacion_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`);

--
-- Filtros para la tabla `tbl_bienes`
--
ALTER TABLE `tbl_bienes`
  ADD CONSTRAINT `fk_bienes_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`);

--
-- Filtros para la tabla `tbl_encontrado`
--
ALTER TABLE `tbl_encontrado`
  ADD CONSTRAINT `fk_encontrado_bienes` FOREIGN KEY (`id_bienes`) REFERENCES `tbl_bienes` (`id_bienes`),
  ADD CONSTRAINT `fk_encontrado_inventario` FOREIGN KEY (`id_inventario`) REFERENCES `tbl_inventario` (`id_inventario`);

--
-- Filtros para la tabla `tbl_personal`
--
ALTER TABLE `tbl_personal`
  ADD CONSTRAINT `fk_personal_area` FOREIGN KEY (`id_area`) REFERENCES `tbl_area` (`id_area`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
