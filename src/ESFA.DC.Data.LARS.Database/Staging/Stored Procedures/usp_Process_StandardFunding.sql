CREATE PROCEDURE [Staging].[usp_Process_StandardFunding]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_StandardFunding] AS Target
		USING (
				SELECT   [StandardCode]
					    ,[FundingCategory]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
					    ,[BandNumber]
					    ,[CoreGovContributionCap]
					    ,[1618Incentive]
					    ,[SmallBusinessIncentive]
					    ,[AchievementIncentive]
					    ,[FundableWithoutEmployer]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_StandardFunding]
			  )
			  AS Source 
		    ON Target.[StandardCode] = Source.[StandardCode]
		   AND Target.[FundingCategory] = Source.[FundingCategory]
		   AND Target.[EffectiveFrom] = Source.[EffectiveFrom]
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveTo]
							,Target.[BandNumber]
							,Target.[CoreGovContributionCap]
							,Target.[1618Incentive]
							,Target.[SmallBusinessIncentive]
							,Target.[AchievementIncentive]
							,Target.[FundableWithoutEmployer]
					EXCEPT 
						SELECT 
							 Source.[EffectiveTo]
							,Source.[BandNumber]
							,Source.[CoreGovContributionCap]
							,Source.[1618Incentive]
							,Source.[SmallBusinessIncentive]
							,Source.[AchievementIncentive]
							,Source.[FundableWithoutEmployer]
					)
		  THEN
			UPDATE SET 
					 [EffectiveTo] = Source.[EffectiveTo] 
					,[BandNumber] = Source.[BandNumber]
					,[CoreGovContributionCap] = Source.[CoreGovContributionCap]
					,[1618Incentive] = Source.[1618Incentive]
					,[SmallBusinessIncentive] = Source.[SmallBusinessIncentive]		
					,[AchievementIncentive] = Source.[AchievementIncentive]			
					,[FundableWithoutEmployer] = Source.[FundableWithoutEmployer]				
					,[Modified_By] = Source.[Modified_By]
					,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	     [StandardCode]
						,[FundingCategory]
						,[EffectiveFrom]
						,[EffectiveTo]
						,[BandNumber]
						,[CoreGovContributionCap]
						,[1618Incentive]
						,[SmallBusinessIncentive]
						,[AchievementIncentive]
						,[FundableWithoutEmployer]
						,[Created_On]
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
			VALUES (     Source.[StandardCode]
						,Source.[FundingCategory]
						,Source.[EffectiveFrom]
						,Source.[EffectiveTo]
						,Source.[BandNumber]
						,Source.[CoreGovContributionCap]
						,Source.[1618Incentive]
						,Source.[SmallBusinessIncentive]
						,Source.[AchievementIncentive]
						,Source.[FundableWithoutEmployer]
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