-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 14-Set-2020 às 04:30
-- Versão do servidor: 10.4.14-MariaDB
-- versão do PHP: 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aulajava`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cpfCnpj` varchar(45) NOT NULL,
  `quantidadePedidos` int(11) DEFAULT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `dataNascAbertura` date NOT NULL,
  `tipo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `cliente`
--

INSERT INTO `cliente` (`idCliente`, `nome`, `cpfCnpj`, `quantidadePedidos`, `endereco`, `dataNascAbertura`, `tipo`) VALUES
(1, 'Josevaldo', '068.120.911-97', 10, 'Qr 210 ', '1998-09-01', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrega`
--

CREATE TABLE `entrega` (
  `idEntrega` int(11) NOT NULL,
  `idEntregador` int(11) NOT NULL,
  `tipoEntrega` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `entrega`
--

INSERT INTO `entrega` (`idEntrega`, `idEntregador`, `tipoEntrega`) VALUES
(4, 1, '1');

-- --------------------------------------------------------

--
-- Estrutura da tabela `entregador`
--

CREATE TABLE `entregador` (
  `idEntregador` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `entregador`
--

INSERT INTO `entregador` (`idEntregador`, `nome`) VALUES
(1, 'Josevalda');

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

CREATE TABLE `menu` (
  `idmenu` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `link` varchar(100) NOT NULL,
  `icone` varchar(45) DEFAULT NULL,
  `exibir` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idmenu`, `nome`, `link`, `icone`, `exibir`) VALUES
(1, 'Inicio', 'index.jsp', '', 1),
(2, 'Perfis', 'listar_perfil.jsp', '', 1),
(3, 'Menus', 'listar_menu.jsp', '', 1),
(4, 'Cadastrar Perfil', 'form_perfil.jsp', '', 2),
(5, 'Alterar Perfil', 'gerenciar_perfil.do?acao=alterar', NULL, 2),
(6, 'Deletar Perfil', 'gerenciar_perfil.do?acao=deletar', NULL, 2),
(7, 'Acessos', 'gerenciar_menu_perfil.do?acao=gerenciar', NULL, 2),
(8, 'Formulario Menu Perfil', 'form_menu_perfil.jsp', NULL, 2),
(9, 'Formulario Menu', 'form_menu.jsp', NULL, 2),
(10, 'Alterar Menu', 'gerenciar_menu.do?acao=alterar', NULL, 2),
(11, 'Usuario', 'listar_usuario.jsp', '', 1),
(12, 'Formulario Usuario', 'form_usuario.jsp', '', 2),
(16, 'Cliente', 'listar_cliente.jsp', '', 1),
(17, 'Alterar Cliente', 'gerenciar_cliente.do?acao=alterar', '', 2),
(18, 'Deletar Cliente', 'gerenciar_cliente.do?acao=deletar', '', 2),
(19, 'Formulario Cliente', 'form_cliente.jsp', '', 2),
(20, 'Entrega', 'listar_entrega.jsp', '', 1),
(21, 'Cadastrar Entrega', 'form_entrega.jsp', '', 2),
(22, 'Alterar Entrega', 'gerenciar_entrega.do?acao=alterar', '', 2),
(23, 'Deletar Entrega', 'gerenciar_entrega.do?acao=deletar', '', 2),
(24, 'Entregador', 'listar_entregador.jsp', '', 1),
(25, 'Alterar Entregador', 'gerenciar_entregador.do?acao=alterar', '', 2),
(26, 'Deletar Entregador', 'gerenciar_entregador.do?acao=deletar', '', 2),
(27, 'Cadastrar Entregador', 'form_entregador.jsp', '', 2),
(28, 'Produtos', 'listar_produto.jsp', '', 1),
(29, 'Cadastrar Produto', 'form_produto.jsp', '', 2),
(30, 'Alterar Produto', 'gerenciar_produto.do?acao=alterar', '', 2),
(31, 'Deletar Produto', 'gerenciar_produto.do?acao=deletar', '', 2),
(32, 'Alterar Usuario', 'gerenciar_usuario.do?acao=alterar', '', 2),
(33, 'Desativar Usuario', 'gerenciar_usuario.do?acao=deletar', '', 2),
(34, 'Pedidos', 'listar_pedido.jsp', '', 1),
(35, 'Alterar Pedido', 'gerenciar_pedido?acao=alterar', '', 2),
(36, 'Deletar Pedido', 'gerenciar_pedido?acao=deletar', '', 2),
(37, 'Cadastrar Pedido 1', 'form_pedido.jsp', '', 2),
(38, 'Cadastrar Pedido 2', 'form_pedido.jsp?acao=c', '', 2),
(39, 'Cadastrar Pedido 3', 'form_pedido.jsp?acao=novo', '', 2),
(40, 'Finalizar Pedido JSP', 'form_finalizar_pedido.jsp', '', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

CREATE TABLE `menu_perfil` (
  `idmenu` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`idmenu`, `idperfil`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido`
--

CREATE TABLE `pedido` (
  `idPedido` int(11) NOT NULL,
  `data` date DEFAULT NULL,
  `horario` date DEFAULT NULL,
  `formaPagamento` varchar(45) NOT NULL,
  `total` double NOT NULL,
  `status` int(11) NOT NULL,
  `tipoPedido` varchar(45) NOT NULL,
  `idEntrega` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedido_produto`
--

CREATE TABLE `pedido_produto` (
  `idPedido` int(11) NOT NULL,
  `idProduto` int(11) NOT NULL,
  `qtdVendida` int(11) NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE `perfil` (
  `idperfil` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idperfil`, `nome`) VALUES
(1, 'Administrador'),
(2, 'Gerente'),
(3, 'Atendente');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `descricao` varchar(45) DEFAULT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `produto`
--

INSERT INTO `produto` (`idProduto`, `descricao`, `quantidade`, `valor`) VALUES
(1, 'Hamburguer Artesanal', 10, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `idperfil` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nome`, `login`, `senha`, `status`, `idperfil`) VALUES
(1, 'Lucas', 'Lucas', '123', 1, 1),
(2, 'Fabio', 'fabio', '123', 1, 2),
(3, 'Arthur', 'arthur123', '123', 2, 3);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Índices para tabela `entrega`
--
ALTER TABLE `entrega`
  ADD PRIMARY KEY (`idEntrega`),
  ADD KEY `fk_entrega_entregador1_idx` (`idEntregador`);

--
-- Índices para tabela `entregador`
--
ALTER TABLE `entregador`
  ADD PRIMARY KEY (`idEntregador`);

--
-- Índices para tabela `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`idmenu`);

--
-- Índices para tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD PRIMARY KEY (`idmenu`,`idperfil`),
  ADD KEY `fk_menu_has_perfil_perfil1_idx` (`idperfil`),
  ADD KEY `fk_menu_has_perfil_menu_idx` (`idmenu`);

--
-- Índices para tabela `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `fk_pedido_entrega1_idx` (`idEntrega`),
  ADD KEY `fk_pedido_usuario1_idx` (`idUsuario`),
  ADD KEY `fk_pedido_cliente1_idx` (`idCliente`);

--
-- Índices para tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD PRIMARY KEY (`idPedido`,`idProduto`),
  ADD KEY `fk_pedido_has_produto_produto1_idx` (`idProduto`),
  ADD KEY `fk_pedido_has_produto_pedido1_idx` (`idPedido`);

--
-- Índices para tabela `perfil`
--
ALTER TABLE `perfil`
  ADD PRIMARY KEY (`idperfil`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Índices para tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`),
  ADD KEY `fk_usuario_perfil1_idx` (`idperfil`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entrega`
--
ALTER TABLE `entrega`
  MODIFY `idEntrega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `entregador`
--
ALTER TABLE `entregador`
  MODIFY `idEntregador` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `menu`
--
ALTER TABLE `menu`
  MODIFY `idmenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `pedido`
--
ALTER TABLE `pedido`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `perfil`
--
ALTER TABLE `perfil`
  MODIFY `idperfil` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de tabela `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `entrega`
--
ALTER TABLE `entrega`
  ADD CONSTRAINT `fk_entrega_entregador1` FOREIGN KEY (`idEntregador`) REFERENCES `entregador` (`idEntregador`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_menu_has_perfil_menu` FOREIGN KEY (`idmenu`) REFERENCES `menu` (`idmenu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_menu_has_perfil_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `fk_pedido_cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_entrega1` FOREIGN KEY (`idEntrega`) REFERENCES `entrega` (`idEntrega`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idusuario`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pedido_produto`
--
ALTER TABLE `pedido_produto`
  ADD CONSTRAINT `fk_pedido_has_produto_pedido1` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedido_has_produto_produto1` FOREIGN KEY (`idProduto`) REFERENCES `produto` (`idProduto`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`idperfil`) REFERENCES `perfil` (`idperfil`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
