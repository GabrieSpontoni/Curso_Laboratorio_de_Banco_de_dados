-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Tempo de geração: 16-Abr-2021 às 19:59
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
-- Banco de dados: `lista1_ex4`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `departamento`
--

CREATE TABLE `departamento` (
  `codigo` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `matricula(fk)` int NOT NULL,
  `gerencia_codigo(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `dependente`
--

CREATE TABLE `dependente` (
  `id` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `dt_nasc` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `empregado`
--

CREATE TABLE `empregado` (
  `matricula` int NOT NULL,
  `cpf` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `endereco` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `telefone` varchar(18) NOT NULL,
  `serpervisiona_matricula(fk)` int NOT NULL,
  `id(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vencimentos`
--

CREATE TABLE `vencimentos` (
  `matricula(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `matricula(fk1)_idx` (`matricula(fk)`),
  ADD KEY `gerencia_codigo(fk1)_idx` (`gerencia_codigo(fk)`);

--
-- Índices para tabela `dependente`
--
ALTER TABLE `dependente`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `empregado`
--
ALTER TABLE `empregado`
  ADD PRIMARY KEY (`matricula`),
  ADD KEY `supervisiona(fk1)_idx` (`serpervisiona_matricula(fk)`),
  ADD KEY `id(fk1)_idx` (`id(fk)`);

--
-- Índices para tabela `vencimentos`
--
ALTER TABLE `vencimentos`
  ADD KEY `matricula(fk2)_idx` (`matricula(fk)`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `gerencia_codigo(fk1)` FOREIGN KEY (`gerencia_codigo(fk)`) REFERENCES `departamento` (`codigo`),
  ADD CONSTRAINT `matricula(fk1)` FOREIGN KEY (`matricula(fk)`) REFERENCES `empregado` (`matricula`);

--
-- Limitadores para a tabela `empregado`
--
ALTER TABLE `empregado`
  ADD CONSTRAINT `id(fk1)` FOREIGN KEY (`id(fk)`) REFERENCES `dependente` (`id`),
  ADD CONSTRAINT `supervisiona(fk1)` FOREIGN KEY (`serpervisiona_matricula(fk)`) REFERENCES `empregado` (`matricula`);

--
-- Limitadores para a tabela `vencimentos`
--
ALTER TABLE `vencimentos`
  ADD CONSTRAINT `matricula(fk2)` FOREIGN KEY (`matricula(fk)`) REFERENCES `empregado` (`matricula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
