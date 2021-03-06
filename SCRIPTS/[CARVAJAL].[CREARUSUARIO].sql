USE [CARVAJAL]
GO
/****** Object:  StoredProcedure [CARVAJAL].[CREARUSUARIO]    Script Date: 14/08/2021 12:46:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CARVAJAL].[CREARUSUARIO]

@nombre varchar(50),
@apellido varchar(50),
@fk_tipo_identificacion int,
@numero_identificacion varchar(50),
@password varchar(50),
@email varchar(200)

AS
BEGIN TRY
	
INSERT INTO [dbo].[USUARIO]
           ([nombre]
           ,[apellido]
           ,[fk_tipo_identificacion]
           ,[numero_identificacion]
           ,[password]
           ,[email])
     VALUES
           (@nombre,
           @apellido,
           @fk_tipo_identificacion,
           @numero_identificacion,
           @password,
           @email)

END TRY
BEGIN CATCH

  DECLARE @ErrorNumber INT,
		  @ErrorMessage NVARCHAR(4000),
		  @ErrorSeverity INT,
		  @ErrorState INT,
		  @ErrorProcedure NVARCHAR(126),
		  @msg NVARCHAR(2000)

  SELECT  @ErrorNumber = ERROR_NUMBER(),
          @ErrorMessage = ERROR_MESSAGE(),
          @ErrorSeverity = ERROR_SEVERITY(),
          @ErrorState = ERROR_STATE(),
          @ErrorProcedure = ERROR_PROCEDURE()
                
  SELECT  @msg = 'Error No. ' + CONVERT (NVARCHAR(10), @ErrorNumber) + '. Description: ' + @ErrorMessage + ' Error Ogrigin: ' + @ErrorProcedure 
  RAISERROR ( @msg, @ErrorSeverity, @ErrorState )         
END CATCH

