CREATE DATABASE IF NOT EXISTS `lista1_ex1`;
USE `lista1_ex1`;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: dev_mysql:3306
-- Tempo de geração: 19/04/2021 às 02:36
-- Versão do servidor: 8.0.23
-- Versão do PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lista1_ex1`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `cpf` varchar(11) NOT NULL,
  `matricula` varchar(16) NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos`
--

CREATE TABLE `projetos` (
  `sigla` varchar(8) NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `trabalha`
--

CREATE TABLE `trabalha` (
  `sigla` varchar(8) NOT NULL,
  `cpf` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`sigla`);

--
-- Índices de tabela `trabalha`
--
ALTER TABLE `trabalha`
  ADD KEY `cpf` (`cpf`),
  ADD KEY `sigla` (`sigla`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `trabalha`
--
ALTER TABLE `trabalha`
  ADD CONSTRAINT `trabalha_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `funcionarios` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `trabalha_ibfk_2` FOREIGN KEY (`sigla`) REFERENCES `projetos` (`sigla`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
