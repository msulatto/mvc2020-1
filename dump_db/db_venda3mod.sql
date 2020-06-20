

-- Copiando estrutura para procedure db3paulo.sp_d_categoria
DELIMITER //
CREATE PROCEDURE `sp_d_categoria`(IN `in_id` INT)
    NO SQL
BEGIN
	DECLARE existe INT;
	SET existe = (SELECT COUNT(id_cat) FROM tb_produto WHERE id_cat = in_id);
	
	if(existe = 0) THEN 
		DELETE FROM tb_categoria WHERE id_cat = in_id;
		SELECT "1" RETORNO, "CATEGORIA DELETADA" MSG;
	ELSE 
		SELECT "0" RETORNO, "NÃO FOI POSSÍVEL DELETAR, PRODUTOS RELACIONADOS." MSG;
	END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure db3paulo.sp_d_pessoa
DELIMITER //
CREATE PROCEDURE `sp_d_pessoa`(IN `in_id` INT)
    NO SQL
BEGIN
	DECLARE existe INT;
		SET existe = (SELECT COUNT(id_pessoa) FROM tb_pessoa WHERE id_pessoa = in_id);
		IF(existe = 0) THEN
			SELECT "0" RETORNO, "PESSOA INEXISTENTE" MSG;
		ELSE 
			DELETE FROM tb_pessoa WHERE id_pessoa = in_id;
			SELECT "1" RETORNO, "PESSOA DELETADA!" MSG;
	END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure db3paulo.sp_d_produto
DELIMITER //
CREATE PROCEDURE `sp_d_produto`(IN `in_id` INT)
    NO SQL
BEGIN
	DECLARE existe INT;
		SET existe = (SELECT COUNT(id_produto) FROM tb_produto WHERE id_produto = in_id);
		IF(existe = 0) THEN
			SELECT "0" RETORNO, "PRODUTO INEXISTENTE" MSG;
		ELSE 
			DELETE FROM tb_produto WHERE id_produto = in_id;
			SELECT "1" RETORNO, "PRODUTO DELETADO!" MSG;
	END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure db3paulo.sp_i_categoria
DELIMITER //
CREATE PROCEDURE `sp_i_categoria`(IN `in_nome` VARCHAR(60), IN `in_status` VARCHAR(60))
    NO SQL
BEGIN
	DECLARE existe INT;
	SET existe = (SELECT COUNT(nome) FROM tb_categoria WHERE nome = in_nome);
	
	if(existe <> 0) THEN 
		SELECT "0" RETORNO, "CATEGORIA JÁ EXISTE" MSG;
	ELSE 
		INSERT INTO tb_categoria(nome, status)
		VALUES (in_nome, in_status);
		SELECT "1" RETORNO, "CADASTRADO COM SUCESSO" MSG;
	END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure db3paulo.sp_i_pessoa
DELIMITER //
CREATE PROCEDURE `sp_i_pessoa`(IN `in_nome` VARCHAR(60), IN `in_cpf` INT(60), IN `in_endereco` VARCHAR(60), IN `in_bairro` VARCHAR(60), IN `in_cidade` VARCHAR(60), IN `in_estado` VARCHAR(2), IN `in_cep` INT(60))
    NO SQL
BEGIN
	DECLARE existe INT;
		SET existe = (SELECT COUNT(cpf) FROM tb_pessoa WHERE cpf = in_cpf);
		IF(existe = 0) THEN
			INSERT INTO tb_pessoa(nome, cpf, endereco, bairro, cidade, estado, cep)
			VALUES (in_nome, in_cpf, in_endereco, in_bairro, in_cidade, in_estado, in_cep);
			SELECT "1" RETORNO, "PESSOA CADASTRADA COM SUCESSO" MSG;
		ELSE 
			SELECT "0" RETORNO, "PESSOA JÁ CADASTRADA." MSG;
	END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure db3paulo.sp_i_produto
DELIMITER //
CREATE PROCEDURE `sp_i_produto`(IN `in_nome` VARCHAR(60), IN `in_qtd_min` INT, IN `in_qtd` INT, IN `in_valor` DECIMAL(3,1), IN `in_id_cat` INT)
    NO SQL
BEGIN
	DECLARE existe INT;
		SET existe = (SELECT COUNT(nome) FROM tb_produto WHERE nome = in_nome);
		IF(existe = 0) THEN
			INSERT INTO tb_produto(nome, qtd_min, qtd, valor_unitario, id_cat)
			VALUES (in_nome, in_qtd_min, in_qtd, in_valor, in_id_cat);
			SELECT "1" RETORNO, "PRODUTO CADASTRADO COM SUCESSO" MSG;
		ELSE 
			SELECT "0" RETORNO, "PRODUTO JÁ CADASTRADO." MSG;
	END IF;
