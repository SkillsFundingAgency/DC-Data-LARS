CREATE PROCEDURE [Staging].[usp_Process_DataGeneration]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		DELETE FROM [Core].[LARS_DataGeneration];

		INSERT INTO [Core].[LARS_DataGeneration]
		(	[DataGeneratedOn]
		   ,[Description]
		   ,[Comment]
		   ,[Created_On]
		   ,[Created_By]
		 )
		 SELECT [DataGeneratedOn]
			   ,[Description]
			   ,[Comment]
			   ,[Created_On]
			   ,[Created_By]
		FROM [Staging].[LARS_DataGeneration];

		RETURN 0;

	END TRY
-- 
-------------------------------------------------------------------------------------- 
-- Handle any problems
-------------------------------------------------------------------------------------- 
-- 
	BEGIN CATCH

		DECLARE   @ErrorMessage		NVARCHAR(4000)
				, @ErrorSeverity	INT 
				, @ErrorState		INT
				, @ErrorNumber		INT
						
		SELECT	  @ErrorNumber		= ERROR_NUMBER()
				, @ErrorMessage		= 'Error in :' + ISNULL(OBJECT_NAME(@@PROCID),'') + ' - Error was :' + ERROR_MESSAGE()
				, @ErrorSeverity	= ERROR_SEVERITY()
				, @ErrorState		= ERROR_STATE();
	
		RAISERROR (
					  @ErrorMessage		-- Message text.
					, @ErrorSeverity	-- Severity.
					, @ErrorState		-- State.
				  );
			  
		RETURN @ErrorNumber;

	END CATCH
-- 
-------------------------------------------------------------------------------------- 
-- All done
-------------------------------------------------------------------------------------- 
-- 
END