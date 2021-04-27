-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 16-Abr-2021 às 19:53
-- Versão do servidor: 8.0.23
-- versão do PHP: 7.4.16

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
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `cpf` varchar(256) NOT NULL,
  `matricula_cod` int NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `participa`
--

CREATE TABLE `participa` (
  `funcionario` varchar(256) NOT NULL,
  `projeto` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE `projeto` (
  `sigla` varchar(256) NOT NULL,
  `nome` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `participa`
--
ALTER TABLE `participa`
  ADD KEY `funcionario_fk_idx` (`funcionario`),
  ADD KEY `projeto_fk_idx` (`projeto`);

--
-- Índices para tabela `projeto`
--
ALTER TABLE `projeto`
  ADD PRIMARY KEY (`sigla`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `participa`
--
ALTER TABLE `participa`
  ADD CONSTRAINT `funcionario_fk` FOREIGN KEY (`funcionario`) REFERENCES `funcionario` (`cpf`),
  ADD CONSTRAINT `projeto_fk` FOREIGN KEY (`projeto`) REFERENCES `projeto` (`sigla`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
