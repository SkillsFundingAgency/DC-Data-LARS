
CREATE PROCEDURE [dbo].[usp_ClearAll_CoreTables]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
				
-- Core Tables				
		DELETE FROM [Core].[LARS_AnnualValue];
		DELETE FROM [Core].[LARS_ApprenticeshipFunding];
		DELETE FROM [Core].[LARS_CareerLearningPilot];
		DELETE FROM [Core].[LARS_DataGeneration];
		DELETE FROM [Core].[LARS_FrameworkAims];
		DELETE FROM [Core].[LARS_FrameworkCmnComp];
		DELETE FROM [Core].[LARS_FrameworkMetaData];
		DELETE FROM [Core].[LARS_Framework];
		DELETE FROM [Core].[LARS_Funding];
		DELETE FROM [Core].[LARS_LearningDeliveryCategory];
		DELETE FROM [Core].[LARS_Section96];
		DELETE FROM [Core].[LARS_StandardAims];
		DELETE FROM [Core].[LARS_StandardCommonComponent];
		DELETE FROM [Core].[LARS_StandardFunding];
		DELETE FROM [Core].[LARS_StandardMetaData];
		DELETE FROM [Core].[LARS_StandardPdfLink];
		DELETE FROM [Core].[LARS_StandardValidity];
		DELETE FROM [Core].[LARS_Standard];
		DELETE FROM [Core].[LARS_SupersedingAims];
		DELETE FROM [Core].[LARS_SupersedingFrameworks];
		DELETE FROM [Core].[LARS_UnitQualificationRelationship];
		DELETE FROM [Core].[LARS_Validity];
		DELETE FROM [Core].[LARS_Version];
		DELETE FROM [Core].[LARS_LearningDelivery];

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
