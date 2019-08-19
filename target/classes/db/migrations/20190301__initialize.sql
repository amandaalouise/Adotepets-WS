-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.1.38-MariaDB-0ubuntu0.18.04.1 - Ubuntu 18.04
-- OS do Servidor:               debian-linux-gnu
-- HeidiSQL Versão:              10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Copiando estrutura para tabela wp_veracruz.th_adiantamentos_despesas
CREATE TABLE IF NOT EXISTS `th_adiantamentos_despesas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `data_empenho` date NOT NULL,
  `data_liquidacao` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `numero_empenho` varchar(90) NOT NULL,
  `numero_liquidacao` varchar(90) NOT NULL,
  `numero_pagamento` varchar(90) NOT NULL,
  `data` date NOT NULL,
  `justificativa` varchar(255) NOT NULL,
  `matricula` varchar(25) NOT NULL,
  `nome` text NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_adiantamentos_despesas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_adiantamentos_despesas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_adiantamentos_despesas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_adiantamentos_despesas_audit
CREATE TABLE IF NOT EXISTS `th_adiantamentos_despesas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `data_empenho` date DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_empenho` varchar(90) DEFAULT NULL,
  `numero_liquidacao` varchar(90) DEFAULT NULL,
  `numero_pagamento` varchar(90) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `justificativa` varchar(255) DEFAULT NULL,
  `matricula` varchar(25) DEFAULT NULL,
  `nome` text,
  `valor` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKg2ytrlkslsvbhcr159e2yt3` (`revision`),
  CONSTRAINT `FKg2ytrlkslsvbhcr159e2yt3` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_adiantamentos_despesas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_adiantamentos_despesas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_adiantamentos_despesas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_agentes_publicos
CREATE TABLE IF NOT EXISTS `th_agentes_publicos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `cargo` varchar(255) NOT NULL,
  `data_alocacao` date NOT NULL,
  `data_dispensa` date DEFAULT NULL,
  `local_lotacao` text NOT NULL,
  `matricula` varchar(25) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `remuneracao` decimal(19,2) NOT NULL,
  `situacao` text NOT NULL,
  `vinculo_empregaticio` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_agentes_publicos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_agentes_publicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_agentes_publicos` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_agentes_publicos_audit
CREATE TABLE IF NOT EXISTS `th_agentes_publicos_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `data_alocacao` date DEFAULT NULL,
  `data_dispensa` date DEFAULT NULL,
  `local_lotacao` text,
  `matricula` varchar(25) DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `remuneracao` decimal(19,2) DEFAULT NULL,
  `situacao` text,
  `vinculo_empregaticio` text,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKokrg4u7pbqkmrid2gfowjx5pl` (`revision`),
  CONSTRAINT `FKokrg4u7pbqkmrid2gfowjx5pl` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_agentes_publicos_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_agentes_publicos_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_agentes_publicos_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_almoxarifados
CREATE TABLE IF NOT EXISTS `th_almoxarifados` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `descricao` text NOT NULL,
  `produto` varchar(255) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `unidade` varchar(150) NOT NULL,
  `valor_total` decimal(19,2) NOT NULL,
  `valor_unitario` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_almoxarifados: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_almoxarifados` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_almoxarifados` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_almoxarifados_audit
CREATE TABLE IF NOT EXISTS `th_almoxarifados_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `descricao` text,
  `produto` varchar(255) DEFAULT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `unidade` varchar(150) DEFAULT NULL,
  `valor_total` decimal(19,2) DEFAULT NULL,
  `valor_unitario` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKstqj5y8vf2po444k2qfhgua1h` (`revision`),
  CONSTRAINT `FKstqj5y8vf2po444k2qfhgua1h` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_almoxarifados_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_almoxarifados_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_almoxarifados_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_autorizacoes
CREATE TABLE IF NOT EXISTS `th_autorizacoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `id_permissao` bigint(20) NOT NULL,
  `id_usuario` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4hbn5ka9rgu3s074l7tcnosk2` (`id_permissao`),
  KEY `FK85xqe9ji4xc2hwx68m8vfkddl` (`id_usuario`),
  CONSTRAINT `FK4hbn5ka9rgu3s074l7tcnosk2` FOREIGN KEY (`id_permissao`) REFERENCES `th_permissoes` (`id`),
  CONSTRAINT `FK85xqe9ji4xc2hwx68m8vfkddl` FOREIGN KEY (`id_usuario`) REFERENCES `th_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_autorizacoes: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `th_autorizacoes` DISABLE KEYS */;
INSERT IGNORE INTO `th_autorizacoes` (`id`, `created_on`, `updated_on`, `id_permissao`, `id_usuario`) VALUES
	(1,'2019-04-12 17:20:59.505797',NULL,1,1),
        (2,'2019-04-12 17:20:59.641533',NULL,6,2),
        (3,'2019-04-12 17:20:59.696577',NULL,2,2),
        (4,'2019-04-12 17:20:59.697749',NULL,4,2),
        (5,'2019-04-12 17:20:59.698492',NULL,3,2),
        (6,'2019-04-12 17:20:59.813726',NULL,4,3);
/*!40000 ALTER TABLE `th_autorizacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_autorizacoes_audit
CREATE TABLE IF NOT EXISTS `th_autorizacoes_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `id_permissao` bigint(20) DEFAULT NULL,
  `id_usuario` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK9cdg63h3dhyix462q8eth5qh5` (`revision`),
  CONSTRAINT `FK9cdg63h3dhyix462q8eth5qh5` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_autorizacoes_audit: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `th_autorizacoes_audit` DISABLE KEYS */;
INSERT IGNORE INTO `th_autorizacoes_audit` (`id`, `revision`, `revision_type`, `id_permissao`, `id_usuario`) VALUES
	(1, 9, 0, 1, 1),
	(2, 10, 0, 4, 2);
