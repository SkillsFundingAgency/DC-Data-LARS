CREATE PROCEDURE [Staging].[usp_Process_Standard]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_Standard] AS Target
		USING (
				SELECT   [StandardCode]
					    ,[Version]
					    ,[StandardName]
					    ,[StandardSectorCode]
					    ,[NotionalEndLevel]
					    ,[EffectiveFrom]
					    ,[LastDateStarts]
					    ,[EffectiveTo]
					    ,[URLLink]
					    ,[SectorSubjectAreaTier1]
					    ,[SectorSubjectAreaTier2]	
					    ,[IntegratedDegreeStandard]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_Standard]
			  )
			  AS Source 
		   ON Target.[StandardCode] = Source.[StandardCode]
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[StandardCode]
							,Target.[Version]
							,Target.[StandardName]
							,Target.[StandardSectorCode]
							,Target.[NotionalEndLevel]
							,Target.[EffectiveFrom]
							,Target.[LastDateStarts]
							,Target.[EffectiveTo]
							,Target.[URLLink]
							,Target.[SectorSubjectAreaTier1]
							,Target.[SectorSubjectAreaTier2]
							,Target.[IntegratedDegreeStandard]
					EXCEPT 
						SELECT 
							 Source.[StandardCode]
							,Source.[Version]
							,Source.[StandardName]
							,Source.[StandardSectorCode]
							,Source.[NotionalEndLevel]
							,Source.[EffectiveFrom]
							,Source.[LastDateStarts]
							,Source.[EffectiveTo]
							,Source.[URLLink]
							,Source.[SectorSubjectAreaTier1]
							,Source.[SectorSubjectAreaTier2]
						    ,Source.[IntegratedDegreeStandard]
					)
		  THEN
			UPDATE SET 
					 [Version] = Source.[Version]
					,[StandardName] = Source.[StandardName]
					,[StandardSectorCode] = Source.[StandardSectorCode]
					,[NotionalEndLevel] = Source.[NotionalEndLevel]
					,[EffectiveFrom] = Source.[EffectiveFrom]
					,[LastDateStarts] = Source.[LastDateStarts]
					,[EffectiveTo] = Source.[EffectiveTo]
					,[URLLink] = Source.[URLLink]
					,[SectorSubjectAreaTier1] = Source.[SectorSubjectAreaTier1]
					,[SectorSubjectAreaTier2] = Source.[SectorSubjectAreaTier2]
					,[IntegratedDegreeStandard] = Source.[IntegratedDegreeStandard]					
					,[Modified_By] = Source.[Modified_By]
					,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	     [StandardCode]
						,[Version]
						,[StandardName]
						,[StandardSectorCode]
						,[NotionalEndLevel]
						,[EffectiveFrom]
						,[LastDateStarts]
						,[EffectiveTo]
						,[URLLink]
						,[SectorSubjectAreaTier1]
						,[SectorSubjectAreaTier2]
						,[IntegratedDegreeStandard]
						,[Created_On]
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
			VALUES (     Source.[StandardCode]
						,Source.[Version]
						,Source.[StandardName]
						,Source.[StandardSectorCode]
						,Source.[NotionalEndLevel]
						,Source.[EffectiveFrom]
						,Source.[LastDateStarts]
						,Source.[EffectiveTo]
						,Source.[URLLink]
						,Source.[SectorSubjectAreaTier1]
						,Source.[SectorSubjectAreaTier2]
						,Source.[IntegratedDegreeStandard]
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