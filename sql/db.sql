-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 04-Maio-2022 às 02:04
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2fafa

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `db`
--

CREATE DATABASE IF NOT EXISTS `database`;

USE `database`;

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `nome` varchar(50) NOT NULL,
  `tipo_user` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `reg_data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE IF NOT EXISTS `estoque` (
  `id` int(10) UNSIGNED AUTO_INCREMENT NOT NULL,
  `item` varchar(100) NOT NULL,
  `distribuidora` varchar(255) NOT NULL,
  `quantidade` varchar(255) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET = utf8mb4;

INSERT INTO `users` (`id`, `nome`, `tipo_user`, `mail`, `senha`, `reg_data`) VALUES
(6, 'Teste', 'user', 'teste@teste.com', '698dc19d489c4e4db73e28a713eab07b', '2022-05-03 23:02:44');


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
