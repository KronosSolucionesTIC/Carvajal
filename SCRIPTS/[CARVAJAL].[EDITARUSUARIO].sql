USE [CARVAJAL]
GO
/****** Object:  StoredProcedure [CARVAJAL].[EDITARUSUARIO]    Script Date: 14/08/2021 12:46:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CARVAJAL].[EDITARUSUARIO]

@nombre varchar(50) NULL,
@apellido varchar(50) NULL,
@fk_tipo_identificacion int NULL,
@numero_identificacion varchar(50) NULL,
@password varchar(50) NULL,
@email varchar(200) NULL,
@id_usuario int

AS
BEGIN TRY
	
UPDATE [dbo].[USUARIO]
   SET [nombre] = @nombre,
      [apellido] = @apellido, 
      [fk_tipo_identificacion] = @fk_tipo_identificacion, 
      [numero_identificacion] = @numero_identificacion,
      [password] = @password,
      [email] = @email
 WHERE [id_usuario] = @id_usuario

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

