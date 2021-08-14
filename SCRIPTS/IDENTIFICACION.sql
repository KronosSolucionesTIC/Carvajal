USE [CARVAJAL]
GO

/****** Object:  Table [dbo].[IDENTIFICACION]    Script Date: 14/08/2021 12:44:19 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[IDENTIFICACION](
	[id_tipo_identificacion] [int] IDENTITY(1,1) NOT NULL,
	[tipo_identificacion] [nvarchar](50) NULL
) ON [PRIMARY]
GO


