CREATE DATABASE IF NOT EXISTS `lista1_ex2`;
USE `lista1_ex2`;

-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: dev_mysql:3306
-- Tempo de geração: 19/04/2021 às 18:04
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
-- Banco de dados: `lista1_ex2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `comprador`
--

CREATE TABLE `comprador` (
  `cpf` varchar(11) NOT NULL,
  `estado_civil` varchar(32) NOT NULL,
  `conjuge_nome` varchar(256) NOT NULL,
  `conjuge_cpf` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `corretor`
--

CREATE TABLE `corretor` (
  `cpf` varchar(11) NOT NULL,
  `matricula` varchar(16) NOT NULL,
  `dt_emissao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `marca`
--

CREATE TABLE `marca` (
  `codigo` int NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `modelo`
--

CREATE TABLE `modelo` (
  `codigo` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `marca` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `placa_no` varchar(8) NOT NULL,
  `chassi` varchar(16) NOT NULL,
  `cor` varchar(32) NOT NULL,
  `ano` tinyint NOT NULL,
  `modelo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `venda`
--

CREATE TABLE `venda` (
  `compador_cpf` varchar(11) NOT NULL,
  `vendedor_cpf` varchar(11) NOT NULL,
  `placa_no` varchar(8) NOT NULL,
  `comissao` float NOT NULL,
  `valor` float NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `corretor`
--
ALTER TABLE `corretor`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `matricula` (`matricula`);

--
-- Índices de tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `marca` (`marca`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices de tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`placa_no`),
  ADD KEY `modelo` (`modelo`);

--
-- Índices de tabela `venda`
--
ALTER TABLE `venda`
  ADD KEY `compador_cpf` (`compador_cpf`),
  ADD KEY `vendedor_cpf` (`vendedor_cpf`),
  ADD KEY `placa_no` (`placa_no`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `marca`
--
ALTER TABLE `marca`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `modelo`
--
ALTER TABLE `modelo`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `comprador`
--
ALTER TABLE `comprador`
  ADD CONSTRAINT `comprador_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `corretor`
--
ALTER TABLE `corretor`
  ADD CONSTRAINT `corretor_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`marca`) REFERENCES `marca` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `veiculo`
--
ALTER TABLE `veiculo`
  ADD CONSTRAINT `veiculo_ibfk_1` FOREIGN KEY (`modelo`) REFERENCES `modelo` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `venda`
--
ALTER TABLE `venda`
  ADD CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`compador_cpf`) REFERENCES `comprador` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_ibfk_2` FOREIGN KEY (`vendedor_cpf`) REFERENCES `corretor` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `venda_ibfk_3` FOREIGN KEY (`placa_no`) REFERENCES `veiculo` (`placa_no`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
