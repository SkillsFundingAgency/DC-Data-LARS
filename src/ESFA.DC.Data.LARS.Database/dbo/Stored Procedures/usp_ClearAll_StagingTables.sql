
CREATE PROCEDURE [dbo].[usp_ClearAll_StagingTables]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
				
-- Staging Tables				
		TRUNCATE TABLE [Staging].[LARS_AnnualValue];
		TRUNCATE TABLE [Staging].[LARS_ApprenticeshipFunding];
		TRUNCATE TABLE [Staging].[LARS_CareerLearningPilot];
		TRUNCATE TABLE [Staging].[LARS_DataGeneration];
		TRUNCATE TABLE [Staging].[LARS_Framework];
		TRUNCATE TABLE [Staging].[LARS_FrameworkAims];
		TRUNCATE TABLE [Staging].[LARS_FrameworkCmnComp];
		TRUNCATE TABLE [Staging].[LARS_FrameworkMetaData];
		TRUNCATE TABLE [Staging].[LARS_Funding];
		TRUNCATE TABLE [Staging].[LARS_LearningDelivery];
		TRUNCATE TABLE [Staging].[LARS_LearningDeliveryCategory];
		TRUNCATE TABLE [Staging].[LARS_Section96];
		TRUNCATE TABLE [Staging].[LARS_Standard];
		TRUNCATE TABLE [Staging].[LARS_StandardAims];
		TRUNCATE TABLE [Staging].[LARS_StandardCommonComponent];
		TRUNCATE TABLE [Staging].[LARS_StandardFunding];
		TRUNCATE TABLE [Staging].[LARS_StandardMetaData];
		TRUNCATE TABLE [Staging].[LARS_StandardPdfLink];
		TRUNCATE TABLE [Staging].[LARS_StandardValidity];
		TRUNCATE TABLE [Staging].[LARS_SupersedingAims];
		TRUNCATE TABLE [Staging].[LARS_SupersedingFrameworks];
		TRUNCATE TABLE [Staging].[LARS_UnitQualificationRelationship];
		TRUNCATE TABLE [Staging].[LARS_Validity];
		TRUNCATE TABLE [Staging].[LARS_Version];
		TRUNCATE TABLE [Staging].[TBStandardLookup];
		TRUNCATE TABLE [Staging].[TBStandardLookupVersion];

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
