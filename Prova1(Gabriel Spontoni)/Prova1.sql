-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 21-Abr-2021 às 02:11
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
-- Banco de dados: `Prova1`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `congressista`
--

CREATE TABLE `congressista` (
  `id_congressista` int NOT NULL,
  `partido_pertencente` varchar(256) NOT NULL,
  `data_inicio` date NOT NULL,
  `estado_representado` varchar(256) NOT NULL,
  `nome_congressista` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `estado_brasil`
--

CREATE TABLE `estado_brasil` (
  `regiao` varchar(45) NOT NULL,
  `nome_estado` varchar(256) NOT NULL,
  `id_congressista(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `partido_politico`
--

CREATE TABLE `partido_politico` (
  `nome_partido` varchar(256) NOT NULL,
  `classificacao` varchar(45) NOT NULL,
  `id_congressista(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_de_lei`
--

CREATE TABLE `projeto_de_lei` (
  `id_projeto_de_lei` int NOT NULL,
  `preponente` varchar(256) NOT NULL,
  `passou_ou_nao` tinyint NOT NULL,
  `data_votacao` date NOT NULL,
  `nome_proposta` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `propoe`
--

CREATE TABLE `propoe` (
  `id_congressista(fk)` int NOT NULL,
  `id_projeto_de_lei(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vota`
--

CREATE TABLE `vota` (
  `voto_congressista` varchar(45) NOT NULL,
  `id_congressista(fk)` int NOT NULL,
  `id_projeto_de_lei (fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `congressista`
--
ALTER TABLE `congressista`
  ADD PRIMARY KEY (`id_congressista`);

--
-- Índices para tabela `estado_brasil`
--
ALTER TABLE `estado_brasil`
  ADD PRIMARY KEY (`id_congressista(fk)`);

--
-- Índices para tabela `partido_politico`
--
ALTER TABLE `partido_politico`
  ADD PRIMARY KEY (`id_congressista(fk)`);

--
-- Índices para tabela `projeto_de_lei`
--
ALTER TABLE `projeto_de_lei`
  ADD PRIMARY KEY (`id_projeto_de_lei`);

--
-- Índices para tabela `propoe`
--
ALTER TABLE `propoe`
  ADD PRIMARY KEY (`id_congressista(fk)`,`id_projeto_de_lei(fk)`),
  ADD KEY `id_projeto_de_lei (fk1)_idx` (`id_projeto_de_lei(fk)`);

--
-- Índices para tabela `vota`
--
ALTER TABLE `vota`
  ADD PRIMARY KEY (`id_congressista(fk)`,`id_projeto_de_lei (fk)`),
  ADD KEY `id_projeto_de_lei (fk2)_idx` (`id_projeto_de_lei (fk)`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `estado_brasil`
--
ALTER TABLE `estado_brasil`
  ADD CONSTRAINT `id_congressista(fk2)` FOREIGN KEY (`id_congressista(fk)`) REFERENCES `congressista` (`id_congressista`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `partido_politico`
--
ALTER TABLE `partido_politico`
  ADD CONSTRAINT `id_congressista(fk1)` FOREIGN KEY (`id_congressista(fk)`) REFERENCES `congressista` (`id_congressista`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `propoe`
--
ALTER TABLE `propoe`
  ADD CONSTRAINT `id_congressista(fk3)` FOREIGN KEY (`id_congressista(fk)`) REFERENCES `congressista` (`id_congressista`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_projeto_de_lei (fk1)` FOREIGN KEY (`id_projeto_de_lei(fk)`) REFERENCES `projeto_de_lei` (`id_projeto_de_lei`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `vota`
--
ALTER TABLE `vota`
  ADD CONSTRAINT `id_congressista(fk4)` FOREIGN KEY (`id_congressista(fk)`) REFERENCES `congressista` (`id_congressista`) ON UPDATE CASCADE,
  ADD CONSTRAINT `id_projeto_de_lei (fk2)` FOREIGN KEY (`id_projeto_de_lei (fk)`) REFERENCES `projeto_de_lei` (`id_projeto_de_lei`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
