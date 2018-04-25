CREATE PROCEDURE [Staging].[usp_Process_CareerLearningPilot]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_CareerLearningPilot] AS Target
		USING (
				SELECT   [LearnAimRef]
					    ,[AreaCode]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
					    ,[MaxLoanAmount]
					    ,[SubsidyPercent]
					    ,[SubsidyRate]		
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_CareerLearningPilot]
			  )
			  AS Source 
		    ON Target.[LearnAimRef] = Source.[LearnAimRef]
	      AND Target.[AreaCode] = Source.[AreaCode]	
	      AND Target.[EffectiveFrom] = Source.[EffectiveFrom]	
			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveTo]
							,Target.[MaxLoanAmount]
							,Target.[SubsidyPercent]
							,Target.[SubsidyRate]	
					EXCEPT 
						SELECT 
							 Source.[EffectiveTo]
							,Source.[MaxLoanAmount]
							,Source.[SubsidyPercent]
							,Source.[SubsidyRate]	
					)
		  THEN
			UPDATE SET   [EffectiveTo] = Source.[EffectiveTo]
						,[MaxLoanAmount] = Source.[MaxLoanAmount]
						,[SubsidyPercent] = Source.[SubsidyPercent]
						,[SubsidyRate] = Source.[SubsidyRate]
						,[Modified_By] = Source.[Modified_By]
						,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (     [LearnAimRef]
					,[AreaCode]      
					,[EffectiveFrom] 
					,[EffectiveTo]   
					,[MaxLoanAmount]   
					,[SubsidyPercent]			
					,[SubsidyRate]	
					,[Created_On]
					,[Created_By]
					,[Modified_On]
					,[Modified_By]
					)
			VALUES ( Source.[LearnAimRef]
					,Source.[AreaCode]      
					,Source.[EffectiveFrom] 
					,Source.[EffectiveTo]   
					,Source.[MaxLoanAmount]   
					,Source.[SubsidyPercent]			
					,Source.[SubsidyRate]	
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