END//
DELIMITER ;

-- Copiando estrutura para procedure db3paulo.sp_u_categoria
DELIMITER //
CREATE PROCEDURE `sp_u_categoria`(IN `in_campo` VARCHAR(60), IN `in_mudanca` VARCHAR(60), IN `in_id` INT)
    NO SQL
BEGIN
	DECLARE campo VARCHAR(60);
	DECLARE mudanca VARCHAR(60);
	SET campo = in_campo;
	SET mudanca = in_mudanca;
	
	IF(campo = "nome") THEN 
		UPDATE tb_categoria SET nome = in_mudanca WHERE id_cat = in_id;
		SELECT "1" RETORNO, "NOME ALTERADO COM SUCESSO" MSG;
	ELSEIF(campo = "status") THEN 
		UPDATE tb_categoria SET status = in_mudanca WHERE id_cat = in_id;
		SELECT "0" RETORNO, "STATUS ALTERADO COM SUCESSO" MSG;
	END IF;	
END//
DELIMITER ;

-- Copiando estrutura para procedure db3paulo.sp_u_pessoa
DELIMITER //
CREATE PROCEDURE `sp_u_pessoa`(IN `in_campo` VARCHAR(60), IN `in_mudanca` VARCHAR(60), IN `in_id` INT)
    NO SQL
BEGIN
	DECLARE campo VARCHAR(60);
	DECLARE mudanca VARCHAR(60);
	SET campo = in_campo;
	SET mudanca = in_mudanca;
	
	IF(campo = "nome") THEN 
		UPDATE tb_pessoa SET nome = in_mudanca WHERE id_pessoa = in_id;
		SELECT "1" RETORNO, "NOME ALTERADO COM SUCESSO" MSG;
	ELSEIF(campo = "cpf") THEN 
		UPDATE tb_pessoa SET cpf = in_mudanca WHERE id_pessoa = in_id;
		SELECT "1" RETORNO, "CPF ALTERADO COM SUCESSO" MSG;
	ELSEIF(campo = "endereco") THEN 
		UPDATE tb_pessoa SET endereco = in_mudanca WHERE id_pessoa = in_id;
		SELECT "1" RETORNO, "ENDEREÇO ALTERADO COM SUCESSO" MSG;
	ELSEIF(campo = "bairro") THEN 
		UPDATE tb_pessoa SET bairro = in_mudanca WHERE id_pessoa = in_id;
		SELECT "1" RETORNO, "BAIRRO ALTERADO COM SUCESSO" MSG;
	ELSEIF(campo = "cidade") THEN 
		UPDATE tb_pessoa SET cidade = in_mudanca WHERE id_pessoa = in_id;
		SELECT "1" RETORNO, "CIDADE ALTERADA COM SUCESSO" MSG;
	ELSEIF(campo = "estado") THEN 
		UPDATE tb_pessoa SET endereco = in_mudanca WHERE id_pessoa = in_id;
		SELECT "1" RETORNO, "ENDEREÇO ALTERADO COM SUCESSO" MSG;
	ELSEIF(campo = "cep") THEN 
		UPDATE tb_pessoa SET cep = in_mudanca WHERE id_pessoa = in_id;
		SELECT "1" RETORNO, "CEP ALTERADO COM SUCESSO" MSG;
	END IF;	
END//
DELIMITER ;

-- Copiando estrutura para procedure db3paulo.sp_u_produto
DELIMITER //
CREATE PROCEDURE `sp_u_produto`(IN `in_campo` VARCHAR(60), IN `in_mudanca` VARCHAR(60), IN `in_id` INT)
    NO SQL
BEGIN
	DECLARE campo VARCHAR(60);
	DECLARE mudanca VARCHAR(60);
	SET campo = in_campo;
	SET mudanca = in_mudanca;
	
	IF(campo = "nome") THEN 
		UPDATE tb_produto SET nome = in_mudanca WHERE id_produto = in_id;
		SELECT "1" RETORNO, "NOME ALTERADO COM SUCESSO" MSG;
	ELSEIF(campo = "qtd_min") THEN 
		UPDATE tb_produto SET qtd_min = in_mudanca WHERE id_produto = in_id;
		SELECT "1" RETORNO, "QUANTIDADE MÍNIMA ALTERADA COM SUCESSO" MSG;
	ELSEIF(campo = "qtd") THEN 
		UPDATE tb_produto SET qtd = in_mudanca WHERE id_produto = in_id;
		SELECT "1" RETORNO, "QUANTIDADE ALTERADA COM SUCESSO" MSG;
	ELSEIF(campo = "valor") THEN 
		UPDATE tb_produto SET valor_unitario = in_mudanca WHERE id_produto = in_id;
		SELECT "1" RETORNO, "VALOR UNITÁRIO ALTERADO COM SUCESSO" MSG;
	END IF;	
