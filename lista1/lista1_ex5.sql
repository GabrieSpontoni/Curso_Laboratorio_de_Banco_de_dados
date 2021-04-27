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
-- Banco de dados: `lista1_ex5`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cadastra`
--

CREATE TABLE `cadastra` (
  `cliente_id(fk)` int NOT NULL,
  `loja_cnpj(fk)` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int NOT NULL,
  `nome_categoria` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int NOT NULL,
  `telefone` varchar(18) NOT NULL,
  `nome` varchar(256) NOT NULL,
  `endereco` varchar(256) NOT NULL,
  `id_compra(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `compra_cliente`
--

CREATE TABLE `compra_cliente` (
  `id_compra` int NOT NULL,
  `loja_cnpj(fk)` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `fisico`
--

CREATE TABLE `fisico` (
  `cpf` varchar(256) NOT NULL,
  `cliente_id(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `item`
--

CREATE TABLE `item` (
  `info_produto` varchar(256) NOT NULL,
  `quant_produto` varchar(256) NOT NULL,
  `valor_uni_produto` float NOT NULL,
  `id_compra(fk)` int NOT NULL,
  `codido(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `juridico`
--

CREATE TABLE `juridico` (
  `cliente_cnpj` varchar(256) NOT NULL,
  `cliente_id(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `loja`
--

CREATE TABLE `loja` (
  `loja_cnpj` varchar(256) NOT NULL,
  `sigla` varchar(256) NOT NULL,
  `nome` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `codigo` int NOT NULL,
  `nome_produto` varchar(256) NOT NULL,
  `valor_produto` float NOT NULL,
  `categoria_id(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cadastra`
--
ALTER TABLE `cadastra`
  ADD KEY `cliente_id(fk3)_idx` (`cliente_id(fk)`),
  ADD KEY `loja_cnpj(fk2) _idx` (`loja_cnpj(fk)`);

--
-- Índices para tabela `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`),
  ADD KEY `id_compra(fk1) _idx` (`id_compra(fk)`);

--
-- Índices para tabela `compra_cliente`
--
ALTER TABLE `compra_cliente`
  ADD PRIMARY KEY (`id_compra`),
  ADD KEY `loja_cnpj(fk1)_idx` (`loja_cnpj(fk)`);

--
-- Índices para tabela `fisico`
--
ALTER TABLE `fisico`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `cliente_id(fk1)_idx` (`cliente_id(fk)`);

--
-- Índices para tabela `item`
--
ALTER TABLE `item`
  ADD KEY `id_compra(fk2)_idx` (`id_compra(fk)`),
  ADD KEY `codigo(fk1) _idx` (`codido(fk)`);

--
-- Índices para tabela `juridico`
--
ALTER TABLE `juridico`
  ADD PRIMARY KEY (`cliente_cnpj`),
  ADD KEY `cliente_id(fk2)_idx` (`cliente_id(fk)`);

--
-- Índices para tabela `loja`
--
ALTER TABLE `loja`
  ADD PRIMARY KEY (`loja_cnpj`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `categoria_id(fk1)_idx` (`categoria_id(fk)`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `cadastra`
--
ALTER TABLE `cadastra`
  ADD CONSTRAINT `cliente_id(fk3)` FOREIGN KEY (`cliente_id(fk)`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `loja_cnpj(fk2) ` FOREIGN KEY (`loja_cnpj(fk)`) REFERENCES `loja` (`loja_cnpj`);

--
-- Limitadores para a tabela `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `id_compra(fk1) ` FOREIGN KEY (`id_compra(fk)`) REFERENCES `compra_cliente` (`id_compra`);

--
-- Limitadores para a tabela `compra_cliente`
--
ALTER TABLE `compra_cliente`
  ADD CONSTRAINT `loja_cnpj(fk1)` FOREIGN KEY (`loja_cnpj(fk)`) REFERENCES `loja` (`loja_cnpj`);

--
-- Limitadores para a tabela `fisico`
--
ALTER TABLE `fisico`
  ADD CONSTRAINT `cliente_id(fk1)` FOREIGN KEY (`cliente_id(fk)`) REFERENCES `cliente` (`cliente_id`);

--
-- Limitadores para a tabela `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `codigo(fk1) ` FOREIGN KEY (`codido(fk)`) REFERENCES `produto` (`codigo`),
  ADD CONSTRAINT `id_compra(fk2)` FOREIGN KEY (`id_compra(fk)`) REFERENCES `compra_cliente` (`id_compra`);

--
-- Limitadores para a tabela `juridico`
--
ALTER TABLE `juridico`
  ADD CONSTRAINT `cliente_id(fk2)` FOREIGN KEY (`cliente_id(fk)`) REFERENCES `cliente` (`cliente_id`);

--
-- Limitadores para a tabela `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `categoria_id(fk1)` FOREIGN KEY (`categoria_id(fk)`) REFERENCES `categoria` (`categoria_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
