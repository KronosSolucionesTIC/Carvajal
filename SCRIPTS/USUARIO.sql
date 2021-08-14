USE [CARVAJAL]
GO

/****** Object:  Table [dbo].[USUARIO]    Script Date: 14/08/2021 12:44:49 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[USUARIO](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido] [nvarchar](50) NULL,
	[fk_tipo_identificacion] [int] NULL,
	[numero_identificacion] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](200) NULL
) ON [PRIMARY]
GO