/*!40000 ALTER TABLE `th_autorizacoes_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_bens_patrimoniais
CREATE TABLE IF NOT EXISTS `th_bens_patrimoniais` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `centro_custo` varchar(250) NOT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `descricao` text NOT NULL,
  `orgao` varchar(250) NOT NULL,
  `placa` varchar(90) DEFAULT NULL,
  `responsavel` varchar(250) NOT NULL,
  `situacao` varchar(150) NOT NULL,
  `tipo_aquisicao` varchar(150) NOT NULL,
  `tipo_natureza` varchar(150) NOT NULL,
  `valor_aquisicao` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_bens_patrimoniais: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_bens_patrimoniais` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_bens_patrimoniais` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_bens_patrimoniais_audit
CREATE TABLE IF NOT EXISTS `th_bens_patrimoniais_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `centro_custo` varchar(250) DEFAULT NULL,
  `data_aquisicao` date DEFAULT NULL,
  `descricao` text,
  `orgao` varchar(250) DEFAULT NULL,
  `placa` varchar(90) DEFAULT NULL,
  `responsavel` varchar(250) DEFAULT NULL,
  `situacao` varchar(150) DEFAULT NULL,
  `tipo_aquisicao` varchar(150) DEFAULT NULL,
  `tipo_natureza` varchar(150) DEFAULT NULL,
  `valor_aquisicao` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK1u0mugpmjik21r19vrsys87ab` (`revision`),
  CONSTRAINT `FK1u0mugpmjik21r19vrsys87ab` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_bens_patrimoniais_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_bens_patrimoniais_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_bens_patrimoniais_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_contratos
CREATE TABLE IF NOT EXISTS `th_contratos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `administrador` varchar(250) NOT NULL,
  `cnpj` varchar(255) NOT NULL,
  `codigo_contrato` varchar(90) NOT NULL,
  `contratada` varchar(150) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `dias_a_vencer` int(11) NOT NULL,
  `numero_aditivo_vigente` int(11) NOT NULL,
  `numero_empenho` int(11) NOT NULL,
  `numero_processos` int(11) NOT NULL,
  `objeto` text NOT NULL,
  `prazo_vigencia` int(11) NOT NULL,
  `setor_fiscalizacao` varchar(250) NOT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `valor_do_contrato_original` decimal(19,2) NOT NULL,
  `valor_do_termo_aditivo` decimal(19,2) NOT NULL,
  `valor_total` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_contratos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_contratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_contratos` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_contratos_audit
CREATE TABLE IF NOT EXISTS `th_contratos_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `administrador` varchar(250) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `codigo_contrato` varchar(90) DEFAULT NULL,
  `contratada` varchar(150) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `dias_a_vencer` int(11) DEFAULT NULL,
  `numero_aditivo_vigente` int(11) DEFAULT NULL,
  `numero_empenho` int(11) DEFAULT NULL,
  `numero_processos` int(11) DEFAULT NULL,
  `objeto` text,
  `prazo_vigencia` int(11) DEFAULT NULL,
  `setor_fiscalizacao` varchar(250) DEFAULT NULL,
  `situacao` varchar(255) DEFAULT NULL,
  `valor_do_contrato_original` decimal(19,2) DEFAULT NULL,
  `valor_do_termo_aditivo` decimal(19,2) DEFAULT NULL,
  `valor_total` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKjn6ldg0vghaf013wvmgkj708e` (`revision`),
  CONSTRAINT `FKjn6ldg0vghaf013wvmgkj708e` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_contratos_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_contratos_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_contratos_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_convenios
CREATE TABLE IF NOT EXISTS `th_convenios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `cnpj` varchar(255) NOT NULL,
  `codigo_convenio` varchar(90) NOT NULL,
  `concedente` varchar(150) NOT NULL,
  `contrapartida` decimal(19,2) NOT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `numero_aditivo_vigente` varchar(90) NOT NULL,
  `objeto` text NOT NULL,
  `situacao` varchar(250) NOT NULL,
  `valor_termo_aditivo` decimal(19,2) NOT NULL,
  `valor_total` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_convenios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_convenios` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_convenios` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_convenios_audit
CREATE TABLE IF NOT EXISTS `th_convenios_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `codigo_convenio` varchar(90) DEFAULT NULL,
  `concedente` varchar(150) DEFAULT NULL,
  `contrapartida` decimal(19,2) DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_termino` date DEFAULT NULL,
  `numero_aditivo_vigente` varchar(90) DEFAULT NULL,
  `objeto` text,
  `situacao` varchar(250) DEFAULT NULL,
  `valor_termo_aditivo` decimal(19,2) DEFAULT NULL,
  `valor_total` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKpbp0py3ca7yoc602wjedewbin` (`revision`),
  CONSTRAINT `FKpbp0py3ca7yoc602wjedewbin` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_convenios_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_convenios_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_convenios_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_ajudas_custo
CREATE TABLE IF NOT EXISTS `th_despesas_ajudas_custo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `data_empenho` date NOT NULL,
  `data_liquidacao` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `numero_empenho` varchar(90) NOT NULL,
  `numero_liquidacao` varchar(90) NOT NULL,
  `numero_pagamento` varchar(90) NOT NULL,
  `data` date NOT NULL,
  `justificativa` text NOT NULL,
  `matricula` varchar(25) NOT NULL,
  `nome` text NOT NULL,
  `tipo_despesa` text NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_ajudas_custo: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_ajudas_custo` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_ajudas_custo` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_ajudas_custo_audit
CREATE TABLE IF NOT EXISTS `th_despesas_ajudas_custo_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `data_empenho` date DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_empenho` varchar(90) DEFAULT NULL,
  `numero_liquidacao` varchar(90) DEFAULT NULL,
  `numero_pagamento` varchar(90) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `justificativa` text,
  `matricula` varchar(25) DEFAULT NULL,
  `nome` text,
  `tipo_despesa` text,
  `valor` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKal5kwgnopauttmn1dx2rmyjyi` (`revision`),
  CONSTRAINT `FKal5kwgnopauttmn1dx2rmyjyi` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_ajudas_custo_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_ajudas_custo_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_ajudas_custo_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_arrecadadas
CREATE TABLE IF NOT EXISTS `th_despesas_arrecadadas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `mes` int(11) NOT NULL,
  `valor_arrecadado` decimal(19,2) NOT NULL,
  `valor_previsto` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_arrecadadas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_arrecadadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_arrecadadas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_arrecadadas_audit
CREATE TABLE IF NOT EXISTS `th_despesas_arrecadadas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `valor_arrecadado` decimal(19,2) DEFAULT NULL,
  `valor_previsto` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKd88mu7ss9qgiovp71hgjw4f2d` (`revision`),
  CONSTRAINT `FKd88mu7ss9qgiovp71hgjw4f2d` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_arrecadadas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_arrecadadas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_arrecadadas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_cartao
CREATE TABLE IF NOT EXISTS `th_despesas_cartao` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `data_empenho` date NOT NULL,
  `data_liquidacao` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `numero_empenho` varchar(90) NOT NULL,
  `numero_liquidacao` varchar(90) NOT NULL,
  `numero_pagamento` varchar(90) NOT NULL,
  `internacional` varchar(255) NOT NULL,
  `mes_fatura` int(11) NOT NULL,
  `numero_cartao` varchar(60) NOT NULL,
  `tipo_cartao` varchar(255) NOT NULL,
  `valor_fatura` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_cartao: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_cartao` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_cartao` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_cartao_audit
CREATE TABLE IF NOT EXISTS `th_despesas_cartao_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `data_empenho` date DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_empenho` varchar(90) DEFAULT NULL,
  `numero_liquidacao` varchar(90) DEFAULT NULL,
  `numero_pagamento` varchar(90) DEFAULT NULL,
  `internacional` varchar(255) DEFAULT NULL,
  `mes_fatura` int(11) DEFAULT NULL,
  `numero_cartao` varchar(60) DEFAULT NULL,
  `tipo_cartao` varchar(255) DEFAULT NULL,
  `valor_fatura` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKa1afhqpnabm65d6pq69v4tu0u` (`revision`),
  CONSTRAINT `FKa1afhqpnabm65d6pq69v4tu0u` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_cartao_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_cartao_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_cartao_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_cartao_detalhe_fatura
CREATE TABLE IF NOT EXISTS `th_despesas_cartao_detalhe_fatura` (
  `despesa_cartao_id` bigint(20) NOT NULL,
  `detalhe_fatura_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_d7bhvlvre0o938ig07sxwed99` (`detalhe_fatura_id`),
  KEY `FKl2fvh468j1xiuvoovor9mg6jl` (`despesa_cartao_id`),
  CONSTRAINT `FKhn7nhqtlab0nnjgdist3359ux` FOREIGN KEY (`detalhe_fatura_id`) REFERENCES `th_detalhes_faturas` (`id`),
  CONSTRAINT `FKl2fvh468j1xiuvoovor9mg6jl` FOREIGN KEY (`despesa_cartao_id`) REFERENCES `th_despesas_cartao` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_cartao_detalhe_fatura: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_cartao_detalhe_fatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_cartao_detalhe_fatura` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_cartao_detalhe_fatura_audit
CREATE TABLE IF NOT EXISTS `th_despesas_cartao_detalhe_fatura_audit` (
  `revision` bigint(20) NOT NULL,
  `despesa_cartao_id` bigint(20) NOT NULL,
  `detalhe_fatura_id` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`revision`,`despesa_cartao_id`,`detalhe_fatura_id`),
  CONSTRAINT `FKeud1e2mr8r79hr3rtdav5yflh` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_cartao_detalhe_fatura_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_cartao_detalhe_fatura_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_cartao_detalhe_fatura_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_diarias
CREATE TABLE IF NOT EXISTS `th_despesas_diarias` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `data_empenho` date NOT NULL,
  `data_liquidacao` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `numero_empenho` varchar(90) NOT NULL,
  `numero_liquidacao` varchar(90) NOT NULL,
  `numero_pagamento` varchar(90) NOT NULL,
  `cpf` varchar(20) NOT NULL,
  `custo_transporte` decimal(19,2) NOT NULL,
  `data_inicio_viagem` date NOT NULL,
  `data_termino_viagem` date NOT NULL,
  `destino` text NOT NULL,
  `justificativa` text NOT NULL,
  `matricula` varchar(50) NOT NULL,
  `meio_transporte` text NOT NULL,
  `nome` text NOT NULL,
  `quantidade_diarias_pagas` decimal(19,2) NOT NULL,
  `valor_unitario_diaria` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_diarias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_diarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_diarias` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_diarias_audit
CREATE TABLE IF NOT EXISTS `th_despesas_diarias_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `data_empenho` date DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_empenho` varchar(90) DEFAULT NULL,
  `numero_liquidacao` varchar(90) DEFAULT NULL,
  `numero_pagamento` varchar(90) DEFAULT NULL,
  `cpf` varchar(20) DEFAULT NULL,
  `custo_transporte` decimal(19,2) DEFAULT NULL,
  `data_inicio_viagem` date DEFAULT NULL,
  `data_termino_viagem` date DEFAULT NULL,
  `destino` text,
  `justificativa` text,
  `matricula` varchar(50) DEFAULT NULL,
  `meio_transporte` text,
  `nome` text,
  `quantidade_diarias_pagas` decimal(19,2) DEFAULT NULL,
  `valor_unitario_diaria` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKajs9lsvr01d6chxcif8es3mbd` (`revision`),
  CONSTRAINT `FKajs9lsvr01d6chxcif8es3mbd` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_diarias_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_diarias_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_diarias_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_empenhadas
CREATE TABLE IF NOT EXISTS `th_despesas_empenhadas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(255) DEFAULT NULL,
  `mes` int(11) NOT NULL,
  `valor_empenhado` decimal(19,2) NOT NULL,
  `valor_estornado` decimal(19,2) NOT NULL,
  `valor_liquido` decimal(19,2) NOT NULL,
  `valor_revertido` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_empenhadas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_empenhadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_empenhadas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_empenhadas_audit
CREATE TABLE IF NOT EXISTS `th_despesas_empenhadas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(255) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `valor_empenhado` decimal(19,2) DEFAULT NULL,
  `valor_estornado` decimal(19,2) DEFAULT NULL,
  `valor_liquido` decimal(19,2) DEFAULT NULL,
  `valor_revertido` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKqu1nwmkptbt5ek40d6iwm76jd` (`revision`),
  CONSTRAINT `FKqu1nwmkptbt5ek40d6iwm76jd` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_empenhadas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_empenhadas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_empenhadas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_empenhadas_pagar
CREATE TABLE IF NOT EXISTS `th_despesas_empenhadas_pagar` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `fonte` varchar(255) NOT NULL,
  `mes` int(11) NOT NULL,
  `saldo_a_pagar` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_empenhadas_pagar: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_empenhadas_pagar` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_empenhadas_pagar` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_empenhadas_pagar_audit
CREATE TABLE IF NOT EXISTS `th_despesas_empenhadas_pagar_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `fonte` varchar(255) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `saldo_a_pagar` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK96syxd45xspot5j8beq9f7wb9` (`revision`),
  CONSTRAINT `FK96syxd45xspot5j8beq9f7wb9` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_empenhadas_pagar_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_empenhadas_pagar_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_empenhadas_pagar_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_liquidadas
CREATE TABLE IF NOT EXISTS `th_despesas_liquidadas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `mes` int(11) NOT NULL,
  `valor_estornado_orcamento` decimal(19,2) NOT NULL,
  `valor_estornado_a_pagar` decimal(19,2) NOT NULL,
  `valor_liquidado_orcamento` decimal(19,2) NOT NULL,
  `valor_liquidado_a_pagar` decimal(19,2) NOT NULL,
  `valor_liquido` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_liquidadas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_liquidadas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_liquidadas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_liquidadas_audit
CREATE TABLE IF NOT EXISTS `th_despesas_liquidadas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `valor_estornado_orcamento` decimal(19,2) DEFAULT NULL,
  `valor_estornado_a_pagar` decimal(19,2) DEFAULT NULL,
  `valor_liquidado_orcamento` decimal(19,2) DEFAULT NULL,
  `valor_liquidado_a_pagar` decimal(19,2) DEFAULT NULL,
  `valor_liquido` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK8w0tp16l147m9s7h2kr0va7vr` (`revision`),
  CONSTRAINT `FK8w0tp16l147m9s7h2kr0va7vr` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_liquidadas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_liquidadas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_liquidadas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_pagas
CREATE TABLE IF NOT EXISTS `th_despesas_pagas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `mes` int(11) NOT NULL,
  `valor_estornado_orcamento` decimal(19,2) NOT NULL,
  `valor_estornado_a_pagar` decimal(19,2) NOT NULL,
  `valor_liquido` decimal(19,2) NOT NULL,
  `valor_pago_orcamento` decimal(19,2) NOT NULL,
  `valor_pago_a_pagar` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_pagas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_pagas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_pagas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_pagas_audit
CREATE TABLE IF NOT EXISTS `th_despesas_pagas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `valor_estornado_orcamento` decimal(19,2) DEFAULT NULL,
  `valor_estornado_a_pagar` decimal(19,2) DEFAULT NULL,
  `valor_liquido` decimal(19,2) DEFAULT NULL,
  `valor_pago_orcamento` decimal(19,2) DEFAULT NULL,
  `valor_pago_a_pagar` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKb87ginw13qrdcpw796mqcnddn` (`revision`),
  CONSTRAINT `FKb87ginw13qrdcpw796mqcnddn` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_pagas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_pagas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_pagas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_transportes
CREATE TABLE IF NOT EXISTS `th_despesas_transportes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `data_empenho` date NOT NULL,
  `data_liquidacao` date NOT NULL,
  `data_pagamento` date NOT NULL,
  `numero_empenho` varchar(90) NOT NULL,
  `numero_liquidacao` varchar(90) NOT NULL,
  `numero_pagamento` varchar(90) NOT NULL,
  `data` date NOT NULL,
  `destino` text NOT NULL,
  `documento_credor` varchar(25) NOT NULL,
  `motivo_viagem` text NOT NULL,
  `nome_credor` text NOT NULL,
  `orgao` text,
  `tipo_gasto` varchar(45) NOT NULL,
  `valor_gasto` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_transportes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_transportes` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_transportes` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_despesas_transportes_audit
CREATE TABLE IF NOT EXISTS `th_despesas_transportes_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `data_empenho` date DEFAULT NULL,
  `data_liquidacao` date DEFAULT NULL,
  `data_pagamento` date DEFAULT NULL,
  `numero_empenho` varchar(90) DEFAULT NULL,
  `numero_liquidacao` varchar(90) DEFAULT NULL,
  `numero_pagamento` varchar(90) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `destino` text,
  `documento_credor` varchar(25) DEFAULT NULL,
  `motivo_viagem` text,
  `nome_credor` text,
  `orgao` text,
  `tipo_gasto` varchar(45) DEFAULT NULL,
  `valor_gasto` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK5u1tymk7b4r1llsb2d2hii00d` (`revision`),
  CONSTRAINT `FK5u1tymk7b4r1llsb2d2hii00d` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_despesas_transportes_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_despesas_transportes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_despesas_transportes_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_detalhes_contas
CREATE TABLE IF NOT EXISTS `th_detalhes_contas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `data` date NOT NULL,
  `tipo_lancamento` varchar(255) NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_detalhes_contas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_detalhes_contas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_detalhes_contas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_detalhes_contas_audit
CREATE TABLE IF NOT EXISTS `th_detalhes_contas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `tipo_lancamento` varchar(255) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK1s9hnmqwnppx2q4xwqw8sb066` (`revision`),
  CONSTRAINT `FK1s9hnmqwnppx2q4xwqw8sb066` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_detalhes_contas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_detalhes_contas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_detalhes_contas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_detalhes_faturas
CREATE TABLE IF NOT EXISTS `th_detalhes_faturas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `data` date NOT NULL,
  `razao_social` text NOT NULL,
  `valor_compra` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_detalhes_faturas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_detalhes_faturas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_detalhes_faturas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_detalhes_faturas_audit
CREATE TABLE IF NOT EXISTS `th_detalhes_faturas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `data` date DEFAULT NULL,
  `razao_social` text,
  `valor_compra` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKbro7matfxb1cfmld6wfhitdg9` (`revision`),
  CONSTRAINT `FKbro7matfxb1cfmld6wfhitdg9` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_detalhes_faturas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_detalhes_faturas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_detalhes_faturas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_extratos_bancarios
CREATE TABLE IF NOT EXISTS `th_extratos_bancarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `agencia` varchar(20) NOT NULL,
  `banco` varchar(70) NOT NULL,
  `conta` varchar(20) NOT NULL,
  `saldo_contabil` decimal(19,2) NOT NULL,
  `saldo_extrato` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_extratos_bancarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_extratos_bancarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_extratos_bancarios` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_extratos_bancarios_audit
CREATE TABLE IF NOT EXISTS `th_extratos_bancarios_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `agencia` varchar(20) DEFAULT NULL,
  `banco` varchar(70) DEFAULT NULL,
  `conta` varchar(20) DEFAULT NULL,
  `saldo_contabil` decimal(19,2) DEFAULT NULL,
  `saldo_extrato` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKtdxtkj8fi0nf4xir2dnfc9qys` (`revision`),
  CONSTRAINT `FKtdxtkj8fi0nf4xir2dnfc9qys` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_extratos_bancarios_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_extratos_bancarios_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_extratos_bancarios_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_extratos_bancarios_detalhes_conta
CREATE TABLE IF NOT EXISTS `th_extratos_bancarios_detalhes_conta` (
  `extrato_bancario_id` bigint(20) NOT NULL,
  `detalhes_conta_id` bigint(20) NOT NULL,
  UNIQUE KEY `UK_jghifmus24jlod0303cdlfj2o` (`detalhes_conta_id`),
  KEY `FKmpbhis8defev7bsvv8lp00ujt` (`extrato_bancario_id`),
  CONSTRAINT `FKmpbhis8defev7bsvv8lp00ujt` FOREIGN KEY (`extrato_bancario_id`) REFERENCES `th_extratos_bancarios` (`id`),
  CONSTRAINT `FKo9s7gxg431v8wynv7v9ke817v` FOREIGN KEY (`detalhes_conta_id`) REFERENCES `th_detalhes_contas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_extratos_bancarios_detalhes_conta: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_extratos_bancarios_detalhes_conta` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_extratos_bancarios_detalhes_conta` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_extratos_bancarios_detalhes_conta_audit
CREATE TABLE IF NOT EXISTS `th_extratos_bancarios_detalhes_conta_audit` (
  `revision` bigint(20) NOT NULL,
  `extrato_bancario_id` bigint(20) NOT NULL,
  `detalhes_conta_id` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`revision`,`extrato_bancario_id`,`detalhes_conta_id`),
  CONSTRAINT `FKra9peacdbgje78cnrav5ei3aq` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_extratos_bancarios_detalhes_conta_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_extratos_bancarios_detalhes_conta_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_extratos_bancarios_detalhes_conta_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_folhas_pagamentos
CREATE TABLE IF NOT EXISTS `th_folhas_pagamentos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `cargo` text NOT NULL,
  `descontos` decimal(19,2) NOT NULL,
  `lotacao` text NOT NULL,
  `mes` int(11) NOT NULL,
  `numero_funcionarios_cargo` int(11) NOT NULL,
  `remuneracao_bruta` decimal(19,2) NOT NULL,
  `remuneracao_liquida` decimal(19,2) NOT NULL,
  `secretaria` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_folhas_pagamentos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_folhas_pagamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_folhas_pagamentos` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_folhas_pagamentos_audit
CREATE TABLE IF NOT EXISTS `th_folhas_pagamentos_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `cargo` text,
  `descontos` decimal(19,2) DEFAULT NULL,
  `lotacao` text,
  `mes` int(11) DEFAULT NULL,
  `numero_funcionarios_cargo` int(11) DEFAULT NULL,
  `remuneracao_bruta` decimal(19,2) DEFAULT NULL,
  `remuneracao_liquida` decimal(19,2) DEFAULT NULL,
  `secretaria` text,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK3yc0btx1l08wa75lo73jn2ldj` (`revision`),
  CONSTRAINT `FK3yc0btx1l08wa75lo73jn2ldj` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_folhas_pagamentos_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_folhas_pagamentos_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_folhas_pagamentos_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_informacoes_administrativas
CREATE TABLE IF NOT EXISTS `th_informacoes_administrativas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `mes` int(11) NOT NULL,
  `num_cargos_comissao_criados` int(11) NOT NULL,
  `num_cargos_comissao_preenchidos` int(11) NOT NULL,
  `num_cargos_efetivos_criados` int(11) NOT NULL,
  `num_cargos_efetivos_preenchidos` int(11) NOT NULL,
  `num_empregos_publicos_criados` int(11) NOT NULL,
  `num_empregos_publicos_preenchidos` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_informacoes_administrativas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_informacoes_administrativas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_informacoes_administrativas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_informacoes_administrativas_audit
CREATE TABLE IF NOT EXISTS `th_informacoes_administrativas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `num_cargos_comissao_criados` int(11) DEFAULT NULL,
  `num_cargos_comissao_preenchidos` int(11) DEFAULT NULL,
  `num_cargos_efetivos_criados` int(11) DEFAULT NULL,
  `num_cargos_efetivos_preenchidos` int(11) DEFAULT NULL,
  `num_empregos_publicos_criados` int(11) DEFAULT NULL,
  `num_empregos_publicos_preenchidos` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKpsptn37180e55w3foyvxob5t8` (`revision`),
  CONSTRAINT `FKpsptn37180e55w3foyvxob5t8` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_informacoes_administrativas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_informacoes_administrativas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_informacoes_administrativas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_instituicoes
CREATE TABLE IF NOT EXISTS `th_instituicoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `cnpj` varchar(255) NOT NULL,
  `descricao` text,
  `nome` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_instituicoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_instituicoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_instituicoes` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_instituicoes_audit
CREATE TABLE IF NOT EXISTS `th_instituicoes_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `descricao` text,
  `nome` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKj9c3liyg2pbcygcy4ccms09m4` (`revision`),
  CONSTRAINT `FKj9c3liyg2pbcygcy4ccms09m4` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_instituicoes_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_instituicoes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_instituicoes_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_justificativas_contratacoes_diretas
CREATE TABLE IF NOT EXISTS `th_justificativas_contratacoes_diretas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `cnpj` varchar(255) NOT NULL,
  `codigo_contrato` varchar(90) NOT NULL,
  `data_compra` date DEFAULT NULL,
  `fornecedor` varchar(150) NOT NULL,
  `justificativa` text NOT NULL,
  `material_servico` varchar(255) DEFAULT NULL,
  `objeto` text NOT NULL,
  `quantidade` int(11) NOT NULL,
  `unidade` varchar(150) NOT NULL,
  `valor_total` decimal(19,2) NOT NULL,
  `valor_unitario` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_justificativas_contratacoes_diretas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_justificativas_contratacoes_diretas` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_justificativas_contratacoes_diretas` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_justificativas_contratacoes_diretas_audit
CREATE TABLE IF NOT EXISTS `th_justificativas_contratacoes_diretas_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `cnpj` varchar(255) DEFAULT NULL,
  `codigo_contrato` varchar(90) DEFAULT NULL,
  `data_compra` date DEFAULT NULL,
  `fornecedor` varchar(150) DEFAULT NULL,
  `justificativa` text,
  `material_servico` varchar(255) DEFAULT NULL,
  `objeto` text,
  `quantidade` int(11) DEFAULT NULL,
  `unidade` varchar(150) DEFAULT NULL,
  `valor_total` decimal(19,2) DEFAULT NULL,
  `valor_unitario` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK1ejv5cydnl0g9dq6iqu2ir8ns` (`revision`),
  CONSTRAINT `FK1ejv5cydnl0g9dq6iqu2ir8ns` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_justificativas_contratacoes_diretas_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_justificativas_contratacoes_diretas_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_justificativas_contratacoes_diretas_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_licitacoes
CREATE TABLE IF NOT EXISTS `th_licitacoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `codigo_licitacao` varchar(90) NOT NULL,
  `data_abertura` date DEFAULT NULL,
  `justificativa` text NOT NULL,
  `objeto` text NOT NULL,
  `tipo_estagio_licitacao` varchar(255) DEFAULT NULL,
  `tipo_modalidade` varchar(255) DEFAULT NULL,
  `titulo` text NOT NULL,
  `valor_total` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5n669grngkvd2hv88bodvf1ef` (`codigo_licitacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_licitacoes: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_licitacoes` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_licitacoes` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_licitacoes_audit
CREATE TABLE IF NOT EXISTS `th_licitacoes_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `codigo_licitacao` varchar(90) DEFAULT NULL,
  `data_abertura` date DEFAULT NULL,
  `justificativa` text,
  `objeto` text,
  `tipo_estagio_licitacao` varchar(255) DEFAULT NULL,
  `tipo_modalidade` varchar(255) DEFAULT NULL,
  `titulo` text,
  `valor_total` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK9gr3f3wiu07rba6f29w3nopb5` (`revision`),
  CONSTRAINT `FK9gr3f3wiu07rba6f29w3nopb5` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_licitacoes_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_licitacoes_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_licitacoes_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_permissoes
CREATE TABLE IF NOT EXISTS `th_permissoes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `regra` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_permissoes: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `th_permissoes` DISABLE KEYS */;
INSERT IGNORE INTO `th_permissoes` (`id`, `created_on`, `updated_on`, `regra`) VALUES
	(1, '2019-04-03 08:35:12.322935', NULL, 'administrador'),
	(2, '2019-04-03 08:35:12.342157', NULL, 'excluir'),
	(3, '2019-04-03 08:35:12.395170', NULL, 'editar'),
	(4, '2019-04-03 08:35:12.405738', NULL, 'visualizar'),
	(5, '2019-04-03 08:35:12.412486', NULL, 'gerenciamento'),
	(6, '2019-04-03 08:35:12.418666', NULL, 'cadastrar');
