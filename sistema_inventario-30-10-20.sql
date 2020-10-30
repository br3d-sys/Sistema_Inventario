-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3308
-- Tiempo de generación: 30-10-2020 a las 19:34:31
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_C_Tabla_Encontrado` (IN `_id_bienes` INT, IN `_id_inventario` INT, IN `_fecha` DATE, IN `_estado` VARCHAR(45), IN `_imagen` LONGBLOB, IN `_detalle_estado` VARCHAR(200), IN `_t_documento` VARCHAR(45), IN `_n_documento` VARCHAR(45), IN `_archivo` VARCHAR(250))  BEGIN
    INSERT INTO tbl_encontrado(id_bienes,id_inventario,fecha,estado,imagen,detalle_estado,t_documento,n_documento,archivo) values(_id_bienes,_id_inventario,_fecha,_estado,_imagen,_detalle_estado,_t_documento,_n_documento,_archivo);
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

DROP PROCEDURE IF EXISTS `SP_O_Tabla_Asignacion`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_O_Tabla_Asignacion` (IN `_id_asignacion` INT)  BEGIN
IF EXISTS (SELECT * from tbl_asignacion)THEN
	SELECT tbl_asignacion.id_asignacion, tbl_asignacion.id_usuario, tbl_asignacion.id_encontrado, tbl_encontrado.id_inventario,tbl_encontrado.id_bienes, tbl_bienes.nombre as "bien",tbl_bienes.codigo, tbl_inventario.nombre as "inventario",tbl_asignacion.id_personal, tbl_personal.nombre as "personal", tbl_asignacion.id_area, tbl_area.nombre as "area", tbl_area.id_gerencia, tbl_gerencia.nombre as "gerencia", tbl_asignacion.fecha FROM tbl_asignacion INNER JOIN tbl_encontrado ON tbl_asignacion.id_encontrado = tbl_encontrado.id_encontrado INNER JOIN tbl_personal ON tbl_asignacion.id_personal = tbl_personal.id_personal INNER JOIN tbl_area ON tbl_asignacion.id_area = tbl_area.id_area INNER JOIN tbl_gerencia ON tbl_area.id_gerencia = tbl_gerencia.id_gerencia INNER JOIN tbl_bienes ON tbl_encontrado.id_bienes = tbl_bienes.id_bienes INNER JOIN tbl_inventario ON tbl_encontrado.id_inventario = tbl_inventario.id_inventario WHERE tbl_asignacion.id_asignacion = _id_asignacion AND tbl_asignacion.disponibilidad>0;
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
	SELECT tbl_encontrado.id_encontrado,tbl_encontrado.id_inventario,tbl_inventario.nombre as "inventario", tbl_encontrado.id_bienes, tbl_bienes.nombre as "bien",tbl_bienes.codigo, tbl_bienes.id_categoria, tbl_categoria.nombre as "categoria", tbl_encontrado.fecha, tbl_encontrado.estado, tbl_encontrado.imagen from tbl_encontrado INNER JOIN tbl_bienes on tbl_encontrado.id_bienes = tbl_bienes.id_bienes INNER JOIN tbl_inventario ON tbl_encontrado.id_inventario = tbl_inventario.id_inventario INNER JOIN tbl_categoria ON tbl_bienes.id_categoria = tbl_categoria.id_categoria WHERE tbl_encontrado.id_encontrado = _id_encontrado AND tbl_encontrado.disponibilidad >0;
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
	SELECT tbl_asignacion.id_asignacion, tbl_asignacion.id_usuario, tbl_asignacion.id_encontrado, tbl_encontrado.id_inventario,tbl_encontrado.id_bienes, tbl_bienes.nombre as "bien",tbl_bienes.codigo, tbl_inventario.nombre as "inventario",tbl_asignacion.id_personal, tbl_personal.nombre as "personal", tbl_asignacion.id_area, tbl_area.nombre as "area", tbl_area.id_gerencia, tbl_gerencia.nombre as "gerencia", tbl_asignacion.fecha FROM tbl_asignacion INNER JOIN tbl_encontrado ON tbl_asignacion.id_encontrado = tbl_encontrado.id_encontrado INNER JOIN tbl_personal ON tbl_asignacion.id_personal = tbl_personal.id_personal INNER JOIN tbl_area ON tbl_asignacion.id_area = tbl_area.id_area INNER JOIN tbl_gerencia ON tbl_area.id_gerencia = tbl_gerencia.id_gerencia INNER JOIN tbl_bienes ON tbl_encontrado.id_bienes = tbl_bienes.id_bienes INNER JOIN tbl_inventario ON tbl_encontrado.id_inventario = tbl_inventario.id_inventario WHERE tbl_asignacion.disponibilidad>0;
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
	SELECT tbl_encontrado.id_encontrado,tbl_encontrado.id_inventario,tbl_inventario.nombre as "inventario", tbl_encontrado.id_bienes, tbl_bienes.nombre as "bien",tbl_bienes.codigo, tbl_bienes.id_categoria, tbl_categoria.nombre as "categoria", tbl_encontrado.fecha, tbl_encontrado.estado, tbl_encontrado.imagen, tbl_encontrado.detalle_estado, tbl_encontrado.t_documento, tbl_encontrado.n_documento, tbl_encontrado.archivo from tbl_encontrado INNER JOIN tbl_bienes on tbl_encontrado.id_bienes = tbl_bienes.id_bienes INNER JOIN tbl_inventario ON tbl_encontrado.id_inventario = tbl_inventario.id_inventario INNER JOIN tbl_categoria ON tbl_bienes.id_categoria = tbl_categoria.id_categoria WHERE tbl_encontrado.disponibilidad >0;
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_U_Tabla_Encontrado` (IN `_id_encontrado` INT, IN `_id_bienes` INT, IN `_id_inventario` INT, IN `_fecha` DATE, IN `_estado` VARCHAR(45), IN `_imagen` LONGBLOB, IN `_detalle_estado` VARCHAR(200), IN `_t_documento` VARCHAR(45), IN `_n_documento` VARCHAR(45), IN `_archivo` VARCHAR(250))  BEGIN
    UPDATE tbl_encontrado SET id_bienes = _id_bienes, id_inventario = _id_inventario, fecha=_fecha, estado = _estado , imagen = _imagen, detalle_estado = _detalle_estado, t_documento = _t_documento, n_documento = _n_documento, archivo = _archivo WHERE id_encontrado = _id_encontrado;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_asignacion`
--

