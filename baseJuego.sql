CREATE DATABASE  IF NOT EXISTS `instaticket_puertaganadora` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `instaticket_puertaganadora`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: instaticket_puertaganadora
-- ------------------------------------------------------
-- Server version	5.5.5-10.2.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_nombre` varchar(45) DEFAULT NULL,
  `categoria_descripcion` varchar(45) DEFAULT NULL,
  `categoria_porcentaje_probabilidad` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `categoria_rango_minimo` int(11) DEFAULT NULL,
  `categoria_rango_maximo` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COMMENT='Representa a las categorías de los Premios a otorgar, mientras más categoría menor probabilidad de salir ganador el premio';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT  IGNORE INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_descripcion`, `categoria_porcentaje_probabilidad`, `estado_id`, `categoria_rango_minimo`, `categoria_rango_maximo`) VALUES (1,'CATEGORÍA A','Premios altamente costosos tales como motos, ',2,1,1,2),(2,'CATEGORÍA B','Premios costosos, celulares, tablets',4,1,3,5),(3,'CATEGORÍA C','Premios medianamente costosos, como casco de ',6,1,6,11),(4,'CATEGORÍA D','Premios un poco costosos, como zapatos de mar',12,1,12,23),(5,'CATEGORÍA E','Premio que son un poco grandes, como audifono',24,1,24,47),(6,'CATEGORÍA F','Premios pequeños como gorras, llaveros, pen d',53,1,48,100);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo`
--

DROP TABLE IF EXISTS `ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciclo` (
  `ciclo_id` int(11) NOT NULL AUTO_INCREMENT,
  `ciclo_nombre` varchar(45) DEFAULT NULL,
  `ciclo_descripcion` varchar(45) DEFAULT NULL,
  `ciclo_fecha_inicio` date DEFAULT NULL,
  `ciclo_fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`ciclo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Representa al ciclo en la cual los premios pertenecen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo`
--

