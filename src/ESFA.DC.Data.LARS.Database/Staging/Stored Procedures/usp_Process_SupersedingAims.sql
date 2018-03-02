CREATE PROCEDURE [Staging].[usp_Process_SupersedingAims]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_SupersedingAims] AS Target
		USING (
				SELECT   [OldLearnAimRef]
						,[NewLearnAimRef]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_SupersedingAims]
			  )
			  AS Source
		   ON Target.[OldLearnAimRef] = Source.[OldLearnAimRef]
	      AND Target.[NewLearnAimRef] = Source.[NewLearnAimRef]	  
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	   [OldLearnAimRef]
					  ,[NewLearnAimRef]
					  ,[Created_On]
					  ,[Created_By]
					  ,[Modified_On]
					  ,[Modified_By]
					)
			VALUES (	   Source.[OldLearnAimRef]
						  ,Source.[NewLearnAimRef]
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