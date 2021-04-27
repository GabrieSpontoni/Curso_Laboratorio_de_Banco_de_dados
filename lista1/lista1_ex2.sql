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
-- Banco de dados: `lista1_ex2`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `comprador`
--

CREATE TABLE `comprador` (
  `comprador_cpf` varchar(256) NOT NULL,
  `comprador_nome` varchar(256) NOT NULL,
  `comprador_estado_civil` varchar(256) NOT NULL,
  `comprador_conjuge` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `conjuge`
--

CREATE TABLE `conjuge` (
  `comprador_cpf(fk)` varchar(256) NOT NULL,
  `nome_conjuge` varchar(256) NOT NULL,
  `cpf_conjuge` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `corretor`
--

CREATE TABLE `corretor` (
  `corretor_num` int NOT NULL,
  `corretor_nome` varchar(256) NOT NULL,
  `corretor_dt_adm` date NOT NULL,
  `comprador_cpf(fk)` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marca`
--

CREATE TABLE `marca` (
  `marca_cod` int NOT NULL,
  `marca_nome` varchar(256) NOT NULL,
  `modelo_cod(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `modelo`
--

CREATE TABLE `modelo` (
  `modelo_cod` int NOT NULL,
  `modelo_nome` varchar(256) NOT NULL,
  `num_chassi(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veiculo`
--

CREATE TABLE `veiculo` (
  `num_chassi` int NOT NULL,
  `num_placa` varchar(256) NOT NULL,
  `cor` varchar(256) NOT NULL,
  `ano_fab` date NOT NULL,
  `quilometragem` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `vende`
--

CREATE TABLE `vende` (
  `data_venda` date NOT NULL,
  `valor_comi` float NOT NULL,
  `num_chassi(fk)` int NOT NULL,
  `corretor_num(fk)` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `comprador`
--
ALTER TABLE `comprador`
  ADD PRIMARY KEY (`comprador_cpf`);

--
-- Índices para tabela `conjuge`
--
ALTER TABLE `conjuge`
  ADD KEY `comprador_cpf(fk)_idx` (`comprador_cpf(fk)`),
  ADD KEY `comprador_cpf(fk2)_idx` (`comprador_cpf(fk)`);

--
-- Índices para tabela `corretor`
--
ALTER TABLE `corretor`
  ADD PRIMARY KEY (`corretor_num`),
  ADD KEY `comprador_cpf(fk)_idx` (`comprador_cpf(fk)`);

--
-- Índices para tabela `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`marca_cod`),
  ADD KEY `modelo_cod(fk)_idx` (`modelo_cod(fk)`);

--
-- Índices para tabela `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`modelo_cod`),
  ADD KEY `num_chassi(fk)_idx` (`num_chassi(fk)`);

--
-- Índices para tabela `veiculo`
--
ALTER TABLE `veiculo`
  ADD PRIMARY KEY (`num_chassi`);

--
-- Índices para tabela `vende`
--
ALTER TABLE `vende`
  ADD KEY `num_chassi(fk2)_idx` (`corretor_num(fk)`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `conjuge`
--
ALTER TABLE `conjuge`
  ADD CONSTRAINT `comprador_cpf(fk2)` FOREIGN KEY (`comprador_cpf(fk)`) REFERENCES `comprador` (`comprador_cpf`);

--
-- Limitadores para a tabela `corretor`
--
ALTER TABLE `corretor`
  ADD CONSTRAINT `comprador_cpf(fk)` FOREIGN KEY (`comprador_cpf(fk)`) REFERENCES `comprador` (`comprador_cpf`);

--
-- Limitadores para a tabela `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `modelo_cod(fk)` FOREIGN KEY (`modelo_cod(fk)`) REFERENCES `modelo` (`modelo_cod`);

--
-- Limitadores para a tabela `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `num_chassi(fk)` FOREIGN KEY (`num_chassi(fk)`) REFERENCES `veiculo` (`num_chassi`);

--
-- Limitadores para a tabela `vende`
--
ALTER TABLE `vende`
  ADD CONSTRAINT `corretor_num(fk)` FOREIGN KEY (`corretor_num(fk)`) REFERENCES `corretor` (`corretor_num`),
  ADD CONSTRAINT `num_chassi(fk2)` FOREIGN KEY (`corretor_num(fk)`) REFERENCES `veiculo` (`num_chassi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
