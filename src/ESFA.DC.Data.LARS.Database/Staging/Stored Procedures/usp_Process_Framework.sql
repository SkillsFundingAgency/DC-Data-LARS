CREATE PROCEDURE [Staging].[usp_Process_Framework]
AS
-------------------------------------------------------------------------------------- 
--	 Example Call -  EXEC [Staging].[usp_Process_Framework]
-------------------------------------------------------------------------------------- 
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_Framework] AS Target
		USING (
				SELECT   [FworkCode]
						,[ProgType]
						,[PwayCode]
						,[PathwayName]
						,[EffectiveFrom]
						,[EffectiveTo]
						,[SectorSubjectAreaTier1]
						,[SectorSubjectAreaTier2]
						,[DataSource]
						,[NASTitle]
						,[ImplementDate]
						,[IssuingAuthorityTitle]
						,[IssuingAuthority]
						,[DataReceivedDate]
						,[CurrentVersion]
						,[MI_FullLevel2]
						,[MI_FullLevel2Percent]
						,[MI_FullLevel3]
						,[MI_FullLevel3Percent]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_Framework]
			  )
			  AS Source 
		   ON Target.[FworkCode] = Source.[FworkCode]
	      AND Target.[ProgType] = Source.[ProgType]	  
		  AND Target.[PwayCode] = Source.[PwayCode]
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[PathwayName]
							,Target.[EffectiveFrom]
							,Target.[EffectiveTo]
							,Target.[SectorSubjectAreaTier1]
							,Target.[SectorSubjectAreaTier2]
							,Target.[DataSource]
							,Target.[NASTitle]
							,Target.[ImplementDate]
							,Target.[IssuingAuthorityTitle]
							,Target.[IssuingAuthority]
							,Target.[DataReceivedDate]
							,Target.[CurrentVersion]
					EXCEPT 
						SELECT 
							 Source.[PathwayName]
							,Source.[EffectiveFrom]
							,Source.[EffectiveTo]
							,Source.[SectorSubjectAreaTier1]
							,Source.[SectorSubjectAreaTier2]
							,Source.[DataSource]
							,Source.[NASTitle]
							,Source.[ImplementDate]
							,Source.[IssuingAuthorityTitle]
							,Source.[IssuingAuthority]
							,Source.[DataReceivedDate]
							,Source.[CurrentVersion]
					)
		  THEN
			UPDATE SET 
					 [PathwayName] = Source.[PathwayName]
					,[EffectiveFrom] = Source.[EffectiveFrom]
					,[EffectiveTo] = Source.[EffectiveTo]
					,[SectorSubjectAreaTier1] = Source.[SectorSubjectAreaTier1]
					,[SectorSubjectAreaTier2] = Source.[SectorSubjectAreaTier2]
					,[DataSource] = Source.[DataSource]
					,[NASTitle] = Source.[NASTitle]
					,[ImplementDate] = Source.[ImplementDate]
					,[IssuingAuthorityTitle] = Source.[IssuingAuthorityTitle]
					,[IssuingAuthority] = Source.[IssuingAuthority]
					,[DataReceivedDate] = Source.[DataReceivedDate]
					,[CurrentVersion] = Source.[CurrentVersion]
					,[MI_FullLevel2] = Source.[MI_FullLevel2]					
					,[MI_FullLevel2Percent] = Source.[MI_FullLevel2Percent]
					,[MI_FullLevel3] = Source.[MI_FullLevel3]
					,[MI_FullLevel3Percent] = Source.[MI_FullLevel3Percent]
					,[Modified_By] = Source.[Modified_By]
					,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	     [FworkCode]
						,[ProgType]
						,[PwayCode]
						,[PathwayName]
						,[EffectiveFrom]
						,[EffectiveTo]
						,[SectorSubjectAreaTier1]
						,[SectorSubjectAreaTier2]
						,[DataSource]
						,[NASTitle]
						,[ImplementDate]
						,[IssuingAuthorityTitle]
						,[IssuingAuthority]
						,[DataReceivedDate]
						,[CurrentVersion]
						,[MI_FullLevel2]
						,[MI_FullLevel2Percent]
						,[MI_FullLevel3]
						,[MI_FullLevel3Percent]
						,[Created_On]
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
			VALUES (     Source.[FworkCode]
						,Source.[ProgType]
						,Source.[PwayCode]
						,Source.[PathwayName]
						,Source.[EffectiveFrom]
						,Source.[EffectiveTo]
						,Source.[SectorSubjectAreaTier1]
						,Source.[SectorSubjectAreaTier2]
						,Source.[DataSource]
						,Source.[NASTitle]
						,Source.[ImplementDate]
						,Source.[IssuingAuthorityTitle]
						,Source.[IssuingAuthority]
						,Source.[DataReceivedDate]
						,Source.[CurrentVersion]
						,Source.[MI_FullLevel2]
						,Source.[MI_FullLevel2Percent]
						,Source.[MI_FullLevel3]
						,Source.[MI_FullLevel3Percent]
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