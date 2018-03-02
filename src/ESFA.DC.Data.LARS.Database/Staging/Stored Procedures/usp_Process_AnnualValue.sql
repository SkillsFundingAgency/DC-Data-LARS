CREATE PROCEDURE [Staging].[usp_Process_AnnualValue]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_AnnualValue] AS Target
		USING (
				SELECT   [LearnAimRef]
						,[EffectiveFrom]
						,[EffectiveTo]
						,[BasicSkills]
						,[BasicSkillsBroadType]
						,[BasicSkillsType]
						,[BasicSkillsParticipation]
						,[FullLevel2EntitlementCategory]
						,[FullLevel2Percent]
						,[FullLevel3EntitlementCategory]
						,[FullLevel3Percent]
						,[MI_FullLevel2]
						,[MI_FullLevel2Percent]
						,[MI_FullLevel3]
						,[MI_FullLevel3Percent]						
						,[OfQualValid19Plus]
						,[SfaApprovalStatus]
						,[UKCESSector]
						,[UKCESSubSector]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_AnnualValue]
			  )
			  AS Source 
		    ON Target.[LearnAimRef] = Source.[LearnAimRef]
	      AND Target.[EffectiveFrom] = Source.[EffectiveFrom]	
			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveTo]
							,Target.[BasicSkills]
							,Target.[BasicSkillsType]
							,Target.[BasicSkillsBroadType]
							,Target.[FullLevel2EntitlementCategory]
							,Target.[FullLevel2Percent]
							,Target.[FullLevel3EntitlementCategory]
							,Target.[FullLevel3Percent]
							,Target.[MI_FullLevel2]
							,Target.[MI_FullLevel2Percent]
							,Target.[MI_FullLevel3]
							,Target.[MI_FullLevel3Percent]
							,Target.[OfQualValid19Plus]
							,Target.[SfaApprovalStatus]
							,Target.[UKCESSector]
							,Target.[UKCESSubSector]
					EXCEPT 
						SELECT 
							 Source.[EffectiveTo]
							,Source.[BasicSkills]
							,Source.[BasicSkillsType]
							,Source.[BasicSkillsBroadType]
							,Source.[FullLevel2EntitlementCategory]
							,Source.[FullLevel2Percent]
							,Source.[FullLevel3EntitlementCategory]
							,Source.[FullLevel3Percent]
							,Source.[MI_FullLevel2]
							,Source.[MI_FullLevel2Percent]
							,Source.[MI_FullLevel3]
							,Source.[MI_FullLevel3Percent]
							,Source.[OfQualValid19Plus]
							,Source.[SfaApprovalStatus]
							,Source.[UKCESSector]
							,Source.[UKCESSubSector]
					)
		  THEN
			UPDATE SET   [EffectiveTo] = Source.[EffectiveTo]
						,[BasicSkills] = Source.[BasicSkills]
						,[BasicSkillsBroadType] = Source.[BasicSkillsBroadType]
						,[BasicSkillsType] = Source.[BasicSkillsType]
						,[BasicSkillsParticipation] = Source.[BasicSkillsParticipation]
						,[FullLevel2EntitlementCategory] = Source.[FullLevel2EntitlementCategory]
						,[FullLevel2Percent] = Source.[FullLevel2Percent]
						,[FullLevel3EntitlementCategory] = Source.[FullLevel3EntitlementCategory]
						,[FullLevel3Percent] = Source.[FullLevel3Percent]
						,[MI_FullLevel2] = Source.[MI_FullLevel2]
						,[MI_FullLevel2Percent] = Source.[MI_FullLevel2Percent]
						,[MI_FullLevel3] = Source.[MI_FullLevel3]
						,[MI_FullLevel3Percent] = Source.[MI_FullLevel3Percent]
						,[OfQualValid19Plus] = Source.[OfQualValid19Plus]
						,[SfaApprovalStatus] = Source.[SfaApprovalStatus]
						,[UKCESSector] = Source.[UKCESSector]
						,[UKCESSubSector] = Source.[UKCESSubSector]
						,[Modified_By] = Source.[Modified_By]
						,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (     [LearnAimRef]
					,[EffectiveFrom]
					,[EffectiveTo]
					,[BasicSkills]
					,[BasicSkillsBroadType]
					,[BasicSkillsType]
					,[BasicSkillsParticipation]
					,[FullLevel2EntitlementCategory]
					,[FullLevel2Percent]
					,[FullLevel3EntitlementCategory]
					,[FullLevel3Percent]
					,[MI_FullLevel2]
					,[MI_FullLevel2Percent]
					,[MI_FullLevel3]
					,[MI_FullLevel3Percent]
					,[OfQualValid19Plus]
					,[SfaApprovalStatus]
					,[UKCESSector]
					,[UKCESSubSector]
					,[Created_On]
					,[Created_By]
					,[Modified_On]
					,[Modified_By]
					)
			VALUES ( Source.[LearnAimRef]
					,Source.[EffectiveFrom]
					,Source.[EffectiveTo]
					,Source.[BasicSkills]
					,Source.[BasicSkillsBroadType]
					,Source.[BasicSkillsType]
					,Source.[BasicSkillsParticipation]
					,Source.[FullLevel2EntitlementCategory]
					,Source.[FullLevel2Percent]
					,Source.[FullLevel3EntitlementCategory]
					,Source.[FullLevel3Percent]
					,Source.[MI_FullLevel2]
					,Source.[MI_FullLevel2Percent]
					,Source.[MI_FullLevel3]
					,Source.[MI_FullLevel3Percent]
					,Source.[OfQualValid19Plus]
					,Source.[SfaApprovalStatus]
					,Source.[UKCESSector]
					,Source.[UKCESSubSector]
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