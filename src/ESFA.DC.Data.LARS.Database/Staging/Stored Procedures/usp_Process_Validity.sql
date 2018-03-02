CREATE PROCEDURE [Staging].[usp_Process_Validity]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_Validity] AS Target
		USING (
				SELECT   [LearnAimRef]
					    ,[ValidityCategory]
					    ,[StartDate]
				   	    ,[LastNewStartDate]
					    ,[EndDate]
						,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_Validity]
			  )
			  AS Source
		    ON Target.[LearnAimRef] = Source.[LearnAimRef]
	      AND Target.[ValidityCategory] = Source.[ValidityCategory]
		  AND CONVERT(DATE,Target.[StartDate]) = Source.[StartDate]
		  WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[EndDate]
							,Target.[LastNewStartDate]
					EXCEPT 
						SELECT 
							 Source.[EndDate]
							,Source.[LastNewStartDate]
					)
		  THEN
			UPDATE SET [EndDate] = Source.[EndDate]
					  ,[LastNewStartDate] = Source.[LastNewStartDate]
					  ,[Modified_By] = Source.[Modified_By]
					  ,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
			INSERT (   [LearnAimRef]
					  ,[ValidityCategory]
					  ,[StartDate]
					  ,[LastNewStartDate]
					  ,[EndDate]
					  ,[Created_On]
					  ,[Created_By]
					  ,[Modified_On]
					  ,[Modified_By]
					)
			VALUES (	 Source.[LearnAimRef]
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