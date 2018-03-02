CREATE PROCEDURE [Staging].[usp_Process_LearningDeliveryCategory]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_LearningDeliveryCategory] AS Target
		USING (
				SELECT   [LearnAimRef]
					    ,[CategoryRef]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_LearningDeliveryCategory]
			  )
			  AS Source 
		   ON Target.[LearnAimRef] = Source.[LearnAimRef]
	      AND Target.[CategoryRef] = Source.[CategoryRef]	  
		  AND Target.[EffectiveFrom] = Source.[EffectiveFrom]
		  WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveTo]
					EXCEPT 
						SELECT 
							 Source.[EffectiveTo]
					)
		  THEN
			UPDATE SET [EffectiveTo] = Source.[EffectiveTo]
					  ,[Modified_By] = Source.[Modified_By]
					  ,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
			INSERT (    [LearnAimRef]
					   ,[CategoryRef]
					   ,[EffectiveFrom]
					   ,[EffectiveTo]					  					  
					   ,[Created_On]				  					  
					   ,[Created_By]
					   ,[Modified_On]
					   ,[Modified_By]
					)							
			VALUES (	 Source.[LearnAimRef]
						,Source.[CategoryRef]
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