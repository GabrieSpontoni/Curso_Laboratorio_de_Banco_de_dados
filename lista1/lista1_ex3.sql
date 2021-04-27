-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 16-Abr-2021 às 19:58
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
-- Banco de dados: `lista1_ex3`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

CREATE TABLE `atividade` (
  `codigo` int NOT NULL,
  `descricao` varchar(256) NOT NULL,
  `max_participantes` int NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `instituicao`
--

CREATE TABLE `instituicao` (
  `codigo` int NOT NULL,
  `sigla` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `participante_id(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ministrante`
--

CREATE TABLE `ministrante` (
  `ministrante_id` int NOT NULL,
  `cpf(fk)` varchar(256) NOT NULL,
  `codigo(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `participante`
--

CREATE TABLE `participante` (
  `participante_id` int NOT NULL,
  `data_pagamento` date NOT NULL,
  `cpf(fk)` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `cpf` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `dt_nasc` date NOT NULL,
  `email` varchar(256) NOT NULL,
  `rua` varchar(256) NOT NULL,
  `numero` int NOT NULL,
  `complemento` varchar(256) NOT NULL,
  `bairo` varchar(256) NOT NULL,
  `cidade` varchar(256) NOT NULL,
  `uf` varchar(256) NOT NULL,
  `cep` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `realiza`
--

CREATE TABLE `realiza` (
  `codigo(fk)` int NOT NULL,
  `participante_id(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `telefone`
--

CREATE TABLE `telefone` (
  `cpf(fk)` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices para tabela `instituicao`
--
ALTER TABLE `instituicao`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `particpante_id(fk1)_idx` (`participante_id(fk)`);

--
-- Índices para tabela `ministrante`
--
ALTER TABLE `ministrante`
  ADD PRIMARY KEY (`ministrante_id`),
  ADD KEY `cpf(fk2)_idx` (`cpf(fk)`),
  ADD KEY `codigo(fk1)_idx` (`codigo(fk)`);

--
-- Índices para tabela `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`participante_id`),
  ADD KEY `cpf(fk3)_idx` (`cpf(fk)`);

--
-- Índices para tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`cpf`);

--
-- Índices para tabela `realiza`
--
ALTER TABLE `realiza`
  ADD PRIMARY KEY (`codigo(fk)`),
  ADD KEY `participante_id(fk2)_idx` (`participante_id(fk)`);

--
-- Índices para tabela `telefone`
--
ALTER TABLE `telefone`
  ADD PRIMARY KEY (`cpf(fk)`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `instituicao`
--
ALTER TABLE `instituicao`
  ADD CONSTRAINT `particpante_id(fk1)` FOREIGN KEY (`participante_id(fk)`) REFERENCES `participante` (`participante_id`);

--
-- Limitadores para a tabela `ministrante`
--
ALTER TABLE `ministrante`
  ADD CONSTRAINT `codigo(fk1)` FOREIGN KEY (`codigo(fk)`) REFERENCES `atividade` (`codigo`),
  ADD CONSTRAINT `cpf(fk2)` FOREIGN KEY (`cpf(fk)`) REFERENCES `pessoa` (`cpf`);

--
-- Limitadores para a tabela `participante`
--
ALTER TABLE `participante`
  ADD CONSTRAINT `cpf(fk3)` FOREIGN KEY (`cpf(fk)`) REFERENCES `pessoa` (`cpf`);

--
-- Limitadores para a tabela `realiza`
--
ALTER TABLE `realiza`
  ADD CONSTRAINT `codigo(fk2)` FOREIGN KEY (`codigo(fk)`) REFERENCES `atividade` (`codigo`),
  ADD CONSTRAINT `participante_id(fk2)` FOREIGN KEY (`participante_id(fk)`) REFERENCES `participante` (`participante_id`);

--
-- Limitadores para a tabela `telefone`
--
ALTER TABLE `telefone`
  ADD CONSTRAINT `cpf(fk1)` FOREIGN KEY (`cpf(fk)`) REFERENCES `pessoa` (`cpf`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
