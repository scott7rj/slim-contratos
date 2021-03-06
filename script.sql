/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.5026)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [DB7289_CONTRATOS_DES]
GO
/****** Object:  User [s728901]    Script Date: 25/11/2020 08:06:19 ******/
CREATE USER [s728901] FOR LOGIN [s728901] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s728901]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [s728901]
GO
/****** Object:  Schema [contratos]    Script Date: 25/11/2020 08:06:19 ******/
CREATE SCHEMA [contratos]
GO
/****** Object:  Table [contratos].[tb_tipos_documento]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_tipos_documento](
	[id_tipo_documento] [tinyint] IDENTITY(1,1) NOT NULL,
	[tipo_documento] [varchar](50) NOT NULL,
	[possui_validade] [bit] NOT NULL,
	[id_dominio_documento] [tinyint] NOT NULL,
	[ativo] [bit] NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_tipos_documento] PRIMARY KEY CLUSTERED 
(
	[id_tipo_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contratos].[tb_dominios_documento]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_dominios_documento](
	[id_dominio_documento] [tinyint] NOT NULL,
	[dominio_documento] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tb_dominios_documento] PRIMARY KEY CLUSTERED 
(
	[id_dominio_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_tipo_documento_selecionar_por_id_dominio_documento]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_tipo_documento_selecionar_por_id_dominio_documento]
(	
	@id_dominio_documento tinyint
)
RETURNS TABLE
AS
RETURN 
(
	/* manter a.id_dominio_documento por causa dos testes */
	SELECT a.id_tipo_documento, a.tipo_documento, a.possui_validade, a.id_dominio_documento, b.dominio_documento
	FROM [contratos].[tb_tipos_documento] a
		LEFT JOIN [contratos].[tb_dominios_documento] b ON a.id_dominio_documento = b.id_dominio_documento
	WHERE a.id_dominio_documento = @id_dominio_documento
)
GO
/****** Object:  Table [contratos].[tb_documentos]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_documentos](
	[id_documento] [bigint] IDENTITY(1,1) NOT NULL,
	[id_tipo_documento] [tinyint] NOT NULL,
	[id_empresa] [smallint] NULL,
	[id_contrato] [int] NULL,
	[id_ateste_pagamento] [int] NULL,
	[id_penalidade] [int] NULL,
	[data_validade] [date] NULL,
	[nome_documento] [varchar](255) NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [varchar](50) NOT NULL,
	[observacao] [varchar](8000) NULL,
 CONSTRAINT [PK_tb_documentos] PRIMARY KEY CLUSTERED 
(
	[id_documento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_documento_selecionar_por_id_empresa]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_documento_selecionar_por_id_empresa](@id_empresa smallint)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_documento, a.id_tipo_documento, b.tipo_documento, a.id_empresa, FORMAT(a.data_validade, 'd', 'pt-BR') data_validade, a.nome_documento, a.observacao
	FROM [contratos].[tb_documentos] a
		LEFT JOIN [contratos].[tb_tipos_documento] b ON a.id_tipo_documento = b.id_tipo_documento
	WHERE a.id_empresa = @id_empresa
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_documento_selecionar_por_id_contrato]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_documento_selecionar_por_id_contrato](@id_contrato int)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_documento, a.id_tipo_documento, b.tipo_documento, a.id_contrato, FORMAT(a.data_validade, 'd', 'pt-BR') data_validade, a.nome_documento, a.observacao
	FROM [contratos].[tb_documentos] a
		LEFT JOIN [contratos].[tb_tipos_documento] b ON a.id_tipo_documento = b.id_tipo_documento
	WHERE a.id_contrato = @id_contrato
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_documento_selecionar_por_id_ateste_pagamento]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_documento_selecionar_por_id_ateste_pagamento](@id_ateste_pagamento int)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_documento, a.id_tipo_documento, b.tipo_documento, a.id_ateste_pagamento, FORMAT(a.data_validade, 'd', 'pt-BR') data_validade, a.nome_documento, a.observacao
	FROM [contratos].[tb_documentos] a
		LEFT JOIN [contratos].[tb_tipos_documento] b ON a.id_tipo_documento = b.id_tipo_documento
	WHERE a.id_ateste_pagamento = @id_ateste_pagamento
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_documento_selecionar_por_id_penalidade]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_documento_selecionar_por_id_penalidade](@id_penalidade int)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_documento, a.id_tipo_documento, b.tipo_documento, a.id_penalidade, FORMAT(a.data_validade, 'd', 'pt-BR') data_validade, a.nome_documento, a.observacao
	FROM [contratos].[tb_documentos] a
		LEFT JOIN [contratos].[tb_tipos_documento] b ON a.id_tipo_documento = b.id_tipo_documento
	WHERE a.id_penalidade = @id_penalidade
)
GO
/****** Object:  Table [contratos].[tb_empresas]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_empresas](
	[id_empresa] [smallint] IDENTITY(1,1) NOT NULL,
	[empresa] [varchar](200) NOT NULL,
	[cnpj] [bigint] NOT NULL,
	[endereco] [varchar](20) NOT NULL,
	[cidade] [varchar](100) NOT NULL,
	[uf] [char](2) NOT NULL,
	[cep] [bigint] NOT NULL,
	[observacao] [varchar](8000) NOT NULL,
	[ativo] [bit] NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_empresas] PRIMARY KEY CLUSTERED 
(
	[id_empresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_empresa_selecionar_por_id]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_empresa_selecionar_por_id](@id_empresa smallint)
RETURNS TABLE
AS
RETURN
(
	SELECT id_empresa, empresa, cnpj, endereco, cidade, uf, cep, observacao, ativo, ultima_alteracao, usuario_alteracao
	FROM [contratos].[tb_empresas]
	WHERE id_empresa = @id_empresa
)
GO
/****** Object:  Table [contratos].[tb_contratos]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_contratos](
	[id_contrato] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [smallint] NOT NULL,
	[id_tipo_contrato] [tinyint] NOT NULL,
	[numero_processo] [varchar](30) NULL,
	[numero_ordem_servico] [bigint] NULL,
	[data_assinatura] [date] NULL,
	[data_inicio_vigencia] [date] NOT NULL,
	[data_fim_vigencia] [date] NOT NULL,
	[valor_global_inicial] [decimal](19, 2) NOT NULL,
	[valor_global_atualizado] [decimal](19, 2) NULL,
	[objeto_contratual] [varchar](8000) NOT NULL,
	[dia_pagamento] [tinyint] NOT NULL,
	[dia_pagamento_corridos] [bit] NULL,
	[prazo_alerta_dias_pagamento] [tinyint] NOT NULL,
	[prazo_alerta_dias_ateste] [tinyint] NOT NULL,
	[prazo_alerta_dias_nota_fiscal] [tinyint] NOT NULL,
	[prazo_alerta_meses_fim_vigencia] [tinyint] NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_contratos] PRIMARY KEY CLUSTERED 
(
	[id_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contratos].[tb_tipos_contrato]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_tipos_contrato](
	[id_tipo_contrato] [tinyint] IDENTITY(1,1) NOT NULL,
	[tipo_contrato] [varchar](50) NOT NULL,
	[ativo] [bit] NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_tipos_contrato] PRIMARY KEY CLUSTERED 
(
	[id_tipo_contrato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_contrato_selecionar_por_id_empresa]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_contrato_selecionar_por_id_empresa]( @id_empresa int)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_contrato
		 , a.id_empresa
		 , b.empresa
		 , a.id_tipo_contrato
		 , c.tipo_contrato
		 , a.numero_processo
		 , a.numero_ordem_servico
		 , CONVERT(VARCHAR, a.data_assinatura, 103) AS data_assinatura
		 , CONVERT(VARCHAR, a.data_inicio_vigencia, 103) AS data_inicio_vigencia
		 , CONVERT(VARCHAR, a.data_fim_vigencia, 103) AS data_fim_vigencia
		 , a.valor_global_inicial
		 , a.valor_global_atualizado
		 , a.objeto_contratual
		 , a.dia_pagamento
		 , a.dia_pagamento_corridos
		 , a.prazo_alerta_dias_pagamento
		 , a.prazo_alerta_dias_ateste
		 , a.prazo_alerta_dias_nota_fiscal
		 , a.prazo_alerta_meses_fim_vigencia
		 , a.ultima_alteracao
		 , a.usuario_alteracao
	FROM [contratos].[tb_contratos] a
		LEFT JOIN [contratos].[tb_empresas] b ON a.id_empresa = b.id_empresa
		LEFT JOIN [contratos].[tb_tipos_contrato] c ON a.id_tipo_contrato = c.id_tipo_contrato
	WHERE a.id_empresa = @id_empresa
)
GO
/****** Object:  Table [contratos].[tb_tipos_penalidade]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_tipos_penalidade](
	[id_tipo_penalidade] [tinyint] IDENTITY(1,1) NOT NULL,
	[tipo_penalidade] [varchar](70) NULL,
	[ativo] [bit] NOT NULL,
	[ultima_alteracao] [datetime2](3) NULL,
	[usuario_alteracao] [char](7) NULL,
 CONSTRAINT [PK_tb_tipos_penalidade] PRIMARY KEY CLUSTERED 
(
	[id_tipo_penalidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_tipo_penalidade_selecionar]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_tipo_penalidade_selecionar]
(	
	@ativo bit
)
RETURNS TABLE
AS
RETURN 
(
	SELECT id_tipo_penalidade, tipo_penalidade, ativo, usuario_alteracao
	FROM [contratos].[tb_tipos_penalidade]
	WHERE ativo = @ativo
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_contrato_selecionar_por_id]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_contrato_selecionar_por_id](@id_contrato int)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_contrato
		 , a.id_empresa
		 , c.empresa
		 , a.id_tipo_contrato
		 , b.tipo_contrato
		 , a.numero_processo
		 , a.numero_ordem_servico
		 , CONVERT(VARCHAR, a.data_assinatura, 103) AS data_assinatura
		 , CONVERT(VARCHAR, a.data_inicio_vigencia, 103) AS data_inicio_vigencia
		 , CONVERT(VARCHAR, a.data_fim_vigencia, 103) AS data_fim_vigencia
		 , a.valor_global_inicial
		 , a.valor_global_atualizado
		 , a.objeto_contratual
		 , a.dia_pagamento
		 , a.dia_pagamento_corridos
		 , a.prazo_alerta_dias_pagamento
		 , a.prazo_alerta_dias_ateste
		 , a.prazo_alerta_dias_nota_fiscal
		 , a.prazo_alerta_meses_fim_vigencia
		 , a.ultima_alteracao
		 , a.usuario_alteracao
	FROM [contratos].[tb_contratos] a
		LEFT JOIN [contratos].[tb_tipos_contrato] b ON a.id_tipo_contrato = b.id_tipo_contrato
		LEFT JOIN [contratos].[tb_empresas] c ON a.id_empresa = c.id_empresa
	WHERE id_contrato = @id_contrato
)
GO
/****** Object:  Table [contratos].[tb_compromissos_siplo]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_compromissos_siplo](
	[id_compromisso_siplo] [int] IDENTITY(1,1) NOT NULL,
	[compromisso_siplo] [char](12) NOT NULL,
	[id_contrato] [int] NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_compromissos_siplo] PRIMARY KEY CLUSTERED 
(
	[id_compromisso_siplo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_compromisso_siplo_selecionar_por_id_contrato]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_compromisso_siplo_selecionar_por_id_contrato]
(	
	@id_contrato int
)
RETURNS TABLE
AS
RETURN 
(
	SELECT id_compromisso_siplo, compromisso_siplo, id_contrato
	FROM [contratos].[tb_compromissos_siplo]
	WHERE id_contrato = @id_contrato
)
GO
/****** Object:  Table [contratos].[tb_emails]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_emails](
	[id_email] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [smallint] NOT NULL,
	[id_tipo_contato] [tinyint] NOT NULL,
	[email] [varchar](100) NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_emails] PRIMARY KEY CLUSTERED 
(
	[id_email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contratos].[tb_tipos_contato]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_tipos_contato](
	[id_tipo_contato] [tinyint] IDENTITY(1,1) NOT NULL,
	[tipo_contato] [varchar](50) NOT NULL,
	[ativo] [bit] NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [pk_id_tipo_contato] PRIMARY KEY CLUSTERED 
(
	[id_tipo_contato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_email_selecionar_por_id_empresa]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_email_selecionar_por_id_empresa](@id_empresa smallint)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_email, a.id_empresa, a.id_tipo_contato, b.tipo_contato, a.email
	FROM [contratos].[tb_emails] a
		LEFT JOIN [contratos].[tb_tipos_contato] b ON a.id_tipo_contato = b.id_tipo_contato
	WHERE id_empresa = @id_empresa
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_tipo_documento_selecionar]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_tipo_documento_selecionar]
(	
	@ativo bit
)
RETURNS TABLE
AS
RETURN 
(
	/* manter a.id_dominio_documento por causa dos testes */
	SELECT a.id_tipo_documento, a.tipo_documento, a.possui_validade, a.id_dominio_documento, b.dominio_documento, a.ativo
	FROM [contratos].[tb_tipos_documento] a
		LEFT JOIN [contratos].[tb_dominios_documento] b ON a.id_dominio_documento = b.id_dominio_documento
	WHERE ativo = @ativo
)
GO
/****** Object:  Table [contratos].[tbr_contratos_tipos_penalidade]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tbr_contratos_tipos_penalidade](
	[id_contrato] [int] NOT NULL,
	[id_tipo_penalidade] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbr_contratos_tipos_penalidade] PRIMARY KEY CLUSTERED 
(
	[id_contrato] ASC,
	[id_tipo_penalidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_tipo_penalidade_selecionar_por_id_contrato]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_tipo_penalidade_selecionar_por_id_contrato]
(	
	  @id_contrato int
	, @ativo bit
)
RETURNS TABLE
AS
RETURN 
(
	SELECT a.id_tipo_penalidade, a.tipo_penalidade, IIF(b.id_contrato IS NULL, 0, 1) checked
	FROM [contratos].[tb_tipos_penalidade] a
		LEFT JOIN [contratos].[tbr_contratos_tipos_penalidade] b ON a.id_tipo_penalidade = b.id_tipo_penalidade
																AND b.id_contrato = @id_contrato
	WHERE a.ativo = @ativo
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_dominio_documento_selecionar]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_dominio_documento_selecionar]()
RETURNS TABLE
AS
RETURN 
(
	SELECT id_dominio_documento, dominio_documento
	FROM [contratos].[tb_dominios_documento]
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_tipo_penalidade_selecionar_por_id]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_tipo_penalidade_selecionar_por_id]
(	
	@id_tipo_penalidade tinyint
)
RETURNS TABLE
AS
RETURN 
(
	SELECT id_tipo_penalidade, tipo_penalidade, ativo, usuario_alteracao
	FROM [contratos].[tb_tipos_penalidade]
	WHERE id_tipo_penalidade = @id_tipo_penalidade
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_tipo_contrato_selecionar_por_id]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_tipo_contrato_selecionar_por_id]
(	
	@id_tipo_contrato tinyint
)
RETURNS TABLE
AS
RETURN 
(
	SELECT id_tipo_contrato, tipo_contrato, ativo, usuario_alteracao
	FROM [contratos].[tb_tipos_contrato]
	WHERE id_tipo_contrato = @id_tipo_contrato
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_empresa_selecionar_por_cnpj]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_empresa_selecionar_por_cnpj](@cnpj bigint)
RETURNS TABLE
AS
RETURN
(
	SELECT id_empresa, empresa, cnpj, endereco, cidade, uf, cep, observacao, ativo, ultima_alteracao, usuario_alteracao
	FROM [contratos].[tb_empresas]
	WHERE cnpj = @cnpj
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_tipo_contrato_selecionar]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_tipo_contrato_selecionar]
(	
	@ativo bit
)
RETURNS TABLE
AS
RETURN 
(
	SELECT id_tipo_contrato, tipo_contrato, ativo, usuario_alteracao
	FROM [contratos].[tb_tipos_contrato]
	WHERE ativo = @ativo
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_empresa_selecionar_por_cnpj_nome]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_empresa_selecionar_por_cnpj_nome](@empresa varchar(200))
RETURNS TABLE
AS
RETURN
(
	SELECT id_empresa, empresa, cnpj, endereco, cidade, uf, cep, observacao, ativo, ultima_alteracao, usuario_alteracao
	FROM [contratos].[tb_empresas]
	WHERE empresa LIKE CONCAT('%', @empresa, '%')
)
GO
/****** Object:  Table [contratos].[tb_itens]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_itens](
	[id_item] [int] IDENTITY(1,1) NOT NULL,
	[item] [varchar](50) NOT NULL,
	[id_contrato] [int] NULL,
	[ativo] [bit] NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_itens] PRIMARY KEY CLUSTERED 
(
	[id_item] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_item_selecionar_por_id_contrato]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_item_selecionar_por_id_contrato](@id_contrato int)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_item, a.item, a.id_contrato, a.ativo
	FROM [contratos].[tb_itens] a
	WHERE a.id_contrato = @id_contrato
	AND a.ativo = 1
)
GO
/****** Object:  Table [contratos].[tb_uf]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_uf](
	[uf] [char](2) NOT NULL,
	[nome_uf] [varchar](200) NOT NULL,
 CONSTRAINT [PK_tb_uf] PRIMARY KEY CLUSTERED 
(
	[uf] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_uf_selecionar]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_uf_selecionar]()
RETURNS TABLE
AS
RETURN 
(
	SELECT uf, nome_uf
	FROM [contratos].[tb_uf]
)
GO
/****** Object:  Table [contratos].[tb_subitens]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_subitens](
	[id_subitem] [int] IDENTITY(1,1) NOT NULL,
	[subitem] [varchar](50) NOT NULL,
	[id_item] [int] NOT NULL,
	[qtd] [int] NOT NULL,
	[valor_unitario] [decimal](19, 2) NOT NULL,
	[ativo] [bit] NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_subitens] PRIMARY KEY CLUSTERED 
(
	[id_subitem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_subitem_selecionar_por_id_item]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_subitem_selecionar_por_id_item](@id_item int)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_subitem, a.subitem, a.id_item, a.ativo
	FROM [contratos].[tb_subitens] a
	WHERE a.id_item = @id_item
	AND a.ativo = 1
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_subitem_selecionar_por_id_contrato]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_subitem_selecionar_por_id_contrato](@id_contrato int)
RETURNS TABLE
AS
RETURN
(
	SELECT a.id_subitem, a.subitem, a.id_item, a.qtd, a.valor_unitario, b.id_contrato, a.ativo
	FROM [contratos].[tb_subitens] a
	LEFT JOIN [contratos].[tb_itens] b ON a.id_item = b.id_item
	WHERE b.id_contrato = @id_contrato
	AND a.ativo = 1
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_tipo_contato_selecionar]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_tipo_contato_selecionar]
(	
	@ativo bit
)
RETURNS TABLE
AS
RETURN 
(
	SELECT id_tipo_contato, tipo_contato, ativo, usuario_alteracao
	FROM [contratos].[tb_tipos_contato]
	WHERE ativo = @ativo
)
GO
/****** Object:  UserDefinedFunction [contratos].[fn_empresa_selecionar]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [contratos].[fn_empresa_selecionar](@ativo bit)
RETURNS TABLE
AS
RETURN
(
	SELECT id_empresa, empresa, cnpj, endereco, cidade, uf, cep, observacao, ultima_alteracao, usuario_alteracao, ativo
	FROM [contratos].[tb_empresas]
	WHERE ativo = @ativo
)
GO
/****** Object:  Table [contratos].[tb_telefones]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_telefones](
	[id_telefone] [int] IDENTITY(1,1) NOT NULL,
	[id_empresa] [smallint] NOT NULL,
	[id_tipo_contato] [tinyint] NOT NULL,
	[telefone] [varchar](11) NOT NULL,
	[ultima_alteracao] [datetime2](3) NOT NULL,
	[usuario_alteracao] [char](7) NOT NULL,
 CONSTRAINT [PK_tb_telefones] PRIMARY KEY CLUSTERED 
(
	[id_telefone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [contratos].[fn_telefone_selecionar_por_id_empresa]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [contratos].[fn_telefone_selecionar_por_id_empresa](@id_empresa smallint)
RETURNS TABLE
AS
RETURN
(
	/* não retirar id_tipo_contato senão quebram os testes*/
	SELECT a.id_telefone, a.id_empresa, a.id_tipo_contato, b.tipo_contato, a.telefone
	FROM [contratos].[tb_telefones]	a
		LEFT JOIN [contratos].[tb_tipos_contato] b ON a.id_tipo_contato = b.id_tipo_contato
	WHERE id_empresa = @id_empresa
)
GO
/****** Object:  Table [contratos].[tb_ateste_pagamento]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_ateste_pagamento](
	[id_ateste_pagamento] [int] NOT NULL,
 CONSTRAINT [PK_tb_ateste_pagamento] PRIMARY KEY CLUSTERED 
(
	[id_ateste_pagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [contratos].[tb_penalidades]    Script Date: 25/11/2020 08:06:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [contratos].[tb_penalidades](
	[id_penalidade] [int] NOT NULL,
 CONSTRAINT [PK_tb_penalidades] PRIMARY KEY CLUSTERED 
(
	[id_penalidade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [contratos].[tb_compromissos_siplo] ON 

INSERT [contratos].[tb_compromissos_siplo] ([id_compromisso_siplo], [compromisso_siplo], [id_contrato], [ultima_alteracao], [usuario_alteracao]) VALUES (2, N'1234562018MZ', 1, CAST(N'2020-11-18T21:06:52.1230000' AS DateTime2), N'c110611')
INSERT [contratos].[tb_compromissos_siplo] ([id_compromisso_siplo], [compromisso_siplo], [id_contrato], [ultima_alteracao], [usuario_alteracao]) VALUES (3, N'9876542020SP', 1, CAST(N'2020-11-19T10:06:03.0230000' AS DateTime2), N'c110611')
INSERT [contratos].[tb_compromissos_siplo] ([id_compromisso_siplo], [compromisso_siplo], [id_contrato], [ultima_alteracao], [usuario_alteracao]) VALUES (8, N'2222222222MM', 4, CAST(N'2020-11-20T14:14:30.6300000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_compromissos_siplo] ([id_compromisso_siplo], [compromisso_siplo], [id_contrato], [ultima_alteracao], [usuario_alteracao]) VALUES (9, N'222222/2222-', 5, CAST(N'2020-11-20T14:39:12.3800000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_compromissos_siplo] ([id_compromisso_siplo], [compromisso_siplo], [id_contrato], [ultima_alteracao], [usuario_alteracao]) VALUES (10, N'6666666666ZM', 6, CAST(N'2020-11-20T14:41:58.1100000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_compromissos_siplo] ([id_compromisso_siplo], [compromisso_siplo], [id_contrato], [ultima_alteracao], [usuario_alteracao]) VALUES (11, N'5555555555MM', 1, CAST(N'2020-11-24T14:57:35.1530000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_compromissos_siplo] ([id_compromisso_siplo], [compromisso_siplo], [id_contrato], [ultima_alteracao], [usuario_alteracao]) VALUES (12, N'7897897987DD', 4, CAST(N'2020-11-24T14:59:01.2500000' AS DateTime2), N'C137703')
SET IDENTITY_INSERT [contratos].[tb_compromissos_siplo] OFF
SET IDENTITY_INSERT [contratos].[tb_contratos] ON 

INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (1, 33, 1, N'123456', 999999, NULL, CAST(N'2020-01-01' AS Date), CAST(N'2025-01-01' AS Date), CAST(1000000.00 AS Decimal(19, 2)), NULL, N'Objeto X', 1, NULL, 10, 10, 10, 10, CAST(N'2020-11-14T14:56:22.2330000' AS DateTime2), N'c110611')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (2, 33, 2, N'555555', 999999, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), CAST(N'2025-01-01' AS Date), CAST(10.00 AS Decimal(19, 2)), CAST(20.99 AS Decimal(19, 2)), N'Objeto Ação', 1, 0, 10, 10, 10, 10, CAST(N'2020-11-20T10:50:58.8000000' AS DateTime2), N'c110611')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (3, 33, 3, N'555555', 999999, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-01' AS Date), CAST(N'2025-01-01' AS Date), CAST(10.00 AS Decimal(19, 2)), CAST(20.99 AS Decimal(19, 2)), N'Objeto XPTO', 1, 0, 10, 10, 10, 10, CAST(N'2020-11-18T19:02:29.2530000' AS DateTime2), N'c110611')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (4, 2, 2, N'123', 789, CAST(N'2018-01-01' AS Date), CAST(N'2018-01-10' AS Date), CAST(N'2023-01-01' AS Date), CAST(1600000.00 AS Decimal(19, 2)), NULL, N'PROGRAMA DE PONTOS.', 12, 0, 13, 13, 15, 8, CAST(N'2020-11-20T08:11:44.9730000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (5, 2, 5, N'858512', 46, CAST(N'2017-05-12' AS Date), CAST(N'2017-05-14' AS Date), CAST(N'2028-05-01' AS Date), CAST(2400000.00 AS Decimal(19, 2)), NULL, N'CONTRATAÃ‡ÃƒO.', 8, 0, 2, 8, 17, 10, CAST(N'2020-11-20T08:15:52.1270000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (6, 2, 4, N'56784', 36959, CAST(N'2018-09-12' AS Date), CAST(N'2018-09-15' AS Date), CAST(N'2025-09-01' AS Date), CAST(18000.00 AS Decimal(19, 2)), NULL, N'ATENDIMENTO JURÃDICO', 2, 1, 5, 6, 10, 12, CAST(N'2020-11-20T08:19:26.7030000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (7, 2, 4, N'8989', 12, CAST(N'2020-07-30' AS Date), CAST(N'2020-08-15' AS Date), CAST(N'2022-08-19' AS Date), CAST(170000.00 AS Decimal(19, 2)), NULL, N'ATENDIMENTO SIACH', 8, 1, 5, 6, 8, 9, CAST(N'2020-11-20T08:21:57.1970000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (8, 2, 4, N'26546', 615464, CAST(N'2020-06-06' AS Date), CAST(N'2020-06-06' AS Date), CAST(N'2020-06-06' AS Date), CAST(1700000.00 AS Decimal(19, 2)), NULL, N'dfhgfjhk', 6, 1, 1, 7, 14, 12, CAST(N'2020-11-20T08:27:15.2070000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (9, 2, 1, N'986532', 26, CAST(N'2018-06-26' AS Date), CAST(N'2020-06-26' AS Date), CAST(N'2026-06-26' AS Date), CAST(250000.00 AS Decimal(19, 2)), NULL, N'oibnsoighpidsbhgfpvndskllcvnadldg', 1, 1, 8, 9, 10, 10, CAST(N'2020-11-20T08:29:50.3800000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_contratos] ([id_contrato], [id_empresa], [id_tipo_contrato], [numero_processo], [numero_ordem_servico], [data_assinatura], [data_inicio_vigencia], [data_fim_vigencia], [valor_global_inicial], [valor_global_atualizado], [objeto_contratual], [dia_pagamento], [dia_pagamento_corridos], [prazo_alerta_dias_pagamento], [prazo_alerta_dias_ateste], [prazo_alerta_dias_nota_fiscal], [prazo_alerta_meses_fim_vigencia], [ultima_alteracao], [usuario_alteracao]) VALUES (10, 2, 1, N'756512', 89, CAST(N'2018-02-20' AS Date), CAST(N'2018-02-26' AS Date), CAST(N'2027-02-01' AS Date), CAST(900000.00 AS Decimal(19, 2)), NULL, N'ATENDIMENTO Ã“RGÃƒOS REGULADORES.', 10, 0, 1, 28, 28, 2, CAST(N'2020-11-20T11:53:01.3930000' AS DateTime2), N'C137703')
SET IDENTITY_INSERT [contratos].[tb_contratos] OFF
SET IDENTITY_INSERT [contratos].[tb_documentos] ON 

INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (13, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379036.7z', CAST(N'2020-11-12T07:45:38.9570000' AS DateTime2), N'C110611', N'ÂÁÀÃÇ')
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (14, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379036.zip', CAST(N'2020-11-12T08:10:18.5600000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (15, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379037.7z', CAST(N'2020-11-12T10:43:59.3430000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (16, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379038.7z', CAST(N'2020-11-12T10:44:17.2400000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (17, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379040.7z', CAST(N'2020-11-12T10:44:36.7500000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (18, 1, 32, NULL, NULL, NULL, CAST(N'2025-01-01' AS Date), N'20051600164058272379041.7z', CAST(N'2020-11-12T10:45:03.9200000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (19, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379042.7z', CAST(N'2020-11-12T10:45:27.4200000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (20, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379043.7z', CAST(N'2020-11-12T10:45:44.8730000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (21, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379044.7z', CAST(N'2020-11-12T10:46:00.6870000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (22, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379045.7z', CAST(N'2020-11-12T10:46:34.8470000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (23, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379046.7z', CAST(N'2020-11-12T10:46:52.8700000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (24, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379047.7z', CAST(N'2020-11-12T10:47:25.6330000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (25, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379048.7z', CAST(N'2020-11-12T10:47:40.9100000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (26, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379049.7z', CAST(N'2020-11-12T10:48:01.6400000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (27, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379050.7z', CAST(N'2020-11-12T10:48:18.1670000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (28, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379051.7z', CAST(N'2020-11-12T10:48:33.3470000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (29, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379052.7z', CAST(N'2020-11-12T10:48:55.4200000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (30, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379053.7z', CAST(N'2020-11-12T10:49:10.9330000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (31, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379054.7z', CAST(N'2020-11-12T10:49:29.8600000' AS DateTime2), N'C110611', NULL)
INSERT [contratos].[tb_documentos] ([id_documento], [id_tipo_documento], [id_empresa], [id_contrato], [id_ateste_pagamento], [id_penalidade], [data_validade], [nome_documento], [ultima_alteracao], [usuario_alteracao], [observacao]) VALUES (32, 5, 32, NULL, NULL, NULL, NULL, N'20051600164058272379055.7z', CAST(N'2020-11-12T10:49:46.9600000' AS DateTime2), N'C110611', NULL)
SET IDENTITY_INSERT [contratos].[tb_documentos] OFF
INSERT [contratos].[tb_dominios_documento] ([id_dominio_documento], [dominio_documento]) VALUES (1, N'EMPRESA')
INSERT [contratos].[tb_dominios_documento] ([id_dominio_documento], [dominio_documento]) VALUES (2, N'CONTRATO')
INSERT [contratos].[tb_dominios_documento] ([id_dominio_documento], [dominio_documento]) VALUES (3, N'ATESTE')
INSERT [contratos].[tb_dominios_documento] ([id_dominio_documento], [dominio_documento]) VALUES (4, N'PENALIDADE')
SET IDENTITY_INSERT [contratos].[tb_emails] ON 

INSERT [contratos].[tb_emails] ([id_email], [id_empresa], [id_tipo_contato], [email], [ultima_alteracao], [usuario_alteracao]) VALUES (6, 32, 9, N'teste@teste.com', CAST(N'2020-11-11T17:31:49.1100000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_emails] ([id_email], [id_empresa], [id_tipo_contato], [email], [ultima_alteracao], [usuario_alteracao]) VALUES (7, 32, 10, N'teste3@teste.com', CAST(N'2020-11-11T20:37:16.0600000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_emails] ([id_email], [id_empresa], [id_tipo_contato], [email], [ultima_alteracao], [usuario_alteracao]) VALUES (8, 32, 56, N'teste4@teste.com', CAST(N'2020-11-13T20:32:51.7170000' AS DateTime2), N'C110611')
SET IDENTITY_INSERT [contratos].[tb_emails] OFF
SET IDENTITY_INSERT [contratos].[tb_empresas] ON 

INSERT [contratos].[tb_empresas] ([id_empresa], [empresa], [cnpj], [endereco], [cidade], [uf], [cep], [observacao], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (1, N'CAIXA', 360305000104, N'SAUS 3/4', N'BRASÍLIA', N'DF', 77000100, N'Observação.', 0, CAST(N'2020-11-06T09:21:22.5500000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_empresas] ([id_empresa], [empresa], [cnpj], [endereco], [cidade], [uf], [cep], [observacao], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (2, N'ORBITALL ATENDIMENTO LTDA', 18081219000128, N'XQD 6 RUA 5 EDIFICIO', N'BRASÍLIA', N'DF', 78282300, N'Observação.', 1, CAST(N'2020-11-09T11:15:16.8030000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_empresas] ([id_empresa], [empresa], [cnpj], [endereco], [cidade], [uf], [cep], [observacao], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (30, N'AÇÃO', 85377365000192, N'RUA JOÃO XXIII', N'SÃO PAULO', N'DF', 12312312, N'', 1, CAST(N'2020-11-11T16:54:53.7970000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_empresas] ([id_empresa], [empresa], [cnpj], [endereco], [cidade], [uf], [cep], [observacao], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (31, N'ÁÂÀÃÕÇÄÄÚÛÙÉÊÈ', 88567762000115, N'ÁÂÀÃÕÇÄÄÚÛÙÉÊÈ', N'ÁÂÀÃÕÇÄÄÚÛÙÉÊÈ', N'DF', 12312312, N'ÁÂÀÃÕÇÄÄÚÛÙÉÊÈ', 0, CAST(N'2020-11-12T12:09:20.6330000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_empresas] ([id_empresa], [empresa], [cnpj], [endereco], [cidade], [uf], [cep], [observacao], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (32, N'ÕÓÒÖÔÇ', 18458571000130, N'ÕÓÒÖÔÇ', N'ÕÓÒÖÔÇ', N'DF', 40935931, N'ÕÓÒÖÔÇ', 1, CAST(N'2020-11-12T13:17:57.5530000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_empresas] ([id_empresa], [empresa], [cnpj], [endereco], [cidade], [uf], [cep], [observacao], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (33, N'Empresa ÉÊÈÊËÍÌÎÏ', 78792772000109, N'ÉÊÈÊËÍÌÎÏ', N'ÉÊÈÊËÍÌÎÏ', N'DF', 12345678, N'ÉÊÈÊËÍÌÎÏ', 1, CAST(N'2020-11-17T15:53:30.1830000' AS DateTime2), N'c110611')
INSERT [contratos].[tb_empresas] ([id_empresa], [empresa], [cnpj], [endereco], [cidade], [uf], [cep], [observacao], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (34, N'EMPRESA 2', 84580234000145, N'RUA JOÃO XXIII', N'SÃO PAULO', N'SP', 23131313, N'Rua João XXIII', 1, CAST(N'2020-11-24T16:48:10.2070000' AS DateTime2), N'C110611')
SET IDENTITY_INSERT [contratos].[tb_empresas] OFF
SET IDENTITY_INSERT [contratos].[tb_telefones] ON 

INSERT [contratos].[tb_telefones] ([id_telefone], [id_empresa], [id_tipo_contato], [telefone], [ultima_alteracao], [usuario_alteracao]) VALUES (11, 31, 8, N'12321321123', CAST(N'2020-11-11T17:07:33.1230000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_telefones] ([id_telefone], [id_empresa], [id_tipo_contato], [telefone], [ultima_alteracao], [usuario_alteracao]) VALUES (12, 32, 8, N'11987989797', CAST(N'2020-11-11T17:31:42.7330000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_telefones] ([id_telefone], [id_empresa], [id_tipo_contato], [telefone], [ultima_alteracao], [usuario_alteracao]) VALUES (13, 32, 9, N'12321313112', CAST(N'2020-11-11T20:37:08.4200000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_telefones] ([id_telefone], [id_empresa], [id_tipo_contato], [telefone], [ultima_alteracao], [usuario_alteracao]) VALUES (14, 32, 56, N'11334034834', CAST(N'2020-11-12T10:51:06.3900000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_telefones] ([id_telefone], [id_empresa], [id_tipo_contato], [telefone], [ultima_alteracao], [usuario_alteracao]) VALUES (15, 32, 10, N'11987987987', CAST(N'2020-11-12T10:51:12.9300000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_telefones] ([id_telefone], [id_empresa], [id_tipo_contato], [telefone], [ultima_alteracao], [usuario_alteracao]) VALUES (16, 32, 9, N'11989789898', CAST(N'2020-11-12T10:51:23.8200000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_telefones] ([id_telefone], [id_empresa], [id_tipo_contato], [telefone], [ultima_alteracao], [usuario_alteracao]) VALUES (17, 32, 56, N'13132131321', CAST(N'2020-11-13T20:32:42.2630000' AS DateTime2), N'C110611')
SET IDENTITY_INSERT [contratos].[tb_telefones] OFF
SET IDENTITY_INSERT [contratos].[tb_tipos_contato] ON 

INSERT [contratos].[tb_tipos_contato] ([id_tipo_contato], [tipo_contato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (8, N'CONTABILIDADE', 1, CAST(N'2020-11-07T15:27:22.4530000' AS DateTime2), N'c999999')
INSERT [contratos].[tb_tipos_contato] ([id_tipo_contato], [tipo_contato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (9, N'DIRETORIA', 1, CAST(N'2020-11-09T10:30:04.2200000' AS DateTime2), N'c999999')
INSERT [contratos].[tb_tipos_contato] ([id_tipo_contato], [tipo_contato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (10, N'OPERAÇÃO', 1, CAST(N'2020-11-03T16:45:41.2500000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_tipos_contato] ([id_tipo_contato], [tipo_contato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (56, N'RH', 1, CAST(N'2020-11-10T14:56:38.9270000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contato] ([id_tipo_contato], [tipo_contato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (58, N'TI', 1, CAST(N'2020-11-12T15:19:21.7000000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contato] ([id_tipo_contato], [tipo_contato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (59, N'', 1, CAST(N'2020-11-20T13:56:00.8470000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_tipos_contato] ([id_tipo_contato], [tipo_contato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (60, N'suporte', 1, CAST(N'2020-11-24T16:18:52.1470000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contato] ([id_tipo_contato], [tipo_contato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (61, N'teste', 1, CAST(N'2020-11-24T17:24:58.8870000' AS DateTime2), N'C109724')
SET IDENTITY_INSERT [contratos].[tb_tipos_contato] OFF
SET IDENTITY_INSERT [contratos].[tb_tipos_contrato] ON 

INSERT [contratos].[tb_tipos_contrato] ([id_tipo_contrato], [tipo_contrato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (1, N'BANDEIRAS', 1, CAST(N'2020-11-13T12:42:27.8500000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contrato] ([id_tipo_contrato], [tipo_contrato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (2, N'PONTOS', 1, CAST(N'2020-11-13T12:42:49.7300000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contrato] ([id_tipo_contrato], [tipo_contrato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (3, N'CONCORRENCIAIS', 1, CAST(N'2020-11-13T12:43:01.1900000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contrato] ([id_tipo_contrato], [tipo_contrato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (4, N'DIVERSOS', 1, CAST(N'2020-11-13T12:43:09.4800000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contrato] ([id_tipo_contrato], [tipo_contrato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (5, N'PREGÃO', 1, CAST(N'2020-11-13T12:43:16.2500000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contrato] ([id_tipo_contrato], [tipo_contrato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (6, N'DIRETA', 1, CAST(N'2020-11-13T12:43:23.9670000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_contrato] ([id_tipo_contrato], [tipo_contrato], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (7, N'INEXIGIBILIDADE', 1, CAST(N'2020-11-13T12:43:30.6000000' AS DateTime2), N'C110611')
SET IDENTITY_INSERT [contratos].[tb_tipos_contrato] OFF
SET IDENTITY_INSERT [contratos].[tb_tipos_documento] ON 

INSERT [contratos].[tb_tipos_documento] ([id_tipo_documento], [tipo_documento], [possui_validade], [id_dominio_documento], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (1, N'CERTIDÃO NEGATIVA', 1, 1, 1, CAST(N'2020-11-04T16:13:02.5200000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_tipos_documento] ([id_tipo_documento], [tipo_documento], [possui_validade], [id_dominio_documento], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (5, N'ATA DE REUNIÃO - REPACTUAÇÃO COMPETÊNCIA 01/2020', 0, 1, 1, CAST(N'2020-11-05T12:09:10.4830000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_tipos_documento] ([id_tipo_documento], [tipo_documento], [possui_validade], [id_dominio_documento], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (6, N'ATESTE DE FATURA COMPETÊNCIA 08/2020', 0, 3, 1, CAST(N'2020-11-05T12:16:48.5100000' AS DateTime2), N'C137703')
INSERT [contratos].[tb_tipos_documento] ([id_tipo_documento], [tipo_documento], [possui_validade], [id_dominio_documento], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (15, N'RESCISÃO', 0, 1, 1, CAST(N'2020-11-12T14:19:33.1370000' AS DateTime2), N'C110611')
SET IDENTITY_INSERT [contratos].[tb_tipos_documento] OFF
SET IDENTITY_INSERT [contratos].[tb_tipos_penalidade] ON 

INSERT [contratos].[tb_tipos_penalidade] ([id_tipo_penalidade], [tipo_penalidade], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (1, N'ADVERTÊNCIA', 1, CAST(N'2020-11-17T13:57:38.6030000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_penalidade] ([id_tipo_penalidade], [tipo_penalidade], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (3, N'MULTA', 1, CAST(N'2020-11-17T13:57:38.6030000' AS DateTime2), N'C110611')
INSERT [contratos].[tb_tipos_penalidade] ([id_tipo_penalidade], [tipo_penalidade], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (4, N'IMPEDIMENTO DE CONTRATAR COM A CAIXA', 1, CAST(N'2020-11-18T19:06:01.5200000' AS DateTime2), N'c999999')
INSERT [contratos].[tb_tipos_penalidade] ([id_tipo_penalidade], [tipo_penalidade], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (10, N'IMPEDIMENTO DE LICITAR E CONTRATAR COM A ADMINISTRAÇÃO', 1, CAST(N'2020-11-18T19:06:39.6170000' AS DateTime2), N'c999999')
INSERT [contratos].[tb_tipos_penalidade] ([id_tipo_penalidade], [tipo_penalidade], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (11, N'RESSARCIMENTO, INDENIZAÇÃO', 1, CAST(N'2020-11-18T19:06:55.6000000' AS DateTime2), N'c999999')
INSERT [contratos].[tb_tipos_penalidade] ([id_tipo_penalidade], [tipo_penalidade], [ativo], [ultima_alteracao], [usuario_alteracao]) VALUES (12, N'RESCISÃO AMIGÁVEL E UNILATERAL E RESCISÃO POR INTERESSE DA EMPRESA', 1, CAST(N'2020-11-17T13:57:38.6030000' AS DateTime2), N'C110611')
SET IDENTITY_INSERT [contratos].[tb_tipos_penalidade] OFF
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'AC', N'Acre')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'AL', N'Alagoas')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'AM', N'Amazonas')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'AP', N'Amapá')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'BA', N'Bahia')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'CE', N'Ceará')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'DF', N'Distrifo Federal')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'ES', N'Espírito Santo')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'GO', N'Goiás')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'MA', N'Maranhão')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'MG', N'Minas Gerais')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'MS', N'Mato Grosso do Sul')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'MT', N'Mato Grosso')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'PA', N'Pará')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'PB', N'Paraíba')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'PE', N'Pernambuco')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'PI', N'Piauí')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'PR', N'Paraná')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'RJ', N'Rio de Janeiro')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'RN', N'Rio Grande do Norte')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'RO', N'Rondônia')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'RR', N'Roraima')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'RS', N'Rio Grande do Sul')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'SC', N'Santa Catarina')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'SE', N'Sergipe')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'SP', N'São Paulo')
INSERT [contratos].[tb_uf] ([uf], [nome_uf]) VALUES (N'TO', N'Tocantins')
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (1, 3)
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (1, 12)
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (4, 4)
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (6, 4)
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (6, 10)
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (10, 1)
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (10, 4)
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (10, 10)
INSERT [contratos].[tbr_contratos_tipos_penalidade] ([id_contrato], [id_tipo_penalidade]) VALUES (10, 11)
SET ANSI_PADDING ON
GO
/****** Object:  Index [uq_tipo_contato]    Script Date: 25/11/2020 08:06:21 ******/
ALTER TABLE [contratos].[tb_tipos_contato] ADD  CONSTRAINT [uq_tipo_contato] UNIQUE NONCLUSTERED 
(
	[tipo_contato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [contratos].[tb_empresas] ADD  CONSTRAINT [DF_tb_empresas_ativa]  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [contratos].[tb_itens] ADD  CONSTRAINT [DF_tb_itens_ativo]  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [contratos].[tb_subitens] ADD  CONSTRAINT [DF_tb_subitens_ativo]  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [contratos].[tb_tipos_contato] ADD  CONSTRAINT [df_tb_tipos_contato_ativo]  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [contratos].[tb_tipos_contrato] ADD  CONSTRAINT [DF_tb_tipos_contrato_ativo]  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [contratos].[tb_tipos_documento] ADD  CONSTRAINT [DF_tb_tipos_documento_possui_validade]  DEFAULT ((0)) FOR [possui_validade]
GO
ALTER TABLE [contratos].[tb_tipos_documento] ADD  CONSTRAINT [DF_tb_tipos_documento_ativo]  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [contratos].[tb_tipos_penalidade] ADD  CONSTRAINT [DF_tb_tipos_penalidade_ativo]  DEFAULT ((1)) FOR [ativo]
GO
ALTER TABLE [contratos].[tb_compromissos_siplo]  WITH CHECK ADD  CONSTRAINT [fk_tb_compromissos_siplo_tb_contratos] FOREIGN KEY([id_contrato])
REFERENCES [contratos].[tb_contratos] ([id_contrato])
GO
ALTER TABLE [contratos].[tb_compromissos_siplo] CHECK CONSTRAINT [fk_tb_compromissos_siplo_tb_contratos]
GO
ALTER TABLE [contratos].[tb_contratos]  WITH CHECK ADD  CONSTRAINT [fk_tb_contratos_tb_empresas] FOREIGN KEY([id_empresa])
REFERENCES [contratos].[tb_empresas] ([id_empresa])
GO
ALTER TABLE [contratos].[tb_contratos] CHECK CONSTRAINT [fk_tb_contratos_tb_empresas]
GO
ALTER TABLE [contratos].[tb_contratos]  WITH CHECK ADD  CONSTRAINT [fk_tb_contratos_tb_tipos_contrato] FOREIGN KEY([id_tipo_contrato])
REFERENCES [contratos].[tb_tipos_contrato] ([id_tipo_contrato])
GO
ALTER TABLE [contratos].[tb_contratos] CHECK CONSTRAINT [fk_tb_contratos_tb_tipos_contrato]
GO
ALTER TABLE [contratos].[tb_documentos]  WITH CHECK ADD  CONSTRAINT [fk_tb_documentos_tb_ateste_pagamento] FOREIGN KEY([id_ateste_pagamento])
REFERENCES [contratos].[tb_ateste_pagamento] ([id_ateste_pagamento])
GO
ALTER TABLE [contratos].[tb_documentos] CHECK CONSTRAINT [fk_tb_documentos_tb_ateste_pagamento]
GO
ALTER TABLE [contratos].[tb_documentos]  WITH CHECK ADD  CONSTRAINT [fk_tb_documentos_tb_contratos] FOREIGN KEY([id_contrato])
REFERENCES [contratos].[tb_contratos] ([id_contrato])
GO
ALTER TABLE [contratos].[tb_documentos] CHECK CONSTRAINT [fk_tb_documentos_tb_contratos]
GO
ALTER TABLE [contratos].[tb_documentos]  WITH CHECK ADD  CONSTRAINT [fk_tb_documentos_tb_empresas] FOREIGN KEY([id_empresa])
REFERENCES [contratos].[tb_empresas] ([id_empresa])
GO
ALTER TABLE [contratos].[tb_documentos] CHECK CONSTRAINT [fk_tb_documentos_tb_empresas]
GO
ALTER TABLE [contratos].[tb_documentos]  WITH CHECK ADD  CONSTRAINT [fk_tb_documentos_tb_penalidades] FOREIGN KEY([id_penalidade])
REFERENCES [contratos].[tb_penalidades] ([id_penalidade])
GO
ALTER TABLE [contratos].[tb_documentos] CHECK CONSTRAINT [fk_tb_documentos_tb_penalidades]
GO
ALTER TABLE [contratos].[tb_documentos]  WITH CHECK ADD  CONSTRAINT [fk_tb_documentos_tb_tipos_documento] FOREIGN KEY([id_tipo_documento])
REFERENCES [contratos].[tb_tipos_documento] ([id_tipo_documento])
GO
ALTER TABLE [contratos].[tb_documentos] CHECK CONSTRAINT [fk_tb_documentos_tb_tipos_documento]
GO
ALTER TABLE [contratos].[tb_emails]  WITH CHECK ADD  CONSTRAINT [fk_tb_emails_tb_empresas] FOREIGN KEY([id_empresa])
REFERENCES [contratos].[tb_empresas] ([id_empresa])
GO
ALTER TABLE [contratos].[tb_emails] CHECK CONSTRAINT [fk_tb_emails_tb_empresas]
GO
ALTER TABLE [contratos].[tb_emails]  WITH CHECK ADD  CONSTRAINT [fk_tb_emails_tb_tipos_contato] FOREIGN KEY([id_tipo_contato])
REFERENCES [contratos].[tb_tipos_contato] ([id_tipo_contato])
GO
ALTER TABLE [contratos].[tb_emails] CHECK CONSTRAINT [fk_tb_emails_tb_tipos_contato]
GO
ALTER TABLE [contratos].[tb_empresas]  WITH CHECK ADD  CONSTRAINT [fk_tb_empresas_tb_uf] FOREIGN KEY([uf])
REFERENCES [contratos].[tb_uf] ([uf])
GO
ALTER TABLE [contratos].[tb_empresas] CHECK CONSTRAINT [fk_tb_empresas_tb_uf]
GO
ALTER TABLE [contratos].[tb_itens]  WITH CHECK ADD  CONSTRAINT [fk_tb_itens_tb_contratos] FOREIGN KEY([id_contrato])
REFERENCES [contratos].[tb_contratos] ([id_contrato])
GO
ALTER TABLE [contratos].[tb_itens] CHECK CONSTRAINT [fk_tb_itens_tb_contratos]
GO
ALTER TABLE [contratos].[tb_subitens]  WITH CHECK ADD  CONSTRAINT [fk_tb_subitens_tb_itens] FOREIGN KEY([id_item])
REFERENCES [contratos].[tb_itens] ([id_item])
GO
ALTER TABLE [contratos].[tb_subitens] CHECK CONSTRAINT [fk_tb_subitens_tb_itens]
GO
ALTER TABLE [contratos].[tb_telefones]  WITH CHECK ADD  CONSTRAINT [fk_tb_telefones_tb_empresas] FOREIGN KEY([id_empresa])
REFERENCES [contratos].[tb_empresas] ([id_empresa])
GO
ALTER TABLE [contratos].[tb_telefones] CHECK CONSTRAINT [fk_tb_telefones_tb_empresas]
GO
ALTER TABLE [contratos].[tb_telefones]  WITH CHECK ADD  CONSTRAINT [fk_tb_telefones_tb_tipos_contato] FOREIGN KEY([id_tipo_contato])
REFERENCES [contratos].[tb_tipos_contato] ([id_tipo_contato])
GO
ALTER TABLE [contratos].[tb_telefones] CHECK CONSTRAINT [fk_tb_telefones_tb_tipos_contato]
GO
ALTER TABLE [contratos].[tb_tipos_documento]  WITH CHECK ADD  CONSTRAINT [fk_tb_tipos_documento_tb_dominios_documento] FOREIGN KEY([id_dominio_documento])
REFERENCES [contratos].[tb_dominios_documento] ([id_dominio_documento])
GO
ALTER TABLE [contratos].[tb_tipos_documento] CHECK CONSTRAINT [fk_tb_tipos_documento_tb_dominios_documento]
GO
ALTER TABLE [contratos].[tbr_contratos_tipos_penalidade]  WITH CHECK ADD  CONSTRAINT [fk_tbr_contratos_tipos_penalidade_tb_contratos] FOREIGN KEY([id_contrato])
REFERENCES [contratos].[tb_contratos] ([id_contrato])
GO
ALTER TABLE [contratos].[tbr_contratos_tipos_penalidade] CHECK CONSTRAINT [fk_tbr_contratos_tipos_penalidade_tb_contratos]
GO
ALTER TABLE [contratos].[tbr_contratos_tipos_penalidade]  WITH CHECK ADD  CONSTRAINT [fk_tbr_contratos_tipos_penalidade_tb_tipos_penalidade] FOREIGN KEY([id_tipo_penalidade])
REFERENCES [contratos].[tb_tipos_penalidade] ([id_tipo_penalidade])
GO
ALTER TABLE [contratos].[tbr_contratos_tipos_penalidade] CHECK CONSTRAINT [fk_tbr_contratos_tipos_penalidade_tb_tipos_penalidade]
GO
/****** Object:  StoredProcedure [contratos].[compromisso_siplo_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[compromisso_siplo_alterar]
	@id_compromisso_siplo int
  , @compromisso_siplo char(12)
  , @id_contrato int
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_compromissos_siplo] WHERE id_compromisso_siplo = @id_compromisso_siplo)
		BEGIN
			UPDATE [contratos].[tb_compromissos_siplo]
			SET compromisso_siplo = @compromisso_siplo 
			  , id_contrato = @id_contrato
			  , ultima_alteracao = GETDATE()
			  , usuario_alteracao = @usuario_alteracao
			WHERE id_compromisso_siplo = @id_compromisso_siplo;
			SET @mensagem = '1_Compromisso SIPLO "' + @compromisso_siplo + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Compromisso SIPLO "' + @compromisso_siplo + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Compromisso SIPLO "' + @compromisso_siplo + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[compromisso_siplo_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[compromisso_siplo_inserir]
	  @compromisso_siplo char(12)
	, @id_contrato int
	, @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_compromisso_siplo int

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_compromissos_siplo] WHERE compromisso_siplo = @compromisso_siplo AND id_contrato = @id_contrato)
		BEGIN
			INSERT INTO [contratos].[tb_compromissos_siplo](compromisso_siplo, id_contrato, ultima_alteracao, usuario_alteracao)
			VALUES (@compromisso_siplo, @id_contrato, GETDATE(), @usuario_alteracao);

			SET @id_compromisso_siplo = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Compromisso SIPLO "' + @compromisso_siplo + '" inserido com sucesso._' + CAST(@id_compromisso_siplo AS varchar)
		END 
		ELSE
			SET @mensagem = '0_Compromisso SIPLO "' + @compromisso_siplo + '" já existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Compromisso SIPLO "' + @compromisso_siplo + '" não inserido.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[compromisso_siplo_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[compromisso_siplo_remover]
	@id_compromisso_siplo int 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_compromissos_siplo] WHERE id_compromisso_siplo = @id_compromisso_siplo)
		BEGIN
			DELETE FROM [contratos].[tb_compromissos_siplo]
			WHERE id_compromisso_siplo = @id_compromisso_siplo;
			SET @mensagem = '1_Compromisso SIPLO removido com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Compromisso SIPLO não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Compromisso SIPLO não removido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[contrato_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[contrato_alterar]
	  @id_contrato int
	, @numero_processo varchar(30)
	, @numero_ordem_servico bigint
	, @data_assinatura date
	, @data_inicio_vigencia date
	, @data_fim_vigencia date
	, @valor_global_inicial decimal(19, 2)
	, @valor_global_atualizado decimal(19, 2)
	, @objeto_contratual varchar(8000)
	, @dia_pagamento tinyint
	, @dia_pagamento_corridos bit
	, @prazo_alerta_dias_pagamento tinyint
	, @prazo_alerta_dias_ateste tinyint
	, @prazo_alerta_dias_nota_fiscal tinyint
	, @prazo_alerta_meses_fim_vigencia tinyint
	, @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_contratos] WHERE id_contrato = @id_contrato)
		BEGIN
			UPDATE [contratos].[tb_contratos] SET numero_processo = @numero_processo
												, numero_ordem_servico = @numero_ordem_servico
												, data_assinatura = @data_assinatura
												, data_inicio_vigencia = @data_inicio_vigencia
												, data_fim_vigencia = @data_fim_vigencia
												, valor_global_inicial = @valor_global_inicial
												, valor_global_atualizado = @valor_global_atualizado
												, objeto_contratual = @objeto_contratual
												, dia_pagamento = @dia_pagamento
												, dia_pagamento_corridos = @dia_pagamento_corridos
												, prazo_alerta_dias_pagamento = @prazo_alerta_dias_pagamento
												, prazo_alerta_dias_ateste = @prazo_alerta_dias_ateste
												, prazo_alerta_dias_nota_fiscal = @prazo_alerta_dias_nota_fiscal
												, prazo_alerta_meses_fim_vigencia = @prazo_alerta_meses_fim_vigencia
												, ultima_alteracao = GETDATE()
												, usuario_alteracao = @usuario_alteracao
			WHERE id_contrato = @id_contrato
			SET @mensagem = '1_Contrato "' + @numero_processo + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Contrato "' + @numero_processo + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Contrato "' + @numero_processo + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[contrato_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[contrato_inserir]
	  @id_empresa smallint
	, @id_tipo_contrato tinyint
	, @numero_processo varchar(30)
	, @numero_ordem_servico bigint
	, @data_assinatura date
	, @data_inicio_vigencia date
	, @data_fim_vigencia date
	, @valor_global_inicial decimal(19, 2)
	, @valor_global_atualizado decimal(19, 2)
	, @objeto_contratual varchar(8000)
	, @dia_pagamento tinyint
	, @dia_pagamento_corridos bit
	, @prazo_alerta_dias_pagamento tinyint
	, @prazo_alerta_dias_ateste tinyint
	, @prazo_alerta_dias_nota_fiscal tinyint
	, @prazo_alerta_meses_fim_vigencia tinyint
	, @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_contrato int

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_contratos] WHERE numero_processo = @numero_processo)
		BEGIN
			INSERT INTO [contratos].[tb_contratos](
				  id_empresa
				, id_tipo_contrato
				, numero_processo
				, numero_ordem_servico
				, data_assinatura
				, data_inicio_vigencia
				, data_fim_vigencia
				, valor_global_inicial
				, valor_global_atualizado
				, objeto_contratual
				, dia_pagamento
				, dia_pagamento_corridos
				, prazo_alerta_dias_pagamento
				, prazo_alerta_dias_ateste
				, prazo_alerta_dias_nota_fiscal
				, prazo_alerta_meses_fim_vigencia
				, ultima_alteracao
				, usuario_alteracao
				)
			VALUES (
				  @id_empresa
				, @id_tipo_contrato
				, @numero_processo
				, @numero_ordem_servico
				, @data_assinatura
				, @data_inicio_vigencia
				, @data_fim_vigencia
				, @valor_global_inicial
				, @valor_global_atualizado
				, @objeto_contratual
				, @dia_pagamento
				, @dia_pagamento_corridos
				, @prazo_alerta_dias_pagamento
				, @prazo_alerta_dias_ateste
				, @prazo_alerta_dias_nota_fiscal
				, @prazo_alerta_meses_fim_vigencia
				, GETDATE()
				, @usuario_alteracao
			);
			SET @id_contrato = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Contrato inserido com sucesso._' + CAST(@id_contrato AS varchar)
		END 
		ELSE
			SET @mensagem = '0_Contrato já existe!'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Contrato não inserido!'
	END CATCH

	SELECT @mensagem

END
GO
/****** Object:  StoredProcedure [contratos].[contrato_tipo_penalidade_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[contrato_tipo_penalidade_inserir]
	  @id_contrato int
	, @id_tipo_penalidade tinyint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tbr_contratos_tipos_penalidade]
					  WHERE id_contrato = @id_contrato AND id_tipo_penalidade = @id_tipo_penalidade)
		BEGIN
			INSERT INTO [contratos].[tbr_contratos_tipos_penalidade](id_contrato, id_tipo_penalidade)
			VALUES (@id_contrato, @id_tipo_penalidade)

			SET @mensagem = '1_Tipo penalidade inserido no contrato com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Tipo penalidade do contrato já existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo penalidade do contrato não inserido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[contrato_tipo_penalidade_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[contrato_tipo_penalidade_remover]
	  @id_contrato int
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tbr_contratos_tipos_penalidade] WHERE id_contrato = @id_contrato)
		BEGIN
			DELETE FROM [contratos].[tbr_contratos_tipos_penalidade] WHERE id_contrato = @id_contrato
			SET @mensagem = '1'
		END
		ELSE
			SET @mensagem = '1'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[documento_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[documento_alterar]
	@id_documento bigint
  , @id_tipo_documento tinyint
  , @id_dominio int
  , @data_validade date
  , @nome_documento varchar(255)
  , @usuario_alteracao char(7)
  , @observacao varchar(8000)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_dominio_documento tinyint = (SELECT id_dominio_documento FROM [contratos].[tb_tipos_documento]
											 WHERE id_tipo_documento = @id_tipo_documento)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_documentos] WHERE id_documento = @id_documento)
		BEGIN

			IF @id_dominio_documento = 1
				UPDATE [contratos].[tb_documentos] SET id_tipo_documento = @id_tipo_documento
												     , id_empresa = @id_dominio
												     , data_validade = @data_validade
												     , nome_documento = @nome_documento
												     , ultima_alteracao = GETDATE()
												     , usuario_alteracao = @usuario_alteracao
												     , observacao = @observacao
				WHERE id_documento = @id_documento
			ELSE IF @id_dominio_documento = 2
				UPDATE [contratos].[tb_documentos] SET id_tipo_documento = @id_tipo_documento
												     , id_contrato = @id_dominio
												     , data_validade = @data_validade
												     , nome_documento = @nome_documento
												     , ultima_alteracao = GETDATE()
												     , usuario_alteracao = @usuario_alteracao
												     , observacao = @observacao
				WHERE id_documento = @id_documento
			ELSE IF @id_dominio_documento = 3
				UPDATE [contratos].[tb_documentos] SET id_tipo_documento = @id_tipo_documento
												     , id_ateste_pagamento = @id_dominio
												     , data_validade = @data_validade
												     , nome_documento = @nome_documento
												     , ultima_alteracao = GETDATE()
												     , usuario_alteracao = @usuario_alteracao
												     , observacao = @observacao
				WHERE id_documento = @id_documento
			ELSE IF @id_dominio_documento = 4
				UPDATE [contratos].[tb_documentos] SET id_tipo_documento = @id_tipo_documento
												     , id_penalidade = @id_dominio 
												     , data_validade = @data_validade
												     , nome_documento = @nome_documento
												     , ultima_alteracao = GETDATE()
												     , usuario_alteracao = @usuario_alteracao
												     , observacao = @observacao
				WHERE id_documento = @id_documento

			SET @mensagem = '1_Documento "' + @nome_documento + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Documento com o nome "' + @nome_documento + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Documento "' + @nome_documento + '" não alterado.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[documento_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[documento_inserir]
	@id_tipo_documento tinyint
  , @id_dominio int
  , @data_validade date
  , @nome_documento varchar(255)
  , @observacao varchar(8000)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	/*
	DECLARE @query varchar(4000) = 'INSERT INTO [contratos].[tb_documentos] (id_tipo_documento, id_campo_dinamico, ' +
								   'data_validade, nome_documento, ultima_alteracao, usuario_alteracao, observacao) ' +
								   'VALUES (' + CAST(@id_tipo_documento AS varchar) + ', ' + CAST(@id_dominio AS varchar) +
								   ', ''' + CAST(@data_validade AS varchar) + ''', ''' + @nome_documento + ''', GETDATE()' +
								   ', ''' + @usuario_alteracao + ''', ''' + @observacao + ''')'
	*/
	DECLARE @id_documento bigint
	DECLARE @id_dominio_documento tinyint = (SELECT id_dominio_documento FROM [contratos].[tb_tipos_documento]
											 WHERE id_tipo_documento = @id_tipo_documento)
	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_documentos] WHERE nome_documento = @nome_documento)
		BEGIN
			/*
			IF @id_dominio_documento = 1
				SET @query = REPLACE(@query, 'id_campo_dinamico', 'id_empresa')
			ELSE IF @id_dominio_documento = 2
				SET @query = REPLACE(@query, 'id_campo_dinamico', 'id_contrato')
			ELSE IF @id_dominio_documento = 3
				SET @query = REPLACE(@query, 'id_campo_dinamico', 'id_ateste_pagamento')
			ELSE IF @id_dominio_documento = 4
				SET @query = REPLACE(@query, 'id_campo_dinamico', 'id_penalidade')

			EXECUTE(@query)
			*/

			IF @id_dominio_documento = 1
				INSERT INTO [contratos].[tb_documentos](id_tipo_documento, id_empresa, data_validade, nome_documento,
														ultima_alteracao, usuario_alteracao, observacao)
				VALUES (@id_tipo_documento, @id_dominio, @data_validade, @nome_documento, GETDATE(),
						@usuario_alteracao, @observacao)
			ELSE IF @id_dominio_documento = 2
				INSERT INTO [contratos].[tb_documentos](id_tipo_documento, id_contrato, data_validade, nome_documento,
														ultima_alteracao, usuario_alteracao, observacao)
				VALUES (@id_tipo_documento, @id_dominio, @data_validade, @nome_documento, GETDATE(),
						@usuario_alteracao, @observacao)
			ELSE IF @id_dominio_documento = 3
				INSERT INTO [contratos].[tb_documentos](id_tipo_documento, id_ateste_pagamento, data_validade, nome_documento,
														ultima_alteracao, usuario_alteracao, observacao)
				VALUES (@id_tipo_documento, @id_dominio, @data_validade, @nome_documento, GETDATE(),
						@usuario_alteracao, @observacao)
			ELSE IF @id_dominio_documento = 4
				INSERT INTO [contratos].[tb_documentos](id_tipo_documento, id_penalidade, data_validade, nome_documento,
														ultima_alteracao, usuario_alteracao, observacao)
				VALUES (@id_tipo_documento, @id_dominio, @data_validade, @nome_documento, GETDATE(),
						@usuario_alteracao, @observacao)

			SET @id_documento = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Documento inserido com sucesso._' + CAST(@id_documento AS varchar)
		END 
		ELSE
			SET @mensagem = '0_Documento já existe. Favor renomear.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Documento não inserido.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[documento_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[documento_remover]
	@id_documento bigint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_documentos] WHERE id_documento = @id_documento)
		BEGIN		
			DELETE FROM [contratos].[tb_documentos]
				WHERE id_documento = @id_documento
			SET @mensagem = '1_Documento removido com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Documento não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Documento não removido.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[email_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[email_alterar]
	@id_email int
  , @id_empresa smallint
  , @id_tipo_contato tinyint
  ,	@email varchar(100)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_emails] WHERE id_email = @id_email)
		BEGIN
			UPDATE [contratos].[tb_emails]
			SET id_empresa = @id_empresa 
			  , id_tipo_contato = @id_tipo_contato
			  , email = @email
			  , ultima_alteracao = GETDATE()
			  , usuario_alteracao = @usuario_alteracao
			WHERE id_email = @id_email;
			SET @mensagem = '1_Email "' + @email + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Email "' + @email + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Email "' + @email + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[email_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[email_inserir]
    @id_empresa smallint
  , @id_tipo_contato tinyint
  , @email varchar(100)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_email int

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_emails] WHERE email = @email)
		BEGIN
			INSERT INTO [contratos].[tb_emails](id_empresa, id_tipo_contato, email, ultima_alteracao, usuario_alteracao)
			VALUES (@id_empresa, @id_tipo_contato, @email, GETDATE(), @usuario_alteracao);

			SET @id_email = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Email "' + @email + '" inserido com sucesso._' + CAST(@id_email AS varchar)
		END 
		ELSE
			SET @mensagem = '0_Email "' + @email + '" já existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Email "' + @email + '" não inserido.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[email_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[email_remover]
    @id_email smallint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_emails] WHERE id_email = @id_email)
		BEGIN
			DELETE FROM [contratos].[tb_emails] WHERE id_email = @id_email;
			SET @mensagem = '1_Email removido com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Email não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Email não removido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[empresa_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[empresa_alterar]
	@id_empresa smallint
  , @empresa varchar(200)
  , @cnpj bigint
  , @endereco varchar(20)
  , @cidade varchar(100)
  , @uf char(2)
  , @cep bigint
  , @observacao varchar(8000)
  , @ativo bit
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_empresas] WHERE id_empresa = @id_empresa)
		BEGIN
			UPDATE [contratos].[tb_empresas]
			SET empresa = @empresa 
			  , cnpj = @cnpj
			  , endereco = @endereco
   			  , cidade = @cidade
			  , uf = @uf
			  , cep = @cep
			  , observacao = @observacao
			  , ativo = @ativo
			  , ultima_alteracao = GETDATE()
			  , usuario_alteracao = @usuario_alteracao
			WHERE id_empresa = @id_empresa;
			SELECT '1_Empresa "' + @empresa + '" alterada com sucesso!'
		END
		ELSE
			SELECT '0_Empresa "' + @empresa + '" Empresa não existe!'
	END TRY
	BEGIN CATCH
		SELECT '0_Erro! Empresa "' + @empresa + '" não inserida!'
	END CATCH
