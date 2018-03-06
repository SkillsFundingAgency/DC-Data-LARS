CREATE PROCEDURE [Staging].[usp_Process_StandardAims]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_StandardAims] AS Target
		USING (
				SELECT   [StandardCode]
					    ,[LearnAimRef]
					    ,[StandardComponentType]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_StandardAims]
			  )
			  AS Source 
		    ON Target.[StandardCode] = Source.[StandardCode]
		   AND Target.[LearnAimRef] = Source.[LearnAimRef]
		   AND Target.[EffectiveFrom] = Source.[EffectiveFrom]
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							  Target.[EffectiveTo]
							 ,Target.[StandardComponentType]
					EXCEPT 
						SELECT 
							  Source.[EffectiveTo]
							 ,Source.[StandardComponentType]
					)
		  THEN
			UPDATE SET 
					 [EffectiveTo] = Source.[EffectiveTo]		
					,[StandardComponentType] = Source.[StandardComponentType]					
					,[Modified_By] = Source.[Modified_By]
					,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	     [StandardCode]
						,[LearnAimRef]
						,[StandardComponentType]
						,[EffectiveFrom]
						,[EffectiveTo]
						,[Created_On]
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
			VALUES (     Source.[StandardCode]
						,Source.[LearnAimRef]
					    ,Source.[StandardComponentType]
						,Source.[EffectiveFrom]
						,Source.[EffectiveTo]
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