/*!40000 ALTER TABLE `th_permissoes` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_permissoes_audit
CREATE TABLE IF NOT EXISTS `th_permissoes_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `regra` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKboeuq7y2scp3q1g1qdgtmbqn4` (`revision`),
  CONSTRAINT `FKboeuq7y2scp3q1g1qdgtmbqn4` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_permissoes_audit: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `th_permissoes_audit` DISABLE KEYS */;
INSERT IGNORE INTO `th_permissoes_audit` (`id`, `revision`, `revision_type`, `regra`) VALUES
	(1, 2, 0, 'administrador'),
	(2, 3, 0, 'excluir'),
	(3, 4, 0, 'editar'),
	(4, 5, 0, 'visualizar'),
	(5, 6, 0, 'gerenciamento'),
	(6, 7, 0, 'cadastrar');
/*!40000 ALTER TABLE `th_permissoes_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_quadros_funcionais
CREATE TABLE IF NOT EXISTS `th_quadros_funcionais` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `carga_horaria` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `data_alocacao` date NOT NULL,
  `data_dispensa` date DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `forma_investidura` varchar(255) NOT NULL,
  `horario_trabalho` varchar(50) NOT NULL,
  `local_lotacao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_quadros_funcionais: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_quadros_funcionais` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_quadros_funcionais` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_quadros_funcionais_audit
CREATE TABLE IF NOT EXISTS `th_quadros_funcionais_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `data_alocacao` date DEFAULT NULL,
  `data_dispensa` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `forma_investidura` varchar(255) DEFAULT NULL,
  `horario_trabalho` varchar(50) DEFAULT NULL,
  `local_lotacao` text,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK8vx41lrmb5g5qxn5in2acpsd1` (`revision`),
  CONSTRAINT `FK8vx41lrmb5g5qxn5in2acpsd1` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_quadros_funcionais_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_quadros_funcionais_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_quadros_funcionais_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_revisions
CREATE TABLE IF NOT EXISTS `th_revisions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_by` varchar(45) NOT NULL,
  `created_on` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_revisions: ~10 rows (aproximadamente)
/*!40000 ALTER TABLE `th_revisions` DISABLE KEYS */;
INSERT IGNORE INTO `th_revisions` (`id`, `created_by`, `created_on`) VALUES
	(1, 'unknow', '2019-04-03 08:35:12.284000'),
	(2, 'unknow', '2019-04-03 08:35:12.323000'),
	(3, 'unknow', '2019-04-03 08:35:12.342000'),
	(4, 'unknow', '2019-04-03 08:35:12.396000'),
	(5, 'unknow', '2019-04-03 08:35:12.406000'),
	(6, 'unknow', '2019-04-03 08:35:12.413000'),
	(7, 'unknow', '2019-04-03 08:35:12.419000'),
	(8, 'unknow', '2019-04-03 08:35:12.763000'),
	(9, 'unknow', '2019-04-03 08:35:12.789000'),
	(10, 'unknow', '2019-04-03 08:35:12.804000');