LOCK TABLES `ciclo` WRITE;
/*!40000 ALTER TABLE `ciclo` DISABLE KEYS */;
INSERT  IGNORE INTO `ciclo` (`ciclo_id`, `ciclo_nombre`, `ciclo_descripcion`, `ciclo_fecha_inicio`, `ciclo_fecha_fin`) VALUES (12,'INTATICKET CICLO','ninguna','2018-11-18','2018-12-31');
/*!40000 ALTER TABLE `ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo_evento`
--

DROP TABLE IF EXISTS `ciclo_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciclo_evento` (
  `ciclo_evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `ciclo_id` int(11) DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `total_premios` int(11) DEFAULT NULL,
  `juego_puerta` varchar(45) DEFAULT NULL,
  `juego_carta` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ciclo_evento_id`),
  KEY `FK_CICLO_EVENTO_ESTADO_idx` (`estado_id`),
  KEY `FK_CICLO_EVENTO_CICLO_idx` (`ciclo_id`),
  KEY `FK_CICLO_EVENTO_EVENTO_idx` (`evento_id`),
  CONSTRAINT `FK_CICLO_EVENTO_CICLO` FOREIGN KEY (`ciclo_id`) REFERENCES `ciclo` (`ciclo_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CICLO_EVENTO_ESTADO` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CICLO_EVENTO_EVENTO` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo_evento`
--

LOCK TABLES `ciclo_evento` WRITE;
/*!40000 ALTER TABLE `ciclo_evento` DISABLE KEYS */;
INSERT  IGNORE INTO `ciclo_evento` (`ciclo_evento_id`, `ciclo_id`, `evento_id`, `estado_id`, `total_premios`, `juego_puerta`, `juego_carta`) VALUES (12,12,14,1,100,'S','S');
/*!40000 ALTER TABLE `ciclo_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciclo_evento_premio`
--

DROP TABLE IF EXISTS `ciclo_evento_premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciclo_evento_premio` (
  `ciclo_evento_premio_id` int(11) NOT NULL AUTO_INCREMENT,
  `ciclo_evento_id` int(11) DEFAULT NULL,
  `premio_id` int(11) DEFAULT NULL,
  `ciclo_evento_premio_stock_total` int(11) DEFAULT NULL COMMENT 'Total de premios al realizar la creacion',
  `ciclo_evento_premio_stock_disponible` int(11) DEFAULT NULL COMMENT 'Total de premios que han sido entregados a los clientes',
  `ciclo_evento_premio_stock_virtual` int(11) DEFAULT NULL COMMENT 'Total de premios que se han ganado los usuarios',
  `estado_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ciclo_evento_premio_id`),
  KEY `FK_CIC_EVE_PRE_PREMIO_idx` (`premio_id`),
  KEY `FK_CIC_EVE_PRE_CIC_EVE_idx` (`ciclo_evento_id`),
  KEY `FK_CIC_EVE_PRE_ESTADO_idx` (`estado_id`),
  CONSTRAINT `FK_CIC_EVE_PRE_CIC_EVE` FOREIGN KEY (`ciclo_evento_id`) REFERENCES `ciclo_evento` (`ciclo_evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CIC_EVE_PRE_ESTADO` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=latin1 COMMENT='Representa a los premios que estarán en un ciclo determinado';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciclo_evento_premio`
--

LOCK TABLES `ciclo_evento_premio` WRITE;
/*!40000 ALTER TABLE `ciclo_evento_premio` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciclo_evento_premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracion_evento`
--

DROP TABLE IF EXISTS `configuracion_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracion_evento` (
  `configuracion_evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `evento_id` int(11) DEFAULT NULL,
  `tipo_url_id` int(11) DEFAULT NULL,
  `configuracion_evento_url` varchar(200) DEFAULT NULL,
  `tipo_juego_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`configuracion_evento_id`),
  KEY `FK_CON_EVE_EVE_idx` (`evento_id`),
  KEY `FK_CON_EVE_TIP_URL_idx` (`tipo_url_id`),
  KEY `FK_CON_EVE_TIP_JUE_idx` (`tipo_juego_id`),
  CONSTRAINT `FK_CON_EVE_EVE` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CON_EVE_TIP_JUE` FOREIGN KEY (`tipo_juego_id`) REFERENCES `tipo_juegos` (`tipo_juego_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_CON_EVE_TIP_URL` FOREIGN KEY (`tipo_url_id`) REFERENCES `tipo_url` (`tipo_url_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracion_evento`
--

LOCK TABLES `configuracion_evento` WRITE;
/*!40000 ALTER TABLE `configuracion_evento` DISABLE KEYS */;
/*!40000 ALTER TABLE `configuracion_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado`
--

DROP TABLE IF EXISTS `estado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado` (
  `estado_id` int(11) NOT NULL,
  `estado_nombre` varchar(50) DEFAULT NULL,
  `estado_descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`estado_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado`
--

LOCK TABLES `estado` WRITE;
/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
INSERT  IGNORE INTO `estado` (`estado_id`, `estado_nombre`, `estado_descripcion`) VALUES (1,'Activo','Representa a un registro en la base de datos que se encuentra visible para el usuario'),(2,'Inactivo','Representa a un registro que ha sido eliminado lógicamente'),(3,'Leído','Representa a los mensajes que ha leído el administrado'),(4,'No Leído','Representa a los mensajes que no ha leído el administrador'),(5,'Entregado','Premio Entregado'),(7,'Generado',NULL);
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `evento_nombre` varchar(250) DEFAULT NULL,
  `evento_descripcion` varchar(250) DEFAULT NULL,
  `evento_total_jugadas` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `evento_url_imagen` text DEFAULT NULL,
  PRIMARY KEY (`evento_id`),
  KEY `FK_EVENTO_ESTADO_idx` (`estado_id`),
  CONSTRAINT `FK_EVENTO_ESTADO` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COMMENT='Representa el evento a jugar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT  IGNORE INTO `evento` (`evento_id`, `evento_nombre`, `evento_descripcion`, `evento_total_jugadas`, `estado_id`, `evento_url_imagen`) VALUES (14,'INTATICKET EVENTO','ninguna',0,1,'eventos/imagenes/evento_14.jpg');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incremento_probabilidad_premio`
--

DROP TABLE IF EXISTS `incremento_probabilidad_premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `incremento_probabilidad_premio` (
  `inc_pro_pre_id` int(11) NOT NULL AUTO_INCREMENT,
  `premio_id` int(11) NOT NULL,
  `inc_pro_pre_nombre` varchar(45) DEFAULT NULL,
  `inc_pro_pre_descripcion` varchar(45) DEFAULT NULL,
  `inc_pro_pre_url_imagen` text DEFAULT NULL,
  `inc_pro_pre_porcentaje_probabilidad` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `inc_pro_pre_cantidad` int(11) DEFAULT NULL COMMENT 'Cantidad de premios que serán de incentivo',
  `inc_pro_pre_cantidad_disponible` int(11) DEFAULT NULL COMMENT 'Representa a la cantidad en stock, se descuenta cuando se le entrega el premio al usuario.',
  `inc_pro_pre_cantidad_virtual` int(11) DEFAULT NULL COMMENT 'Representa a la cantidad que de premios que se gana por medio del servicio web',
  `inc_pro_pre_fecha_incremento` date DEFAULT NULL,
  `inc_pro_pre_hora_inicio_incremento` time DEFAULT NULL,
  `inc_pro_pre_hora_fin_incremento` time DEFAULT NULL,
  `evento_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `ciclo_evento_premio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`inc_pro_pre_id`),
  KEY `FK_INC_PRO_PRE_PREMIO_idx` (`premio_id`),
  KEY `FK_INC_PRO_PRE_CATEGORIA_idx` (`categoria_id`),
  KEY `FK_INC_PRO_PRE_EVENTO_idx` (`evento_id`),
  CONSTRAINT `FK_INC_PRO_PRE_CATEGORIA` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_INC_PRO_PRE_EVENTO` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COMMENT='Representa a los premios para que se regalen en un dia y hora especifico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incremento_probabilidad_premio`
--

LOCK TABLES `incremento_probabilidad_premio` WRITE;
/*!40000 ALTER TABLE `incremento_probabilidad_premio` DISABLE KEYS */;
/*!40000 ALTER TABLE `incremento_probabilidad_premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_categoria`
--

DROP TABLE IF EXISTS `log_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_categoria` (
  `log_categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_categoria_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_categoria`
--

LOCK TABLES `log_categoria` WRITE;
/*!40000 ALTER TABLE `log_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ciclo`
--

DROP TABLE IF EXISTS `log_ciclo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_ciclo` (
  `log_ciclo_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_ciclo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ciclo`
--

LOCK TABLES `log_ciclo` WRITE;
/*!40000 ALTER TABLE `log_ciclo` DISABLE KEYS */;
INSERT  IGNORE INTO `log_ciclo` (`log_ciclo_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,NULL,'CICLO_ID: 1 |NOMBRE: CICLO PRUEBA 1 |DESCRIPCIÓN: Prueba |FECHA_INICIO: 2018-04-12 |FECHA_FIN: 2018-05-31','I','2018-04-11 14:59:49',1),(2,NULL,'CICLO_ID: 2 |NOMBRE: CICLO 2  |DESCRIPCIÓN: Ciclo 2 |FECHA_INICIO: 2018-04-17 |FECHA_FIN: 2018-05-15','I','2018-04-16 14:38:54',2),(3,NULL,'CICLO_ID: 3 |NOMBRE: CICLO MAYO |DESCRIPCIÓN: Carrera  |FECHA_INICIO: 2018-05-01 |FECHA_FIN: 2018-05-04','I','2018-04-23 20:39:27',3),(4,'CICLO_ID: 3 |NOMBRE: CICLO MAYO |DESCRIPCIÓN: Carrera  |FECHA_INICIO: 2018-05-01 |FECHA_FIN: 2018-05-04','CICLO_ID: 3 |NOMBRE: CICLO MAYO |DESCRIPCIÓN: Carrera  |FECHA_INICIO: 2018-04-24 |FECHA_FIN: 2018-04-27','A','2018-04-23 21:04:24',3),(5,NULL,'CICLO_ID: 4 |NOMBRE: CLICLO PRUEBA INNOVASYSTEM |DESCRIPCIÓN: Prueba |FECHA_INICIO: 2018-06-12 |FECHA_FIN: 2018-07-31','I','2018-06-11 17:40:56',4),(6,NULL,'CICLO_ID: 5 |NOMBRE: CICLO DE PRUEBA |DESCRIPCIÓN: Prueba |FECHA_INICIO: 2018-08-22 |FECHA_FIN: 2018-09-30','I','2018-08-21 17:05:23',5),(7,NULL,'CICLO_ID: 6 |NOMBRE: CICLO DE PRUEBA INNOVA |DESCRIPCIÓN: ciclo de prueba Innova |FECHA_INICIO: 2018-08-23 |FECHA_FIN: 2018-09-29','I','2018-08-22 14:58:53',6),(8,NULL,'CICLO_ID: 7 |NOMBRE: CICLO_INSTATICKET |DESCRIPCIÓN: Ciclo_Instaticket |FECHA_INICIO: 2018-09-06 |FECHA_FIN: 2018-10-30','I','2018-09-06 19:58:15',7),(9,NULL,'CICLO_ID: 8 |NOMBRE: JUEGO P |DESCRIPCIÓN: hola |FECHA_INICIO: 2018-09-24 |FECHA_FIN: 2018-09-30','I','2018-09-24 15:15:13',8),(10,NULL,'CICLO_ID: 9 |NOMBRE: INTATICKET CICLO |DESCRIPCIÓN: Intaticket Ciclo |FECHA_INICIO: 2018-09-24 |FECHA_FIN: 2018-10-31','I','2018-09-24 16:58:31',9),(11,NULL,'CICLO_ID: 10 |NOMBRE: INTATICKET CICLO |DESCRIPCIÓN: Intaticket Ciclo |FECHA_INICIO: 2018-09-25 |FECHA_FIN: 2018-10-31','I','2018-09-25 20:23:01',10),(12,NULL,'CICLO_ID: 11 |NOMBRE: INTATICKET CICLO |DESCRIPCIÓN: Intaticket Ciclo |FECHA_INICIO: 2018-09-27 |FECHA_FIN: 2018-10-31','I','2018-09-27 21:32:41',11),(13,NULL,'CICLO_ID: 12 |NOMBRE: INTATICKET CICLO |DESCRIPCIÓN: ninguna |FECHA_INICIO: 2018-11-18 |FECHA_FIN: 2018-12-31','I','2018-11-18 23:03:32',12);
/*!40000 ALTER TABLE `log_ciclo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ciclo_evento`
--

DROP TABLE IF EXISTS `log_ciclo_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_ciclo_evento` (
  `log_ciclo_evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_ciclo_evento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ciclo_evento`
--

LOCK TABLES `log_ciclo_evento` WRITE;
/*!40000 ALTER TABLE `log_ciclo_evento` DISABLE KEYS */;
INSERT  IGNORE INTO `log_ciclo_evento` (`log_ciclo_evento_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,NULL,'CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','I','2018-04-11 15:04:04',1),(2,'CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 110 |ESTADO: 1-Activo','A','2018-04-11 15:17:31',1),(3,'CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 110 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 99 |ESTADO: 1-Activo','A','2018-04-11 15:17:42',1),(4,'CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 99 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','A','2018-04-11 15:20:46',1),(5,'CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 1 |CICLO: 1-CICLO PRUEBA 1 |EVENTO: 1-EVENTO |TOT. PREMIOS: 153 |ESTADO: 1-Activo','A','2018-04-13 14:50:01',1),(6,NULL,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 24 |ESTADO: 1-Activo','I','2018-04-16 14:41:20',2),(7,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 24 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 24 |ESTADO: 1-Activo','A','2018-04-16 14:41:33',2),(8,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 24 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 67 |ESTADO: 1-Activo','A','2018-04-16 14:42:09',2),(9,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 67 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 12 |ESTADO: 2-Inactivo','A','2018-04-16 14:42:21',2),(10,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 12 |ESTADO: 2-Inactivo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 12 |ESTADO: 1-Activo','A','2018-04-16 14:42:30',2),(11,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 12 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 12 |ESTADO: 1-Activo','A','2018-04-16 14:43:05',2),(12,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 12 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 3 |ESTADO: 1-Activo','A','2018-04-16 14:43:21',2),(13,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 3 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 1 |ESTADO: 1-Activo','A','2018-04-16 14:45:34',2),(14,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 1 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 60 |ESTADO: 1-Activo','A','2018-04-16 14:50:38',2),(15,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 60 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 34 |ESTADO: 1-Activo','A','2018-04-16 14:51:23',2),(16,'CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 34 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 2 |CICLO: 2-CICLO 2  |EVENTO: 2-EVENTO 2 |TOT. PREMIOS: 45 |ESTADO: 1-Activo','A','2018-04-16 14:51:50',2),(17,NULL,'CICLO_EVENTO_ID: 3 |CICLO: 3-CICLO MAYO |EVENTO: 5-CARRERA INNOVA |TOT. PREMIOS: 10 |ESTADO: 1-Activo','I','2018-04-23 21:01:22',3),(18,NULL,'CICLO_EVENTO_ID: 4 |CICLO: 4-CLICLO PRUEBA INNOVASYSTEM |EVENTO: 6-INNOVASYSTEM |TOT. PREMIOS: 200 |ESTADO: 1-Activo','I','2018-06-11 17:46:03',4),(19,NULL,'CICLO_EVENTO_ID: 5 |CICLO: 5-CICLO DE PRUEBA |EVENTO: 7-PRUEBA INSTATICKET |TOT. PREMIOS: 300 |ESTADO: 1-Activo','I','2018-08-21 17:06:24',5),(20,NULL,'CICLO_EVENTO_ID: 6 |CICLO: 6-CICLO DE PRUEBA INNOVA |EVENTO: 8-INNOVA PRUEBA |TOT. PREMIOS: 600 |ESTADO: 1-Activo','I','2018-08-22 14:59:59',6),(21,NULL,'CICLO_EVENTO_ID: 7 |CICLO: 7-CICLO_INSTATICKET |EVENTO: 9-INTATICKET |TOT. PREMIOS: 200 |ESTADO: 1-Activo','I','2018-09-06 20:05:50',7),(22,NULL,'CICLO_EVENTO_ID: 8 |CICLO: 8-JUEGO P |EVENTO: 10-FIESTA |TOT. PREMIOS: 22 |ESTADO: 1-Activo','I','2018-09-24 15:40:13',8),(23,NULL,'CICLO_EVENTO_ID: 9 |CICLO: 9-INTATICKET CICLO |EVENTO: 11-INTATICKET EVENTO |TOT. PREMIOS: 200 |ESTADO: 1-Activo','I','2018-09-24 17:03:23',9),(24,'CICLO_EVENTO_ID: 9 |CICLO: 9-INTATICKET CICLO |EVENTO: 11-INTATICKET EVENTO |TOT. PREMIOS: 200 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 9 |CICLO: 9-INTATICKET CICLO |EVENTO: 11-INTATICKET EVENTO |TOT. PREMIOS: 220 |ESTADO: 1-Activo','A','2018-09-24 17:03:40',9),(25,'CICLO_EVENTO_ID: 9 |CICLO: 9-INTATICKET CICLO |EVENTO: 11-INTATICKET EVENTO |TOT. PREMIOS: 220 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 9 |CICLO: 9-INTATICKET CICLO |EVENTO: 11-INTATICKET EVENTO |TOT. PREMIOS: 230 |ESTADO: 1-Activo','A','2018-09-24 17:04:18',9),(26,'CICLO_EVENTO_ID: 9 |CICLO: 9-INTATICKET CICLO |EVENTO: 11-INTATICKET EVENTO |TOT. PREMIOS: 230 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 9 |CICLO: 9-INTATICKET CICLO |EVENTO: 11-INTATICKET EVENTO |TOT. PREMIOS: 250 |ESTADO: 1-Activo','A','2018-09-24 17:09:17',9),(27,NULL,'CICLO_EVENTO_ID: 10 |CICLO: 10-INTATICKET CICLO |EVENTO: 12-INTATICKET EVENTO |TOT. PREMIOS: 120 |ESTADO: 1-Activo','I','2018-09-25 20:24:22',10),(28,NULL,'CICLO_EVENTO_ID: 11 |CICLO: 11-INTATICKET CICLO |EVENTO: 13-INTATICKET EVENTO |TOT. PREMIOS: 203 |ESTADO: 1-Activo','I','2018-09-27 21:37:23',11),(29,NULL,'CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','I','2018-11-18 23:07:33',12),(30,'CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','A','2018-11-18 23:12:19',12),(31,'CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','A','2018-11-18 23:13:24',12),(32,'CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','A','2018-11-18 23:28:18',12),(33,'CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','A','2018-11-18 23:29:05',12),(34,'CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','A','2018-11-18 23:46:55',12),(35,'CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','A','2018-11-18 23:48:05',12),(36,'CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','CICLO_EVENTO_ID: 12 |CICLO: 12-INTATICKET CICLO |EVENTO: 14-INTATICKET EVENTO |TOT. PREMIOS: 100 |ESTADO: 1-Activo','A','2018-11-19 00:07:05',12);
/*!40000 ALTER TABLE `log_ciclo_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ciclo_evento_premio`
--

DROP TABLE IF EXISTS `log_ciclo_evento_premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_ciclo_evento_premio` (
  `log_ciclo_evento_premio_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_ciclo_evento_premio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ciclo_evento_premio`
--

LOCK TABLES `log_ciclo_evento_premio` WRITE;
/*!40000 ALTER TABLE `log_ciclo_evento_premio` DISABLE KEYS */;
INSERT  IGNORE INTO `log_ciclo_evento_premio` (`log_ciclo_evento_premio_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,NULL,'CICLO_EVENTO_PREMIO_ID: 1 |CICLO - EVENTO: 1-CICLO PRUEBA 1-EVENTO |PREMIO: 1-PREMIO 1 |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-04-11 15:04:17',1),(2,NULL,'CICLO_EVENTO_PREMIO_ID: 2 |CICLO - EVENTO: 1-CICLO PRUEBA 1-EVENTO |PREMIO: 2-PREMIO 2 |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-04-11 15:04:31',2),(3,NULL,'CICLO_EVENTO_PREMIO_ID: 3 |CICLO - EVENTO: 1-CICLO PRUEBA 1-EVENTO |PREMIO: 3-PENDRIVE |STOCK TOTAL: 25 |STOCK DISPONIBLE: 25 |ESTADO: 1-Activo','I','2018-04-13 14:50:25',3),(4,NULL,'CICLO_EVENTO_PREMIO_ID: 4 |CICLO - EVENTO: 1-CICLO PRUEBA 1-EVENTO |PREMIO: 6-CHOMPA |STOCK TOTAL: 25 |STOCK DISPONIBLE: 25 |ESTADO: 1-Activo','I','2018-04-13 14:50:35',4),(5,NULL,'CICLO_EVENTO_PREMIO_ID: 5 |CICLO - EVENTO: 1-CICLO PRUEBA 1-EVENTO |PREMIO: 4-CELULAR |STOCK TOTAL: 2 |STOCK DISPONIBLE: 2 |ESTADO: 1-Activo','I','2018-04-13 14:50:49',5),(6,NULL,'CICLO_EVENTO_PREMIO_ID: 6 |CICLO - EVENTO: 1-CICLO PRUEBA 1-EVENTO |PREMIO: 5-MOTO |STOCK TOTAL: 1 |STOCK DISPONIBLE: 1 |ESTADO: 1-Activo','I','2018-04-13 14:51:10',6),(7,NULL,'CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 12 |STOCK DISPONIBLE: 12 |ESTADO: 1-Activo','I','2018-04-16 15:01:05',7),(8,'CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 12 |STOCK DISPONIBLE: 12 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 12 |STOCK DISPONIBLE: 12 |ESTADO: 2-Inactivo','A','2018-04-16 15:18:37',7),(9,'CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 12 |STOCK DISPONIBLE: 12 |ESTADO: 2-Inactivo','CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 5 |STOCK DISPONIBLE: 5 |ESTADO: 1-Activo','A','2018-04-16 15:18:50',7),(10,'CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 5 |STOCK DISPONIBLE: 5 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 6 |STOCK DISPONIBLE: 6 |ESTADO: 1-Activo','A','2018-04-16 15:19:03',7),(11,'CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 6 |STOCK DISPONIBLE: 6 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 20 |STOCK DISPONIBLE: 20 |ESTADO: 1-Activo','A','2018-04-16 15:21:52',7),(12,'CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 20 |STOCK DISPONIBLE: 20 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 17 |STOCK DISPONIBLE: 17 |ESTADO: 1-Activo','A','2018-04-16 15:54:14',7),(13,'CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 17 |STOCK DISPONIBLE: 14 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 7 |CICLO - EVENTO: 2-CICLO 2 -EVENTO 2 |PREMIO: 1-GORRA |STOCK TOTAL: 45 |STOCK DISPONIBLE: 42 |ESTADO: 1-Activo','A','2018-04-16 15:55:36',7),(14,NULL,'CICLO_EVENTO_PREMIO_ID: 8 |CICLO - EVENTO: 3-CICLO MAYO-CARRERA INNOVA |PREMIO: 7-COMPUTADORA |STOCK TOTAL: 3 |STOCK DISPONIBLE: 3 |ESTADO: 1-Activo','I','2018-04-23 21:01:59',8),(15,NULL,'CICLO_EVENTO_PREMIO_ID: 9 |CICLO - EVENTO: 3-CICLO MAYO-CARRERA INNOVA |PREMIO: 8-SILLA |STOCK TOTAL: 3 |STOCK DISPONIBLE: 3 |ESTADO: 1-Activo','I','2018-04-23 21:02:14',9),(16,NULL,'CICLO_EVENTO_PREMIO_ID: 10 |CICLO - EVENTO: 3-CICLO MAYO-CARRERA INNOVA |PREMIO: 9-PELOTA |STOCK TOTAL: 4 |STOCK DISPONIBLE: 4 |ESTADO: 1-Activo','I','2018-04-23 21:02:36',10),(17,NULL,'CICLO_EVENTO_PREMIO_ID: 11 |CICLO - EVENTO: 4-CLICLO PRUEBA INNOVASYSTEM-INNOVASYSTEM |PREMIO: 10-GORRA ADIDAS PRUEBA |STOCK TOTAL: 150 |STOCK DISPONIBLE: 150 |ESTADO: 1-Activo','I','2018-06-11 17:46:25',11),(18,NULL,'CICLO_EVENTO_PREMIO_ID: 12 |CICLO - EVENTO: 4-CLICLO PRUEBA INNOVASYSTEM-INNOVASYSTEM |PREMIO: 7-MOTO HONDA |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-06-11 17:46:38',12),(19,'CICLO_EVENTO_PREMIO_ID: 12 |CICLO - EVENTO: 4-CLICLO PRUEBA INNOVASYSTEM-INNOVASYSTEM |PREMIO: 7-MOTO HONDA |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 12 |CICLO - EVENTO: 4-CLICLO PRUEBA INNOVASYSTEM-INNOVASYSTEM |PREMIO: 7-MOTO HONDA |STOCK TOTAL: 2 |STOCK DISPONIBLE: 2 |ESTADO: 1-Activo','A','2018-06-11 17:47:37',12),(20,NULL,'CICLO_EVENTO_PREMIO_ID: 13 |CICLO - EVENTO: 4-CLICLO PRUEBA INNOVASYSTEM-INNOVASYSTEM |PREMIO: 9-TOMATODO NIKE |STOCK TOTAL: 48 |STOCK DISPONIBLE: 48 |ESTADO: 1-Activo','I','2018-06-11 17:47:59',13),(21,NULL,'CICLO_EVENTO_PREMIO_ID: 14 |CICLO - EVENTO: 5-CICLO DE PRUEBA-PRUEBA INSTATICKET |PREMIO: 2-TOMATODO |STOCK TOTAL: 300 |STOCK DISPONIBLE: 300 |ESTADO: 1-Activo','I','2018-08-21 17:07:03',14),(22,NULL,'CICLO_EVENTO_PREMIO_ID: 15 |CICLO - EVENTO: 6-CICLO DE PRUEBA INNOVA-INNOVA PRUEBA |PREMIO: 6-CHOMPA |STOCK TOTAL: 300 |STOCK DISPONIBLE: 300 |ESTADO: 1-Activo','I','2018-08-22 15:02:00',15),(23,NULL,'CICLO_EVENTO_PREMIO_ID: 16 |CICLO - EVENTO: 6-CICLO DE PRUEBA INNOVA-INNOVA PRUEBA |PREMIO: 2-TOMATODO |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-08-22 15:02:39',16),(24,NULL,'CICLO_EVENTO_PREMIO_ID: 17 |CICLO - EVENTO: 6-CICLO DE PRUEBA INNOVA-INNOVA PRUEBA |PREMIO: 3-PENDRIVE |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-08-22 15:03:01',17),(25,NULL,'CICLO_EVENTO_PREMIO_ID: 18 |CICLO - EVENTO: 6-CICLO DE PRUEBA INNOVA-INNOVA PRUEBA |PREMIO: 8-GORRA ADIDAS |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-08-22 15:03:21',18),(26,NULL,'CICLO_EVENTO_PREMIO_ID: 19 |CICLO - EVENTO: 6-CICLO DE PRUEBA INNOVA-INNOVA PRUEBA |PREMIO: 4-CELULAR |STOCK TOTAL: 100 |STOCK DISPONIBLE: 100 |ESTADO: 1-Activo','I','2018-08-22 15:03:44',19),(27,NULL,'CICLO_EVENTO_PREMIO_ID: 20 |CICLO - EVENTO: 6-CICLO DE PRUEBA INNOVA-INNOVA PRUEBA |PREMIO: 5-MOTO |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-08-22 15:04:08',20),(28,NULL,'CICLO_EVENTO_PREMIO_ID: 21 |CICLO - EVENTO: 7-CICLO_INSTATICKET-INTATICKET |PREMIO: 11-GORRA ADIDAS INSTATICKET |STOCK TOTAL: 100 |STOCK DISPONIBLE: 100 |ESTADO: 1-Activo','I','2018-09-06 20:06:32',21),(29,NULL,'CICLO_EVENTO_PREMIO_ID: 22 |CICLO - EVENTO: 1-Ciclo BarceFest-BarceFest |PREMIO: 9-TOMATODO NIKE |STOCK TOTAL: 100 |STOCK DISPONIBLE: 100 |ESTADO: 1-Activo','I','2018-09-06 20:07:01',22),(30,NULL,'CICLO_EVENTO_PREMIO_ID: 23 |CICLO - EVENTO: 7-CICLO_INSTATICKET-INTATICKET |PREMIO: 9-TOMATODO NIKE |STOCK TOTAL: 100 |STOCK DISPONIBLE: 100 |ESTADO: 1-Activo','I','2018-09-06 20:08:03',23),(31,NULL,'CICLO_EVENTO_PREMIO_ID: 24 |CICLO - EVENTO: 8-JUEGO P-FIESTA |PREMIO: 12-GRANDE |STOCK TOTAL: 1 |STOCK DISPONIBLE: 1 |ESTADO: 1-Activo','I','2018-09-24 15:41:10',24),(32,NULL,'CICLO_EVENTO_PREMIO_ID: 25 |CICLO - EVENTO: 8-JUEGO P-FIESTA |PREMIO: 14-MEDIO |STOCK TOTAL: 10 |STOCK DISPONIBLE: 10 |ESTADO: 1-Activo','I','2018-09-24 15:41:33',25),(33,NULL,'CICLO_EVENTO_PREMIO_ID: 26 |CICLO - EVENTO: 8-JUEGO P-FIESTA |PREMIO: 13-PEQUE |STOCK TOTAL: 11 |STOCK DISPONIBLE: 11 |ESTADO: 1-Activo','I','2018-09-24 15:41:51',26),(34,NULL,'CICLO_EVENTO_PREMIO_ID: 27 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 15-MOTO |STOCK TOTAL: 2 |STOCK DISPONIBLE: 2 |ESTADO: 1-Activo','I','2018-09-24 17:04:38',27),(35,'CICLO_EVENTO_PREMIO_ID: 27 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 15-MOTO |STOCK TOTAL: 2 |STOCK DISPONIBLE: 2 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 27 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 15-MOTO |STOCK TOTAL: 3 |STOCK DISPONIBLE: 3 |ESTADO: 1-Activo','A','2018-09-24 17:04:58',27),(36,'CICLO_EVENTO_PREMIO_ID: 27 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 15-MOTO |STOCK TOTAL: 3 |STOCK DISPONIBLE: 3 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 27 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 15-MOTO |STOCK TOTAL: 1 |STOCK DISPONIBLE: 1 |ESTADO: 1-Activo','A','2018-09-24 17:06:18',27),(37,'CICLO_EVENTO_PREMIO_ID: 27 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 15-MOTO |STOCK TOTAL: 1 |STOCK DISPONIBLE: 1 |ESTADO: 1-Activo','CICLO_EVENTO_PREMIO_ID: 27 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 15-MOTO |STOCK TOTAL: 3 |STOCK DISPONIBLE: 3 |ESTADO: 1-Activo','A','2018-09-24 17:06:40',27),(38,NULL,'CICLO_EVENTO_PREMIO_ID: 28 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 16-GORRA |STOCK TOTAL: 100 |STOCK DISPONIBLE: 100 |ESTADO: 1-Activo','I','2018-09-24 17:09:37',28),(39,NULL,'CICLO_EVENTO_PREMIO_ID: 29 |CICLO - EVENTO: 9-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 17-TOMATODO |STOCK TOTAL: 147 |STOCK DISPONIBLE: 147 |ESTADO: 1-Activo','I','2018-09-24 17:10:15',29),(40,NULL,'CICLO_EVENTO_PREMIO_ID: 30 |CICLO - EVENTO: 10-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 18-MOTO |STOCK TOTAL: 1 |STOCK DISPONIBLE: 1 |ESTADO: 1-Activo','I','2018-09-25 20:29:26',30),(41,NULL,'CICLO_EVENTO_PREMIO_ID: 31 |CICLO - EVENTO: 10-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 19-CELULAR |STOCK TOTAL: 2 |STOCK DISPONIBLE: 2 |ESTADO: 1-Activo','I','2018-09-25 20:29:34',31),(42,NULL,'CICLO_EVENTO_PREMIO_ID: 32 |CICLO - EVENTO: 10-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 20-BUZO |STOCK TOTAL: 30 |STOCK DISPONIBLE: 30 |ESTADO: 1-Activo','I','2018-09-25 20:29:42',32),(43,NULL,'CICLO_EVENTO_PREMIO_ID: 33 |CICLO - EVENTO: 10-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 21-GORRA |STOCK TOTAL: 30 |STOCK DISPONIBLE: 30 |ESTADO: 1-Activo','I','2018-09-25 20:29:50',33),(44,NULL,'CICLO_EVENTO_PREMIO_ID: 34 |CICLO - EVENTO: 10-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 22-LLAVERO |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-09-25 20:30:09',34),(45,NULL,'CICLO_EVENTO_PREMIO_ID: 35 |CICLO - EVENTO: 10-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 23-TOMATODO |STOCK TOTAL: 7 |STOCK DISPONIBLE: 7 |ESTADO: 1-Activo','I','2018-09-25 20:30:45',35),(46,NULL,'CICLO_EVENTO_PREMIO_ID: 36 |CICLO - EVENTO: 11-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 24-MOTO |STOCK TOTAL: 1 |STOCK DISPONIBLE: 1 |ESTADO: 1-Activo','I','2018-09-27 21:37:39',36),(47,NULL,'CICLO_EVENTO_PREMIO_ID: 37 |CICLO - EVENTO: 11-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 25-CELULAR |STOCK TOTAL: 2 |STOCK DISPONIBLE: 2 |ESTADO: 1-Activo','I','2018-09-27 21:37:46',37),(48,NULL,'CICLO_EVENTO_PREMIO_ID: 38 |CICLO - EVENTO: 11-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 26-LLAVERO |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-09-27 21:37:56',38),(49,NULL,'CICLO_EVENTO_PREMIO_ID: 39 |CICLO - EVENTO: 11-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 27-BUZO |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-09-27 21:38:05',39),(50,NULL,'CICLO_EVENTO_PREMIO_ID: 40 |CICLO - EVENTO: 11-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 28-GORRA |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-09-27 21:38:13',40),(51,NULL,'CICLO_EVENTO_PREMIO_ID: 41 |CICLO - EVENTO: 11-INTATICKET CICLO-INTATICKET EVENTO |PREMIO: 29-TOMATODO |STOCK TOTAL: 50 |STOCK DISPONIBLE: 50 |ESTADO: 1-Activo','I','2018-09-27 21:38:57',41);
/*!40000 ALTER TABLE `log_ciclo_evento_premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_evento`
--

DROP TABLE IF EXISTS `log_evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_evento` (
  `log_evento_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_evento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_evento`
--

LOCK TABLES `log_evento` WRITE;
/*!40000 ALTER TABLE `log_evento` DISABLE KEYS */;
INSERT  IGNORE INTO `log_evento` (`log_evento_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,'EVENTO_ID: 1 |NOMBRE: EVENTO |DESCRIPCIÓN: EVENTO |TOT. JUGADAS: 0 |IMAGEN:  |ESTADO: 1-Activo','EVENTO_ID: 1 |NOMBRE: EVENTO |DESCRIPCIÓN: EVENTO |TOT. JUGADAS:  |IMAGEN: eventos/imagenes/evento_1.jpg |ESTADO: 1-Activo','A','2018-04-11 15:03:27',1),(2,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 1 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_1_evento_1.mp4','A','2018-04-11 15:22:03',1),(3,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 2 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_2_evento_1.png','A','2018-04-11 15:22:35',1),(4,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 3 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_3_evento_1.png','A','2018-04-11 15:25:54',1),(5,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 4 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_4_evento_1.png','A','2018-04-11 15:26:18',1),(6,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 5 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_5_evento_1.mp3','A','2018-04-11 15:26:35',1),(7,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 6 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_6_evento_1.png','A','2018-04-11 15:27:13',1),(8,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 7 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_7_evento_1.png','A','2018-04-11 15:41:48',1),(9,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 8 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_8_evento_1.png','A','2018-04-11 15:42:03',1),(10,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 9 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_9_evento_1.png','A','2018-04-11 15:42:12',1),(11,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 6 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_6_evento_1.png','E','2018-04-11 21:57:04',1),(12,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 10 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_10_evento_1.png','A','2018-04-12 20:59:42',1),(13,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 11 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_11_evento_1.mp4','A','2018-04-12 21:49:02',1),(14,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 12 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_12_evento_1.png','A','2018-04-12 21:49:20',1),(15,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 13 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_13_evento_1.png','A','2018-04-12 21:50:11',1),(16,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 14 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_14_evento_1.png','A','2018-04-12 21:50:34',1),(17,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 15 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_15_evento_1.png','A','2018-04-12 21:51:22',1),(18,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 16 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_16_evento_1.png','A','2018-04-12 21:52:14',1),(19,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 17 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_17_evento_1.png','A','2018-04-12 21:52:26',1),(20,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 18 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_18_evento_1.png','A','2018-04-12 21:52:39',1),(21,NULL,'EVENTO_ID: 1 |NOMBRE: EVENTO |CONFIGURACION EVENTO: 19 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_19_evento_1.mp3','A','2018-04-12 21:53:42',1),(22,NULL,'EVENTO_ID: 4 |NOMBRE: NUEVO EVENTO |DESCRIPCIÓN: Evento Prueba |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_4.jpg |ESTADO: 1-Activo','I','2018-04-23 20:32:19',4),(23,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |DESCRIPCIÓN: Carrera Atlética |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_5.jpg |ESTADO: 1-Activo','I','2018-04-23 20:38:03',5),(24,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 20 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_20_evento_5.mp4','A','2018-04-23 21:05:26',5),(25,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 21 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_21_evento_5.png','A','2018-04-23 21:07:28',5),(26,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 22 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_22_evento_5.png','A','2018-04-23 21:08:18',5),(27,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 23 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_23_evento_5.png','A','2018-04-23 21:10:41',5),(28,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 24 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_24_evento_5.png','A','2018-04-23 21:12:21',5),(29,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 25 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_25_evento_5.png','A','2018-04-23 21:12:41',5),(30,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 26 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_26_evento_5.png','A','2018-04-23 21:13:07',5),(31,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 27 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_27_evento_5.mp3','A','2018-04-23 21:14:26',5),(32,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 28 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_28_evento_5.png','A','2018-04-23 21:15:13',5),(33,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 23 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_23_evento_5.png','E','2018-04-23 21:47:37',5),(34,NULL,'EVENTO_ID: 5 |NOMBRE: CARRERA INNOVA |CONFIGURACION EVENTO: 29 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_29_evento_5.png','A','2018-04-23 21:48:08',5),(35,NULL,'EVENTO_ID: 6 |NOMBRE: INNOVASYSTEM |DESCRIPCIÓN: Prueba |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_6.jpg |ESTADO: 1-Activo','I','2018-06-11 17:44:47',6),(36,NULL,'EVENTO_ID: 6 |NOMBRE: INNOVASYSTEM |CONFIGURACION EVENTO: 30 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_30_evento_6.mp4','A','2018-06-11 18:20:56',6),(37,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |DESCRIPCIÓN: Para el evento de llantas |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_7.jpg |ESTADO: 1-Activo','I','2018-08-21 17:04:22',7),(38,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 31 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_31_evento_7.mp4','A','2018-08-21 17:08:34',7),(39,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 32 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_32_evento_7.png','A','2018-08-21 17:10:17',7),(40,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 33 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_33_evento_7.jpg','A','2018-08-21 17:10:41',7),(41,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 34 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_34_evento_7.png','A','2018-08-21 17:10:57',7),(42,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 35 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_35_evento_7.mp3','A','2018-08-21 17:14:50',7),(43,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 36 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_36_evento_7.png','A','2018-08-21 17:15:09',7),(44,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 37 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_37_evento_7.png','A','2018-08-21 17:15:25',7),(45,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 38 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_38_evento_7.png','A','2018-08-21 17:15:42',7),(46,NULL,'EVENTO_ID: 7 |NOMBRE: PRUEBA INSTATICKET |CONFIGURACION EVENTO: 39 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_39_evento_7.png','A','2018-08-21 17:15:53',7),(47,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |DESCRIPCIÓN: Innova Prueba |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_8.jpg |ESTADO: 1-Activo','I','2018-08-22 14:58:10',8),(48,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 40 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_40_evento_8.mp4','A','2018-08-22 15:10:08',8),(49,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 41 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_41_evento_8.png','A','2018-08-22 15:10:47',8),(50,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 42 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_42_evento_8.png','A','2018-08-22 15:11:25',8),(51,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 43 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_43_evento_8.png','A','2018-08-22 15:11:43',8),(52,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 44 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_44_evento_8.mp3','A','2018-08-22 15:12:07',8),(53,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 45 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_45_evento_8.png','A','2018-08-22 15:12:30',8),(54,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 46 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_46_evento_8.png','A','2018-08-22 15:12:49',8),(55,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 47 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_47_evento_8.png','A','2018-08-22 15:13:20',8),(56,NULL,'EVENTO_ID: 8 |NOMBRE: INNOVA PRUEBA |CONFIGURACION EVENTO: 48 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_48_evento_8.png','A','2018-08-22 15:13:37',8),(57,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |DESCRIPCIÓN: Intaticket |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_9.jpg |ESTADO: 1-Activo','I','2018-09-06 19:56:23',9),(58,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 49 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_49_evento_9.mp4','A','2018-09-06 20:09:59',9),(59,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 50 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_50_evento_9.png','A','2018-09-06 20:10:45',9),(60,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 51 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_51_evento_9.jpg','A','2018-09-06 20:11:17',9),(61,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 52 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_52_evento_9.png','A','2018-09-06 20:11:38',9),(62,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 53 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_53_evento_9.mp3','A','2018-09-06 20:12:02',9),(63,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 54 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_54_evento_9.png','A','2018-09-06 20:12:44',9),(64,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 55 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_55_evento_9.png','A','2018-09-06 20:13:19',9),(65,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 56 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_56_evento_9.png','A','2018-09-06 20:13:37',9),(66,NULL,'EVENTO_ID: 9 |NOMBRE: INTATICKET |CONFIGURACION EVENTO: 57 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_57_evento_9.png','A','2018-09-06 20:13:55',9),(67,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |DESCRIPCIÓN: bien |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_10.jpg |ESTADO: 1-Activo','I','2018-09-24 15:24:21',10),(68,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 58 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_58_evento_10.png','A','2018-09-24 15:49:05',10),(69,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 59 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_59_evento_10.mp4','A','2018-09-24 15:49:33',10),(70,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 60 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_60_evento_10.png','A','2018-09-24 15:50:40',10),(71,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 61 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_61_evento_10.mp3','A','2018-09-24 15:51:14',10),(72,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 62 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_62_evento_10.png','A','2018-09-24 15:52:00',10),(73,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 63 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_63_evento_10.png','A','2018-09-24 15:52:43',10),(74,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 64 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_64_evento_10.png','A','2018-09-24 15:54:02',10),(75,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 64 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_64_evento_10.png','E','2018-09-24 15:54:11',10),(76,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 65 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_65_evento_10.png','A','2018-09-24 15:54:28',10),(77,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 66 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_66_evento_10.png','A','2018-09-24 15:54:51',10),(78,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 67 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_67_evento_10.png','A','2018-09-24 15:55:28',10),(79,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 67 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_67_evento_10.png','E','2018-09-24 15:55:45',10),(80,NULL,'EVENTO_ID: 10 |NOMBRE: FIESTA |CONFIGURACION EVENTO: 68 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_68_evento_10.png','A','2018-09-24 15:56:25',10),(81,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |DESCRIPCIÓN: Intaticket Evento |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_11.jpg |ESTADO: 1-Activo','I','2018-09-24 16:58:57',11),(82,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 69 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_69_evento_11.mp4','A','2018-09-24 17:10:50',11),(83,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 70 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_70_evento_11.mp3','A','2018-09-24 17:11:03',11),(84,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 71 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_71_evento_11.png','A','2018-09-24 17:11:20',11),(85,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 72 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_72_evento_11.png','A','2018-09-24 17:11:30',11),(86,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 73 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_73_evento_11.png','A','2018-09-24 17:11:39',11),(87,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 74 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_74_evento_11.png','A','2018-09-24 17:11:48',11),(88,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 75 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_75_evento_11.png','A','2018-09-24 17:11:59',11),(89,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 76 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_76_evento_11.png','A','2018-09-24 17:12:08',11),(90,NULL,'EVENTO_ID: 11 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 77 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_77_evento_11.png','A','2018-09-24 17:12:18',11),(91,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |DESCRIPCIÓN: Intaticket Evento |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_12.jpg |ESTADO: 1-Activo','I','2018-09-25 20:23:23',12),(92,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 78 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_78_evento_12.mp4','A','2018-09-25 20:31:11',12),(93,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 79 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_79_evento_12.png','A','2018-09-25 20:31:22',12),(94,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 80 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_80_evento_12.png','A','2018-09-25 20:31:31',12),(95,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 81 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_81_evento_12.png','A','2018-09-25 20:31:39',12),(96,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 82 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_82_evento_12.png','A','2018-09-25 20:31:46',12),(97,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 83 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_83_evento_12.png','A','2018-09-25 20:31:54',12),(98,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 84 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_84_evento_12.png','A','2018-09-25 20:32:01',12),(99,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 85 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_85_evento_12.png','A','2018-09-25 20:32:09',12),(100,NULL,'EVENTO_ID: 12 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 86 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_86_evento_12.mp3','A','2018-09-25 20:32:18',12),(101,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |DESCRIPCIÓN: Intaticket Evento |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_13.jpg |ESTADO: 1-Activo','I','2018-09-27 21:33:32',13),(102,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 87 |TIPO URL: 1 - VIDEO_PRINCIPAL |IMAGEN: eventos/videos/configuracionevento_87_evento_13.mp4','A','2018-09-27 21:39:25',13),(103,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 88 |TIPO URL: 2 - BOTON_PRINCIPAL |IMAGEN: eventos/imagenes/configuracionevento_88_evento_13.png','A','2018-09-27 21:39:41',13),(104,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 89 |TIPO URL: 3 - FONDO_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_89_evento_13.png','A','2018-09-27 21:39:49',13),(105,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 90 |TIPO URL: 4 - BOTON_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_90_evento_13.png','A','2018-09-27 21:39:59',13),(106,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 91 |TIPO URL: 5 - SONIDO_JUEGO |IMAGEN: eventos/sonidos/configuracionevento_91_evento_13.mp3','A','2018-09-27 21:40:12',13),(107,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 92 |TIPO URL: 6 - BASE_JUEGO |IMAGEN: eventos/imagenes/configuracionevento_92_evento_13.png','A','2018-09-27 21:40:24',13),(108,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 93 |TIPO URL: 7 - PRIMERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_93_evento_13.png','A','2018-09-27 21:40:33',13),(109,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 94 |TIPO URL: 8 - SEGUNDA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_94_evento_13.png','A','2018-09-27 21:40:41',13),(110,NULL,'EVENTO_ID: 13 |NOMBRE: INTATICKET EVENTO |CONFIGURACION EVENTO: 95 |TIPO URL: 9 - TERCERA_PUERTA |IMAGEN: eventos/imagenes/configuracionevento_95_evento_13.png','A','2018-09-27 21:40:50',13),(111,NULL,'EVENTO_ID: 14 |NOMBRE: INTATICKET EVENTO |DESCRIPCIÓN: ninguna |TOT. JUAGADAS: 0 |IMAGEN: eventos/imagenes/evento_14.jpg |ESTADO: 1-Activo','I','2018-11-18 23:04:18',14);
/*!40000 ALTER TABLE `log_evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_incremento_probabilidad_premio`
--

DROP TABLE IF EXISTS `log_incremento_probabilidad_premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_incremento_probabilidad_premio` (
  `log_inc_pro_pre_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_inc_pro_pre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_incremento_probabilidad_premio`
--

LOCK TABLES `log_incremento_probabilidad_premio` WRITE;
/*!40000 ALTER TABLE `log_incremento_probabilidad_premio` DISABLE KEYS */;
INSERT  IGNORE INTO `log_incremento_probabilidad_premio` (`log_inc_pro_pre_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 1 |NOMBRE: MOTO EVENTO |DESCRIPCIÓN: Premio Pepa |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_5.png |FECHA_INCENTIVO: 2018-04-16 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-Clase F |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 5-MOTO |EVENTO: 1-EVENTO |ESTADO: 1-Activo','I','2018-04-13 15:00:08',1),(2,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 1 |NOMBRE: MOTO EVENTO |DESCRIPCIÓN: Premio Pepa |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_5.png |FECHA_INCENTIVO: 2018-04-16 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-Clase F |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 5-MOTO |EVENTO: 1-EVENTO |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 1 |NOMBRE: MOTO EVENTO |DESCRIPCIÓN: Premio Pepa |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_5.png |FECHA_INCENTIVO: 2018-04-16 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-Clase F |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 5-MOTO |EVENTO: 1-EVENTO |ESTADO: 1-Activo','A','2018-04-13 19:23:10',1),(3,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 1 |NOMBRE: MOTO EVENTO |DESCRIPCIÓN: Premio Pepa |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_5.png |FECHA_INCENTIVO: 2018-04-16 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-Clase F |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 5-MOTO |EVENTO: 1-EVENTO |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 1 |NOMBRE: MOTO EVENTO |DESCRIPCIÓN: Premio Pepa |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_5.png |FECHA_INCENTIVO: 2018-04-13 |HORA_INICIO: 12:00:00 |HORA_FIN: 18:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-Clase F |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 5-MOTO |EVENTO: 1-EVENTO |ESTADO: 1-Activo','A','2018-04-13 19:36:07',1),(4,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 1 |NOMBRE: MOTO EVENTO |DESCRIPCIÓN: Premio Pepa |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 1 |URL_IMAGEN: premios/imagenes/premio_5.png |FECHA_INCENTIVO: 2018-04-13 |HORA_INICIO: 12:00:00 |HORA_FIN: 18:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 5-MOTO |EVENTO: 1-EVENTO |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 1 |NOMBRE: MOTO EVENTO |DESCRIPCIÓN: Premio Pepa |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_5.png |FECHA_INCENTIVO: 2018-04-16 |HORA_INICIO: 12:00:00 |HORA_FIN: 18:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 5-MOTO |EVENTO: 1-EVENTO |ESTADO: 1-Activo','A','2018-04-16 14:22:37',1),(5,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-16 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 1-Activo','I','2018-04-16 14:24:28',2),(6,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-16 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-24 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 1-Activo','A','2018-04-16 14:24:41',2),(7,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-24 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 1-Activo','A','2018-04-16 14:25:31',2),(8,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 2-Inactivo','A','2018-04-16 16:25:18',2),(9,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 1-CICLO PRUEBA 1 |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 2-Inactivo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 2-Inactivo','A','2018-04-16 16:25:56',2),(10,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 2-Inactivo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 2-Inactivo','A','2018-04-16 16:33:33',2),(11,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 2-Inactivo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 2 |NOMBRE: INCREMENTO 2 |DESCRIPCIÓN: incremento prueba  |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-06-07 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 12 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 1-EVENTO |ESTADO: 1-Activo','A','2018-04-16 16:34:15',2),(12,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 3 |NOMBRE: INCRMENTO PRUEBA  |DESCRIPCIÓN: incremento prueba |CANTIDAD: 34 |CANTIDAD_DISPONIBLE: 34 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-17 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:30:00 |PORCENTAJE: 56 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 2-EVENTO 2 |ESTADO: 1-Activo','I','2018-04-16 16:52:30',3),(13,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 4 |NOMBRE: INCREMENTO 3 |DESCRIPCIÓN: incremento 3 |CANTIDAD: 12 |CANTIDAD_DISPONIBLE: 12 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-18 |HORA_INICIO: 12:00:00 |HORA_FIN: 23:00:00 |PORCENTAJE: 43 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 2-EVENTO 2 |ESTADO: 1-Activo','I','2018-04-16 16:56:24',4),(14,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 4 |NOMBRE: INCREMENTO 3 |DESCRIPCIÓN: incremento 3 |CANTIDAD: 12 |CANTIDAD_DISPONIBLE: 12 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-18 |HORA_INICIO: 14:00:00 |HORA_FIN: 23:00:00 |PORCENTAJE: 43 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 2-EVENTO 2 |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 4 |NOMBRE: INCREMENTO 3 |DESCRIPCIÓN: incremento 3 |CANTIDAD: 20 |CANTIDAD_DISPONIBLE: 20 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-18 |HORA_INICIO: 14:00:00 |HORA_FIN: 23:00:00 |PORCENTAJE: 43 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 2-EVENTO 2 |ESTADO: 1-Activo','A','2018-04-16 17:18:38',4),(15,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 4 |NOMBRE: INCREMENTO 3 |DESCRIPCIÓN: incremento 3 |CANTIDAD: 20 |CANTIDAD_DISPONIBLE: 16 |CANTIDAD_VIRTUAL: 4 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-18 |HORA_INICIO: 14:00:00 |HORA_FIN: 23:00:00 |PORCENTAJE: 43 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 2-EVENTO 2 |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 4 |NOMBRE: INCREMENTO 3 |DESCRIPCIÓN: incremento 3 |CANTIDAD: 21 |CANTIDAD_DISPONIBLE: 17 |CANTIDAD_VIRTUAL: 4 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-18 |HORA_INICIO: 14:00:00 |HORA_FIN: 23:00:00 |PORCENTAJE: 43 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 2-EVENTO 2 |ESTADO: 1-Activo','A','2018-04-16 17:19:45',4),(16,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 4 |NOMBRE: INCREMENTO 3 |DESCRIPCIÓN: incremento 3 |CANTIDAD: 6 |CANTIDAD_DISPONIBLE: 2 |CANTIDAD_VIRTUAL: 4 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-18 |HORA_INICIO: 14:00:00 |HORA_FIN: 23:00:00 |PORCENTAJE: 43 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 2-EVENTO 2 |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 4 |NOMBRE: INCREMENTO 3 |DESCRIPCIÓN: incremento 3 |CANTIDAD: 7 |CANTIDAD_DISPONIBLE: 3 |CANTIDAD_VIRTUAL: 4 |URL_IMAGEN: premios/imagenes/premio_1.png |FECHA_INCENTIVO: 2018-04-18 |HORA_INICIO: 14:00:00 |HORA_FIN: 23:00:00 |PORCENTAJE: 43 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 2-CICLO 2  |PREMIO: 1-GORRA |EVENTO: 2-EVENTO 2 |ESTADO: 1-Activo','A','2018-04-16 17:20:53',4),(17,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 5 |NOMBRE: COMPUTADORA MAGICA |DESCRIPCIÓN: Premio Especial |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.jpg |FECHA_INCENTIVO: 2018-04-24 |HORA_INICIO: 12:00:00 |HORA_FIN: 12:45:00 |PORCENTAJE: 56 |CATEGORÍA: 1-CATEGORÍA A |CICLO: 3-CICLO MAYO |PREMIO: 7-COMPUTADORA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','I','2018-04-23 21:17:58',5),(18,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 6 |NOMBRE: MOTO  |DESCRIPCIÓN: moto |CANTIDAD: 3 |CANTIDAD_DISPONIBLE: 3 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-06-12 |HORA_INICIO: 16:00:00 |HORA_FIN: 17:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 3-CICLO MAYO |PREMIO: 7-MOTO HONDA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','I','2018-06-11 20:45:33',6),(19,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 7 |NOMBRE: MOTO 2 |DESCRIPCIÓN: mot |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-06-13 |HORA_INICIO: 16:00:00 |HORA_FIN: 17:00:00 |PORCENTAJE: 90 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 4-CLICLO PRUEBA INNOVASYSTEM |PREMIO: 7-MOTO HONDA |EVENTO: 6-INNOVASYSTEM |ESTADO: 1-Activo','I','2018-06-11 20:46:52',7),(20,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 8 |NOMBRE: MOTO PREMIO ESPECIAL |DESCRIPCIÓN: Moto premio especial |CANTIDAD: 10 |CANTIDAD_DISPONIBLE: 10 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-08-25 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 60 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 3-CICLO MAYO |PREMIO: 7-MOTO HONDA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','I','2018-08-22 15:44:40',8),(21,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 8 |NOMBRE: MOTO PREMIO ESPECIAL |DESCRIPCIÓN: Moto premio especial |CANTIDAD: 10 |CANTIDAD_DISPONIBLE: 10 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-08-25 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 60 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 3-CICLO MAYO |PREMIO: 7-MOTO HONDA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 8 |NOMBRE: MOTO PREMIO ESPECIAL |DESCRIPCIÓN: Moto premio especial |CANTIDAD: 15 |CANTIDAD_DISPONIBLE: 15 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-08-25 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 60 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 6-CICLO DE PRUEBA INNOVA |PREMIO: 7-MOTO HONDA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','A','2018-08-22 15:45:42',8),(22,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 8 |NOMBRE: MOTO PREMIO ESPECIAL |DESCRIPCIÓN: Moto premio especial |CANTIDAD: 15 |CANTIDAD_DISPONIBLE: 15 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-08-25 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 60 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 6-CICLO DE PRUEBA INNOVA |PREMIO: 7-MOTO HONDA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 8 |NOMBRE: MOTO PREMIO ESPECIAL |DESCRIPCIÓN: Moto premio especial |CANTIDAD: 15 |CANTIDAD_DISPONIBLE: 15 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-08-25 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 80 |CATEGORÍA: 4-CATEGORÍA D |CICLO: 6-CICLO DE PRUEBA INNOVA |PREMIO: 7-MOTO HONDA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','A','2018-08-22 15:46:19',8),(23,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 8 |NOMBRE: MOTO PREMIO ESPECIAL |DESCRIPCIÓN: Moto premio especial |CANTIDAD: 15 |CANTIDAD_DISPONIBLE: 15 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-08-25 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 80 |CATEGORÍA: 4-CATEGORÍA D |CICLO: 6-CICLO DE PRUEBA INNOVA |PREMIO: 7-MOTO HONDA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','INCREMENTO_PROBABILIDAD_PREMIO_ID: 8 |NOMBRE: MOTO PREMIO ESPECIAL |DESCRIPCIÓN: Moto premio especial |CANTIDAD: 15 |CANTIDAD_DISPONIBLE: 15 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_7.png |FECHA_INCENTIVO: 2018-08-25 |HORA_INICIO: 12:00:00 |HORA_FIN: 13:00:00 |PORCENTAJE: 80 |CATEGORÍA: 4-CATEGORÍA D |CICLO: 6-CICLO DE PRUEBA INNOVA |PREMIO: 7-MOTO HONDA |EVENTO: 5-CARRERA INNOVA |ESTADO: 1-Activo','A','2018-08-22 15:47:15',8),(24,NULL,'INCREMENTO_PROBABILIDAD_PREMIO_ID: 9 |NOMBRE: MOTO UNICA |DESCRIPCIÓN: Moto Unica |CANTIDAD: 1 |CANTIDAD_DISPONIBLE: 1 |CANTIDAD_VIRTUAL: 0 |URL_IMAGEN: premios/imagenes/premio_24.png |FECHA_INCENTIVO: 2018-09-29 |HORA_INICIO: 12:00:00 |HORA_FIN: 15:00:00 |PORCENTAJE: 80 |CATEGORÍA: 6-CATEGORÍA F |CICLO: 11-INTATICKET CICLO |PREMIO: 24-MOTO |EVENTO: 13-INTATICKET EVENTO |ESTADO: 1-Activo','I','2018-09-27 21:51:03',9);
/*!40000 ALTER TABLE `log_incremento_probabilidad_premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_participante`
--

DROP TABLE IF EXISTS `log_participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_participante` (
  `log_participante_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_participante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_participante`
--

LOCK TABLES `log_participante` WRITE;
/*!40000 ALTER TABLE `log_participante` DISABLE KEYS */;
INSERT  IGNORE INTO `log_participante` (`log_participante_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,NULL,'PARTICIPANTE_ID: 1 |NOMBRE: GABRIELA  |APELLIDO: ROSADO |CÉDULA: 0929354835 |EMAIL: gyra_92@hotmail.com |TELÉFONO: 043148093 |CELULAR: 0981065404 |BOLETO: 1002220001000015','I','2018-04-11 15:54:47',1),(2,'PARTICIPANTE_ID: 1 |NOMBRE: GABRIELA  |APELLIDO: ROSADO |CÉDULA: 0929354835 |EMAIL: gyra_92@hotmail.com |TELÉFONO: 043148093 |CELULAR: 0981065404','PARTICIPANTE_ID: 1 |NOMBRE: GABRIELA  |APELLIDO: ROSADO |CÉDULA: 0929354835 |EMAIL: gyra_92@hotmail.com |TELÉFONO: 043148093 |CELULAR: 0981065404 |BOLETO: 1002220001000013','A','2018-04-11 20:34:31',1),(3,'PARTICIPANTE_ID: 1 |NOMBRE: GABRIELA  |APELLIDO: ROSADO |CÉDULA: 0929354835 |EMAIL: gyra_92@hotmail.com |TELÉFONO: 043148093 |CELULAR: 0981065404','PARTICIPANTE_ID: 1 |NOMBRE: GABRIELA  |APELLIDO: ROSADO |CÉDULA: 0929354835 |EMAIL: gyra_92@hotmail.com |TELÉFONO: 043148093 |CELULAR: 0981065404 |BOLETO: 1002220001000014','A','2018-04-11 20:35:20',1),(4,NULL,'PARTICIPANTE_ID: 2 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilso.quintolmedo@gmail.com  |TELÉFONO:  |CELULAR: 0912345678 |BOLETO: 1002220001000149','I','2018-05-10 19:26:55',2),(5,'PARTICIPANTE_ID: 2 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilso.quintolmedo@gmail.com  |TELÉFONO:  |CELULAR: 0912345678','PARTICIPANTE_ID: 2 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilso.quintolmedo@gmail.com |TELÉFONO:  |CELULAR: 0912345678 |BOLETO: 1002220001000145','A','2018-05-10 19:43:58',2),(6,NULL,'PARTICIPANTE_ID: 3 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilson.quinto@yahoo.es  |TELÉFONO: 043148093 |CELULAR: 0981065404 |BOLETO: 1002220001000013','I','2018-08-21 19:40:42',3),(7,'PARTICIPANTE_ID: 3 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilson.quinto@yahoo.es  |TELÉFONO: 043148093 |CELULAR: 0981065404','PARTICIPANTE_ID: 3 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilson.quinto@yahoo.es |TELÉFONO: 043148093 |CELULAR: 0981065404 |BOLETO: 1002220001000014','A','2018-08-21 19:45:25',3),(8,NULL,'PARTICIPANTE_ID: 4 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilson.quinto@yahoo.es |TELÉFONO: 123123 |CELULAR: 0981065404 |BOLETO: 1002220001000014','I','2018-08-21 19:46:35',4),(9,NULL,'PARTICIPANTE_ID: 5 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilson.quinto@yahoo.es |TELÉFONO: 123123 |CELULAR: 0981065404 |BOLETO: 1002220001000014','I','2018-08-21 19:48:26',5),(10,NULL,'PARTICIPANTE_ID: 6 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: Wilson.quinto@yahoo.es |TELÉFONO: 123123 |CELULAR: 0981065404 |BOLETO: 1002220001000013','I','2018-08-21 20:08:52',6),(11,NULL,'PARTICIPANTE_ID: 7 |NOMBRE: WILSON |CÉDULA: 0941106080 |EMAIL: gyra_92@hotmail.com |TELÉFONO: 043148093 |CELULAR: 0981065404 |BOLETO: 1002220001000013','I','2018-08-22 15:55:50',7),(12,NULL,'PARTICIPANTE_ID: 8 |NOMBRE: WILSON |CÉDULA: 0941106081 |EMAIL: gyra_92@hotmail.com |TELÉFONO: 043148093 |CELULAR: 0981065404 |BOLETO: 1002220001000015','I','2018-08-22 20:07:43',8),(13,NULL,'PARTICIPANTE_ID: 9 |NOMBRE: GABRIELA |CÉDULA: 0967808374 |EMAIL: gabi@hotmail.com |TELÉFONO: 123123 |CELULAR: 0981065404 |BOLETO: 1002220001000016','I','2018-08-22 20:16:37',9),(14,NULL,'PARTICIPANTE_ID: 10 |NOMBRE: WILSON OLMEDO QUINTO GUTIERREZ |CÉDULA: 0941106080 |EMAIL: wilson.quinto@yahoo.es |TELÉFONO: 0967808374 |CELULAR: 0967808374 |BOLETO: 1002220001000013','I','2018-09-24 17:17:53',10),(15,NULL,'PARTICIPANTE_ID: 11 |NOMBRE: 0967808375 |CÉDULA: 0967808375 |EMAIL: 0967808375 |TELÉFONO: 0967808375 |CELULAR: 0967808375 |BOLETO: 1002220001000014','I','2018-09-24 17:21:10',11),(16,'PARTICIPANTE_ID: 10 |NOMBRE: WILSON OLMEDO QUINTO GUTIERREZ |CÉDULA: 0941106080 |EMAIL: wilson.quinto@yahoo.es |TELÉFONO: 0967808374 |CELULAR: 0967808374','PARTICIPANTE_ID: 10 |NOMBRE: WILSON OLMEDO QUINTO GUTIERREZ |CÉDULA: 0941106080 |EMAIL: wilson.quinto@yahoo.es |TELÉFONO: 0967808374 |CELULAR: 0967808374 |BOLETO: 1002220001000013','A','2018-09-25 20:39:16',10),(17,NULL,'PARTICIPANTE_ID: 12 |NOMBRE: WILSON OLMEDO QUINTO GUTIERREZ |CÉDULA: 0941106080 |EMAIL: wilson.quinto@yahoo.es |TELÉFONO: 0967808374 |CELULAR: 0967808374 |BOLETO: 1002220001000013','I','2018-09-27 21:47:29',12),(18,'PARTICIPANTE_ID: 12 |NOMBRE: WILSON OLMEDO QUINTO GUTIERREZ |CÉDULA: 0941106080 |EMAIL: wilson.quinto@yahoo.es |TELÉFONO: 0967808374 |CELULAR: 0967808374','PARTICIPANTE_ID: 12 |NOMBRE: WILSON OLMEDO QUINTO GUTIERREZ |CÉDULA: 0941106080 |EMAIL: wilson.quinto@yahoo.es |TELÉFONO: 0967808374 |CELULAR: 0967808374 |BOLETO: 1002220001000014','A','2018-09-27 21:57:44',12);
/*!40000 ALTER TABLE `log_participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_premio`
--

DROP TABLE IF EXISTS `log_premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_premio` (
  `log_premio_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_premio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_premio`
--

LOCK TABLES `log_premio` WRITE;
/*!40000 ALTER TABLE `log_premio` DISABLE KEYS */;
INSERT  IGNORE INTO `log_premio` (`log_premio_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,NULL,'PREMIO_ID: 1 |NOMBRE: PREMIO 1 |DESCRIPCIÓN: Premio |CATEGORÍA: 6-Clase F |IMAGEN: premios/imagenes/premio_1.jpg |ESTADO: 1-Activo','I','2018-04-11 15:01:55',1),(2,NULL,'PREMIO_ID: 2 |NOMBRE: PREMIO 2 |DESCRIPCIÓN: Prueba |CATEGORÍA: 5-Clase E |IMAGEN: premios/imagenes/premio_2.jpg |ESTADO: 1-Activo','I','2018-04-11 15:02:22',2),(3,'PREMIO_ID: 2 |NOMBRE: PENDRIVE |DESCRIPCIÓN: Prueba |CATEGORÍA: 5-Clase E |IMAGEN: premios/imagenes/premio_2.png |ESTADO: 1-Activo','PREMIO_ID: 2 |NOMBRE: TOMATODO |DESCRIPCIÓN: Prueba |CATEGORÍA: 5-Clase E |IMAGEN: premios/imagenes/premio_2.png |ESTADO: 1-Activo','A','2018-04-13 14:44:49',2),(4,'PREMIO_ID: 1 |NOMBRE: GORRA |DESCRIPCIÓN: Premio |CATEGORÍA: 6-Clase F |IMAGEN: premios/imagenes/premio_1.png |ESTADO: 1-Activo','PREMIO_ID: 1 |NOMBRE: GORRA |DESCRIPCIÓN: Premio |CATEGORÍA: 4-Clase F |IMAGEN: premios/imagenes/premio_1.png |ESTADO: 1-Activo','A','2018-04-13 14:46:32',1),(5,NULL,'PREMIO_ID: 3 |NOMBRE: PENDRIVE |DESCRIPCIÓN: Premio |CATEGORÍA: 3-Clase C |IMAGEN: premios/imagenes/premio_3.png |ESTADO: 1-Activo','I','2018-04-13 14:47:12',3),(6,NULL,'PREMIO_ID: 4 |NOMBRE: CELULAR |DESCRIPCIÓN: Premio |CATEGORÍA: 2-Clase B |IMAGEN: premios/imagenes/premio_4.png |ESTADO: 1-Activo','I','2018-04-13 14:47:37',4),(7,NULL,'PREMIO_ID: 5 |NOMBRE: MOTO |DESCRIPCIÓN: Premio |CATEGORÍA: 1-Clase A |IMAGEN: premios/imagenes/premio_5.png |ESTADO: 1-Activo','I','2018-04-13 14:47:52',5),(8,NULL,'PREMIO_ID: 6 |NOMBRE: CHOMPA |DESCRIPCIÓN: Premio |CATEGORÍA: 3-Clase C |IMAGEN: premios/imagenes/premio_6.png |ESTADO: 1-Activo','I','2018-04-13 14:48:48',6),(9,'PREMIO_ID: 4 |NOMBRE: CELULAR |DESCRIPCIÓN: Premio |CATEGORÍA: 2-Clase B |IMAGEN: premios/imagenes/premio_4.png |ESTADO: 1-Activo','PREMIO_ID: 4 |NOMBRE: CELULAR |DESCRIPCIÓN: Premio |CATEGORÍA: 1-Clase B |IMAGEN: premios/imagenes/premio_4.png |ESTADO: 1-Activo','A','2018-04-13 19:26:13',4),(10,NULL,'PREMIO_ID: 7 |NOMBRE: COMPUTADORA |DESCRIPCIÓN: Premio medio |CATEGORÍA: 5-CATEGORÍA E |IMAGEN: premios/imagenes/premio_7.jpg |ESTADO: 1-Activo','I','2018-04-23 20:57:23',7),(11,NULL,'PREMIO_ID: 8 |NOMBRE: SILLA |DESCRIPCIÓN: Silla |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','I','2018-04-23 20:57:51',8),(12,NULL,'PREMIO_ID: 9 |NOMBRE: PELOTA |DESCRIPCIÓN: Premio bajo |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_9.png |ESTADO: 1-Activo','I','2018-04-23 20:58:15',9),(13,'PREMIO_ID: 9 |NOMBRE: PELOTA |DESCRIPCIÓN: Premio bajo |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_9.png |ESTADO: 1-Activo','PREMIO_ID: 9 |NOMBRE: PELOTA |DESCRIPCIÓN: Premio bajo |CATEGORÍA: 6-CATEGORÍA A |IMAGEN: premios/imagenes/premio_9.png |ESTADO: 1-Activo','A','2018-04-23 20:59:24',9),(14,'PREMIO_ID: 8 |NOMBRE: SILLA |DESCRIPCIÓN: Silla |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','PREMIO_ID: 8 |NOMBRE: SILLA |DESCRIPCIÓN: Silla |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','A','2018-04-23 21:00:00',8),(15,'PREMIO_ID: 7 |NOMBRE: COMPUTADORA |DESCRIPCIÓN: Premio medio |CATEGORÍA: 5-CATEGORÍA E |IMAGEN: premios/imagenes/premio_7.jpg |ESTADO: 1-Activo','PREMIO_ID: 7 |NOMBRE: MOTO 2 |DESCRIPCIÓN: Premio medio |CATEGORÍA: 5-CATEGORÍA E |IMAGEN: premios/imagenes/premio_7.png |ESTADO: 1-Activo','A','2018-05-11 20:41:13',7),(16,'PREMIO_ID: 8 |NOMBRE: SILLA |DESCRIPCIÓN: Silla |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','PREMIO_ID: 8 |NOMBRE: GORR 2 |DESCRIPCIÓN: Silla |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','A','2018-05-11 20:41:58',8),(17,'PREMIO_ID: 9 |NOMBRE: PELOTA |DESCRIPCIÓN: Premio bajo |CATEGORÍA: 6-CATEGORÍA F |IMAGEN: premios/imagenes/premio_9.png |ESTADO: 1-Activo','PREMIO_ID: 9 |NOMBRE: TOMATODO 2 |DESCRIPCIÓN: Premio bajo |CATEGORÍA: 6-CATEGORÍA F |IMAGEN: premios/imagenes/premio_9.png |ESTADO: 1-Activo','A','2018-05-11 20:42:33',9),(18,'PREMIO_ID: 8 |NOMBRE: GORRA ADIDAS |DESCRIPCIÓN: Silla |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','PREMIO_ID: 8 |NOMBRE: GORRA ADIDAS |DESCRIPCIÓN: Gorra |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','A','2018-06-11 17:34:37',8),(19,'PREMIO_ID: 7 |NOMBRE: MOTO HONDA |DESCRIPCIÓN: Premio medio |CATEGORÍA: 5-CATEGORÍA E |IMAGEN: premios/imagenes/premio_7.png |ESTADO: 1-Activo','PREMIO_ID: 7 |NOMBRE: MOTO HONDA |DESCRIPCIÓN: Premio medio |CATEGORÍA: 1-CATEGORÍA E |IMAGEN: premios/imagenes/premio_7.png |ESTADO: 1-Activo','A','2018-06-11 17:34:54',7),(20,'PREMIO_ID: 7 |NOMBRE: MOTO HONDA |DESCRIPCIÓN: Premio medio |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_7.png |ESTADO: 1-Activo','PREMIO_ID: 7 |NOMBRE: MOTO HONDA |DESCRIPCIÓN: premio alto |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_7.png |ESTADO: 1-Activo','A','2018-06-11 17:35:29',7),(21,'PREMIO_ID: 8 |NOMBRE: GORRA ADIDAS |DESCRIPCIÓN: Gorra |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','PREMIO_ID: 8 |NOMBRE: GORRA ADIDAS |DESCRIPCIÓN: premio bajo |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','A','2018-06-11 17:35:45',8),(22,'PREMIO_ID: 9 |NOMBRE: TOMATODO NIKE |DESCRIPCIÓN: Premio bajo |CATEGORÍA: 6-CATEGORÍA F |IMAGEN: premios/imagenes/premio_9.png |ESTADO: 1-Activo','PREMIO_ID: 9 |NOMBRE: TOMATODO NIKE |DESCRIPCIÓN: Premio medio |CATEGORÍA: 4-CATEGORÍA F |IMAGEN: premios/imagenes/premio_9.png |ESTADO: 1-Activo','A','2018-06-11 17:36:14',9),(23,NULL,'PREMIO_ID: 10 |NOMBRE: GORRA ADIDAS PRUEBA |DESCRIPCIÓN: Gorra Adidas Prueba |CATEGORÍA: 6-CATEGORÍA F |IMAGEN: premios/imagenes/premio_10.png |ESTADO: 1-Activo','I','2018-06-11 17:37:53',10),(24,'PREMIO_ID: 8 |NOMBRE: GORRA ADIDAS |DESCRIPCIÓN: premio bajo |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','PREMIO_ID: 8 |NOMBRE: GORRA ADIDAS |DESCRIPCIÓN: premio bajo |CATEGORÍA: 6-CATEGORÍA D |IMAGEN: premios/imagenes/premio_8.png |ESTADO: 1-Activo','A','2018-06-11 17:38:14',8),(25,NULL,'PREMIO_ID: 11 |NOMBRE: GORRA ADIDAS INSTATICKET |DESCRIPCIÓN: Gorra Adidas Instaticket |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_11.png |ESTADO: 1-Activo','I','2018-09-06 20:02:32',11),(26,NULL,'PREMIO_ID: 12 |NOMBRE: GRANDE |DESCRIPCIÓN: bien |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_12.png |ESTADO: 1-Activo','I','2018-09-24 15:34:17',12),(27,NULL,'PREMIO_ID: 13 |NOMBRE: PEQUE |DESCRIPCIÓN: da |CATEGORÍA: 5-CATEGORÍA E |IMAGEN: premios/imagenes/premio_13.png |ESTADO: 1-Activo','I','2018-09-24 15:35:18',13),(28,NULL,'PREMIO_ID: 14 |NOMBRE: MEDIO |DESCRIPCIÓN: ooo |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_14.png |ESTADO: 1-Activo','I','2018-09-24 15:36:03',14),(29,NULL,'PREMIO_ID: 15 |NOMBRE: MOTO |DESCRIPCIÓN: Moto |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_15.png |ESTADO: 1-Activo','I','2018-09-24 16:59:47',15),(30,NULL,'PREMIO_ID: 16 |NOMBRE: GORRA |DESCRIPCIÓN: Gorra |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_16.png |ESTADO: 1-Activo','I','2018-09-24 17:00:15',16),(31,NULL,'PREMIO_ID: 17 |NOMBRE: TOMATODO |DESCRIPCIÓN: Tomatodo |CATEGORÍA: 6-CATEGORÍA F |IMAGEN: premios/imagenes/premio_17.png |ESTADO: 1-Activo','I','2018-09-24 17:00:36',17),(32,NULL,'PREMIO_ID: 18 |NOMBRE: MOTO |DESCRIPCIÓN: moto |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_18.png |ESTADO: 1-Activo','I','2018-09-25 20:23:50',18),(33,NULL,'PREMIO_ID: 19 |NOMBRE: CELULAR |DESCRIPCIÓN: Celular |CATEGORÍA: 2-CATEGORÍA B |IMAGEN: premios/imagenes/premio_19.png |ESTADO: 1-Activo','I','2018-09-25 20:25:19',19),(34,NULL,'PREMIO_ID: 20 |NOMBRE: BUZO |DESCRIPCIÓN: buzo |CATEGORÍA: 3-CATEGORÍA C |IMAGEN: premios/imagenes/premio_20.png |ESTADO: 1-Activo','I','2018-09-25 20:26:00',20),(35,NULL,'PREMIO_ID: 21 |NOMBRE: GORRA |DESCRIPCIÓN: Gorra |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_21.png |ESTADO: 1-Activo','I','2018-09-25 20:26:48',21),(36,NULL,'PREMIO_ID: 22 |NOMBRE: LLAVERO |DESCRIPCIÓN: Llavero |CATEGORÍA: 5-CATEGORÍA E |IMAGEN: premios/imagenes/premio_22.png |ESTADO: 1-Activo','I','2018-09-25 20:28:34',22),(37,NULL,'PREMIO_ID: 23 |NOMBRE: TOMATODO |DESCRIPCIÓN: Tomatodo |CATEGORÍA: 6-CATEGORÍA F |IMAGEN: premios/imagenes/premio_23.png |ESTADO: 1-Activo','I','2018-09-25 20:28:50',23),(38,NULL,'PREMIO_ID: 24 |NOMBRE: MOTO |DESCRIPCIÓN: Moto |CATEGORÍA: 1-CATEGORÍA A |IMAGEN: premios/imagenes/premio_24.png |ESTADO: 1-Activo','I','2018-09-27 21:34:15',24),(39,NULL,'PREMIO_ID: 25 |NOMBRE: CELULAR |DESCRIPCIÓN: Celular |CATEGORÍA: 2-CATEGORÍA B |IMAGEN: premios/imagenes/premio_25.png |ESTADO: 1-Activo','I','2018-09-27 21:34:50',25),(40,NULL,'PREMIO_ID: 26 |NOMBRE: LLAVERO |DESCRIPCIÓN: Llavero |CATEGORÍA: 3-CATEGORÍA C |IMAGEN: premios/imagenes/premio_26.png |ESTADO: 1-Activo','I','2018-09-27 21:35:18',26),(41,NULL,'PREMIO_ID: 27 |NOMBRE: BUZO |DESCRIPCIÓN: Buzo |CATEGORÍA: 4-CATEGORÍA D |IMAGEN: premios/imagenes/premio_27.png |ESTADO: 1-Activo','I','2018-09-27 21:35:45',27),(42,NULL,'PREMIO_ID: 28 |NOMBRE: GORRA |DESCRIPCIÓN: Gorra |CATEGORÍA: 5-CATEGORÍA E |IMAGEN: premios/imagenes/premio_28.png |ESTADO: 1-Activo','I','2018-09-27 21:36:13',28),(43,NULL,'PREMIO_ID: 29 |NOMBRE: TOMATODO |DESCRIPCIÓN: Tomatodo |CATEGORÍA: 6-CATEGORÍA F |IMAGEN: premios/imagenes/premio_29.png |ESTADO: 1-Activo','I','2018-09-27 21:36:36',29);
/*!40000 ALTER TABLE `log_premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_probabilidades`
--

DROP TABLE IF EXISTS `log_probabilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_probabilidades` (
  `log_probabilidades_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_probabilidades_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_probabilidades`
--

LOCK TABLES `log_probabilidades` WRITE;
/*!40000 ALTER TABLE `log_probabilidades` DISABLE KEYS */;
INSERT  IGNORE INTO `log_probabilidades` (`log_probabilidades_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,'PROBABILIDAD_ID: 11 |PROBABILIDAD: 100 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','PROBABILIDAD_ID: 11 |PROBABILIDAD: 100 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','A','2018-04-13 19:32:08',11),(2,'PROBABILIDAD_ID: 11 |PROBABILIDAD: 100 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','PROBABILIDAD_ID: 11 |PROBABILIDAD: 60 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','A','2018-04-23 21:00:41',11),(3,'PROBABILIDAD_ID: 11 |PROBABILIDAD: 100 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','PROBABILIDAD_ID: 11 |PROBABILIDAD: 100 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','A','2018-09-24 17:01:12',11),(4,'PROBABILIDAD_ID: 11 |PROBABILIDAD: 100 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','PROBABILIDAD_ID: 11 |PROBABILIDAD: 80 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','A','2018-09-24 17:01:38',11),(5,'PROBABILIDAD_ID: 11 |PROBABILIDAD: 80 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','PROBABILIDAD_ID: 11 |PROBABILIDAD: 100 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','A','2018-09-24 17:01:52',11),(6,'PROBABILIDAD_ID: 11 |PROBABILIDAD: 100 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','PROBABILIDAD_ID: 11 |PROBABILIDAD: 80 |HORA_INICIO:  |HORA_FIN:  |ESTADO: 1-Activo','A','2018-09-25 19:31:50',11);
/*!40000 ALTER TABLE `log_probabilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_usuarios`
--

DROP TABLE IF EXISTS `log_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log_usuarios` (
  `log_usuarios_id` int(11) NOT NULL AUTO_INCREMENT,
  `registro_anterior` varchar(500) DEFAULT NULL,
  `registro_nuevo` varchar(500) DEFAULT NULL,
  `tipo_accion` varchar(1) DEFAULT NULL,
  `fecha_ingresa` timestamp NULL DEFAULT current_timestamp(),
  `id_tabla` int(11) DEFAULT NULL,
  PRIMARY KEY (`log_usuarios_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_usuarios`
--

LOCK TABLES `log_usuarios` WRITE;
/*!40000 ALTER TABLE `log_usuarios` DISABLE KEYS */;
INSERT  IGNORE INTO `log_usuarios` (`log_usuarios_id`, `registro_anterior`, `registro_nuevo`, `tipo_accion`, `fecha_ingresa`, `id_tabla`) VALUES (1,'USUARIO_ID: 2 |USERNAME: televisora |PASSWORD: 1234 |NOMBRE: prueba |APELLIDO: prueba |TELÉFONO: 0968328989 |EMAIL: michaelmarcillo90@gmail.com |TIPO USUARIO: 3-TELEVISOR |ESTADO: 1-Activo','USUARIO_ID: 2 |USERNAME: televisora |PASSWORD: 1234 |NOMBRE: PRUEBA |APELLIDO: PRUEBA |TELÉFONO: 0968328989 |EMAIL: michaelmarcillo90@gmail.com |TIPO USUARIO: 3-TELEVISOR |ESTADO: 1-Activo','A','2018-03-27 15:44:52',2),(2,NULL,'USUARIO_ID: 3 |USERNAME: alynprueba |PASSWORD: 1234 |NOMBRE: ALYN GABRIELA |APELLIDO: RODRIGUEZ ROSADO |TELÉFONO: 151515 |EMAIL: alyn23@hotmail.com |TIPO USUARIO: 2-REGISTRADOR |ESTADO: 1-Activo','I','2018-03-27 15:49:39',3),(3,'USUARIO_ID: 2 |USERNAME: televisora |PASSWORD: 1 |NOMBRE: PRUEBA |APELLIDO: PRUEBA |TELÉFONO: 0968328989 |EMAIL: michaelmarcillo90@gmail.com |TIPO USUARIO: 3-TELEVISOR |ESTADO: 1-Activo','USUARIO_ID: 2 |USERNAME: televisora |PASSWORD: 1 |NOMBRE: PRUEBA |APELLIDO: PRUEBA |TELÉFONO: 0968328989 |EMAIL: michaelmarcillo90@gmail.com |TIPO USUARIO: 3-TELEVISOR |ESTADO: 1-Activo','A','2018-05-31 15:20:26',2),(4,'USUARIO_ID: 2 |USERNAME: televisora |PASSWORD: 1 |NOMBRE: PRUEBA |APELLIDO: PRUEBA |TELÉFONO: 0968328989 |EMAIL: michaelmarcillo90@gmail.com |TIPO USUARIO: 3-TELEVISOR |ESTADO: 1-Activo','USUARIO_ID: 2 |USERNAME: tv |PASSWORD: 1 |NOMBRE: PRUEBA |APELLIDO: PRUEBA |TELÉFONO: 0968328989 |EMAIL: michaelmarcillo90@gmail.com |TIPO USUARIO: 3-TELEVISOR |ESTADO: 1-Activo','A','2018-05-31 15:20:44',2);
/*!40000 ALTER TABLE `log_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migracion_informacion_participante`
--

DROP TABLE IF EXISTS `migracion_informacion_participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migracion_informacion_participante` (
  `mig_inf_par_id` int(11) NOT NULL AUTO_INCREMENT,
  `evento_id` int(11) DEFAULT NULL,
  `mig_inf_par_evento` int(11) DEFAULT NULL,
  `mig_inf_par_localidad` int(11) DEFAULT NULL,
  `mig_inf_par_numero_boleto` varchar(30) DEFAULT NULL,
  `mig_inf_par_cedula` varchar(13) DEFAULT NULL,
  `mig_inf_par_nombre` varchar(150) DEFAULT NULL,
  `mig_inf_par_vendido` char(1) DEFAULT NULL,
  `mig_inf_par_telefono` varchar(10) DEFAULT NULL,
  `mig_inf_par_celular` varchar(10) DEFAULT NULL,
  `mig_inf_par_email` varchar(100) DEFAULT NULL,
  `mig_inf_par_juego` char(1) DEFAULT NULL,
  `mig_inf_par_actualizo` char(1) DEFAULT NULL,
  PRIMARY KEY (`mig_inf_par_id`),
  KEY `FK_MIG_INF_PAR_EVE_idx` (`evento_id`),
  CONSTRAINT `FK_MIG_INF_PAR_EVE` FOREIGN KEY (`evento_id`) REFERENCES `evento` (`evento_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=latin1 COMMENT='Representa la intercomunicacion de informacion a consultar cuando se registre al participante ente el departamento de sistemas de instaticket y la base instaticket_puertaganadora';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migracion_informacion_participante`
--

LOCK TABLES `migracion_informacion_participante` WRITE;
/*!40000 ALTER TABLE `migracion_informacion_participante` DISABLE KEYS */;
INSERT  IGNORE INTO `migracion_informacion_participante` (`mig_inf_par_id`, `evento_id`, `mig_inf_par_evento`, `mig_inf_par_localidad`, `mig_inf_par_numero_boleto`, `mig_inf_par_cedula`, `mig_inf_par_nombre`, `mig_inf_par_vendido`, `mig_inf_par_telefono`, `mig_inf_par_celular`, `mig_inf_par_email`, `mig_inf_par_juego`, `mig_inf_par_actualizo`) VALUES (1,NULL,2187,1,'1002220001000013',NULL,NULL,'N',NULL,NULL,NULL,'S','S'),(2,NULL,2187,1,'1002220001000014',NULL,NULL,'N',NULL,NULL,NULL,'S','S'),(3,NULL,2187,1,'1002220001000015',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(4,NULL,2187,1,'1002220001000016',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(5,NULL,2187,1,'1002220001000017',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(6,NULL,2187,1,'1002220001000018',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(7,NULL,2187,1,'1002220001000019',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(8,NULL,2187,1,'1002220001000020',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(9,NULL,2187,1,'1002220001000021',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(10,NULL,2187,1,'1002220001000022',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(11,NULL,2187,1,'1002220001000023',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(12,NULL,2187,1,'1002220001000024',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(13,NULL,2187,1,'1002220001000025',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(14,NULL,2187,1,'1002220001000026',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(15,NULL,2187,1,'1002220001000027',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(16,NULL,2187,1,'1002220001000028',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(17,NULL,2187,1,'1002220001000029',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(18,NULL,2187,1,'1002220001000030',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(19,NULL,2187,1,'1002220001000031',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(20,NULL,2187,1,'1002220001000032',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(21,NULL,2187,1,'1002220001000033',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(22,NULL,2187,1,'1002220001000034',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(23,NULL,2187,1,'1002220001000035',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(24,NULL,2187,1,'1002220001000036',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(25,NULL,2187,1,'1002220001000037',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(26,NULL,2187,1,'1002220001000038',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(27,NULL,2187,1,'1002220001000039',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(28,NULL,2187,1,'1002220001000040',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(29,NULL,2187,1,'1002220001000041',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(30,NULL,2187,1,'1002220001000042',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(31,NULL,2187,1,'1002220001000043',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(32,NULL,2187,1,'1002220001000044',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(33,NULL,2187,1,'1002220001000045',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(34,NULL,2187,1,'1002220001000046',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(35,NULL,2187,1,'1002220001000047',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(36,NULL,2187,1,'1002220001000048',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(37,NULL,2187,1,'1002220001000049',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(38,NULL,2187,1,'1002220001000050',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(39,NULL,2187,1,'1002220001000051',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(40,NULL,2187,1,'1002220001000052',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(41,NULL,2187,1,'1002220001000053',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(42,NULL,2187,1,'1002220001000054',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(43,NULL,2187,1,'1002220001000055',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(44,NULL,2187,1,'1002220001000056',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(45,NULL,2187,1,'1002220001000057',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(46,NULL,2187,1,'1002220001000058',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(47,NULL,2187,1,'1002220001000059',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(48,NULL,2187,1,'1002220001000060',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(49,NULL,2187,1,'1002220001000061',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(50,NULL,2187,1,'1002220001000062',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(51,NULL,2187,1,'1002220001000063',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(52,NULL,2187,1,'1002220001000064',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(53,NULL,2187,1,'1002220001000065',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(54,NULL,2187,1,'1002220001000066',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(55,NULL,2187,1,'1002220001000067',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(56,NULL,2187,1,'1002220001000068',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(57,NULL,2187,1,'1002220001000069',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(58,NULL,2187,1,'1002220001000070',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(59,NULL,2187,1,'1002220001000071',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(60,NULL,2187,1,'1002220001000072',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(61,NULL,2187,1,'1002220001000073',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(62,NULL,2187,1,'1002220001000074',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(63,NULL,2187,1,'1002220001000075',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(64,NULL,2187,1,'1002220001000076',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(65,NULL,2187,1,'1002220001000077',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(66,NULL,2187,1,'1002220001000078',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(67,NULL,2187,1,'1002220001000079',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(68,NULL,2187,1,'1002220001000080',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(69,NULL,2187,1,'1002220001000081',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(70,NULL,2187,1,'1002220001000082',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(71,NULL,2187,1,'1002220001000083',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(72,NULL,2187,1,'1002220001000084',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(73,NULL,2187,1,'1002220001000085',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(74,NULL,2187,1,'1002220001000086',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(75,NULL,2187,1,'1002220001000087',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(76,NULL,2187,1,'1002220001000088',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(77,NULL,2187,1,'1002220001000089',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(78,NULL,2187,1,'1002220001000090',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(79,NULL,2187,1,'1002220001000091',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(80,NULL,2187,1,'1002220001000092',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(81,NULL,2187,1,'1002220001000093',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(82,NULL,2187,1,'1002220001000094',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(83,NULL,2187,1,'1002220001000095',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(84,NULL,2187,1,'1002220001000096',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(85,NULL,2187,1,'1002220001000097',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(86,NULL,2187,1,'1002220001000098',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(87,NULL,2187,1,'1002220001000099',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(88,NULL,2187,1,'1002220001000100',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(89,NULL,2187,1,'1002220001000101',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(90,NULL,2187,1,'1002220001000102',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(91,NULL,2187,1,'1002220001000103',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(92,NULL,2187,1,'1002220001000104',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(93,NULL,2187,1,'1002220001000105',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(94,NULL,2187,1,'1002220001000106',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(95,NULL,2187,1,'1002220001000107',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(96,NULL,2187,1,'1002220001000108',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(97,NULL,2187,1,'1002220001000109',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(98,NULL,2187,1,'1002220001000110',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(99,NULL,2187,1,'1002220001000111',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(100,NULL,2187,1,'1002220001000112',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(101,NULL,2187,1,'1002220001000113',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(102,NULL,2187,1,'1002220001000114',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(103,NULL,2187,1,'1002220001000115',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(104,NULL,2187,1,'1002220001000116',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(105,NULL,2187,1,'1002220001000117',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(106,NULL,2187,1,'1002220001000118',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(107,NULL,2187,1,'1002220001000119',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(108,NULL,2187,1,'1002220001000120',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(109,NULL,2187,1,'1002220001000121',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(110,NULL,2187,1,'1002220001000122',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(111,NULL,2187,1,'1002220001000123',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(112,NULL,2187,1,'1002220001000124',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(113,NULL,2187,1,'1002220001000125',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(114,NULL,2187,1,'1002220001000126',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(115,NULL,2187,1,'1002220001000127',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(116,NULL,2187,1,'1002220001000128',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(117,NULL,2187,1,'1002220001000129',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(118,NULL,2187,1,'1002220001000130',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(119,NULL,2187,1,'1002220001000131',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(120,NULL,2187,1,'1002220001000132',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(121,NULL,2187,1,'1002220001000133',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(122,NULL,2187,1,'1002220001000134',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(123,NULL,2187,1,'1002220001000135',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(124,NULL,2187,1,'1002220001000136',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(125,NULL,2187,1,'1002220001000137',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(126,NULL,2187,1,'1002220001000138',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(127,NULL,2187,1,'1002220001000139',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(128,NULL,2187,1,'1002220001000140',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(129,NULL,2187,1,'1002220001000141',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(130,NULL,2187,1,'1002220001000142',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(131,NULL,2187,1,'1002220001000143',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(132,NULL,2187,1,'1002220001000144',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(133,NULL,2187,1,'1002220001000145',NULL,NULL,'N',NULL,NULL,NULL,'S','S'),(134,NULL,2187,1,'1002220001000146',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(135,NULL,2187,1,'1002220001000147',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(136,NULL,2187,1,'1002220001000148',NULL,NULL,'N',NULL,NULL,NULL,'N','N'),(137,NULL,2187,1,'1002220001000149',NULL,NULL,'N',NULL,NULL,NULL,'N','S'),(138,NULL,2187,1,'1002220001000150',NULL,NULL,'N',NULL,NULL,NULL,'N','N');
/*!40000 ALTER TABLE `migracion_informacion_participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro_general`
--

DROP TABLE IF EXISTS `parametro_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametro_general` (
  `parametro_general_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key de la tabla Parametros',
  `parametro_general_nombre` varchar(45) DEFAULT NULL COMMENT 'Representa al nombre del parámetro por el cual se va a realizar la búsqueda',
  `parametro_general_valor` varchar(250) DEFAULT NULL COMMENT 'Representa el valor del parámetro que se busque por nombre',
  `parametro_general_descripcion` varchar(250) DEFAULT NULL COMMENT 'Representa a la descripción del parámetro',
  PRIMARY KEY (`parametro_general_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='Representa a los parámetros que son necesarios para el funcionamiento de la aplicación, estos no será modificables por medio de la parte visual de la aplicación si no por medio de base de datos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro_general`
--

LOCK TABLES `parametro_general` WRITE;
/*!40000 ALTER TABLE `parametro_general` DISABLE KEYS */;
INSERT  IGNORE INTO `parametro_general` (`parametro_general_id`, `parametro_general_nombre`, `parametro_general_valor`, `parametro_general_descripcion`) VALUES (1,'TIPO_USUARIO_ADMIN','1','Representa el id del tipo de usuario administrador'),(2,'TIPO_URL_VIDEO','1','Representa el id del tipo de url para videos'),(3,'TIPO_URL_SONIDO','5','Representa el id del tipo de url para sonidos'),(4,'TIPO_USUARIO_TELEVISOR','3','Representa el id del tipo de usuario administrador'),(5,'TIPO_USUARIO_REGISTRADOR','2','Representa el id del tipo de usuario administrador'),(6,'CICLO_EVENTO_USUARIO','-1','Evento configurado desde el administrador del usuario registradoralynprueba'),(7,'IMPRESORA_ACTIVA','NO','Si existe impresora en el evento'),(8,'ESTADO_ACTIVO','1','Representa el id del tipo de usuario administrador'),(9,'ESTADO_INACTIVO','2','Representa el id del tipo de usuario administrador'),(10,'RUTA_RECURSOS','C:/desarrollo/proyectos/instaticket/recurso_juego/','Representa la ruta para acceder a los recursos (imagenes)'),(11,'URL_RECURSOS','http://localhost:8080/instaticket/recurso_juego/','Representa la url para acceder a los recursos (imagenes)'),(12,'TIPO_URL_FONDO','3','Representa el id del tipo de url para videos'),(13,'TIPO_URL_PRIMERA_PUERTA','7','Representa el id del tipo de url para videos'),(14,'TIPO_URL_SEGUNDA_PUERTA','8','Representa el id del tipo de url para videos'),(15,'TIPO_URL_TERCERA_PUERTA','9','Representa el id del tipo de url para videos');
/*!40000 ALTER TABLE `parametro_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participante` (
  `participiante_id` int(11) NOT NULL AUTO_INCREMENT,
  `participante_cedula` varchar(13) DEFAULT NULL,
  `participante_nombre` varchar(150) DEFAULT NULL,
  `participante_email` varchar(100) DEFAULT NULL,
  `participante_telefono` varchar(10) DEFAULT NULL,
  `participante_celular` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`participiante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COMMENT='Tabla que indica el registro de los participantes que ingresan a jugar';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante_boleto_detalle`
--

DROP TABLE IF EXISTS `participante_boleto_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participante_boleto_detalle` (
  `participante_boleto_det_id` int(11) NOT NULL AUTO_INCREMENT,
  `participante_id` int(11) DEFAULT NULL,
  `participante_boleto_det_numero_boleto` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`participante_boleto_det_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1 COMMENT='Representa a N numero de boletos de los participantes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante_boleto_detalle`
--

LOCK TABLES `participante_boleto_detalle` WRITE;
/*!40000 ALTER TABLE `participante_boleto_detalle` DISABLE KEYS */;
/*!40000 ALTER TABLE `participante_boleto_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premio`
--

DROP TABLE IF EXISTS `premio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premio` (
  `premio_id` int(11) NOT NULL AUTO_INCREMENT,
  `premio_nombre` varchar(45) DEFAULT NULL,
  `premio_descripcion` varchar(45) DEFAULT NULL,
  `premio_url_imagen` text DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`premio_id`),
  KEY `FK_PREMIO_ESTADO_idx` (`estado_id`),
  KEY `FK_PREMIO_CATEGORIA_idx` (`categoria_id`),
  CONSTRAINT `FK_PREMIO_CATEGORIA` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_PREMIO_ESTADO` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1 COMMENT='Taba que indica los premios del evento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premio`
--

LOCK TABLES `premio` WRITE;
/*!40000 ALTER TABLE `premio` DISABLE KEYS */;
INSERT  IGNORE INTO `premio` (`premio_id`, `premio_nombre`, `premio_descripcion`, `premio_url_imagen`, `estado_id`, `categoria_id`) VALUES (24,'MOTO','Moto','premios/imagenes/premio_24.png',1,1),(25,'CELULAR','Celular','premios/imagenes/premio_25.png',1,2),(26,'LLAVERO','Llavero','premios/imagenes/premio_26.png',1,3),(27,'BUZO','Buzo','premios/imagenes/premio_27.png',1,4),(28,'GORRA','Gorra','premios/imagenes/premio_28.png',1,5),(29,'TOMATODO','Tomatodo','premios/imagenes/premio_29.png',1,6);
/*!40000 ALTER TABLE `premio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premio_participante`
--

DROP TABLE IF EXISTS `premio_participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `premio_participante` (
  `premio_participante_id` int(11) NOT NULL AUTO_INCREMENT,
  `premio_id` int(11) DEFAULT NULL,
  `participante_id` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `ciclo_evento_premio_id` int(11) DEFAULT NULL,
  `inc_pro_pre_id` int(11) DEFAULT NULL,
  `participante_boleto_det_id` int(11) DEFAULT NULL,
  `codigo_premio` varchar(20) DEFAULT NULL,
  `fecha_gano_premio` datetime DEFAULT NULL,
  `fecha_entrega_premio` datetime DEFAULT NULL,
  PRIMARY KEY (`premio_participante_id`),
  KEY `FK_PRE_PAR_PREMIO_idx` (`premio_id`),
  KEY `FK_PRE_PAR_PARCIPANTE_idx` (`participante_id`),
  KEY `FK_PRE_PAR_PAR_BOL_DET_idx` (`participante_boleto_det_id`),
  KEY `FK_PRE_PAR_INC_PRO_PRE_idx` (`inc_pro_pre_id`)
) ENGINE=InnoDB AUTO_INCREMENT=580 DEFAULT CHARSET=latin1 COMMENT='Tabla que indica los premios de los participantes que jugaron en el evento';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premio_participante`
--

LOCK TABLES `premio_participante` WRITE;
/*!40000 ALTER TABLE `premio_participante` DISABLE KEYS */;
/*!40000 ALTER TABLE `premio_participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `probabilidades`
--

DROP TABLE IF EXISTS `probabilidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `probabilidades` (
  `probabilidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `probabilidad_porcentaje` int(11) DEFAULT NULL,
  `estado_id` int(11) DEFAULT NULL,
  `probabilidad_hora_inicio` time DEFAULT NULL,
  `probabilidad_hora_fin` time DEFAULT NULL,
  PRIMARY KEY (`probabilidad_id`),
  KEY `probabilidades_estado_id_idx` (`estado_id`),
  CONSTRAINT `probabilidades_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1 COMMENT='tabla que indica la probabilidad de que un participante gane o pierda en el juego';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `probabilidades`
--

LOCK TABLES `probabilidades` WRITE;
/*!40000 ALTER TABLE `probabilidades` DISABLE KEYS */;
INSERT  IGNORE INTO `probabilidades` (`probabilidad_id`, `probabilidad_porcentaje`, `estado_id`, `probabilidad_hora_inicio`, `probabilidad_hora_fin`) VALUES (11,80,1,NULL,NULL);
/*!40000 ALTER TABLE `probabilidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_juegos`
--

DROP TABLE IF EXISTS `tipo_juegos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_juegos` (
  `tipo_juego_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_juego_nombre` varchar(60) DEFAULT NULL,
  `tipo_juego_desripcion` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`tipo_juego_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_juegos`
--

LOCK TABLES `tipo_juegos` WRITE;
/*!40000 ALTER TABLE `tipo_juegos` DISABLE KEYS */;
INSERT  IGNORE INTO `tipo_juegos` (`tipo_juego_id`, `tipo_juego_nombre`, `tipo_juego_desripcion`) VALUES (1,'Puerta Millonario','juego de 3 puertas donde se selecciona una'),(2,'Juego de Cartas','juego de cartas mayor o menor con turnos');
/*!40000 ALTER TABLE `tipo_juegos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_url`
--

DROP TABLE IF EXISTS `tipo_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_url` (
  `tipo_url_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_url_nombre` varchar(100) DEFAULT NULL,
  `tipo_url_descripcion` varchar(200) DEFAULT NULL,
  `tipo_juego_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tipo_url_id`),
  KEY `fk_tipo_url_tipo_juegos_idx` (`tipo_juego_id`),
  CONSTRAINT `fk_tipo_url_tipo_juegos` FOREIGN KEY (`tipo_juego_id`) REFERENCES `tipo_juegos` (`tipo_juego_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_url`
--

LOCK TABLES `tipo_url` WRITE;
/*!40000 ALTER TABLE `tipo_url` DISABLE KEYS */;
INSERT  IGNORE INTO `tipo_url` (`tipo_url_id`, `tipo_url_nombre`, `tipo_url_descripcion`, `tipo_juego_id`) VALUES (1,'VIDEO_PRINCIPAL','VIDEO PROMOCIONAL',1),(2,'BOTON_PRINCIPAL',NULL,1),(3,'FONDO_JUEGO',NULL,1),(4,'BOTON_JUEGO',NULL,1),(5,'SONIDO_JUEGO',NULL,1),(6,'BASE_JUEGO',NULL,1),(7,'PRIMERA_PUERTA',NULL,1),(8,'SEGUNDA_PUERTA',NULL,1),(9,'TERCERA_PUERTA',NULL,1),(10,'IMAGEN CARTA 1',NULL,2),(11,'IMAGEN CARTA 2',NULL,2);
/*!40000 ALTER TABLE `tipo_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_usuario`
--

DROP TABLE IF EXISTS `tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_usuario` (
  `tipo_usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_usuario_nombre` varchar(45) DEFAULT NULL,
  `tipo_usuario_descripcion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tipo_usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COMMENT='tabla para el ingreso de tipo del usuario del sistema';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_usuario`
--

LOCK TABLES `tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tipo_usuario` DISABLE KEYS */;
INSERT  IGNORE INTO `tipo_usuario` (`tipo_usuario_id`, `tipo_usuario_nombre`, `tipo_usuario_descripcion`) VALUES (1,'ADMINISTRADOR','ADMINISTRADOR DEL SISTEMA'),(2,'REGISTRADOR','USUARIO REGISTRADOR'),(3,'TELEVISOR','');
/*!40000 ALTER TABLE `tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Representa al primary key de la tabla usuarios',
  `usuario_username` varchar(45) DEFAULT NULL COMMENT 'Representa al usuario que ingresa a la aplicación, es un identificador único',
  `usuario_password` varchar(100) DEFAULT NULL COMMENT 'Representa la contraseña que ingresa a la aplicación',
  `usuario_nombre` varchar(150) DEFAULT NULL COMMENT 'Representa el nombre del usuario que ingresa a la aplicación',
  `usuario_apellido` varchar(150) DEFAULT NULL COMMENT 'Representa el apellido usuario que ingresa a la aplicación',
  `usuario_telefono` varchar(13) DEFAULT NULL COMMENT 'Representa el telefono usuario que ingresa a la aplicación',
  `usuario_email` varchar(40) DEFAULT NULL COMMENT 'Representa el email usuario que ingresa a la aplicación',
  `tipo_usuario_id` int(11) DEFAULT NULL COMMENT 'Representa al tipo del cual es el usuario',
  `estado_id` int(11) DEFAULT NULL COMMENT 'Representa al estado del registro',
  `remember_token` varchar(100) DEFAULT NULL COMMENT 'Representa al toke de sesión para laravel en caso del administrador y token de firebase en caso de usuario de app',
  PRIMARY KEY (`usuario_id`),
  KEY `usuarios_tipo_usuario_id_idx` (`tipo_usuario_id`),
  KEY `usuarios_estado_id_idx` (`estado_id`),
  CONSTRAINT `usuarios_estado_id` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`estado_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Representa a los usuarios que usan la aplicación';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT  IGNORE INTO `usuario` (`usuario_id`, `usuario_username`, `usuario_password`, `usuario_nombre`, `usuario_apellido`, `usuario_telefono`, `usuario_email`, `tipo_usuario_id`, `estado_id`, `remember_token`) VALUES (1,'admin','$2y$10$X1KILt2FfVeVK5IQKYjU/OgE/tsQq.VJgyl0TNWtJz4iDKgFAiAWi','Pruebas','Usuario','0981065404','pruebasinstaticket@gmail.com',1,1,'tQFIz0RbfOvtFd4Px7SjOGXBSmMRM8TXzES5XmDMnHas7cRFcPDpFjFYC8A5'),(2,'tv','356a192b7913b04c54574d18c28d46e6395428ab','PRUEBA','PRUEBA','0968328989','michaelmarcillo90@gmail.com',3,1,NULL),(3,'user','$2y$10$X1KILt2FfVeVK5IQKYjU/OgE/tsQq.VJgyl0TNWtJz4iDKgFAiAWi','ALYN GABRIELA','RODRIGUEZ ROSADO','151515','alyn23@hotmail.com',2,1,'KzPdbdf4v02iAFvKOffAyL1SqnmL3VY8UFLZWlaGX86JXfBhN4RexT6HKPh8');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'instaticket_puertaganadora'
--

--
-- Dumping routines for database 'instaticket_puertaganadora'
--
/*!50003 DROP FUNCTION IF EXISTS `INACTIVAR_PREMIO_USUARIOS` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`puerta_ganadora`@`%` FUNCTION `INACTIVAR_PREMIO_USUARIOS`(P_USUARIO_ID INT) RETURNS int(11)
BEGIN

-- Variable para controlar el fin del bucle
DECLARE fin INTEGER DEFAULT 0;
DECLARE V_CICLO_PREMIO_ID INT;
DECLARE V_PREMIO_ID INT;
DECLARE V_PREMIO_USUARIO_ID INT;
DECLARE V_INCENTIVO_PREMIO_ID INT;
DECLARE C_PREMIO_USUARIO_PENDIENTE CURSOR FOR 
    select premio_usuario_id, ciclo_premio_id, premio_id, incentivo_premio_id from premio_usuarios where estado_id = 7 AND usuario_id = P_USUARIO_ID;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;


OPEN C_PREMIO_USUARIO_PENDIENTE;
  OBTENER_PREMIO_USUARIO: LOOP
    FETCH C_PREMIO_USUARIO_PENDIENTE INTO V_PREMIO_USUARIO_ID, V_CICLO_PREMIO_ID, V_PREMIO_ID, V_INCENTIVO_PREMIO_ID;
    IF fin = 1 THEN
       LEAVE OBTENER_PREMIO_USUARIO;
    END IF;
	
    UPDATE premio_usuarios SET ESTADO_ID = 8 WHERE PREMIO_USUARIO_ID = V_PREMIO_USUARIO_ID;
    IF V_CICLO_PREMIO_ID IS NOT NULL THEN
		update ciclo_premios set stock_virtual = stock_virtual-1 where ciclo_premio_id =V_CICLO_PREMIO_ID and premio_id = V_PREMIO_ID;
	END IF;
    IF V_INCENTIVO_PREMIO_ID IS NOT NULL THEN
		update incentivo_premios set cantidad_virtual = cantidad_virtual-1 where incentivo_premio_id =V_INCENTIVO_PREMIO_ID and premio_id = V_PREMIO_ID;
    END IF;

  END LOOP OBTENER_PREMIO_USUARIO;
CLOSE C_PREMIO_USUARIO_PENDIENTE;

RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_ganador` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `obtener_ganador`(IN P_EVENTO_ID INT,IN P_CICLOEVENTO_ID INT)
PROCEDIMIENTOPREMIOS:BEGIN


DECLARE V_PROBABILIDAD INT;
DECLARE V_TOTAL_TIRAJE INT;
DECLARE V_TIRAJE_DIARIO_ID INT;
DECLARE V_TIRAJE_USUARIO_OCUPADO INT DEFAULT 0;
DECLARE V_PROB_ALEATORIA INT DEFAULT 0;
DECLARE V_PROB_PREMIO INT DEFAULT 0;


DECLARE V_CANTIDAD_CATEGORIAS INT DEFAULT 6;
DECLARE V_CONTADOR_CATEGORIAS INT DEFAULT 1;

DECLARE V_CATEGORIA INT;
DECLARE V_FOTO_PREMIO VARCHAR(255);
DECLARE V_PREMIO INT;
DECLARE V_NOMBRE VARCHAR(255);
DECLARE V_DESCRIPCION VARCHAR(255);
DECLARE V_INC INT;
DECLARE V_PR INT;
DECLARE V_MINIMO INT;
DECLARE V_MAXIMO INT;
DECLARE V_CICLO_PREMIO_ID INT;
DECLARE V_CANTIDAD INT;

DECLARE V_GANADOR INT;
DECLARE V_CATEGORIA_GANADORA INT;

DECLARE EJECUTO_FUNCION_INACTIVAR_PREMIOS INT;


DECLARE V_CONTADOR_PREMIOS_C INT DEFAULT 0;
DECLARE V_CANTIDAD_PREMIOS_C INT DEFAULT 0;
DECLARE V_ID_PREMIOS_C INT;
DECLARE V_NOMBRE_P VARCHAR(255);
DECLARE	V_DESCRIPCION_P VARCHAR(255);
DECLARE	V_CANTIDAD_P INT;
DECLARE tPremiosDisponibles INT;
DECLARE tPremiosEntregados  INT;

DECLARE ID_V_GANADOR INT;
DECLARE V_INC_PRO_P INT;


-- select INACTIVAR_PREMIO_USUARIOS(P_USUARIO_ID) INTO EJECUTO_FUNCION_INACTIVAR_PREMIOS;


SELECT probabilidad_porcentaje FROM probabilidades 
        where ( (probabilidad_hora_inicio is null and probabilidad_hora_fin is null) or 
	            (curtime() between probabilidad_hora_inicio and probabilidad_hora_fin)) and estado_id = 1 LIMIT 1 INTO V_PROBABILIDAD;
        

DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_WS;
DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_DISPONIBLES_WS;
CREATE TEMPORARY TABLE T_PREMIOS_WS(
categoria INT, 
fotoPremio VARCHAR(255), 
premio INT, 
nombre VARCHAR (255), 
descripcion VARCHAR (255), 
inc INT, 
pr INT, 
minimo INT, 
maximo INT, 
ciclo_premio_id int, cantidad int);

CREATE TEMPORARY TABLE T_PREMIOS_DISPONIBLES_WS(
categoria INT, 
premio INT, 
nombre VARCHAR (255), 
descripcion VARCHAR (255), 
cantidad INT);

set @diaActual = null;
set @totalDiasMes = null;
set @cicloId = null;
set @totalPremios = null;
set @totalPremiosDisponibles = null;
set @totalPremiosEntregados = null;

set @cicloEvento = null;

set @entregadosCat=0;
set @totalDispCat=0;


set @premioCat1 = 0;
set @premioCat2 = 0;
set @premioCat3 = 0;
set @premioCat4 = 0;
set @premioCat5 = 0;
set @premioCat6 = 0;

select day(curdate()) into @diaActual; 
select day(last_day(curdate())) into @totalDiasMes; 
select ciclo_evento_id from ciclo_evento where evento_id = P_EVENTO_ID into @cicloEvento;
select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total) from ciclo_evento_premio 
	where ciclo_evento_id = @cicloEvento into @totalPremios;
select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual from ciclo_evento_premio 
	where ciclo_evento_id = @cicloEvento into @totalPremiosDisponibles;
select sum(ciclo_evento_premio.ciclo_evento_premio_stock_virtual) from ciclo_evento_premio 
	where ciclo_evento_id = @cicloEvento into @totalPremiosEntregados;


select parametro_general_valor from parametro_general where parametro_general_nombre = 'URL_RECURSOS' into @urlRecursos;

WHILE V_CONTADOR_CATEGORIAS <= V_CANTIDAD_CATEGORIAS DO

SELECT count(*) as N_premios
FROM ciclo_evento_premio cep, ciclo_evento ce,premio p
WHERE cep.ciclo_evento_id=ce.ciclo_evento_id and cep.premio_id=p.premio_id and p.categoria_id=V_CONTADOR_CATEGORIAS and ce.evento_id=P_EVENTO_ID INTO V_CANTIDAD_PREMIOS_C;

WHILE V_CONTADOR_PREMIOS_C < V_CANTIDAD_PREMIOS_C DO
    SELECT p.premio_id,p.premio_nombre,p.premio_descripcion,cep.ciclo_evento_premio_stock_disponible,cep.ciclo_evento_premio_stock_virtual
    FROM premio p,ciclo_evento_premio cep, ciclo_evento ce
    WHERE cep.ciclo_evento_id=ce.ciclo_evento_id and p.premio_id=cep.premio_id and p.categoria_id=V_CONTADOR_CATEGORIAS and ce.evento_id=P_EVENTO_ID limit V_CONTADOR_PREMIOS_C,1  INTO V_ID_PREMIOS_C,V_NOMBRE_P,V_DESCRIPCION_P,tPremiosDisponibles,tPremiosEntregados;
    
    IF tPremiosDisponibles>tPremiosEntregados THEN
		select round((sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes)*@diaActual) 
		from ciclo_evento_premio, ciclo_evento, premio
		where premio.premio_id = ciclo_evento_premio.premio_id
		and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
		and ciclo_evento.ciclo_evento_id = P_CICLOEVENTO_ID and premio.categoria_id = V_CONTADOR_CATEGORIAS and premio.premio_id =V_ID_PREMIOS_C into @totalDispCat;
	  
		 select (sum(ciclo_evento_premio.ciclo_evento_premio_stock_virtual)/@totalDiasMes)*@diaActual 
			from ciclo_evento_premio, ciclo_evento, premio
			where premio.premio_id = ciclo_evento_premio.premio_id
			and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
			and ciclo_evento.ciclo_evento_id = P_CICLOEVENTO_ID and categoria_id = V_CONTADOR_CATEGORIAS and premio.premio_id =V_ID_PREMIOS_C into @entregadosCat;
		 
		 IF @totalDispCat > @entregadosCat THEN
            INSERT INTO T_PREMIOS_DISPONIBLES_WS VALUES (
			V_CONTADOR_CATEGORIAS,
			V_ID_PREMIOS_C,
			V_NOMBRE_P,
			V_DESCRIPCION_P,
			1);
		 END IF; 
		set @entregadosCat=0;
		set @totalDispCat=0;
    END IF;
		SET tPremiosDisponibles =NULL;
		SET tPremiosEntregados =NULL;
    
	SELECT categoria.categoria_id categoria,
    concat(@urlRecursos,incremento_probabilidad_premio.inc_pro_pre_url_imagen) fotoPremio,
    incremento_probabilidad_premio.premio_id premio,
    incremento_probabilidad_premio.inc_pro_pre_nombre,
	incremento_probabilidad_premio.inc_pro_pre_descripcion,
    incremento_probabilidad_premio.inc_pro_pre_id inc,
    categoria.categoria_porcentaje_probabilidad pr,
    categoria.categoria_rango_minimo,
    categoria.categoria_rango_maximo,
     incremento_probabilidad_premio.ciclo_evento_premio_id,
    incremento_probabilidad_premio.inc_pro_pre_cantidad cantidad
	FROM incremento_probabilidad_premio, premio, categoria
	where curdate() = incremento_probabilidad_premio.inc_pro_pre_fecha_incremento
        and now() between incremento_probabilidad_premio.inc_pro_pre_hora_inicio_incremento and inc_pro_pre_hora_fin_incremento
	and premio.premio_id = incremento_probabilidad_premio.premio_id
	and categoria.categoria_id = incremento_probabilidad_premio.categoria_id
	and incremento_probabilidad_premio.estado_id = 1
	and incremento_probabilidad_premio.inc_pro_pre_cantidad > 0
    and incremento_probabilidad_premio.inc_pro_pre_cantidad_disponible > incremento_probabilidad_premio.inc_pro_pre_cantidad_virtual
	order by incremento_probabilidad_premio.inc_pro_pre_cantidad desc LIMIT 1 INTO 
    V_CATEGORIA,
    V_FOTO_PREMIO,
    V_PREMIO,
    V_NOMBRE,
    V_DESCRIPCION,
    V_INC,
    V_PR,
    V_MINIMO,
    V_MAXIMO,
    V_CICLO_PREMIO_ID, 
    V_CANTIDAD;
	IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
		
		INSERT INTO T_PREMIOS_WS VALUES (
        V_CATEGORIA,
        V_FOTO_PREMIO,
        V_PREMIO,
        V_NOMBRE,
        V_DESCRIPCION,
        V_INC,
        V_PR,
        V_MINIMO,
        V_MAXIMO,
        V_CICLO_PREMIO_ID,
        V_CANTIDAD);
        
         INSERT INTO T_PREMIOS_DISPONIBLES_WS VALUES (
			V_CATEGORIA,
			V_PREMIO,
			V_NOMBRE,
			V_DESCRIPCION,
			1);
	ELSE 
		
		select premio.categoria_id as categoria,
        concat(@urlRecursos,premio_url_imagen) fotoPremio, 
		premio.premio_id premio,
        premio.premio_nombre,
        premio.premio_descripcion,
        null inc,
        categoria.categoria_porcentaje_probabilidad pr, 
        categoria.categoria_rango_minimo, 
        categoria.categoria_rango_maximo, 
        ciclo_evento_premio.ciclo_evento_premio_id, 
        ciclo_evento_premio.ciclo_evento_premio_stock_virtual cantidad
		from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
		where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
		and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
		and ciclo.ciclo_id = ciclo_evento.ciclo_id
		and ciclo_evento_premio.premio_id = premio.premio_id
		and categoria.categoria_id = premio.categoria_id
		-- and ciclo.estado_id = 1
		and ciclo_evento.estado_id = 1
		and premio.estado_id = 1 
		and categoria.estado_id = 1   
		and ciclo_evento_premio.ciclo_evento_premio_stock_disponible > ciclo_evento_premio.ciclo_evento_premio_stock_virtual
		and premio.categoria_id = V_CONTADOR_CATEGORIAS
        and ciclo_evento.ciclo_evento_id = P_CICLOEVENTO_ID
        and premio.premio_id=V_ID_PREMIOS_C
		order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO 
        V_CATEGORIA,
        V_FOTO_PREMIO,
        V_PREMIO,
        V_NOMBRE,
        V_DESCRIPCION,
        V_INC,
        V_PR,
        V_MINIMO,
        V_MAXIMO,
        V_CICLO_PREMIO_ID,
        V_CANTIDAD;
		IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
			INSERT INTO T_PREMIOS_WS VALUES (
            V_CATEGORIA,
            V_FOTO_PREMIO,
            V_PREMIO,
            V_NOMBRE,
            V_DESCRIPCION,
            V_INC,
            V_PR,
            V_MINIMO,
            V_MAXIMO,
            V_CICLO_PREMIO_ID,
            V_CANTIDAD);
		ELSE 
			
			select premio.categoria_id as categoria,
			concat(@urlRecursos,premio_url_imagen) fotoPremio, 
			premio.premio_id premio,
			premio.premio_nombre,
			premio.premio_descripcion,
			null inc,
            -1 pr,
            -1 minimo,
            -1 maximo,
			ciclo_evento_premio.ciclo_evento_premio_id, 
			ciclo_evento_premio.ciclo_evento_premio_stock_virtual cantidad
			from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
			where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
			and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
			and ciclo.ciclo_id = ciclo_evento.ciclo_id
			and ciclo_evento_premio.premio_id = premio.premio_id
			and categoria.categoria_id = premio.categoria_id
			-- and ciclo.estado_id = 1
			and ciclo_evento.estado_id = 1
			and premio.estado_id = 1 
			and categoria.estado_id = 1   
			and premio.categoria_id = V_CONTADOR_CATEGORIAS
            and ciclo_evento.ciclo_evento_id = P_CICLOEVENTO_ID
            and premio.premio_id=V_ID_PREMIOS_C
			order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO 
			V_CATEGORIA,
			V_FOTO_PREMIO,
			V_PREMIO,
			V_NOMBRE,
			V_DESCRIPCION,
			V_INC,
			V_PR,
			V_MINIMO,
			V_MAXIMO,
			V_CICLO_PREMIO_ID,
			V_CANTIDAD;
			/*INSERT INTO T_PREMIOS_WS VALUES (
            V_CATEGORIA,
            V_FOTO_PREMIO,
            V_PREMIO,
            V_NOMBRE,
            V_DESCRIPCION,
            V_INC,
            V_PR,
            V_MINIMO,
            V_MAXIMO,
            V_CICLO_PREMIO_ID,
            V_CANTIDAD);*/
            
            IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
			INSERT INTO T_PREMIOS_WS VALUES (
            V_CATEGORIA,
            V_FOTO_PREMIO,
            V_PREMIO,
            V_NOMBRE,
            V_DESCRIPCION,
            V_INC,
            V_PR,
            V_MINIMO,
            V_MAXIMO,
            V_CICLO_PREMIO_ID,
            V_CANTIDAD);
            END IF; 
		END IF;    
	END IF;
    
    
    SET V_CATEGORIA = NULL;
    SET V_FOTO_PREMIO = NULL;
    SET V_PREMIO = NULL;
    SET V_NOMBRE = NULL;
    SET V_DESCRIPCION = NULL;
    SET V_INC = NULL;
    SET V_PR = NULL;
    SET V_MINIMO = NULL;
    SET V_MAXIMO = NULL;
    SET V_CICLO_PREMIO_ID = NULL;
    SET V_CANTIDAD = NULL;
    
    set V_ID_PREMIOS_C = NULL;
    set V_NOMBRE_P= NULL;
	set V_DESCRIPCION_P= NULL;
    set V_CONTADOR_PREMIOS_C = V_CONTADOR_PREMIOS_C +1;
    END WHILE;
    set V_CANTIDAD_PREMIOS_C = 0;
    set V_CONTADOR_PREMIOS_C = 0;
    
    set V_CONTADOR_CATEGORIAS = V_CONTADOR_CATEGORIAS +1;
    
END WHILE;

SELECT floor(rand()*100) FROM DUAL INTO V_PROB_ALEATORIA;

IF V_PROB_ALEATORIA <= V_PROBABILIDAD THEN 
	SET V_GANADOR = V_PROB_ALEATORIA <= V_PROBABILIDAD;

    SELECT floor(rand()*100) FROM DUAL INTO V_PROB_PREMIO;
	SELECT 
    categoria, 
    fotoPremio, 
    premio, 
    nombre, 
    descripcion,
    inc, 
    pr, 
    minimo, 
    maximo, 
    ciclo_premio_id, 
    cantidad
    FROM T_PREMIOS_WS WHERE V_PROB_PREMIO BETWEEN minimo AND maximo LIMIT 1 
    INTO 
    V_CATEGORIA,
    V_FOTO_PREMIO,
    V_PREMIO,
    V_NOMBRE,
    V_DESCRIPCION,
    V_INC,
    V_PR,
    V_MINIMO,
	V_MAXIMO,
    V_CICLO_PREMIO_ID,
    V_CANTIDAD;
    


    IF V_CATEGORIA >0 AND V_CATEGORIA <7 THEN
    
		SELECT premio,ciclo_premio_id FROM T_PREMIOS_WS where categoria=V_CATEGORIA ORDER BY RAND() LIMIT 1 into V_ID_PREMIOS_C,V_CICLO_PREMIO_ID;
        
		SELECT cantidad FROM T_PREMIOS_DISPONIBLES_WS where categoria=V_CATEGORIA and premio=V_ID_PREMIOS_C LIMIT 1 into V_CANTIDAD_P;
        
            IF(V_CANTIDAD_P>0)
        THEN
			insert into premio_participante (`premio_id`,`participante_id`,`estado_id`,`ciclo_evento_premio_id`,`inc_pro_pre_id`,`fecha_gano_premio`)
			values (V_ID_PREMIOS_C,null,7,V_CICLO_PREMIO_ID,V_INC,now());
			SET ID_V_GANADOR = LAST_INSERT_ID();
			IF V_INC IS NOT NULL THEN
				update incremento_probabilidad_premio set inc_pro_pre_cantidad_virtual = inc_pro_pre_cantidad_virtual+1 where inc_pro_pre_id = V_INC ;
              --  update ciclo_evento_premio set ciclo_evento_premio_stock_virtual = ciclo_evento_premio_stock_virtual+1 where ciclo_evento_id = P_EVENTO_ID and premio_id=V_ID_PREMIOS_C;
			ELSE 
				update ciclo_evento_premio set ciclo_evento_premio_stock_virtual = ciclo_evento_premio_stock_virtual+1 where ciclo_evento_id = P_CICLOEVENTO_ID and premio_id=V_ID_PREMIOS_C;
			END IF;
		ELSE
			SET ID_V_GANADOR = NULL;
			SET V_GANADOR = NULL;
            SET V_CATEGORIA = NULL;
            SET V_ID_PREMIOS_C=NULL;
        END IF;
        
        ELSE
			SET ID_V_GANADOR = NULL;
			SET V_GANADOR = NULL;
            SET V_CATEGORIA = NULL;
            SET V_ID_PREMIOS_C=NULL;
			SET V_CANTIDAD_P=NULL;
	END IF;

END IF;

-- SELECT V_PROB_ALEATORIA FROM DUAL;
SELECT V_GANADOR,V_CATEGORIA,V_ID_PREMIOS_C,ID_V_GANADOR,V_PROB_PREMIO, T_PREMIOS_WS.* FROM T_PREMIOS_WS;
-- SELECT T_PREMIOS_DISPONIBLES_WS.* From T_PREMIOS_DISPONIBLES_WS;
-- Select tPremiosDisponibles,tPremiosEntregados,@totalDispCat, @entregadosCat;
DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_WS;
DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_DISPONIBLES_WS;

END PROCEDIMIENTOPREMIOS ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_ganador_juego` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `obtener_ganador_juego`(IN P_EVENTO_ID INT)
PROCEDIMIENTOPREMIOS:BEGIN


DECLARE V_PROBABILIDAD INT;
DECLARE V_TOTAL_TIRAJE INT;
DECLARE V_TIRAJE_DIARIO_ID INT;
DECLARE V_TIRAJE_USUARIO_OCUPADO INT DEFAULT 0;
DECLARE V_PROB_ALEATORIA INT DEFAULT 0;
DECLARE V_PROB_PREMIO INT DEFAULT 0;


DECLARE V_CANTIDAD_CATEGORIAS INT DEFAULT 6;
DECLARE V_CONTADOR_CATEGORIAS INT DEFAULT 1;

DECLARE V_CATEGORIA INT;
DECLARE V_FOTO_PREMIO VARCHAR(255);
DECLARE V_PREMIO INT;
DECLARE V_NOMBRE VARCHAR(255);
DECLARE V_DESCRIPCION VARCHAR(255);
DECLARE V_INC INT;
DECLARE V_PR INT;
DECLARE V_MINIMO INT;
DECLARE V_MAXIMO INT;
DECLARE V_CICLO_PREMIO_ID INT;
DECLARE V_CANTIDAD INT;

DECLARE V_GANADOR INT;
DECLARE V_CATEGORIA_GANADORA INT;

DECLARE EJECUTO_FUNCION_INACTIVAR_PREMIOS INT;


-- select INACTIVAR_PREMIO_USUARIOS(P_USUARIO_ID) INTO EJECUTO_FUNCION_INACTIVAR_PREMIOS;


SELECT probabilidad_porcentaje FROM probabilidades 
        where ( (probabilidad_hora_inicio is null and probabilidad_hora_fin is null) or 
	            (curtime() between probabilidad_hora_inicio and probabilidad_hora_fin)) and estado_id = 1 LIMIT 1 INTO V_PROBABILIDAD;
        

DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_WS;
CREATE TEMPORARY TABLE T_PREMIOS_WS(
categoria INT, 
fotoPremio VARCHAR(255), 
premio INT, 
nombre VARCHAR (255), 
descripcion VARCHAR (255), 
inc INT, 
pr INT, 
minimo INT, 
maximo INT, 
ciclo_premio_id int, cantidad int);

set @diaActual = null;
set @totalDiasMes = null;
set @cicloId = null;
set @totalPremios = null;
set @totalPremiosDisponibles = null;
set @totalPremiosEntregados = null;

set @cicloEvento = null;

set @premioCat1 = 0;
set @premioCat2 = 0;
set @premioCat3 = 0;
set @premioCat4 = 0;
set @premioCat5 = 0;
set @premioCat6 = 0;

select day(curdate()) into @diaActual; 
select day(last_day(curdate())) into @totalDiasMes; 
select ciclo_evento_id from ciclo_evento where evento_id = P_EVENTO_ID into @cicloEvento;
select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total) from ciclo_evento_premio 
	where ciclo_evento_id = @cicloEvento into @totalPremios;
select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual from ciclo_evento_premio 
	where ciclo_evento_id = @cicloEvento into @totalPremiosDisponibles;
select sum(ciclo_evento_premio.ciclo_evento_premio_stock_virtual) from ciclo_evento_premio 
	where ciclo_evento_id = @cicloEvento into @totalPremiosEntregados;

/*
IF @totalPremiosDisponibles>@totalPremiosEntregados THEN
 
 select round(sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual) 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
	and ciclo_evento.ciclo_evento_id = @cicloEvento and premio.categoria_id = 1 into @entregadosCat1;
 
 select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
    and ciclo_evento.ciclo_evento_id = @cicloEvento and categoria_id = 1 into @totalDispCat1;
    
 IF @totalDispCat1 > @entregadosCat1 THEN
	set @premioCat1 = 1;
 END IF;   
 
 
 select round(sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual) 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
	and ciclo_evento.ciclo_evento_id = @cicloEvento and premio.categoria_id = 2 into @entregadosCat2;
 
 select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
    and ciclo_evento.ciclo_evento_id = @cicloEvento and categoria_id = 2 into @totalDispCat2;
 
 IF @totalDispCat2 > @entregadosCat2 THEN
	set @premioCat2 = 1;
 END IF; 
 
 
 select round(sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual) 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
	and ciclo_evento.ciclo_evento_id = @cicloEvento and premio.categoria_id = 3 into @entregadosCat3;
  
 select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
    and ciclo_evento.ciclo_evento_id = @cicloEvento and categoria_id = 3 into @totalDispCat3;

 IF @totalDispCat3 > @entregadosCat3 THEN
	set @premioCat3 = 1;
 END IF;  
 
 
 select round(sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual) 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
	and ciclo_evento.ciclo_evento_id = @cicloEvento and premio.categoria_id = 4 into @entregadosCat4;
  
 select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
    and ciclo_evento.ciclo_evento_id = @cicloEvento and categoria_id = 4 into @totalDispCat4;

 IF @totalDispCat4 > @entregadosCat4 THEN
	set @premioCat4 = 1;
 END IF;  
 
 
 select round(sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual) 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
	and ciclo_evento.ciclo_evento_id = @cicloEvento and premio.categoria_id = 5 into @entregadosCat5;
  
 select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
    and ciclo_evento.ciclo_evento_id = @cicloEvento and categoria_id = 5 into @totalDispCat5;

 IF @totalDispCat5 > @entregadosCat5 THEN
	set @premioCat5 = 1;
 END IF;  
 
 
 select round(sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual) 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
	and ciclo_evento.ciclo_evento_id = @cicloEvento and premio.categoria_id = 6 into @entregadosCat6;
  
 select sum(ciclo_evento_premio.ciclo_evento_premio_stock_total)/@totalDiasMes*@diaActual 
	from ciclo_evento_premio, ciclo_evento, premio
	where premio.premio_id = ciclo_evento_premio.premio_id
	and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
    and ciclo_evento.ciclo_evento_id = @cicloEvento and categoria_id = 6 into @totalDispCat6;
 
 IF @totalDispCat6 > @entregadosCat6 THEN
	set @premioCat6 = 1;
 END IF;  

end if;
*/

select parametro_general_valor from parametro_general where parametro_general_nombre = 'URL_RECURSOS' into @urlRecursos;

WHILE V_CONTADOR_CATEGORIAS <= V_CANTIDAD_CATEGORIAS DO
	SELECT categoria.categoria_id categoria,
    concat(@urlRecursos,incremento_probabilidad_premio.inc_pro_pre_url_imagen) fotoPremio,
    incremento_probabilidad_premio.premio_id premio,
    incremento_probabilidad_premio.inc_pro_pre_nombre,
	incremento_probabilidad_premio.inc_pro_pre_descripcion,
    incremento_probabilidad_premio.inc_pro_pre_id inc,
    categoria.categoria_porcentaje_probabilidad pr,
    categoria.categoria_rango_minimo,
    categoria.categoria_rango_maximo,
    NULL ciclo_evento_premio_id,
    incremento_probabilidad_premio.inc_pro_pre_cantidad cantidad
	FROM incremento_probabilidad_premio, premio, categoria
	where curdate() = incremento_probabilidad_premio.inc_pro_pre_fecha_incremento
	and premio.premio_id = incremento_probabilidad_premio.premio_id
	and categoria.categoria_id = incremento_probabilidad_premio.categoria_id
	and incremento_probabilidad_premio.estado_id = 1
	and incremento_probabilidad_premio.inc_pro_pre_cantidad > 0
    and incremento_probabilidad_premio.inc_pro_pre_cantidad_disponible > incremento_probabilidad_premio.inc_pro_pre_cantidad_virtual
	order by incremento_probabilidad_premio.inc_pro_pre_cantidad desc LIMIT 1 INTO 
    V_CATEGORIA,
    V_FOTO_PREMIO,
    V_PREMIO,
    V_NOMBRE,
    V_DESCRIPCION,
    V_INC,
    V_PR,
    V_MINIMO,
    V_MAXIMO,
    V_CICLO_PREMIO_ID, 
    V_CANTIDAD;
	IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
		
		INSERT INTO T_PREMIOS_WS VALUES (
        V_CATEGORIA,
        V_FOTO_PREMIO,
        V_PREMIO,
        V_NOMBRE,
        V_DESCRIPCION,
        V_INC,
        V_PR,
        V_MINIMO,
        V_MAXIMO,
        V_CICLO_PREMIO_ID,
        V_CANTIDAD);
	ELSE 
		
		select premio.categoria_id as categoria,
        concat(@urlRecursos,premio_url_imagen) fotoPremio, 
		premio.premio_id premio,
        premio.premio_nombre,
        premio.premio_descripcion,
        null inc,
        categoria.categoria_porcentaje_probabilidad pr, 
        categoria.categoria_rango_minimo, 
        categoria.categoria_rango_maximo, 
        ciclo_evento_premio.ciclo_evento_premio_id, 
        ciclo_evento_premio.ciclo_evento_premio_stock_virtual cantidad
		from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
		where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
		and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
		and ciclo.ciclo_id = ciclo_evento.ciclo_id
		and ciclo_evento_premio.premio_id = premio.premio_id
		and categoria.categoria_id = premio.categoria_id
		-- and ciclo.estado_id = 1
		and ciclo_evento.estado_id = 1
		and premio.estado_id = 1 
		and categoria.estado_id = 1   
		and ciclo_evento_premio.ciclo_evento_premio_stock_disponible > ciclo_evento_premio.ciclo_evento_premio_stock_virtual
		and premio.categoria_id = V_CONTADOR_CATEGORIAS
		order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO 
        V_CATEGORIA,
        V_FOTO_PREMIO,
        V_PREMIO,
        V_NOMBRE,
        V_DESCRIPCION,
        V_INC,
        V_PR,
        V_MINIMO,
        V_MAXIMO,
        V_CICLO_PREMIO_ID,
        V_CANTIDAD;
		IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
			INSERT INTO T_PREMIOS_WS VALUES (
            V_CATEGORIA,
            V_FOTO_PREMIO,
            V_PREMIO,
            V_NOMBRE,
            V_DESCRIPCION,
            V_INC,
            V_PR,
            V_MINIMO,
            V_MAXIMO,
            V_CICLO_PREMIO_ID,
            V_CANTIDAD);
		ELSE 
			
			select premio.categoria_id as categoria,
			concat(@urlRecursos,premio_url_imagen) fotoPremio, 
			premio.premio_id premio,
			premio.premio_nombre,
			premio.premio_descripcion,
			null inc,
            -1 pr,
            -1 minimo,
            -1 maximo,
			ciclo_evento_premio.ciclo_evento_premio_id, 
			ciclo_evento_premio.ciclo_evento_premio_stock_virtual cantidad
			from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
			where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
			and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
			and ciclo.ciclo_id = ciclo_evento.ciclo_id
			and ciclo_evento_premio.premio_id = premio.premio_id
			and categoria.categoria_id = premio.categoria_id
			-- and ciclo.estado_id = 1
			and ciclo_evento.estado_id = 1
			and premio.estado_id = 1 
			and categoria.estado_id = 1   
			and premio.categoria_id = V_CONTADOR_CATEGORIAS
			order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO 
			V_CATEGORIA,
			V_FOTO_PREMIO,
			V_PREMIO,
			V_NOMBRE,
			V_DESCRIPCION,
			V_INC,
			V_PR,
			V_MINIMO,
			V_MAXIMO,
			V_CICLO_PREMIO_ID,
			V_CANTIDAD;
			INSERT INTO T_PREMIOS_WS VALUES (
            V_CATEGORIA,
            V_FOTO_PREMIO,
            V_PREMIO,
            V_NOMBRE,
            V_DESCRIPCION,
            V_INC,
            V_PR,
            V_MINIMO,
            V_MAXIMO,
            V_CICLO_PREMIO_ID,
            V_CANTIDAD);
		END IF;    
	END IF;
    
    
    SET V_CATEGORIA = NULL;
    SET V_FOTO_PREMIO = NULL;
    SET V_PREMIO = NULL;
    SET V_NOMBRE = NULL;
    SET V_DESCRIPCION = NULL;
    SET V_INC = NULL;
    SET V_PR = NULL;
    SET V_MINIMO = NULL;
    SET V_MAXIMO = NULL;
    SET V_CICLO_PREMIO_ID = NULL;
    SET V_CANTIDAD = NULL;
    set V_CONTADOR_CATEGORIAS = V_CONTADOR_CATEGORIAS +1;
    
END WHILE;

SELECT floor(rand()*100) FROM DUAL INTO V_PROB_ALEATORIA;
IF V_PROBABILIDAD>0 THEN
IF V_PROB_ALEATORIA <= V_PROBABILIDAD THEN 
	SET V_GANADOR = V_PROB_ALEATORIA <= V_PROBABILIDAD;

    SELECT floor(rand()*100) FROM DUAL INTO V_PROB_PREMIO;
	SELECT 
    categoria, 
    fotoPremio, 
    premio, 
    nombre, 
    descripcion,
    inc, 
    pr, 
    minimo, 
    maximo, 
    ciclo_premio_id, 
    cantidad
    FROM T_PREMIOS_WS WHERE V_PROB_PREMIO BETWEEN minimo AND maximo LIMIT 1 
    INTO 
    V_CATEGORIA,
    V_FOTO_PREMIO,
    V_PREMIO,
    V_NOMBRE,
    V_DESCRIPCION,
    V_INC,
    V_PR,
    V_MINIMO,
	V_MAXIMO,
    V_CICLO_PREMIO_ID,
    V_CANTIDAD;
/*
    IF V_CATEGORIA >0 AND V_CATEGORIA <7 THEN
		
        
		
        
		IF (V_CATEGORIA = 1 AND @premioCat1 > 0) 
			OR (V_CATEGORIA = 2 AND @premioCat2 > 0)
			OR (V_CATEGORIA = 3 AND @premioCat3 > 0)
			OR (V_CATEGORIA = 4 AND @premioCat4 > 0)
			OR (V_CATEGORIA = 5 AND @premioCat5 > 0)
			OR (V_CATEGORIA = 6 AND @premioCat6 > 0)
        THEN
			insert into premio_usuarios (`tiraje_usuario_id`,`usuario_id`,`premio_id`,`estado_id`,`ciclo_premio_id`) 
			values (V_TIRAJE_USUARIO_OCUPADO,P_USUARIO_ID,V_PREMIO,7,V_CICLO_PREMIO_ID);
			IF V_INC IS NOT NULL THEN
				update incentivo_premios set cantidad_virtual = V_CANTIDAD+1 where incentivo_premios.incentivo_premio_id = V_INC;
			ELSE 
				update ciclo_premios set stock_virtual = V_CANTIDAD+1 where ciclo_premio_id = V_CICLO_PREMIO_ID;
			END IF;
        ELSE
			SET V_GANADOR = NULL;
            SET V_CATEGORIA = NULL;
        END IF;
               
	END IF;
*/
END IF;
END IF;

-- SELECT V_PROB_ALEATORIA FROM DUAL;
SELECT V_GANADOR,V_CATEGORIA,V_PROB_PREMIO, T_PREMIOS_WS.* FROM T_PREMIOS_WS;
DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_WS;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_premios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `obtener_premios`(IN P_EVENTO_ID INT)
BEGIN

DECLARE V_CANTIDAD_CATEGORIAS INT DEFAULT 6;
DECLARE V_CONTADOR_CATEGORIAS INT DEFAULT 1;
DECLARE V_CATEGORIA INT;
DECLARE V_FOTO_PREMIO VARCHAR(255);
DECLARE V_PREMIO INT;
DECLARE V_NOMBRE VARCHAR(255);
DECLARE V_DESCRIPCION VARCHAR(255);
DECLARE V_INC INT;
DECLARE V_PR INT;
DECLARE V_CONTADOR_PREMIOS_C INT DEFAULT 0;
DECLARE V_CANTIDAD_PREMIOS_C INT DEFAULT 0;
DECLARE V_ID_PREMIOS_C INT;


DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_WS;
CREATE TEMPORARY TABLE T_PREMIOS_WS(premio INT,categoria INT, fotoPremio VARCHAR(255),  nombre VARCHAR (255), descripcion VARCHAR (255), inc INT, pr INT);

WHILE V_CONTADOR_CATEGORIAS <= V_CANTIDAD_CATEGORIAS DO
	SELECT count(*) as N_premios FROM premio WHERE categoria_id=V_CONTADOR_CATEGORIAS INTO V_CANTIDAD_PREMIOS_C;
    
    WHILE V_CONTADOR_PREMIOS_C < V_CANTIDAD_PREMIOS_C DO
    SELECT premio_id FROM premio WHERE categoria_id=V_CONTADOR_CATEGORIAS limit V_CONTADOR_PREMIOS_C,1  INTO V_ID_PREMIOS_C;
	/*IF V_CONTADOR_CATEGORIAS=1 THEN
		SELECT 1 categorias, concat('/',incremento_probabilidad_premio.inc_pro_pre_url_imagen) fotoPremio, incremento_probabilidad_premio.premio_id premio, 
		incremento_probabilidad_premio.inc_pro_pre_nombre, incremento_probabilidad_premio.inc_pro_pre_descripcion, incremento_probabilidad_premio.inc_pro_pre_id, 
		incremento_probabilidad_premio.inc_pro_pre_porcentaje_probabilidad pr
		FROM incremento_probabilidad_premio, premio
		where curdate() = incremento_probabilidad_premio.inc_pro_pre_fecha_incremento
		and premio.premio_id = incremento_probabilidad_premio.premio_id
		and incremento_probabilidad_premio.estado_id = 1
		and incremento_probabilidad_premio.inc_pro_pre_cantidad > 0
		order by incremento_probabilidad_premio.inc_pro_pre_cantidad desc LIMIT 1 INTO V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;
		
		IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
			
			INSERT INTO T_PREMIOS_WS VALUES (V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
		ELSE 
			
			select premio.categoria_id as categoria, concat('/',premio_url_imagen) fotoPremio, 
			premio.premio_id premio, premio.premio_nombre, premio.premio_descripcion, null inc, categoria.categoria_porcentaje_probabilidad pr 
			from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
			where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
			and ciclo.ciclo_id = ciclo_evento.ciclo_id
			and ciclo_evento_premio.premio_id = premio.premio_id
			and categoria.categoria_id = premio.categoria_id
			and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
			-- and ciclo.estado_id = 1
			-- and ciclo_evento_premio.estado_id = 1
			and premio.estado_id = 1 
			and categoria.estado_id = 1   
			and ciclo_evento_premio.ciclo_evento_premio_stock_disponible > ciclo_evento_premio.ciclo_evento_premio_stock_virtual
			and premio.categoria_id = V_CONTADOR_CATEGORIAS
			order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;

			IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
				INSERT INTO T_PREMIOS_WS VALUES (V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
			ELSE 
				
				select premio.categoria_id as categoria, concat('/',premio_url_imagen) fotoPremio, 
				premio.premio_id premio, premio.premio_nombre, premio.premio_descripcion, null inc, -1 pr 
				from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
				where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
				and ciclo.ciclo_id = ciclo_evento.ciclo_id
				and ciclo_evento_premio.premio_id = premio.premio_id
				and categoria.categoria_id = premio.categoria_id
				and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
				-- and ciclos.estado_id = 1
				-- and ciclo_premios.estado_id = 1
				and premio.estado_id = 1 
				and categoria.estado_id = 1 
				and premio.categoria_id = V_CONTADOR_CATEGORIAS
				order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;
				INSERT INTO T_PREMIOS_WS VALUES (V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
			END IF;    
		END IF;
    ELSE */
		
		select premio.premio_id premio,premio.categoria_id as categoria, concat((select parametro_general_valor from parametro_general where parametro_general_nombre='URL_RECURSOS'),premio_url_imagen) fotoPremio, 
		 premio.premio_nombre, premio.premio_descripcion, null inc, categoria.categoria_porcentaje_probabilidad pr 
		from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
		where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
		and ciclo.ciclo_id = ciclo_evento.ciclo_id
		and ciclo_evento_premio.premio_id = premio.premio_id
		and categoria.categoria_id = premio.categoria_id
		and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
		-- and ciclo.estado_id = 1
		-- and ciclo_evento_premio.estado_id = 1
		and premio.estado_id = 1 
		and categoria.estado_id = 1   
		and ciclo_evento_premio.ciclo_evento_premio_stock_disponible > ciclo_evento_premio.ciclo_evento_premio_stock_virtual
		and premio.categoria_id = V_CONTADOR_CATEGORIAS
        and ciclo_evento.ciclo_evento_id = P_EVENTO_ID
        and premio.premio_id=V_ID_PREMIOS_C
		order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO V_PREMIO,V_CATEGORIA,V_FOTO_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;
		IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
			INSERT INTO T_PREMIOS_WS VALUES (V_PREMIO,V_CATEGORIA,V_FOTO_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
		ELSE 
			
			select premio.premio_id premio,premio.categoria_id as categoria, concat((select parametro_general_valor from parametro_general where parametro_general_nombre='URL_RECURSOS'),premio_url_imagen) fotoPremio, 
			 premio.premio_nombre, premio.premio_descripcion, null inc, -1 pr 
			from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
			where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
			and ciclo.ciclo_id = ciclo_evento.ciclo_id
			and ciclo_evento_premio.premio_id = premio.premio_id
			and categoria.categoria_id = premio.categoria_id
			and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
			-- and ciclos.estado_id = 1
			-- and ciclo_premios.estado_id = 1
			and premio.estado_id = 1 
			and categoria.estado_id = 1 
			and premio.categoria_id = V_CONTADOR_CATEGORIAS
            and ciclo_evento.ciclo_evento_id = P_EVENTO_ID
            and premio.premio_id=V_ID_PREMIOS_C
			order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO V_PREMIO,V_CATEGORIA,V_FOTO_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;


IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
			INSERT INTO T_PREMIOS_WS VALUES (V_PREMIO,V_CATEGORIA,V_FOTO_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);

END IF; 

/*INSERT INTO T_PREMIOS_WS VALUES (V_PREMIO,V_CATEGORIA,V_FOTO_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);*/
		END IF; 
	/*END IF;*/
    set V_CATEGORIA = NULL;set V_FOTO_PREMIO = NULL;set V_PREMIO = NULL;set V_NOMBRE = NULL;set V_DESCRIPCION = NULL;set V_INC = NULL;SET V_PR = NULL;
    set V_ID_PREMIOS_C = NULL;
    set V_CONTADOR_PREMIOS_C = V_CONTADOR_PREMIOS_C +1;
    END WHILE;
    set V_CANTIDAD_PREMIOS_C = NULL;
    set V_CONTADOR_PREMIOS_C = 0;
    set V_CONTADOR_CATEGORIAS = V_CONTADOR_CATEGORIAS +1;
    
END WHILE;

	SELECT * FROM T_PREMIOS_WS;
    DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_WS;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtener_premios_juego` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `obtener_premios_juego`()
BEGIN

DECLARE V_CANTIDAD_CATEGORIAS INT DEFAULT 6;
DECLARE V_CONTADOR_CATEGORIAS INT DEFAULT 1;
DECLARE V_CATEGORIA INT;
DECLARE V_FOTO_PREMIO VARCHAR(255);
DECLARE V_PREMIO INT;
DECLARE V_NOMBRE VARCHAR(255);
DECLARE V_DESCRIPCION VARCHAR(255);
DECLARE V_INC INT;
DECLARE V_PR INT;


DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_WS;
CREATE TEMPORARY TABLE T_PREMIOS_WS(categoria INT, fotoPremio VARCHAR(255), premio INT, nombre VARCHAR (255), descripcion VARCHAR (255), inc INT, pr INT);

WHILE V_CONTADOR_CATEGORIAS <= V_CANTIDAD_CATEGORIAS DO
	IF V_CONTADOR_CATEGORIAS=1 THEN
		SELECT 1 categorias, concat('/',incremento_probabilidad_premio.inc_pro_pre_url_imagen) fotoPremio, incremento_probabilidad_premio.premio_id premio, 
		incremento_probabilidad_premio.inc_pro_pre_nombre, incremento_probabilidad_premio.inc_pro_pre_descripcion, incremento_probabilidad_premio.inc_pro_pre_id, 
		incremento_probabilidad_premio.inc_pro_pre_porcentaje_probabilidad pr
		FROM incremento_probabilidad_premio, premio
		where curdate() = incremento_probabilidad_premio.inc_pro_pre_fecha_incremento
		and premio.premio_id = incremento_probabilidad_premio.premio_id
		and incremento_probabilidad_premio.estado_id = 1
		and incremento_probabilidad_premio.inc_pro_pre_cantidad > 0
		order by incremento_probabilidad_premio.inc_pro_pre_cantidad desc LIMIT 1 INTO V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;
		
		IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
			
			INSERT INTO T_PREMIOS_WS VALUES (V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
		ELSE 
			
			select premio.categoria_id as categoria, concat('/',premio_url_imagen) fotoPremio, 
			premio.premio_id premio, premio.premio_nombre, premio.premio_descripcion, null inc, categoria.categoria_porcentaje_probabilidad pr 
			from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
			where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
			and ciclo.ciclo_id = ciclo_evento.ciclo_id
			and ciclo_evento_premio.premio_id = premio.premio_id
			and categoria.categoria_id = premio.categoria_id
			and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
			-- and ciclo.estado_id = 1
			-- and ciclo_evento_premio.estado_id = 1
			and premio.estado_id = 1 
			and categoria.estado_id = 1   
			and ciclo_evento_premio.ciclo_evento_premio_stock_disponible > ciclo_evento_premio.ciclo_evento_premio_stock_virtual
			and premio.categoria_id = V_CONTADOR_CATEGORIAS
			order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;

			IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
				INSERT INTO T_PREMIOS_WS VALUES (V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
			ELSE 
				
				select premio.categoria_id as categoria, concat('/',premio_url_imagen) fotoPremio, 
				premio.premio_id premio, premio.premio_nombre, premio.premio_descripcion, null inc, -1 pr 
				from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
				where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
				and ciclo.ciclo_id = ciclo_evento.ciclo_id
				and ciclo_evento_premio.premio_id = premio.premio_id
				and categoria.categoria_id = premio.categoria_id
				and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
				-- and ciclos.estado_id = 1
				-- and ciclo_premios.estado_id = 1
				and premio.estado_id = 1 
				and categoria.estado_id = 1 
				and premio.categoria_id = V_CONTADOR_CATEGORIAS
				order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;
				INSERT INTO T_PREMIOS_WS VALUES (V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
			END IF;    
		END IF;
    ELSE 
		
		select premio.categoria_id as categoria, concat('/',premio_url_imagen) fotoPremio, 
		premio.premio_id premio, premio.premio_nombre, premio.premio_descripcion, null inc, categoria.categoria_porcentaje_probabilidad pr 
		from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
		where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
		and ciclo.ciclo_id = ciclo_evento.ciclo_id
		and ciclo_evento_premio.premio_id = premio.premio_id
		and categoria.categoria_id = premio.categoria_id
		and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
		-- and ciclo.estado_id = 1
		-- and ciclo_evento_premio.estado_id = 1
		and premio.estado_id = 1 
		and categoria.estado_id = 1   
		and ciclo_evento_premio.ciclo_evento_premio_stock_disponible > ciclo_evento_premio.ciclo_evento_premio_stock_virtual
		and premio.categoria_id = V_CONTADOR_CATEGORIAS
		order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;
		IF V_CATEGORIA > 0 AND V_CATEGORIA < 7 THEN
			INSERT INTO T_PREMIOS_WS VALUES (V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
		ELSE 
			
			select premio.categoria_id as categoria, concat('/',premio_url_imagen) fotoPremio, 
			premio.premio_id premio, premio.premio_nombre, premio.premio_descripcion, null inc, -1 pr 
			from ciclo, premio, ciclo_evento_premio, ciclo_evento, categoria
			where curdate() between ciclo_fecha_inicio and ciclo_fecha_fin 
			and ciclo.ciclo_id = ciclo_evento.ciclo_id
			and ciclo_evento_premio.premio_id = premio.premio_id
			and categoria.categoria_id = premio.categoria_id
			and ciclo_evento.ciclo_evento_id = ciclo_evento_premio.ciclo_evento_id
			-- and ciclos.estado_id = 1
			-- and ciclo_premios.estado_id = 1
			and premio.estado_id = 1 
			and categoria.estado_id = 1 
			and premio.categoria_id = V_CONTADOR_CATEGORIAS
			order by ciclo_evento_premio.ciclo_evento_premio_stock_virtual desc LIMIT 1 INTO V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR;
			INSERT INTO T_PREMIOS_WS VALUES (V_CATEGORIA,V_FOTO_PREMIO,V_PREMIO,V_NOMBRE,V_DESCRIPCION,V_INC,V_PR);
		END IF; 
	END IF;
    set V_CATEGORIA = NULL;set V_FOTO_PREMIO = NULL;set V_PREMIO = NULL;set V_NOMBRE = NULL;set V_DESCRIPCION = NULL;set V_INC = NULL;SET V_PR = NULL;
    set V_CONTADOR_CATEGORIAS = V_CONTADOR_CATEGORIAS +1;
    
END WHILE;

	SELECT * FROM T_PREMIOS_WS;
    DROP TEMPORARY TABLE IF EXISTS T_PREMIOS_WS;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-18 19:17:38
