CREATE PROCEDURE [Staging].[usp_Process_TBStandardLookupVersion]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [dbo].[TBStandardLookupVersion] AS Target
		USING (
				SELECT   [StandardLookupVersion]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[TBStandardLookupVersion]
			  )
			  AS Source 
		     ON Target.[StandardLookupVersion] = Source.[StandardLookupVersion]
			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[Modified_On]
							,Target.[Modified_By]
					EXCEPT 
						SELECT 
							 Source.[Modified_On]
							,Source.[Modified_By]

					)
		  THEN
			UPDATE SET   [Modified_By] = Source.[Modified_By]
						,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (     [StandardLookupVersion]
					,[Created_On]
					,[Created_By]
					,[Modified_On]
					,[Modified_By]
					)
			VALUES ( Source.[StandardLookupVersion]
					,Source.[Created_On]
					,Source.[Created_By]
					,Source.[Modified_On]
					,Source.[Modified_By]
				  )
		WHEN NOT MATCHED BY SOURCE THEN DELETE
		;

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