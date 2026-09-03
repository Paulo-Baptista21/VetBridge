-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: vetbridge
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `vetbridge`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `vetbridge` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `vetbridge`;

--
-- Table structure for table `apresentacao_comercial`
--

DROP TABLE IF EXISTS `apresentacao_comercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `apresentacao_comercial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_comercial_id` int NOT NULL,
  `composicao` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ap_fk` (`nome_comercial_id`),
  CONSTRAINT `ap_fk` FOREIGN KEY (`nome_comercial_id`) REFERENCES `nome_comercial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `especie`
--

DROP TABLE IF EXISTS `especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_especie_nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_fabricante_nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nome_comercial`
--

DROP TABLE IF EXISTS `nome_comercial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nome_comercial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `fabricante_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nome_comercial_fabricante` (`nome`,`fabricante_id`),
  KEY `fk_nome_comercial_fabricante` (`fabricante_id`),
  CONSTRAINT `fk_nome_comercial_fabricante` FOREIGN KEY (`fabricante_id`) REFERENCES `fabricante` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nome_comercial_principio_ativo`
--

DROP TABLE IF EXISTS `nome_comercial_principio_ativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nome_comercial_principio_ativo` (
  `nome_comercial_id` int NOT NULL,
  `principio_ativo_id` int NOT NULL,
  PRIMARY KEY (`nome_comercial_id`,`principio_ativo_id`),
  KEY `fk_ncpa_principio_ativo` (`principio_ativo_id`),
  CONSTRAINT `fk_ncpa_nome_comercial` FOREIGN KEY (`nome_comercial_id`) REFERENCES `nome_comercial` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_ncpa_principio_ativo` FOREIGN KEY (`principio_ativo_id`) REFERENCES `principio_ativo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `principio_ativo`
--

DROP TABLE IF EXISTS `principio_ativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `principio_ativo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `classe_terapeutica` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `regime_posologico`
--

DROP TABLE IF EXISTS `regime_posologico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regime_posologico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uso_farmacologico_id` int NOT NULL,
  `indicacao` varchar(255) NOT NULL,
  `dose_mg_por_kg` decimal(10,4) NOT NULL,
  `via_administracao` varchar(100) NOT NULL,
  `intervalo` varchar(100) NOT NULL,
  `posologia` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_regime_uso_farmacologico` (`uso_farmacologico_id`),
  CONSTRAINT `fk_regime_uso_farmacologico` FOREIGN KEY (`uso_farmacologico_id`) REFERENCES `uso_farmacologico` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ck_regime_dose_positiva` CHECK ((`dose_mg_por_kg` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sinal_clinico`
--

DROP TABLE IF EXISTS `sinal_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinal_clinico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nome` (`nome`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sinal_clinico_principio_ativo`
--

DROP TABLE IF EXISTS `sinal_clinico_principio_ativo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinal_clinico_principio_ativo` (
  `sinal_clinico_id` int NOT NULL,
  `principio_ativo_id` int NOT NULL,
  PRIMARY KEY (`sinal_clinico_id`,`principio_ativo_id`),
  KEY `principio_ativo_id` (`principio_ativo_id`),
  CONSTRAINT `sinal_clinico_principio_ativo_ibfk_1` FOREIGN KEY (`sinal_clinico_id`) REFERENCES `sinal_clinico` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sinal_clinico_principio_ativo_ibfk_2` FOREIGN KEY (`principio_ativo_id`) REFERENCES `principio_ativo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `uso_farmacologico`
--

DROP TABLE IF EXISTS `uso_farmacologico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uso_farmacologico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `apresentacao_comercial_id` int NOT NULL,
  `especie_id` int NOT NULL,
  `contraindicacoes` text,
  `advertencias` text,
  `reacoes_adversas` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_uso_apresentacao_especie` (`apresentacao_comercial_id`,`especie_id`),
  KEY `fk_uso_especie` (`especie_id`),
  CONSTRAINT `fk_uso_apresentacao` FOREIGN KEY (`apresentacao_comercial_id`) REFERENCES `apresentacao_comercial` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_uso_especie` FOREIGN KEY (`especie_id`) REFERENCES `especie` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping events for database 'vetbridge'
--

--
-- Dumping routines for database 'vetbridge'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-03 15:09:38
