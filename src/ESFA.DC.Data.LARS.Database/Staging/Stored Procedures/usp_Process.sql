CREATE PROCEDURE [Staging].[usp_Process]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
				
-- Core Tables	
			EXEC [Staging].[usp_Process_Version];

			EXEC [Staging].[usp_Process_LearningDelivery];
			EXEC [Staging].[usp_Process_AnnualValue];			
			EXEC [Staging].[usp_Process_Section96];
			EXEC [Staging].[usp_Process_Validity];
			EXEC [Staging].[usp_Process_Funding];

			EXEC [Staging].[usp_Process_Framework];
			EXEC [Staging].[usp_Process_FrameworkAims];
			EXEC [Staging].[usp_Process_FrameworkCmnComp];
			EXEC [Staging].[usp_Process_FrameworkMetaData];		
				
			EXEC [Staging].[usp_Process_LearningDeliveryCategory];
			EXEC [Staging].[usp_Process_SupersedingFrameworks];		
			EXEC [Staging].[usp_Process_SupersedingAims];		
			
			EXEC [Staging].[usp_Process_Standard];		
			EXEC [Staging].[usp_Process_StandardCommonComponent];		
			EXEC [Staging].[usp_Process_StandardFunding];		
			EXEC [Staging].[usp_Process_StandardValidity];
			EXEC [Staging].[usp_Process_StandardMetaData];

			EXEC [Staging].[usp_Process_ApprenticeshipFunding];
			EXEC [Staging].[usp_Process_StandardAims];
			EXEC [Staging].[usp_Process_CareerLearningPilot];

			EXEC [Staging].[usp_Process_TBStandardLookup];
			EXEC [Staging].[usp_Process_TBStandardLookupVersion];


			EXEC [Staging].[usp_Process_DataGeneration];
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