/*!40000 ALTER TABLE `th_revisions` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_servidores_cedidos
CREATE TABLE IF NOT EXISTS `th_servidores_cedidos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `carga_horaria` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `data_alocacao` date NOT NULL,
  `data_dispensa` date DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `orgao_destino` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_servidores_cedidos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_servidores_cedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_servidores_cedidos` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_servidores_cedidos_audit
CREATE TABLE IF NOT EXISTS `th_servidores_cedidos_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `data_alocacao` date DEFAULT NULL,
  `data_dispensa` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `orgao_destino` text,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK700vaoqj9fc7iorrm2q83xldp` (`revision`),
  CONSTRAINT `FK700vaoqj9fc7iorrm2q83xldp` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_servidores_cedidos_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_servidores_cedidos_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_servidores_cedidos_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_servidores_recebidos
CREATE TABLE IF NOT EXISTS `th_servidores_recebidos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `carga_horaria` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `data_alocacao` date NOT NULL,
  `data_dispensa` date DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `orgao_origem` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_servidores_recebidos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_servidores_recebidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_servidores_recebidos` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_servidores_recebidos_audit
CREATE TABLE IF NOT EXISTS `th_servidores_recebidos_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `data_alocacao` date DEFAULT NULL,
  `data_dispensa` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `orgao_origem` text,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKc4tdaxmvopp4hr2h17p6y61uy` (`revision`),
  CONSTRAINT `FKc4tdaxmvopp4hr2h17p6y61uy` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_servidores_recebidos_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_servidores_recebidos_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_servidores_recebidos_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_servidores_temporarios
CREATE TABLE IF NOT EXISTS `th_servidores_temporarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `carga_horaria` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL,
  `data_alocacao` date NOT NULL,
  `data_dispensa` date DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `forma_investidura` varchar(45) NOT NULL,
  `horario_trabalho` varchar(255) NOT NULL,
  `local_lotacao` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_servidores_temporarios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_servidores_temporarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_servidores_temporarios` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_servidores_temporarios_audit
CREATE TABLE IF NOT EXISTS `th_servidores_temporarios_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `carga_horaria` int(11) DEFAULT NULL,
  `cargo` varchar(255) DEFAULT NULL,
  `data_alocacao` date DEFAULT NULL,
  `data_dispensa` date DEFAULT NULL,
  `nome` varchar(255) DEFAULT NULL,
  `forma_investidura` varchar(45) DEFAULT NULL,
  `horario_trabalho` varchar(255) DEFAULT NULL,
  `local_lotacao` text,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK5pmal8xly7170y8iyfl2je2d5` (`revision`),
  CONSTRAINT `FK5pmal8xly7170y8iyfl2je2d5` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_servidores_temporarios_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_servidores_temporarios_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_servidores_temporarios_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_transferencias_financeiras_terceiros
CREATE TABLE IF NOT EXISTS `th_transferencias_financeiras_terceiros` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `beneficiario` text NOT NULL,
  `convenio` text NOT NULL,
  `empenhado` decimal(19,2) NOT NULL,
  `pago` decimal(19,2) NOT NULL,
  `saldo` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_transferencias_financeiras_terceiros: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_transferencias_financeiras_terceiros` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_transferencias_financeiras_terceiros` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_transferencias_financeiras_terceiros_audit
CREATE TABLE IF NOT EXISTS `th_transferencias_financeiras_terceiros_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `beneficiario` text,
  `convenio` text,
  `empenhado` decimal(19,2) DEFAULT NULL,
  `pago` decimal(19,2) DEFAULT NULL,
  `saldo` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKld9m9raqxq0dvc95i7x6rw9hs` (`revision`),
  CONSTRAINT `FKld9m9raqxq0dvc95i7x6rw9hs` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_transferencias_financeiras_terceiros_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_transferencias_financeiras_terceiros_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_transferencias_financeiras_terceiros_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_transferencias_voluntarias
CREATE TABLE IF NOT EXISTS `th_transferencias_voluntarias` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ano` varchar(4) NOT NULL,
  `mes` int(11) NOT NULL,
  `valor` decimal(19,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_transferencias_voluntarias: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_transferencias_voluntarias` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_transferencias_voluntarias` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_transferencias_voluntarias_audit
CREATE TABLE IF NOT EXISTS `th_transferencias_voluntarias_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ano` varchar(4) DEFAULT NULL,
  `mes` int(11) DEFAULT NULL,
  `valor` decimal(19,2) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FKfg2mdp4pi4oios23isqwt39rn` (`revision`),
  CONSTRAINT `FKfg2mdp4pi4oios23isqwt39rn` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_transferencias_voluntarias_audit: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `th_transferencias_voluntarias_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `th_transferencias_voluntarias_audit` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_usuarios
CREATE TABLE IF NOT EXISTS `th_usuarios` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_on` datetime(6) NOT NULL,
  `updated_on` datetime(6) DEFAULT NULL,
  `ativo` bit(1) NOT NULL,
  `email` varchar(90) NOT NULL,
  `nome` varchar(90) NOT NULL,
  `nome_usuario` varchar(45) NOT NULL,
  `senha` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_usuarios: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `th_usuarios` DISABLE KEYS */;