END
GO
/****** Object:  StoredProcedure [contratos].[empresa_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[empresa_inserir]
    @empresa varchar(200)
  , @cnpj bigint
  , @endereco varchar(20)
  , @cidade varchar(100)
  , @uf char(2)
  , @cep bigint
  , @observacao varchar(8000)
  , @ativo bit
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_empresa int

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_empresas] WHERE cnpj = @cnpj AND ativo = 1)
		BEGIN
			INSERT INTO [contratos].[tb_empresas](empresa, cnpj, endereco, cidade, uf, cep,
												  observacao, ativo, ultima_alteracao, usuario_alteracao)
			VALUES (@empresa, @cnpj, @endereco, @cidade, @uf, @cep, @observacao, @ativo, GETDATE(), @usuario_alteracao);

			SET @id_empresa = (SELECT SCOPE_IDENTITY())
		END
		ELSE
		BEGIN
			SET @id_empresa = (SELECT id_empresa FROM [contratos].[tb_empresas] WHERE cnpj = @cnpj)

			UPDATE [contratos].[tb_empresas]
			SET ativo = 1
			WHERE id_empresa = @id_empresa
		END

		SET @mensagem = '1_Empresa inserida com sucesso._' + CAST(@id_empresa AS varchar)
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Empresa "' + @empresa + '" não inserida!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[empresa_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[empresa_remover]
    @id_empresa varchar(200)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_empresas] WHERE id_empresa = @id_empresa)
		BEGIN
			UPDATE [contratos].[tb_empresas] SET ativo = 0, ultima_alteracao = GETDATE()
			WHERE id_empresa = @id_empresa

			SET @mensagem = '1_Empresa removida com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Empresa não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Empresa não removida.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[item_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[item_alterar]
	@id_item int
  , @item varchar(50)
  , @id_contrato int
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_itens] WHERE id_item = @id_item)
		BEGIN
			UPDATE [contratos].[tb_itens]
			SET item = @item 
			  , id_contrato = @id_contrato
			  , ultima_alteracao = GETDATE()
			  , usuario_alteracao = @usuario_alteracao
			WHERE id_item = @id_item;
			SET @mensagem = '1_Item "' + @item + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Item "' + @item + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Item "' + @item + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[item_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[item_inserir]
    @item varchar(50)
  , @id_contrato int
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_item int
	DECLARE @ativo bit

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_itens] WHERE item = @item AND id_contrato = @id_contrato)
		BEGIN
			INSERT INTO [contratos].[tb_itens](item, id_contrato, ativo, ultima_alteracao, usuario_alteracao)
			VALUES (@item, @id_contrato, 1, GETDATE(), @usuario_alteracao);

			SET @id_item = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Item "' + @item + '" inserido com sucesso._' + CAST(@id_item AS varchar)
		END 
		ELSE
		BEGIN
			SELECT @ativo = ativo, @id_item = id_item FROM [contratos].[tb_itens] WHERE item = @item AND id_contrato = @id_contrato
			IF (@ativo = 1)
			BEGIN
				UPDATE [contratos].[tb_itens] SET ativo = 1 WHERE id_item = @id_item
				SET @mensagem = '1_Item "' + @item + '" inserido com sucesso._' + CAST(@id_item AS varchar)
			END
		END
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Item "' + @item + '" não inserido.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[item_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[item_remover]
	@id_item int
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_itens] WHERE id_item = @id_item)
		BEGIN
			UPDATE [contratos].[tb_itens] SET ativo = 0, usuario_alteracao = @usuario_alteracao WHERE id_item = @id_item;
			SET @mensagem = '1_Item removido com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Item não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Item não removido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[subitem_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[subitem_alterar]
	@id_subitem int
  , @subitem varchar(50)
  , @id_item int
  , @qtd int
  , @valor_unitario decimal(19,2)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_subitens] WHERE id_subitem = @id_subitem)
		BEGIN
			UPDATE [contratos].[tb_subitens]
			SET subitem = @subitem 
			  , id_item = @id_item
			  , qtd = @qtd
			  , valor_unitario = @valor_unitario
			  , ultima_alteracao = GETDATE()
			  , usuario_alteracao = @usuario_alteracao
			WHERE id_subitem = @id_subitem;
			SET @mensagem = '1_Subitem "' + @subitem + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Subitem "' + @subitem + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Subitem "' + @subitem + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[subitem_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[subitem_inserir]
    @subitem varchar(50)
  , @id_item int
  , @qtd int
  , @valor_unitario decimal(19,2)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_subitem int
	DECLARE @ativo bit

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_subitens] WHERE subitem = @subitem AND id_item = @id_item)
		BEGIN
			INSERT INTO [contratos].[tb_subitens](subitem, id_item, qtd, valor_unitario, ativo, ultima_alteracao, usuario_alteracao)
			VALUES (@subitem, @id_item, @qtd, @valor_unitario, 1, GETDATE(), @usuario_alteracao);

			SET @id_subitem = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Subitem "' + @subitem + '" inserido com sucesso._' + CAST(@id_subitem AS varchar)
		END 
		ELSE
		BEGIN
			SELECT @ativo = ativo, @id_subitem = id_subitem FROM [contratos].[tb_subitens] WHERE subitem = @subitem AND id_item = @id_item
			IF (@ativo = 1)
			BEGIN
				UPDATE [contratos].[tb_subitens] SET ativo = 1 WHERE id_subitem = @id_subitem
				SET @mensagem = '1_Subitem "' + @subitem + '" inserido com sucesso._' + CAST(@id_subitem AS varchar)
			END
		END
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Subitem "' + @subitem + '" não inserido.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[subitem_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[subitem_remover]
	@id_subitem int
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_subitens] WHERE id_subitem = @id_subitem)
		BEGIN
			UPDATE [contratos].[tb_subitens] SET ativo = 0, usuario_alteracao = @usuario_alteracao WHERE id_subitem = @id_subitem;
			SET @mensagem = '1_Subitem removido com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Subitem não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Subitem não removido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[telefone_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[telefone_alterar]
	@id_telefone int
  , @id_empresa smallint
  , @id_tipo_contato tinyint
  ,	@telefone varchar(11)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_telefones] WHERE id_telefone = @id_telefone)
		BEGIN
			UPDATE [contratos].[tb_telefones]
			SET id_empresa = @id_empresa 
			  , id_tipo_contato = @id_tipo_contato
			  , telefone = @telefone
			  , ultima_alteracao = GETDATE()
			  , usuario_alteracao = @usuario_alteracao
			WHERE id_telefone = @id_telefone;
			SET @mensagem = '1_Telefone "' + @telefone + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Telefone "' + @telefone + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Telefone "' + @telefone + '" não alterado!'
	END CATCH

	SELECT @mensagem

END
GO
/****** Object:  StoredProcedure [contratos].[telefone_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [contratos].[telefone_inserir]
    @id_empresa smallint
  , @id_tipo_contato tinyint
  , @telefone varchar(11)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_telefone int

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_telefones] WHERE telefone = @telefone)
		BEGIN
			INSERT INTO [contratos].[tb_telefones](id_empresa, id_tipo_contato, telefone, ultima_alteracao, usuario_alteracao)
			VALUES (@id_empresa, @id_tipo_contato, @telefone, GETDATE(), @usuario_alteracao);

			SET @id_telefone = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Telefone "' + @telefone + '" inserido com sucesso._' + CAST(@id_telefone AS varchar)
		END 
		ELSE
			SET @mensagem = '0_Telefone "' + @telefone + '" já existe!'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Telefone "' + @telefone + '" não inserido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[telefone_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[telefone_remover]
    @id_telefone smallint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_telefones] WHERE id_telefone = @id_telefone)
		BEGIN
			DELETE FROM [contratos].[tb_telefones] WHERE id_telefone = @id_telefone;
			SET @mensagem = '1_Telefone removido com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Telefone não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Telefone não removido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[telefone_selecionar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[telefone_selecionar]
	@id_telefone int
AS
BEGIN

	SET NOCOUNT ON;

	IF @id_telefone IS NOT NULL
		SELECT id_telefone, id_empresa, id_tipo_contato, telefone, ultima_alteracao, usuario_alteracao
			FROM [contratos].[tb_telefones]
			WHERE id_telefone = @id_telefone
	ELSE
		SELECT id_telefone, id_empresa, id_tipo_contato, telefone, ultima_alteracao, usuario_alteracao
			FROM [contratos].[tb_telefones]
	RETURN
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_contato_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[tipo_contato_alterar]
	@id_tipo_contato tinyint
  ,	@tipo_contato varchar(50)
  , @ativo bit
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_contato] WHERE id_tipo_contato = @id_tipo_contato)
		BEGIN
			UPDATE [contratos].[tb_tipos_contato]
			SET tipo_contato = @tipo_contato 
			  , ativo = @ativo
			  , usuario_alteracao = @usuario_alteracao
			  , ultima_alteracao = GETDATE()
			WHERE id_tipo_contato = @id_tipo_contato;
			SET @mensagem = '1_Tipo Contato "' + @tipo_contato + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Tipo Contato "' + @tipo_contato + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo Contato "' + @tipo_contato + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_contato_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[tipo_contato_inserir]
	@tipo_contato varchar(50)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_tipo_contato tinyint
	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_contato] WHERE tipo_contato = @tipo_contato)
		BEGIN
			INSERT INTO [contratos].[tb_tipos_contato](tipo_contato, usuario_alteracao, ultima_alteracao)
			VALUES (@tipo_contato, @usuario_alteracao, GETDATE());
			SET @id_tipo_contato = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Tipo Contato "' + @tipo_contato + '" inserido com sucesso._' + CAST(@id_tipo_contato AS varchar)
		END 
		ELSE
			SET @mensagem = '0_Tipo Contato "' + @tipo_contato + '" já existe!'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo Contato "' + @tipo_contato + '" não inserido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_contato_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[tipo_contato_remover]
    @id_tipo_contato smallint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_contato] WHERE id_tipo_contato = @id_tipo_contato)
		BEGIN
			DELETE FROM [contratos].[tb_tipos_contato] WHERE id_tipo_contato = @id_tipo_contato;
			SET @mensagem = '1_Tipo contato removido com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Tipo contato não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo contato não removido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_contrato_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[tipo_contrato_alterar]
	@id_tipo_contrato tinyint
  ,	@tipo_contrato varchar(50)
  , @ativo bit
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_contrato] WHERE id_tipo_contrato = @id_tipo_contrato)
		BEGIN
			UPDATE [contratos].[tb_tipos_contrato]
			SET tipo_contrato = @tipo_contrato 
			  , ativo = @ativo
			  , usuario_alteracao = @usuario_alteracao
			  , ultima_alteracao = GETDATE()
			WHERE id_tipo_contrato = @id_tipo_contrato;
			SET @mensagem = '1_Tipo Contrato "' + @tipo_contrato + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Tipo Contrato "' + @tipo_contrato + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo Contrato "' + @tipo_contrato + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_contrato_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[tipo_contrato_inserir]
	@tipo_contrato varchar(50)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_tipo_contrato tinyint
	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_contrato] WHERE tipo_contrato = @tipo_contrato)
		BEGIN
			INSERT INTO [contratos].[tb_tipos_contrato](tipo_contrato, ativo, usuario_alteracao, ultima_alteracao)
			VALUES (@tipo_contrato, 1, @usuario_alteracao, GETDATE());
			SET @id_tipo_contrato = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Tipo Contrato "' + @tipo_contrato + '" inserido com sucesso._' + CAST(@id_tipo_contrato AS varchar)
		END 
		ELSE
			SET @mensagem = '0_Tipo Contrato "' + @tipo_contrato + '" já existe!'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo Contrato "' + @tipo_contrato + '" não inserido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_contrato_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[tipo_contrato_remover]
    @id_tipo_contrato smallint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_contrato] WHERE id_tipo_contrato = @id_tipo_contrato)
		BEGIN
			DELETE FROM [contratos].[tb_tipos_contrato] WHERE id_tipo_contrato = @id_tipo_contrato;
			SET @mensagem = '1_Tipo contrato removido com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Tipo contrato não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo contrato não removido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_documento_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[tipo_documento_alterar]
	@id_tipo_documento tinyint
  ,	@tipo_documento varchar(50)
  , @possui_validade bit
  , @id_dominio_documento tinyint
  , @ativo bit
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_documento] WHERE id_tipo_documento = @id_tipo_documento)
		BEGIN
			UPDATE [contratos].[tb_tipos_documento]
			SET tipo_documento = @tipo_documento 
			  , possui_validade = @possui_validade
			  , id_dominio_documento = @id_dominio_documento
			  , ativo = @ativo
			  , usuario_alteracao = @usuario_alteracao
			  , ultima_alteracao = GETDATE()
			WHERE id_tipo_documento = @id_tipo_documento;
			SET @mensagem = '1_Tipo documento "' + @tipo_documento + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Tipo documento "' + @tipo_documento + '" já existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo documento "' + @tipo_documento + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_documento_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[tipo_documento_inserir]
	@tipo_documento varchar(50)
  , @possui_validade bit
  , @id_dominio_documento tinyint
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_tipo_documento tinyint

	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_documento] WHERE tipo_documento = @tipo_documento)
		BEGIN
			INSERT INTO [contratos].[tb_tipos_documento](tipo_documento, possui_validade, id_dominio_documento,
														 usuario_alteracao, ultima_alteracao)
			VALUES (@tipo_documento, @possui_validade, @id_dominio_documento, @usuario_alteracao, GETDATE());

			SET @id_tipo_documento = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Tipo documento "' + @tipo_documento + '" inserido com sucesso._' + CAST(@id_tipo_documento AS varchar)
		END 
		ELSE
			SET @mensagem = '0_Tipo documento "' + @tipo_documento + '" já existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo documento "' + @tipo_documento + '" não inserido.'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_documento_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[tipo_documento_remover]
    @id_tipo_documento smallint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_documento] WHERE id_tipo_documento = @id_tipo_documento)
		BEGIN
			DELETE FROM [contratos].[tb_tipos_documento] WHERE id_tipo_documento = @id_tipo_documento;
			SET @mensagem = '1_Tipo documento removido com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Tipo documento não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo documento não removido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_penalidade_alterar]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[tipo_penalidade_alterar]
	@id_tipo_penalidade tinyint
  ,	@tipo_penalidade varchar(50)
  , @ativo bit
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_penalidade] WHERE id_tipo_penalidade = @id_tipo_penalidade)
		BEGIN
			UPDATE [contratos].[tb_tipos_penalidade]
			SET tipo_penalidade = @tipo_penalidade 
			  , ativo = @ativo
			  , usuario_alteracao = @usuario_alteracao
			  , ultima_alteracao = GETDATE()
			WHERE id_tipo_penalidade = @id_tipo_penalidade;
			SET @mensagem = '1_Tipo penalidade "' + @tipo_penalidade + '" alterado com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Tipo penalidade "' + @tipo_penalidade + '" não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo penalidade "' + @tipo_penalidade + '" não alterado!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_penalidade_inserir]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [contratos].[tipo_penalidade_inserir]
	@tipo_penalidade varchar(50)
  , @usuario_alteracao char(7)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)
	DECLARE @id_tipo_penalidade tinyint
	BEGIN TRY
		IF NOT EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_penalidade] WHERE tipo_penalidade = @tipo_penalidade)
		BEGIN
			INSERT INTO [contratos].[tb_tipos_penalidade](tipo_penalidade, ativo, usuario_alteracao, ultima_alteracao)
			VALUES (@tipo_penalidade, 1, @usuario_alteracao, GETDATE());
			SET @id_tipo_penalidade = (SELECT SCOPE_IDENTITY())
			SET @mensagem = '1_Tipo Penalidade "' + @tipo_penalidade + '" inserido com sucesso.'
		END 
		ELSE
			SET @mensagem = '0_Tipo Penalidade "' + @tipo_penalidade + '" já existe!'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo Penalidade "' + @tipo_penalidade + '" não inserido!'
	END CATCH

	SELECT @mensagem
END
GO
/****** Object:  StoredProcedure [contratos].[tipo_penalidade_remover]    Script Date: 25/11/2020 08:06:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [contratos].[tipo_penalidade_remover]
    @id_tipo_penalidade tinyint
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @mensagem varchar(255)

	BEGIN TRY
		IF EXISTS(SELECT TOP(1) 1 FROM [contratos].[tb_tipos_penalidade] WHERE id_tipo_penalidade = @id_tipo_penalidade)
		BEGIN
			DELETE FROM [contratos].[tb_tipos_penalidade] WHERE id_tipo_penalidade = @id_tipo_penalidade;
			SET @mensagem = '1_Tipo penalidade removido com sucesso.'
		END
		ELSE
			SET @mensagem = '0_Tipo penalidade não existe.'
	END TRY
	BEGIN CATCH
		SET @mensagem = '0_Erro! Tipo penalidade não removido!'
	END CATCH

	SELECT @mensagem
END
GO
