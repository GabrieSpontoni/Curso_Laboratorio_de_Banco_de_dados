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
-- Banco de dados: `lista1_ex5`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `carrinho`
--

CREATE TABLE `carrinho` (
  `compra` int NOT NULL,
  `produto` int NOT NULL,
  `vlr_unit` float NOT NULL,
  `qtd` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `categoria`
--

CREATE TABLE `categoria` (
  `codigo` int NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int NOT NULL,
  `telefone` varchar(16) NOT NULL,
  `endereco` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `compra`
--

CREATE TABLE `compra` (
  `codigo` int NOT NULL,
  `loja` varchar(14) NOT NULL,
  `cliente` int NOT NULL,
  `dt_compra` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `loja`
--

CREATE TABLE `loja` (
  `cnpj` varchar(14) NOT NULL,
  `sigla` varchar(4) NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int NOT NULL,
  `nome` varchar(256) NOT NULL,
  `valor` float NOT NULL,
  `categoria` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `p_fisica`
--

CREATE TABLE `p_fisica` (
  `cpf` varchar(11) NOT NULL,
  `codigo` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `p_juridica`
--

CREATE TABLE `p_juridica` (
  `codigo` int NOT NULL,
  `cnpj` varchar(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `carrinho`
--
ALTER TABLE `carrinho`
  ADD KEY `compra` (`compra`),
  ADD KEY `produto` (`produto`);

--
-- Índices de tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `cliente` (`cliente`),
  ADD KEY `loja` (`loja`);

--
-- Índices de tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`cnpj`);

--
-- Índices de tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `categoria` (`categoria`);

--
-- Índices de tabela `p_fisica`
--
ALTER TABLE `p_fisica`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `codigo` (`codigo`);

--
-- Índices de tabela `p_juridica`
--
ALTER TABLE `p_juridica`
  ADD PRIMARY KEY (`cnpj`),
  ADD KEY `codigo` (`codigo`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `categoria`
--
ALTER TABLE `categoria`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `compra`
--
ALTER TABLE `compra`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `codigo` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `carrinho`
--
ALTER TABLE `carrinho`
  ADD CONSTRAINT `carrinho_ibfk_1` FOREIGN KEY (`compra`) REFERENCES `compra` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `carrinho_ibfk_2` FOREIGN KEY (`produto`) REFERENCES `produto` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `compra_ibfk_3` FOREIGN KEY (`loja`) REFERENCES `loja` (`cnpj`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`categoria`) REFERENCES `categoria` (`codigo`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `p_fisica`
--
ALTER TABLE `p_fisica`
  ADD CONSTRAINT `p_fisica_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Restrições para tabelas `p_juridica`
--
ALTER TABLE `p_juridica`
  ADD CONSTRAINT `p_juridica_ibfk_1` FOREIGN KEY (`codigo`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
