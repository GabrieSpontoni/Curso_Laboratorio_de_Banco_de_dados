-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: dev_mysql:3306
-- Tempo de geração: 19/04/2021 às 18:03
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
-- Banco de dados: `lista1_ex4`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `departamento`
--

CREATE TABLE `departamento` (
  `codigo` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `gerente` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `dependente`
--

CREATE TABLE `dependente` (
  `id` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `dt_nasc` date NOT NULL,
  `empregado` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `empregado`
--

CREATE TABLE `empregado` (
  `cpf` varchar(11) NOT NULL,
  `matricula` varchar(16) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `endereco` text NOT NULL,
  `email` varchar(256) NOT NULL,
  `departamento` int NOT NULL,
  `supervisor` varchar(11) NOT NULL,
  `vencimento` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vencimento`
--

CREATE TABLE `vencimento` (
  `descricao` varchar(64) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `gerente` (`gerente`);

--
-- Índices de tabela `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `empregado` (`empregado`);

--
-- Índices de tabela `empregado`
--
ALTER TABLE `empregado`
  ADD PRIMARY KEY (`cpf`),
  ADD UNIQUE KEY `matricula` (`matricula`),
  ADD KEY `departamento` (`departamento`),
  ADD KEY `supervisor` (`supervisor`),
  ADD KEY `vencimento` (`vencimento`);

--
-- Índices de tabela `vencimento`
--
ALTER TABLE `vencimento`
  ADD PRIMARY KEY (`descricao`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `departamento`
--
ALTER TABLE `departamento`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `dependente`
--
ALTER TABLE `dependente`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`gerente`) REFERENCES `empregado` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `dependente`
--
ALTER TABLE `dependente`
  ADD CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`empregado`) REFERENCES `empregado` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `empregado`
--
ALTER TABLE `empregado`
  ADD CONSTRAINT `empregado_ibfk_1` FOREIGN KEY (`departamento`) REFERENCES `departamento` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `empregado_ibfk_2` FOREIGN KEY (`supervisor`) REFERENCES `empregado` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `empregado_ibfk_3` FOREIGN KEY (`vencimento`) REFERENCES `vencimento` (`descricao`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
