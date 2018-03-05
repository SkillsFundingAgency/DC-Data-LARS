CREATE PROCEDURE [Staging].[usp_Process_StandardCommonComponent]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_StandardCommonComponent] AS Target
		USING (
				SELECT   [StandardCode]
					    ,[CommonComponent]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
					    ,[MinLevel] 
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_StandardCommonComponent]
			  )
			  AS Source 
		    ON Target.[StandardCode] = Source.[StandardCode]
		   AND Target.[CommonComponent] = Source.[CommonComponent]
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveFrom]
							,Target.[EffectiveTo]
							,Target.[MinLevel]
					EXCEPT 
						SELECT 
							 Source.[EffectiveFrom]
							,Source.[EffectiveTo]
							,Source.[MinLevel]
					)
		  THEN
			UPDATE SET 
					 [EffectiveFrom] = Source.[EffectiveFrom] 
					,[EffectiveTo] = Source.[EffectiveTo]
					,[MinLevel] = Source.[MinLevel]					
					,[Modified_By] = Source.[Modified_By]
					,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	     [StandardCode]
						,[CommonComponent]
						,[EffectiveFrom]
						,[EffectiveTo]
						,[MinLevel]
						,[Created_On]
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
			VALUES (     Source.[StandardCode]
						,Source.[CommonComponent]
						,Source.[EffectiveFrom]
						,Source.[EffectiveTo]
						,Source.[MinLevel]
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