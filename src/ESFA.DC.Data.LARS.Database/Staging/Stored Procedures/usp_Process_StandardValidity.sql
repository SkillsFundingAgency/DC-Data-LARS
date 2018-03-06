CREATE PROCEDURE [Staging].[usp_Process_StandardValidity]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_StandardValidity] AS Target
		USING (
				SELECT   [StandardCode]
					    ,[ValidityCategory]
					    ,[StartDate]
					    ,[LastNewStartDate]
					    ,[EndDate]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_StandardValidity]
			  )
			  AS Source 
		    ON Target.[StandardCode] = Source.[StandardCode]
		   AND Target.[ValidityCategory] = Source.[ValidityCategory]
		   AND Target.[StartDate] = Source.[StartDate]
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[LastNewStartDate]
							,Target.[EndDate]
					EXCEPT 
						SELECT 
							 Source.[LastNewStartDate]
							,Source.[EndDate]
					)
		  THEN
			UPDATE SET 
					 [StartDate] = Source.[StartDate] 
					,[EndDate] = Source.[EndDate]		
					,[Modified_By] = Source.[Modified_By]
					,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	     [StandardCode]
						,[ValidityCategory]
						,[StartDate]
						,[LastNewStartDate]
						,[EndDate]
						,[Created_On]
						,[Created_By]
						,[Modified_On]
						,[Modified_By]
					)
			VALUES (     Source.[StandardCode]
						,Source.[ValidityCategory]
						,Source.[StartDate]
						,Source.[LastNewStartDate]
						,Source.[EndDate]
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