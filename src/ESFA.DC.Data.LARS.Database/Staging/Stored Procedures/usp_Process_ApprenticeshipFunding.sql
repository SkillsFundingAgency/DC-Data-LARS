CREATE PROCEDURE [Staging].[usp_Process_ApprenticeshipFunding]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_ApprenticeshipFunding] AS Target
		USING (
				SELECT   [ApprenticeshipType]
					    ,[ApprenticeshipCode]	
					    ,[ProgType]				
					    ,[PwayCode]				
					    ,[FundingCategory]		
					    ,[EffectiveFrom]			
					    ,[EffectiveTo]			
					    ,[BandNumber]			
					    ,[CoreGovContributionCap]
					    ,[1618Incentive]			
					    ,[1618ProviderAdditionalPayment]
					    ,[1618EmployerAdditionalPayment]
					    ,[1618FrameworkUplift] 	
					    ,[Duration]		
					    ,[ReservedValue2]		
					    ,[ReservedValue3]		
					    ,[MaxEmployerLevyCap]	
					    ,[FundableWithoutEmployer]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_ApprenticeshipFunding]
			  )
			  AS Source 
		     ON Target.[ApprenticeshipType] = Source.[ApprenticeshipType]	
	        AND Target.[ApprenticeshipCode] = Source.[ApprenticeshipCode]	  
		    AND Target.[ProgType]		    = Source.[ProgType]			
		    AND Target.[PwayCode]		    = Source.[PwayCode]			
		    AND Target.[FundingCategory]	= Source.[FundingCategory]	
		    AND Target.[EffectiveFrom]	    = Source.[EffectiveFrom]		
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EffectiveTo]			
							,Target.[BandNumber]			
							,Target.[CoreGovContributionCap]
							,Target.[1618Incentive]			
							,Target.[1618ProviderAdditionalPayment]
							,Target.[1618EmployerAdditionalPayment]
							,Target.[1618FrameworkUplift] 	
							,Target.[MaxEmployerLevyCap]	
							,Target.[FundableWithoutEmployer]
							,Target.[Duration]		
							,Target.[ReservedValue2]	
							,Target.[ReservedValue3]		
					EXCEPT 
						SELECT 
							 Source.[EffectiveTo]			
							,Source.[BandNumber]			
							,Source.[CoreGovContributionCap]
							,Source.[1618Incentive]			
							,Source.[1618ProviderAdditionalPayment]
							,Source.[1618EmployerAdditionalPayment]
							,Source.[1618FrameworkUplift] 	
							,Source.[MaxEmployerLevyCap]	
							,Source.[FundableWithoutEmployer]
							,Source.[Duration]		
							,Source.[ReservedValue2]		
							,Source.[ReservedValue3]	
					)
		  THEN
			UPDATE SET 
					 [EffectiveTo] = Source.[EffectiveTo]
					,[BandNumber] = Source.[BandNumber]
					,[CoreGovContributionCap] = Source.[CoreGovContributionCap]
					,[1618Incentive] = Source.[1618Incentive]
					,[1618ProviderAdditionalPayment] = Source.[1618ProviderAdditionalPayment]
					,[1618EmployerAdditionalPayment] = Source.[1618EmployerAdditionalPayment]
					,[1618FrameworkUplift] 	 = Source.[1618FrameworkUplift]
					,[MaxEmployerLevyCap] = Source.[MaxEmployerLevyCap]
					,[FundableWithoutEmployer] = Source.[FundableWithoutEmployer]
					,[Duration] = Source.[Duration]
					,[ReservedValue2] = Source.[ReservedValue2]
					,[ReservedValue3] = Source.[ReservedValue3]					
					,[Modified_By] = Source.[Modified_By]
					,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	     [ApprenticeshipType]
						,[ApprenticeshipCode]
						,[ProgType]
						,[PwayCode]
						,[FundingCategory]
						,[EffectiveFrom]
						,[EffectiveTo]
						,[BandNumber]
						,[CoreGovContributionCap]
						,[1618Incentive]
					    ,[1618ProviderAdditionalPayment]
					    ,[1618EmployerAdditionalPayment]
					    ,[1618FrameworkUplift] 	
						,[MaxEmployerLevyCap]
						,[FundableWithoutEmployer]
						,[Duration]
						,[ReservedValue2]
						,[ReservedValue3]
						,[Created_On]
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
			VALUES (     Source.[ApprenticeshipType]
						,Source.[ApprenticeshipCode]
						,Source.[ProgType]
						,Source.[PwayCode]
						,Source.[FundingCategory]
						,Source.[EffectiveFrom]
						,Source.[EffectiveTo]
						,Source.[BandNumber]
						,Source.[CoreGovContributionCap]
						,Source.[1618Incentive]
						,Source.[1618ProviderAdditionalPayment]
						,Source.[1618EmployerAdditionalPayment]
						,Source.[1618FrameworkUplift] 	
						,Source.[MaxEmployerLevyCap]
						,Source.[FundableWithoutEmployer]
						,Source.[Duration]
						,Source.[ReservedValue2]
						,Source.[ReservedValue3]
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