INSERT IGNORE INTO `th_usuarios` VALUES 
(1,'2019-04-12 17:20:56.472662',NULL,b'1','sysdevel@pti.org.br','Administrador','admin','$2a$12$WgCfB4Ahb1e5Lqu.ppvXrenH.OXQ86cCZInnmAPHaU2UHMT1Rthke'),
(2,'2019-04-12 17:20:57.180860',NULL,b'1','portalmp@pti.org.br','Integrador','integrador','$2a$12$eiQv2r4IibdUc7XEwmYqX.tjwnYivZNsEUSp1wAEIz/ps7S74djiG'),
(3,'2019-04-12 17:20:59.431681',NULL,b'1','portalmp@pti.org.br','Visualizador','visualizador','$2a$12$HbpXTlXV/Io8Ma631FSwQ.oh.O4kvq1SaOxIRl2v7Hcnjye1e7qzu');
/*!40000 ALTER TABLE `th_usuarios` ENABLE KEYS */;

-- Copiando estrutura para tabela wp_veracruz.th_usuarios_audit
CREATE TABLE IF NOT EXISTS `th_usuarios_audit` (
  `id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `revision_type` tinyint(4) DEFAULT NULL,
  `ativo` bit(1) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `nome` varchar(90) DEFAULT NULL,
  `nome_usuario` varchar(45) DEFAULT NULL,
  `senha` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`revision`),
  KEY `FK1st6ntty1espn2fjrlah5u6e0` (`revision`),
  CONSTRAINT `FK1st6ntty1espn2fjrlah5u6e0` FOREIGN KEY (`revision`) REFERENCES `th_revisions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Copiando dados para a tabela wp_veracruz.th_usuarios_audit: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `th_usuarios_audit` DISABLE KEYS */;
INSERT IGNORE INTO `th_usuarios_audit` VALUES 
(1,1,0,b'1','sysdevel@pti.org.br','Administrador','admin','$2a$12$WgCfB4Ahb1e5Lqu.ppvXrenH.OXQ86cCZInnmAPHaU2UHMT1Rthke'),
(1,10,1,b'1','sysdevel@pti.org.br','Administrador','admin','$2a$12$WgCfB4Ahb1e5Lqu.ppvXrenH.OXQ86cCZInnmAPHaU2UHMT1Rthke'),
(2,2,0,b'1','sysdevel@pti.org.br','Integrador','integrador','$2a$12$eiQv2r4IibdUc7XEwmYqX.tjwnYivZNsEUSp1wAEIz/ps7S74djiG'),
(2,11,1,b'1','sysdevel@pti.org.br','Integrador','integrador','$2a$12$eiQv2r4IibdUc7XEwmYqX.tjwnYivZNsEUSp1wAEIz/ps7S74djiG'),
(3,9,0,b'1','portalmp@pti.org.br','Visualizador','visualizador','$2a$12$HbpXTlXV/Io8Ma631FSwQ.oh.O4kvq1SaOxIRl2v7Hcnjye1e7qzu'),
(3,12,1,b'1','portalmp@pti.org.br','Visualizador','visualizador','$2a$12$HbpXTlXV/Io8Ma631FSwQ.oh.O4kvq1SaOxIRl2v7Hcnjye1e7qzu');
/*!40000 ALTER TABLE `th_usuarios_audit` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;