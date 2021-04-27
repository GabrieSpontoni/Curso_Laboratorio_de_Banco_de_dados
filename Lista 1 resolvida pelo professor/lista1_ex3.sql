-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: dev_mysql:3306
-- Tempo de geração: 19/04/2021 às 17:47
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
-- Banco de dados: `lista1_ex3`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `atividade`
--

CREATE TABLE `atividade` (
  `codigo` int NOT NULL,
  `ministrante` varchar(11) NOT NULL,
  `descricao` text NOT NULL,
  `qtd_max_participantes` int NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `instituicao`
--

CREATE TABLE `instituicao` (
  `codigo` int NOT NULL,
  `sigla` int NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `participar`
--

CREATE TABLE `participar` (
  `cpf` varchar(11) NOT NULL,
  `atividade` int NOT NULL,
  `dt_pgto` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `dt_nasc` date NOT NULL,
  `email` varchar(256) NOT NULL,
  `instituicao` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `telefone`
--

CREATE TABLE `telefone` (
  `numero_tel` varchar(32) NOT NULL,
  `cpf` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `ministrante` (`ministrante`);

--
-- Índices de tabela `instituicao`
--
ALTER TABLE `instituicao`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `participar`
--
ALTER TABLE `participar`
  ADD KEY `atividade` (`atividade`),
  ADD KEY `cpf` (`cpf`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `instituicao` (`instituicao`);

--
-- Índices de tabela `telefone`
--
ALTER TABLE `telefone`
  ADD UNIQUE KEY `numero_tel` (`numero_tel`),
  ADD KEY `cpf` (`cpf`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `atividade`
--
ALTER TABLE `atividade`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `instituicao`
--
ALTER TABLE `instituicao`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `atividade_ibfk_1` FOREIGN KEY (`ministrante`) REFERENCES `pessoa` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `participar`
--
ALTER TABLE `participar`
  ADD CONSTRAINT `participar_ibfk_1` FOREIGN KEY (`atividade`) REFERENCES `atividade` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `participar_ibfk_2` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`instituicao`) REFERENCES `instituicao` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `telefone_ibfk_1` FOREIGN KEY (`cpf`) REFERENCES `pessoa` (`cpf`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
