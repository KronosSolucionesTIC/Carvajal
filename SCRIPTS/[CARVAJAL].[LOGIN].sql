USE [CARVAJAL]
GO
/****** Object:  StoredProcedure [CARVAJAL].[LOGIN]    Script Date: 14/08/2021 12:46:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CARVAJAL].[LOGIN]

@password nvarchar(50),
@numero_identificacion nvarchar(50)
AS
BEGIN TRY
	
SELECT id_usuario
  FROM [CARVAJAL].[dbo].[USUARIO]
  WHERE [password] = @password and [numero_identificacion] = @numero_identificacion

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