INSERT INTO `tbl_asignacion` (`id_asignacion`, `id_usuario`, `id_encontrado`, `id_personal`, `id_area`, `fecha`, `disponibilidad`) VALUES
(1, 1, 3, 1, 1, '2020-10-30', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_bienes`
--

INSERT INTO `tbl_bienes` (`id_bienes`, `id_categoria`, `nombre`, `serie`, `descripcion`, `codigo`, `precio`, `imagen`, `estado`, `fecha_ing`, `marca`, `color`, `modelo`, `alto`, `ancho`, `profundidad`, `disponibilidad`) VALUES
(1, 1, 'Mesa de Madera', '123456789', 'Mesa', '12345678', 25.00, '', 'Nuevo', '2020-10-14', 'No especifica', 'Cedro', 'Normal', '1', '1', '1', 0),
(2, 1, 'Mesa de metal', '123456789', 'Mesa metalica', '12345678', 25.00, '', 'Nuevo', '2020-10-29', 'No especifica', 'Gris', '0', '1', '1', '1', 1);

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
  `detalle_estado` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT ' ',
  `t_documento` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT ' ',
  `n_documento` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT ' ',
  `archivo` varchar(250) DEFAULT ' ',
  `disponibilidad` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_encontrado`),
  KEY `fk_inventario_bienes_idx` (`id_bienes`),
  KEY `fk_encontrado_inventario_idx` (`id_inventario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbl_encontrado`
--

INSERT INTO `tbl_encontrado` (`id_encontrado`, `id_bienes`, `id_inventario`, `fecha`, `estado`, `imagen`, `detalle_estado`, `t_documento`, `n_documento`, `archivo`, `disponibilidad`) VALUES
(1, 1, 2, '2020-10-21', 'Recuperado', 0xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108007000c803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f7fa28a2800a28a8a7b886da3324f2a4683ab31c0a00968ae62efc696484ada46f3e0e37636afe1508f1b478e6d0e7fdff00feb5572b3275e9a76b9d6d15cdc3e2eb794e3ecd2e3d4115717c4566472241f80ace538c5d9b37a709545782ba3628acb1afd89fe361ff0001a9e1d52d6e1b6c52163fee9a4aa45ecca952a9157699768a60953fbd4be62ff787e756663a8a4dcbea28cd002d1499a5a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a00f2df167c56161a85d693a5b5ac3750398de6bddf80c3d02839fa935e74752d5f54d505e6a7e21b3bb2bc85fb4e157e8a700553f89766b07c4ed495c1f2e49524207a32826b0ce9f165b7496eaa01e559c1fc8d6a9238aa4e4ee99e8d05e4cf8d9342f9fee4e87f91ad4850a8dd29673edc8af1cd3722fe1ebf7abb4d3addaf2f62b71218c31e5b3d00e4fe35e4e6189ab09aa70ea7d470fe5187c4509626a3d62faaf2b9dda6a7127cbf20c762315721d5ccaeb146b1bb1e155464d71da9691369d04b22de4c648db953c0dbbca8e73d78fd6a0d0ef2e06af06667ea4727dabc9a95ea51bb91f45f50a35693a94ddd23d4ecb4591f125d6501e4460f3f89ad948445184440aa3a015c6adfde28e2e1ff3a946af7cbd276fceb3a59f61e0ace9bfbcf9baf81c45577735e875c564c60647d2946f0a7ef13db9eb5ca8d76fd7fe5a83f502a45f115e8ebb0ffc06ba639fe13aa92febd4e5796622dd0e8435de3e651d7b37ff005a944b77803cae78c9dc315803c4d723ef4319fcea55f1437f15b0fc1aba239e605f56be4ccde5b895d3f2379a79524c6c9187aa8ffebd245a879b26c02656ff006948ac51e288bf8add87d1aa45f13599fbc928fc056f1cdf04f69fe666f01895f64dff003a4fef1a3ed320fe2fd2b157c43a79eaeebf55a906b5a7b74b903ea0d6f1cc30b2daa2fbccde1abc778bfb8d6fb6483d3f2a3edce3b03594da9da146f2ae212f8f9433e066ab0bfb969982c76ed16de184c324fa62b68d7a52f8649fccca50a91dd336e5d504113cb2280a8a598e7a015674ebd8f51d3adef62ff573c6245fa119ae1fc5d3bcfa62e9b6e489af0ec2c3a227f11aed347b74b5d1acede31848a14451ec0015519f349a411bf52ed14515a14145145001451450078afc4ef03ebbab78b8ea9a55a09a36850122450c1978e84fd2b8a9742f18da8713e9372c1bef1f20383c63b57d19ac37976e653bbe5c13b4e0f5ace4be68aea78e65768c4830e00c2820633594f190a525097f5bff00911f56954bca3fd7f573e698f4bbfb5bb8ccf6571161c643c4477aec2da6b18e354b8d3f7b0eae2420d7b87daadceedc7a49e51c8fe2a89a3d2ae25f2648ad5e4ce36b202735cb8b842bc9494d27b1ec6538f781a72a738369bbe8da3c80dfe9f2c661963bc1096dc544db813ebcf7a86cfecabacdb9b53218cb01fbcc641fc2bd764f0e68570486d3ed4919ced503f95539bc23e1eb61f6a36a63119dd9476e3f5af3ebe5d5254dfbd1fc8f62967d8549c5464afd3739fa5c57509a058cf12c9134caac3233ff00d714c6f0c47fc172df8ad782f21c65af149fcce3fed2c3decdb5f239ae292b7dfc31363e4b843f504540fe1bbd5e8636fa35612ca31b1de9bfccd638ec3bfb463119a4c569b687a827fcb0cfd18540fa6dea7deb6947fc0735cf2c26221f141fdccda388a4f692fbca245348ab0d6f2a67744ebf5535115c75ac5a71dd1b2927b32222a48e658e364312b67b9ea2908a6115509b8bba1ca2a4acc9bcfb72a435bf241e47e355a57889f9015181d7d6908a630ad1d47256611a514f41da649236baaa18954818907a7247f857addb0db6b12fa20fe55e55a526ed4188f451fad7ac46308a3d057dc6510e5c245f73e5b1d2e6c54fc87514515ea1ca145145001451450053d4205b8b76898901c15c8acab8d39dbcddb3aaa4aaaafb97d3bd6d5c83e51dbd7b561248e74e959a75964f2f718dc02548ebf8570e2d527a4d5dd9f96dff000e694dcd6b17fd7f482e2c6e77c82108d1bc89264b608231fe150489234d770470967332b8718c2743cd5b97509e3790aa46d1468b21ce7241f4a4b77946ab76c518aec0c0291c8c71c7ad70d48d09c9460deaecfd3dedbe77378caa28de56d17f910bd9becd499636f359be561dd78240a82448a582f23b7ddf675883819202b8adbb6bb4b82ebb191d31b95bb67e958faceb93da6ab1699656d6f2ccf119a56b89bcb455ce00e9c926b7580a75637a72d35e9ebfe7afa193c4ca0fde5dbf4ff22495a7492da085e5da61de30e0127ea7afd2a533debcb6b10758de48c96f943722abea9aac56b6d6115ce9af3de5d1c476b090c410327e6e06053e0d63493a59d4df75ac7664c5224830d13742a40efd2afea55949da5a3b75f4ff0083d45f58a6d6ab5d4963d46792ded9512333cacca49e17e5ea6aed95c9b98df7a85923628e01e322b334d9f4cd5adcae9f72e2481cbfcca55d0b7aa903835ab69662d6371bd9d9d8b331ee6af0f0c546a2f68eeadafddf7dee2a92a2e2f93fafe913628c7b53b1495e89cc34a8f4a8dede17fbd1237d541a9a92a5c53dd0d36b6293e9764fd6d62fc171555f41d39ffe5863e8c6b5a908ac6583c3cbe282fb91a4711563b49fde60bf862c5bee9957e8d55a4f09c27ee5cb8faa835d2d34d734b29c1cbfe5da368e3f131da6ce36c2c3ec7aec96dbbccc3a7cd8c7bd7a20e95c4d92eff155c31ef3003f0515db035d3429c69c3923b2307394e4e72dd8b451456c30a28a2800a28a280192f319acb3b43beeb4fbc30cca3a8ad490e10d66b6a56c8e52466423fbc871f9d1ca9ee88936b620ff0043915815750e9e5f43f769c21b795a4d9390cf188bafeb56a3b9b59b849a27f60c29ff006784b06f2d739ce40acde1e93fb20aa4d752958d835b4ccfbe32ac81708b8e9deb23c41a119f5983555d3a3d455606825b67201c1390cb9e32391f8d741f618b2c50b231eea69a2ca452365cc817d29d1a30a31e486c2a92751de471f0697a969967a1ea1716f248f612ca24850ef7485f20018fbc578aa3796f717fa7ebba8c56d38b56be82e111e32acea98de769e7ff00d55dfa47768083223fcbc6477a04972377990a95009183d6b6b99f22399b6bdb5bef88104da74c9346da7b79ed19c81f37cb9f7ad0f136a57fa7be991d8344b25d5d080995490320fa55d86486d9d9a3d3fc9dc7e7644033efff00eba2ed34ed467b65b8c9782612c5c91871d295cab3398ff84b359b4b7bd96e6d2ce58b4fba16f70e8ecacf92065579c751d4d6a6a1e2e4b1bdbc8869f3cd0d8a2bdccaaca3606191804e4d177a16997965a95b2dccb17dbe613c8dd70c08e9c7a8ae735fd36e1fc417d793d9f9f0f9718b7492092549801d014fbbcf620d568c9d51e81693fdaad22b8f2da3f31436c6c6467e952e2a0d3a5927d36da59adcdb48f1a9684ff01c74fc2ac9a92c61a4a71a43400c229a6a434c3ef401c82ddf9379773a1e5646fe78ab90f89645fbd584d2058a624e3cc918fe6c4d4359537745c558ed20f1246e406ef5b96d389e30e2b81d2ac9ae6e178e01aefad6110c4aa3b0ab289e8a28a0028a28a00423350bda4527de406a7a2803365d1ada4eb18fcaabff006318b9826923ff007588adaa280314dbea517dcb8de3d1d41a4fb56a317df82393e9915b749b41ed401909aae389ada54fa722a65d52cdbacbb7fde522af3428dd54542f6103f54140b95024f049f72546fa30a5312120ed5241c838aab268d6effc20543fd90f1ffaa9e44fa31a05ca5c6b484823cb033dc7d735247188d150670a30327359de46a717dcb92c3fda50693ed5a947f7e18dfe9914c5cacd3c566eb17d3594502db2234d7132c29e613b549cf271f4a41abbaffadb3907fba41a8eeaf34dd42030dd2b852723729054fa823a1a89a6e2d4772e972c669cd5d11477b7f637d6f6ba979332dc92b1cd08dbb580ce0a9edc75abe97d049b4abf0dd091818c673cf6aceb4b1b137515c4da9cb772439f284d20c2718e9c64e3b9abc74db6922118772814aa80d900118c0ace9fb44b536aae8b6bf1b2b2fbbee241796ec630b2ab798484da739c75a5b8758eda5918e1510b13f41556e348491e49124d8cc1f69dbf74b00323f2fd6aaded9c96be1ed4a159412f149e59c602e5703f5ad14a5f6918ca30b5e2f53caeef5a17d32496cdfb832054e31900727f5ae92d11a60800c935c6e9760cd750db20cac236e4773dcd7ace81a39015dd7a74a9a4ef0bf72a51e57635b44d3c5bc2188e4d6d5351422803b53ab42428a28a0028a28a0028a28a0028a28a0028a28a0028a28a0028a28a003149b41ed4b450046d0a37551513d8c0fd50559a2803324d1ad9ff00805566d0554e627643fec9c56e51401cfb69fa8c5feaaf24ff00811cff003aa97706b13db496ef246cae304ecc1aeae9303d280b1c6e89e118ecdc3baf3d6baf8a258902a8c629f814b4005145140051451401ffd9, NULL, NULL, NULL, NULL, 1),
(2, 1, 2, '2020-10-22', 'Recuperado', 0xffd8ffe000104a46494600010101006000600000ffdb004300080606070605080707070909080a0c140d0c0b0b0c1912130f141d1a1f1e1d1a1c1c20242e2720222c231c1c2837292c30313434341f27393d38323c2e333432ffdb0043010909090c0b0c180d0d1832211c213232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232ffc0001108009600c803012200021101031101ffc4001f0000010501010101010100000000000000000102030405060708090a0bffc400b5100002010303020403050504040000017d01020300041105122131410613516107227114328191a1082342b1c11552d1f02433627282090a161718191a25262728292a3435363738393a434445464748494a535455565758595a636465666768696a737475767778797a838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae1e2e3e4e5e6e7e8e9eaf1f2f3f4f5f6f7f8f9faffc4001f0100030101010101010101010000000000000102030405060708090a0bffc400b51100020102040403040705040400010277000102031104052131061241510761711322328108144291a1b1c109233352f0156272d10a162434e125f11718191a262728292a35363738393a434445464748494a535455565758595a636465666768696a737475767778797a82838485868788898a92939495969798999aa2a3a4a5a6a7a8a9aab2b3b4b5b6b7b8b9bac2c3c4c5c6c7c8c9cad2d3d4d5d6d7d8d9dae2e3e4e5e6e7e8e9eaf2f3f4f5f6f7f8f9faffda000c03010002110311003f00f40aa7757df67b9b7b758249a59b2404c0daa31963923d455c3595a8482db55b1ba911cc612488b2216c16da474ff76bd67b1e7adc993528e4d425b7df1858dc43d4963215dd8c631f779a5fed6b2f2de4f3be44dd93b4e0ed201c71ce09038ae6ed3ed10eae67b8b69238a6bd13efda4e72b2a8cf1c7013f4a7a432b699676e2293cc447b79014230e6443e9d3009cf4a8e76572a3a43a95a0111330c4ac510e0f241da7f5e29b36a96503ce92ceaad02ef917072071f9f51d3d6b9a9125786d952294b179a261e591b58ce8c3b74c0273ed49adc1712ea9a8ec86608b16ff3550e30554601ee723a7b50e6ec0a2ae74b797e208adcc653ccb9904710909504904fa67a03c516fabd8dd342219f799c314014f3b7af6e3a8eb595ad2cf35de92f6f0bcd1c0cb31720f19645cf4ebb4b7eb599a647369c96e1a3b95920b6b9014467f78c4ab283c7a7f2a1cda60a2ac753fdab63f628ef3ed0bf6791f62c983827247f434e3a95a05ba6337cb6bfeb8ed385e33f8f1e95cc7d9ee6d3c2915b3d9c85a0bb2be52296254e7a71cfdeeb53416f345a06b96c44cd70108f2f6923fd528f978e7241e9473b0e546ec9ac5845cb4fc084cfb82311b07539c76f4eb4d6d734e40c5e729b76eedd1b0dbb864678f4fcab9c9619dacd97ecf70a67b5b92a04472bbe50ca0f18071ce0d49abdac9349a9a01712389e09020438755519ed8e790714b9dd83951d17f6bd86f64370032bb47c8232ca09603d7001fca9bfdb361bca79cd90ea9feadb92c3231c73c735caea305c4b6d2bc11dc4b24577732ecd878041c01c771fceb46782486f2db78992259add8ba293d23753dbd4007eb473b0e546eb6a768965f6b691bc8dfb030463939da303193cfa522eab66ce504adbc4de46d31b03bf19c74f4e73e9594d149258ac11094429a8a794c139081831ea3a0391f4154ef9eeedef2eae6de095a486f1993303306cc01571ea3208c8e99aa72681451bf3eb1616d8f36e02e73ced3d9b69fd41a7c9a9d9c73490b4dfbd8d91590292417fbbd3d715cb6a363717114ffb8918c2e090aa7e6fdf3b91f42b8fcea465b9fb7ea977f65954ca564b660a49678db6a8c638cff2353cec7ca8ea26bfb6b779525976b45179d2704ed4f53f91fcaa23abd82ab16b80a162f34ee5230b8ce791e9dbad616b9f6d8ef3508e185dd2eed4825622d802393a11d0eec71df7553d42de59ccf1c71cf2a491170e50fcca6109cf1d73da9b9b128a674b71abc093a5bc124724c6611303bbe5f9431e80f3823f3a135cd3e4c0599b2c8d2006260485ce78c7b1fcab9dd2ad6eadb5781af126899ae0962aa4827cb00024678e2a68ed6687538277866dab0dc43c212012ee54fe43ff001ea4a721f2a3a18f54b3940292920c2272761e10f4278e3a1ebe94fb6bfb6bc205bc9bf31aca08538dadd39f7f4ae660f3974ebb845bcfe75cd9411c68d1b0fe1d8c338e3049fe757b41496196da230bc645aec994a9c2946da983ee377e0053526d89c743a2145028ab242a85fe956da9321b833828081e54ef1f5f5da466afd14018bff08be9bfdfbeff00c0e9bff8aa5ff845b4dfef5f7fe074dffc5558d79ef23d02f5f4fdff006b111f2b60cb67d87ad79fc9ab78d63591628752601018d9ad573d148cf07beec8f7ed59ca518bd8b8a94ba9dc7fc22da77f7afbff0003a6ff00e2a93fe116d37fbf7dff0081d37ff155c65a5c78d64bbbc919efa35512ca55adc61b685c226460679c7f5aaada978e59bcd297e19222a316fc6372f38c72dd7b74a9f691fe52b925dcef7fe117d3bfbf7dff0081d37ff1547fc22fa77f7efbff0003a6ff00e2ab4acda66b281ae062631a99063a3639fd6ac56bcb1ec6777dcc5ff845f4efefdf7fe074dffc551ff08be9dfdfbeff00c0e9bff8aadaa4a3963d82ecc6ff00845f4dfef5f7fe074dff00c551ff0008be9bfdfbeffc0e9bff008aaaf7fe35d174cd46e2c6ee69239a000bfeec91c8078c7b1aaf71e3dd223494c06598a23b6ef2982fca5475c74f987201ef52dd35bd8694cd0ff845f4efefdf7fe074dffc551ff08be9bfdfbeff00c0e9bff8aaa63c79a06421ba7dfbc2102262339c7a74cf19a68f1f682650be7c9b08521fcb3824e78f5e00cd1cd4fc82d32eff00c22fa77f7efbff0003a6ff00e2a8ff00845f4efefdf7fe074dff00c556d039a5e2ab963d89e67dcc5ff845f4efefdf7fe074dffc551ff08be9dfdfbeff00c0e9bff8aadaa28e55d8777dcc5ff845f4efefdf7fe074dffc551ff08be9a3abdf7fe074dffc556cd79e49e17d74bced1cd72aa926f8a2fb4e564fdfb1e727b26dfcaa6565b46e3577bb3a88fc39a4ca18c735e38562a4adfca704751f7a9dff0008be9a3f8efbff0003a6ff00e2ab821a0f8ce2b767dd751e031d89744f5dc48e0924e48e7ad22681e34b88a22ed700aa874325cf2adb00ee739073f9d473ff0070be5fef1df7fc22fa6ff7efbff03a6ffe2aac59689676171e7c2d725f047ef2e6471f9331151f86edefad741b787512e6e54b6edefbd80dc76827b90315ad5aa4ad7b19b6f6b80a28a298828a28a00a3ab5c4b6b606585b6bee0338cd618d6b50ff009ec3fef815b1aeff00c828ff00beb5cc8e95f379b57ab0c472c24d2b2ea22fff006d6a1ff3dbff001d153586a97b3ea10c524b9463c8da3d2b2eace97ff216b7ff0078ff00235c587c55775a09cdeebaf9858ec5f679116d4c3f3b9b3d6982ac436e6e4c7186dbd4e71f4aadd091e8715f609ad87e62d349a7531bad78f9ee3eb60b0caad1b5ee96bf33b7034215ea38cf6b1ce6a5e0bd2754d466be9cdc09e520b149318c0038e3d07ea6a097c01a3cd1189a4bcd84b6079dc28241c0e3a656ba9a2be39f12635ff2fdc7b0b2da2bbfde72327c3bd21a489a396e536481dbe607700c5b1f4c9a72fc3bd0d55573747691c997b0cf1d3a60e2baca28ff005931bda3f70ffb3a8f77f78a0e0548aaa6191cb10ca46171d6a2a917fd549f515f51906675f1f1a8eb5b4b6de6793986169e1dc543adc414b4d069d5f4479e1494b450025666abad43a7011ae24b86e89e9ee6a9eb5e215b5dd6f68434dd19fb27ff005eb912ed2cdbdd8b3336493c9359cea5b4444a5d8f43d3ae4de584339c6e65f9b1ebdeadd6078567df613427ac521e3d8ff935bf57177499517741451453185145140199ae9ff8959ff7d6b9a078aed2e2cedef6d1a29e475e4101475aa03c3b619004d3927d8578598e02b622b73d3dac239ac8ab3a61ff0089b5bffbc7f91adf93c35651bec792756f4c0a75b687a7dbce2613cdbd012a081827d2b928657888548cddac9a1ea5f7ff00551fd4d3453da5678a38c8501338207273eb4dafa800a61eb4e34f68e1c2912b6e23e61b3a1fcebc5cfb035b1b8654a8ef7bfe0cedc057851aae53dac43453f647ff003d1bfef9ff00ebd1b23ff9e8dff7c7ff005ebe47fd58cc3b2fbcf5ff00b530fe6328a9648162728eceac3b14ff00ebd37647ff003d1bfef9ff00ebd1feac661d97de1fda787f31952c4fb033e33b594e3d6902459199580eff0027ff005e9c4c48b346bb9f246c7e9c0f6afa5e1fcb6be0635235d7c56dbc8f3330c4d3aee2e1d2e2cf37da26326ddb90063f0a6520a0d7d1a56d11e779833055249000e4935c9eb5e23326eb6b16213a34a3bfd2ba6d434eb6beb7489eee655232eb18c73e87d6b2bfe111d2ff00e7bdcfe9512e67a225a67139e6b4f564d3c5d46da7b7cacc432e72060f047d6ba84f05e9f246ce935c10a791c67bff0085443c27a6020f9d71c7b0ac7d9b6c9e5958c7f0acfe5ea92c24e0488703dc7f935d98accb3f0de9d69791dc24f38656ce4818ad570ab23046dca0f0718cd6f04d2b32a29a4251451545051451400955a3d4adc1675940f2e4d99c7f10c1feb561806520f42306a18ad2084308e25019b711d79c633fa53d443e6d4a196793cc9d0c91a82e07f08ed9a45b981a7f2048a65dbbb6679c7f9229a9676f1cd24ab128793ef9f5e734259dbc772d7091012b0c161e9c7f80fca959a41a1628a28a061498a5a2801ac42a9662001c926a941aa5acf1c322b902562a991d7071fd2ae3aaba95600a9ea0d315228102a844524903a727934f5104dacc178ccdbc1f2df61da0e371e6a3b6bc8ae67b885321a07da723afb8fc723f0a2d23b3f27cdb458bcb94eedd18186ed9a9a386388b18e3552e77360753492690dbd47e2971494b400514514008480327803bd411de5b4cb1b24c8448329ce0b0f6a9258d658cc6e0953d47ad450d95bdbc712244b888610919207d68d4341d6faac5ba68619d72aa19b23b1c8cff003a635edb24c22694062a187b827029b06996b6ecec8992e369dc73c71c7e83f2a6cba55a4b702768ff0078005ce7b0e40a2cc34259aee0b789e577f950e1b682d8fcaac0a825b48658dd082a1c82c50ed271ee2a714f510b451452185145140105deff00b1cde531593636d603241c715e747c43e2eb7d3c5cb1320dd1205369f316318739c0e9c91f5af4ba315328b96cec38c92e879547e35f154912bc56ed292d2608b43b480808e7d9bf3abda7f893c4b26b76b0bc72496d34caaced6aca1970b9ff007782c7f0af508ed55acda50db5949e3b638ff1aad511837f6b62dcd760a5a4a5ad4cc28a28a00ccf1059dc5fe81796b68409e58f6a65b6e7db3db3d2b814f07f895625dfb64923da50b5e363fd595031db04f5f7af50ae5b59f1b5ae99786da087ed2ebc4843e029f4f7ac2bca94173d4763b30585c462a7ecf0f1e6671fff00089f8b8bbc2249401081b8dd10a795c28e7b609abf6de14f14c3a8c12bdd9318b9591ffd29bfbe4938ff00778c7bd688f8880a93fd9a78ff00a6bffd6ab5a678eed6f2f56dee6dfeccafc2c85f233efc715cb0c4e11b494cf46a64799c20e72a5a2f34ff0053afa5a414b5e89e1051451400565788ae2eed340bb9ec777da1146d289bc8e46481df0326b569287aab01e656fabf8b3fd32683cc0888257335a9dd26428c81ce08ce7038e0d453f89fc5ad2ed8e19dbcbf9c62ccaeff00dd92323ebdabd3a4b88601996544ff007980a23b9826388a68dcfa2b0351ec656d1b2bdaabec50f0f5d5ddee836b717ca56e1d4efca6d279201c76c8c1ad4a4a5ab4ac89ea1451450014514500159f3eb3716b3490db08ca91862cb9ab5773fd9edd9ff88f0bf5ae7fdcf24f5af9ccf7319d1e5a349d9eecf7727c0c6adead5575b22f7f6ede6d3c459ff769c35ebdd8c8c2228d8dc027354111a46f2d0166660001dcd260a92ac0823b1af9c5996337f68cf77ea185db911d22309115d4fcac3229d59ba54f956818f2395ad2afbbc0e2962a846aaebbfa9f1d8bc3bc3d674dff00482929690d759cc715e2ef161b6f334dd3dff7df765947f07b0f7af3b2493935a7e21ff9182fff00ebbb7f3acbaf92c5d79d5aadcba1faee5181a384c2c5525ab49b7d5b68990651b8e723b559d4b4cb9d3258e3b90a1a44debb4e78c91fcc1aa8afb54faf6a92eaf2e2f240f733c92b01805db271d7fad736963d27cfccadb753b2f08f8b4c663d37507250fcb0ca7f87fd93ed5e815e1d65ff001fb07fd745fe75ee22be8b2aaf3a94dc65d0fceb8af03470d5e15292b73deeba5d5bfcc5a28a2bd43e542b075ed68d97fa35b91e7b0cb37f747f8d6ed79c5eccd717d34ac7259c9aebc2515527796c8caac9a5a11492492c85e476763d4b1c9ab22c2f5a292f228dbcb5663bc3608c7538ce78c8aabdeb45757b882c64d3c2af90dbc302083c91cf5ed8af526e492e45ff000c732b7535f41d75e5916d2edb731e2390f53ec6ba6af314668dd5d4e194e41af4a85fcd82393fbea1bf315e76368a8494a3d4e8a526d5992514515c26c145149b0cbfbb0e10b7018f6f7a4dd95c6b57631350b9135cec53f2c7c7e355ab50f87951d87db14e0f518e697fb057fe7ec7e95f1188caf30c45595594757e68fada198e0a8d354e32d179333209cdbccb328c98dd58039ed44d72d732891fef050bf5c0c569ff0060a608fb50e7e949fd82a3fe5e87e9597f62e3ed6e5d3d51a7f6ae0afcdcdafa33312530cab22f5539ae863916589645fbac322a81d054ff00cbd8fd2aec1626c2054f3d6556f9863f87dabdac970b8bc24dc2ac7dd7e6b73c9cd71185c4c54a9cbde5e4f625a434b457d19e19e33e22047882fc1047efdbafd6b2abd5fc4fe188b5a84cf0054bd41f2b7671e87fc6bcb67825b79de19919244386561c835f2b8dc34e8d46deccfd5f24cce8e370f18c3494524d7ebe845452e29511a4754452ccc70001c935c67b2f4d593d8826fadc0049322e00fad7b88ae4fc29e145d3116f6f5435e30caa9e910ff1aeb6be972dc34e8d36e7bb3f34e26cca9632bc6147550babf7bf6fb828a28af44f9a12bcf353b66b4d4a6898606e257dc1e95e89599abe911ea71020849907caff00d0d75616b2a52d76665521ccb4384a2ae5ce937d6ac4496ee47f7906e07f2a6c3a6dedc3058eda539ee5703f335eb73c6d7b9cd677208217b8b84850659d8015e911a08e248c74550056468da1ae9ffbe9887b8231c745fa56d57978baeaa4ad1d91d34e16576145145719a85252d51bfbefb18882a6f7791171e80b004feb45ec05da4aa73dec9147237d9dc6d75504f43938cd52b3d5ee2eae67516e1a38e20e36752c403b79fa9f4e94732bd82cce96de5b75b49125dbbc938cae4f4e3b7ad53159573a9cb0dcac62ddb6f9424607a824f4fd3f322a6bfbf92ceda69040edb1942e067764f3f90cd2565763d5d8d0a2a85bdf493c71b7d99cee90a1231f2e3bd49a7dcbdd4523398ced919018c9c1029dc562e514514009593aa786f4cd5e659aea26f354637236d247bd5bbbbe5b59ade2da59a690271fc20f7355ef7557b4b392716b2128e176bf19cf715138c26ad35746b42b55a13e7a52717dd6866ffc20ba27fcf39ffefe9ab7a778574ad32e85cc10b1940c2976ddb7e9ef535a6b06ea69505bb6d48c38c73cfa1f7c11fafa53ae3598a09d20f2dcc8ca188c7407fad671c3e1e2f9a315f71d55333c7548b84eac9a7e6cd2a5aa1777cd6f6d3cab10062200f35b686fa1aba0e4035b9c03a8a28a00292835413558a4371b639196190265573bb23391ed45c0bf45505d5626be96d0452f991c6242481823d0739cfe1515d6ace97705a410179678cb824e36f5c647e07bf6a3990599a94b4833819eb4b4005145140052628a28101008c1008340500600007b5145000541ea01a28a28000a00c0000a31451400b8a3145140c4c03d8518f5a28a6210285ced0064e78a0a2b1195071c8c8a28a402919ea01a05145002d145140c08a6aa2afdd5519eb81451408362eeddb46ef5c7346c5ddbb6aeef5c73451400ec5145140c28a28a00ffd9, NULL, NULL, NULL, NULL, 0);
INSERT INTO `tbl_encontrado` (`id_encontrado`, `id_bienes`, `id_inventario`, `fecha`, `estado`, `imagen`, `detalle_estado`, `t_documento`, `n_documento`, `archivo`, `disponibilidad`) VALUES
(3, 2, 3, '2020-10-30', 'Baja', 0xffd8ffe000104a46494600010101000000000000ffdb0043000302020302020303030304030304050805050404050a070706080c0a0c0c0b0a0b0b0d0e12100d0e110e0b0b1016101113141515150c0f171816141812141514ffdb00430103040405040509050509140d0b0d1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414ffc000110801f401f403012200021101031101ffc4001d000100020203010100000000000000000000070805060204090301ffc4005e1000010302030405070609080705040b00020003040506010712081322321114425262152333728292a20921314353b21624415161637383c217253444718193d254748491a3b1b326353664a11855c1c319272845568595b4d3e2f0ffc4001b01010002030101000000000000000000000002030104060507ffc40035110100020102040402080700030000000000020312010405132232112131424181243351526162a1e1141523718291d172b1f0ffda000c03010002110311003f00f54d111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111071c31fd098ff00674afcfc98fe6549f35b6f7acbf7255a899416e52ee06292f1459973572438dd38a40f332c8b7c4e63877b569554ec8d31ca7aacaeab2e9635c7c576be75c71fd382a81919b70542e3bd29565e685bb0ed8abd60b16e9359a4c827e9d39ec3ea78b89b73bbaba752b81861fee484e3647286a595cab9633d1c91115aac44440444404444044440444404444044440444404444044440444404444044440444404444044440444404444044440445a2e63e745939414e199785cf4fa28162200dc87353ce163f4696c788bd9141bd22ad2f6d3f7c660b7d195393d5bad457350b75dba9e1a3c2d5de112d4f10fb228de5ded277c911dc39a16e58718be88969518a53d87fb4482d3ff0d0596455c31d8cdaac8ef2e9cd9cc7b824f6886b430dbf7596c5737761eb331d24d5d9984c10f69bbb257f1120b188ab81ec9b7150701fc11cf3bfe8d80fd0cd42447a935ff119d5f12ea9c6da832e8cb162659b9b14c6f1d5a5f65ca2cf707bba849c6f57b2282ccae8d52ad0689131953e6c7811c7e97a4ba2d861ed12ac377ede349cb4b4eb522fdb22e3b12e6890c9e8d4eab47d71673bca0db329bd4df1177b4ac365d6cd58e7242a75db9c350fe522bf566466143194436fd2db2e21663b2d969708797511172a0b4543cc2b5ae69071a8d72d22b1247e96614e69e3f74496c6abb5ff00b13e5cd7edf372d4a247b12ef86deba4dc56fea8afc4903f3b645a7d206a11d425816a15b76cbf9a350cddc97a2d72b202d57da37a9f5416c348f5a61c26dc21c3ba5a757b4825b4444044440444404444158b6fecc9aa58f917e45a0ca2855fbcea0cdb719f6f99a6ded58c8730eef4322e71764b1154c69f4b876fd320d269ec8b14da7b62cc76c7bbdef58bbcaca7ca514c7615372aeed7dddd50a8d7208545e2f471c5e65c6c1e73c3ab48fb4a9c15f35dbdde719b029ed79385cd2e5d7576c862f37d433cc7eb72ae678ac6cb2718fb5d57079575d7297b998cd1898399695e7643ed53f18ac8d422c879cddeee4325a9b21f17aaae4d33e51bcb362cbb6ddeb154bbae5954c8ef4e836dd3c9edcc826c49c0222d223c5abb4a90c1c9fa4392db9f744c997c5570d25bfaab9a63b65fab8e3c23f12dea397538e2cc510871c7845a8cd8b223eead1a37ba6ce3ad75f53d0dc6c7f8db23659d29fa77ca1d784cd4544c909bd5f570bb56af331cc87f662d969f79600b6f7ce8d245fc94dbdcdc21e5c2d5ff004d43c5c7cdc48b32e2db8fc154783edbf14f34ef941331633638d53245a918e9e23a7dc8df37aa4cff0012da283f2925a580b637758f785a0e1169274a10cc8e1eb38d96af8555ed0be8dca79a1d20f188f77529478c5f1ee8e88cb82ede5db2d5e87e5eed2f95f9a9869b5af7a4d4dfff0046df6e5eff000dcd25ff00a293be8c179155cb4a837290b954a2c392f096a6e4b4dee5e6cbbc2e37a496cd6366566a64ee01f8117bbd58a6063ab0b72f03296ce23dd6e470b825eb6a15e9d3c5aab3a6ce97957f07b6beaafcdea863d0982ae7903b695ad9c1556ad7adc47ac6bff4f1502a8e748c8f1457b95e1f74bc2ac6747d0bdb8ca328e5178728ca12c64fd45f987d0bf54d11111011110111101111011110111101111011110111101111011110111101111016b97bdeb48cbbb46ad7357e5853e8f4b8c72e5483e9e06c4712c7e6fcb8fcdf42d8d55ddbf4c66e5b5954394e0b747added458351171bd42e33d684b417848845074edcaee7e6d19106e0a3d4e9992f664b117696c4da66352acca64b95e7849c6db6750e9211e225f47b31733766ab9e8cde6957e917b65cd5e50d3f0bb188be4d9149905d3a7ad35a89b268ba34ea12e12eca95ea398345cb7a75c9715cf3daa3d02035bf9335ec71ddb423c221fa71ee88f12afd0ad0b876ccae536e5cc5a7cba2e590bc32edccbd91c0f54047d1cea9e9e51ed0b23dee22446326cd3f39f31f698a848a3e4c44fc16b2db709993995598fabac0fd18f9363fd67ed1ce1f0a9132c3652b072da67961f82f5db75bbc522e4b99cebd34cb56ae122e16c757d02d88a96a954c62954f621b0d034c323a45a69a16db11fcc223f308fe85904484444044440444418bafdbb4cba296ed36b14d8b5580f0f4391a6322eb65fda24ab355765fba322a71dc1b3cd6c68f0f02df4dcbead3ae3d489b876bab9713915ce6c78750ea2e556b51057cb136c3b46e5b6aea9371479562ddd69c4725576d4ad10b72e3080e2589365caf365a7a05c1f87a705dad8a2d89f6decef407aacdbac542b4f48ad3cc3e3a4dbeb2f138225ec90aeced25b2cda7b4651e395423b54fba69b8ef6975d6d9137193121210707eb99d423a9b2e15d5c80cf4aadc5549f977987063db99a5441f3f118e18b548fd9990fa799b2ed0f30a09e9111011110111107e61f47ccb45cdfcdeb6723ec59d755d537aa53e370836df13d25d2e469a0ed3858fcc22b297fdff0043cb0b42a973dc73829b46a7324fc890e7647e7f9870fcb8fcdf42f316edbfabf9fd7d8e61ddccb90e3b7abf062db7f8869714b964383ca521c1e2f08ad2dd6e63b686526eed36b2dd598c5d8cd3cc0bb3695ac0d56ff02a55aadb82f526c369cf36d88f2bd3887d239daddf28f0aeb91f0b6d888b4db63a5b6da1d22d8f744479571222222222d445cc448b87bf7166e2594dded1b6af6b1c602222d76c8888b00888b2088883a35ea0d3eeaa78c1aac727d96cb791df6dcddc88ae765c65c1e212539ecfdb66cfca8799b3f396ad8d42de2121a25f0e61a48b48ff00459c3d977bae76b87d650d2f854a990ab94a974ca9c609b4c96de87e3b9cb88f7bc25e25e8ecf7966da5e7daf3779b1af771fccc95eb9c17ced1b529172d72e2addab68ca2d541b568d2ba9b8dc5fab9129c1e2271c1e2d3ab48f0afad8f9d97cece135ab869971562ecb262b9aab96cd6e475a786391089488af1710b8df3692e12151b599366da15d62c2ae4ac66344def2dcaab987414b8e3fd59cfd6b7f10ff72d96eca8b344b36e2a84afe8f1e9ef6a12ed6a1dd88fb4442b665bdbe3b8d35f1f2d5afa6c76daedf1c7febd62b76e08375d029d5aa6ba3269f508edca8ee0f69b21d438acaa8a765ab666d9fb3ae5e522a4d6ea7c5a2c7179bee969d5d1f12959765a7a387d7d445c08c4071222d223f4e38af94498c4d6b791de079bfa35365ab05961d8458bb82e1a5dab489354acd423d2a9b1875bd2e5b82db6d8f888957373683cc1cf49450f236db61ab784b4b97f5d6db8cc22ff00538fe92470f68b76282ca5427c5a5c5393365350e38733cf98800fb44a1fbbb6c6ca0b424bd0debce2552a0dff0051a236e541e2fd1d0c892d6a9fb17516e790dd43356ecb83352a9d1c4dd4a4945a7063f99b8ace91e8f58894d36ae5b5a963456d8b7adca5d181b1d23d461b6d6387f788a085c36dda0cc6c8e9b96f99753c34ea1266db26c4bfc4705708db6bd3c228b93f2a3342011169d276f8b9d1eebc4ac9a20aef036e9cac2926cd6a457ad13c3ff7fd0a5461f7b490a94accce4b13309a6cadbbc28d5a273845b8939b373ddd5a96d73a045a835bb9915a94df75e6c4c7e2514defb26653660ba2fd4ac9a7469a1e8e752c4a0c86cbbc2e3388e282615a7662e6cd9b94f4c1a8ddf72d3ade8a5c8535f11273d51e62f65430eecdb98f966cef72a336ea3832cea26edebe5bf29c2731eeef874bcd8fbca8467259d9ad65df754bb73d2d1a8d56a525e737375d3b0f2952a1c7e6ddb6d88ea8ed8f788507a2343dbbb21ae1aab7022664d3424398e96fadb2f476cbf78e3623f129ce24d62a1159911dd07a33a381838d96a1312e5c70c578caccaa7dcb49190c793eb5497b8778d36db8d9784bbbf0ab3ff275e62cfb66ff00b832a1d98fc9b68e9e15ba1b325c270a0f1697a3897d9f685434d52c5e8322229a22222022220222202222028836a6cab919c19257050e9f299a7d723e0dd529531fc444199919c17992222e51d4d8891774894beaad6d59754fcccbc28790b6dcd760e35c64aa5775522974394fa28161a9b12ecb920bcc8fac4822acbe9b58db46b144beeefa51d1f2bede31729f6e3d88e9aed6430f3d29ed3cd1d92f47de575ed2a59c78c53a57494c95c4445d91ec8ad1ad2b769ec1d2e874a82d5328b4f64598f0581d2dc78edf288a96f1c7a11569d4fd44445a22220222202222022220286f688c89fe57e850ea5439b85bf9876f3bd7adcaf061c51e40fd5b9de65ce521ee929911044fb39e73619d797e3509f031a2dd34b9074cafd19cc47138339bc74b83ea973097e51252c2ab79a60e6cf9b46db599310771685ecf336edd4238f436cca2e18530b8b48f179b22ee92b4880888838e18274fe44c7f32ac1b74e765472f2c4a7d9d6b4aeaf7b5e6e953e1bc2586a851f4fe312bc3a4794bbd8a84a5a4639492846564b18abb6d439ca3b45e693f6ed35edfe5859533448e8c7cdd72ac3d9f132cf2f88b57370ad21c749f709c32d4e171112e8d1e8906daa3c1a3d2dbdd5360b7b967bc5de70bc445c45eb2ee2e0777b896e6ccf47d0f65b78eda9c34111169379c8448b569d3c3c44445a447da420d0225c2425ca425a84bda50c6d5d0ee39d97507c84321c86dcc22a9371702c5c21d23bb22d3d9e658ed91a05cd0ed5ad156464b54971d6fa8352f574ef38b784225d9e55bdfc37d1ff88cbfc5a1fc4fd27918ff00927645c8475f77879888b488ac4c8bb2dd8af6e5fb928ad3df665526757de5a7a475937652c7b994448fa6645eb115c6a647e6dfc6705e1f785163d19f51104088844788897279a7182d2eb64d1774874a26e288888b057c59eddfb6d3d49c0fabd45b2eb54c9838f146983e8c87d6e525baec8f96759daceeaa6d5ae5a53b49b1ed490255a65c21fe78adb25e8447ec5be170bc4e08fab87fece6527ec697e165e6d2d53b5df785aa0dff004debd1db222d23548bc2e088f79c64b517ecc57b7c327095ba5767f8bc4e291b2354acafe6f44443001c0470d2382c3ddf74d36c6b56af71561f18d4ba5457264a7cbb2db63a8b1ffd166d437b5f5bf50ba765fccfa5d29b764542450250331d81d44f16ecbcd8fadcbfdebb270ef38730b3a6f3da465957ae9ad54a916dcc2df52ed3a5ca28ecc78ff56521c1e271c21d3abb2b52a6d76b59393a9f55cbeae576917548902cd369712439386acf6af425148b887bc5d95d666e9a743b12975f1c09f807163b71588dc4ec878844463b63da2d5c2afe6c53b273997304331afd8ed4bccaabb586ee3106a6a83171e218ad7eb3ed1cef70f67a4aa8e5aa4c9d93b3a5dd9d5269b766d0f319aa49605b7a0d854e221a553cb4fa47b0feb0f6aef708e9ed2b41162b3063b6c47641961b1d20db63a4447f3602bb28ad444444044440444405d7931da96c38cbed83cd383a481c1d42587e95d84414df3f7e4f6a05d72275d395521acbfbd5cd4e391c47a293522e9d5a64323cbabed1be5eee2a30d832cfa8533695bc0af98ac5a37950e8edd3635b6e3da9c90045a9c98c972b8cf0e91d3cbda5e8ba87b681c82899d147893204f72dcbee8a7d6a8172c5c34bf06461ca25de68b1e66cbe624130a285b66cce99b9a743a9d1ae986d517322d691e4eb8e92d9708bdd990cf4fcf8b2f0f43825e2d3d9534a022220222202222022220c35d57240b3adaab57aa8f6e29d4c8ce4c90e775b6c7517fc9558d9ae8f3aa36b55f332bc04174e63cbf2c3c05ab545a78ea1851c75728e9e2d2b68db82a8e5c56b59b95109cd333312b8cd36469e61a7b3f8c4b707d96c47f78b77902cb45b98ad8b51d9118f1da1e516c47488fc28aa7ab73b020e88b226161d04f1691f5456dcba14787853a991638e1f336d88aefa25111157ddacb6c9b3b646a2d264dc4c4caad4eac64306974fc0778e0869de38444422223a87fdf8226b048a18d98f69eb536aacbf2b9ed6c2445c587b18f329d374e0fc573f2605a712c3e7c38854ce808888088a84edff00f287d6365ebe29566da5458550abbd18674c9752d5bb6db22e16c4479b561817174f0a0bec8a0ed8ff0068a6f6a1c93a55e854ef254f271c8b362016240dbcd9692d25da12fa54e280888823ecf6cb3899cb9437559f27101c2a705c699788756e5ed38936e0f884b012582d95b32e666ce41da55eaae0435dc23e302ac07cc33a391312357ef1b252f2ad5b3f86397bb45675e5f6ec9a813273378537022e1ddcc6f4c8111ff586dc2f69059544441c71fa3f42f2aefecc22ceccf1bdaffdee1228f15e2b6edb3c0b537d4d92d2f486ff0068e6af795dfdb4b3465e53ece377d5a94f62dd765b034ba5e92e3eb520b72d90f8848f57b2bcf9d9c7666ad66379729f0af29941b4e82f0d3f7b199170a448e670478b97c4bcfde572bebe5435f57a5b19c689f3ecd3d19a73cd0ea3e11ef12f993ec8733c03ed2b1f637c9d597b5192f395aaa5c75e883ca32676ec757b2b766be4e2c9465b312a3d4dec4bb6ed49c221f5578f1e0b2f74dec4b8e47db0526a95e143a46aeb95686c108ea21278750ac2ff002bf689fa2ac37274f36e1b70b4fc2bd2ab3f639c9db205a2a7d854a724b7fd6e5b5be78bd62252545b12dc83fd1edfa5c7f9b4f9a86d8fcdfdc2afd383d5a774944b8d5ded8e8f2461e67419ee7f3241abd71e1e121a6d3de7887c25c2b76a3e5e6745e843e48caba9836e0ef1b7eaaf371474faa45c3eaaf51e15169f4ec7a62418d17f62c88ffc9647a3e65b30e17b78f779b567c5b712edf27965706c9f9e77052fabd572e2975387ab7dd446b0db64443cba8b57f12d06b993f53b345c8f706cf52d8704b4ff0037d2faf37fe23645c2bd88c070fcc9a7057ebb1a31c63a63f3511e21b8cb294b2f968f1219b732f98aa8e34b7aa1973710f108c72721b8d978a3bdc24a43b71dae9b321bae141984d90f57ab402d23307c4dfd590fb42bd45be3296cccc886e45b9ad7a656992e6eb51c48bdee655daf1f9386c5924e4ab2ebb5ab166172b515eeb1107f725fe65a17f0cd6cd3a65fede8d3c5f97df0ff005ff144b684b82e1b632ba6ceb6b5b7277cdb72a4b23e723c72d5a887dad23a946bb23de776dc53ab706a8f49a8501a8fbc19120b12dcc8d43a444b1ef09170ab8b7fecaf9d59570e4541a8f4ecc3a3323e730a5890cd26fb5e64878bd51d4a24b7ef7a0ca70a96c32ddbd3192f3948931faab8db9e26cbb4bcf9d36edb6f2a655e5f99e842fab737c6e8d98fe56cc888bc27be2c4dc15e7acba959f7a45737522d7b821ce22ffcbb85b991ff000dc596589bc293f84365dc54bd225d6a9ef08eaef08ea1f8856c6de7cbba336bee21cda6507ae3165b73a2b2fb5c4dba0263ea92fb17469c7572a8b365dbd4b30f676cbcb81cf49328f1f79eb08eecbe21c56afb615f956b7b2da15a76bbfd5af3be67376e525de9212609ee17a46a1e5ddb7a8b52fa269e8f9b6bea81766dd9b6c9cc3da4af2cd3a241730cb8a2561e6adba738e6a8522a83c332732df2eec5c1216fc5a895f75a9659e5fd232a2c1a0d9f418fb8a4d1e1b70d81ed16023cc5e22e62c7bc4b6d596045d695299831dc7e43c0cb0d8ea371c2d2223f9f125055d3b6de56db1537e0e1587eace33f31394b8c4f37abba2e72962827e455e285b74e555666b51dda8cea5ef4b4efa743705b1f58bb2a79a754a2d5e135321ca6a5c37875b6fb0e09b6e0f78487e941de44441f9d382fd5a7666e6551b29acd9f72d75d26a1451f99b6f89c79cc795b6c7b4445f360bcebcd0da9f30f3426bdfcecfdad4622e86699497349e9fd63dda25194b14bc1ea2a2f1e21deb74536537222dd95c624365a85d19c5ccac6649edc75cb6e6314acc573cb34573110c2b6d37a64c4f13c23e907c43c4b1918afda2e9c1a8c7aac2626447c24457c05c6de6cb5098972960bb8a68ab1ed3b449b94f74d1f3f6dc60dd91436c605d3058c3e79f4722e22fa70d4e3245ac4bbb892b1747aac2b869306a94f90dca813586e5467dbe571b31d4243eb092fa5429b1eb34e95066342fc594d932f36587489090e92155e363aa9c8b3bf0ef266a2fef65e5fd5b754e2222227293247ac442d45cda7538d7ee905944444044440444404444152e64c1bfb6ddb8a71638bd072f2d56e045c4b959a8541cd4e7b5b9647de52f50a1f5cad4367b3bcd45ea8f12acbb39e6f5bb5bcc7cd909f3821dc973dd8f4986d3f86ec65478c3d55b16c8b98bcd9708ab6561c5d7547dd2c3a3721a7de451af549bf22c7d5eb14fa043295529d1a9f18399f96f0b603ed1289eecdb03286ce731666def4d93334f044a79f5a71c2ee88b7ab8917a68555f6dcd87a93b6052e84e956ddb7ae1a1ef861cbddef1971b73a3126dc1f58471d587f12ecbfb4a666662476cf2c329a73b0650936dd66e97460b4db9dedcfa4215c5bc9eda16f971b7aeacdd8968b7a7a0a25a503ff0098e20e7b33e40d93b04653ce8954bba3039509032aa358aa3a115a75c11d222d8917cd80e1d3fa497daa5b72db75699d4f2f6d5b97321ede6efacd1a090c4d5fb67348accd8bb17d856bd406ad5cc2a17d577a7514fb92514ae2ef0b65c22a71a5d220d1a28c7a7c2620c71f985a8ed8b63fee14159a76d279d8e8f452f67aaa39a71e8239b588ed88fba444bf63e7ced131c0a44fd9f1a08a3fe8d7232e39a7d5569975467c623c5bc24344e0f675e1a9056e8fb65d420622ddc392d9874a7c7d2631a9edcc6bde6dcfe150fed0b5cd98369e3a748ccd6ae1b62ab4ec310666bb4d950dec1bc7eac8b764242afdae84ba1d3aa187e33022c8fdab225ff3410f6ce97364c502c0a35a79577050f1a3431c423418f2c7ac191711110979c22222d445d1f954e0a13cc6d8fb2ab336414c9f6bc68156e2d352a5fe2af8e3eb0a89a76cdb98396adeeacace2b8e94cb05aa3c4abfe3911cf096a41715153da7ed479ab94b880e6c586157a2e05bb3b92d4c77da7c451f9b4a9cac6da4b2cb31d8de50af3a43ee7d0519e902c3c25dd26dcd25a904a0ab566b833676d9993f731b9a5bb8a9750b5dc1e9e621d3219fbce2b1ccca66433bd69d071bef096a154776a7da72d4ac5df65b76d47935f9166dd50674aadc60d54e644889971bdf77b8bd5f120bd28888283fca1776bb5bccccbbb2e3e0db91e8ed48baa60ebe2de3624dc7121f11174ad9f629a74387b39db6f452debd39c7a54a77bcf1385abdde555f6ffb9f1cc4cfdcd5bb7171a7e21549bb7e9ee35da8f14788bfc45346c2754ffea86a14906c9d6e8b5e951db112e2212709ced7acbcca2fe66e6c8fddf07ab7d1cbdb552fbde2b518d0af8c1d28d02a74ba5d3348eedceae4f48d5dad5d95f8366deefb24dc8bec47f289b14b112fbcbb726faaf47944c8d9153770ecb83223e92f89759bcc0b9bac934ee5fd504bb2432a390fbda97a6f29c5ccbfbaa4c76db957ecdc74f314486db245ed6a5ccb2945f71b79fbaee43903da19da70c7d9d2bf1abe2ef2326cac19605d9c7af47d25f12f99667d6a1bdbb9f60d6da1d5a7791899903f0920e6392744c65f5872a15a7cbf2ef6a04424b3b6ed854bb61f27a2759270beddf273a1621cce2a1c20c1ca843abd31bfb5974c7847ded2bbf4bcd5b46b5861845b929c45f945c902d97ba48367906e03264d060e3980f08917474ac357e893eb31da721d564d1a588fcc4d602e07b43da5978f363cd0c0a3bedbc38f69b2125d9411b3951cc7b69c2dfd369d7643e9e784e75593a7f665c3f12fb44ceca10bc31eb4ccdb6259169dd55e39343fe27a3f89486bab360c5a9304cca61b92d17cc40e0eac10728d2199ac8bcc380f325f38b8d96a12515e76ece162e74d2f1c6e0b6e2cea835874b32db1ddc90f55c1fcab37232769919c27a8136a16d48ecf5078b77fe1970af9e2ce62dbbab43d4dba630e1c22e7e2b20bf87e24142f323653bcb29f7952b0e649bce863e9285502fc759fd9976bef28e6ddbad9af3d221bb1dfa65622969954d9cdeede64bd525e90d5ef6a5f49635ca5d42d4a8605e9e547228e45fb46f50a87b37b676b1f3e09ba93b20a9f5e6474b370511e1df787569e1707d65e56eb87537f547a64f5f6bc4aedbf4cbaa2ab6bed0c37b29b6cb95cf365ea970ff12cc5c9b38e6e65f71427a997fd3f5696f4b9d56697adab48917aaa372cc47a97527a9f26ddaab57141902dbd48267ce365cdc5e15cc5dc3afa7daea29e2345de592f3fc9bb56767ecc34f84e8e92a3d5aa14d11e9ecb6f9747de590a1b4e6696daf5ca93b8e0ed172e290dd3e1e87387ca130753c443de16f87da5a6fc9915275fc9ebc5b90271dc6aea98e132e7d0cea16c88752ddb61a01afe5edd37e9c7eaf26f4b9ea557c7c4cef89b67e115db57d9170b677c964963ab759836ed265d52a72421d3e2364ebcfba5d02d88fe5591549fe500cd3731c69397501ec45a7806a556d25ccdead2cb25fa088488bd5156eaa908e7f6d1b5bcf6ae3cdb7224536cb65cd30696d969eb43f6cf77b57647b2a2611101d222223dd15fab4dcc8cd6a5658c789d7633b3a64bd44dc468b4f9bef112a7b96b732e31d25c62ac46c599d532c2bfe2d933a51396c579c218adb85c30e67674f85ceef785556b1af7a76605bf85529c26c600e6e5e8ce7332e7756df6ecc729b755bf31a2d2e47a947704bba5bc1ff32768f63b05fab8896a1e9c17257aa79f9b7ddf922b799b47b4b0321a751a2f5e71b12e172439cbabd51d4ab288f091110888f31116911f694ebb6f535ea7ed113dd743a1b9d4c8ef325de11e12f89520da7a1d7e55228a54f17dda337abad0c7c08b017b5709169f0aa3dcb53510907376b887c4bf1469b3c45aec2b05c0ad8be2c948d54f6e47360de9e2f675292d605b9d82f3a24c1aabb96754938b905c6ca550c9d2e26f4f1391fd5d3a887d52579578fd6056e45b198369d5a316ee443ab45212f0938225f0912f5f5b2d6d897e7156c5093e8aa466e5e744cb4db6b2d6af1ea21d6ae2a6b96bd7638970c712227a038e17289138320475717129ab3cb36472bad9646131854aeaabbdd46874b12f392a41787ba3cc5e1c143b997b35caa76cb977c639de5ecc77b16ee4955d7c78dea8c6217834f74445b26c47c5e253456bd169793d7db19a195b6b5d51f1d4dd5a9ccca2f58878b0f7b52dd1011110111101612f3aa6141b42b952d580e30e0c891a8bc2d917ff00059b512ed6159c2dfd9b331e76ad3bba2481e6d3cc3a7f89057cc93ca6b7f30b651b0a9b77d2589c5508af5637a3c2f477a44879cd4db9cc25a4962edc939d56bdfd332a6debf20caa3c7823521b8aa90f7d3e3c72e16d973bc5dd2f0a9bb2ee9036e657d8f4b6c748c1b7e0b3a7f72245f1112d172fc0a2ed259a4ccc2d131ca7d34a2b45cc51c75710a2a8f73bb6cec7b43bd6b58d53302e4aee61b8df11375494431b5785b1533d0726f2c72d6236302dba1d21b8e5bc175c65bc084bbda897d625ad50aed25918b5c7e910dcd5be08823bc22f5bb2bb30b26ada8ae8bd2a33d549187d2e4f789ec71ff7a2d72a8e6f5b14ff00331a6f94a46ad231e9ed93c7f0af83d7add33ddd148b45edde9f4b527859f856d11e0d16dc6489a661d39b1e6d222dac6ccccfb5207a6afc11fdf0a0c3b742bf6ae4253ebd0e90dfd953d9d45ef12da68343728ad16fea326a2e97339249609bce6b29de5b8a17f88b9bd9b769331f17b1ad4721fcc18f4920db1d070c9bdd9e01d05d25f37360b0759b0a855f22297044dc2e63122125832cefb4070f9aa589117605a2d4be7fcb550f569ea957ff00f4f738be141fa59294764b541a85569e5fa8985823b60dcd0349d26f399a87eaea2d8bc2be839b2cbad938d5b5713adf64869ae712e259a920dbd4d59f7091774a190a0e051332610ea09f45a978499265703ae5fa0c90cdb469f31bed6e260f17b24bedfcaab8d0743d695c4d177460917dd5cdccda891f0d52a895f881de729ae69fba8351a855e779cd565d618d5e91a6845e6c96832b2d32c731aa04352b2e19ce11d442ec528ee0fbaa706b396cf31f3d586a197765e1bb2f896b136f9a4ddf53e8a74e8cf88f0b62d90ea415233b327ad7a365dc7a8511ba95227397045a4b9123541c16dc171c11dd97ac2ac7ed0393942b6b649beed9b42890e9acc7a5b9223b0cb7a7a5c6f4b9a88bb45c3cca2fcc731ab5e797d4bc5bc4a2d72fe8b2b767da6e396a2fbaae2dc14ff2c50aa7034e05d66338ce92f1090a0c46575c7f8659696a57b5096353a4c59858896af9dc644bf897c3376f71cb5cafbbaea2d38e346a5499c007f41136d9108fb4580e0a3dd8aa613fb3459d0dde9c245246551dd12fa44a2ca7a3ff00f2d6a5f289d60e36cdd3286d740b972d5a9f48d5d3f40948171cf85b255ce58c724e11ca78bcfab0ef5a3d26cfa4d34a43b3aa1bb29533a8c771ef3cf16f1ce211563b607b9a09ccccaa1f9d8d5272a83546e33ed936451c87489692e2e651abcd32d3c42d320d363c22223a79560ead02a902b14fba2d99ce52aeaa4f1457da2d22f0f69973bc24b91da6f215df94a3dcecb7bb3b2edbe31976bd62b6ab03558186045d321ae173fccb338e1f3aa799059f545cfbc1c8f29e9f665e54f6f773a9f1a46ec9bfd637f68da9d70633268238bd02a549bbe0e9e906a60755905ea90f0fbcbb1d3a9c5ca38250451a7f2d0cd1f1c5bbaedfabdb043f313efc7df44ff19bd42b73a0dd547baa36fe91538b5267bd15e135961947005c1d263810f8961aa1645bf55705c99478520c7b44c8acea20d1aa3931674e1f9a8cd452fb48644d97c2ba6ce4eb34c1e8a35c95da537f663309c0f74948a882387ac4bca0191d2efa79cc4bea6a50c5e1f797622ff29301ae87ff0007aa85876849e64b1f874adfd10474f662dc544ffbeacaa80b7f6f4b70650fba3c4bed4fcefb4a64818f26a074a905f575361c8bff0050456feba33e9106a8c1332e1b325a2e6075bc0907266445aa46171a71a971cb9487113125a0deb96f6d8b255061a768f522c7e67e98e6e4dc2f177857cab79496e5205c9f49953ad691d92a4c826c48bf67ca4b479af5f71e436584f8372c51e116e58f577847d61e141f4b99d7214ab5db1708de72a4db25fac1d25a89519ac5c3f86f9d9989740e9eaef55069f1c87bb1c74917bcae067455e45a56dd5af07c9b1836fd265488ed768a53822d8fbaa91e5fd39ca459f4d6dfe294f37d69e2ef38e79c2fbcbc3e2d663463f6bdce0f5657e7f62c1ecb573b96b6cedb4b4d07716dea3cbaa4d0211d2425d4750fddc15a9d966dc3b4f672cb8a3bda717a2d0e28b858768f762445ef638aa2967ccea1b35ed73141e12709c6449b22f47be8fa757ffeeeabb9b3b6745a198369d3687499fd52bf4986cc79b41a807579b1c85b1c0b5325c5a7c43c2bd1daebe3443fb3cddd698df67fe5aa685e546d25567ab7b405f521e22226670c51d5d96db65bd22bd4f9325b86c1bcf380cb2d8ea270cb488e0bcbeda64e97746d055c72c027efa0a90b2f3836dc729c2cc8d3bb26c89bd43d912f696c6ad78a2a5a366965440cce621b8f4ec69b3a1890b7274ea126fba42acbd89b1be6ee62bc38bf4e62c2a676a5d64b7924bf66c8f297acacce5d7c9e796d6bc56dcbabad5ff55d5a89fab9e967fb0591e11518c59c9e6f653d8be438185af64d367deb5679edec8f26b3bc2de728ead3c2d8facadfe5cec0798558c62d4ae9b969f679364321b834f8e339e17071e91de1170fba44ae652deb0b2ba00d268ccd2a8e0df2d3e94d0ef3fc36f896d345ac6158649c0892e33587294b649a22f64b894b1632402fec935ead6fb0aee78dff00538ef7a68cc4c18ad961ddc0479565a97b1ed0a89ff77dfb98f13874f9bba1ec14e8f3988e90c356a3e9e8311e9d2b53a85bd78b8e6250eec61a1eeb94d12fe25345105dfb0cdab7eca8b2abd79df556931449b8ee4dae1384d89730f2ad2eaff26ed00c7550efdb8e90f768a4eee6097b24ac4790f3070fa2e9a717ad4fd2b8e1173319c7a065db92070ed3a2f0963ee8a0a59746c057fd0cc9c837e516a31cb95da9417192f6b7625a5455726cfb9b16793c52ad36ab90dbfeb742942e6f3d56cbce7c2bd2bd1993d1a4dbb55c1f13923fcab1732dfbda4f11522da173bccca903fc2a18c52c9e5b58375db6199d6cc1b96a5f83915ba932f4e2aa3651ca3b6d96f0b56af574af4ba76d7795834e70a837540bb2a7a7018b44a0bc3266ca73b2db6d0f1638af84bb76b8dca6dbb86dba41c32221eb2d382e767ba5c4a21cc1814d817458631e9d0a15569f7fd2d96e647645b709979c1e1d43de6f856631c514c99479595b95754bccbcc2217aef9cdeee0d2c4f791e8717b2cb7fac2fac21e62533bf1db96c38d3a02e32e0e22425ca438afba290adfb163ee5bf6d5f397321fc1c9164dd132032de9f470dec7ac47ffa85eeab20ab65be7fc9fedd3725377611a9d7ddaacd49b2fb69909eddb9ff000e40fbaac9a022220222202adff280d57185b31dc14f6e31cb72af2a1d34586b9dc272401691fd25a74fb4ac82ad9b6644c2bae64edba38f1546fa82e90f78596de70906954ddaa2c519b1e89713155cbcaa08030dd3ae78651f762db62dea273d1f6564f3f6970ecdcdfcaacd0812db1a7cec70b76a5241cd4dbd1dc1d4c96af587e25275c341a5de526440aa536254e0cc95c51a5b22e090939da51167eec3b12659d50772d2754a88f31206a816ab5248a9731f6c84874b25c2d97369d28ae09fa94ddc75086e46a55420d34592e8f3acef1cf5976a565e562a64df5ebd2aa423cc310463eaf7544d91b9f14dccba6948a69394fb8a9a22cd62852f864c5707848487bbabb4a5cc7362971e27589506aac0f6b4c075c11f68451638c5c97b59b7b07a54376a6ef4ead550789ef9fda5b153ed0a252088a1d261c622f9bcd3222b5f879d1664cf98abd1621f72596e4be259ea6de542ac63d10aaf0657ec640920c90c08c03a708cd0e1ea60b9f5767ecc3dd5f4d7877b05c907c7abb3f661eeafa68c3bb82e48808b1156bae8b41c07ca355890b572efde115ab4bcebb619336e3499153707e61ea319c784b1f58474a09017e7d3828aa6671d5a5010d1ed3906e7e472a0f0b23eef32eac8bdafa9918774343a7bc43c5e91cd2836dbd6a2ce2d153c01b3d5e9b50f67baa3d99028f4665ea9793e1b0e4712217c5b112f7961eacd5d8eb72a654ae462336d8ef0bc9b4f171c2f64946799d9aaf5af4ba3d26a9165d4ea139edf41a78888cdab10f2b7b96fd1b7ab4ea2241b6579d8b71ed1592f4f2dd8ca8a33aa9ba2e611dc92b5aaa665dec8857eca9d79679350ee1b92a4d8b716931848235223f4ea16874f6bbc4b6b7f624b1a92fbf32cea95c761d51cf9864d0aacf3623fbb22d2483e1b3c57697970c676532b53a3d260db9784b9d21e7cf76db31e5478f2c4f577753ce2a95b466d4e5b49e60d8343b7a812e265f40a8c8abc5afce6c84aa4f478ee362423d967cf70917312ea6d2b61d6689b45cdb3aeabc2a173d0aa54387723905c65b8ed546432e391f54816f9b762db7eb6a58d2748c74f28f08e911d22223ca22b9fe21bee5e54462e8b8670fe6637ca4e247a888bbc888b92762d66ecebd6bca877c5bef143b8a824321b75bfae644bce365de1215ea2d939934ba8e5e5b35e70b7506a30db90521a1d4cb1890896922ecf3695e6e488edca65c65d1d4db824243de159bc96cfdbcf65e8eed2429a57d65d62e6f0a038efe374f1ed6e75730f8574dc2f7918c79564bfb396e2db394a5cdae3fddea2b6e33358170310799730d425871092d3ebf9396a5c327196ed2c21d4356aebb031eaef7bc2b40cada9d32ffb799bb7296e96f0a4cc3d6ed166f9c8cdb9da6c879992f08add4334c68c431eeca748b75fd5a7ac1013911cfd383c3c23ed2e9dcaba9f8097b5b85aa817895459d5fd06e26f7c3a7f6c3e717e0e635d36fe91b9ac9998b3d3d053a865d71bf5b763e707dd5bfd36ad0ab30865c094ccd8ce72bac3981097f7aef208f5bcefb5dc8fbe64aa2f8f6b774d78887d6e15f4733a282d4519451ab3d5cbeb7c93234fdd5b15d3330a7d1dcd18602e39e6c547ce4871d1113708847bc8336f6785b8c461904cd5f745ca5e4b7b8be15f37f3d6dd61b173aad609b2fa48696f70fc2b0eb8a0ca4acfcb7e3b6db8d41ad496dced374b7bfcab848cfba2430de49a6571863f23a54d73fcaba0b8a0c1d5f3b6ddaeb9d6319c6d471e116c992e1f597e3d7a5242db7ab91e5373208f08937da73bbeb2e57a5662d06dd953255620dbcdf2f942a1a776d97b4a9ee616d1f22b756729796f224dc6e325c5735487774e8af77a3b3cae178942cb235c7292eaeb9592c6b8b72db7332d9a0e53d36cd95304ab5724a6ca7461e228f0c4b78e6a1f5b488faa4abb8e6adae0d8b6129f1111d23f8ab9fe5594a6dae2d559ead55a63f5cb824713d529c5a8888b9b4f74566b48f747dd5c7efb7956ea5dbd31761b1d95bb58f7699498ca45eb02af947b46d3e9f29d176b102875164b77bb2dcb73063bdc25fb61f797a3b98db3bd9b9c74da5c8add3ca356e1b21d52b54f3eaf363f6b0d2e0f169d5d95e5c671511e9f4da24c852df84f79462d2e50c6e129715f90d89325ed6921f557b310b0ddc28e1dd6c70ffd1743b0b6366de38fc3c9cdf11aa54ee2597c7cd446c0ca9ad666d62f2a6dff00989735e36bdbf5c91478f4693309b6650b25a779234fa42f0f2ab43693965650d023dbf6e52633124477be46a045d4e0917784797d625125aaf0e5c67bdfb625475048af4e7aeca2bfd9951dee2923eb36e6af674a9f23de347a7c71c21457a74921127069b189ef39a7b442bd279ae116b778575bde45a147a2b25f30f959fd4e7f6e96f57c48797b26b8d10dc95b9953c0b9a3462eaf1fd5d23cded2e4570ddf541c42996e354dc31e59357903a7fc36f8921da371cc6f02ae5d2f91fe56e96d8c76c7dae6419fa15ad48b5e2f57a553d884cfd388b41f4ac93921a687123700447f2912d48f2ba92f98e3324d52a780f6274f71e0ff007112ed339656a358e1a6dfa7ebef1b038920fda96655ad49c0fad57e9ed10f67ac0e25eeac6379c34292580c48f579c65ca31a9720ba7e15b543a15369bfd160c763f64d88aef8808fd1861820d45bbceb52b0e98d67d48b0fd7bccb3f7897176bd77b987e2f6bb4cffacce6f1fbab72441a604bbf1f6f561068517c2f3ef17dd15f513be07e96adff00f1247f95676ab5ea75063f58a94e62131f68fb8222b48b9b37a83d4899a7ce29ce39cc509927b48fb2835dad576e8a9547a1d894a365bf37e6e439ed17128ab36e8bd5aebb02a3848def5abf28e4e0fd9eedc16c456e83982db0f175fa4cca647212265d97a44a47845be6d4a1cd377ed19745168b633add263da3566eb554ba6733be8855012d430d91fac26cb9905ee455fdcb2b68a0f4598d6a3a3fada290fdd4c2d0da3bff00c7f6763ffe4ee20c46d5278d999a5911984d9e2234fb98adf983ab48e31ea0cb8cff00d61655975e756de77fe66e5fe5742a5dd955b52b739c98cd5a2b34b8af3729bea6f36f6fb8b84475088fef15fdb52b0ddc96bd1eaccb9838ccd88cc8131ed6a1c0906611110111107e63f42ae39dce0d5b6a4c92a5e9121a5c7ac579ed5d9116d9647e270958ec7e855a2b12f0afed93703a1d271adab1e3c4c4f0ecc89929e221ff000d96d10976b7fa1b5bcac53c7f5c2a58c7e8517db43aabf07f69fc24a50c7e844608633a3666a066bc86eb94f94fda77c451fc4ee4a5f9b7c4bbae7da0f8494739539b17c65d664c3cafcd565a2ab4ef3949b8a137a615507b4d9775e56b9449b47e4abb9d3600c0a75431a35c94d90351a45487ea64072eaf0976916a49dc53263c6deee2bae0f30e91225879f95f69d4cf54aa04174fbd8b2aaecacfdab59aec6a7e7cd8950b6e533a5b1bce85a9e8445cbbc221f47c4a76a1546bf59a547a959f7752eeaa4b83a9b37f49110fed050659ec8fb508b54586ed34bbd064133f751ccab79a6c7085775c31487975ce2787dd25f0c6f8bbe9018e354b31d9223f49531f173e15f6a7678da734b75267152650f3479ed9366283f02c5baf7051cafb9651cbf2f536c5cff13996b75db369adcd7189efd42bcf34223bca94a27044bc22a4a8b7a50678ea8d5884e8f85f151e572b707ae4c94ece8c2cef0bce939c2831eddbf4b8fa7754f61a11e51d2bb8db4db43a41b111f08ad6e5660d3f7dd5e9b1e556a57646237c3ef2e3aef2ab7660db91cb878fcf3c2836495299871ca44a7823323cceba5a4560e9f7a43acd4862d362cb9cdfd64e16f4b023ded45ccbe71ec0a7baf3722a8e3f5e9c3f5b2cb87dd5ade6467eda7959321d14864d7ae291c316dfa137be78bd611e5140cd5beae8a6dc16ed9961c382fde1706f0999354e28f0d96c7513843da5bbe456ccb072b6a732e8b86a8ede398151c3a25d766e1e8c7ece38fd5b6b5ec86cbcbcee6cc57b33f3068f1adb96307c9f47a134e6f1c8ac916a2270bbc4ac9a022220a23f283d1dba4e71e4e5c8db7d05516ea56fca73c242dbccfc4db9ef28295a7f94b690f1e45d12e48a38758b66e7a7d44dced0b2444cb987fc61557a60884a7b4f2ea2d3eaae438bc3c2d8cbedd1d9f059e54ca3f66af8a222f01d00888b2c7ab0f4a8b5ecbfb90ae6cbdae3f6ad7b99c69b2d5126785e6f94855c8c87dba2dfcc5971ed1cc1841665e4e08b62d492fc42a05fa970bbddd2553d636bd6e53ee58250ea51c64b25cbde1f1097657b5b4e25653d367545e1ef385d77f557d327a3570e4fe14aa89d6ace9cfdbf28bce38dc22f32e7acdf290ae844cc4bee83fd3e9b4fb9628f33905ceaef7ba4a9a64ced4f78ece3fcd770b750bf72f78776e01ea9f4b1f6bd237e15772d4ba2d8ce7b619ba6c6aab15482efa406f84c4bba43cc25e125d5d56d77472ae4e46da2cdbcb1b22c25773be8f567598b3e25428921b12226274721f89620b32e8e4f0b70d9a8541c2e518d0dc2f896d85dd21f6497ead86bb50fc2daf4a6dc28367ccd425a7f1e90db3a9722957a4d2110a7d2a94d9733aebc4f10faa22b6879d6d86c9c75c069b1e6222d2b41bd3682cb9cbe279baede14c8d29b1de1446de171e2f55b1e22467c1941b36b13db11aa5d931d112d5a69ed8c7d5eb10f12ca516dca4da8dcc90c138c36e79c90fc9788b97b4444aafdd9b6e562e3291172cad371d8e5e86e0ae8eed92ef69679bde50edc4379661b24dded7d556af149cdf793e339d5e3097aa2b46fdf5147ac9e851b1beff48be97d5c6ded05999705cd5171d976cc5905068b11c2d2cee5bfacd3de25908b159851db6586c5865b1d22d08e91115f3a7c08f4b86cc58ac8b11d91d22d0f65761719badccb7164a5af6bb5daeda3b6ae31d3b84445a6dd6b3980fc6621dadd6dc06e215d74ac1e71d2d222d8c96c8888bbba4497a0954db972768b2faa05c8f54c9be1d54ba7bd29b2fec26c74af383396b6ddbf865e4b7608d55b62ef8328a9ae72cc6db22226cbc2423a7da5eafe495f3666645870abb64b5158a63dc2e4661916ca3b83ccdb823ca42bb3e131f0dbfcdc3f1897d2be4a9bb41ed3f665d752b3af0b7295719d62d6aa36f0cd7e92f32cb909ce192d96a1eee92e256a6c7cc7a54ba1459d0e63150a0c86f7d1e7305a845b252438c36fb64d98093643a484b0e1c70500ddbb27c38551935bcafadc9cb9af196fce3441de52a539fae8a5c1c5da21e25ed3c44a923376cc885a5db969cd97e627903376ca7396e8a563fed42a1ecaccedbaa817d43cb9cd5a646a25cf2c4b1a6cda7e24e53aacd8f3132e172b83da6c94e8f5c742299d4df991065618e9dcbe4225fee241d31cd0b48f96e3a617fb50afb379876cbbcb5fa717fb40ac89d26992be98715dfdd892eb3b65d05ff4946805fdb1c5071fc36a06922f2cc1d23f3963d607e6586733528ef8eaa48caafe1ab4eaa747271bc0bc4e728ac9165cdac45a8adda6117e986dff009562ef86c63634f8ed08b6c881e96c7847b2831b50cc5afbb86983468b10bed27c8de0ff00c35aecf2b86b6e89cfb9a530cffa352c7ab8fbdccbef2a6c780cef253cdc66c7b4e96915aefe1ab952737743a4cbaaeafeb65e6630fb45cdeca0ca336cd2d89432ba9b6eca1feb327ce39ef12ec52ead0eb8f38dc094d4c26cb765ba2d5a4bbab0e56bccadea1af540a4b25fd46179967daed17b4b4daee763345b899b2f2e6db7ef8baa3e91ea54de1854dee94a7b95b1d5d9e64189c28b706d355b9f0eda6ced0b15898506ad76818e13ea82c971478bda6dbec939eb2b556659345cbeb6605028105aa752a106ed961a1fa3e8f9ff004e3fa56ad901967232972b28f6f4f90dcbaa37bc7e748647a01c90e1938e623fa38b4fb2a4a40582bc2efa4d876cd46bf5c98dc0a4d3d927a44970b84447ff008afadd174d2acba04dadd727334da5426c9e9126416916c47f2af2eb6a1da7ea1b43d6c60d3c5fa7d8709cde4484ef0b939cecc8787ee8f6506879db99b3b682cc0af5c95217188f5064a0d36217f5587a485b1f5888b517ade15e8a6c157ce37e6cab62c974b12994f8a5499445f6d1cb765f7579762640e090f30f12b9ff0025edea3065e6565ebaff0048c798dd7a9ec7759903a5cff8823ef2826bf4888a680888838e3f4aab196728ae1cd6cf6b9b4fe2f2ae28b458be21850d9173fe238e2b3158a93747a4cea83c580b31593788b1ee88ea557765f69e3c8ba2d6a4090c8baa7542e8704bb3d6e538e08ff87a515d9e89a2d1ff00c4517d52fbaa4b51a5a3ff0088a2faa5f754968c43b444445ae95429f16af05f873586a54578776e32f0ea131fcc42a00aaec676fd127bd58cb3ae5572ceb45a9c1f243baa138e1769c8c5e6c94aa1991147361fb124c47634e3a6055a1493f4731bde136f08f89b2ddeafd0e8addd0556919bb9eb924e6217e586ce61dbc18e9fc21b40f4c86db1e671e8e5c5eeadf6c6cd0caeda2e9ae4aa0d4a1c89ad969914f9cd8b7263b9dd7192e212536285f36364ccbdcdc967569b4bc68b74733370518baacd69cfb4d43cc5eb6a41f0af655d1e339a65dbf0f4f65f61bd3abdd58f8360dbb01b216a96d10eade697c89c1d5ed2c2c2b17688cb86b18d4bbbadeccaa381696e25c514a2cbddf89e6f8489612a92f68c7712621657db0c4b73964b95cd519bf679904a23bb8517486ee3456f8b48f9b6c546f7f6d1561e5e08b332ac555a939e8e9b466fad492f64574a97b1f5f19885d6336f33674e8ae717906d91ea31c757336e383c4e0a9f32d7242c5ca08d8b368daf4fa2910e9724476077ce7ace73120adf0a2678e7e3831e9b4afe47ecf71cf3d52a879cab48674fd5b7f57a87bca6acadc9bcb7c87ab47a5d19b642e9abb6e3dd66a0eefaa13b77a778e6a2e2d23bc1d5a787894c4ab7647cdc737f680cc9cc831c1da2509efc0ab7c9c6484bf172de4f787bc2521cddeaff00cb0a0b228888088bf31fa10431b62d978e606cbf9994307306dd728af486cbf3133d0f0fc4de0bcf2b62adf84168dbf56d5abaf5363bdabc5bb112f88497abd71d1dab828552a53f8f999f15d8ae7aa6388e3ff35e4164f8f53cbd8f4a2c7a5da25427520c7bbba905a7e125cff19878d7a49d1f03b3ae706e28b910909692e15c5724ec0444404444058ba4d2e75a55c2ad59f5ea8da15622d4e394b7885b7bf68df290aca22b6ab6ca6594258a9b6aaee8e364726d8ded3d9d5023bccbbf83171c87396a0fb251c9bfdd8f092d76a19bf9e17096a957c41a2b7f674ba7b63f1695d545bffcd3738f73cdfe53b6cb2c5abd42cb9570090dc77557ee165c2de391a74e2dd917aba976a9361dbf43d3d5697185c12d42eba3a9cf78967916acf77759dd26ec369b7afb622222d5f56d7a08888c888baf51ab42a052a6d56a2e6ee9d01929520bc23d9f68b48fb49a69e3af831aebe1e68af3826f94f31acda0b5809f92997ab333c3a8776cfc44b61caecd9baf262e52adda752ea6fbdfd2a0bfc51260f75c6fbde2e651ddb873aae551b9eae3a6af70bdd69c6ffd1e38fa167dde25975dfed69e453183e77bcbb9f74a6f4cf22b6e6b33350a2d2abe43675d4e70f519ae7e2f20bf52f7297abccaca81898eac0b02c3f3e0bc3579a6e4364dbad8bad976487529332e3693cccca66db8f6f5d0fbb4f6c748d36adf8d461f575710fb2b6da6f4ff0039f286979d567e144a8cc974a90cc86e641aad3cf772a0be3caeb65d92e61f6945df8219e76253c2094cb7f38e82df0f56adb7d4ea64dfedbd1917888542d40f950dbb760efb302d46a1c61e1ebd4b95c245fb32e259f9df2ae658bd15976ddb5ef0b9b57a4eaf4b26c5bfd1a8b994d16ef2338ac8b6be7be2c2b9f2b8c5cdde32c6338dc212ef0c88fc2b7cb706dccc487d7b2f7346549d3db8d54ebcdfb42e11283687f2a7651566a0546bc68b5fb3b0942238796606b649b2e1d4e69e51f594ba3b3664ae69c283775ad4c8305f7dbdf41b8ad1938c3771d5cae0b8c90eaf69066ea14dccba48f9dbb849bfb4c29ac97f0ac24a857855a536e546ee6dc644487cc416c4beeafc6f2cf3a6c521fc18cca8b794011e2817b411232f56447d25ef2c6cb9d9da602279534075e12e27215c42db6e0f8448785065e1d9f4f6a4758902ed566765fa816f887d5d5cbecac0ded9d966d812a3c1a956064d6241698f46a68f5a9af176445b1e2502e76675ceb22a3e4cccabf1bb4a7c86ba46c5cb88fd7eace0feba516adc8977874ad2b2e36d4b5726e2486f2e7674acc37a411758aa562a4d8cb91eb385a9c2f79059262cacd5cff94cb33a2caca4b048b54a689c12ae5407ecf50ff471f8b8958acbccb5b672badc6e896b51a351a037c44db03d04e1778cb988bc45f3aa5f47f95585a7191b8f272e580c9179c954e92dcc16c7bda47894ab4ef94a7212a9493983763b1a5605bbf24cb86e353312eeeec905a451b672e7ed9d91545ebd735470090ee18f55a731e7254a2eeb6dfd38aa7d9a9f28bdc75b64e1d85411b7a398e9f2b55b4b8f7eedbe51f6954bac55aa171d6a4562b3509357ac4af4d3a739bc70bc3e11f0f2a25e09273f768dba3686ac09d547c956dc573790680d39a844bb2e3c5f58e7c22a2c445064523ecc1987fc95ed3f97b5a71d7029b5c78ad7a80876bac7f4722f08bdbb51c2c6dcb024552df9d1e1384c540446443704b493721b2d4d90fb4283ddd451cecfb9a5133b7262d0bd236003e5680dbcf343f52f69e871bf64b50ff729194d011110413b6bde2e595b365de515c36aa5566428b049be6eb128f0647ef2d4eab2e4e5a5ef92197b4cdd8d0a6372a8f330ed7e290e3eef4fb5bc5dcdac355d598d91d628e1bd8d52b9bcad35bfd4c26f79f78856b59e9522a6e6ae40579c10c193bce4427888797acc5e1e2f59b45524dd67ff00e2287ea97dd526a8cad7128f71c56cb848489b2f7549a843b444445aaf9b5b6322cda3da99ad019c5d956354c644d017087794b91a59983d03cda7ccb9fb953bd3ea31eab0989911d09112400bacbcd96a1700b0e912c3fb5756e5b7e25d96d55e87510c1d81528af43901de6dc1212c3dd25056c5975cc2cbaac65cd7a46fae9cbaa9396ecbde3dbc71c8a3c50de2f0932423fbb24162d11101111011110435b5966d3f9399235babd359eb3714eddd268b134116fa7482ddb23c3e22d5ecad872132b19c94c9cb4eca65ceb0ed2608b72a4e0445d625179c90f717179c789c3f6943172e8cf7db6687421e876dbca7863599dc05860e56250f4471d5f416ed9d2e7b4ad5a022220222f8c87db8ac9bcf10b6d363891117e4c1069d6e66247b93316ebb5d884f095bcdc5c5f9878f9b71c7848b7638784440bdbc17957983548d93598d9e1488cc6fe7c3bb44e9300ba3f199135bd4c8e9eeea1222f08af45764b9722e8b3ae7bde4486e60ddb734ea8c570074fe2ad90c5670f762eaf69521daaac5a7c1f9402af507b7844edb51eb2c325879b37f514722f5844b87d65e76fa319512d65ed7a5c3a528ee63a47dcd6ed3a03b69db50a992e69d4a7b624f4b94e91113921ce2734eaecf6445655117092967ae527d0231c638c44445864444404444044440444404444044440512e72d5b0ba6b912c28e45d4a3eeea35f707ba3e862fb45c45eca93ab55e8b6ad0aa95b97f3c6a7457251077b4f28fbda5411674394dd14aa5502d557ad3c5529c5e273d18faa23f797b7c2b6d9d9cc97a45e0f16dcf26be547ba4ceb85ac88b97c3dd5c51175ee34585a9579e2a83949a1b2d546b0d8ea90e3e5f8a4112ed3c5da2fd5ae55aa8cc913068b487058a838def254dd3a869f1fbde270bb23ed2ef52e970e894f6e0c06c9a8ad96ae22d44e1769c70bb445de418ba7d97063ccf285508ae1ac7314da80ea16fc2db7cad8acb562af229b0778cc576a72888598b107949c2e5d5dd6fbc4bb0827a39506368144f220ca912247942b150e2a84d31e173f5623d96c7bab9d2effbb32164b752b36e8abdbd6b4a902dd52934f9442cc770b96436df28f8977ffb16957936e5f0352a14379c6a954d649eaa4d6feb1e11d4dc71ef789058b87b55672521cd2198539fd3cbbf8ecb9abde158fbcf6ddcefa75363c381799bb56ab3dd461fe231fcdeae67397b22a23b367b954b2edf98ef13cf416f57b3c3fc2b5cbcaa78d2730ad8958d3a5d4d88b0a53c4dc4c3538d896912734f6b4ea41951b42a149a94caa522e69475a9c5bca93f57fc606a0e73138e1730ea2f12cc5364541f6dc1a953c20c86fb4c3dbc65ef137fff0065f4a6d4a1d6608cea74a6e7432e575aecf8487b24bb0803c05c2baf54a743adb3b9a94362a0df764b62e7c4bb08835b8f683d442d56e551da7b7ffbb669148885eaeae26fd9259e82eca762b65362b70e57d630d39bc11f5497d910111101726c89a2121e615c571121779085d1e5e1ef20ba7f260e6175176facaf7c8f750640d7a92258f08c591e91b1f55cd5ef2bf4bcadd9fad3a96584acbccfb90e61128ce5c056c4907794a9aff9beb1fe372f857aa4a68088882a9dc443766dc729ec71e866c9b2b48fcfcb226ba5a4bd6d222b58db423bd1f22d9b918d3bcb46e6a3d78bc2db6f6edcf85c59cca47cabb9d9b445cceb221bcb821d05b73c3123b63f796e598f643799b967795a0e61ab1af51e5416ff00684dea6fe2114512ee6ead4c6c2e366634e09c779e190263da6dce21f84949f8fd0aa7eccb7bb9987b3c587567c45aaa45a7f926a0d896a26e6442eae425e2f36d97b4ad252a58cea6c7903f438d8e289c1dd4444582abd7d74648ed8b6a5dfaca35b19970bf05ea98f40b6cb7548fa9e80e17689c71beb4cfbaad0a84f6bccad979a99037340a3f4b773d2c5bae50a4037bc7599f1085e6777e22d1bbfde62826c451ee44e66c6ce5c9fb4ef48806d855a0b6f38d398e1a9b7395c12fd22424a4240444405a7e69e6352b28f2f2e2bcab6e10d328b09d9af087339808ead23e22e5c3fb56e0aa56d8cf0e6a665e556490ea769b569ff8497237a3a5b2a5c2f39bb22ecef1c11141b5ec4397b58b53275cb96eb6b4def7cd41eba2b7cdc2f3e5a9b6f4e3cba1bdd8e9fd0ac463f4ac65b6e13d468ee10889383bcd23cbf3ac9e3f4a31a3922223228576bccc6732bf67bbbaa90dc6c6b12981a6531b31d5bd9520b72d888f7b8fe15352abd9bcfb99bdb59e5c65d45de9d1acd0fc36af1818937bee926e03263ded5bc73d5d2826fca4b098caecafb52d18fbbc5ba2d2e3c1c4da1d22e136d88917b45a8bda54ab6fe82146da6b292a62258f9668b56a6bd8fecf76f0ff0012f414bf2aa47f297d3d882592d723b863ae35d7e4dc0bf3612233bffc5b15abb98e544e3f836f672c7710d7f157a45c9c0d0e383dd25c57cf1f481111011110111101111011110111101111046bb454a73f9378f4b68b8ab5568b0cbc4dea222fe15859022121c11e512d23ea8f0acae7ef9a81633c63e65bb8845cf0ea6f85621e02079c12e6d44bb1e131fa3fcdc571697d27e4e2888bd9788e2db4db44f1036224f16f1c211f485de25c911011110717077acb8dea26b78243a9a2d243e21f12c2d5821da16155062b7b8870e0b9a47b4445c3a8bbc45a96716a97607e145769f6a35fd1d926ea558707eadb1f46dfac5cc832b68c02a5d9f41867c2e3305bd43eb0eafe258bbb88a937759b5cde38d32dc8729ef383d9df0f0fc4b6c70f7ae1169d3abb3dd58eafd099b9e853a94f16ec6537a5b73ecdce66cbd92d283e132d767cac55280e1522a9abcf39187cdca1eebcdf297adccb2c5cdc23a560ecdaf395ea1e9983baac53cba9d4982e61707b5ea92ce20222202222022220fb45d3d699d5cbbc15f7d9ab2aeb19db59a5dab48d4d3d52992254e9a3cb0e2ef389e2f169e11ef169585aed44a9342a84c06f171e6d92165b6c75138f39e6db11f59c215eab6c67b3553f66fc9fa4534f44bb9e6c707eab50d3c4e385c5bb1fcc03ab4f4230cf671e47c0b87667aee5cd0e3b50d86a8fd569618e1c2cb8c8ea64bde11599d9d332c738b23ac9bbf13d72aa34c64e670e9d3284777207d9745c1fee52490e0587463f42ad7b25195937c673e58bd8622142b99cab4011f4630e788ca111f55c71e1f654d1596444414e364d9855ccb5bb2e432132b92f6ac548487b43d609b1fbaa6a820453a288168709e1d3ef284f62f61b8fb28e5cb8023f8d479528b4f689c9045fc4a7cb55adedc50fc3a89147b901da107f915daaaffcba3118b6fdf8dfe195b400deedbeb8d8eeea31c7bce179b79598b06a0271de845ccd96f1bf549469b5ce4fd5b326c0835fb4077798f66cc1aedb8f0e3d04e3c1e92317e7079bd4388f7b4af965066dd37342cfa1df744026a3ccd4332098e9721ca1e19115c1ec9096a44a5e5af8ac0a2f8c594dcc8edbcd16a6dc1d424bec8b444581b6eeea5ddae561ba73fbe3a4ce3a74b121d3bb78444887dd705056dd92f00ca9ce8ce5c98d6d37029f506ee7a1456f122ddc19bd24e0ea2eeb9f795b0558696c456fe51aabb8d6efacb996e3bfc479b86a0ce9d5f12b3c8088883f31fa153acbc36eebdaeb681ba5d27317a8ccd2ed68a18970b6deef7ce69f58855c5c7e854fa8ad8e5aeda199d6d4a686345cc1a5c4b8e90f117a7911077729b1f169e24425dab596b7fdc307f6782cb280e3674d4e267f58f9574ca7352987e8726b55b9a5a88a1b225bb8980e9e5de109737654f884444444d86baae7a6d956d552bb5994dc2a55363393254977e616db01d4458ff760a07d8cedf9d5bb72e6cdfb821e316e2ccba879681a7db1df46a5888b74f8f890f3698e2d97ace12d7f683ab3bb47e6bc0c83a0ba4e5bd0cd9aadfb518e47a5989816a6a9ba87eb2476bbadab4f1a233023b4c30d832c36220db603a444479470c10767f22a85f29e41c1fd9e691522f986937552a711777cf6efff0098adf2ac7f292c5c24ec5399263861bc8ed439018f749b9d1cbf854251ca3e09c35c65a494fa506890e7ada97c537bbf6d97bed196cbe1145f36d7d5f51d3d04445860444404444044440444404444044441a56745b6f5d396358661b64e5429e4dd4e288f3138d16ad3ee912d1a9f5366bb4d87538e424c4e64640e9ef1730fb25a94e0dba4d382e0f30a83eefb5b1ca8a8499f19871db12a0fef9cdd0ea2a4482e6d43f645f0ae8b856e635e9c997c5cd716da4acc6f8fc1f6441d2eb2dbcd380fc7707536fb45a85c1f0922ea1ca0888808b969e122e116c788888b488fb4b55957a154a4394fb5230d7aa03c2e4b2e1811fc44e76bd514190b9ae3fc1f663b3159ebd5d9de6e9f00399c2fb42eeb62b9db16efe0d535c6dd91d7aa529ceb1509bf6cf17f08f6570b76da1a2392274a94555af4a1d322a4e8f67ecdb1ecb6b3080888835fb828538ea8ddc141201af36deede8ce979ba833f665e2ee92ee5bb72c1ba1b786289c6a847e1954d93c326397abda1f12ca2c55c16c41b95c65f7c9d895367fa3d52216ee437ed7687c24832a8b54c2b7715aa3ff6820157200fff007cd25bf383fb667fcab3747b968f708eaa6d5a24c2fb3de6edc1f5849064117d0a3b81f565eeae22d385cad917aa2838ae4204e90880ea22e515d3ab55e9f41677d549cc4112e5170b5385e116c78894bb919b25661ed20fc7905066d83978e979fad4f6f77519cdf762b3f5625c5e709077f637c8f7b3ff0039e9d5475a272c0b2260d4274be2d33ea8dfa18ed97685b2f385d9e1115eb4ad4b2db2d2dbca4b329d6ada94c669345a7b78032c363f4f7888bb445da25b6a9a02ad93ff00ec66de94d7834b50ef5b389977e7f492a148221ff86f7c2ac9aa9bb525f545b7b69bd9ce394a0c2b9e5a951cd912c3cd4590ce9d4e77751363a7d52416c91110539d8c074ec8995038f3792cbfea129faccffc44cfecc957cd8b660cad956c16c4888a08cc825a878b53729c15602d177757145f1090a28f724b54f338ad29db2ce63d5735edba6c8a8e5a5c2e095ef40823a9c82f728d5a3b7de1fac11e61570d7c1f8edc864d975b171a31d24043d2388fe645e8f2c5bca03b4e833215418a9db9546c6441a94673532e097684bbbf756d17cddf0ec4b3ead71cd69f910a9b1ca4bcdc46f78e100f3691fcaab0dc591f7becdf599d5bc99a73776d81507c9fa9e5acb95b928ae963c4fd31e2e16cbbcd170f32fca6edd794d0e953e8d7dbb71588dbc2e457e9d755064326d6a1d2422e362e090fd3c488e9e4b5d42acc6b8e854dab423dec1a8476e5307de6dc1c0871f749572cca9155d98b346ab99d0a9cfd672d2e5c591bc23451237e8f21bc34b7536c7b4ce8e178478b0d2d9764941191fb71dab92735ecb362a350cdab369edebb62bb69c27e64c662f4f43706636423e71be211704b89b16f56952fcdb5b34b6bf90312f5a54bca6ca1177548b78656aacd7c70e9d2dc871be18ec170ea6c7511710ea449ded92da3cd9cd3ccfcf77a368a65c4f3344b61f2126c9ea4c6faed25d971ce2f655aa58da351e0db94a894ba6446a9f4f86d0b31e3476f4b6cb63f30888ff62c9202222028476a3c909f9b96853ea36b4c6a9398b6b4c1ac5b55173906507d4b9fab70780bd6536afd4148362eaf1dc95abfefbad3ed399c756a9147b8ad97449a7a871a3ea6e3c46d922d44d88f16f0756ad4a61da5f687c32b32c1c1a54774efdb80bc936e51f1f4f22639c22e08f36edbd5a88b4f6565b39b657b1339eaf1ebb506e7dbb77c5e818b745bd2b183516b0eeef0785c1f9b95c12502b3b07667dad98d2ef9b6b3ccaa570c963ab373eefa08d424c36fbac96f045bd5dad2d8a23e0b379374f9362e5a5b96ed7ae17ee5b860c506e7d41e2df3af482e2739479751108f84454699d9b4ace1af7f26394919aba734e761a1c21f390a80d161f3ca98e0f08e9ecb7cc5a56099d93f36ef0dec5cc1da12b12a88f8f43d4eb4692c51ccff00da3ce39eee9537e5164859b91b6ee346b3688c5223b85bd90f618939224b9f68f3c5c4e17ac8c31bb3fe4753721ac61a2c794e55eaf31e29d5aae4afe915298e7138f385eb728f6454a488898ab6fca3387ff62acd2ff5167ffdd32ac8e38f42ab1f297d4458d8faeea6fcfd62b52a9f4e67a3bc53992fba24b1e38e9e2ce91cb5d14fa1f05369ff00eaacff00d315f6fec5f479a1608591e56c45bf74457cd7cd35f57d4f4f4d1add4b306930a5390603732e3aa0969285498fbcdd9775c70b488fc4ba58dc17e4de82876244a6365f4156aabc43ecb6dadc59d3159266388466cb88858116c48bbc5a79915ba4e31f6a8c652f734dc6a399c23ab0b7ad370bba1517b8be15d59198d70dbb81397565fd460c21e6a8d1640cd6c47c4df092df1726dd7182d4d11345e12567361ee81cb97b65ff00a632dcb9e8f7a53ca750aa4c5563b7c2e6ef85c67f68d9710ac8ad56e8cba855d9b85629320ad6badbc3a59acc01d3bcf0c86f95c15f4b46ed9756a83b6fdc311ba4ddf18359c668bccce6bede317687bc3cc3fef5095719c72a988d928cb1b1b32222a178889ce5a47990116b974e60d1ad19cdd35f27ea95f73d0d1692defa517add96c7d658c10cc8b930d46f5372f61169f3223d7ea3a7c45c2d8aba34cb1ca5d2a257472c63d4df0613c63ab72e69ef10e915f171d65a73767321b4e774a53625f796918e4f5266ea2ad56ee4b81c2e22c25d50996bfc36c457d99c97b099c3ff0008c174bed1f79e70bdede2635fdefd3f767c67f77f5fd9b8faa425e212d429d9704845d6dc1ddb8d3a3a85c1ee90f68575e9b4b874682dc1a7c50870d9f46c37ab48fbcbb0a9f45dea8ce93900edcb9f166d9963d6cacd6eea8d3dedd3cdf5c882fc66c9ed22d91093625a4b9496eb77ec77b42d8ce60d95894cbd4313e1916e55373a87c4dbc3c3ef2c9502bc16767de475c463d00cdce349373ba3319719fbc4bd66d4bbbe1f64addb4652703c4ab8d3b99462f18bf90dcef1c7a0b232e9d7f98644721f7b52cc5b9b29ed0b76c97198d958d5b7874110c9b8eb0d8b7eeb6244bd8745e93ca787f7becb79a36cc9de665dbd579319be218d47675d3047c44d91139ed2c5332a1c28e30dadd53e3b7cb1b77d5c47d92d2bdd121c0b0c70c7e85a85cb94764de38f456ed3a45471fb47e1b7897bdd1d28978bc656c85d1d404243e15cb492f53eb5b0ee4c571c232b3da864587f5592f37f0ea5ac48f939b289d3c49a6ab7170ee3550e1f884940f179ae9a497a3bff00d1bd95bbce9f285cba357275e6ff00fe35db8ff27365032e6a799adccc3bafd4387e11141e6ab8eb6d0ea3705a1f11695c63c819af0b3145c98f172b511b278be1d4bd5ba16c539336f63a9ab2a3cc73a39a6bce3df78ba149f6ee5ddb168300dd0adea652b00e5c62446dbc7fdf80a62ce4f28ec9d9b3362fc71b729164d421b245a7add50861b63e2ef7c2ac0d8ff256d06b929aa8e67ce8b509225aba95099eaf87b4f7317ba2bd004534149abdf25365abf2dc936f5db7adb1abfaac6a98bd1c7d5171b22f8963e3fc94769ca77f9df336f898cfe56e3488f1fa7da1655e94415ff28f616c99c9c94dd429169b554ae00e9f2b579c29d27fe2708fb222ac02220222827680dadad1c8b88e4371dc2bb751874c7a1423c379fdae97d58fc5e141b367ee7c50f20ec8915baae3d6669f4b50298d179e98f764470eef78bb2bc9caf5e95abbf34a837957e514eaf48baa9b21e74795bd4f6916dbeeb623c22bbd99999571670de522e6ba660c9a8383bb8ec37c2cc367ecd91fe2e625acb624756b65b01275c72e2a58888ffac0a824f72d1114d153cd95e29512cbbfadb3d3aaddbf2b10474fd993c4f0fde534535feab528af72eedc1d4a26b1a3636aed439f36c88688f521a6dd1147573138d8b2f17bc24a4f2e3124512ee4ca8b194299d7e9115ee9e220e82f5964d17b0d74e15972dea805bce436ab64c975472a0244c0b9d9de603c5a54295eca7cf0ba22175dccfb49a7356a188564f5a8c3e1f392b57b4ac2220a8b0b1da1b2264c89c76158b99743e012c6ce67c8b55d3da2dcb9a9b734f77782a4bcb0daf32d73329d5374aace5a354a506f6a945badbf26cd823f46a705c2d388fcd8f10910a92ef8bc69997969d56e5abb8e05369ac1487b165bc5c70b01ec888f311638e0223dec5563a56ce51f685b920e6ee79d2591ddb78616ed91b91c1ba7c723126fae10f148905a5b2dd979b6f97497120cecbdba29f75c9910f28f2eeedcd9798c3579469b1461d30bd595208757b224bac1b5067b47740a7ecb75c08ddac60dc90e43987b3c2bf732b689acc2afbd96792b6ed32a573535bd3529aff99a2db2d9728c826fd23dff00976d47af64de655e04f48bc3682bbe713845bc856b43669b107c2d97112aa538c48f5266b3b6d5b36a972336d5e147b8b2b2e49042dc78779c1eaacca734ead2cc812264fde1561ba705e7bdcdb3255aad694ab7e16705cd53a748f4949be1966b101e2f170b6e33eb365a97d3637cf1bf723f31e26416750e3d33409eb42e1de93cc4a6c7fab8bc5cde1d5c43ca5cc2a519c646325edb9ee7a4d956ed42bb5da8314ba3d3d92912a6c93d2db2d8f31112ab58e68e6bed3b09c9b614b6f26f2c88f4b3775763ef2ab541e9f99c8b1cb4b6cb7c25c4e11163dd514ed5f9857ae7e6d1f072b2c3a145b86d6b388675c0fd55d26e94350d3a99eb9d03d2f36cf096e47d2169eeacb3db2e5bf75482ab669dd55fccbac0b7e79c97502a6d2a388f6598acf2b63eb28ca718a5a465249d41d8632b2bd83f22b3775d97fd59cc778ed426dd4f116af08b040223ecaeadc3b13dcb6453e63f9299c776d9354738ba856a5f95a9ee77474bc244dfada8bd5505d0b28767bb8aa91e976e52ee4b5674c221a7d669356990c5e707ecdc22212f687894c16f66a6616cdce0bb7855a5e6965560422ed7faae9add078b9a536df0c88fcbe707887b42a31b6322509451e654de9b4b522f0956657f32692199cde04f336bde745ddd3aaf1c4b89ea7d42390eae1d3a849bd43ab56956772e368f76a9743165e635b3232e2fb7b1c7a9c3932064c1aa8e18971439438602e7d1ab76422e747671597cd7cb1b63696cb58870aae2120486a76edd548705c7604a1f47219707e9fa3490f68750ac5e41df3fcb3d92116f6a5c4c2feb3ea654fabc675912dc4e6796433f3969170311212f110abd14e088883863f42a57f299d4c655bd94f6a36fe0d3f54bc1896e0f7998ccb8e17c58b6aea63cabcefdbbabf1ae6dabf2fe843ab5da76f4eab3dddd5249b65bfba4b57733e5d1397e0dada57ccdc423f8a3178b5bce178971445f3c7d2c44444444440581bd6cd6ef9a3b51da9054fadc2737f48a9b7e92348ec8eafb32e52159e45384a50965162518ca38c9afd897715eb407254b63a957613c50aaf0beca50f6bd573987da5b02d06ee742c6cc6a35dd8740532ba4345ad88f2ef3faabe5ed0e922eeff6a901c689a709b2e612d2acb631ef8f6c94d32976cbd623604eb82d80ea22e515a2542e6aadf3509742b2a60c0a7452dcd52ecd3bc16f1ed47883f587de25f4bf2a336bf57876151649429b518fd6aaf516f9a040f0f8dcecfacb6ca652615029512954a8c30a9911bddc78c3d91ef17788bb44a71d34a639cbb9197f5658c7b5d1b4ad1a35890dc8f438a4c38ef148a83e5bc9528bbce39cdec8acba22d594a5396526c46318c718888a35ce3cd67ec6ead44a1e0d3973cd677c4f39c4dc08ff006843da22ec8ab69a657d9cbad55d6c76f5f32cf449131f8f4b6c5c9f2a353c4b97adc816757bc4b8c39516a43aa1ce8733fd5a536e7dd25490a155ddabb954aa390eed90e16a20ad6f38bd5d25a456db6d41b1ae498310a8456dd71c1d5d59b94e37bcfd8b825a4bd55d0ff26d71facfd1ce7f3b8e5f57faac5e6ac1a93961d51ca6ea62b349266af07537c5be8ce0bdcbfbb25ea764ce685133932d68376d025b72e054a30398e225d24db9a70d6d961d9212f9ba178cf02b57c58f05e1b6eb3e5e6db6c859a5dc63be26cbf56f70eaf54976f65ececbc3679b99f8f40a8748cbc31a8b74f98c937167b38e1e79b26f579b71b2ed0fe6ed2f4761b6b76b19573ed799c47714eea519c3b9ee4a2af3933b6c65f66bb0cc499370b4ee2c7d252eace888917eadee521f74bc2ac032eb721b171a3171b2f9c484b5618af59e43ec88880888808be6662d0911638088fce458aa7d9ebf29f654650cf9948a3633affaf452c5b758a137aa3b4e61cc2520b87ddd482e2a2f3128bf2cb542b555c223393c21a8b841fb885a74bd5171911f896f5787cac76ed22c52181645769f7d198c76a9f5e01660b445f5c52448b5363eaea2f8905f2aad5e150e0bd3aa1319a7c3647539264b82db6187888be855f2faf942321ac493221c8be98acd4582c44a150d972639ef363a7e25e69e615d776e784ec2ad99175cabb307751334d84f147a43225c5a5b6db2f3823de2258e830e2d25b16e0438d05b1e1d319916d0c57e4be565c9ee92d340bf1c01fac1a10e9ffaab61b73e540c86ad9884fad55ad8c08b4ebadd29e647de1d4bcefeb4f7db39ef2e2e3a4e890bba5d12e61704487e250c93c5eca65f66dd959a94cc2a1685d54ab86269d78941942e108f887a750fb4b4eccadacf2c72ab071baa5ccc4e9e387cd0297875a78bdde11f68b05e4148b4a92ebce48623bb4a94e0e9293469050dc21f16ef84bda15dca6c01a6c51677c525c1e1292e88ef1c1f1779185a7ce8dbe2f3cc107a9d66c72b2a905c252cc85c9ef0fdd6fe25588b51c87a43ae38fca905bc7a4bee138e3c5de222e22444645abdf2fcec645a70693503a655a5561b723cb6c751324c8ea173d92d2b685ab8ff003ce6c32225ad9b7e9fabfda2472fc3a507acbb22ed3d1338726a2546e99d0e15d74c94f522ac0788b42721ae8e97007ba42405fdf8a2f3eb2372daf0bee05d751b66348914f0ae391cdc647a4717463c7d7ff3c114d05f0cfc642c2da83296f871c71aa657d99565d4c847cd8efbce46222fda6a15211093444263a5c1e121ee92fbed4394c59d192570db91cf735616f09d4b7fec66338ef192f78569193f99039bf9576cde44dee265422e9a946d3a7abce6fcdc86c87b25bc12f79154d2e5833fa317e117cdf3ef5bfe25b99289a9f31ca74e66535ccd972f787b42a548729b9b15b7da2d4d98ea12421abee8888b5d7911da90c936fb60e37f4e22e0ea150de6d556b170d02b5168158f20d5a432e43a4d4b73beea6e17094816fb4423ab4f8b4a95ae399d468b29d1e6d3a47fbd570cdc95561b46e21a21383548f04862ee3d26aed10f8b4ea554e58c48e994b174ac6b268f9716844b6a80d8b502279c9044f0bb2254a2f492a517313c45da250e6614f66a97f5d8dd7ae09343f238b63496db99d5c59674eaeb023f58444baf95b1e9afdfd6cb96837308596dc2ae492de6926777caf6f399cde7754f552b7293597199554a4d3e7147e1664ce6c7cdf8448979bf5916dfd5c989cb9ab54ae3b0edfa85584bcad2a2893da9bdd9385d92d3d9d43a496173fac1fc39ca9ab322c93570505b2b82dd9a2dea721ce8be7849bf090b64243dae15f4cf0accea25931ca3ce2a6b3509ccc199546ffabc72e6212e51eeea581c857db6b332a143a4549fa9dafd4dbdf0b923ac371e4139bbd22e789b22d42a5a4b19628e3947263f6549834dd9a29777572a9bd9d733d32eaaf551f2f4921c734f17aa2de911f12d91ebae879d36bdc56bd1aa12e99509904b4f5d8a4c91365f5823da6fbca2bd9fadca95d5b2ddc564b44d313adfbbaa90638ba5e6dc16e436f0b65e12e2152559769570aea1bbaea8f1282cd2e0b8cc7883205cd3a87ce3ce39ca2d88f28a59964cc71c585a6d8d7756ea16dc3ab51635069b4794cca7a5b7285c12ddf28b223de5245dd98d41b15e64ab750ea6e543782dc66d927889bed6a6c7eafb3c4b57733e2db32d5029f5caac5d5fd2e341f37a7bc3ab4ea15acd467c8af5e93af0b5296778d3e745661f98216e4d3de6f99979b734eec4b56a5576f6a5dddcb4bb3dd5a87f828c51adc660b1418cdefa9a14d0d31c5922c7508fb445ef2ca53b2970a3679d52fea7cddc3159a4b702ab4dd1c321e65cd51e46aef089381ed7e850e6cff439996f0e87166136339e98f4898d305e6d9eb05e8c7d5e156b305e9d52ca2d59c7193f51115e8be6642d09111602387cf8962bc8b9b98b1b373681ce3ba9b79d2272a11e0c169f1d3a69ecea6c5c1ef093c24afe6d7798751b72c285665b45aaf6bfa4fe0fd21a1d244d0b83f8cc9d2443c2cb3a8bd620510ed27b1f3b41cbcb3ee0caea78bf725894c1a63b4900d3e5ca6fd6338feb756a707c445de5a3bca657d12ae2ded8df1a2f8ce4aec8ba36fd6e9f76537ca148789f644b4c860874bd0dc1e66de6f9848577970328eb0e993e87196938e51111161211110111350ead3a8779a756ef57169ef69eea30c35ef6d0de96457e8443aca7437373e1787ce365ef08ae858f7ac7a9655526eaaa168658a711cf2c3f2947e1707d6e15b743320991c8448b4b825a47b4abd4189d7c26e51c7c48b07ef4705f60756a1a788efdce1eeea6d6f511e6c7097b7abfeb4aeb39328ca3eef2f9fc125e5252e5fe0ecab9ead874d7eeb7bca32b1c3eaa3fd4b3ea88e9e15ba2fa3c05bc70b77ba112d3a74f08f857cd6adb67327936ab872e388888ab58fa471175e6c48b489171177552cb9ae87ee5ae5d374e18813951a8137148b95b644b76dfb22ae5cc326a9b507079862bc43ee92a3945722b36ac161f6dc71b75a2226db6c9ce1ed1169e51f12e8f82c7cec9398e3764b1aeb4cf9b991d4fcaab1e975c87549d26a5d6998b3bad9799984e0ead4d8f674fdd513d61fa7888c59f205aed365ab4b8dfeb04bb2b212aa552acc7a68d4ab932b5069adfe22dcb7b5371c7bc3dee1ed12df3237312c9b219bb9bbae3b731c9c42e32e0c5eb43223e921eafc3ca5a9747d518f5397e9949f1b1eef72b3aa9354704ab315bde0bfd99ccfda0f887b4b2d72510ae08ac93323a9d5a1b9d629f34bea5cee9784bb4a29a3ef2014794c33d59e66438f4368b88a3b645c2dfbaa5ea4d51bacd3599803a779cc3dd2ed0ab1875e8f5766e886f0c88a31aa50cb773a9ae734573bc3fab2ec90a912c5ce3bfb2c9c12b5ef0a9d3d91e1ea8fb9d62369eeeedcff32d0e65263cda943a916f18a843e1192c169271bfb373bc2bb882dcd8ff00291ddb481166edb5e0d79b1fa65d29e28ee63fbb2d43f129cad9f943f29eb22d0d49eaadbd20f849b9b088847da6f52f3511187add0f6b2ca0a88f98bfe8f8fed1c26fef0ad85bcf7cb975b1706fab7f490eac3f9c99ff0032f1a8a2c73e68ed17acd8a374d8a4e08f576b88becc5326715abf94676ca8f56a653f2b32d6e36dd3aa3252abf58a5bdab1662ead231db21ed385ab5774447bcbcee8f219810dc1870df1a7c32ddbcfc68e44cb25fac73bc8cc86ea5705cd526845beb138a3b6423ca2d8e915235173919b7b23deb062db2ff949e8ef45725910f54709c2e2905da22d3d95994a51ed228f66458f5267772996e4b7e21fba4b316cde522da11a5d7241556d773cd8bd2c778507c2e779b583788a9b4f6c4077ee088b2d89768b9456fd99d93754cada0d36a936b4c5721cc9034f98c757ddf5779c1ecf7852528f6b118c99ea6db34fb7e5482a73250db7878a334e6a8deb363d95905add873db7686dd34750b94f1dd88916a226fb3fe55b22c322222022220222206f5b605c79f2d2cb224e385dd115c767cc9fccdcde8b2a45a36554de995e9852cabb576faad3a1b25c2d96f0b89e111d25e6c4b996c79659533b3fb33e8d97103584496433abd2dbfea74f12e21f59ce5115ecd526970a894b874da7c66e24086d0b11e3323a41b6c4748888fe6c304611f6ceb9274bd9df2928b65d38dc9871b027e6ced38ea9729cc753ae97e9c71f9b0fd180a294514d171c3e9550e9b4dc321369bafd9ae6031accccd75cafdbee17a38f5a11119b17d67874bc3ed2b7987d2a35cfbc98a6e7a65f49a04c78a04f69c19b49ab318f9ea74c6f89990d97784be1224635623d6e1259fb52bfe4991d55f2fc4dc2e12fb32ff2a85727734ea774d46a561df3142919b36f888d4a163c2dd5a3fd5d421fda36e69e2d3ca5ab5292f987c28d7ed4c5861f3afd5a0db9777938062cd2228e3c2dbfda1f092de1890dca6c5c64f075b2ed0e28ba32c983be0bf98487bce08a84aa445e54905ca5bc534dfbff00720fed854395e6b755422ecb83a85516f6ac87731352aa47a352674e902db5162b2e4a785b111d5a47576540add35ebf9b66bd77b8ed4264c1df47a68b84dc482d972b6223cc5a7b4a74ae521bb868752a4be5a5b9d15c8e45ddd43a7528160dd0ddaf0d9a3dd0dbf47ad411eaee34ec7709b7b4f08b8d908e92125e6cdb7066ad3686cdbb28f498fbc9969dc4e3906751a716f996dcd3a85c6f572f8854dd6cd2e0d0e553e0d360c6a7c5190df9888de91d5a8543b60d3a55eb7a52ebde4f930edba1ef1c65f9cd93653a5170f0b65c5a447b4a646ea4cd0c5eab4c734c5a6b2e4e788bb22c89385f754a1e84909ecababc8f9b1ab97f942a969f74752d833c0ca7c3b66db3221835aa8175c112d3be6591d5bb2f09695ad6c5cd0c9d9ea1dc45209e917457aa95a9045d9271e1111f747e25bee685a53ae8a4d36551b7455ca3caeb915a7cb48c81e5719d5d9d42ac9fb908b55de90e910f3423c2223c222b8d925e4dce267ab96e06ad477bae343c22f1365e6c8bc5c5ccb0a572c869eeaeedab71b550e5ea9d4757177779cbed2de32cecda940a9542e6b8596e1d5a7323162d3db2de7518a3c5a48bed08b996b423d4b75480c9eea447707985e6cbe21564db2d4d897e855da8f0dca955a0b203ab5486f57bcac58e1a457a54b56c7258caed7205b3469d55aa4a6a0d360b25224497cb4b6db6386a222c5775d7823b64e190836387491163d02382a9b7254e4edb37c1db1437310c8ca04de8add71ac786e598de3fd0e2976a3b65e91ce522c348ea5b4ad96d9c28d50cedcc0ab67f5cb19e8d1673054bb2a992048318949c0ba4a51097d6492e2e5f4623de5689756243629f15a8f1da06186445b6db6f0d22238728e0bb482ba67c6c6967668e355b8686c396a5fee4770a3d6a90e6e7179ed3e6fac072ba3abbca88d9f5e2baed3a5d59d6f7129e6f77298fb390df0bc3ef092f5df1e85e5b66bd965961b49e665ae0d98d36a8f0dd94d221d23a5ffe9223e117352f038ad11955cd8fac5d0707dc4a3772a5e9ab0e88823ad722ecc5af5f75ba95ad461afc2646753a9a5bcab53f4f9c7a2f69c6cbb24df37b2b1b75e63bd46a8153285443aed4c4449c92e39b9811f5779ced1784752d22aecddd77c772357aee721c07849b72956f31b96484b9849c2e22f756e534f6caced6a5b6f746bee4dc2d6f63b321a71b28af362f32fea11171b21d4243ecad1736dd2b7e8b48bb62488c151a0d45a1fe9025be8af96ede64875710f297b2a22c32fec1a717577dc90f9323bbd2f549c2d3e1d23cab26c65bd933181759a2c692c1729f5871c12f89595c2bae7965fa7eea273b2c8e38e9feff006584ab5046a91e641d2f943903a75417bce0897109090ead24a057b2bdba3e750ccbcebb579de5e1eab4aadc47861938f69d251e577488787c4bac195f6f47785e81e54a4481e57e1545c1215d0ccb9776c4cb5ac5366d442f2a16022f36f4e0dd4fa6b825c2f09e1cc3d92f596cede3a4658c25dca7712ca394e1da959caa43a2e7145a2c9acc7834ea35b5bc6d997506c77af3ae69f38445c4e08e2b621bc2db37b723725177c3c5baf2933fe650b5332ded32a5c079cb7a238f488edbc452cc9c708887bc44beee65fdafbd87199b5e8dbf992062b3bfc376d8b85f68e6ae1154ce144bef2e8d9769f67ff7c9215ef753584ab320522bf000aa95b16a43d12632458b2d863890971708916222a407213cebce134cea1d45a775c5f7545377ec9f22cca1cfad556d9b471a7c26f78f1469e4d910feaf57317aab4a1cb7b5e3b4dd421f94e8bc22e0bf1aa2e33bbd5eb284aaab18c7497e9fbb11b6cca5947f5fd960db686411473e11784992d5d9d4aa2e51deb3f26ae1a8c90a3b15c90d332285320bf8e8d38ef0b496a2f894d1675cd55a632f0bb719ddd4fe564a588ef23f87783cca28cd88ecc5ccf7aa11e3946877233d6349728cc1e1734fadcded2f4b867f4ed9532f8bcde2b1e6551b74f6bb790b9734dbe6ee9516e011934ba3c7ebc54d6cb4b721e71c2d225fab1eea94338325addfc0ba9572dca5b143ae5259eb4250785b90d8fa46dc1f57b5e150cd8b7a4acb9bca1dc51e394e8fbb28b508225a4a4472eef887994bd7e6d196ad4accaa53edcebd52ac54a39456587e293231f79c24e3845dd1d4ba09c65974b988e38a0565d190cb6f0f2b822e0add32ee6f9c9d0c8b84877c23f796931638c58acc712d5b96c5bd4b64b14f45c8df899215b6a1222222826222202fa47f4a2be6b9325a1e6cbc48212b168953ba6aec5bf4a102aa4ea94a1127fd1b2225a9c70bd559dbc2d2aa65f5d4e5bb577a34991d5c6647971350b72192ed692e5588a7bd3ed5beab6fd2a7394dac536a8e498b25b1d5a77a3da1ed092f95cf3e7579e9952ae551fa8542a0e36ccc9cef30b24e089088f64444893abc4e9c598a2d8b725fd497a4512db9755a496a1eb64e0b22f7ecf5732f9d72e6ba2e0719a4dd556a9c92a2b9a4697526c5b28ee69e122ef169e52574998acd361c3830c45a831596d98edb5c222d88f0aaebb5034c86625b720074ce914973ad1769c6c48b7644a984f292c94318a39a0d48a93588b2b5696f56edcf1092950834170f2a86cfd197aaa5aa3be4fd1e9ee1731323a95cadda44440445c9b0274b480ea241c57d6040aadc371d32d9b6e96e57aedab169a7d2daff00acf17d5b23cc444b3795196b77e7ddd2e50b2ee9e13babb9a6a1724bff00bba9bed7d739fab1d4bd39d9af653b4f66ea1bbe4fc4eb5744ec302aa5c73b0e99328bba3f66de1d911461c364fd99e9fb36d88715d90156bbeac4326b959d3d1d61eee8f75b1e51153aa229a2222202222089f3c767ea1e77c180ec99326dfbb29244f51ae8a596ee6d35cfce25da1e5d4d970928427e70de19232029f9df6f3a54bc0b4b39916cc527a03c3de9d1c7ce472ef169d2ae3aebc961b96c932f360eb45c24db83ab0c511947243740aad32efa43556b7aa70ae0a4ba3a826d2de190dfb443cbed2eec594f43737915e3631f092d72e9d8bac39f567ab9681d4f2d6e57351794ad49451449cef38cfa373dd5ad546c4da36c3270a995eb5336a9cd8e918f70472a6d44bf7cdea6fded28ab04a53abb3aa91c5994f0bad896ae5d2b4bcc8b868f67da722e0ae4c1a7d2e9ee36322590910b22e382d89169e51d443c5d95a3ceda26759d890e6164edf5670b3e92752e28d6a1097ed2391169f657621ed1f91b9874b9945919816e4b87528ee459949acb850c9e65c1d2e36e0bda7b24a328e5d275465936271a269c26cc749211ead3ac5b774f2ef5b12d2a0e8399d1b679811e8776d7635d79651dc18b6edfd4994dce720b25e8e1d49b6c88bcdf28bc2243a548b1f37f2f66515cad319816c3b476f9a5f9519111f648b52d1946516f465936c71d274b5196a518e73cb9978d46ddc99a016f6e2bd885caa69221f27d05b704a43ce69e5df6916c7da5c69d9d13b33a5634bc93b6a45f951c4f745735498722dbf07f584e3823d60879b76dea560367fd9f5aca06ead5cacd55dbaf30ee23176bd71ca0d24f90f2b2c8fd5b2df288fb4acaebf7491949005896ec5c86cdfb9f26062b54ca2d44bf08ac9687569799d223361b645cce0908b9a7baa4e524e7b6445bd9f76ab14bab948815182f612e935aa796ee5d3250f2bcc97de1ed0fccabad4ee1ccfca2c718599563d4af582cfa3bd6c78fd60e437de950fd20b9cba884494a75fba2464913ac39a7d212e2db4e48785b6849d79c2d2223cc44a1ff00fdadb2b41b78a4d4abd05e64b4944976ece6def7776b40be7680cc2cda7c6d4c9fcb4bea2d327799a8de2f52ca2c818e5ccdc3df696db22e21de11090aa635ca496497eccaabb9a5b48b12a9521c76cacaec1e6e54b8cef9aaa57e40eefab8972b831d9de6aeeb8e2b039a1b47d899410583b9ab1845aac9c3f14a1b0d93d53945d916e337a9c2f5b4e9505e596426723568d3ed3a64ba3e43d830db206a9f442f2a571cd58ea271e945e6c5c2c79887529af2a7662b072867bd56a5d2dca95cb2088e45c35978a5d41ec4bf3bc5cbecf42de8c718e2d7f3f1460e5a999fb5ab5ff6ce34acadcaa78b5636c34f7f3d561afc984a707863b65d3e8c4b570f12b2f6c5b34ab2edf8143a1d3e3d2e8f01918f161450ddb6cb63ca222b2e8a4c888883861874747e8549be516b4dba24bcbccd16d91c1ba5cef21d59ed7a7f1395c23eeb9f795dbc3e75a4672659d3738f2c6e4b32a987444abc3723ef079992c4781c1fd225a49516d71b2b9435f8ada6c953646cd3e0f35271374b190529c116e3fa4251fd6ae59156d43aba9c11e2ddeaecf78897ca7542aedb4e5a3700631aedb61e2a6d72261ab5138df0b7207bcdb8de9212ed6a58a911db9915e8ee8ea65e6c9b2f549707ad32aa58d9eafa169746e8e50f4641bb66e87ec7917833476dab4e28ef09f93205b79e6f569de36df77ef2e9910ee49c22d2ce9e2708b4e915cae4ba2e0a8dbf0e1d72bd32b549a68b6dc3a4088b6d910f0b625a79b8b4a9bac7d9da970198b50bd44abd5e21170a9e45a61412fb311fac21ef2ba31cbb54c7244b65e7b3d60d0e3d162d26d5af438bab772dc64b7c5fb42112d45e25afd52bc53fcb5736e60ef2739d63aa52c74c464b84748fde2572243145b5292e4a911e9943a4b23a89f71916db1ff32a8b7fde76cc9beab15aa7b2346a3d409b662c2ddf9e9cf0f093cdc71e2f39ddd2a7ac25af4a1e3a57dccc5e5658d914ba0cc6af6a65d532a8e36d952e9e23a9b121d5a9bd3d91e5e2515660c972eadf5af4b2df351886456a535c4db0d0970b3c3cc445d9567b22b61bbeb371d6ea557a79e56598f7a42703f9e6a0df745bfeae25e2d25e1565730fe4dccb6aa506085878c8cbcb86047dcb554a7f9c197a7fd29b2f4c58f7b9be725eaedf613d34e64bca5f078d7f1187d5c7ce2a6f586b26edcb36545a6b657eddd2a2eedb963bce17887d26ae56445687498b2ae182306152ea17410b62dbce448a44db843cc5ab954a77deca19d5978cc862a56105db4d21dd954ece78488c7bdd5cb4b83eead6699b4d5d79614d8f6fd76827123d3db1659f2fd224535e16c7874979bd25eb2d19ed6e8f745e857baa65db26b9fc9f5783764fd8f71badb3c4d8be24e0b7ea8ea5f183598f4ebaa972a6d0c6ae50c89c72dfab3651fad0e9e61d5cc42b76676d9c657a28d6e6af155087ef2d6331768c8d9934f834fae4fb5e97162c81942fc17b7d24887b225d91ef2a7933fbabf9b5fde77efab8e8377dc54ba85b96ab9698b31dc6ea5a845b1945f5622225d9ef2d32f7b546f4b75ca78b82c4e65ceb1064fd9bc3fc25cabb349b963dcd2863dbf4fae5d521ce56a8549912bee8a99b2f364ace9cd07da166d71cbca4385e7ab171b82525b1ed6e628ea2d5a7bda56cd3b7dc6b3ce316bdbb9db6909467252f8931c944f37223944a8c52ddcc88ef0932e7f9576357f62f556f4f92e32dab19690e9340992e8f7ac012730bb1c2de489cf171175a1ed3645d9ec8f2af3fb3a365acd2c8290f7e15da7266525b2e1b8284d94a84e0f78b4f133ed08aeb63f99c74bf2a2a59fb174fe1237a8844b72e6912ed2d661ce873b0d51e630f0f85c15b1e59d2bcb7703d71740e14da7b6e438ae1969179e2f4843e11534123a2e9ccae52e9bfd2aa9062fad207fccbe349b8e1dc72862dbf1ea7744a2e1162854f7a517c22a09b248a49b5b65bcf2bd87794bcb17e951ffd26e49ccc3d3fbbd5bcf854d567fc99d7f554b172f0cc8a6d0592d25d5ad7824f17aa4e3da7eea0aa0315e31d42db9a7bda57c5e26581f3b2186bf6af08af43e81f262e5253db65dae49b8ee8983e90e755085b73f761a456f707604c80a7869fe4c28f2bc52449cfbc498993c66cc46a3c5bce9b548f2a33ecd523f53902c3c25a5e6f8848b4f878562a430dca65e8ef0ea6dc126dc15ecbe706c0f9477ee59566dea1d9943b56aef47fc42ad0618b6e44787e76cb50f67e6d25e1225e3f5cd6bd6ac8b9ead6c5cb04a9971d1deeaf3a217c2e0f79b2e6d4a68370a06d0b7a5bb408f4928348ad9436f731ea534885cdd8f2ef0447888568754aa54ae0ad4cad56e71d4eb1334efa490e91111e56db1ec88af8228c6118a594a4fc3f465eaa95a821baa0d344bec4543f5690e31074c71d73243831e28f79c225360c728105b17dc6c463b622e3ee16edbd423c5c5eb2c499725c9b1274b4809117745766c4a15c59b151c6065edaf54bda4605bb2930dadd4064bf5929cd2d8fbcadae567c9a35aaf36dcccd9ba708d14b1e9fc1bb5c89a1d3a795e91cc45eafbc829dd3dc72b95e6e836fd3e65d57139cb49a233d61c1f13843c2d8f88895b2c9bf938ae6bcc58a966f5486dfa3179cfc12a0bda9f73c32250fdd6f57acaf2658e4cd9393143c29766db9068313e92eaccf9c70bbc45cc58ade54d06bf6558f40cbab762506d9a4c5a2d1e20e8662446f4000ad8111011110111101111011110111107120121d38e1d22b56b8f2b6cfbb8046b76bd22aa23fe950db73f856d688213abec5d91d5a021959616f1eae6ddc5ddf4fbabf6d6d8cf246cb9432a939656f46923caf944170be2535a20eac4831e9f1c588ac351d91e56d86f0011feec176911011110750a9d10cb5145608bbc4d8aec3602d0e901c070c3f20ae68808888088880888808888201da17638b1f6839615799d6addbc596f76c5c749f372301ec8b9f91c11ee92a89766c079d76cbc7e47996cdf30f02f3646e153e5e23facd43bbf7497a6ff3fe74ff009ad6b76f55ddf16cd5b9ba9ec93c9995b1c6d012e2b91decada6ba2e0e92ff00b491ff00ccb70b7765fdaee4ee608d62916e4211d22ed52a83309b1fdd89112f4e116bc761447dabf5dfee25ee79ff0045f9326e2bca6479d9b19bb52ad1016a2a6d11bdcb3ecb85c43eeab37947b2665664938122d8b5228d50474e3569b8758985eb3a5c4a644fef5b70aab876c5a93bacb3ba4fd444572a1752453a2ccc3cf4565efdab624bb6883509f94764551fc5e9768d1643b8f69c82df4fdd5c60e50d914d785e8b68d158707b4105bff2adc5163c3467c757523d362c2f4115963f64d88aeda22cb02f93ad36fb640e08b8de3f48961ab0c57d5104477e6c9d94399af9c9b8f2fa8550985fd67aa0839ef0ad221fc9dd90109fd4397f11d1d5ab74e3ce13787b3a959344111dbfb2764eda988e34bcb5b72210fd0430448bde2525532834da3b20d40a7c582d80e9108cc8b7a7dd592440444404444055f76a0d8cacada7e1b326a3bea0dd70c74c3b86008efc07ecdc1fac6fc24ac1220f1e2f2f93473d6db9c6d51a9f43bca1f4704a8b50186588f89b7b4f12d787e4f8da24c847f939881e23b821e91f75c5ed4220f2572e3e4b8ce39d7245ac5c158b6ad86a38936cb244539e8dab99c6c447764e7ac4ad865b7c9af9656ac909f783f50ccbaa876aba5a620fab1c787fdfa95ba4418da35129f6fd3d9834c851e9f1191106d88cd8b602387e6c056491101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111101111011110111107fffd9, 'El bien tiene todo malogrado', 'Informe', '001/mpch/2020', '121834362_3470549119719733_9125373523146317109_o.jpg', 1);

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
