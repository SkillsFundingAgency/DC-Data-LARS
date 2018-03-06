CREATE PROCEDURE [Staging].[usp_Process_Funding]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_Funding] AS Target
		USING (
				SELECT   [LearnAimRef]
					    ,[FundingCategory]
					    ,[RateUnWeighted]
					    ,[RateWeighted]
					    ,[WeightingFactor]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_Funding]
			  )
			  AS Source 
		   ON Target.[LearnAimRef] = Source.[LearnAimRef]
	      AND Target.[FundingCategory] = Source.[FundingCategory]	  
		  AND Target.[EffectiveFrom] = Source.[EffectiveFrom]
		  WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveTo]
							,Target.[RateUnWeighted]
							,Target.[RateWeighted]
							,Target.[WeightingFactor]
					EXCEPT 
						SELECT 
							 Source.[EffectiveTo]
							,Source.[RateUnWeighted]
							,Source.[RateWeighted]
							,Source.[WeightingFactor]
					)
		  THEN
			UPDATE SET [EffectiveTo] = Source.[EffectiveTo]
					  ,[RateWeighted] = Source.[RateWeighted]
					  ,[RateUnWeighted] = Source.[RateUnWeighted]
					  ,[WeightingFactor] = Source.[WeightingFactor]
					  ,[Modified_By] = Source.[Modified_By]
					  ,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
			INSERT (    [LearnAimRef]
					   ,[FundingCategory]
					   ,[RateWeighted]
					   ,[RateUnWeighted]
					   ,[WeightingFactor]
					   ,[EffectiveFrom]
					   ,[EffectiveTo]					  					  
					   ,[Created_On]				  					  
					   ,[Created_By]
					   ,[Modified_On]
					   ,[Modified_By]
					)
							
			VALUES (	 Source.[LearnAimRef]
						,Source.[FundingCategory]
						,Source.[RateWeighted]
						,Source.[RateUnWeighted]
						,Source.[WeightingFactor]
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