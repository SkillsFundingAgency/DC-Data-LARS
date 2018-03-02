CREATE PROCEDURE [Staging].[usp_Process_SupersedingFrameworks]
AS
-------------------------------------------------------------------------------------- 
--	 Example Call -  EXEC [Staging].[usp_Process_SupersedingFrameworks]
-------------------------------------------------------------------------------------- 
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_SupersedingFrameworks] AS Target
		USING (
				SELECT   [OldFworkCode]
						,[OldProgType]
						,[OldPwayCode]
						,[NewFworkCode]
						,[NewProgType]
						,[NewPwayCode]
					    ,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_SupersedingFrameworks]
			  )
		   AS Source
		   ON Target.[OldFworkCode] = Source.[OldFworkCode]
	      AND Target.[OldProgType] = Source.[OldProgType]	  
		  AND Target.[OldPwayCode] = Source.[OldPwayCode]
		  AND Target.[NewFworkCode] = Source.[NewFworkCode]
	      AND Target.[NewProgType] = Source.[NewProgType]	  
		  AND Target.[NewPwayCode] = Source.[NewPwayCode]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	   [OldFworkCode]
					  ,[OldProgType]
					  ,[OldPwayCode]
					  ,[NewFworkCode]
					  ,[NewProgType]
					  ,[NewPwayCode]
					  ,[Created_On]
					  ,[Created_By]
					  ,[Modified_On]
					  ,[Modified_By]
					)
			VALUES (	   
					 Source.[OldFworkCode]
					,Source.[OldProgType]
					,Source.[OldPwayCode]
					,Source.[NewFworkCode]
					,Source.[NewProgType]
					,Source.[NewPwayCode]
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