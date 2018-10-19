CREATE PROCEDURE [Staging].[usp_Process_TBStandardLookup]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [dbo].[TBStandardLookup] AS Target
		USING (
				SELECT   [StandardNumber]
					    ,[StandardDesc]
					    ,[Sector]
					    ,[Status]
					    ,[CoreGovContCap]
					    ,[YoungAppIncentive]
					    ,[SmallBusIncentive]
					    ,[AchIncentive]
					    ,[ValuesEffectiveFrom]
					    ,[ValuesEffectiveTo]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[TBStandardLookup]
			  )
			  AS Source 
		     ON Target.[StandardNumber] = Source.[StandardNumber]
			AND Target.[ValuesEffectiveFrom] = Source.[ValuesEffectiveFrom]
			WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[StandardDesc]
							,Target.[Sector]
							,Target.[Status]
							,Target.[CoreGovContCap]
							,Target.[YoungAppIncentive]
							,Target.[SmallBusIncentive]
							,Target.[AchIncentive]
							,Target.[ValuesEffectiveTo]
					EXCEPT 
						SELECT 
							 Source.[StandardDesc]
							,Source.[Sector]
							,Source.[Status]
							,Source.[CoreGovContCap]
							,Source.[YoungAppIncentive]
							,Source.[SmallBusIncentive]
							,Source.[AchIncentive]
							,Source.[ValuesEffectiveTo]

					)
		  THEN
			UPDATE SET   [StandardDesc] = Source.[StandardDesc]
						,[Sector] = Source.[Sector]
						,[Status] = Source.[Status]
						,[CoreGovContCap] = Source.[CoreGovContCap]
						,[YoungAppIncentive] = Source.[YoungAppIncentive]
						,[SmallBusIncentive] = Source.[SmallBusIncentive]
						,[AchIncentive] = Source.[AchIncentive]
						,[ValuesEffectiveTo] = Source.[ValuesEffectiveTo]
						,[Modified_By] = Source.[Modified_By]
						,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (     [StandardNumber]
					,[StandardDesc]
					,[Sector]
					,[Status]
					,[CoreGovContCap]
					,[YoungAppIncentive]
					,[SmallBusIncentive]
					,[AchIncentive]
					,[ValuesEffectiveTo]
					,[ValuesEffectiveFrom]
					,[Created_On]
					,[Created_By]
					,[Modified_On]
					,[Modified_By]
					)
			VALUES ( Source.[StandardNumber]
					,Source.[StandardDesc]
					,Source.[Sector]
					,Source.[Status]
					,Source.[CoreGovContCap]
					,Source.[YoungAppIncentive]
					,Source.[SmallBusIncentive]
					,Source.[AchIncentive]
					,Source.[ValuesEffectiveTo]
					,Source.[ValuesEffectiveFrom]
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