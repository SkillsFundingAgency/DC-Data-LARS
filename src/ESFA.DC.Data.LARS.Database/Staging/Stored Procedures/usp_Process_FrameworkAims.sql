CREATE PROCEDURE [Staging].[usp_Process_FrameworkAims]
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		
		MERGE INTO [Core].[LARS_FrameworkAims] AS Target
		USING (
				SELECT   [FworkCode]
					    ,[ProgType]
					    ,[PwayCode]
					    ,[LearnAimRef]
					    ,[FrameworkComponentType]
					    ,[EffectiveFrom]
					    ,[EffectiveTo]
					    ,[Created_On]
					    ,[Created_By]
					    ,[Modified_On]
					    ,[Modified_By]
				  FROM [Staging].[LARS_FrameworkAims]
			  )
			  AS Source 
		   ON Target.[FworkCode] = Source.[FworkCode]
	      AND Target.[ProgType] = Source.[ProgType]	  
		  AND Target.[PwayCode] = Source.[PwayCode]
		  AND Target.[LearnAimRef] = Source.[LearnAimRef]
		  AND CONVERT(DATETIME,Target.[EffectiveFrom]) = CONVERT(DATETIME,Source.[EffectiveFrom])
		WHEN MATCHED 
				AND EXISTS 
					(	SELECT 
							 Target.[FrameworkComponentType]
							,Target.[EffectiveTo]
					EXCEPT 
						SELECT 
							 Source.[FrameworkComponentType]
							,Source.[EffectiveTo]
					)
		  THEN
			UPDATE SET [FrameworkComponentType] = Source.[FrameworkComponentType]
					  ,[EffectiveTo] = Source.[EffectiveTo]
					  ,[Modified_By] = Source.[Modified_By]
					  ,[Modified_On] = Source.[Modified_On]
		WHEN NOT MATCHED BY TARGET THEN
		INSERT (	   [FworkCode]
					  ,[ProgType]
					  ,[PwayCode]
					  ,[LearnAimRef]
					  ,[FrameworkComponentType]
					  ,[EffectiveFrom]
					  ,[EffectiveTo]
					  ,[Created_On]
					  ,[Created_By]
					  ,[Modified_On]
					  ,[Modified_By]
					)
			VALUES (	   Source.[FworkCode]
						  ,Source.[ProgType]
						  ,Source.[PwayCode]
						  ,Source.[LearnAimRef]
						  ,Source.[FrameworkComponentType]
						  ,Source.[EffectiveFrom]
						  ,Source.[EffectiveTo]
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