END//
DELIMITER ;

-- Copiando estrutura para tabela db3paulo.tb_categoria
CREATE TABLE IF NOT EXISTS `tb_categoria` (
  `id_cat` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_cat`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela db3paulo.tb_categoria: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_categoria` DISABLE KEYS */;
INSERT INTO `tb_categoria` (`id_cat`, `nome`, `status`) VALUES
	(2, 'Camisas', 1),
	(3, 'Chuteiras', 1);
/*!40000 ALTER TABLE `tb_categoria` ENABLE KEYS */;

-- Copiando estrutura para tabela db3paulo.tb_pessoa
CREATE TABLE IF NOT EXISTS `tb_pessoa` (
  `id_pessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `cpf` int(11) DEFAULT NULL,
  `endereco` varchar(60) DEFAULT NULL,
  `bairro` varchar(60) DEFAULT NULL,
  `cidade` varchar(60) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  `cep` char(8) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela db3paulo.tb_pessoa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_pessoa` DISABLE KEYS */;
INSERT INTO `tb_pessoa` (`id_pessoa`, `nome`, `cpf`, `endereco`, `bairro`, `cidade`, `estado`, `cep`) VALUES
	(1, 'Paulo Henrique', 2147483647, 'MG', 'Bairro Jardim', 'Pinhar', 'SP', '123');
/*!40000 ALTER TABLE `tb_pessoa` ENABLE KEYS */;

-- Copiando estrutura para tabela db3paulo.tb_produto
CREATE TABLE IF NOT EXISTS `tb_produto` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `qtd_min` int(11) DEFAULT NULL,
  `qtd` int(11) DEFAULT NULL,
  `id_cat` int(100) DEFAULT NULL,
  `valor_unitario` decimal(3,1) DEFAULT NULL,
  `nome` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `FK_produto_categoria` (`id_cat`),
  CONSTRAINT `FK_produto_categoria` FOREIGN KEY (`id_cat`) REFERENCES `tb_categoria` (`id_cat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela db3paulo.tb_produto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
INSERT INTO `tb_produto` (`id_produto`, `qtd_min`, `qtd`, `id_cat`, `valor_unitario`, `nome`) VALUES
	(2, 10, 10, 2, 99.9, 'Camisa Treino Adidas');
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;

-- Copiando estrutura para tabela db3paulo.tb_track
CREATE TABLE IF NOT EXISTS `tb_track` (
  `id_track` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda_fk` int(11) NOT NULL,
  `data` date NOT NULL,
  `msg_status` varchar(100) NOT NULL,
  PRIMARY KEY (`id_track`),
  KEY `id` (`id_venda_fk`),
  CONSTRAINT `id` FOREIGN KEY (`id_venda_fk`) REFERENCES `tb_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela db3paulo.tb_track: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_track` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_track` ENABLE KEYS */;

-- Copiando estrutura para tabela db3paulo.tb_venda
CREATE TABLE IF NOT EXISTS `tb_venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_pessoa` int(11) DEFAULT NULL,
  `total_venda` varchar(10) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `id_pessoa` (`id_pessoa`),
  CONSTRAINT `venda_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `tb_pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela db3paulo.tb_venda: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_venda` ENABLE KEYS */;

-- Copiando estrutura para tabela db3paulo.tb_venda_item
CREATE TABLE IF NOT EXISTS `tb_venda_item` (
  `id_venda_item` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) DEFAULT NULL,
  `id_produto` int(11) DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor` decimal(3,1) DEFAULT NULL,
  `ativo` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_venda_item`),
  KEY `id_venda` (`id_venda`),
  KEY `id_produto` (`id_produto`),
  CONSTRAINT `venda_item_ibfk_1` FOREIGN KEY (`id_venda`) REFERENCES `tb_venda` (`id_venda`),
  CONSTRAINT `venda_item_ibfk_2` FOREIGN KEY (`id_produto`) REFERENCES `tb_produto` (`id_produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela db3paulo.tb_venda_item: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tb_venda_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_venda_item` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
