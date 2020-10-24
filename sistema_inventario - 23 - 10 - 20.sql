-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 24-10-2020 a las 00:55:54
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
	SELECT tbl_bienes.id_bienes, tbl_bienes.id_categoria, tbl_categoria.nombre as "categoria", tbl_bienes.nombre, tbl_bienes.descripcion, tbl_bienes.codigo,tbl_bienes.serie,
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Gerencia` (IN `_id_gerencia` INT, IN `_nombre` VARCHAR(75), IN `_descripcion` VARCHAR(150))  BEGIN
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
(2, 1, 'Aminocl', 'Segundo Piso', 'utiles', 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_encontrado`
--

INSERT INTO `tbl_encontrado` (`id_encontrado`, `id_bienes`, `id_inventario`, `fecha`, `estado`, `imagen`, `disponibilidad`) VALUES
(1, 1, 2, '2020-10-21', 'Recuperado', 0xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108007000c803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f7fa28a2800a28a8a7b886da3324f2a4683ab31c0a00968ae62efc696484ada46f3e0e37636afe1508f1b478e6d0e7fdff00feb5572b3275e9a76b9d6d15cdc3e2eb794e3ecd2e3d4115717c4566472241f80ace538c5d9b37a709545782ba3628acb1afd89fe361ff0001a9e1d52d6e1b6c52163fee9a4aa45ecca952a9157699768a60953fbd4be62ff787e756663a8a4dcbea28cd002d1499a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00f2df167c56161a85d693a5b5ac3750398de6bddf80c3d02839fa935e74752d5f54d505e6a7e21b3bb2bc85fb4e157e8a700553f89766b07c4ed495c1f2e49524207a32826b0ce9f165b7496eaa01e559c1fc8d6a9238aa4e4ee99e8d05e4cf8d9342f9fee4e87f91ad4850a8dd29673edc8af1cd3722fe1ebf7abb4d3addaf2f62b71218c31e5b3d00e4fe35e4e6189ab09aa70ea7d470fe5187c4509626a3d62faaf2b9dda6a7127cbf20c762315721d5ccaeb146b1bb1e155464d71da9691369d04b22de4c648db953c0dbbca8e73d78fd6a0d0ef2e06af06667ea4727dabc9a95ea51bb91f45f50a35693a94ddd23d4ecb4591f125d6501e4460f3f89ad948445184440aa3a015c6adfde28e2e1ff3a946af7cbd276fceb3a59f61e0ace9bfbcf9baf81c45577735e875c564c60647d2946f0a7ef13db9eb5ca8d76fd7fe5a83f502a45f115e8ebb0ffc06ba639fe13aa92febd4e5796622dd0e8435de3e651d7b37ff005a944b77803cae78c9dc315803c4d723ef4319fcea55f1437f15b0fc1aba239e605f56be4ccde5b895d3f2379a79524c6c9187aa8ffebd245a879b26c02656ff006948ac51e288bf8add87d1aa45f13599fbc928fc056f1cdf04f69fe666f01895f64dff003a4fef1a3ed320fe2fd2b157c43a79eaeebf55a906b5a7b74b903ea0d6f1cc30b2daa2fbccde1abc778bfb8d6fb6483d3f2a3edce3b03594da9da146f2ae212f8f9433e066ab0bfb969982c76ed16de184c324fa62b68d7a52f8649fccca50a91dd336e5d504113cb2280a8a598e7a015674ebd8f51d3adef62ff573c6245fa119ae1fc5d3bcfa62e9b6e489af0ec2c3a227f11aed347b74b5d1acede31848a14451ec0015519f349a411bf52ed14515a14145145001451450078afc4ef03ebbab78b8ea9a55a09a36850122450c1978e84fd2b8a9742f18da8713e9372c1bef1f20383c63b57d19ac37976e653bbe5c13b4e0f5ace4be68aea78e65768c4830e00c2820633594f190a525097f5bff00911f56954bca3fd7f573e698f4bbfb5bb8ccf6571161c643c4477aec2da6b18e354b8d3f7b0eae2420d7b87daadceedc7a49e51c8fe2a89a3d2ae25f2648ad5e4ce36b202735cb8b842bc9494d27b1ec6538f781a72a738369bbe8da3c80dfe9f2c661963bc1096dc544db813ebcf7a86cfecabacdb9b53218cb01fbcc641fc2bd764f0e68570486d3ed4919ced503f95539bc23e1eb61f6a36a63119dd9476e3f5af3ebe5d5254dfbd1fc8f62967d8549c5464afd3739fa5c57509a058cf12c9134caac3233ff00d714c6f0c47fc172df8ad782f21c65af149fcce3fed2c3decdb5f239ae292b7dfc31363e4b843f504540fe1bbd5e8636fa35612ca31b1de9bfccd638ec3bfb463119a4c569b687a827fcb0cfd18540fa6dea7deb6947fc0735cf2c26221f141fdccda388a4f692fbca245348ab0d6f2a67744ebf5535115c75ac5a71dd1b2927b32222a48e658e364312b67b9ea2908a6115509b8bba1ca2a4acc9bcfb72a435bf241e47e355a57889f9015181d7d6908a630ad1d47256611a514f41da649236baaa18954818907a7247f857addb0db6b12fa20fe55e55a526ed4188f451fad7ac46308a3d057dc6510e5c245f73e5b1d2e6c54fc87514515ea1ca145145001451450053d4205b8b76898901c15c8acab8d39dbcddb3aaa4aaaafb97d3bd6d5c83e51dbd7b561248e74e959a75964f2f718dc02548ebf8570e2d527a4d5dd9f96dff000e694dcd6b17fd7f482e2c6e77c82108d1bc89264b608231fe150489234d770470967332b8718c2743cd5b97509e3790aa46d1468b21ce7241f4a4b77946ab76c518aec0c0291c8c71c7ad70d48d09c9460deaecfd3dedbe77378caa28de56d17f910bd9becd499636f359be561dd78240a82448a582f23b7ddf675883819202b8adbb6bb4b82ebb191d31b95bb67e958faceb93da6ab1699656d6f2ccf119a56b89bcb455ce00e9c926b7580a75637a72d35e9ebfe7afa193c4ca0fde5dbf4ff22495a7492da085e5da61de30e0127ea7afd2a533debcb6b10758de48c96f943722abea9aac56b6d6115ce9af3de5d1c476b090c410327e6e06053e0d63493a59d4df75ac7664c5224830d13742a40efd2afea55949da5a3b75f4ff0083d45f58a6d6ab5d4963d46792ded9512333cacca49e17e5ea6aed95c9b98df7a85923628e01e322b334d9f4cd5adcae9f72e2481cbfcca55d0b7aa903835ab69662d6371bd9d9d8b331ee6af0f0c546a2f68eeadafddf7dee2a92a2e2f93fafe913628c7b53b1495e89cc34a8f4a8dede17fbd1237d541a9a92a5c53dd0d36b6293e9764fd6d62fc171555f41d39ffe5863e8c6b5a908ac6583c3cbe282fb91a4711563b49fde60bf862c5bee9957e8d55a4f09c27ee5cb8faa835d2d34d734b29c1cbfe5da368e3f131da6ce36c2c3ec7aec96dbbccc3a7cd8c7bd7a20e95c4d92eff155c31ef3003f0515db035d3429c69c3923b2307394e4e72dd8b451456c30a28a2800a28a280192f319acb3b43beeb4fbc30cca3a8ad490e10d66b6a56c8e52466423fbc871f9d1ca9ee88936b620ff0043915815750e9e5f43f769c21b795a4d9390cf188bafeb56a3b9b59b849a27f60c29ff006784b06f2d739ce40acde1e93fb20aa4d752958d835b4ccfbe32ac81708b8e9deb23c41a119f5983555d3a3d455606825b67201c1390cb9e32391f8d741f618b2c50b231eea69a2ca452365cc817d29d1a30a31e486c2a92751de471f0697a969967a1ea1716f248f612ca24850ef7485f20018fbc578aa3796f717fa7ebba8c56d38b56be82e111e32acea98de769e7ff00d55dfa47768083223fcbc6477a04972377990a95009183d6b6b99f22399b6bdb5bef88104da74c9346da7b79ed19c81f37cb9f7ad0f136a57fa7be991d8344b25d5d080995490320fa55d86486d9d9a3d3fc9dc7e7644033efff00eba2ed34ed467b65b8c9782612c5c91871d295cab3398ff84b359b4b7bd96e6d2ce58b4fba16f70e8ecacf92065579c751d4d6a6a1e2e4b1bdbc8869f3cd0d8a2bdccaaca3606191804e4d177a16997965a95b2dccb17dbe613c8dd70c08e9c7a8ae735fd36e1fc417d793d9f9f0f9718b7492092549801d014fbbcf620d568c9d51e81693fdaad22b8f2da3f31436c6c6467e952e2a0d3a5927d36da59adcdb48f1a9684ff01c74fc2ac9a92c61a4a71a43400c229a6a434c3ef401c82ddf9379773a1e5646fe78ab90f89645fbd584d2058a624e3cc918fe6c4d4359537745c558ed20f1246e406ef5b96d389e30e2b81d2ac9ae6e178e01aefad6110c4aa3b0ab289e8a28a0028a28a00423350bda4527de406a7a2803365d1ada4eb18fcaabff006318b9826923ff007588adaa280314dbea517dcb8de3d1d41a4fb56a317df82393e9915b749b41ed401909aae389ada54fa722a65d52cdbacbb7fde522af3428dd54542f6103f54140b95024f049f72546fa30a5312120ed5241c838aab268d6effc20543fd90f1ffaa9e44fa31a05ca5c6b484823cb033dc7d735247188d150670a30327359de46a717dcb92c3fda50693ed5a947f7e18dfe9914c5cacd3c566eb17d3594502db2234d7132c29e613b549cf271f4a41abbaffadb3907fba41a8eeaf34dd42030dd2b852723729054fa823a1a89a6e2d4772e972c669cd5d11477b7f637d6f6ba979332dc92b1cd08dbb580ce0a9edc75abe97d049b4abf0dd091818c673cf6aceb4b1b137515c4da9cb772439f284d20c2718e9c64e3b9abc74db6922118772814aa80d900118c0ace9fb44b536aae8b6bf1b2b2fbbee241796ec630b2ab798484da739c75a5b8758eda5918e1510b13f41556e348491e49124d8cc1f69dbf74b00323f2fd6aaded9c96be1ed4a159412f149e59c602e5703f5ad14a5f6918ca30b5e2f53caeef5a17d32496cdfb832054e31900727f5ae92d11a60800c935c6e9760cd750db20cac236e4773dcd7ace81a39015dd7a74a9a4ef0bf72a51e57635b44d3c5bc2188e4d6d5351422803b53ab42428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a003149b41ed4b450046d0a37551513d8c0fd50559a2803324d1ad9ff00805566d0554e627643fec9c56e51401cfb69fa8c5feaaf24ff00811cff003aa97706b13db496ef246cae304ecc1aeae9303d280b1c6e89e118ecdc3baf3d6baf8a258902a8c629f814b4005145140051451401ffd9, 1),
(2, 1, 2, '2020-10-22', 'Recuperado', 0xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108009600c803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f40aa7757df67b9b7b758249a59b2404c0daa31963923d455c3595a8482db55b1ba911cc612488b2216c16da474ff76bd67b1e7adc993528e4d425b7df1858dc43d4963215dd8c631f779a5fed6b2f2de4f3be44dd93b4e0ed201c71ce09038ae6ed3ed10eae67b8b69238a6bd13efda4e72b2a8cf1c7013f4a7a432b699676e2293cc447b79014230e6443e9d3009cf4a8e76572a3a43a95a0111330c4ac510e0f241da7f5e29b36a96503ce92ceaad02ef917072071f9f51d3d6b9a9125786d952294b179a261e591b58ce8c3b74c0273ed49adc1712ea9a8ec86608b16ff3550e30554601ee723a7b50e6ec0a2ae74b797e208adcc653ccb9904710909504904fa67a03c516fabd8dd342219f799c314014f3b7af6e3a8eb595ad2cf35de92f6f0bcd1c0cb31720f19645cf4ebb4b7eb599a647369c96e1a3b95920b6b9014467f78c4ab283c7a7f2a1cda60a2ac753fdab63f628ef3ed0bf6791f62c983827247f434e3a95a05ba6337cb6bfeb8ed385e33f8f1e95cc7d9ee6d3c2915b3d9c85a0bb2be52296254e7a71cfdeeb53416f345a06b96c44cd70108f2f6923fd528f978e7241e9473b0e546ec9ac5845cb4fc084cfb82311b07539c76f4eb4d6d734e40c5e729b76eedd1b0dbb864678f4fcab9c9619dacd97ecf70a67b5b92a04472bbe50ca0f18071ce0d49abdac9349a9a01712389e09020438755519ed8e790714b9dd83951d17f6bd86f64370032bb47c8232ca09603d7001fca9bfdb361bca79cd90ea9feadb92c3231c73c735caea305c4b6d2bc11dc4b24577732ecd878041c01c771fceb46782486f2db78992259add8ba293d23753dbd4007eb473b0e546eb6a768965f6b691bc8dfb030463939da303193cfa522eab66ce504adbc4de46d31b03bf19c74f4e73e9594d149258ac11094429a8a794c139081831ea3a0391f4154ef9eeedef2eae6de095a486f1993303306cc01571ea3208c8e99aa72681451bf3eb1616d8f36e02e73ced3d9b69fd41a7c9a9d9c73490b4dfbd8d91590292417fbbd3d715cb6a363717114ffb8918c2e090aa7e6fdf3b91f42b8fcea465b9fb7ea977f65954ca564b660a49678db6a8c638cff2353cec7ca8ea26bfb6b779525976b45179d2704ed4f53f91fcaa23abd82ab16b80a162f34ee5230b8ce791e9dbad616b9f6d8ef3508e185dd2eed4825622d802393a11d0eec71df7553d42de59ccf1c71cf2a491170e50fcca6109cf1d73da9b9b128a674b71abc093a5bc124724c6611303bbe5f9431e80f3823f3a135cd3e4c0599b2c8d2006260485ce78c7b1fcab9dd2ad6eadb5781af126899ae0962aa4827cb00024678e2a68ed6687538277866dab0dc43c212012ee54fe43ff001ea4a721f2a3a18f54b3940292920c2272761e10f4278e3a1ebe94fb6bfb6bc205bc9bf31aca08538dadd39f7f4ae660f3974ebb845bcfe75cd9411c68d1b0fe1d8c338e3049fe757b41496196da230bc645aec994a9c2946da983ee377e0053526d89c743a2145028ab242a85fe956da9321b833828081e54ef1f5f5da466afd14018bff08be9bfdfbeff00c0e9bff8aa5ff845b4dfef5f7fe074dffc5558d79ef23d02f5f4fdff006b111f2b60cb67d87ad79fc9ab78d63591628752601018d9ad573d148cf07beec8f7ed59ca518bd8b8a94ba9dc7fc22da77f7afbff0003a6ff00e2a93fe116d37fbf7dff0081d37ff155c65a5c78d64bbbc919efa35512ca55adc61b685c226460679c7f5aaada978e59bcd297e19222a316fc6372f38c72dd7b74a9f691fe52b925dcef7fe117d3bfbf7dff0081d37ff1547fc22fa77f7efbff0003a6ff00e2ab4acda66b281ae062631a99063a3639fd6ac56bcb1ec6777dcc5ff845f4efefdf7fe074dffc551ff08be9dfdfbeff00c0e9bff8aadaa4a3963d82ecc6ff00845f4dfef5f7fe074dff00c551ff0008be9bfdfbeffc0e9bff008aaaf7fe35d174cd46e2c6ee69239a000bfeec91c8078c7b1aaf71e3dd223494c06598a23b6ef2982fca5475c74f987201ef52dd35bd8694cd0ff845f4efefdf7fe074dffc551ff08be9bfdfbeff00c0e9bff8aaa63c79a06421ba7dfbc2102262339c7a74cf19a68f1f682650be7c9b08521fcb3824e78f5e00cd1cd4fc82d32eff00c22fa77f7efbff0003a6ff00e2a8ff00845f4efefdf7fe074dff00c556d039a5e2ab963d89e67dcc5ff845f4efefdf7fe074dffc551ff08be9dfdfbeff00c0e9bff8aadaa28e55d8777dcc5ff845f4efefdf7fe074dffc551ff08be9a3abdf7fe074dffc556cd79e49e17d74bced1cd72aa926f8a2fb4e564fdfb1e727b26dfcaa6565b46e3577bb3a88fc39a4ca18c735e38562a4adfca704751f7a9dff0008be9a3f8efbff0003a6ff00e2ab821a0f8ce2b767dd751e031d89744f5dc48e0924e48e7ad22681e34b88a22ed700aa874325cf2adb00ee739073f9d473ff0070be5fef1df7fc22fa6ff7efbff03a6ffe2aac59689676171e7c2d725f047ef2e6471f9331151f86edefad741b787512e6e54b6edefbd80dc76827b90315ad5aa4ad7b19b6f6b80a28a298828a28a00a3ab5c4b6b606585b6bee0338cd618d6b50ff009ec3fef815b1aeff00c828ff00beb5cc8e95f379b57ab0c472c24d2b2ea22fff006d6a1ff3dbff001d153586a97b3ea10c524b9463c8da3d2b2eace97ff216b7ff0078ff00235c587c55775a09cdeebaf9858ec5f679116d4c3f3b9b3d6982ac436e6e4c7186dbd4e71f4aadd091e8715f609ad87e62d349a7531bad78f9ee3eb60b0caad1b5ee96bf33b7034215ea38cf6b1ce6a5e0bd2754d466be9cdc09e520b149318c0038e3d07ea6a097c01a3cd1189a4bcd84b6079dc28241c0e3a656ba9a2be39f12635ff2fdc7b0b2da2bbfde72327c3bd21a489a396e536481dbe607700c5b1f4c9a72fc3bd0d55573747691c997b0cf1d3a60e2baca28ff005931bda3f70ffb3a8f77f78a0e0548aaa6191cb10ca46171d6a2a917fd549f515f51906675f1f1a8eb5b4b6de6793986169e1dc543adc414b4d069d5f4479e1494b450025666abad43a7011ae24b86e89e9ee6a9eb5e215b5dd6f68434dd19fb27ff005eb912ed2cdbdd8b3336493c9359cea5b4444a5d8f43d3ae4de584339c6e65f9b1ebdeadd6078567df613427ac521e3d8ff935bf57177499517741451453185145140199ae9ff8959ff7d6b9a078aed2e2cedef6d1a29e475e4101475aa03c3b619004d3927d8578598e02b622b73d3dac239ac8ab3a61ff0089b5bffbc7f91adf93c35651bec792756f4c0a75b687a7dbce2613cdbd012a081827d2b928657888548cddac9a1ea5f7ff00551fd4d3453da5678a38c8501338207273eb4dafa800a61eb4e34f68e1c2912b6e23e61b3a1fcebc5cfb035b1b8654a8ef7bfe0cedc057851aae53dac43453f647ff003d1bfef9ff00ebd1b23ff9e8dff7c7ff005ebe47fd58cc3b2fbcf5ff00b530fe6328a9648162728eceac3b14ff00ebd37647ff003d1bfef9ff00ebd1feac661d97de1fda787f31952c4fb033e33b594e3d6902459199580eff0027ff005e9c4c48b346bb9f246c7e9c0f6afa5e1fcb6be0635235d7c56dbc8f3330c4d3aee2e1d2e2cf37da26326ddb90063f0a6520a0d7d1a56d11e779833055249000e4935c9eb5e23326eb6b16213a34a3bfd2ba6d434eb6beb7489eee655232eb18c73e87d6b2bfe111d2ff00e7bdcfe9512e67a225a67139e6b4f564d3c5d46da7b7cacc432e72060f047d6ba84f05e9f246ce935c10a791c67bff0085443c27a6020f9d71c7b0ac7d9b6c9e5958c7f0acfe5ea92c24e0488703dc7f935d98accb3f0de9d69791dc24f38656ce4818ad570ab23046dca0f0718cd6f04d2b32a29a4251451545051451400955a3d4adc1675940f2e4d99c7f10c1feb561806520f42306a18ad2084308e25019b711d79c633fa53d443e6d4a196793cc9d0c91a82e07f08ed9a45b981a7f2048a65dbbb6679c7f9229a9676f1cd24ab128793ef9f5e734259dbc772d7091012b0c161e9c7f80fca959a41a1628a28a061498a5a2801ac42a9662001c926a941aa5acf1c322b902562a991d7071fd2ae3aaba95600a9ea0d315228102a844524903a727934f5104dacc178ccdbc1f2df61da0e371e6a3b6bc8ae67b885321a07da723afb8fc723f0a2d23b3f27cdb458bcb94eedd18186ed9a9a386388b18e3552e77360753492690dbd47e2971494b400514514008480327803bd411de5b4cb1b24c8448329ce0b0f6a9258d658cc6e0953d47ad450d95bdbc712244b888610919207d68d4341d6faac5ba68619d72aa19b23b1c8cff003a635edb24c22694062a187b827029b06996b6ecec8992e369dc73c71c7e83f2a6cba55a4b702768ff0078005ce7b0e40a2cc34259aee0b789e577f950e1b682d8fcaac0a825b48658dd082a1c82c50ed271ee2a714f510b451452185145140105deff00b1cde531593636d603241c715e747c43e2eb7d3c5cb1320dd1205369f316318739c0e9c91f5af4ba315328b96cec38c92e879547e35f154912bc56ed292d2608b43b480808e7d9bf3abda7f893c4b26b76b0bc72496d34caaced6aca1970b9ff007782c7f0af508ed55acda50db5949e3b638ff1aad511837f6b62dcd760a5a4a5ad4cc28a28a00ccf1059dc5fe81796b68409e58f6a65b6e7db3db3d2b814f07f895625dfb64923da50b5e363fd595031db04f5f7af50ae5b59f1b5ae99786da087ed2ebc4843e029f4f7ac2bca94173d4763b30585c462a7ecf0f1e6671fff00089f8b8bbc2249401081b8dd10a795c28e7b609abf6de14f14c3a8c12bdd9318b9591ffd29bfbe4938ff00778c7bd688f8880a93fd9a78ff00a6bffd6ab5a678eed6f2f56dee6dfeccafc2c85f233efc715cb0c4e11b494cf46a64799c20e72a5a2f34ff0053afa5a414b5e89e1051451400565788ae2eed340bb9ec777da1146d289bc8e46481df0326b569287aab01e656fabf8b3fd32683cc0888257335a9dd26428c81ce08ce7038e0d453f89fc5ad2ed8e19dbcbf9c62ccaeff00dd92323ebdabd3a4b88601996544ff007980a23b9826388a68dcfa2b0351ec656d1b2bdaabec50f0f5d5ddee836b717ca56e1d4efca6d279201c76c8c1ad4a4a5ab4ac89ea1451450014514500159f3eb3716b3490db08ca91862cb9ab5773fd9edd9ff88f0bf5ae7fdcf24f5af9ccf7319d1e5a349d9eecf7727c0c6adead5575b22f7f6ede6d3c459ff769c35ebdd8c8c2228d8dc027354111a46f2d0166660001dcd260a92ac0823b1af9c5996337f68cf77ea185db911d22309115d4fcac3229d59ba54f956818f2395ad2afbbc0e2962a846aaebbfa9f1d8bc3bc3d674dff00482929690d759cc715e2ef161b6f334dd3dff7df765947f07b0f7af3b2493935a7e21ff9182fff00ebbb7f3acbaf92c5d79d5aadcba1faee5181a384c2c5525ab49b7d5b68990651b8e723b559d4b4cb9d3258e3b90a1a44debb4e78c91fcc1aa8afb54faf6a92eaf2e2f240f733c92b01805db271d7fad736963d27cfccadb753b2f08f8b4c663d37507250fcb0ca7f87fd93ed5e815e1d65ff001fb07fd745fe75ee22be8b2aaf3a94dc65d0fceb8af03470d5e15292b73deeba5d5bfcc5a28a2bd43e542b075ed68d97fa35b91e7b0cb37f747f8d6ed79c5eccd717d34ac7259c9aebc2515527796c8caac9a5a11492492c85e476763d4b1c9ab22c2f5a292f228dbcb5663bc3608c7538ce78c8aabdeb45757b882c64d3c2af90dbc302083c91cf5ed8af526e492e45ff000c732b7535f41d75e5916d2edb731e2390f53ec6ba6af314668dd5d4e194e41af4a85fcd82393fbea1bf315e76368a8494a3d4e8a526d5992514515c26c145149b0cbfbb0e10b7018f6f7a4dd95c6b57631350b9135cec53f2c7c7e355ab50f87951d87db14e0f518e697fb057fe7ec7e95f1188caf30c45595594757e68fada198e0a8d354e32d179333209cdbccb328c98dd58039ed44d72d732891fef050bf5c0c569ff0060a608fb50e7e949fd82a3fe5e87e9597f62e3ed6e5d3d51a7f6ae0afcdcdafa33312530cab22f5539ae863916589645fbac322a81d054ff00cbd8fd2aec1626c2054f3d6556f9863f87dabdac970b8bc24dc2ac7dd7e6b73c9cd71185c4c54a9cbde5e4f625a434b457d19e19e33e22047882fc1047efdbafd6b2abd5fc4fe188b5a84cf0054bd41f2b7671e87fc6bcb67825b79de19919244386561c835f2b8dc34e8d46deccfd5f24cce8e370f18c3494524d7ebe845452e29511a4754452ccc70001c935c67b2f4d593d8826fadc0049322e00fad7b88ae4fc29e145d3116f6f5435e30caa9e910ff1aeb6be972dc34e8d36e7bb3f34e26cca9632bc6147550babf7bf6fb828a28af44f9a12bcf353b66b4d4a6898606e257dc1e95e89599abe911ea71020849907caff00d0d75616b2a52d76665521ccb4384a2ae5ce937d6ac4496ee47f7906e07f2a6c3a6dedc3058eda539ee5703f335eb73c6d7b9cd677208217b8b84850659d8015e911a08e248c74550056468da1ae9ffbe9887b8231c745fa56d57978baeaa4ad1d91d34e16576145145719a85252d51bfbefb18882a6f7791171e80b004feb45ec05da4aa73dec9147237d9dc6d75504f43938cd52b3d5ee2eae67516e1a38e20e36752c403b79fa9f4e94732bd82cce96de5b75b49125dbbc938cae4f4e3b7ad53159573a9cb0dcac62ddb6f9424607a824f4fd3f322a6bfbf92ceda69040edb1942e067764f3f90cd2565763d5d8d0a2a85bdf493c71b7d99cee90a1231f2e3bd49a7dcbdd4523398ced919018c9c1029dc562e514514009593aa786f4cd5e659aea26f354637236d247bd5bbbbe5b59ade2da59a690271fc20f7355ef7557b4b392716b2128e176bf19cf715138c26ad35746b42b55a13e7a52717dd6866ffc20ba27fcf39ffefe9ab7a778574ad32e85cc10b1940c2976ddb7e9ef535a6b06ea69505bb6d48c38c73cfa1f7c11fafa53ae3598a09d20f2dcc8ca188c7407fad671c3e1e2f9a315f71d55333c7548b84eac9a7e6cd2a5aa1777cd6f6d3cab10062200f35b686fa1aba0e4035b9c03a8a28a00292835413558a4371b639196190265573bb23391ed45c0bf45505d5626be96d0452f991c6242481823d0739cfe1515d6ace97705a410179678cb824e36f5c647e07bf6a3990599a94b4833819eb4b4005145140052628a28101008c1008340500600007b5145000541ea01a28a28000a00c0000a31451400b8a3145140c4c03d8518f5a28a6210285ced0064e78a0a2b1195071c8c8a28a402919ea01a05145002d145140c08a6aa2afdd5519eb81451408362eeddb46ef5c7346c5ddbb6aeef5c73451400ec5145140c28a28a00ffd9, 0);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_gerencia`
--

INSERT INTO `tbl_gerencia` (`id_gerencia`, `nombre`, `descripcion`, `disponibilidad`) VALUES
(1, 'Gerencia de Administración', 'Administración123', 1),
(2, 'Gerencia de Administración Tributaria', 'Gerencia', 0),
(3, 'Gerencia de Recursos humanos', 'Gerencia encargada del Personal ', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_inventario`
--

INSERT INTO `tbl_inventario` (`id_inventario`, `nombre`, `fecha_ini`, `fecha_fin`, `disponibilidad`) VALUES
(1, 's', '2020-10-07', '2020-10-14', 0),
(2, 's2', '2020-10-15', '2020-10-02', 1),
(3, 'Inv-2020-1', '2020-10-14', '2020-10-22', 1);

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
