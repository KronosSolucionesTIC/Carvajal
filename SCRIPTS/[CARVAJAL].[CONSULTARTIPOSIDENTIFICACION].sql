USE [CARVAJAL]
GO
/****** Object:  StoredProcedure [CARVAJAL].[CONSULTARTIPOSIDENTIFICACION]    Script Date: 14/08/2021 12:45:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CARVAJAL].[CONSULTARTIPOSIDENTIFICACION]

AS
BEGIN TRY
	
SELECT [id_tipo_identificacion]
      ,[tipo_identificacion]
  FROM [CARVAJAL].[dbo].[IDENTIFICACION]

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
